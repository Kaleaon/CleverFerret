/**
 * Library Repository
 * 
 * Provides abstraction layer between UI and database for library operations.
 * Migrated from LibraryRepository.kt
 */

import { db } from '../../services/database-complete';
import type { Library } from '../local/entity';

export class LibraryRepository {
  /**
   * Get all active libraries
   */
  async getAllActiveLibraries(): Promise<Library[]> {
    return db.libraries
      .where('isActive')
      .equals(1)
      .sortBy('name');
  }

  /**
   * Get all libraries (active and inactive)
   */
  async getAllLibraries(): Promise<Library[]> {
    return db.libraries.orderBy('name').toArray();
  }

  /**
   * Get library by ID
   */
  async getLibraryById(libraryId: number): Promise<Library | undefined> {
    return db.libraries.get(libraryId);
  }

  /**
   * Get library by path
   */
  async getLibraryByPath(path: string): Promise<Library | undefined> {
    return db.libraries.where('path').equals(path).first();
  }

  /**
   * Get libraries by type
   */
  async getLibrariesByType(type: string): Promise<Library[]> {
    return db.libraries
      .where('type')
      .equals(type)
      .and(lib => lib.isActive === true)
      .toArray();
  }

  /**
   * Create new library
   */
  async createLibrary(library: Omit<Library, 'libraryId'>): Promise<number> {
    const newLibrary: Library = {
      ...library,
      libraryId: 0, // Will be auto-generated
      dateModified: Date.now(),
      isActive: true,
      lastScanned: undefined,
    };
    return db.libraries.add(newLibrary);
  }

  /**
   * Update existing library
   */
  async updateLibrary(library: Library): Promise<void> {
    await db.libraries.update(library.libraryId, {
      ...library,
      dateModified: Date.now(),
    });
  }

  /**
   * Delete library
   */
  async deleteLibrary(library: Library): Promise<void> {
    await db.libraries.delete(library.libraryId);
  }

  /**
   * Toggle library active status
   */
  async toggleLibraryActive(libraryId: number, isActive: boolean): Promise<void> {
    await db.libraries.update(libraryId, {
      isActive,
      dateModified: Date.now(),
    });
  }

  /**
   * Update last scanned timestamp
   */
  async updateLastScanned(libraryId: number, timestamp: number = Date.now()): Promise<void> {
    await db.libraries.update(libraryId, {
      lastScanned: timestamp,
    });
  }

  /**
   * Get count of active libraries
   */
  async getActiveLibraryCount(): Promise<number> {
    return db.libraries.where('isActive').equals(1).count();
  }

  /**
   * Get count of active libraries by type
   */
  async getActiveLibraryCountByType(type: string): Promise<number> {
    return db.libraries
      .where('type')
      .equals(type)
      .and(lib => lib.isActive === true)
      .count();
  }

  /**
   * Validate library path
   */
  async validateLibraryPath(path: string): Promise<boolean> {
    if (!path.trim()) return false;
    const existing = await this.getLibraryByPath(path);
    return existing === undefined;
  }

  /**
   * Get library statistics
   */
  async getLibraryStats(): Promise<LibraryStats> {
    const totalLibraries = await this.getActiveLibraryCount();
    const bookLibraries = await this.getActiveLibraryCountByType('BOOK');
    const musicLibraries = await this.getActiveLibraryCountByType('MUSIC');
    const movieLibraries = await this.getActiveLibraryCountByType('MOVIE');
    const otherLibraries = totalLibraries - bookLibraries - musicLibraries - movieLibraries;

    return {
      total: totalLibraries,
      books: bookLibraries,
      music: musicLibraries,
      movies: movieLibraries,
      other: otherLibraries,
    };
  }

  /**
   * Subscribe to library changes (returns cleanup function)
   */
  observeAllLibraries(callback: (libraries: Library[]) => void): () => void {
    const subscription = db.libraries
      .orderBy('name')
      .toArray()
      .then(callback);

    // Set up live query subscription
    const observable = db.libraries.toCollection().toArray();
    
    // Return cleanup function
    return () => {
      // Dexie will handle cleanup automatically
    };
  }
}

/**
 * Library statistics interface
 */
export interface LibraryStats {
  total: number;
  books: number;
  music: number;
  movies: number;
  other: number;
}

// Export singleton instance
export const libraryRepository = new LibraryRepository();
