/**
 * Thumbnail Service
 * 
 * Generates and regenerates thumbnails for media items
 */

import { logger } from '../logging';
import { generateCoverDataURL, hashStringToColorScheme } from '../../utils/coverGenerator';
import type { MediaItem } from '../../data/local/entity';

export interface ThumbnailOptions {
  width?: number;
  height?: number;
  quality?: number;
}

class ThumbnailService {
  /**
   * Generate thumbnail for a media item
   */
  async generateThumbnail(
    item: MediaItem,
    options: ThumbnailOptions = {}
  ): Promise<string> {
    const { width = 300, height = 450, quality = 0.8 } = options;

    logger.info('ThumbnailService', `Generating thumbnail for: ${item.fileName}`);

    try {
      // Try to extract thumbnail from file
      if (item.mediaType === 'BOOK') {
        const thumbnail = await this.extractBookThumbnail(item);
        if (thumbnail) {
          return thumbnail;
        }
      }

      // Fallback to generated cover
      return this.generateCoverThumbnail(item, width, height);
    } catch (error) {
      logger.warn('ThumbnailService', 'Failed to generate thumbnail, using fallback', undefined, error as Error);
      return this.generateCoverThumbnail(item, width, height);
    }
  }

  /**
   * Extract thumbnail from book file (EPUB)
   */
  private async extractBookThumbnail(item: MediaItem): Promise<string | null> {
    try {
      if (!item.fileData) return null;

      // Use epub.js to extract cover
      const { epubReaderService } = await import('../readers/EPUBReaderService');
      const file = new Blob([item.fileData], { type: 'application/epub+zip' });
      const book = await epubReaderService.loadEPUB(file);
      
      if (book.coverUrl) {
        return book.coverUrl;
      }

      return null;
    } catch (error) {
      logger.debug('ThumbnailService', 'Could not extract book thumbnail', { error });
      return null;
    }
  }

  /**
   * Generate cover thumbnail using cover generator
   */
  private generateCoverThumbnail(item: MediaItem, width: number, height: number): string {
    const colorScheme = hashStringToColorScheme(item.fileName);
    
    // Determine media type for icon
    let mediaType: 'BOOK' | 'MOVIE' | 'MUSIC' | 'PODCAST' | 'MAGAZINE' | 'DOCUMENT' = 'BOOK';
    if (item.mediaType === 'MOVIE' || item.mediaType === 'VIDEO') {
      mediaType = 'MOVIE';
    } else if (item.mediaType === 'MUSIC' || item.mediaType === 'AUDIO') {
      mediaType = 'MUSIC';
    } else if (item.mediaType === 'PODCAST') {
      mediaType = 'PODCAST';
    } else if (item.mediaType === 'MAGAZINE') {
      mediaType = 'MAGAZINE';
    } else if (item.mediaType === 'DOCUMENT') {
      mediaType = 'DOCUMENT';
    }

    return generateCoverDataURL({
      title: item.fileName,
      author: item.metadata?.authors?.[0] || undefined,
      mediaType,
      colorScheme,
      width,
      height,
    });
  }

  /**
   * Regenerate thumbnail for an item
   */
  async regenerateThumbnail(item: MediaItem, options?: ThumbnailOptions): Promise<string> {
    logger.info('ThumbnailService', `Regenerating thumbnail for: ${item.fileName}`);
    return this.generateThumbnail(item, options);
  }

  /**
   * Batch regenerate thumbnails
   */
  async regenerateThumbnails(
    items: MediaItem[],
    options?: ThumbnailOptions,
    onProgress?: (current: number, total: number) => void
  ): Promise<Map<number, string>> {
    const results = new Map<number, string>();
    
    for (let i = 0; i < items.length; i++) {
      const item = items[i];
      try {
        const thumbnail = await this.generateThumbnail(item, options);
        results.set(item.itemId, thumbnail);
        onProgress?.(i + 1, items.length);
      } catch (error) {
        logger.error('ThumbnailService', `Failed to regenerate thumbnail for ${item.fileName}`, undefined, error as Error);
      }
    }

    return results;
  }
}

export const thumbnailService = new ThumbnailService();
