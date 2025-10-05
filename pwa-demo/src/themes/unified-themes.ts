// Unified Theme System - 12 Themes Shared Between PWA and Android
// These themes are designed to work identically on both platforms
import { createTheme, ThemeOptions, Theme } from '@mui/material/styles';

export type UnifiedThemeName = 
  // Original 6 themes
  | 'navy-gold' 
  | 'emerald-silver' 
  | 'royal-bronze' 
  | 'midnight-amber'
  | 'obsidian-crimson'
  | 'slate-cyan'
  // New 6 themes matching Android
  | 'royal-silver'
  | 'forest-copper'
  | 'burgundy-rosegold'
  | 'charcoal-champagne'
  | 'slate-gunmetal'
  | 'deep-purple-platinum';

export interface UnifiedTheme {
  name: UnifiedThemeName;
  displayName: string;
  description: string;
  theme: Theme;
  // Color values for Android mapping
  colors: {
    primary: string;
    primaryLight: string;
    primaryDark: string;
    background: string;
    backgroundPaper: string;
    textPrimary: string;
    textSecondary: string;
  };
}

// Theme 1: Navy & Gold (Classic Plex-inspired)
const navyGoldTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: { main: '#d4af37', light: '#e0c25e', dark: '#a6862a', contrastText: '#0a1630' },
    secondary: { main: '#0f2346' },
    background: { default: '#0a1630', paper: '#0d1b36' },
    text: { primary: '#e6eaf2', secondary: '#b3bfd6' },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: { backgroundColor: '#0d1b36', border: '1px solid #1b2b4d' },
      },
    },
  },
};

// Theme 2: Emerald & Silver (Nature-inspired)
const emeraldSilverTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: { main: '#c0c0c0', light: '#d4d4d4', dark: '#a0a0a0', contrastText: '#0a1f14' },
    secondary: { main: '#0d2818' },
    background: { default: '#0a1f14', paper: '#0d2618' },
    text: { primary: '#e8f5ed', secondary: '#b3d9c3' },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: { backgroundColor: '#0d2618', border: '1px solid #1a3d28' },
      },
    },
  },
};

// Theme 3: Royal & Bronze (Regal)
const royalBronzeTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: { main: '#cd7f32', light: '#d99952', dark: '#a86428', contrastText: '#1a0a30' },
    secondary: { main: '#2d1550' },
    background: { default: '#1a0a30', paper: '#220d40' },
    text: { primary: '#f0e6ff', secondary: '#d0b3e6' },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: { backgroundColor: '#220d40', border: '1px solid #3d1f5c' },
      },
    },
  },
};

// Theme 4: Midnight & Amber (Sophisticated night)
const midnightAmberTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: { main: '#ffbf00', light: '#ffd14d', dark: '#cc9900', contrastText: '#0c1824' },
    secondary: { main: '#1a2332' },
    background: { default: '#0c1824', paper: '#15202e' },
    text: { primary: '#e8eef5', secondary: '#b8c5d6' },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: { backgroundColor: '#15202e', border: '1px solid #253447' },
      },
    },
  },
};

// Theme 5: Obsidian & Crimson (Bold dramatic)
const obsidianCrimsonTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: { main: '#dc143c', light: '#e5395f', dark: '#b00f30', contrastText: '#141414' },
    secondary: { main: '#262626' },
    background: { default: '#0a0a0a', paper: '#141414' },
    text: { primary: '#f5f5f5', secondary: '#d0d0d0' },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: { backgroundColor: '#141414', border: '1px solid #2d2d2d' },
      },
    },
  },
};

// Theme 6: Slate & Cyan (Cool modern)
const slateCyanTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: { main: '#00d9ff', light: '#4de2ff', dark: '#00a8cc', contrastText: '#1a1f24' },
    secondary: { main: '#2a333d' },
    background: { default: '#1a1f24', paper: '#232930' },
    text: { primary: '#e8f0f5', secondary: '#b8cad6' },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: { backgroundColor: '#232930', border: '1px solid #3d4854' },
      },
    },
  },
};

// Theme 7: Royal Silver (Matching Android)
const royalSilverTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: { main: '#c0c0c0', light: '#e0e0e0', dark: '#9a9a9a', contrastText: '#1a1535' },
    secondary: { main: '#2a1f50' },
    background: { default: '#1a1535', paper: '#211a40' },
    text: { primary: '#f0ebff', secondary: '#c8bfe6' },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: { backgroundColor: '#211a40', border: '1px solid #3d2f5c' },
      },
    },
  },
};

// Theme 8: Forest Copper (Matching Android)
const forestCopperTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: { main: '#b87333', light: '#d4965a', dark: '#935e29', contrastText: '#0d1f0d' },
    secondary: { main: '#1a3d1a' },
    background: { default: '#0d1f0d', paper: '#152915' },
    text: { primary: '#e8f5e8', secondary: '#b8d9b8' },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: { backgroundColor: '#152915', border: '1px solid #2a4d2a' },
      },
    },
  },
};

// Theme 9: Burgundy & Rose Gold (Matching Android)
const burgundyRoseGoldTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: { main: '#b76e79', light: '#d4969e', dark: '#93575f', contrastText: '#2d0f1a' },
    secondary: { main: '#4d1a2a' },
    background: { default: '#2d0f1a', paper: '#3d1525' },
    text: { primary: '#ffe6ed', secondary: '#e6c0cc' },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: { backgroundColor: '#3d1525', border: '1px solid #5c2a3d' },
      },
    },
  },
};

// Theme 10: Charcoal Champagne (Matching Android)
const charcoalChampagneTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: { main: '#f7e7ce', light: '#fff5e6', dark: '#c5b8a5', contrastText: '#1f1f1f' },
    secondary: { main: '#3d3d3d' },
    background: { default: '#1f1f1f', paper: '#2a2a2a' },
    text: { primary: '#f5f5f5', secondary: '#d0d0d0' },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: { backgroundColor: '#2a2a2a', border: '1px solid #3d3d3d' },
      },
    },
  },
};

// Theme 11: Slate Gunmetal (Matching Android)
const slateGunmetalTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: { main: '#8f9ca8', light: '#b0bdc9', dark: '#6f7d87', contrastText: '#1a2029' },
    secondary: { main: '#2d3844' },
    background: { default: '#1a2029', paper: '#232c38' },
    text: { primary: '#e6ecf2', secondary: '#b8c5d6' },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: { backgroundColor: '#232c38', border: '1px solid #3d4854' },
      },
    },
  },
};

// Theme 12: Deep Purple & Platinum (NEW - Unique to unified set)
const deepPurplePlatinumTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: { main: '#e5e4e2', light: '#f5f4f2', dark: '#b8b7b5', contrastText: '#1a0f2e' },
    secondary: { main: '#2e1a50' },
    background: { default: '#1a0f2e', paper: '#24153d' },
    text: { primary: '#f0ebff', secondary: '#d0c0e6' },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: { backgroundColor: '#24153d', border: '1px solid #3d2a5c' },
      },
    },
  },
};

// Export all 12 themes
export const unifiedThemes: Record<UnifiedThemeName, UnifiedTheme> = {
  'navy-gold': {
    name: 'navy-gold',
    displayName: 'Navy & Gold',
    description: 'Classic Plex-inspired theme with deep navy and metallic gold',
    theme: createTheme(navyGoldTheme),
    colors: {
      primary: '#d4af37',
      primaryLight: '#e0c25e',
      primaryDark: '#a6862a',
      background: '#0a1630',
      backgroundPaper: '#0d1b36',
      textPrimary: '#e6eaf2',
      textSecondary: '#b3bfd6',
    },
  },
  'emerald-silver': {
    name: 'emerald-silver',
    displayName: 'Emerald & Silver',
    description: 'Nature-inspired theme with deep emerald and bright silver',
    theme: createTheme(emeraldSilverTheme),
    colors: {
      primary: '#c0c0c0',
      primaryLight: '#d4d4d4',
      primaryDark: '#a0a0a0',
      background: '#0a1f14',
      backgroundPaper: '#0d2618',
      textPrimary: '#e8f5ed',
      textSecondary: '#b3d9c3',
    },
  },
  'royal-bronze': {
    name: 'royal-bronze',
    displayName: 'Royal & Bronze',
    description: 'Regal theme with deep purple and warm bronze',
    theme: createTheme(royalBronzeTheme),
    colors: {
      primary: '#cd7f32',
      primaryLight: '#d99952',
      primaryDark: '#a86428',
      background: '#1a0a30',
      backgroundPaper: '#220d40',
      textPrimary: '#f0e6ff',
      textSecondary: '#d0b3e6',
    },
  },
  'midnight-amber': {
    name: 'midnight-amber',
    displayName: 'Midnight & Amber',
    description: 'Sophisticated night theme with midnight blue and amber',
    theme: createTheme(midnightAmberTheme),
    colors: {
      primary: '#ffbf00',
      primaryLight: '#ffd14d',
      primaryDark: '#cc9900',
      background: '#0c1824',
      backgroundPaper: '#15202e',
      textPrimary: '#e8eef5',
      textSecondary: '#b8c5d6',
    },
  },
  'obsidian-crimson': {
    name: 'obsidian-crimson',
    displayName: 'Obsidian & Crimson',
    description: 'Bold dramatic theme with pure black and crimson red',
    theme: createTheme(obsidianCrimsonTheme),
    colors: {
      primary: '#dc143c',
      primaryLight: '#e5395f',
      primaryDark: '#b00f30',
      background: '#0a0a0a',
      backgroundPaper: '#141414',
      textPrimary: '#f5f5f5',
      textSecondary: '#d0d0d0',
    },
  },
  'slate-cyan': {
    name: 'slate-cyan',
    displayName: 'Slate & Cyan',
    description: 'Cool modern theme with slate gray and electric cyan',
    theme: createTheme(slateCyanTheme),
    colors: {
      primary: '#00d9ff',
      primaryLight: '#4de2ff',
      primaryDark: '#00a8cc',
      background: '#1a1f24',
      backgroundPaper: '#232930',
      textPrimary: '#e8f0f5',
      textSecondary: '#b8cad6',
    },
  },
  'royal-silver': {
    name: 'royal-silver',
    displayName: 'Royal Silver',
    description: 'Royal purple with metallic silver accents',
    theme: createTheme(royalSilverTheme),
    colors: {
      primary: '#c0c0c0',
      primaryLight: '#e0e0e0',
      primaryDark: '#9a9a9a',
      background: '#1a1535',
      backgroundPaper: '#211a40',
      textPrimary: '#f0ebff',
      textSecondary: '#c8bfe6',
    },
  },
  'forest-copper': {
    name: 'forest-copper',
    displayName: 'Forest Copper',
    description: 'Deep forest green with warm copper highlights',
    theme: createTheme(forestCopperTheme),
    colors: {
      primary: '#b87333',
      primaryLight: '#d4965a',
      primaryDark: '#935e29',
      background: '#0d1f0d',
      backgroundPaper: '#152915',
      textPrimary: '#e8f5e8',
      textSecondary: '#b8d9b8',
    },
  },
  'burgundy-rosegold': {
    name: 'burgundy-rosegold',
    displayName: 'Burgundy & Rose Gold',
    description: 'Rich burgundy with rose gold metallic accents',
    theme: createTheme(burgundyRoseGoldTheme),
    colors: {
      primary: '#b76e79',
      primaryLight: '#d4969e',
      primaryDark: '#93575f',
      background: '#2d0f1a',
      backgroundPaper: '#3d1525',
      textPrimary: '#ffe6ed',
      textSecondary: '#e6c0cc',
    },
  },
  'charcoal-champagne': {
    name: 'charcoal-champagne',
    displayName: 'Charcoal & Champagne',
    description: 'Charcoal gray with champagne gold elegance',
    theme: createTheme(charcoalChampagneTheme),
    colors: {
      primary: '#f7e7ce',
      primaryLight: '#fff5e6',
      primaryDark: '#c5b8a5',
      background: '#1f1f1f',
      backgroundPaper: '#2a2a2a',
      textPrimary: '#f5f5f5',
      textSecondary: '#d0d0d0',
    },
  },
  'slate-gunmetal': {
    name: 'slate-gunmetal',
    displayName: 'Slate Gunmetal',
    description: 'Cool slate blue with gunmetal accents',
    theme: createTheme(slateGunmetalTheme),
    colors: {
      primary: '#8f9ca8',
      primaryLight: '#b0bdc9',
      primaryDark: '#6f7d87',
      background: '#1a2029',
      backgroundPaper: '#232c38',
      textPrimary: '#e6ecf2',
      textSecondary: '#b8c5d6',
    },
  },
  'deep-purple-platinum': {
    name: 'deep-purple-platinum',
    displayName: 'Deep Purple & Platinum',
    description: 'Deep purple with platinum metallic shine',
    theme: createTheme(deepPurplePlatinumTheme),
    colors: {
      primary: '#e5e4e2',
      primaryLight: '#f5f4f2',
      primaryDark: '#b8b7b5',
      background: '#1a0f2e',
      backgroundPaper: '#24153d',
      textPrimary: '#f0ebff',
      textSecondary: '#d0c0e6',
    },
  },
};

export function getUnifiedTheme(themeName: UnifiedThemeName): UnifiedTheme {
  return unifiedThemes[themeName] || unifiedThemes['navy-gold'];
}

export function getAllUnifiedThemes(): UnifiedTheme[] {
  return Object.values(unifiedThemes);
}