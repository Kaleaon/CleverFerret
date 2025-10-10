/**
 * Collection Repository
 * 
 * Repository for unified collection operations.
 * Migrated from CollectionRepository.kt
 */

import { db } from '../../services/database-complete';
import type { UnifiedCollection, ItemCollection, MediaItem, CollectionType } from '../local/entity';

export class CollectionRepository {
  /**
   * Get all collections
   */
  async getCollections(): Promise<UnifiedCollection[]> {
    return db.unifiedCollections.orderBy('name').toArray();
  }

  /**
   * Get collection by ID
   */
  async getCollection(id: number): Promise<UnifiedCollection | undefined> {
    return db.unifiedCollections.get(id);
  }

  /**
   * Get items in collection
   */
  async getItemsInCollection(collectionId: number): Promise<MediaItem[]> {
    // Get item collection relationships
    const itemCollections = await db.itemCollections
      .where('collectionId')
      .equals(collectionId)
      .sortBy('sortOrder');

    // Get media items
    const itemIds = itemCollections.map(ic => ic.itemId);
    const items = await db.mediaItems.bulkGet(itemIds);

    return items.filter((item): item is MediaItem => item !== undefined);
  }

  /**
   * Create new collection
   */
  async createCollection(
    name: string,
    type: CollectionType,
    description?: string
  ): Promise<number> {
    const collection: UnifiedCollection = {
      collectionId: 0,
      name,
      type,
      description,
      coverArtPath: undefined,
      sortBy: 'CUSTOM' as any,
      sortOrder: 'ASCENDING' as any,
      isSmartCollection: false,
      smartQuery: undefined,
      isVisible: true,
      isPinned: false,
      createdAt: Date.now(),
      lastModified: Date.now(),
      externalId: undefined,
      itemCount: 0,
    };

    return db.unifiedCollections.add(collection);
  }

  /**
   * Add item to collection
   */
  async addItem(collectionId: number, itemId: number): Promise<void> {
    // Find next sort order
    const currentItems = await this.getItemsInCollection(collectionId);
    const nextOrder = currentItems.length;

    const itemCollection: ItemCollection = {
      itemId,
      collectionId,
      sortOrder: nextOrder,
      addedAt: Date.now(),
      addedBy: undefined,
      notes: undefined,
    };

    await db.itemCollections.add(itemCollection);

    // Update collection item count
    await this.updateItemCount(collectionId);
  }

  /**
   * Remove item from collection
   */
  async removeItem(collectionId: number, itemId: number): Promise<void> {
    await db.itemCollections
      .where('[collectionId+itemId]')
      .equals([collectionId, itemId])
      .delete();

    // Update collection item count
    await this.updateItemCount(collectionId);
  }

  /**
   * Reorder items in collection
   */
  async reorderItems(collectionId: number, orderedItemIds: number[]): Promise<void> {
    const updates = orderedItemIds.map(async (itemId, index) => {
      const itemCollection = await db.itemCollections
        .where('[collectionId+itemId]')
        .equals([collectionId, itemId])
        .first();

      if (itemCollection) {
        return db.itemCollections.update(
          [itemCollection.itemId, itemCollection.collectionId],
          { sortOrder: index }
        );
      }
    });

    await Promise.all(updates);

    // Update last modified
    await db.unifiedCollections.update(collectionId, {
      lastModified: Date.now(),
    });
  }

  /**
   * Delete collection
   */
  async deleteCollection(collectionId: number): Promise<void> {
    await db.unifiedCollections.delete(collectionId);
    // Item collections will be deleted by foreign key cascade
  }

  /**
   * Update collection
   */
  async updateCollection(collection: UnifiedCollection): Promise<void> {
    await db.unifiedCollections.update(collection.collectionId, {
      ...collection,
      lastModified: Date.now(),
    });
  }

  /**
   * Update collection item count
   */
  private async updateItemCount(collectionId: number): Promise<void> {
    const count = await db.itemCollections
      .where('collectionId')
      .equals(collectionId)
      .count();

    await db.unifiedCollections.update(collectionId, {
      itemCount: count,
      lastModified: Date.now(),
    });
  }

  /**
   * Check if item is in collection
   */
  async isItemInCollection(collectionId: number, itemId: number): Promise<boolean> {
    const itemCollection = await db.itemCollections
      .where('[collectionId+itemId]')
      .equals([collectionId, itemId])
      .first();

    return itemCollection !== undefined;
  }

  /**
   * Get collections containing item
   */
  async getCollectionsForItem(itemId: number): Promise<UnifiedCollection[]> {
    const itemCollections = await db.itemCollections
      .where('itemId')
      .equals(itemId)
      .toArray();

    const collectionIds = itemCollections.map(ic => ic.collectionId);
    const collections = await db.unifiedCollections.bulkGet(collectionIds);

    return collections.filter(
      (col): col is UnifiedCollection => col !== undefined
    );
  }

  /**
   * Get pinned collections
   */
  async getPinnedCollections(): Promise<UnifiedCollection[]> {
    return db.unifiedCollections
      .where('isPinned')
      .equals(1)
      .sortBy('name');
  }

  /**
   * Toggle collection pinned status
   */
  async togglePinned(collectionId: number): Promise<void> {
    const collection = await this.getCollection(collectionId);
    if (collection) {
      await db.unifiedCollections.update(collectionId, {
        isPinned: !collection.isPinned,
        lastModified: Date.now(),
      });
    }
  }
}

// Export singleton instance
export const collectionRepository = new CollectionRepository();
