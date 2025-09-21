// Zustand store for state management - equivalent to Android ViewModels
import { create } from 'zustand';
import { Library, ImportStatus } from '../types';
import { LibraryService } from '../services/database';

/**
 * @interface AppState
 * Defines the shape of the application's global state managed by Zustand.
 *
 * @property {Library[]} libraries - The list of all media libraries.
 * @property {boolean} isLoading - Flag indicating if libraries are currently being loaded.
 * @property {ImportStatus} importStatus - The current status of any import process.
 * @property {() => Promise<void>} loadLibraries - Action to load all libraries from the database.
 * @property {(name: string, type: Library['type'], path: string) => Promise<void>} addLibrary - Action to add a new library.
 * @property {(libraryId: number) => Promise<void>} deleteLibrary - Action to delete a library.
 * @property {(status: ImportStatus) => void} setImportStatus - Action to update the import status.
 */
interface AppState {
  // Libraries state
  libraries: Library[];
  isLoading: boolean;

  // Import state
  importStatus: ImportStatus;

  // Actions
  loadLibraries: () => Promise<void>;
  addLibrary: (name: string, type: Library['type'], path: string) => Promise<void>;
  deleteLibrary: (libraryId: number) => Promise<void>;
  setImportStatus: (status: ImportStatus) => void;
}

/**
 * @constant useAppStore
 * A Zustand store for managing the global application state.
 * This is the PWA equivalent of Android's ViewModel, providing a centralized
 * place for state and business logic.
 */
export const useAppStore = create<AppState>((set, get) => ({
  libraries: [],
  isLoading: false,
  importStatus: { isImporting: false, status: '' },

  /**
   * Loads all libraries from the database and updates the state.
   * If no libraries exist, it initializes a default "My Books" library.
   */
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

  /**
   * Adds a new library to the database and refreshes the state.
   * @param {string} name - The name of the new library.
   * @param {Library['type']} type - The type of media for the library.
   * @param {string} path - The file path for the library.
   */
  addLibrary: async (name: string, type: Library['type'], path: string) => {
    try {
      await LibraryService.addLibrary({ name, type, path });
      await get().loadLibraries(); // Refresh the list
    } catch (error) {
      console.error('Failed to add library:', error);
    }
  },

  /**
   * Deletes a library from the database and refreshes the state.
   * @param {number} libraryId - The ID of the library to delete.
   */
  deleteLibrary: async (libraryId: number) => {
    try {
      await LibraryService.deleteLibrary(libraryId);
      await get().loadLibraries(); // Refresh the list
    } catch (error) {
      console.error('Failed to delete library:', error);
    }
  },

  /**
   * Sets the current import status, used for displaying progress overlays.
   * @param {ImportStatus} status - The new import status object.
   */
  setImportStatus: (status: ImportStatus) => {
    set({ importStatus: status });
  }
}));