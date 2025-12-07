#!/usr/bin/env bash
set -euo pipefail

# FS22 Modder Toolkit - Full Pipeline Orchestrator
# Runs: XML → JSON → Lua stubs → Docusaurus docs

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Load configuration (.env.local has priority over .env.example)
if [[ -f ".env.local" ]]; then
    CONFIG_FILE=".env.local"
elif [[ -f ".env.example" ]]; then
    CONFIG_FILE=".env.example"
    echo -e "${YELLOW}⚠ Using .env.example (create .env.local for custom config)${NC}"
else
    echo -e "${RED}✗ Config file not found: .env.example${NC}"
    echo "  Run: cp .env.example .env.local"
    exit 1
fi

# Save command-line/Makefile overrides BEFORE sourcing config
# These take priority over .env.local values
_CLI_EXPORT_GLOBAL="${EXPORT_GLOBAL:-}"
_CLI_EXPORT_DEPTH="${EXPORT_DEPTH:-}"
_CLI_EXPORT_SESSION="${EXPORT_SESSION:-}"
_CLI_RUN_JSON="${RUN_JSON_CONVERSION:-}"
_CLI_RUN_STUBS="${RUN_LUA_STUBS:-}"
_CLI_RUN_DOCS="${RUN_DOCS_GENERATION:-}"

source "$CONFIG_FILE"

# Restore command-line overrides (they take priority over config file)
[[ -n "$_CLI_EXPORT_GLOBAL" ]] && EXPORT_GLOBAL="$_CLI_EXPORT_GLOBAL"
[[ -n "$_CLI_EXPORT_DEPTH" ]] && EXPORT_DEPTH="$_CLI_EXPORT_DEPTH"
[[ -n "$_CLI_EXPORT_SESSION" ]] && EXPORT_SESSION="$_CLI_EXPORT_SESSION"
[[ -n "$_CLI_RUN_JSON" ]] && RUN_JSON_CONVERSION="$_CLI_RUN_JSON"
[[ -n "$_CLI_RUN_STUBS" ]] && RUN_LUA_STUBS="$_CLI_RUN_STUBS"
[[ -n "$_CLI_RUN_DOCS" ]] && RUN_DOCS_GENERATION="$_CLI_RUN_DOCS"
log_step() {
    echo -e "\n${BLUE}▶ $1${NC}"
}

log_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

log_error() {
    echo -e "${RED}✗ $1${NC}"
}

log_verbose() {
    if [[ "$VERBOSE" == "true" ]]; then
        echo "  $1"
    fi
}
check_prerequisites() {
    log_step "Checking prerequisites..."

    local missing_deps=()

    if ! command -v python3 &> /dev/null; then
        missing_deps+=("python3")
    fi

    if [[ "$INSTALL_DOCS_DEPS" == "true" ]] || [[ "$BUILD_DOCS_SITE" == "true" ]]; then
        if ! command -v node &> /dev/null; then
            missing_deps+=("node")
        fi
    fi

    if [[ ${#missing_deps[@]} -gt 0 ]]; then
        log_error "Missing dependencies: ${missing_deps[*]}"
        echo "  Install with: brew install ${missing_deps[*]}"
        exit 1
    fi

    log_success "All prerequisites met"
}
discover_exports() {
    log_step "Discovering XML exports to process..."

    if [[ ! -d "$RUNTIME_SCHEMAS_DIR" ]]; then
        log_error "Schemas directory not found: $RUNTIME_SCHEMAS_DIR"
        echo ""
        echo "The schemas directory doesn't exist yet."
        echo ""
        echo "${YELLOW}First-time setup:${NC}"
        echo "  1. Start Farming Simulator 22"
        echo "  2. Load a game (single player or multiplayer)"
        echo "  3. Open console (~) and run:"
        echo "     ${GREEN}riExportAll 3${NC}"
        echo ""
        echo "This will export all runtime globals to: $RUNTIME_SCHEMAS_DIR"
        echo "Expected output: ~240 XML files (one per global)"
        exit 1
    fi

    local xml_count=$(find "$RUNTIME_SCHEMAS_DIR" -maxdepth 1 -name "*.xml" -type f 2>/dev/null | wc -l | tr -d ' ')

    if [[ "$xml_count" -eq 0 ]]; then
        log_error "No XML exports found in $RUNTIME_SCHEMAS_DIR"
        echo ""
        echo "The schemas directory is empty."
        echo ""
        echo "${YELLOW}To generate runtime exports:${NC}"
        echo "  1. Start Farming Simulator 22"
        echo "  2. Load a game (single player or multiplayer)"
        echo "  3. Open console (~) and run:"
        echo "     ${GREEN}riExportAll 3${NC}"
        echo ""
        echo "This will generate XML files for all runtime globals."
        echo "Expected: ~240 files like g_currentMission.xml, g_gameSettings.xml, etc."
        echo ""
        echo "${YELLOW}Quick test (single global):${NC}"
        echo "  In FS22 console:"
        echo "     ${GREEN}riExport g_currentMission 3${NC}"
        exit 1
    fi

    log_verbose "Found $xml_count XML files in schemas directory"

    EXPORT_LIST=()

    if [[ -n "$EXPORT_GLOBAL" ]]; then
        GLOBALS_TO_PROCESS="$EXPORT_GLOBAL"
        log_verbose "Processing single global: $EXPORT_GLOBAL"
    else
        GLOBALS_TO_PROCESS=$(ls "$RUNTIME_SCHEMAS_DIR"/*.xml 2>/dev/null | xargs -n1 basename | sed 's/\.xml$//' | sort -u)
        if [[ -z "$GLOBALS_TO_PROCESS" ]]; then
            log_error "Failed to parse XML filenames"
            exit 1
        fi
        log_verbose "Auto-discovered $(echo "$GLOBALS_TO_PROCESS" | wc -l | tr -d ' ') globals"
    fi

    for global in $GLOBALS_TO_PROCESS; do
        local xml_file="$RUNTIME_SCHEMAS_DIR/${global}.xml"
        if [[ -f "$xml_file" ]]; then
            EXPORT_LIST+=("$global")
        else
            log_verbose "Skipping missing: ${global}.xml"
        fi
    done

    if [[ ${#EXPORT_LIST[@]} -eq 0 ]]; then
        log_error "No valid exports found matching criteria"
        echo ""
        if [[ -n "$EXPORT_GLOBAL" ]]; then
            echo "Requested global: $EXPORT_GLOBAL"
            echo "File expected: $RUNTIME_SCHEMAS_DIR/${EXPORT_GLOBAL}.xml"
            echo ""
            echo "Run in FS22 console:"
            echo "  ${GREEN}riExport $EXPORT_GLOBAL 3${NC}"
        fi
        exit 1
    fi

    log_success "Found ${#EXPORT_LIST[@]} exports to process"
}

validate_xml() {
    local input_xml="$1"

    if [[ ! -r "$input_xml" ]]; then
        log_error "Cannot read XML file: $input_xml"
        return 1
    fi

    if ! head -1 "$input_xml" | grep -q '<?xml'; then
        log_error "Invalid XML file (missing XML declaration): $input_xml"
        return 1
    fi

    if ! grep -qE '<(schema|export)' "$input_xml"; then
        log_error "Invalid RuntimeInspector XML (missing <schema> or <export> root element)"
        return 1
    fi

    return 0
}

convert_to_json() {
    local global_name="$1"
    
    local input_xml="$2"

    if [[ "$RUN_JSON_CONVERSION" != "true" ]]; then
        return
    fi

    local converter="src/converters/convert_to_json.py"
    local output="$JSON_OUTPUT_DIR/${global_name}.json"

    mkdir -p "$JSON_OUTPUT_DIR"

    if ! python3 "$converter" "$input_xml" "$output" 2>&1 | grep -q "^✓"; then
        log_warning "JSON conversion failed for ${global_name}"
        return 1
    fi

    if [[ ! -f "$output" ]]; then
        log_warning "JSON output not created: ${global_name}"
        return 1
    fi

    return 0
}

convert_to_lua_stubs() {
    local global_name="$1"
    
    local input_xml="$2"

    if [[ "$RUN_LUA_STUBS" != "true" ]]; then
        return
    fi

    local converter="src/converters/convert_to_stubs.py"
    local output="$STUBS_OUTPUT_DIR/${global_name}.lua"

    mkdir -p "$STUBS_OUTPUT_DIR"

    if ! python3 "$converter" "$input_xml" "$output" 2>&1 | grep -q "^✓"; then
        log_warning "Lua stubs generation failed for ${global_name}"
        return 1
    fi

    if [[ ! -f "$output" ]]; then
        log_warning "Lua stubs output not created: ${global_name}"
        return 1
    fi

    return 0
}

generate_docs() {
    local global_name="$1"
    

    if [[ "$RUN_DOCS_GENERATION" != "true" ]]; then
        return
    fi

    local generator="src/docs-generator/generate_docs.py"
    local input_json="$JSON_OUTPUT_DIR/${global_name}.json"

    if [[ ! -f "$input_json" ]]; then
        log_verbose "Skipping docs for ${global_name} (no JSON)"
        return 1
    fi

    if ! python3 "$generator" "$input_json" "$DOCS_OUTPUT_DIR" 2>&1 | grep -q "^✓"; then
        log_warning "Documentation generation failed for ${global_name}"
        return 1
    fi

    return 0
}

install_docs_deps() {
    if [[ "$INSTALL_DOCS_DEPS" != "true" ]]; then
        log_warning "Skipping npm install (disabled in config)"
        return
    fi

    log_step "Installing Docusaurus dependencies..."

    cd "$DOCS_OUTPUT_DIR"

    if [[ -f "package-lock.json" ]]; then
        npm ci --silent
    else
        npm install --silent
    fi

    cd "$SCRIPT_DIR"

    log_success "Dependencies installed"
}

generate_stubs_index() {
    if [[ "$RUN_LUA_STUBS" != "true" ]]; then
        return
    fi

    local stub_count=$(ls -1 "$STUBS_OUTPUT_DIR"/*.lua 2>/dev/null | wc -l | tr -d ' ')
    if [[ "$stub_count" -eq "0" ]]; then
        log_verbose "No Lua stubs found, skipping index generation"
        return
    fi

    log_step "Generating categorized Lua stubs index..."

    local generator="src/converters/generate_stubs_index.py"
    local output_file="$STUBS_OUTPUT_DIR/init.lua"

    if ! python3 "$generator" "$STUBS_OUTPUT_DIR" "$output_file" 2>&1 | grep -q "^✓"; then
        log_warning "Lua stubs index generation failed"
        return 1
    fi

    log_success "Lua stubs index generated: init.lua, core.lua, constants.lua, advanced.lua"
    return 0
}

analyze_globals() {
    if [[ "$RUN_DOCS_GENERATION" != "true" ]]; then
        log_verbose "Skipping globals analysis (docs generation disabled)"
        return
    fi

    local docs_count=$(find "$DOCS_OUTPUT_DIR/docs" -name "g_*.md" 2>/dev/null | wc -l | tr -d ' ')
    if [[ "$docs_count" -eq "0" ]]; then
        log_verbose "No markdown docs found, skipping globals analysis"
        return
    fi

    local sdk_dir="fs22-data-source/scripts"
    if [[ ! -d "$sdk_dir" ]]; then
        log_warning "SDK not found at $sdk_dir, skipping globals analysis"
        return
    fi

    log_step "Analyzing globals categorization..."

    local analyzer="src/docs-generator/analyze_globals.py"

    if ! python3 "$analyzer" 2>&1 | grep -q "Results saved"; then
        log_warning "Globals analysis failed (non-critical)"
        return 1
    fi

    log_success "Globals categorization complete: data/globals-categorization.json"
    return 0
}

build_docs_site() {
    if [[ "$BUILD_DOCS_SITE" != "true" ]]; then
        log_warning "Skipping docs build (disabled in config)"
        return
    fi

    log_step "Building Docusaurus site..."

    cd "$DOCS_OUTPUT_DIR"
    npm run build --silent
    cd "$SCRIPT_DIR"

    local build_size=$(du -sh "$DOCS_OUTPUT_DIR/build" | cut -f1)
    log_success "Site built: $DOCS_OUTPUT_DIR/build/ ($build_size)"
}

serve_docs() {
    if [[ "$SERVE_DOCS_LOCALLY" != "true" ]]; then
        return
    fi

    log_step "Starting local development server..."

    echo ""
    echo "Docusaurus will open at: http://localhost:3000"
    echo "Press Ctrl+C to stop"
    echo ""

    cd "$DOCS_OUTPUT_DIR"
    npm start
}

generate_engine_signatures() {
    if [[ "$RUN_ENGINE_SIGNATURES" != "true" ]]; then
        return
    fi

    log_step "Generating engine signatures..."

    if [[ ! -f "$ENGINE_SIGS_INPUT" ]]; then
        log_warning "scriptBinding.xml not found: $ENGINE_SIGS_INPUT"
        log_verbose "Skipping engine signatures generation"
        return
    fi

    local generator="src/engine-signatures/generate_signatures.py"
    local docs_converter="src/converters/convert_engine_to_docs.py"
    mkdir -p "$(dirname "$ENGINE_SIGS_OUTPUT")"

    python3 "$generator" "$ENGINE_SIGS_INPUT" "$ENGINE_SIGS_OUTPUT"
    log_success "Engine signatures generated: $ENGINE_SIGS_OUTPUT"

    if [[ "$RUN_DOCS_GENERATION" == "true" ]]; then
        log_verbose "Converting engine functions to documentation..."
        python3 "$docs_converter" "$ENGINE_SIGS_OUTPUT" "$DOCS_OUTPUT_DIR/docs"
        log_success "Engine documentation generated"
    fi
}

print_summary() {
    local json_count="$1"
    local stubs_count="$2"
    local docs_count="$3"
    local failed_count="$4"

    echo ""
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}Pipeline completed!${NC}"
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo "Processing summary:"
    echo "  • JSON files:   $json_count generated"
    echo "  • Lua stubs:    $stubs_count generated"
    echo "  • Docs:         $docs_count generated"
    if [[ $failed_count -gt 0 ]]; then
        echo "  • Failed:       $failed_count exports"
    fi

    echo ""
    echo "Output directories:"
    [[ $json_count -gt 0 ]] && echo "  • JSON: $JSON_OUTPUT_DIR/"
    [[ $stubs_count -gt 0 ]] && echo "  • Lua stubs: $STUBS_OUTPUT_DIR/"
    [[ $docs_count -gt 0 ]] && echo "  • Docs: $DOCS_OUTPUT_DIR/docs/"

    if [[ "$BUILD_DOCS_SITE" == "true" ]]; then
        echo "  • Static site: $DOCS_OUTPUT_DIR/build/"
    fi

    if [[ "$RUN_ENGINE_SIGNATURES" == "true" ]] && [[ -f "$ENGINE_SIGS_OUTPUT" ]]; then
        echo "  • Engine signatures: $ENGINE_SIGS_OUTPUT"
    fi

    echo ""
    echo "Next steps:"

    if [[ "$BUILD_DOCS_SITE" == "true" ]]; then
        echo "  • Deploy to GitHub Pages: git push (workflow will auto-deploy)"
        echo "  • View at: https://${GITHUB_USER}.github.io/${GITHUB_REPO}/"
    elif [[ $docs_count -gt 0 ]]; then
        echo "  • Build site: npm run build (in $DOCS_OUTPUT_DIR)"
        echo "  • Or run: ./run_pipeline.sh with BUILD_DOCS_SITE=true"
    fi

    if [[ $stubs_count -gt 0 ]]; then
        echo "  • Use stubs: Copy to your mod's libs/ or .vscode/lua-libs/"
    fi
    echo ""
}

main() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}FS22 Modder Toolkit - Pipeline Runner${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    check_prerequisites
    discover_exports

    # Counters for summary
    local total_exports=${#EXPORT_LIST[@]}
    local successful_json=0
    local successful_stubs=0
    local successful_docs=0
    local failed=0

    log_step "Processing ${total_exports} exports..."

    # Process each export
    for export_pair in "${EXPORT_LIST[@]}"; do
        local global_name="$export_pair"
        
        local input_xml="$RUNTIME_SCHEMAS_DIR/${global_name}.xml"

        log_verbose "Processing: ${global_name}"

        # Validate XML
        if ! validate_xml "$input_xml"; then
            log_warning "Skipping invalid XML: ${global_name}"
            ((failed++))
            continue
        fi

        # Core pipeline (continue on individual failures)
        convert_to_json "$global_name" "$input_xml" && ((successful_json++))
        convert_to_lua_stubs "$global_name" "$input_xml" && ((successful_stubs++))
        generate_docs "$global_name" && ((successful_docs++))
    done

    log_success "Processing complete: $successful_json JSON, $successful_stubs stubs, $successful_docs docs"

    # Analyze and categorize globals (if docs were generated)
    if [[ $successful_docs -gt 0 ]]; then
        analyze_globals
    fi

    # Generate Lua stubs index (if stubs were generated)
    if [[ $successful_stubs -gt 0 ]]; then
        generate_stubs_index
    fi

    # Optional steps
    generate_engine_signatures

    # Docusaurus build steps (only if docs were generated)
    if [[ $successful_docs -gt 0 ]]; then
        install_docs_deps
        build_docs_site
    fi

    print_summary "$successful_json" "$successful_stubs" "$successful_docs" "$failed"

    # Must be last (blocking)
    serve_docs
}

# Run main
main "$@"
