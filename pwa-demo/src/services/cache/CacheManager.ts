/**
 * Cache Manager
 *
 * Manages caching of images, metadata, and other resources using Cache API.
 * Migrated from CacheManager.kt
 */

export class CacheManager {
  private readonly MAX_CACHE_SIZE = 100 * 1024 * 1024; // 100MB
  private readonly CACHE_EXPIRY = 7 * 24 * 60 * 60 * 1000; // 7 days
  private readonly IMAGE_CACHE_NAME = 'cleverferret-images';
  private readonly METADATA_CACHE_NAME = 'cleverferret-metadata';

  /**
   * Cache an image using Cache API (stores as binary)
   */
  async cacheImage(url: string, blob: Blob): Promise<string> {
    try {
      const cache = await caches.open(this.IMAGE_CACHE_NAME);
      const response = new Response(blob, {
        headers: {
          'Content-Type': blob.type,
          'Cache-Timestamp': Date.now().toString(),
        },
      });
      await cache.put(url, response);
      return url;
    } catch (error) {
      console.error('Failed to cache image:', error);
      throw error;
    }
  }

  /**
   * Get cached image
   */
  async getCachedImage(url: string): Promise<string | null> {
    try {
      const cache = await caches.open(this.IMAGE_CACHE_NAME);
      const response = await cache.match(url);

      if (!response) return null;

      // Check expiry
      const timestamp = response.headers.get('Cache-Timestamp');
      if (timestamp && Date.now() - parseInt(timestamp) > this.CACHE_EXPIRY) {
        await cache.delete(url);
        return null;
      }

      const blob = await response.blob();
      return URL.createObjectURL(blob);
    } catch (error) {
      console.error('Failed to get cached image:', error);
      return null;
    }
  }

  /**
   * Cache metadata using localStorage (small data)
   */
  async cacheMetadata(key: string, data: any): Promise<void> {
    const cacheData = {
      key,
      data,
      timestamp: Date.now(),
    };
    try {
      localStorage.setItem(`meta_${key}`, JSON.stringify(cacheData));
    } catch (error) {
      console.warn('Failed to cache metadata:', error);
    }
  }

  /**
   * Get cached metadata
   */
  getCachedMetadata<T>(key: string): T | null {
    const cached = localStorage.getItem(`meta_${key}`);
    if (!cached) return null;

    try {
      const cacheData = JSON.parse(cached);

      // Check if expired
      if (Date.now() - cacheData.timestamp > this.CACHE_EXPIRY) {
        localStorage.removeItem(`meta_${key}`);
        return null;
      }

      return cacheData.data as T;
    } catch {
      return null;
    }
  }

  /**
   * Clear all caches
   */
  async clearAllCaches(): Promise<void> {
    // Clear localStorage metadata
    const keys = Object.keys(localStorage);
    keys.forEach((key) => {
      if (key.startsWith('meta_')) {
        localStorage.removeItem(key);
      }
    });

    // Clear Cache API
    if ('caches' in window) {
      const cacheNames = await caches.keys();
      await Promise.all(cacheNames.map((cacheName) => caches.delete(cacheName)));
    }
  }

  /**
   * Get cache size estimate
   */
  async getCacheSize(): Promise<number> {
    if ('storage' in navigator && 'estimate' in navigator.storage) {
      const estimate = await navigator.storage.estimate();
      return estimate.usage || 0;
    }
    return 0;
  }

  /**
   * Check if cache is full
   */
  async isCacheFull(): Promise<boolean> {
    const size = await this.getCacheSize();
    return size >= this.MAX_CACHE_SIZE;
  }

  /**
   * Preload image
   */
  async preloadImage(url: string): Promise<void> {
    return new Promise((resolve, reject) => {
      const img = new Image();
      img.onload = () => resolve();
      img.onerror = reject;
      img.src = url;
    });
  }

  /**
   * Preload multiple images
   */
  async preloadImages(urls: string[]): Promise<void> {
    await Promise.all(urls.map((url) => this.preloadImage(url)));
  }
}

// Export singleton instance
export const cacheManager = new CacheManager();
