# System Filtrowania Typów - Dokumentacja

## Przegląd

System filtrowania typów pozwala na dynamiczne filtrowanie pól w dokumentacji API według ich typów.

### Dostępne typy:

- 🔧 **Functions** - Callable methods and functions
- 📦 **Objects** - Tables, class instances, and objects
- 🔤 **Primitives** - Strings, numbers, booleans, nil
- 📊 **Arrays** - Array structures with length info
- 🏛️ **Classes** - Named class types
- 🔗 **Global Refs** - References to other globals
- ❓ **Other** - Uncategorized types

## Tryby filtrowania

### ✅ Include Mode (domyślny)
- Pokazuje **tylko** wybrane typy
- Użycie: zaznacz typy które chcesz zobaczyć
- Przykład: zaznacz "Functions" aby zobaczyć tylko metody

### ❌ Exclude Mode
- Ukrywa wybrane typy, pokazuje resztę
- Użycie: przełącz checkbox "Exclude Mode", potem zaznacz typy do ukrycia
- Przykład: zaznacz "Functions" aby ukryć wszystkie metody

## Features

### 1. Multi-select
- Możesz zaznaczyć wiele typów naraz
- W Include Mode: OR logic (pokazuje wszystkie zaznaczone typy)
- W Exclude Mode: AND logic (ukrywa wszystkie zaznaczone typy)

### 2. Liczniki
- Każdy przycisk typu pokazuje liczbę pól tego typu
- Na dole: licznik aktywny pokazujący ile pól jest widocznych

### 3. Sticky Mode
- Filtr staje się sticky po scrollowaniu 200px w dół
- Zawsze dostępny podczas przeglądania długiej dokumentacji

### 4. Quick Actions
- **Clear**: Czyści wszystkie filtry (pokaże wszystkie typy)
- **Select All**: Zaznacza wszystkie typy

## Przypadki użycia

### Przykład 1: Zobacz tylko funkcje
```
1. Kliknij "🔧 Functions"
2. Wszystkie inne pola znikną
3. Łatwo znaleźć dostępne metody
```

### Przykład 2: Ukryj funkcje (zobacz tylko dane)
```
1. Przełącz checkbox "Exclude Mode"
2. Kliknij "🔧 Functions"
3. Funkcje znikną, zobaczysz tylko pola z danymi
```

### Przykład 3: Zobacz tylko prymitywy i array
```
1. Kliknij "🔤 Primitives"
2. Kliknij "📊 Arrays"
3. Zobaczysz tylko te dwa typy
```

### Przykład 4: Ukryj wszystko poza obiektami i klasami
```
1. Kliknij "Select All"
2. Przełącz "Exclude Mode"
3. Kliknij "📦 Objects" i "🏛️ Classes" aby je odznaczyć
4. Zobaczysz tylko obiekty i klasy
```

## Implementacja techniczna

### Python Generator
- `normalize_field_type()` - kategoryzuje typy do 7 głównych kategorii
- `collect_field_types()` - zlicza typy rekurencyjnie
- Frontmatter YAML - zawiera metadata z licznikami typów
- Data attributes - każde pole ma `data-field-type="<type>"`

### React Component
- `TypeFilter/index.jsx` - główny komponent filtrowania
- `TypeFilter/styles.module.css` - style z dark mode support
- Real-time filtering przez manipulację CSS `display` property

### Zalety architekturalne
1. **Zero Dependencies** - czysty React, bez zewnętrznych bibliotek
2. **Performance** - filtrowanie przez CSS (fast), nie re-render
3. **Accessible** - keyboard navigation, semantic HTML
4. **Responsive** - działa na mobile i desktop
5. **Dark Mode** - automatyczne wsparcie dla ciemnego motywu

## Rozwój

### Dodawanie nowego typu
1. Zmodyfikuj `normalize_field_type()` w `generate_docs.py`
2. Dodaj label i description w `TYPE_LABELS` i `TYPE_DESCRIPTIONS`
3. Re-generuj dokumentację

### Customizacja stylów
Edytuj `TypeFilter/styles.module.css`:
- `.typeButton` - wygląd przycisków
- `.sticky` - zachowanie sticky header
- `@media` queries - responsywność

## Przykład użycia w projekcie

```bash
# 1. Re-generuj dokumentację z nowymi features
cd features/schema-docs
python3 generate_docs.py ../schema-json/outputs/g_currentMission.json outputs

# 2. Uruchom Docusaurus
cd outputs
npm start

# 3. Otwórz http://localhost:3000
# 4. Zobaczysz TypeFilter na górze każdej strony
```

## Metryki

Dla `g_currentMission`:
- **function**: 3217 (44% wszystkich pól)
- **primitive**: 2276 (31%)
- **object**: 1574 (22%)
- **array**: 216 (3%)
- **global-ref**: 46 (0.6%)
- **class**: 42 (0.6%)
- **other**: 159 (2.2%)

**Total**: 7,530 fields

Bez filtrowania = przytłaczające  
Z filtrowaniem = łatwe w nawigacji! 🎯
