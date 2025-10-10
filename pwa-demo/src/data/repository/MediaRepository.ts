/**
 * Media Repository
 * 
 * Repository for media item and metadata operations.
 * Migrated from MediaRepository.kt
 */

import { db } from '../../services/database-complete';
import type { MediaItem, MetadataCommon } from '../local/entity';

export class MediaRepository {
  /**
   * Get media items by library
   */
  async getMediaItemsByLibrary(libraryId: number): Promise<MediaItem[]> {
    return db.mediaItems
      .where('libraryId')
      .equals(libraryId)
      .toArray();
  }

  /**
   * Get media item by ID
   */
  async getMediaItemById(itemId: number): Promise<MediaItem | undefined> {
    return db.mediaItems.get(itemId);
  }

  /**
   * Get media item by file path
   */
  async getMediaItemByPath(filePath: string): Promise<MediaItem | undefined> {
    return db.mediaItems.where('filePath').equals(filePath).first();
  }

  /**
   * Get media items by type
   */
  async getMediaItemsByType(mediaType: string): Promise<MediaItem[]> {
    return db.mediaItems
      .where('mediaType')
      .equals(mediaType)
      .toArray();
  }

  /**
   * Create new media item
   */
  async createMediaItem(mediaItem: Omit<MediaItem, 'itemId'>): Promise<number> {
    const newItem: MediaItem = {
      ...mediaItem,
      itemId: 0, // Will be auto-generated
      dateAdded: Date.now(),
      lastScanned: Date.now(),
      isAvailable: true,
      hasMetadata: false,
      hasThumbnail: false,
    };
    return db.mediaItems.add(newItem);
  }

  /**
   * Update media item
   */
  async updateMediaItem(mediaItem: MediaItem): Promise<void> {
    await db.mediaItems.update(mediaItem.itemId, {
      ...mediaItem,
      lastScanned: Date.now(),
    });
  }

  /**
   * Delete media item
   */
  async deleteMediaItem(mediaItem: MediaItem): Promise<void> {
    await db.mediaItems.delete(mediaItem.itemId);
  }

  /**
   * Search media items
   */
  async searchMediaItems(query: string, limit: number = 50): Promise<MediaItem[]> {
    const lowerQuery = query.toLowerCase();
    return db.mediaItems
      .filter(item => 
        item.fileName.toLowerCase().includes(lowerQuery) ||
        item.filePath.toLowerCase().includes(lowerQuery)
      )
      .limit(limit)
      .toArray();
  }

  /**
   * Get common metadata for item
   */
  async getCommonMetadata(itemId: number): Promise<MetadataCommon | undefined> {
    return db.metadataCommon.get(itemId);
  }

  /**
   * Save common metadata
   */
  async saveCommonMetadata(metadata: MetadataCommon): Promise<void> {
    await db.metadataCommon.put(metadata);
  }

  /**
   * Update common metadata fields
   */
  async updateCommonMetadata(
    itemId: number,
    title: string,
    summary?: string
  ): Promise<void> {
    await db.metadataCommon.update(itemId, {
      title,
      summary,
      lastUpdated: Date.now(),
    });
  }

  /**
   * Search metadata by title
   */
  async searchByTitle(query: string, limit: number = 50): Promise<MetadataCommon[]> {
    const lowerQuery = query.toLowerCase();
    return db.metadataCommon
      .filter(meta => 
        meta.title.toLowerCase().includes(lowerQuery)
      )
      .limit(limit)
      .toArray();
  }

  /**
   * Create multiple media items
   */
  async createMediaItems(mediaItems: Array<Omit<MediaItem, 'itemId'>>): Promise<number[]> {
    const items: MediaItem[] = mediaItems.map(item => ({
      ...item,
      itemId: 0,
      dateAdded: Date.now(),
      lastScanned: Date.now(),
      isAvailable: true,
      hasMetadata: false,
      hasThumbnail: false,
    }));
    
    return db.mediaItems.bulkAdd(items, { allKeys: true }) as Promise<number[]>;
  }

  /**
   * Get media item with its metadata
   */
  async getMediaItemWithMetadata(
    itemId: number
  ): Promise<{ mediaItem?: MediaItem; metadata?: MetadataCommon }> {
    const [mediaItem, metadata] = await Promise.all([
      this.getMediaItemById(itemId),
      this.getCommonMetadata(itemId),
    ]);

    return { mediaItem, metadata };
  }

  /**
   * Get item count by library
   */
  async getItemCountByLibrary(libraryId: number): Promise<number> {
    return db.mediaItems.where('libraryId').equals(libraryId).count();
  }

  /**
   * Get item count by type
   */
  async getItemCountByType(mediaType: string): Promise<number> {
    return db.mediaItems.where('mediaType').equals(mediaType).count();
  }

  /**
   * Get recent media items
   */
  async getRecentMediaItems(limit: number = 20): Promise<MediaItem[]> {
    return db.mediaItems
      .orderBy('dateAdded')
      .reverse()
      .limit(limit)
      .toArray();
  }

  /**
   * Get items without metadata
   */
  async getItemsWithoutMetadata(libraryId?: number): Promise<MediaItem[]> {
    let query = db.mediaItems.where('hasMetadata').equals(0);
    
    if (libraryId !== undefined) {
      const items = await query.toArray();
      return items.filter(item => item.libraryId === libraryId);
    }
    
    return query.toArray();
  }

  /**
   * Mark item as having metadata
   */
  async markHasMetadata(itemId: number, hasMetadata: boolean = true): Promise<void> {
    await db.mediaItems.update(itemId, { hasMetadata });
  }

  /**
   * Update thumbnail path
   */
  async updateThumbnail(itemId: number, thumbnailPath: string): Promise<void> {
    await db.mediaItems.update(itemId, {
      thumbnailPath,
      hasThumbnail: true,
    });
  }
}

// Export singleton instance
export const mediaRepository = new MediaRepository();
