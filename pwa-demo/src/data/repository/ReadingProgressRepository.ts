/**
 * Reading Progress Repository
 * 
 * Repository for reading progress tracking operations.
 * Migrated from ReadingProgressRepository.kt
 */

import { db } from '../../services/database-complete';
import type { ReadingProgress } from '../local/entity';

export class ReadingProgressRepository {
  /**
   * Get progress for an item
   */
  async getProgress(itemId: number): Promise<ReadingProgress | undefined> {
    return db.readingProgress.where('itemId').equals(itemId).first();
  }

  /**
   * Get recently read items
   */
  async getRecentlyRead(limit: number = 10): Promise<ReadingProgress[]> {
    return db.readingProgress
      .orderBy('lastUpdate')
      .reverse()
      .limit(limit)
      .toArray();
  }

  /**
   * Get completed items
   */
  async getCompleted(): Promise<ReadingProgress[]> {
    return db.readingProgress
      .where('isCompleted')
      .equals(1)
      .reverse()
      .sortBy('completedDate');
  }

  /**
   * Update reading progress
   */
  async updateProgress(
    itemId: number,
    currentPage: number,
    percentage: number,
    currentPosition: number = 0,
    currentChapter: number = 1
  ): Promise<void> {
    const existing = await this.getProgress(itemId);
    const isCompleted = percentage >= 1.0;

    const updated: ReadingProgress = {
      progressId: existing?.progressId || 0,
      itemId,
      currentPage,
      currentChapter,
      currentPosition,
      percentage,
      totalReadingTime: existing?.totalReadingTime || 0,
      sessionCount: existing?.sessionCount || 0,
      averageSessionTime: existing?.averageSessionTime || 0,
      isCompleted,
      completedDate: isCompleted ? Date.now() : existing?.completedDate,
      startedDate: existing?.startedDate || Date.now(),
      lastUpdate: Date.now(),
      pagesRead: existing?.pagesRead || 0,
      chaptersRead: existing?.chaptersRead || 0,
      readingSpeed: existing?.readingSpeed,
      locator: existing?.locator,
      notes: existing?.notes,
    };

    await db.readingProgress.put(updated);
  }

  /**
   * Mark item as read
   */
  async markAsRead(itemId: number): Promise<void> {
    await db.readingProgress.update(itemId, {
      isCompleted: true,
      percentage: 1.0,
      completedDate: Date.now(),
      lastUpdate: Date.now(),
    });
  }

  /**
   * Mark item as unread (delete progress)
   */
  async markAsUnread(itemId: number): Promise<void> {
    await db.readingProgress.where('itemId').equals(itemId).delete();
  }

  /**
   * Delete progress
   */
  async deleteProgress(itemId: number): Promise<void> {
    await db.readingProgress.where('itemId').equals(itemId).delete();
  }

  /**
   * Update reading statistics
   */
  async updateReadingStats(
    itemId: number,
    sessionDuration: number,
    pagesRead: number,
    chaptersRead: number
  ): Promise<void> {
    const existing = await this.getProgress(itemId);
    if (!existing) return;

    const newSessionCount = existing.sessionCount + 1;
    const newTotalTime = existing.totalReadingTime + sessionDuration;
    const newAverageTime = newTotalTime / newSessionCount;

    await db.readingProgress.update(existing.progressId, {
      totalReadingTime: newTotalTime,
      sessionCount: newSessionCount,
      averageSessionTime: newAverageTime,
      pagesRead: existing.pagesRead + pagesRead,
      chaptersRead: existing.chaptersRead + chaptersRead,
      lastUpdate: Date.now(),
    });
  }

  /**
   * Get reading statistics summary
   */
  async getReadingStats(): Promise<ReadingStats> {
    const allProgress = await db.readingProgress.toArray();
    const completed = allProgress.filter(p => p.isCompleted);
    const inProgress = allProgress.filter(p => !p.isCompleted && p.percentage > 0);

    const totalReadingTime = allProgress.reduce(
      (sum, p) => sum + p.totalReadingTime,
      0
    );
    const totalPages = allProgress.reduce((sum, p) => sum + p.pagesRead, 0);

    return {
      totalBooks: allProgress.length,
      completedBooks: completed.length,
      inProgressBooks: inProgress.length,
      totalReadingTime,
      totalPages,
      averageProgress:
        allProgress.length > 0
          ? allProgress.reduce((sum, p) => sum + p.percentage, 0) / allProgress.length
          : 0,
    };
  }
}

/**
 * Reading statistics interface
 */
export interface ReadingStats {
  totalBooks: number;
  completedBooks: number;
  inProgressBooks: number;
  totalReadingTime: number;
  totalPages: number;
  averageProgress: number;
}

// Export singleton instance
export const readingProgressRepository = new ReadingProgressRepository();
