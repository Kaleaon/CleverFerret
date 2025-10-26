
export interface ThemePalette {
  primary: string;
  secondary: string;
  background: string;
  surface: string;
  'surface-variant': string;
  'on-primary': string;
  'on-background': string;
  'on-surface': string;
  'on-surface-variant': string;
}

export type ThemeName = 
  'Navy & Gold' | 'Emerald & Silver' | 'Royal & Bronze' | 
  'Midnight & Amber' | 'Obsidian & Crimson' | 'Slate & Cyan' | 
  'Royal Silver' | 'Forest Copper' | 'Burgundy & Rose Gold' | 
  'Charcoal Champagne' | 'Slate Gunmetal' | 'Deep Purple & Platinum';

export const themes: Record<ThemeName, ThemePalette> = {
  'Navy & Gold': {
    primary: '51 100% 50%',
    secondary: '174 100% 39%',
    background: '222 84% 4%',
    surface: '221 64% 8%',
    'surface-variant': '220 49% 12%',
    'on-primary': '222 84% 4%',
    'on-background': '220 27% 95%',
    'on-surface': '220 20% 80%',
    'on-surface-variant': '220 14% 60%',
  },
  'Emerald & Silver': {
    primary: '0 0% 75%',
    secondary: '170 80% 45%',
    background: '160 80% 5%',
    surface: '160 70% 8%',
    'surface-variant': '160 60% 12%',
    'on-primary': '160 80% 5%',
    'on-background': '160 15% 95%',
    'on-surface': '160 10% 80%',
    'on-surface-variant': '160 5% 60%',
  },
  'Royal & Bronze': {
    primary: '30 59% 48%',
    secondary: '190 70% 50%',
    background: '260 80% 6%',
    surface: '260 70% 9%',
    'surface-variant': '260 60% 13%',
    'on-primary': '260 80% 6%',
    'on-background': '260 15% 95%',
    'on-surface': '260 10% 80%',
    'on-surface-variant': '260 5% 60%',
  },
  'Midnight & Amber': {
    primary: '45 100% 50%',
    secondary: '200 80% 55%',
    background: '210 80% 5%',
    surface: '210 70% 8%',
    'surface-variant': '210 60% 11%',
    'on-primary': '210 80% 5%',
    'on-background': '210 15% 95%',
    'on-surface': '210 10% 80%',
    'on-surface-variant': '210 5% 60%',
  },
  'Obsidian & Crimson': {
    primary: '348 83% 47%',
    secondary: '210 60% 60%',
    background: '0 0% 4%',
    surface: '0 0% 7%',
    'surface-variant': '0 0% 11%',
    'on-primary': '0 0% 95%',
    'on-background': '0 0% 95%',
    'on-surface': '0 0% 80%',
    'on-surface-variant': '0 0% 60%',
  },
  'Slate & Cyan': {
    primary: '187 100% 50%',
    secondary: '230 50% 70%',
    background: '210 40% 6%',
    surface: '210 35% 9%',
    'surface-variant': '210 30% 13%',
    'on-primary': '210 40% 6%',
    'on-background': '210 10% 95%',
    'on-surface': '210 8% 80%',
    'on-surface-variant': '210 5% 60%',
  },
  'Royal Silver': {
    primary: '0 0% 75%',
    secondary: '250 60% 70%',
    background: '250 40% 8%',
    surface: '250 35% 11%',
    'surface-variant': '250 30% 15%',
    'on-primary': '250 40% 8%',
    'on-background': '250 10% 95%',
    'on-surface': '250 8% 80%',
    'on-surface-variant': '250 5% 60%',
  },
  'Forest Copper': {
    primary: '24 73% 42%',
    secondary: '150 50% 60%',
    background: '120 40% 5%',
    surface: '120 35% 8%',
    'surface-variant': '120 30% 12%',
    'on-primary': '120 40% 5%',
    'on-background': '120 10% 95%',
    'on-surface': '120 8% 80%',
    'on-surface-variant': '120 5% 60%',
  },
  'Burgundy & Rose Gold': {
    primary: '345 53% 58%',
    secondary: '330 40% 80%',
    background: '340 50% 7%',
    surface: '340 45% 10%',
    'surface-variant': '340 40% 14%',
    'on-primary': '340 50% 7%',
    'on-background': '340 10% 95%',
    'on-surface': '340 8% 80%',
    'on-surface-variant': '340 5% 60%',
  },
  'Charcoal Champagne': {
    primary: '43 64% 90%',
    secondary: '210 20% 75%',
    background: '0 0% 8%',
    surface: '0 0% 12%',
    'surface-variant': '0 0% 16%',
    'on-primary': '0 0% 8%',
    'on-background': '0 0% 95%',
    'on-surface': '0 0% 80%',
    'on-surface-variant': '0 0% 60%',
  },
  'Slate Gunmetal': {
    primary: '207 10% 61%',
    secondary: '210 30% 80%',
    background: '212 25% 8%',
    surface: '212 20% 12%',
    'surface-variant': '212 18% 16%',
    'on-primary': '212 25% 8%',
    'on-background': '212 10% 95%',
    'on-surface': '212 8% 80%',
    'on-surface-variant': '212 5% 60%',
  },
  'Deep Purple & Platinum': {
    primary: '30 43% 90%',
    secondary: '270 50% 80%',
    background: '260 40% 8%',
    surface: '260 35% 11%',
    'surface-variant': '260 30% 15%',
    'on-primary': '260 40% 8%',
    'on-background': '260 10% 95%',
    'on-surface': '260 8% 80%',
    'on-surface-variant': '260 5% 60%',
  },
};

export const themeNames = Object.keys(themes) as ThemeName[];
