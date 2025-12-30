# CleverFerret PWA Theming Guide

## Overview
CleverFerret PWA uses a unified theming system based on Material-UI (MUI) with 12 carefully crafted dark themes designed to work consistently across the PWA and Android platforms.

## Theme System

### Location
- **Main Theme File**: `src/themes/unified-themes.ts`
- **Theme Store**: `src/store/app-store.ts` (manages selected theme)

### Available Themes
The application includes 12 dark themes:

1. **Navy & Gold** - Classic Plex-inspired theme with deep navy and metallic gold
2. **Emerald & Silver** - Nature-inspired with deep emerald and bright silver
3. **Royal & Bronze** - Regal theme with deep purple and warm bronze
4. **Midnight & Amber** - Sophisticated night theme with midnight blue and amber
5. **Obsidian & Crimson** - Bold dramatic theme with pure black and crimson red
6. **Slate & Cyan** - Cool modern theme with slate gray and electric cyan
7. **Royal Silver** - Royal purple with metallic silver accents
8. **Forest Copper** - Deep forest green with warm copper highlights
9. **Burgundy & Rose Gold** - Rich burgundy with rose gold metallic accents
10. **Charcoal & Champagne** - Charcoal gray with champagne gold elegance
11. **Slate Gunmetal** - Cool slate blue with gunmetal accents
12. **Deep Purple & Platinum** - Deep purple with platinum metallic shine

## Using Themes in Components

### Best Practices

#### 1. Use Theme Palette Properties
Always reference theme colors through the MUI theme palette system:

```tsx
import { Box, Typography } from '@mui/material';

// ✅ GOOD - Uses theme palette
<Box sx={{ bgcolor: 'background.default' }}>
  <Typography sx={{ color: 'text.primary' }}>
    Hello World
  </Typography>
</Box>

// ❌ BAD - Hardcoded colors
<Box sx={{ bgcolor: '#1a1a2e' }}>
  <Typography sx={{ color: '#ffffff' }}>
    Hello World
  </Typography>
</Box>
```

#### 2. Common Theme Properties

- **Background Colors**:
  - `background.default` - Main app background
  - `background.paper` - Card/paper background

- **Text Colors**:
  - `text.primary` - Primary text
  - `text.secondary` - Secondary/muted text
  - `text.disabled` - Disabled text

- **Primary Colors**:
  - `primary.main` - Main brand color
  - `primary.light` - Lighter variant
  - `primary.dark` - Darker variant
  - `primary.contrastText` - Text that contrasts with primary

- **Semantic Colors**:
  - `success.main` - Success states
  - `error.main` - Error states
  - `warning.main` - Warning states
  - `info.main` - Info states

#### 3. Using Alpha/Transparency with Theme

```tsx
import { alpha, useTheme } from '@mui/material';

const theme = useTheme();

// ✅ GOOD - Uses theme color with alpha
<Box sx={{ 
  bgcolor: alpha(theme.palette.background.paper, 0.8) 
}}>

// ❌ BAD - Hardcoded color with alpha
<Box sx={{ 
  bgcolor: alpha('#1a1a2e', 0.8) 
}}>
```

## Changing Themes

### User Selection
Users can change themes through:
1. **Settings Screen**: Navigate to Settings → Appearance → Theme
2. **Theme Preview**: Navigate to `/theme_preview` to see all themes

### Programmatic Theme Change
```tsx
import { useAppStore } from './store/app-store';

const { setTheme } = useAppStore();
setTheme('navy-gold'); // Changes to Navy & Gold theme
```

## Theme Structure

Each theme includes:
- **Display Name**: Human-readable name
- **Description**: Brief description of the theme
- **MUI Theme Object**: Complete Material-UI theme configuration
- **Color Mappings**: Extracted colors for Android platform compatibility

## Special Cases

### Reader Modes
The e-reader components (EReaderScreen, MediaViewerScreen) have their own theme modes for optimal reading:
- **White Mode**: Light background, dark text
- **Black Mode**: True black background, light text
- **Sepia Mode**: Warm sepia background, brown text
- **E-ink Mode**: E-reader optimized colors

These are separate from the app theme and are intentionally hardcoded for reading comfort.

### Visualizer
The audio visualizer uses dynamic colors based on user-selected schemes (rainbow, monochrome) which are intentionally separate from the app theme.

## Development Guidelines

1. **Never hardcode colors** - Always use theme palette properties
2. **Test with multiple themes** - Ensure components look good with different themes
3. **Use semantic colors** - Use `success`, `error`, `warning` for appropriate states
4. **Maintain contrast** - Ensure text is readable against backgrounds
5. **Follow MUI conventions** - Use standard MUI theme property names

## Migration from Old Systems

The codebase previously had multiple conflicting theme systems:
- ✅ **unified-themes.ts** (Current, Active)
- ❌ **themes.ts** (HSL-based, Removed)
- ❌ **themes/themes.ts** (Duplicate MUI, Removed)
- ❌ **ancient-architect-theme.ts** (Specialty theme, Removed)
- ❌ **ThemeContext** (Custom context, Removed)

All components now use the unified-themes system exclusively.

## Resources

- [Material-UI Theming](https://mui.com/material-ui/customization/theming/)
- [MUI Color System](https://mui.com/material-ui/customization/color/)
- [MUI Dark Mode](https://mui.com/material-ui/customization/dark-mode/)
