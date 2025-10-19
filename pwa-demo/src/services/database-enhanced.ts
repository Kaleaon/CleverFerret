// Enhanced Database Service with full Android parity
// Provides IndexedDB wrapper with advanced features matching Android Room database

import Dexie, { Table } from 'dexie';
import { MediaItem, Library, ReadingProgress, Bookmark, Collection, UserProfile, ReadingSession } from '../types-enhanced';

// Enhanced Database Schema
export interface CleverFerretDB extends Dexie {
  // Core tables
  mediaItems: Table<MediaItem>;
  libraries: Table<Library>;
  readingProgress: Table<ReadingProgress>;
  bookmarks: Table<Bookmark>;
  collections: Table<Collection>;
  readingSessions: Table<ReadingSession>;
  
  // User and settings
  userProfiles: Table<UserProfile>;
  appSettings: Table<{ id: string; key: string; value: any }>;
  
  // Sync and offline support
  syncQueue: Table<{ id: string; action: string; data: any; timestamp: number; synced: boolean }>;
  offlineActions: Table<{ id: string; type: string; payload: any; timestamp: number }>;
  
  // Cache and performance
  metadataCache: Table<{ id: string; mediaItemId: string; provider: string; data: any; expires: number }>;
  thumbnailCache: Table<{ id: string; mediaItemId: string; url: string; blob: Blob; size: number }>;
  
  // Advanced features
  searchIndex: Table<{ id: string; mediaItemId: string; searchText: string; type: string }>;
  tags: Table<{ id: string; name: string; color: string; count: number }>;
  series: Table<{ id: string; name: string; mediaType: string; itemIds: string[] }>;
  authors: Table<{ id: string; name: string; mediaItemIds: string[]; bio?: string; imageUrl?: string }>;
  publishers: Table<{ id: string; name: string; mediaItemIds: string[]; website?: string }>;
}

class EnhancedDatabaseService {
  private db: CleverFerretDB;
  private isInitialized = false;
  private syncInProgress = false;

  constructor() {
    this.db = new Dexie('CleverFerretEnhancedDB') as CleverFerretDB;
    this.defineSchema();
  }

  private defineSchema() {
    this.db.version(1).stores({
      // Core entities
      mediaItems: '++id, type, title, authors, artists, directors, genres, status, dateAdded, lastRead, rating, series',
      libraries: '++id, name, type, path, itemCount, lastScanned',
      readingProgress: '++id, mediaItemId, userId, percentage, currentPosition, lastRead',
      bookmarks: '++id, mediaItemId, position, title, createdAt',
      collections: '++id, name, mediaItemIds, tags, createdAt, updatedAt',
      readingSessions: '++id, mediaItemId, startTime, endTime, duration, pagesRead',
      
      // User and settings
      userProfiles: '++id, name, email',
      appSettings: '++id, key',
      
      // Sync and offline
      syncQueue: '++id, action, timestamp, synced',
      offlineActions: '++id, type, timestamp',
      
      // Cache
      metadataCache: '++id, mediaItemId, provider, expires',
      thumbnailCache: '++id, mediaItemId, size',
      
      // Advanced features
      searchIndex: '++id, mediaItemId, searchText, type',
      tags: '++id, name, count',
      series: '++id, name, mediaType',
      authors: '++id, name',
      publishers: '++id, name'
    });

    // Add hooks for automatic indexing and validation
    this.db.mediaItems.hook('creating', (primKey, obj, trans) => {
      this.updateSearchIndex(obj);
      this.updateRelatedEntities(obj);
    });

    this.db.mediaItems.hook('updating', (modifications, primKey, obj, trans) => {
      this.updateSearchIndex(obj);
      this.updateRelatedEntities(obj);
    });

    this.db.mediaItems.hook('deleting', (primKey, obj, trans) => {
      this.cleanupRelatedEntities(obj);
    });
  }

  async initialize(): Promise<void> {
    if (this.isInitialized) return;

    try {
      await this.db.open();
      
      // Create default user profile if none exists
      const profiles = await this.db.userProfiles.count();
      if (profiles === 0) {
        await this.createDefaultUserProfile();
      }

      // Initialize default settings
      await this.initializeDefaultSettings();
      
      // Clean expired cache entries
      await this.cleanExpiredCache();
      
      this.isInitialized = true;
      console.log('Enhanced Database Service initialized successfully');
    } catch (error) {
      console.error('Failed to initialize Enhanced Database Service:', error);
      throw error;
    }
  }

  // Media Items Management with advanced features
  async addMediaItem(item: Omit<MediaItem, 'id'>): Promise<string> {
    const id = await this.db.mediaItems.add({
      ...item,
      id: `item-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`
    } as MediaItem);
    
    // Add to sync queue
    await this.addToSyncQueue('CREATE_MEDIA_ITEM', { id, ...item });
    
    return id.toString();
  }

  async updateMediaItem(id: string, updates: Partial<MediaItem>): Promise<void> {
    await this.db.mediaItems.update(id, updates);
    await this.addToSyncQueue('UPDATE_MEDIA_ITEM', { id, updates });
  }

  async deleteMediaItem(id: string): Promise<void> {
    const item = await this.db.mediaItems.get(id);
    if (item) {
      await this.db.mediaItems.delete(id);
      await this.addToSyncQueue('DELETE_MEDIA_ITEM', { id });
    }
  }

  async getMediaItem(id: string): Promise<MediaItem | undefined> {
    return await this.db.mediaItems.get(id);
  }

  async getAllMediaItems(): Promise<MediaItem[]> {
    return await this.db.mediaItems.orderBy('dateAdded').reverse().toArray();
  }

  async getMediaItemsByType(type: string): Promise<MediaItem[]> {
    return await this.db.mediaItems.where('type').equals(type).toArray();
  }

  async getMediaItemsByStatus(status: string): Promise<MediaItem[]> {
    return await this.db.mediaItems.where('status').equals(status).toArray();
  }

  async searchMediaItems(query: string): Promise<MediaItem[]> {
    const searchResults = await this.db.searchIndex
      .where('searchText')
      .startsWithIgnoreCase(query.toLowerCase())
      .toArray();
    
    const mediaItemIds = searchResults.map(result => result.mediaItemId);
    return await this.db.mediaItems.where('id').anyOf(mediaItemIds).toArray();
  }

  // Advanced search with filters
  async advancedSearch(options: {
    query?: string;
    types?: string[];
    genres?: string[];
    authors?: string[];
    status?: string[];
    rating?: { min: number; max: number };
    dateRange?: { start: Date; end: Date };
  }): Promise<MediaItem[]> {
    let collection = this.db.mediaItems.toCollection();

    if (options.types && options.types.length > 0) {
      collection = collection.and(item => options.types!.includes(item.type));
    }

    if (options.status && options.status.length > 0) {
      collection = collection.and(item => options.status!.includes(item.status));
    }

    if (options.rating) {
      collection = collection.and(item => {
        const rating = item.rating || 0;
        return rating >= options.rating!.min && rating <= options.rating!.max;
      });
    }

    if (options.dateRange) {
      collection = collection.and(item => {
        const date = new Date(item.dateAdded);
        return date >= options.dateRange!.start && date <= options.dateRange!.end;
      });
    }

    let results = await collection.toArray();

    // Apply text search if provided
    if (options.query) {
      const query = options.query.toLowerCase();
      results = results.filter(item =>
        item.title.toLowerCase().includes(query) ||
        item.authors?.some(author => author.toLowerCase().includes(query)) ||
        item.artists?.some(artist => artist.toLowerCase().includes(query)) ||
        item.directors?.some(director => director.toLowerCase().includes(query)) ||
        item.genres?.some(genre => genre.toLowerCase().includes(query))
      );
    }

    return results;
  }

  // Reading Progress Management
  async updateReadingProgress(progress: Omit<ReadingProgress, 'id'>): Promise<void> {
    const existing = await this.db.readingProgress
      .where('mediaItemId')
      .equals(progress.mediaItemId)
      .first();

    if (existing) {
      await this.db.readingProgress.update(existing.id, {
        ...progress,
        lastRead: new Date().toISOString()
      });
    } else {
      await this.db.readingProgress.add({
        ...progress,
        id: `progress-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`,
        lastRead: new Date().toISOString(),
        bookmarks: []
      });
    }

    await this.addToSyncQueue('UPDATE_READING_PROGRESS', progress);
  }

  async getReadingProgress(mediaItemId: string): Promise<ReadingProgress | undefined> {
    return await this.db.readingProgress.where('mediaItemId').equals(mediaItemId).first();
  }

  async getAllReadingProgress(): Promise<ReadingProgress[]> {
    return await this.db.readingProgress.orderBy('lastRead').reverse().toArray();
  }

  // Bookmarks Management
  async addBookmark(bookmark: Omit<Bookmark, 'id'>): Promise<void> {
    await this.db.bookmarks.add({
      ...bookmark,
      id: `bookmark-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`,
      createdAt: new Date().toISOString()
    });
  }

  async getBookmarks(mediaItemId: string): Promise<Bookmark[]> {
    return await this.db.bookmarks.where('mediaItemId').equals(mediaItemId).toArray();
  }

  async deleteBookmark(id: string): Promise<void> {
    await this.db.bookmarks.delete(id);
  }

  // Collections Management
  async createCollection(collection: Omit<Collection, 'id' | 'createdAt' | 'updatedAt'>): Promise<string> {
    const now = new Date().toISOString();
    const id = await this.db.collections.add({
      ...collection,
      id: `collection-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`,
      createdAt: now,
      updatedAt: now
    } as Collection);
    
    return id.toString();
  }

  async updateCollection(id: string, updates: Partial<Collection>): Promise<void> {
    await this.db.collections.update(id, {
      ...updates,
      updatedAt: new Date().toISOString()
    });
  }

  async getAllCollections(): Promise<Collection[]> {
    return await this.db.collections.orderBy('name').toArray();
  }

  async getCollection(id: string): Promise<Collection | undefined> {
    return await this.db.collections.get(id);
  }

  // Libraries Management
  async createLibrary(library: Omit<Library, 'id'>): Promise<string> {
    const id = await this.db.libraries.add({
      ...library,
      id: `library-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`,
      itemCount: 0,
      totalSize: 0,
      autoScan: true,
      cloudSync: false,
      encryptionEnabled: false
    } as Library);
    
    return id.toString();
  }

  async getAllLibraries(): Promise<Library[]> {
    return await this.db.libraries.toArray();
  }

  // Statistics and Analytics
  async getMediaStats(): Promise<{
    totalItems: number;
    byType: Record<string, number>;
    byStatus: Record<string, number>;
    totalSize: number;
    averageRating: number;
  }> {
    const items = await this.getAllMediaItems();
    
    const byType: Record<string, number> = {};
    const byStatus: Record<string, number> = {};
    let totalSize = 0;
    let totalRatings = 0;
    let ratedItems = 0;

    items.forEach(item => {
      byType[item.type] = (byType[item.type] || 0) + 1;
      byStatus[item.status] = (byStatus[item.status] || 0) + 1;
      totalSize += item.fileSize || 0;
      
      if (item.rating && item.rating > 0) {
        totalRatings += item.rating;
        ratedItems++;
      }
    });

    return {
      totalItems: items.length,
      byType,
      byStatus,
      totalSize,
      averageRating: ratedItems > 0 ? totalRatings / ratedItems : 0
    };
  }

  async getReadingStats(userId?: string): Promise<{
    totalReadingTime: number;
    booksRead: number;
    currentStreak: number;
    longestStreak: number;
    sessionsThisWeek: ReadingSession[];
  }> {
    const sessions = await this.db.readingSessions.orderBy('startTime').toArray();
    const progress = await this.getAllReadingProgress();
    
    const totalReadingTime = sessions.reduce((total, session) => total + session.duration, 0);
    const booksRead = progress.filter(p => p.percentage >= 100).length;
    
    // Calculate streaks
    const now = new Date();
    const oneWeekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);
    const sessionsThisWeek = sessions.filter(s => new Date(s.startTime) >= oneWeekAgo);

    // Get unique reading days (normalized to start of day)
    const readingDays = [...new Set(sessions.map(s => {
      const date = new Date(s.startTime);
      return new Date(date.getFullYear(), date.getMonth(), date.getDate()).getTime();
    }))].sort((a, b) => b - a); // Sort descending (newest first)

    // Calculate current streak
    let currentStreak = 0;
    const today = new Date();
    const todayStart = new Date(today.getFullYear(), today.getMonth(), today.getDate()).getTime();
    const yesterday = todayStart - 24 * 60 * 60 * 1000;
    
    if (readingDays.length > 0) {
      const mostRecentDay = readingDays[0];
      // Current streak counts if read today or yesterday
      if (mostRecentDay === todayStart || mostRecentDay === yesterday) {
        currentStreak = 1;
        let expectedDay = mostRecentDay - 24 * 60 * 60 * 1000;
        
        for (let i = 1; i < readingDays.length; i++) {
          if (readingDays[i] === expectedDay) {
            currentStreak++;
            expectedDay -= 24 * 60 * 60 * 1000;
          } else {
            break;
          }
        }
      }
    }

    // Calculate longest streak
    let longestStreak = 0;
    let tempStreak = 1;
    
    for (let i = 1; i < readingDays.length; i++) {
      const dayDiff = (readingDays[i - 1] - readingDays[i]) / (24 * 60 * 60 * 1000);
      if (dayDiff === 1) {
        tempStreak++;
        longestStreak = Math.max(longestStreak, tempStreak);
      } else {
        longestStreak = Math.max(longestStreak, tempStreak);
        tempStreak = 1;
      }
    }
    longestStreak = Math.max(longestStreak, tempStreak, currentStreak);

    return {
      totalReadingTime,
      booksRead,
      currentStreak,
      longestStreak,
      sessionsThisWeek
    };
  }

  // Sync and Offline Support
  private async addToSyncQueue(action: string, data: any): Promise<void> {
    await this.db.syncQueue.add({
      id: `sync-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`,
      action,
      data,
      timestamp: Date.now(),
      synced: false
    });
  }

  async getPendingSyncItems(): Promise<Array<{ id: string; action: string; data: any; timestamp: number }>> {
    return await this.db.syncQueue.where('synced').equals(false).toArray();
  }

  async markSyncItemCompleted(id: string): Promise<void> {
    await this.db.syncQueue.update(id, { synced: true });
  }

  // Cache Management
  async cacheMetadata(mediaItemId: string, provider: string, data: any, expiresInHours = 24): Promise<void> {
    const expires = Date.now() + (expiresInHours * 60 * 60 * 1000);
    
    await this.db.metadataCache.put({
      id: `${mediaItemId}-${provider}`,
      mediaItemId,
      provider,
      data,
      expires
    });
  }

  async getCachedMetadata(mediaItemId: string, provider: string): Promise<any | null> {
    const cached = await this.db.metadataCache.get(`${mediaItemId}-${provider}`);
    
    if (cached && cached.expires > Date.now()) {
      return cached.data;
    }
    
    // Remove expired cache
    if (cached) {
      await this.db.metadataCache.delete(cached.id);
    }
    
    return null;
  }

  async cacheThumbnail(mediaItemId: string, url: string, blob: Blob): Promise<void> {
    await this.db.thumbnailCache.put({
      id: mediaItemId,
      mediaItemId,
      url,
      blob,
      size: blob.size
    });
  }

  async getCachedThumbnail(mediaItemId: string): Promise<{ url: string; blob: Blob } | null> {
    const cached = await this.db.thumbnailCache.get(mediaItemId);
    return cached ? { url: cached.url, blob: cached.blob } : null;
  }

  // Cleanup and Maintenance
  private async cleanExpiredCache(): Promise<void> {
    const now = Date.now();
    await this.db.metadataCache.where('expires').below(now).delete();
  }

  async clearAllCache(): Promise<void> {
    await Promise.all([
      this.db.metadataCache.clear(),
      this.db.thumbnailCache.clear()
    ]);
  }

  async exportData(): Promise<{
    mediaItems: MediaItem[];
    libraries: Library[];
    collections: Collection[];
    readingProgress: ReadingProgress[];
    bookmarks: Bookmark[];
  }> {
    const [mediaItems, libraries, collections, readingProgress, bookmarks] = await Promise.all([
      this.db.mediaItems.toArray(),
      this.db.libraries.toArray(),
      this.db.collections.toArray(),
      this.db.readingProgress.toArray(),
      this.db.bookmarks.toArray()
    ]);

    return {
      mediaItems,
      libraries,
      collections,
      readingProgress,
      bookmarks
    };
  }

  async importData(data: {
    mediaItems?: MediaItem[];
    libraries?: Library[];
    collections?: Collection[];
    readingProgress?: ReadingProgress[];
    bookmarks?: Bookmark[];
  }): Promise<void> {
    await this.db.transaction('rw', [
      this.db.mediaItems,
      this.db.libraries,
      this.db.collections,
      this.db.readingProgress,
      this.db.bookmarks
    ], async () => {
      if (data.mediaItems) await this.db.mediaItems.bulkPut(data.mediaItems);
      if (data.libraries) await this.db.libraries.bulkPut(data.libraries);
      if (data.collections) await this.db.collections.bulkPut(data.collections);
      if (data.readingProgress) await this.db.readingProgress.bulkPut(data.readingProgress);
      if (data.bookmarks) await this.db.bookmarks.bulkPut(data.bookmarks);
    });
  }

  // Private helper methods
  private async updateSearchIndex(item: MediaItem): Promise<void> {
    const searchTexts = [
      item.title,
      ...(item.authors || []),
      ...(item.artists || []),
      ...(item.directors || []),
      ...(item.genres || []),
      item.series,
      item.publisher
    ].filter(Boolean);

    const searchText = searchTexts.join(' ').toLowerCase();
    
    await this.db.searchIndex.put({
      id: `search-${item.id}`,
      mediaItemId: item.id,
      searchText,
      type: item.type
    });
  }

  private async updateRelatedEntities(item: MediaItem): Promise<void> {
    // Update authors
    if (item.authors) {
      for (const authorName of item.authors) {
        const existing = await this.db.authors.where('name').equals(authorName).first();
        if (existing) {
          if (!existing.mediaItemIds.includes(item.id)) {
            existing.mediaItemIds.push(item.id);
            await this.db.authors.update(existing.id, existing);
          }
        } else {
          await this.db.authors.add({
            id: `author-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`,
            name: authorName,
            mediaItemIds: [item.id]
          });
        }
      }
    }

    // Update series
    if (item.series) {
      const existing = await this.db.series.where('name').equals(item.series).first();
      if (existing) {
        if (!existing.itemIds.includes(item.id)) {
          existing.itemIds.push(item.id);
          await this.db.series.update(existing.id, existing);
        }
      } else {
        await this.db.series.add({
          id: `series-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`,
          name: item.series,
          mediaType: item.type,
          itemIds: [item.id]
        });
      }
    }
  }

  private async cleanupRelatedEntities(item: MediaItem): Promise<void> {
    // Remove from search index
    await this.db.searchIndex.where('mediaItemId').equals(item.id).delete();
    
    // Update authors
    if (item.authors) {
      for (const authorName of item.authors) {
        const author = await this.db.authors.where('name').equals(authorName).first();
        if (author) {
          author.mediaItemIds = author.mediaItemIds.filter(id => id !== item.id);
          if (author.mediaItemIds.length === 0) {
            await this.db.authors.delete(author.id);
          } else {
            await this.db.authors.update(author.id, author);
          }
        }
      }
    }

    // Clean up related data
    await Promise.all([
      this.db.readingProgress.where('mediaItemId').equals(item.id).delete(),
      this.db.bookmarks.where('mediaItemId').equals(item.id).delete(),
      this.db.metadataCache.where('mediaItemId').equals(item.id).delete(),
      this.db.thumbnailCache.where('mediaItemId').equals(item.id).delete()
    ]);
  }

  private async createDefaultUserProfile(): Promise<void> {
    await this.db.userProfiles.add({
      id: 'default-user',
      name: 'Reader',
      email: 'reader@cleverferret.local',
      preferences: {
        theme: 'Navy & Gold',
        language: 'en',
        autoBackup: true,
        cloudSync: false,
        readingPreferences: {
          fontSize: 16,
          fontFamily: 'serif',
          lineHeight: 1.6,
          theme: 'light',
          pageTransition: 'slide'
        },
        playbackPreferences: {
          autoPlay: false,
          repeatMode: 'none',
          shuffleEnabled: false,
          volume: 0.8
        },
        notifications: {
          newReleases: true,
          readingReminders: true,
          syncStatus: true
        }
      },
      stats: {
        totalBooks: 0,
        booksRead: 0,
        totalReadingTime: 0,
        currentStreak: 0,
        longestStreak: 0
      }
    });
  }

  private async initializeDefaultSettings(): Promise<void> {
    const defaultSettings = [
      { key: 'app.version', value: '2.0.0' },
      { key: 'app.firstRun', value: true },
      { key: 'sync.enabled', value: false },
      { key: 'cache.maxSize', value: 1024 * 1024 * 100 }, // 100MB
      { key: 'notifications.enabled', value: true }
    ];

    for (const setting of defaultSettings) {
      const existing = await this.db.appSettings.where('key').equals(setting.key).first();
      if (!existing) {
        await this.db.appSettings.add({
          id: `setting-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`,
          key: setting.key,
          value: setting.value
        });
      }
    }
  }

  // Public API for settings
  async getSetting(key: string): Promise<any> {
    const setting = await this.db.appSettings.where('key').equals(key).first();
    return setting ? setting.value : null;
  }

  async setSetting(key: string, value: any): Promise<void> {
    const existing = await this.db.appSettings.where('key').equals(key).first();
    if (existing) {
      await this.db.appSettings.update(existing.id, { value });
    } else {
      await this.db.appSettings.add({
        id: `setting-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`,
        key,
        value
      });
    }
  }
}

// Export singleton instance
export const enhancedDB = new EnhancedDatabaseService();
export { EnhancedDatabaseService };
export default enhancedDB;