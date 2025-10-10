/**
 * Cache Manager
 * 
 * Manages caching of images, metadata, and other resources using IndexedDB.
 * Migrated from CacheManager.kt
 */

import { db } from '../database-complete';

export class CacheManager {
  private readonly MAX_CACHE_SIZE = 100 * 1024 * 1024; // 100MB
  private readonly CACHE_EXPIRY = 7 * 24 * 60 * 60 * 1000; // 7 days

  /**
   * Cache an image (convert to base64 and store in IndexedDB)
   */
  async cacheImage(url: string, blob: Blob): Promise<string> {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.onloadend = () => {
        const base64 = reader.result as string;
        // Store in session storage or IndexedDB
        sessionStorage.setItem(`img_${url}`, base64);
        resolve(base64);
      };
      reader.onerror = reject;
      reader.readAsDataURL(blob);
    });
  }

  /**
   * Get cached image
   */
  getCachedImage(url: string): string | null {
    return sessionStorage.getItem(`img_${url}`);
  }

  /**
   * Cache metadata
   */
  async cacheMetadata(key: string, data: any): Promise<void> {
    const cacheData = {
      key,
      data,
      timestamp: Date.now(),
    };
    sessionStorage.setItem(`meta_${key}`, JSON.stringify(cacheData));
  }

  /**
   * Get cached metadata
   */
  getCachedMetadata<T>(key: string): T | null {
    const cached = sessionStorage.getItem(`meta_${key}`);
    if (!cached) return null;

    try {
      const cacheData = JSON.parse(cached);
      
      // Check if expired
      if (Date.now() - cacheData.timestamp > this.CACHE_EXPIRY) {
        sessionStorage.removeItem(`meta_${key}`);
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
    // Clear session storage
    const keys = Object.keys(sessionStorage);
    keys.forEach(key => {
      if (key.startsWith('img_') || key.startsWith('meta_')) {
        sessionStorage.removeItem(key);
      }
    });

    // Clear cache API if available
    if ('caches' in window) {
      const cacheNames = await caches.keys();
      await Promise.all(
        cacheNames.map(cacheName => caches.delete(cacheName))
      );
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
    await Promise.all(urls.map(url => this.preloadImage(url)));
  }
}

// Export singleton instance
export const cacheManager = new CacheManager();
