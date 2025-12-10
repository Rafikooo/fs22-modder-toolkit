# FS22 Modder Toolkit - Simplified Build System
# Simple interface for thesis demonstration and CI/CD

.PHONY: help check build serve site clean

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
	@echo "$(GREEN)make build$(NC)  - Build everything (XML → JSON → Stubs → Docs)"
	@echo "$(GREEN)make check$(NC)  - Verify environment (node, npm, python3)"
	@echo "$(GREEN)make serve$(NC)  - Start documentation dev server"
	@echo "$(GREEN)make site$(NC)   - Build static documentation site"
	@echo "$(GREEN)make clean$(NC)  - Clean all generated files"
	@echo ""
	@echo "$(YELLOW)Tip:$(NC) Run '$(GREEN)make check$(NC)' first to verify your environment"
	@echo "$(YELLOW)For development:$(NC) See Makefile.dev for advanced targets"
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

build: check ## Build everything (default target)
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo "$(BLUE)  Building FS22 Modder Toolkit$(NC)"
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo ""
	@# Step 1: Install npm dependencies if needed
	@if [ ! -d "dist/docs/node_modules" ]; then \
		echo "$(YELLOW)▶ Installing npm dependencies...$(NC)"; \
		cd dist/docs && npm install --silent; \
		echo "$(GREEN)✓ npm dependencies installed$(NC)"; \
		echo ""; \
	else \
		echo "$(GREEN)✓ npm dependencies already installed$(NC)"; \
		echo ""; \
	fi
	@# Step 2: Run the full pipeline (without npm install/build - Makefile handles that)
	@echo "$(YELLOW)▶ Running pipeline: XML → JSON → Stubs → Docs$(NC)"
	@echo ""
	@INSTALL_DOCS_DEPS=false BUILD_DOCS_SITE=false ./run_pipeline.sh
	@echo ""
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo "$(GREEN)✓ Build complete!$(NC)"
	@echo "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"
	@echo ""
	@echo "$(YELLOW)Generated files:$(NC)"
	@echo "  JSON:  $$(find data/json -name '*.json' 2>/dev/null | wc -l | tr -d ' ') files"
	@echo "  Stubs: $$(find data/stubs -name '*.lua' 2>/dev/null | wc -l | tr -d ' ') files"
	@echo "  Docs:  $$(find dist/docs/docs -name '*.md' 2>/dev/null | wc -l | tr -d ' ') markdown files"
	@echo ""
	@echo "$(YELLOW)Next steps:$(NC)"
	@echo "  $(GREEN)make serve$(NC)  # Start dev server with live reload"
	@echo "  $(GREEN)make site$(NC)   # Build static site for deployment"
	@echo ""

serve: ## Start documentation development server
	@echo "$(BLUE)▶ Starting Docusaurus dev server...$(NC)"
	@if [ ! -d "dist/docs/node_modules" ]; then \
		echo "$(YELLOW)  Installing npm dependencies first...$(NC)"; \
		cd dist/docs && npm install --silent; \
		echo ""; \
	fi
	@echo "$(YELLOW)  Opening http://localhost:3000$(NC)"
	@echo "$(YELLOW)  Press Ctrl+C to stop$(NC)"
	@echo ""
	@cd dist/docs && npm start

site: ## Build static documentation site (for CI/CD and deployment)
	@echo "$(BLUE)▶ Building static documentation site...$(NC)"
	@if [ ! -d "dist/docs/node_modules" ]; then \
		echo "$(YELLOW)  Installing npm dependencies first...$(NC)"; \
		cd dist/docs && npm install --silent; \
		echo ""; \
	fi
	@cd dist/docs && npm run build
	@echo ""
	@echo "$(GREEN)✓ Static site built successfully!$(NC)"
	@echo "  Output: $(BLUE)dist/docs/build/$(NC)"
	@echo ""
	@echo "$(YELLOW)To serve locally:$(NC)"
	@echo "  cd dist/docs/build && python3 -m http.server 8000"
	@echo "  Open: $(BLUE)http://localhost:8000$(NC)"
	@echo ""

clean: ## Clean all generated files
	@echo "$(BLUE)▶ Cleaning generated files...$(NC)"
	@rm -rf data/json/*
	@rm -rf data/stubs/*
	@rm -rf data/engine-signatures/*
	@rm -rf dist/docs/docs/*
	@rm -rf dist/docs/build
	@rm -rf dist/docs/.docusaurus
	@echo "$(GREEN)✓ Cleaned all generated files$(NC)"
	@echo ""
	@echo "$(YELLOW)Note:$(NC) node_modules preserved (run 'rm -rf dist/docs/node_modules' if needed)"
	@echo ""
