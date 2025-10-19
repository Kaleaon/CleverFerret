
import React, { createContext, useContext, useState, useEffect, useMemo } from 'react';
import { themes, ThemeName, ThemePalette, themeNames } from '../themes';

interface ThemeContextType {
  theme: ThemeName;
  setTheme: (theme: ThemeName) => void;
  themePalette: ThemePalette;
  availableThemes: ThemeName[];
}

const ThemeContext = createContext<ThemeContextType | undefined>(undefined);

export const ThemeProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const [theme, setTheme] = useState<ThemeName>(() => {
    try {
      const savedTheme = window.localStorage.getItem('clever-ferret-theme');
      return savedTheme && themes[savedTheme as ThemeName] ? (savedTheme as ThemeName) : 'Navy & Gold';
    } catch {
      return 'Navy & Gold';
    }
  });

  useEffect(() => {
    const newPalette = themes[theme];
    const root = document.documentElement;
    
    Object.keys(newPalette).forEach((key) => {
      const cssVarName = `--color-${key}`;
      root.style.setProperty(cssVarName, newPalette[key as keyof ThemePalette]);
    });

    try {
      window.localStorage.setItem('clever-ferret-theme', theme);
    } catch (error) {
      console.error("Could not save theme to localStorage", error);
    }
  }, [theme]);
  
  const themePalette = useMemo(() => themes[theme], [theme]);

  const value = { theme, setTheme, themePalette, availableThemes: themeNames };

  return (
    <ThemeContext.Provider value={value}>
      {children}
    </ThemeContext.Provider>
  );
};

export const useTheme = () => {
  const context = useContext(ThemeContext);
  if (context === undefined) {
    throw new Error('useTheme must be used within a ThemeProvider');
  }
  return context;
};
