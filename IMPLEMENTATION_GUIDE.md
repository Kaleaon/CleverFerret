# Ancient Architect Theme - Implementation Guide

## Overview

The Ancient Architect theme is a complete UI redesign for CleverFerret that combines:
- **Art Deco**: Geometric luxury, metallic accents, stepped forms
- **Dwarven Architecture**: Stone craftsmanship, massive structures, metalwork
- **Frank Lloyd Wright**: Organic geometry, natural patterns, unit systems
- **Stargate Atlantis**: Ancient technology, glowing elements, crystalline aesthetics

---

## Quick Start

### 1. Add Theme Files to Your Project

Copy the following files to your project:

```
src/main/java/com/universalmedialibrary/ui/theme/
├── AncientArchitectTheme.kt          # Main theme system
├── AncientArchitectTypography.kt     # Typography definitions
├── AncientArchitectShapes.kt         # Geometric shapes
└── AncientArchitectPatterns.kt       # Decorative patterns

src/main/java/com/universalmedialibrary/ui/components/
├── AncientArchitectCard.kt           # Enhanced cards
├── AncientArchitectButton.kt         # Buttons and FABs
├── AncientArchitectNotification.kt   # Notifications and dialogs
└── AncientArchitectNavigationRail.kt # Navigation components
```

### 2. Apply Theme to Your App

In your main activity or app composable:

```kotlin
import com.universalmedialibrary.ui.theme.*

@Composable
fun CleverFerretApp() {
    AncientArchitectTheme(
        variant = AncientArchitectVariant.ANCIENT_BRONZE,
        enableGeometricPatterns = true,
        enableMetallicShimmer = true,
        enableCrystalGlow = true
    ) {
        // Your app content
        MainScreen()
    }
}
```

### 3. Use Enhanced Components

Replace standard Material 3 components with Ancient Architect versions:

```kotlin
// Cards
AncientArchitectCard(
    onClick = { /* action */ },
    showPattern = true,
    showCornerDecorations = true,
    enableShimmer = true
) {
    // Card content
}

// Buttons
AncientArchitectPrimaryButton(
    onClick = { /* action */ }
) {
    Text("Action")
}

// Notifications
AncientArchitectNotification(
    message = "Operation completed successfully",
    type = NotificationType.SUCCESS,
    title = "Success"
)

// Navigation
AncientArchitectNavigationRail(
    header = {
        // Header content
    }
) {
    // Navigation items
}
```

---

## Theme Variants

### Ancient Bronze (Default)
- Warm bronze and copper metallics
- Amber and cyan glows
- Best for: General use, warm aesthetic

```kotlin
AncientArchitectTheme(
    variant = AncientArchitectVariant.ANCIENT_BRONZE
) { /* content */ }
```

### Silver Architect
- Cool silver and platinum metallics
- Blue and white glows
- Best for: Professional, modern look

```kotlin
AncientArchitectTheme(
    variant = AncientArchitectVariant.SILVER_ARCHITECT
) { /* content */ }
```

### Obsidian Tech
- Dark gray metallics
- Purple and cyan glows
- Best for: High-tech, mysterious aesthetic

```kotlin
AncientArchitectTheme(
    variant = AncientArchitectVariant.OBSIDIAN_TECH
) { /* content */ }
```

---

## Component Guide

### Cards

#### Standard Card
```kotlin
AncientArchitectCard(
    modifier = Modifier.fillMaxWidth(),
    onClick = { /* action */ },
    showPattern = true,
    showCornerDecorations = true
) {
    Column(modifier = Modifier.padding(16.dp)) {
        Text("Title", style = MaterialTheme.typography.titleLarge)
        Text("Content", style = MaterialTheme.typography.bodyMedium)
    }
}
```

#### Elevated Card (with glow)
```kotlin
AncientArchitectElevatedCard(
    onClick = { /* action */ },
    showGlow = true
) {
    // Content with enhanced elevation and crystal glow
}
```

#### Outlined Card
```kotlin
AncientArchitectOutlinedCard(
    onClick = { /* action */ }
) {
    // Content with prominent border
}
```

### Buttons

#### Primary Button (Bronze metallic)
```kotlin
AncientArchitectPrimaryButton(
    onClick = { /* action */ },
    enabled = true
) {
    Icon(Icons.Default.Add, contentDescription = null)
    Spacer(Modifier.width(8.dp))
    Text("Add Item")
}
```

#### Secondary Button (Stone carved)
```kotlin
AncientArchitectSecondaryButton(
    onClick = { /* action */ }
) {
    Text("Cancel")
}
```

#### Icon Button (Hexagonal)
```kotlin
AncientArchitectIconButton(
    onClick = { /* action */ }
) {
    Icon(Icons.Default.Settings, contentDescription = "Settings")
}
```

#### Floating Action Button (Diamond)
```kotlin
AncientArchitectFloatingActionButton(
    onClick = { /* action */ }
) {
    Icon(Icons.Default.Add, contentDescription = "Add")
}
```

### Notifications

#### Notification Box
```kotlin
AncientArchitectNotification(
    message = "Your changes have been saved",
    type = NotificationType.SUCCESS,
    title = "Success",
    dismissible = true,
    onDismiss = { /* handle dismiss */ },
    action = {
        AncientArchitectTextButton(onClick = { /* undo */ }) {
            Text("UNDO")
        }
    }
)
```

#### Notification Types
- `NotificationType.INFO` - Blue sapphire glow
- `NotificationType.SUCCESS` - Green emerald glow
- `NotificationType.WARNING` - Amber energy glow
- `NotificationType.ERROR` - Ruby red glow

#### Snackbar
```kotlin
val snackbarHostState = remember { SnackbarHostState() }

SnackbarHost(
    hostState = snackbarHostState,
    snackbar = { data ->
        AncientArchitectSnackbar(
            snackbarData = data,
            type = NotificationType.INFO
        )
    }
)
```

#### Alert Dialog
```kotlin
AncientArchitectAlertDialog(
    onDismissRequest = { /* dismiss */ },
    confirmButton = {
        AncientArchitectPrimaryButton(onClick = { /* confirm */ }) {
            Text("Confirm")
        }
    },
    dismissButton = {
        AncientArchitectSecondaryButton(onClick = { /* dismiss */ }) {
            Text("Cancel")
        }
    },
    icon = {
        Icon(Icons.Default.Warning, contentDescription = null)
    },
    title = {
        Text("Confirm Action")
    },
    text = {
        Text("Are you sure you want to proceed?")
    },
    type = NotificationType.WARNING
)
```

### Navigation

#### Navigation Rail
```kotlin
var selectedIndex by remember { mutableStateOf(0) }

AncientArchitectNavigationRailWithItems(
    selectedIndex = selectedIndex,
    items = listOf(
        NavigationItem(Icons.Default.Home, "Home"),
        NavigationItem(Icons.Default.Search, "Search"),
        NavigationItem(Icons.Default.Settings, "Settings")
    ),
    onItemSelected = { index -> selectedIndex = index },
    header = {
        Icon(
            Icons.Default.Menu,
            contentDescription = "Menu",
            modifier = Modifier.padding(16.dp)
        )
    }
)
```

---

## Customization

### Accessing Theme Colors

```kotlin
@Composable
fun MyComponent() {
    val ancientColors = ancientArchitectColors()
    
    // Stone colors
    val background = ancientColors.stone.background
    val surface = ancientColors.stone.surface
    
    // Metal colors
    val primary = ancientColors.metal.primary
    val secondary = ancientColors.metal.secondary
    
    // Crystal colors
    val glow = ancientColors.crystal.primary
    
    // Accent colors
    val success = ancientColors.accent.success
}
```

### Using Geometric Patterns

```kotlin
@Composable
fun PatternedBackground() {
    Canvas(modifier = Modifier.fillMaxSize()) {
        with(AncientArchitectPatterns) {
            // Diamond grid
            drawDiamondGrid(
                color = Color.White,
                alpha = 0.1f,
                cellSize = 40f
            )
            
            // Hexagonal grid
            drawHexagonalGrid(
                color = Color.White,
                alpha = 0.05f,
                cellSize = 30f
            )
            
            // Corner decorations
            drawCornerDecorations(
                color = Color(0xFFCD7F32),
                alpha = 0.6f,
                size = 16f
            )
        }
    }
}
```

### Using Metallic Gradients

```kotlin
@Composable
fun MetallicElement() {
    Box(
        modifier = Modifier
            .size(200.dp)
            .background(
                brush = MetallicBrushes.bronzeGradient(
                    start = Offset(0f, 0f),
                    end = Offset(1000f, 1000f)
                )
            )
    )
}
```

### Custom Shapes

```kotlin
@Composable
fun CustomShapedCard() {
    Card(
        shape = AncientArchitectShapes.steppedLarge,
        modifier = Modifier.fillMaxWidth()
    ) {
        // Content
    }
}

// Available shapes:
// - steppedSmall, steppedMedium, steppedLarge
// - hexagon
// - diamond
// - beveledSmall, beveledMedium, beveledLarge
// - chevron
```

---

## Performance Optimization

### Disable Effects on Low-End Devices

```kotlin
AncientArchitectTheme(
    variant = AncientArchitectVariant.ANCIENT_BRONZE,
    enableGeometricPatterns = !isLowEndDevice(),
    enableMetallicShimmer = !isLowEndDevice(),
    enableCrystalGlow = !isLowEndDevice()
) {
    // App content
}

fun isLowEndDevice(): Boolean {
    // Implement device capability check
    return false
}
```

### Conditional Pattern Rendering

```kotlin
@Composable
fun OptimizedCard() {
    val showPatterns = geometricPatternsEnabled()
    
    AncientArchitectCard(
        showPattern = showPatterns,
        showCornerDecorations = showPatterns
    ) {
        // Content
    }
}
```

---

## Migration from Existing UI

### Step 1: Wrap App with Theme
```kotlin
// Before
MaterialTheme {
    MyApp()
}

// After
AncientArchitectTheme {
    MyApp()
}
```

### Step 2: Replace Components Gradually
```kotlin
// Before
Card(onClick = { /* action */ }) {
    // Content
}

// After
AncientArchitectCard(onClick = { /* action */ }) {
    // Content
}
```

### Step 3: Update Colors
```kotlin
// Before
val primary = MaterialTheme.colorScheme.primary

// After
val primary = ancientArchitectColors().metal.primary
```

---

## Best Practices

### 1. Use Appropriate Components
- Use `AncientArchitectCard` for content containers
- Use `AncientArchitectPrimaryButton` for main actions
- Use `AncientArchitectIconButton` for toolbar actions
- Use `AncientArchitectNotification` for user feedback

### 2. Maintain Visual Hierarchy
- Use elevation and glow for important elements
- Use metallic accents sparingly for emphasis
- Keep patterns subtle to avoid visual clutter

### 3. Ensure Accessibility
- Maintain sufficient color contrast (AAA standard)
- Provide clear focus indicators
- Support reduced motion preferences
- Test with screen readers

### 4. Optimize Performance
- Disable effects on low-end devices
- Use patterns sparingly on complex screens
- Cache gradient brushes when possible
- Limit simultaneous animations

---

## Troubleshooting

### Issue: Patterns not showing
**Solution**: Check if `enableGeometricPatterns` is true in theme

### Issue: Shimmer effect not working
**Solution**: Verify `enableMetallicShimmer` is enabled

### Issue: Colors look wrong
**Solution**: Ensure you're using `ancientArchitectColors()` instead of `MaterialTheme.colorScheme`

### Issue: Performance issues
**Solution**: Disable effects or reduce pattern complexity

---

## Examples

See the `examples/` directory for complete implementation examples:
- Media library screen
- Settings screen
- Player interface
- Notification examples

---

## Support

For questions or issues:
1. Check the design concept document (DESIGN_CONCEPT.md)
2. Review component source code for implementation details
3. Open an issue on GitHub

---

## License

This theme system is part of the CleverFerret project and follows the same license.