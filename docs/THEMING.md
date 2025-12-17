# Clever Ferret Theming System

Clever Ferret features a rich, customizable theming system designed to offer both aesthetic variety and optimal reading conditions.

## System Overview

The theming system is built on top of Jetpack Compose Material 3 and extends it with custom "Metallic" and "Architectural" concepts.

### Concepts

1.  **Unified Themes:**
    A set of curated color palettes that pair a primary color with a metallic accent (e.g., "Navy & Gold", "Emerald & Silver").

2.  **Metallic Gradients:**
    Each theme defines a metallic gradient (Base, Highlight, Shadow, Shimmer) used for UI elements like buttons, headers, and cards to give a premium feel.

3.  **Ancient Architect Themes:**
    A special category of themes inspired by Art Deco and sci-fi aesthetics. They include:
    - **Geometric Patterns:** Background patterns.
    - **Crystal Glow:** Neon-like glow effects on active elements.
    - **Metallic Shimmer:** Animated shimmer on surfaces.

## Available Themes

### Classic / Unified
- **Navy & Gold:** Classic elegance.
- **Emerald & Silver:** Nature-inspired.
- **Royal & Bronze:** Regal luxury.
- **Midnight & Amber:** Dark mode friendly.
- ...and more.

### Metallic
- **Copper & Bronze**
- **Steel & Titanium**
- **Platinum & Silver**

### Architectural (Ancient Architect)
- **Ancient Bronze:** Art Deco meets Dwarven architecture.
- **Silver Architect:** Frank Lloyd Wright inspired.
- **Obsidian Tech:** Sci-fi ancient technology.

## Usage in Code

The entry point is `UnifiedCleverFerretTheme` composable in `UnifiedThemeSystem.kt`.

```kotlin
UnifiedCleverFerretTheme(
    theme = currentTheme, // CleverFerretTheme enum
    darkTheme = isSystemInDarkTheme(),
    enableGeometricPatterns = true,
    content = { ... }
)
```

## Adding a New Theme

1.  Add a new entry to the `CleverFerretTheme` enum in `UnifiedThemeSystem.kt`.
2.  Define its configuration in `getConfig()`.
3.  Add its color mapping in `getColorSchemeForTheme()` (or `AncientArchitectTheme` mappings).
4.  Add its metallic definition in `getMetallicColorsForTheme()`.

## Reader Specific Theming

The Reader (`EnhancedEReaderScreen`) has its own localized theming override for the content area to support standard reading modes:
- **Day (White/Paper)**
- **Sepia (Warm)**
- **Night (Dark/OLED)**

These settings override the app-wide theme for the text canvas while keeping the app controls consistent with the chosen app theme.
