/**
 * Bookmark Repository
 * 
 * Repository for bookmark operations.
 */

import { db } from '../../services/database-complete';
import type { Bookmark } from '../local/entity';

export class BookmarkRepository {
  /**
   * Get all bookmarks for an item
   */
  async getBookmarksForItem(itemId: number): Promise<Bookmark[]> {
    const items = await db.bookmarks
      .where('itemId')
      .equals(itemId)
      .and(b => b.isActive === true)
      .sortBy('dateCreated');
    return items.reverse();
  }

  /**
   * Get bookmark by ID
   */
  async getBookmarkById(bookmarkId: number): Promise<Bookmark | undefined> {
    return db.bookmarks.get(bookmarkId);
  }

  /**
   * Create bookmark
   */
  async createBookmark(bookmark: Omit<Bookmark, 'bookmarkId'>): Promise<number> {
    const newBookmark: Bookmark = {
      ...bookmark,
      bookmarkId: 0,
      isActive: true,
      dateCreated: Date.now(),
      lastAccessed: undefined,
    };

    return db.bookmarks.add(newBookmark);
  }

  /**
   * Update bookmark
   */
  async updateBookmark(bookmark: Bookmark): Promise<void> {
    await db.bookmarks.update(bookmark.bookmarkId, bookmark);
  }

  /**
   * Delete bookmark
   */
  async deleteBookmark(bookmarkId: number): Promise<void> {
    await db.bookmarks.delete(bookmarkId);
  }

  /**
   * Get resume bookmark for item (most recent AUTO bookmark)
   */
  async getResumeBookmark(itemId: number): Promise<Bookmark | undefined> {
    return db.bookmarks
      .where('itemId')
      .equals(itemId)
      .and(b => b.bookmarkType === 'AUTO' && b.isActive === true)
      .last();
  }

  /**
   * Update or create resume bookmark
   */
  async updateResumeBookmark(
    itemId: number,
    position: number,
    page?: number,
    chapter?: string,
    percentage?: number
  ): Promise<void> {
    const existing = await this.getResumeBookmark(itemId);

    if (existing) {
      await db.bookmarks.update(existing.bookmarkId, {
        position,
        page,
        chapter,
        percentage: percentage || 0,
        dateCreated: Date.now(), // Update timestamp
      });
    } else {
      await this.createBookmark({
        itemId,
        title: 'Auto Resume',
        description: undefined,
        position,
        page,
        chapter,
        percentage: percentage || 0,
        contextBefore: undefined,
        contextAfter: undefined,
        screenCapture: undefined,
        bookmarkType: 'AUTO',
      });
    }
  }

  /**
   * Get all active bookmarks
   */
  async getAllActiveBookmarks(): Promise<Bookmark[]> {
    return db.bookmarks.where('isActive').equals(true).toArray();
  }

  /**
   * Deactivate bookmark (soft delete)
   */
  async deactivateBookmark(bookmarkId: number): Promise<void> {
    await db.bookmarks.update(bookmarkId, { isActive: false });
  }

  /**
   * Get bookmark count for item
   */
  async getBookmarkCountForItem(itemId: number): Promise<number> {
    return db.bookmarks
      .where('itemId')
      .equals(itemId)
      .and(b => b.isActive === true)
      .count();
  }
}

// Export singleton instance
export const bookmarkRepository = new BookmarkRepository();
