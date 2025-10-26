// Ancient Architect Theme System
// Fusion of Art Deco, Dwarven Architecture, Frank Lloyd Wright, and Stargate Atlantis
// "Where Ancient Craftsmanship Meets Advanced Technology"

import { createTheme, ThemeOptions, Theme } from '@mui/material/styles';

export type AncientArchitectVariant = 'ancient-bronze' | 'silver-architect' | 'obsidian-tech';

export interface AncientArchitectColors {
  stone: {
    darkSlate: string;
    granite: string;
    stoneLight: string;
    carved: string;
  };
  metal: {
    bronze: string;
    copper: string;
    gold: string;
    patina: string;
  };
  crystal: {
    cyan: string;
    blue: string;
    amber: string;
    ruby: string;
  };
  accent: {
    emerald: string;
    sapphire: string;
    obsidian: string;
    marble: string;
  };
}

// Ancient Bronze Variant (Default)
const ancientBronzeColors: AncientArchitectColors = {
  stone: {
    darkSlate: '#1A1D23',
    granite: '#2D3139',
    stoneLight: '#3F4451',
    carved: '#52575F',
  },
  metal: {
    bronze: '#CD7F32',
    copper: '#B87333',
    gold: '#C5A572',
    patina: '#4A7C59',
  },
  crystal: {
    cyan: '#00CED1',
    blue: '#4682B4',
    amber: '#FFB347',
    ruby: '#E0115F',
  },
  accent: {
    emerald: '#50C878',
    sapphire: '#0F52BA',
    obsidian: '#0B1215',
    marble: '#E8E8E8',
  },
};

// Silver Architect Variant
const silverArchitectColors: AncientArchitectColors = {
  stone: {
    darkSlate: '#1A1C20',
    granite: '#2A2D33',
    stoneLight: '#3A3E46',
    carved: '#4A4E56',
  },
  metal: {
    bronze: '#C0C0C0', // Silver
    copper: '#B0B0B0', // Platinum
    gold: '#D3D3D3',
    patina: '#5A7C69',
  },
  crystal: {
    cyan: '#4DA6FF',
    blue: '#5A8FCE',
    amber: '#FFCC80',
    ruby: '#DC143C',
  },
  accent: {
    emerald: '#66CDAA',
    sapphire: '#1E90FF',
    obsidian: '#0F1215',
    marble: '#F0F0F0',
  },
};

// Obsidian Tech Variant
const obsidianTechColors: AncientArchitectColors = {
  stone: {
    darkSlate: '#0D0F14',
    granite: '#1A1D23',
    stoneLight: '#252931',
    carved: '#303841',
  },
  metal: {
    bronze: '#4A4A4A',
    copper: '#5A5A5A',
    gold: '#6A6A6A',
    patina: '#3A5A4A',
  },
  crystal: {
    cyan: '#00D9FF',
    blue: '#7B68EE',
    amber: '#9D4EDD',
    ruby: '#FF1493',
  },
  accent: {
    emerald: '#66FFAA',
    sapphire: '#4169E1',
    obsidian: '#000000',
    marble: '#F5F5F5',
  },
};

function getAncientArchitectColors(variant: AncientArchitectVariant): AncientArchitectColors {
  switch (variant) {
    case 'silver-architect':
      return silverArchitectColors;
    case 'obsidian-tech':
      return obsidianTechColors;
    case 'ancient-bronze':
    default:
      return ancientBronzeColors;
  }
}

function createAncientArchitectTheme(variant: AncientArchitectVariant): ThemeOptions {
  const colors = getAncientArchitectColors(variant);

  return {
    palette: {
      mode: 'dark',
      primary: {
        main: colors.metal.bronze,
        light: colors.metal.copper,
        dark: colors.metal.gold,
        contrastText: colors.accent.marble,
      },
      secondary: {
        main: colors.crystal.cyan,
        light: colors.crystal.blue,
        dark: colors.crystal.amber,
        contrastText: colors.stone.darkSlate,
      },
      background: {
        default: colors.stone.darkSlate,
        paper: colors.stone.granite,
      },
      text: {
        primary: colors.accent.marble,
        secondary: colors.stone.carved,
      },
      error: {
        main: colors.crystal.ruby,
      },
      warning: {
        main: colors.crystal.amber,
      },
      info: {
        main: colors.accent.sapphire,
      },
      success: {
        main: colors.accent.emerald,
      },
    },
    typography: {
      fontFamily: '"Rajdhani", "Roboto", "Helvetica", "Arial", sans-serif',
      h1: {
        fontFamily: '"Orbitron", "Roboto", sans-serif',
        fontWeight: 700,
        fontSize: '3rem',
        letterSpacing: '0.02em',
      },
      h2: {
        fontFamily: '"Orbitron", "Roboto", sans-serif',
        fontWeight: 600,
        fontSize: '2.25rem',
        letterSpacing: '0.02em',
      },
      h3: {
        fontFamily: '"Orbitron", "Roboto", sans-serif',
        fontWeight: 600,
        fontSize: '1.75rem',
        letterSpacing: '0.01em',
      },
      h4: {
        fontFamily: '"Orbitron", "Roboto", sans-serif',
        fontWeight: 500,
        fontSize: '1.5rem',
      },
      h5: {
        fontFamily: '"Orbitron", "Roboto", sans-serif',
        fontWeight: 500,
        fontSize: '1.25rem',
      },
      h6: {
        fontFamily: '"Orbitron", "Roboto", sans-serif',
        fontWeight: 500,
        fontSize: '1rem',
      },
      body1: {
        fontFamily: '"Rajdhani", "Roboto", sans-serif',
        fontSize: '1rem',
        fontWeight: 400,
      },
      body2: {
        fontFamily: '"Rajdhani", "Roboto", sans-serif',
        fontSize: '0.875rem',
        fontWeight: 400,
      },
      button: {
        fontFamily: '"Rajdhani", "Roboto", sans-serif',
        fontWeight: 500,
        letterSpacing: '0.05em',
        textTransform: 'uppercase',
      },
    },
    shape: {
      borderRadius: 4,
    },
    components: {
      MuiCssBaseline: {
        styleOverrides: {
          body: {
            background: `linear-gradient(135deg, ${colors.stone.darkSlate} 0%, ${colors.stone.granite} 100%)`,
            backgroundAttachment: 'fixed',
          },
          '@font-face': [
            {
              fontFamily: 'Orbitron',
              fontStyle: 'normal',
              fontDisplay: 'swap',
              fontWeight: 400,
              src: `url(https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;600;700&display=swap)`,
            },
            {
              fontFamily: 'Rajdhani',
              fontStyle: 'normal',
              fontDisplay: 'swap',
              fontWeight: 400,
              src: `url(https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap)`,
            },
          ],
        },
      },
      MuiCard: {
        styleOverrides: {
          root: {
            backgroundColor: colors.stone.granite,
            backgroundImage: `linear-gradient(135deg, ${colors.stone.granite} 0%, ${colors.stone.stoneLight} 100%)`,
            border: `2px solid ${colors.metal.bronze}`,
            borderRadius: 0,
            position: 'relative',
            transition: 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)',
            boxShadow: `
              0 8px 16px ${colors.accent.obsidian}40,
              inset 0 1px 0 ${colors.metal.copper}30
            `,
            '&::before': {
              content: '""',
              position: 'absolute',
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              background: `
                repeating-linear-gradient(
                  45deg,
                  transparent,
                  transparent 10px,
                  ${colors.stone.carved}08 10px,
                  ${colors.stone.carved}08 20px
                )
              `,
              pointerEvents: 'none',
            },
            '&:hover': {
              transform: 'translateY(-4px) scale(1.01)',
              borderColor: colors.crystal.cyan,
              boxShadow: `
                0 12px 24px ${colors.accent.obsidian}60,
                0 0 40px ${colors.crystal.cyan}30,
                inset 0 1px 0 ${colors.crystal.cyan}50
              `,
            },
          },
        },
      },
      MuiPaper: {
        styleOverrides: {
          root: {
            backgroundColor: colors.stone.granite,
            backgroundImage: `linear-gradient(135deg, ${colors.stone.granite} 0%, ${colors.stone.stoneLight} 100%)`,
            border: `1px solid ${colors.stone.carved}`,
            boxShadow: `0 4px 12px ${colors.accent.obsidian}40`,
          },
          elevation1: {
            boxShadow: `0 2px 8px ${colors.accent.obsidian}30`,
          },
          elevation2: {
            boxShadow: `0 4px 12px ${colors.accent.obsidian}40`,
          },
          elevation3: {
            boxShadow: `0 8px 16px ${colors.accent.obsidian}50`,
          },
          elevation4: {
            boxShadow: `0 12px 24px ${colors.accent.obsidian}60`,
          },
        },
      },
      MuiButton: {
        styleOverrides: {
          root: {
            borderRadius: 0,
            padding: '10px 24px',
            fontWeight: 600,
            position: 'relative',
            overflow: 'hidden',
            clipPath: 'polygon(8px 0, 100% 0, 100% calc(100% - 8px), calc(100% - 8px) 100%, 0 100%, 0 8px)',
            transition: 'all 0.3s ease',
            '&::before': {
              content: '""',
              position: 'absolute',
              top: 0,
              left: '-100%',
              width: '100%',
              height: '100%',
              background: `linear-gradient(90deg, transparent, ${colors.crystal.cyan}30, transparent)`,
              transition: 'left 0.5s ease',
            },
            '&:hover::before': {
              left: '100%',
            },
          },
          contained: {
            background: `linear-gradient(135deg, ${colors.metal.bronze} 0%, ${colors.metal.copper} 100%)`,
            color: colors.stone.darkSlate,
            border: `1px solid ${colors.metal.gold}`,
            boxShadow: `
              0 4px 8px ${colors.accent.obsidian}40,
              inset 0 1px 0 ${colors.metal.gold}50
            `,
            '&:hover': {
              background: `linear-gradient(135deg, ${colors.metal.copper} 0%, ${colors.metal.gold} 100%)`,
              boxShadow: `
                0 6px 16px ${colors.accent.obsidian}60,
                0 0 20px ${colors.crystal.cyan}40,
                inset 0 1px 0 ${colors.crystal.cyan}70
              `,
            },
          },
          outlined: {
            border: `2px solid ${colors.metal.bronze}`,
            color: colors.metal.bronze,
            background: `${colors.stone.granite}80`,
            '&:hover': {
              border: `2px solid ${colors.crystal.cyan}`,
              color: colors.crystal.cyan,
              background: `${colors.stone.granite}cc`,
              boxShadow: `0 0 20px ${colors.crystal.cyan}40`,
            },
          },
          text: {
            color: colors.metal.bronze,
            '&:hover': {
              color: colors.crystal.cyan,
              background: `${colors.stone.stoneLight}40`,
            },
          },
        },
      },
      MuiIconButton: {
        styleOverrides: {
          root: {
            color: colors.metal.bronze,
            border: `1px solid ${colors.metal.bronze}40`,
            background: `${colors.stone.granite}60`,
            clipPath: 'polygon(30% 0%, 70% 0%, 100% 30%, 100% 70%, 70% 100%, 30% 100%, 0% 70%, 0% 30%)',
            transition: 'all 0.3s ease',
            '&:hover': {
              color: colors.crystal.cyan,
              background: colors.stone.stoneLight,
              border: `1px solid ${colors.crystal.cyan}`,
              boxShadow: `0 0 16px ${colors.crystal.cyan}50`,
              transform: 'rotate(45deg)',
            },
          },
        },
      },
      MuiAppBar: {
        styleOverrides: {
          root: {
            backgroundColor: colors.stone.darkSlate,
            backgroundImage: `linear-gradient(90deg, ${colors.stone.darkSlate} 0%, ${colors.stone.granite} 100%)`,
            borderBottom: `2px solid ${colors.metal.bronze}`,
            boxShadow: `
              0 4px 16px ${colors.accent.obsidian}60,
              inset 0 -1px 0 ${colors.metal.bronze}30
            `,
          },
        },
      },
      MuiDrawer: {
        styleOverrides: {
          paper: {
            backgroundColor: colors.stone.darkSlate,
            backgroundImage: `
              linear-gradient(180deg, ${colors.stone.darkSlate} 0%, ${colors.stone.granite} 100%),
              repeating-linear-gradient(
                0deg,
                transparent,
                transparent 50px,
                ${colors.stone.carved}10 50px,
                ${colors.stone.carved}10 51px
              )
            `,
            borderRight: `2px solid ${colors.metal.bronze}`,
            boxShadow: `8px 0 24px ${colors.accent.obsidian}60`,
          },
        },
      },
      MuiTextField: {
        styleOverrides: {
          root: {
            '& .MuiOutlinedInput-root': {
              backgroundColor: `${colors.stone.stoneLight}40`,
              borderRadius: 0,
              clipPath: 'polygon(8px 0, 100% 0, 100% calc(100% - 8px), calc(100% - 8px) 100%, 0 100%, 0 8px)',
              '& fieldset': {
                borderColor: colors.metal.bronze,
                borderWidth: 2,
              },
              '&:hover fieldset': {
                borderColor: colors.crystal.cyan,
              },
              '&.Mui-focused fieldset': {
                borderColor: colors.crystal.cyan,
                boxShadow: `0 0 16px ${colors.crystal.cyan}40`,
              },
            },
          },
        },
      },
      MuiChip: {
        styleOverrides: {
          root: {
            backgroundColor: colors.stone.stoneLight,
            color: colors.metal.bronze,
            border: `1px solid ${colors.metal.bronze}`,
            borderRadius: 0,
            clipPath: 'polygon(6px 0, 100% 0, 100% calc(100% - 6px), calc(100% - 6px) 100%, 0 100%, 0 6px)',
            fontWeight: 600,
            '&:hover': {
              backgroundColor: colors.stone.carved,
              borderColor: colors.crystal.cyan,
              color: colors.crystal.cyan,
            },
          },
        },
      },
      MuiAlert: {
        styleOverrides: {
          root: {
            borderRadius: 0,
            border: '2px solid',
            clipPath: 'polygon(12px 0, 100% 0, 100% calc(100% - 12px), calc(100% - 12px) 100%, 0 100%, 0 12px)',
          },
          standardSuccess: {
            backgroundColor: `${colors.accent.emerald}20`,
            color: colors.accent.emerald,
            borderColor: colors.accent.emerald,
            boxShadow: `0 0 16px ${colors.accent.emerald}30`,
          },
          standardError: {
            backgroundColor: `${colors.crystal.ruby}20`,
            color: colors.crystal.ruby,
            borderColor: colors.crystal.ruby,
            boxShadow: `0 0 16px ${colors.crystal.ruby}30`,
          },
          standardWarning: {
            backgroundColor: `${colors.crystal.amber}20`,
            color: colors.crystal.amber,
            borderColor: colors.crystal.amber,
            boxShadow: `0 0 16px ${colors.crystal.amber}30`,
          },
          standardInfo: {
            backgroundColor: `${colors.accent.sapphire}20`,
            color: colors.crystal.cyan,
            borderColor: colors.crystal.cyan,
            boxShadow: `0 0 16px ${colors.crystal.cyan}30`,
          },
        },
      },
      MuiDialog: {
        styleOverrides: {
          paper: {
            backgroundColor: colors.stone.granite,
            backgroundImage: `linear-gradient(135deg, ${colors.stone.granite} 0%, ${colors.stone.stoneLight} 100%)`,
            border: `3px solid ${colors.metal.bronze}`,
            borderRadius: 0,
            clipPath: 'polygon(20px 0, 100% 0, 100% calc(100% - 20px), calc(100% - 20px) 100%, 0 100%, 0 20px)',
            boxShadow: `
              0 24px 48px ${colors.accent.obsidian}80,
              0 0 60px ${colors.crystal.cyan}20,
              inset 0 2px 0 ${colors.metal.bronze}40
            `,
          },
        },
      },
      MuiTooltip: {
        styleOverrides: {
          tooltip: {
            backgroundColor: colors.stone.stoneLight,
            color: colors.accent.marble,
            border: `1px solid ${colors.metal.bronze}`,
            fontSize: '0.875rem',
            fontWeight: 500,
            boxShadow: `0 4px 12px ${colors.accent.obsidian}60`,
          },
          arrow: {
            color: colors.stone.stoneLight,
            '&::before': {
              border: `1px solid ${colors.metal.bronze}`,
            },
          },
        },
      },
    },
  };
}

export const ancientArchitectThemes = {
  'ancient-bronze': {
    name: 'ancient-bronze' as AncientArchitectVariant,
    displayName: 'Ancient Bronze',
    description: 'Warm bronze and copper with amber glows - the default Ancient Architect theme',
    theme: createTheme(createAncientArchitectTheme('ancient-bronze')),
    colors: ancientBronzeColors,
  },
  'silver-architect': {
    name: 'silver-architect' as AncientArchitectVariant,
    displayName: 'Silver Architect',
    description: 'Cool silver and platinum with blue glows - elegant and refined',
    theme: createTheme(createAncientArchitectTheme('silver-architect')),
    colors: silverArchitectColors,
  },
  'obsidian-tech': {
    name: 'obsidian-tech' as AncientArchitectVariant,
    displayName: 'Obsidian Tech',
    description: 'Dark metallics with purple and cyan glows - mysterious and advanced',
    theme: createTheme(createAncientArchitectTheme('obsidian-tech')),
    colors: obsidianTechColors,
  },
};

export function getAncientArchitectTheme(variant: AncientArchitectVariant = 'ancient-bronze') {
  return ancientArchitectThemes[variant] || ancientArchitectThemes['ancient-bronze'];
}

export function getAllAncientArchitectThemes() {
  return Object.values(ancientArchitectThemes);
}
