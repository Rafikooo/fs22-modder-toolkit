# Changelog - FS22 Modder Toolkit

## 2025-11-12 - Documentation Categorization & Improvements

### ✓ Globals Analysis & Categorization

Przeanalizowano wszystkie 239 globals z runtime introspection i sklasyfikowano je według użycia w oficjalnym SDK (660 plików Lua).

**Utworzono 4 kategorie globals:**

1. **Core Globals (55)** - Używane w SDK, mają pola (obiekty/managery)
   - Najczęściej używane w kodzie gry
   - Rozwinięte domyślnie w dokumentacji
   - Przykład: `g_currentMission`, `g_soundManager`, `g_i18n`

2. **Constants (46)** - Używane w SDK, proste wartości (0 pól)
   - Zmienne konfiguracyjne i flagi
   - Zwinięte w dokumentacji

3. **Advanced Reference (22)** - Nieużywane w SDK, ale mają pola
   - Potencjalnie przydatne dla zaawansowanych modów
   - Zwinięte w dokumentacji

4. **Internal/System (116)** - Nieużywane w SDK, 0 pól
   - Głównie wewnętrzne zmienne silnika
   - Zwinięte w dokumentacji

### Top 10 Najczęściej Używanych Globals

| Global | Wystąpienia w SDK | Liczba pól |
|--------|-------------------|------------|
| `g_currentMission` | 1,585 | 225 |
| `g_soundManager` | 598 | 17 |
| `g_i18n` | 582 | 4 |
| `g_inputBinding` | 400 | 60 |
| `g_server` | 356 | 30 |
| `g_effectManager` | 265 | 2 |
| `g_animationManager` | 173 | 5 |
| `g_client` | 163 | 34 |
| `g_messageCenter` | 142 | 2 |
| `g_fillTypeManager` | 137 | 25 |

### Metodologia Kategoryzacji - Heurystyka

**Problem:**
Runtime introspection wyekstraktował 239 globals z działającej gry FS22. Nie wszystkie te zmienne były równie użyteczne dla modderów - część to wewnętrzne zmienne silnika, tymczasowe obiekty UI czy debugowe flagi. Potrzebna była systematyczna metoda segregacji według istotności.

**Wybrana heurystyka (2 wymiary):**

1. **Użycie w oficjalnym SDK** (660 plików Lua)
   - Zmienne używane w SDK = sprawdzone, dokumentowane, bezpieczne dla modów
   - Zmienne nieużywane = potencjalnie wewnętrzne lub eksperymentalne

2. **Liczba pól (field count)**
   - 0 pól = prosta wartość (constant, flag, primitive)
   - >0 pól = złożony obiekt (manager, system, instancja klasy)

**Macierz kategoryzacji:**

```
                  Używane w SDK      Nieużywane w SDK
Mają pola         Core Globals       Advanced Reference
                  (55 globals)       (22 globals)

Brak pól          Constants          Internal/System
                  (46 globals)       (116 globals)
```

**Implementacja:**
- Dokumentacja: sidebar z 4 kategoriami (Core expanded by default)
- Lua stubs: indeks `init.lua` + pomocnicze pliki `core.lua`, `constants.lua`, `advanced.lua`
- Obie implementacje korzystają z tego samego pliku: `data/globals-categorization.json`

### Techniczne Szczegóły

**Nowe pliki:**
- `src/docs-generator/analyze_globals.py` - Skrypt analizujący użycie globals w SDK
- `src/converters/generate_stubs_index.py` - Generator indeksu Lua stubs z kategoryzacją
- `data/globals-categorization.json` - Plik z kategoryzacją i statystykami użycia

**Zmodyfikowane pliki:**
- `src/docs-generator/generate_docs.py` - Dodano wsparcie dla kategoryzacji w sidebar
- `run_pipeline.sh` - Dodano automatyczne generowanie indeksów Lua stubs

**Struktura dokumentacji (Sidebar):**
```
- Home
- Core Globals (55) [expanded]
- Constants (46) [collapsed]
- Advanced Reference (22) [collapsed]
- Internal/System (116) [collapsed]
- Engine Functions
```

**Struktura Lua stubs:**
```
features/schema-lua-stubs/outputs/
├── init.lua              # Kompletny indeks (wszystkie 239)
├── core.lua              # Core Globals (55)
├── constants.lua         # Constants (46)
├── advanced.lua          # Advanced Reference (22)
├── g_currentMission.lua  # Poszczególne stubsy...
├── g_soundManager.lua
└── ...
```

### Poprzednie Zmiany (tej sesji)

**Documentation Display Improvements:**
- ✓ Usunięto limity wyświetlania pól (poprzednio 15 pól, 20 metod)
- ✓ Zwiększono głębokość zagnieżdżenia z 2 do 3 poziomów
- ✓ Usunięto wszystkie komunikaty "...and X more fields/methods"
- ✓ Poprawiono formatowanie Markdown (usunięto HTML tagi w listach)

**Type-Based Organization:**
- ✓ Dodano grupowanie pól według typu (Functions, Classes, Objects, Arrays, etc.)
- ✓ Sekcje rozwijalne dla każdego typu
- ✓ Statystyki pól na górze każdej strony

**Search Functionality:**
- ✓ Zintegrowano `@easyops-cn/docusaurus-search-local`
- ✓ Search index: ~1.8MB (239 globals + 56 kategorii funkcji silnika)

### Metryki

- **Przeanalizowano:** 239 globals
- **Przeszukano:** 660 plików Lua SDK
- **Wygenerowano:** 239 stron dokumentacji + 56 stron funkcji silnika
- **Czas analizy:** ~2 minuty
- **Rozmiar search index:** ~1.8 MB

### TODO / Do Weryfikacji

**Lua Stubs (wygenerowane, ale nie przetestowane):**
- [ ] Uruchomić pipeline z `RUN_LUA_STUBS=true` aby wygenerować stubsy z kategoryzacją
- [ ] Zweryfikować poprawność plików `init.lua`, `core.lua`, `constants.lua`, `advanced.lua`
- [ ] Przetestować import stubsów w IDE (VSCode + Lua Language Server)

**Dokumentacja:**
- [ ] Zaktualizować `src/docs-generator/generate_docs.py` aby generował "Farming Simulator 22 Lua API" w tytułach (obecnie zmienione tylko w `docusaurus.config.js`)
- [ ] Rozważyć dodanie informacji o kategoryzacji na stronie głównej (Home)
- [ ] Deploy na GitHub Pages po weryfikacji

**Potencjalne Ulepszenia:**
- [ ] Dodać badges z liczbą globals w każdej kategorii
- [ ] Rozważyć generowanie README.md dla katalogu stubsów z instrukcją użycia
- [ ] Dodać przykłady użycia dla top 10 najczęściej używanych globals

### Znane Problemy

- Build kończy się błędem `ENOSPC: no space left on device` podczas cachowania webpack
- Dokumentacja działa poprawnie mimo błędu cache
- Niektóre linki między globals wymagają poprawy ścieżek (../globals/ vs relatywne)

---

## Podsumowanie Sesji 2025-11-12

**Główny cel:** Uporządkowanie 239 globals według użyteczności dla modderów

**Osiągnięcia:**
1. Automatyczna kategoryzacja wszystkich globals według użycia w SDK i struktury
2. Reorganizacja dokumentacji (sidebar) - Core Globals widoczne od razu
3. Analogiczna kategoryzacja dla Lua stubs (pliki indeksowe)
4. Zmiana nazwy projektu: "Runtime API" → "Farming Simulator 22 Lua API"
5. Pełna dokumentacja metodologii w CHANGELOG

**Następne kroki:**
- Przetestować generowanie Lua stubs z kategoryzacją
- Rozważyć deploy na GitHub Pages
- Kontynuować development zgodnie z listą TODO powyżej

---

## URL Dokumentacji

**Development:** http://localhost:3000/fs22-modder-toolkit/
**Production:** https://rafikooo.github.io/fs22-modder-toolkit/ (po deploy)
