# FS22 Modder Toolkit - Simplified Build System
# Simple interface for thesis demonstration and CI/CD

.PHONY: help check generate docs build serve clean

.DEFAULT_GOAL := help

# Colors for output
GREEN := \033[0;32m
BLUE := \033[0;34m
YELLOW := \033[1;33m
RED := \033[0;31m
NC := \033[0m

help: ## Show available commands
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo "$(BLUE)  FS22 Modder Toolkit - Build System$(NC)"
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo ""
	@echo "$(GREEN)make build$(NC)     - Build everything (generate + docs)"
	@echo "$(GREEN)make generate$(NC)  - Run pipeline: XML → JSON → Stubs → Markdown"
	@echo "$(GREEN)make docs$(NC)      - Build static documentation site"
	@echo "$(GREEN)make serve$(NC)     - Start documentation dev server"
	@echo "$(GREEN)make check$(NC)     - Verify environment (node, npm, python3)"
	@echo "$(GREEN)make clean$(NC)     - Clean all generated files"
	@echo ""
	@echo "$(YELLOW)Tip:$(NC) Run '$(GREEN)make check$(NC)' first to verify your environment"
	@echo ""

check: ## Verify environment dependencies
	@echo "$(BLUE)▶ Checking environment...$(NC)"
	@command -v node >/dev/null 2>&1 || { echo "$(RED)✗ node not found - please install Node.js$(NC)"; exit 1; }
	@command -v npm >/dev/null 2>&1 || { echo "$(RED)✗ npm not found - please install npm$(NC)"; exit 1; }
	@command -v python3 >/dev/null 2>&1 || { echo "$(RED)✗ python3 not found - please install Python 3$(NC)"; exit 1; }
	@command -v bash >/dev/null 2>&1 || { echo "$(RED)✗ bash not found$(NC)"; exit 1; }
	@echo "$(GREEN)✓ All dependencies found$(NC)"
	@echo "  Node:    $$(node --version)"
	@echo "  npm:     $$(npm --version)"
	@echo "  Python:  $$(python3 --version | cut -d' ' -f2)"
	@echo "  Bash:    $$(bash --version | head -1 | cut -d' ' -f4)"
	@echo ""

generate: check ## Run pipeline: XML → JSON → Stubs → Markdown
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo "$(BLUE)  Generating FS22 Modder Toolkit Data$(NC)"
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo ""
	@echo "$(YELLOW)▶ Running pipeline: XML → JSON → Stubs → Markdown$(NC)"
	@echo ""
	@INSTALL_DOCS_DEPS=false BUILD_DOCS_SITE=false ./run_pipeline.sh
	@echo ""
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo "$(GREEN)✓ Generation complete!$(NC)"
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo ""
	@echo "$(YELLOW)Generated files:$(NC)"
	@echo "  JSON:  $$(find data/json -name '*.json' 2>/dev/null | wc -l | tr -d ' ') files"
	@echo "  Stubs: $$(find data/stubs -name '*.lua' 2>/dev/null | wc -l | tr -d ' ') files"
	@echo "  Docs:  $$(find docs/content -name '*.md' 2>/dev/null | wc -l | tr -d ' ') markdown files"
	@echo ""

docs: ## Build static documentation site
	@echo "$(BLUE)▶ Building documentation site...$(NC)"
	@if [ ! -d "docs/node_modules" ]; then \
		echo "$(YELLOW)  Installing npm dependencies...$(NC)"; \
		cd docs && npm install --silent; \
		echo ""; \
	fi
	@# Truncate large files that slow down Docusaurus build (>400KB)
	@echo "$(YELLOW)  Truncating large markdown files (>400KB)...$(NC)"
	@for f in $$(find docs/content -name "*.md" -size +400k); do \
		basename=$$(basename "$$f"); \
		lines=$$(wc -l < "$$f"); \
		head -2000 "$$f" > "$$f.tmp"; \
		echo "" >> "$$f.tmp"; \
		echo "---" >> "$$f.tmp"; \
		echo "" >> "$$f.tmp"; \
		echo "> **Note:** This file was truncated for build performance ($$lines lines → 2000 lines)." >> "$$f.tmp"; \
		echo "> Run \`make serve\` for full content during development." >> "$$f.tmp"; \
		mv "$$f.tmp" "$$f"; \
		echo "$(YELLOW)    Truncated: $$basename ($$lines → 2000 lines)$(NC)"; \
	done
	@cd docs && npm run build
	@# Move build output to dist/
	@rm -rf dist
	@mv docs/build dist
	@echo ""
	@echo "$(GREEN)✓ Documentation site built!$(NC)"
	@echo "  Output: $(BLUE)dist/$(NC)"
	@echo ""

build: generate docs ## Build everything (generate + docs)
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo "$(GREEN)✓ Full build complete!$(NC)"
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo ""
	@echo "$(YELLOW)Ready for deployment:$(NC)"
	@echo "  Site: $(BLUE)dist/$(NC)"
	@echo ""

serve: ## Start documentation dev server
	@echo "$(BLUE)▶ Starting Docusaurus dev server...$(NC)"
	@if [ ! -d "docs/node_modules" ]; then \
		echo "$(YELLOW)  Installing npm dependencies...$(NC)"; \
		cd docs && npm install --silent; \
		echo ""; \
	fi
	@echo "$(YELLOW)  Opening http://localhost:3000$(NC)"
	@echo "$(YELLOW)  Press Ctrl+C to stop$(NC)"
	@echo ""
	@cd docs && npm start

clean: ## Clean all generated files
	@echo "$(BLUE)▶ Cleaning generated files...$(NC)"
	@rm -rf data/json/*
	@rm -rf data/stubs/*
	@rm -rf data/engine-sigs/*
	@rm -rf docs/content/*
	@rm -rf dist
	@rm -rf docs/.docusaurus
	@echo "$(GREEN)✓ Cleaned all generated files$(NC)"
	@echo ""
	@echo "$(YELLOW)Note:$(NC) node_modules preserved (run 'rm -rf docs/node_modules' if needed)"
	@echo ""
