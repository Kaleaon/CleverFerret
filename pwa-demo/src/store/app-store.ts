// Zustand store for state management - equivalent to Android ViewModels
import { create } from 'zustand';
import { persist } from 'zustand/middleware';
import { Library, ImportStatus, ReaderThemeMode, ReaderFont } from '../types';
import { LibraryService } from '../services/database';
import type { UnifiedThemeName } from '../themes/unified-themes';

interface AppState {
  // Libraries state
  libraries: Library[];
  isLoading: boolean;

  // Import state
  importStatus: ImportStatus;

  // App theme
  selectedTheme: UnifiedThemeName;

  // Reader preferences
  readerPreferences: {
    themeMode: ReaderThemeMode;
    font: ReaderFont;
    fontSize: number; // px
  };

  // Actions
  loadLibraries: () => Promise<void>;
  addLibrary: (name: string, type: Library['type'], path: string) => Promise<void>;
  deleteLibrary: (libraryId: number) => Promise<void>;
  setImportStatus: (status: ImportStatus) => void;
  setTheme: (theme: UnifiedThemeName) => void;

  // Reader preference actions
  setReaderThemeMode: (mode: ReaderThemeMode) => void;
  setReaderFont: (font: ReaderFont) => void;
  setReaderFontSize: (size: number) => void;
}

export const useAppStore = create<AppState>()(
  persist(
    (set, get) => ({
      libraries: [],
      isLoading: false,
      importStatus: { isImporting: false, status: '' },
      selectedTheme: 'navy-gold',
      readerPreferences: {
        themeMode: ReaderThemeMode.WHITE,
        font: ReaderFont.SYSTEM_SANS,
        fontSize: 16,
      },

  loadLibraries: async () => {
    set({ isLoading: true });
    try {
      const libraries = await LibraryService.getAllLibraries();
      set({ libraries, isLoading: false });

      // Initialize with default library if empty (like Android version)
      if (libraries.length === 0) {
        await get().addLibrary('My Books', 'BOOK', '/books');
      }
    } catch (error) {
      console.error('Failed to load libraries:', error);
      set({ isLoading: false });
    }
  },

  addLibrary: async (name: string, type: Library['type'], path: string) => {
    try {
      await LibraryService.addLibrary({ name, type, path });
      await get().loadLibraries(); // Refresh the list
    } catch (error) {
      console.error('Failed to add library:', error);
    }
  },

  deleteLibrary: async (libraryId: number) => {
    try {
      await LibraryService.deleteLibrary(libraryId);
      await get().loadLibraries(); // Refresh the list
    } catch (error) {
      console.error('Failed to delete library:', error);
    }
  },

  setImportStatus: (status: ImportStatus) => {
    set({ importStatus: status });
  },

  setTheme: (theme: UnifiedThemeName) => {
    set({ selectedTheme: theme });
  },

  setReaderThemeMode: (mode: ReaderThemeMode) => {
    set((state) => ({
      readerPreferences: {
        ...state.readerPreferences,
        themeMode: mode,
      },
    }));
  },

  setReaderFont: (font: ReaderFont) => {
    set((state) => ({
      readerPreferences: {
        ...state.readerPreferences,
        font,
      },
    }));
  },

  setReaderFontSize: (size: number) => {
    set((state) => ({
      readerPreferences: {
        ...state.readerPreferences,
        fontSize: Math.max(12, Math.min(28, size)),
      },
    }));
  },
    }),
    {
      name: 'cleverferret-storage',
      partialize: (state) => ({
        selectedTheme: state.selectedTheme,
        readerPreferences: state.readerPreferences,
      }),
    }
  )
);
