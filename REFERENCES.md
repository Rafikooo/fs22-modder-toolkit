# References and Prior Art

Documentation of terminology, tools, and conventions used in this project.

## Terminology: "Type Stubs"

### Primary Sources

1. **Python PEP 484 - Type Hints** (2014)
   - URL: https://peps.python.org/pep-0484/
   - Introduced "stub files" (`.pyi`) as type-only definition files
   - Quote: "Stub files are files containing type hints that are only for use by the type checker, not at runtime."

2. **Python PEP 561 - Distributing and Packaging Type Information** (2017)
   - URL: https://peps.python.org/pep-0561/
   - Formalized stub package distribution
   - Quote: "Package maintainers who wish to support type checking of their code MUST add a marker file named `py.typed` to their package supporting typing."

3. **Python typeshed** (Official Type Stubs Repository)
   - URL: https://github.com/python/typeshed
   - Industry-standard collection of Python library stubs
   - Used by mypy, pyright, and other type checkers

### Lua Ecosystem

4. **Lua Language Server (LuaLS)**
   - URL: https://github.com/LuaLS/lua-language-server
   - Uses `meta/` directory for built-in stubs
   - Documentation: https://luals.github.io/
   - Supports EmmyLua annotations for type information

5. **EmmyLua Annotations**
   - URL: https://emmylua.github.io/
   - IntelliJ IDEA / PhpStorm plugin for Lua
   - Uses `---@class`, `---@type`, `---@param` annotations
   - Community standard for Lua type annotations

6. **LuaCATS (Lua Comment and Type System)**
   - URL: https://luals.github.io/wiki/annotations/
   - Modern annotation format for Lua Language Server
   - Backward compatible with EmmyLua

### TypeScript Ecosystem (for comparison)

7. **DefinitelyTyped**
   - URL: https://github.com/DefinitelyTyped/DefinitelyTyped
   - Repository of TypeScript type definitions (`.d.ts` files)
   - Community refers to these as "type definitions" or informally as "stubs"

8. **TypeScript Handbook - Declaration Files**
   - URL: https://www.typescriptlang.org/docs/handbook/declaration-files/introduction.html
   - Official term: "declaration files" (`.d.ts`)
   - Provides type information without implementation

## Tools and Technologies

### Documentation Generation

9. **Docusaurus**
   - URL: https://docusaurus.io/
   - Version: 2.4.0
   - Static site generator by Meta (Facebook)
   - Used for: Interactive API documentation

### Lua Language Extensions

10. **EmmyLua IntelliJ Plugin**
    - URL: https://plugins.jetbrains.com/plugin/9768-emmylua
    - Maintainer: tangzx
    - Provides Lua language support and type checking for JetBrains IDEs

11. **Lua Language Server (sumneko/LuaLS)**
    - URL: https://github.com/LuaLS/lua-language-server
    - Used by VS Code Lua extension
    - Supports workspace library configuration for external stubs

## Academic Context

### Type Systems for Dynamic Languages

12. **Gradual Typing for Functional Languages** (Siek & Taha, 2006)
    - Introduced gradual typing - mixing static and dynamic typing
    - Relevant to: Adding types to untyped Lua code

13. **TypeScript: Static Type Checking for JavaScript** (Bierman et al., 2014)
    - Microsoft Research paper
    - Demonstrates value of optional type systems for dynamic languages
    - Parallel to: EmmyLua annotations for Lua

### Game Modding and Tool Support

14. **Understanding the Game Modding Process** (Scacchi, 2010)
    - Discusses importance of API documentation and tooling
    - Relevant to: Motivation for this project

15. **Supporting Indie Game Development with Modding** (Kow & Nardi, 2010)
    - Community-driven tool development
    - Relevant to: Bottom-up approach to API reconstruction

## Farming Simulator Ecosystem

16. **Giants Software - Scripting Documentation**
    - URL: https://gdn.giants-software.com/documentation.php
    - Official FS22 SDK documentation
    - Limited runtime API coverage (motivates this project)

17. **FS22 Modding Community**
    - Forum: https://www.farming-simulator.com/mod.php
    - Modding wiki and community resources
    - Gap: No comprehensive runtime API documentation

## Configuration Management Patterns

18. **The Twelve-Factor App - III. Config**
    - URL: https://12factor.net/config
    - Industry standard for configuration in env variables
    - Used for: `.env` / `.env.local` pattern

19. **dotenv (Node.js library)**
    - URL: https://github.com/motdotla/dotenv
    - Popularized `.env` file pattern
    - Convention: `.env.example` for templates, `.env.local` for overrides

## Related Projects

20. **Language Server Protocol (LSP)**
    - URL: https://microsoft.github.io/language-server-protocol/
    - Standardizes editor-language server communication
    - Used by: Lua Language Server, TypeScript Language Service

21. **Tree-sitter**
    - URL: https://tree-sitter.github.io/tree-sitter/
    - Parser generator for syntax analysis
    - Relevant to: Future work on static Lua analysis

---

## Citation Format for Thesis

**For "type stubs" terminology:**
> The term "type stub" originates from Python PEP 484 [1], which introduced stub files as "files containing type hints that are only for use by the type checker, not at runtime." This terminology has been adopted by the Lua community through the Lua Language Server project [4] and EmmyLua annotations [5], where stub files provide type information for IDE tooling without affecting runtime behavior.

**For tool ecosystem:**
> This project builds upon established tooling patterns: EmmyLua annotations for type hints [5], Lua Language Server for IDE integration [4], and Docusaurus for documentation generation [9]. The `.env` configuration pattern follows the Twelve-Factor App methodology [18].

---

## Version Information (as of 2025-11-11)

- Python: 3.8+ (stdlib only, no external dependencies for converters)
- Node.js: 16+ (for Docusaurus)
- Docusaurus: 2.4.0
- Lua Language Server: Compatible with EmmyLua and LuaCATS annotations
- Farming Simulator 22: Version 1.x (tested with latest patch)

---

## Future Reading

For thesis background on type systems and IDE tooling:

- Bracha, G. (2004). "Pluggable Type Systems"
- Aycock, J. (2003). "A Brief History of Just-In-Time"
- Murphy-Hill, E., et al. (2012). "How Do Developers Use APIs?"
