// IndexedDB service using Dexie - equivalent to Android Room
import Dexie, { Table } from 'dexie';
import { Library, MediaItem, MetadataCommon, MetadataBook } from '../types';

export class CleverFerretDB extends Dexie {
  libraries!: Table<Library>;
  mediaItems!: Table<MediaItem>;
  metadataCommon!: Table<MetadataCommon>;
  metadataBooks!: Table<MetadataBook>;
  downloads!: Table<{ id?: number; itemId: number; url: string; status: 'queued' | 'downloading' | 'completed' | 'failed'; bytesTotal?: number; bytesReceived?: number; createdAt: Date; updatedAt: Date }>; 

  constructor() {
    super('CleverFerretDB');

    this.version(4).stores({
      libraries: '++libraryId, name, type, path',
      mediaItems: '++itemId, libraryId, fileName, mediaType, filePath',
      metadataCommon: 'itemId, title, isFavorite, isDownloaded',
      metadataBooks: 'itemId, author, isbn, series',
      downloads: '++id, itemId, status',
    });
  }
}

export const db = new CleverFerretDB();

// Service layer - equivalent to Android DAOs
export class LibraryService {
  static async getAllLibraries(): Promise<Library[]> {
    return await db.libraries.toArray();
  }

  static async addLibrary(library: Omit<Library, 'libraryId'>): Promise<number> {
    const id = await db.libraries.add({
      ...library,
      dateCreated: new Date(),
      dateModified: new Date(),
    });
    return Number(id);
  }

  static async deleteLibrary(libraryId: number): Promise<void> {
    await db.transaction(
      'rw',
      [db.libraries, db.mediaItems, db.metadataCommon, db.metadataBooks],
      async () => {
        // Delete all related media items first
        const mediaItems = await db.mediaItems.where('libraryId').equals(libraryId).toArray();
        const itemIds = mediaItems.map((item) => item.itemId!);

        // Delete metadata for all items
        await db.metadataCommon.where('itemId').anyOf(itemIds).delete();
        await db.metadataBooks.where('itemId').anyOf(itemIds).delete();

        // Delete media items
        await db.mediaItems.where('libraryId').equals(libraryId).delete();

        // Finally delete the library
        await db.libraries.delete(libraryId);
      },
    );
  }
}

export class MediaItemService {
  static async getItemsByLibrary(libraryId: number): Promise<MediaItem[]> {
    return await db.mediaItems.where('libraryId').equals(libraryId).toArray();
  }

  static async addMediaItem(item: Omit<MediaItem, 'itemId'>): Promise<number> {
    const id = await db.mediaItems.add({
      ...item,
      fileSize: item.fileSize ?? 0,
      mimeType: item.mimeType ?? 'application/octet-stream',
      dateAdded: new Date(),
      lastModified: new Date(),
    });
    return Number(id);
  }

  static async searchItems(query: string): Promise<MediaItem[]> {
    return await db.mediaItems
      .filter((item) => item.fileName.toLowerCase().includes(query.toLowerCase()))
      .toArray();
  }
}

export class MetadataService {
  static async getBookDetails(itemId: number) {
    const [mediaItem, metadataCommon, metadataBook] = await Promise.all([
      db.mediaItems.get(itemId),
      db.metadataCommon.get(itemId),
      db.metadataBooks.get(itemId),
    ]);

    return {
      mediaItem,
      metadataCommon,
      metadataBook,
    };
  }

  static async updateMetadata(itemId: number, metadata: Partial<MetadataCommon>): Promise<void> {
    await db.metadataCommon.update(itemId, metadata);
  }

  static async toggleFavorite(itemId: number): Promise<void> {
    const current = await db.metadataCommon.get(itemId);
    if (current) {
      await db.metadataCommon.update(itemId, { isFavorite: !current.isFavorite });
    }
  }
}

export class DownloadService {
  static async queueDownload(itemId: number, url: string) {
    const id = await db.downloads.add({
      itemId,
      url,
      status: 'queued',
      createdAt: new Date(),
      updatedAt: new Date(),
    });
    return Number(id);
  }

  static async setStatus(id: number, status: 'queued' | 'downloading' | 'completed' | 'failed', bytesReceived?: number, bytesTotal?: number) {
    await db.downloads.update(id, { status, bytesReceived, bytesTotal, updatedAt: new Date() });
  }

  static async listDownloads() {
    return await db.downloads.orderBy('createdAt').reverse().toArray();
  }
}
