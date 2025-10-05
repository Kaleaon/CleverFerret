// Modern theme system with multiple beautiful themes
import { createTheme, ThemeOptions, Theme } from '@mui/material/styles';

export type ThemeName =
  | 'navy-gold'
  | 'emerald-silver'
  | 'royal-bronze'
  | 'midnight-amber'
  | 'obsidian-crimson'
  | 'slate-cyan';

export interface CleverFerretTheme {
  name: ThemeName;
  displayName: string;
  description: string;
  theme: Theme;
}

// Navy + Metallic Gold (Plex-inspired) - Original
const navyGoldTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: {
      main: '#d4af37', // metallic gold
      light: '#e0c25e',
      dark: '#a6862a',
      contrastText: '#0a1630',
    },
    secondary: {
      main: '#0f2346', // dark navy accent
    },
    background: {
      default: '#0a1630', // deep navy background
      paper: '#0d1b36',
    },
    text: {
      primary: '#e6eaf2',
      secondary: '#b3bfd6',
    },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: {
          backgroundColor: '#0d1b36',
          border: '1px solid #1b2b4d',
          transition: 'all 0.3s ease',
          '&:hover': {
            transform: 'translateY(-4px)',
            borderColor: '#d4af37',
            boxShadow: '0 8px 25px rgba(0, 0, 0, 0.45)',
          },
        },
      },
    },
    MuiAppBar: {
      styleOverrides: {
        root: {
          backgroundColor: '#0d1b36',
          borderBottom: '1px solid #1b2b4d',
        },
      },
    },
    MuiPaper: {
      styleOverrides: {
        root: {
          backgroundColor: '#0d1b36',
          borderColor: '#1b2b4d',
        },
      },
    },
  },
};

// Emerald + Silver - Modern nature theme
const emeraldSilverTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: {
      main: '#c0c0c0', // metallic silver
      light: '#d4d4d4',
      dark: '#a0a0a0',
      contrastText: '#0a1f14',
    },
    secondary: {
      main: '#0d2818', // dark emerald accent
    },
    background: {
      default: '#0a1f14', // deep emerald background
      paper: '#0d2618',
    },
    text: {
      primary: '#e8f5ed',
      secondary: '#b3d9c3',
    },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: {
          backgroundColor: '#0d2618',
          border: '1px solid #1a3d28',
          transition: 'all 0.3s ease',
          '&:hover': {
            transform: 'translateY(-4px)',
            borderColor: '#c0c0c0',
            boxShadow: '0 8px 25px rgba(0, 0, 0, 0.45)',
          },
        },
      },
    },
    MuiAppBar: {
      styleOverrides: {
        root: {
          backgroundColor: '#0d2618',
          borderBottom: '1px solid #1a3d28',
        },
      },
    },
    MuiPaper: {
      styleOverrides: {
        root: {
          backgroundColor: '#0d2618',
          borderColor: '#1a3d28',
        },
      },
    },
  },
};

// Royal Purple + Bronze - Regal theme
const royalBronzeTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: {
      main: '#cd7f32', // metallic bronze
      light: '#d99952',
      dark: '#a86428',
      contrastText: '#1a0a30',
    },
    secondary: {
      main: '#2d1550', // dark purple accent
    },
    background: {
      default: '#1a0a30', // deep purple background
      paper: '#220d40',
    },
    text: {
      primary: '#f0e6ff',
      secondary: '#d0b3e6',
    },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: {
          backgroundColor: '#220d40',
          border: '1px solid #3d1f5c',
          transition: 'all 0.3s ease',
          '&:hover': {
            transform: 'translateY(-4px)',
            borderColor: '#cd7f32',
            boxShadow: '0 8px 25px rgba(0, 0, 0, 0.45)',
          },
        },
      },
    },
    MuiAppBar: {
      styleOverrides: {
        root: {
          backgroundColor: '#220d40',
          borderBottom: '1px solid #3d1f5c',
        },
      },
    },
    MuiPaper: {
      styleOverrides: {
        root: {
          backgroundColor: '#220d40',
          borderColor: '#3d1f5c',
        },
      },
    },
  },
};

// Midnight Blue + Amber - Sophisticated night theme
const midnightAmberTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: {
      main: '#ffbf00', // amber
      light: '#ffd14d',
      dark: '#cc9900',
      contrastText: '#0c1824',
    },
    secondary: {
      main: '#1a2332', // midnight blue accent
    },
    background: {
      default: '#0c1824', // midnight background
      paper: '#15202e',
    },
    text: {
      primary: '#e8eef5',
      secondary: '#b8c5d6',
    },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: {
          backgroundColor: '#15202e',
          border: '1px solid #253447',
          transition: 'all 0.3s ease',
          '&:hover': {
            transform: 'translateY(-4px)',
            borderColor: '#ffbf00',
            boxShadow: '0 8px 25px rgba(0, 0, 0, 0.45)',
          },
        },
      },
    },
    MuiAppBar: {
      styleOverrides: {
        root: {
          backgroundColor: '#15202e',
          borderBottom: '1px solid #253447',
        },
      },
    },
    MuiPaper: {
      styleOverrides: {
        root: {
          backgroundColor: '#15202e',
          borderColor: '#253447',
        },
      },
    },
  },
};

// Obsidian + Crimson - Bold dramatic theme
const obsidianCrimsonTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: {
      main: '#dc143c', // crimson
      light: '#e5395f',
      dark: '#b00f30',
      contrastText: '#141414',
    },
    secondary: {
      main: '#262626', // obsidian accent
    },
    background: {
      default: '#0a0a0a', // obsidian background
      paper: '#141414',
    },
    text: {
      primary: '#f5f5f5',
      secondary: '#d0d0d0',
    },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: {
          backgroundColor: '#141414',
          border: '1px solid #2d2d2d',
          transition: 'all 0.3s ease',
          '&:hover': {
            transform: 'translateY(-4px)',
            borderColor: '#dc143c',
            boxShadow: '0 8px 25px rgba(220, 20, 60, 0.25)',
          },
        },
      },
    },
    MuiAppBar: {
      styleOverrides: {
        root: {
          backgroundColor: '#141414',
          borderBottom: '1px solid #2d2d2d',
        },
      },
    },
    MuiPaper: {
      styleOverrides: {
        root: {
          backgroundColor: '#141414',
          borderColor: '#2d2d2d',
        },
      },
    },
  },
};

// Slate + Cyan - Cool modern theme
const slateCyanTheme: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: {
      main: '#00d9ff', // cyan
      light: '#4de2ff',
      dark: '#00a8cc',
      contrastText: '#1a1f24',
    },
    secondary: {
      main: '#2a333d', // slate accent
    },
    background: {
      default: '#1a1f24', // slate background
      paper: '#232930',
    },
    text: {
      primary: '#e8f0f5',
      secondary: '#b8cad6',
    },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: {
          backgroundColor: '#232930',
          border: '1px solid #3d4854',
          transition: 'all 0.3s ease',
          '&:hover': {
            transform: 'translateY(-4px)',
            borderColor: '#00d9ff',
            boxShadow: '0 8px 25px rgba(0, 217, 255, 0.2)',
          },
        },
      },
    },
    MuiAppBar: {
      styleOverrides: {
        root: {
          backgroundColor: '#232930',
          borderBottom: '1px solid #3d4854',
        },
      },
    },
    MuiPaper: {
      styleOverrides: {
        root: {
          backgroundColor: '#232930',
          borderColor: '#3d4854',
        },
      },
    },
  },
};

// Export all themes
export const themes: Record<ThemeName, CleverFerretTheme> = {
  'navy-gold': {
    name: 'navy-gold',
    displayName: 'Navy & Gold',
    description: 'Classic Plex-inspired theme with navy blue and metallic gold',
    theme: createTheme(navyGoldTheme),
  },
  'emerald-silver': {
    name: 'emerald-silver',
    displayName: 'Emerald & Silver',
    description: 'Nature-inspired theme with deep emerald and bright silver',
    theme: createTheme(emeraldSilverTheme),
  },
  'royal-bronze': {
    name: 'royal-bronze',
    displayName: 'Royal & Bronze',
    description: 'Regal theme with deep purple and warm bronze',
    theme: createTheme(royalBronzeTheme),
  },
  'midnight-amber': {
    name: 'midnight-amber',
    displayName: 'Midnight & Amber',
    description: 'Sophisticated night theme with midnight blue and amber',
    theme: createTheme(midnightAmberTheme),
  },
  'obsidian-crimson': {
    name: 'obsidian-crimson',
    displayName: 'Obsidian & Crimson',
    description: 'Bold dramatic theme with pure black and crimson red',
    theme: createTheme(obsidianCrimsonTheme),
  },
  'slate-cyan': {
    name: 'slate-cyan',
    displayName: 'Slate & Cyan',
    description: 'Cool modern theme with slate gray and electric cyan',
    theme: createTheme(slateCyanTheme),
  },
};

export function getTheme(themeName: ThemeName): CleverFerretTheme {
  return themes[themeName] || themes['navy-gold'];
}

export function getAllThemes(): CleverFerretTheme[] {
  return Object.values(themes);
}
