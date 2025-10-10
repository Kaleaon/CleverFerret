/**
 * Search Repository
 * 
 * Repository for search and filter operations.
 * Migrated from SearchRepository.kt
 */

import { db } from '../../services/database-complete';
import type { MediaItem, MetadataCommon } from '../local/entity';

export class SearchRepository {
  /**
   * Search media items with filters
   */
  async searchMedia(options: SearchOptions): Promise<MediaItemWithMetadata[]> {
    const {
      query = '',
      mediaTypes = [],
      minRating,
      maxRating,
      yearFrom,
      yearTo,
      hasMetadata,
      libraryId,
    } = options;

    // Get items filtered by library if specified
    let items: MediaItem[];
    if (libraryId !== undefined) {
      items = await db.mediaItems.where('libraryId').equals(libraryId).toArray();
    } else {
      items = await db.mediaItems.toArray();
    }

    // Filter by media type
    if (mediaTypes.length > 0) {
      items = items.filter(item =>
        mediaTypes.some(type => type.toLowerCase() === item.mediaType.toLowerCase())
      );
    }

    // Filter by metadata availability
    if (hasMetadata !== undefined) {
      items = items.filter(item => item.hasMetadata === hasMetadata);
    }

    // Search in filename and path
    if (query.trim()) {
      const lowerQuery = query.toLowerCase();
      items = items.filter(
        item =>
          item.fileName.toLowerCase().includes(lowerQuery) ||
          item.filePath.toLowerCase().includes(lowerQuery)
      );
    }

    // Get metadata and apply additional filters
    const results: MediaItemWithMetadata[] = [];

    for (const item of items) {
      const metadata = await db.metadataCommon.get(item.itemId);

      // Additional search in metadata
      if (query.trim() && metadata) {
        const lowerQuery = query.toLowerCase();
        const matchesMetadata =
          metadata.title?.toLowerCase().includes(lowerQuery) ||
          metadata.summary?.toLowerCase().includes(lowerQuery) ||
          metadata.originalTitle?.toLowerCase().includes(lowerQuery);

        if (!matchesMetadata) continue;
      }

      // Apply rating filter
      if (minRating !== undefined || maxRating !== undefined) {
        const rating = metadata?.rating || metadata?.userRating;
        if (rating === undefined) continue;
        if (minRating !== undefined && rating < minRating) continue;
        if (maxRating !== undefined && rating > maxRating) continue;
      }

      // Apply year filter
      if (yearFrom !== undefined || yearTo !== undefined) {
        const year = metadata?.year;
        if (year === undefined) continue;
        if (yearFrom !== undefined && year < yearFrom) continue;
        if (yearTo !== undefined && year > yearTo) continue;
      }

      results.push({
        mediaItem: item,
        metadata: metadata || null,
      });
    }

    return results;
  }

  /**
   * Get search suggestions based on partial query
   */
  async getSearchSuggestions(query: string, limit: number = 10): Promise<string[]> {
    if (!query.trim()) return [];

    const lowerQuery = query.toLowerCase();
    const suggestions = new Set<string>();

    // Get filename suggestions
    const items = await db.mediaItems
      .filter(item => item.fileName.toLowerCase().includes(lowerQuery))
      .limit(limit)
      .toArray();

    items.forEach(item => {
      suggestions.add(item.fileName.replace(/\.[^/.]+$/, '')); // Remove extension
    });

    // Get metadata title suggestions
    const metadata = await db.metadataCommon
      .filter(meta => meta.title.toLowerCase().includes(lowerQuery))
      .limit(limit)
      .toArray();

    metadata.forEach(meta => {
      suggestions.add(meta.title);
    });

    return Array.from(suggestions).slice(0, limit);
  }

  /**
   * Get available filter options based on current library
   */
  async getAvailableFilters(libraryId?: number): Promise<FilterOptions> {
    let items: MediaItem[];
    if (libraryId !== undefined) {
      items = await db.mediaItems.where('libraryId').equals(libraryId).toArray();
    } else {
      items = await db.mediaItems.toArray();
    }

    const mediaTypes = Array.from(
      new Set(items.map(item => item.mediaType))
    ).sort();

    // Get years from metadata
    const metadataIds = items.map(item => item.itemId);
    const metadataList = await db.metadataCommon.bulkGet(metadataIds);
    const years = metadataList
      .filter((m): m is MetadataCommon => m !== undefined && m.year !== undefined)
      .map(m => m.year!);

    const uniqueYears = Array.from(new Set(years)).sort((a, b) => a - b);

    // Get ratings
    const ratings = metadataList
      .filter((m): m is MetadataCommon => m !== undefined)
      .map(m => m.rating || m.userRating)
      .filter((r): r is number => r !== undefined);

    const uniqueRatings = Array.from(new Set(ratings)).sort((a, b) => a - b);

    return {
      availableMediaTypes: mediaTypes,
      yearRange:
        uniqueYears.length > 0
          ? [uniqueYears[0], uniqueYears[uniqueYears.length - 1]]
          : undefined,
      ratingRange:
        uniqueRatings.length > 0
          ? [uniqueRatings[0], uniqueRatings[uniqueRatings.length - 1]]
          : undefined,
      totalItems: items.length,
      itemsWithMetadata: items.filter(i => i.hasMetadata).length,
      itemsWithoutMetadata: items.filter(i => !i.hasMetadata).length,
    };
  }

  /**
   * Get recent searches from localStorage
   */
  async getRecentSearches(): Promise<string[]> {
    const stored = localStorage.getItem('recentSearches');
    return stored ? JSON.parse(stored) : [];
  }

  /**
   * Save a search query to recent searches
   */
  async saveRecentSearch(query: string): Promise<void> {
    const recent = await this.getRecentSearches();
    const updated = [query, ...recent.filter(q => q !== query)].slice(0, 10);
    localStorage.setItem('recentSearches', JSON.stringify(updated));
  }

  /**
   * Clear recent searches
   */
  async clearRecentSearches(): Promise<void> {
    localStorage.removeItem('recentSearches');
  }
}

/**
 * Media item with metadata combined
 */
export interface MediaItemWithMetadata {
  mediaItem: MediaItem;
  metadata: MetadataCommon | null;
}

/**
 * Search options
 */
export interface SearchOptions {
  query?: string;
  mediaTypes?: string[];
  minRating?: number;
  maxRating?: number;
  yearFrom?: number;
  yearTo?: number;
  hasMetadata?: boolean;
  libraryId?: number;
}

/**
 * Available filter options
 */
export interface FilterOptions {
  availableMediaTypes: string[];
  yearRange?: [number, number];
  ratingRange?: [number, number];
  totalItems: number;
  itemsWithMetadata: number;
  itemsWithoutMetadata: number;
}

// Export singleton instance
export const searchRepository = new SearchRepository();
