// IndexedDB service using Dexie - equivalent to Android Room
import Dexie, { Table } from 'dexie';
import { Library, MediaItem, MetadataCommon, MetadataBook } from '../types';

/**
 * Defines the IndexedDB database structure using Dexie.js.
 * This class sets up the database name, version, and table schemas.
 */
export class CleverFerretDB extends Dexie {
  libraries!: Table<Library>;
  mediaItems!: Table<MediaItem>;
  metadataCommon!: Table<MetadataCommon>;
  metadataBooks!: Table<MetadataBook>;

  constructor() {
    super('CleverFerretDB');
    
    this.version(3).stores({
      libraries: '++libraryId, name, type, path',
      mediaItems: '++itemId, libraryId, fileName, mediaType, filePath',
      metadataCommon: 'itemId, title, isFavorite, isDownloaded',
      metadataBooks: 'itemId, author, isbn, series'
    });
  }
}

export const db = new CleverFerretDB();

/**
 * Service class for managing library-related database operations.
 * This acts as a data access layer for libraries, similar to a DAO in Android Room.
 */
export class LibraryService {
  /**
   * Retrieves all libraries from the database.
   * @returns {Promise<Library[]>} A promise that resolves to an array of all libraries.
   */
  static async getAllLibraries(): Promise<Library[]> {
    return await db.libraries.toArray();
  }

  /**
   * Adds a new library to the database.
   * @param {Omit<Library, 'libraryId'>} library - The library object to add, without the libraryId.
   * @returns {Promise<number>} A promise that resolves to the ID of the newly created library.
   */
  static async addLibrary(library: Omit<Library, 'libraryId'>): Promise<number> {
    return await db.libraries.add({
      ...library,
      dateCreated: new Date(),
      dateModified: new Date()
    });
  }

  /**
   * Deletes a library and all its associated media items and metadata.
   * @param {number} libraryId - The ID of the library to delete.
   * @returns {Promise<void>} A promise that resolves when the deletion is complete.
   */
  static async deleteLibrary(libraryId: number): Promise<void> {
    await db.transaction('rw', [db.libraries, db.mediaItems, db.metadataCommon], async () => {
      // Delete all related media items first
      const mediaItems = await db.mediaItems.where('libraryId').equals(libraryId).toArray();
      const itemIds = mediaItems.map(item => item.itemId!);
      
      // Delete metadata for all items
      await db.metadataCommon.where('itemId').anyOf(itemIds).delete();
      await db.metadataBooks.where('itemId').anyOf(itemIds).delete();
      
      // Delete media items
      await db.mediaItems.where('libraryId').equals(libraryId).delete();
      
      // Finally delete the library
      await db.libraries.delete(libraryId);
    });
  }
}

/**
 * Service class for managing media item-related database operations.
 */
export class MediaItemService {
  /**
   * Retrieves all media items for a specific library.
   * @param {number} libraryId - The ID of the library.
   * @returns {Promise<MediaItem[]>} A promise that resolves to an array of media items.
   */
  static async getItemsByLibrary(libraryId: number): Promise<MediaItem[]> {
    return await db.mediaItems.where('libraryId').equals(libraryId).toArray();
  }

  /**
   * Adds a new media item to the database.
   * @param {Omit<MediaItem, 'itemId'>} item - The media item to add.
   * @returns {Promise<number>} A promise that resolves to the ID of the new media item.
   */
  static async addMediaItem(item: Omit<MediaItem, 'itemId'>): Promise<number> {
    return await db.mediaItems.add({
      ...item,
      dateAdded: new Date(),
      lastModified: new Date()
    });
  }

  /**
   * Searches for media items by file name.
   * @param {string} query - The search query.
   * @returns {Promise<MediaItem[]>} A promise that resolves to an array of matching media items.
   */
  static async searchItems(query: string): Promise<MediaItem[]> {
    return await db.mediaItems
      .filter(item => 
        item.fileName.toLowerCase().includes(query.toLowerCase())
      )
      .toArray();
  }
}

/**
 * Service class for managing metadata-related database operations.
 */
export class MetadataService {
  /**
   * Retrieves all details for a book, including media item info and metadata.
   * @param {number} itemId - The ID of the book item.
   * @returns {Promise<object>} An object containing the media item and its metadata.
   */
  static async getBookDetails(itemId: number) {
    const [mediaItem, metadataCommon, metadataBook] = await Promise.all([
      db.mediaItems.get(itemId),
      db.metadataCommon.get(itemId),
      db.metadataBooks.get(itemId)
    ]);

    return {
      mediaItem,
      metadataCommon,
      metadataBook
    };
  }

  /**
   * Updates the common metadata for a media item.
   * @param {number} itemId - The ID of the item to update.
   * @param {Partial<MetadataCommon>} metadata - An object containing the metadata fields to update.
   * @returns {Promise<void>}
   */
  static async updateMetadata(itemId: number, metadata: Partial<MetadataCommon>): Promise<void> {
    await db.metadataCommon.update(itemId, metadata);
  }

  /**
   * Toggles the favorite status of a media item.
   * @param {number} itemId - The ID of the item to toggle.
   * @returns {Promise<void>}
   */
  static async toggleFavorite(itemId: number): Promise<void> {
    const current = await db.metadataCommon.get(itemId);
    if (current) {
      await db.metadataCommon.update(itemId, { isFavorite: !current.isFavorite });
    }
  }
}