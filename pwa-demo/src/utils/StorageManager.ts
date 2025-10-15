/**
 * Unified storage manager
 * Provides abstraction over localStorage, IndexedDB, and Cache API
 */

export enum StorageType {
  LOCAL = 'local',
  INDEXED_DB = 'indexeddb',
  CACHE = 'cache',
}

class StorageManagerClass {
  /**
   * Store data in localStorage
   */
  async setLocal(key: string, value: any): Promise<void> {
    try {
      const serialized = JSON.stringify(value);
      localStorage.setItem(key, serialized);
    } catch (error) {
      console.error('Failed to set local storage:', error);
      throw error;
    }
  }

  /**
   * Get data from localStorage
   */
  async getLocal<T = any>(key: string): Promise<T | null> {
    try {
      const serialized = localStorage.getItem(key);
      if (serialized === null) {
        return null;
      }
      return JSON.parse(serialized) as T;
    } catch (error) {
      console.error('Failed to get local storage:', error);
      return null;
    }
  }

  /**
   * Remove data from localStorage
   */
  async removeLocal(key: string): Promise<void> {
    try {
      localStorage.removeItem(key);
    } catch (error) {
      console.error('Failed to remove from local storage:', error);
    }
  }

  /**
   * Clear all localStorage data
   */
  async clearLocal(): Promise<void> {
    try {
      localStorage.clear();
    } catch (error) {
      console.error('Failed to clear local storage:', error);
    }
  }

  /**
   * Get storage quota information
   */
  async getQuota(): Promise<{
    usage: number;
    quota: number;
    percentage: number;
  } | null> {
    if (!navigator.storage || !navigator.storage.estimate) {
      return null;
    }

    try {
      const estimate = await navigator.storage.estimate();
      const usage = estimate.usage || 0;
      const quota = estimate.quota || 0;
      const percentage = quota > 0 ? (usage / quota) * 100 : 0;

      return { usage, quota, percentage };
    } catch (error) {
      console.error('Failed to get storage quota:', error);
      return null;
    }
  }

  /**
   * Request persistent storage
   */
  async requestPersistence(): Promise<boolean> {
    if (!navigator.storage || !navigator.storage.persist) {
      return false;
    }

    try {
      return await navigator.storage.persist();
    } catch (error) {
      console.error('Failed to request persistent storage:', error);
      return false;
    }
  }

  /**
   * Check if storage is persisted
   */
  async isPersisted(): Promise<boolean> {
    if (!navigator.storage || !navigator.storage.persisted) {
      return false;
    }

    try {
      return await navigator.storage.persisted();
    } catch (error) {
      console.error('Failed to check if storage is persisted:', error);
      return false;
    }
  }

  /**
   * Store data in Cache API
   */
  async setCache(cacheName: string, request: string, response: Response): Promise<void> {
    if (!('caches' in window)) {
      throw new Error('Cache API not supported');
    }

    try {
      const cache = await caches.open(cacheName);
      await cache.put(request, response);
    } catch (error) {
      console.error('Failed to set cache:', error);
      throw error;
    }
  }

  /**
   * Get data from Cache API
   */
  async getCache(cacheName: string, request: string): Promise<Response | undefined> {
    if (!('caches' in window)) {
      return undefined;
    }

    try {
      const cache = await caches.open(cacheName);
      return await cache.match(request);
    } catch (error) {
      console.error('Failed to get from cache:', error);
      return undefined;
    }
  }

  /**
   * Delete cache
   */
  async deleteCache(cacheName: string): Promise<boolean> {
    if (!('caches' in window)) {
      return false;
    }

    try {
      return await caches.delete(cacheName);
    } catch (error) {
      console.error('Failed to delete cache:', error);
      return false;
    }
  }

  /**
   * Get all cache names
   */
  async getCacheNames(): Promise<string[]> {
    if (!('caches' in window)) {
      return [];
    }

    try {
      return await caches.keys();
    } catch (error) {
      console.error('Failed to get cache names:', error);
      return [];
    }
  }

  /**
   * Clear all caches
   */
  async clearAllCaches(): Promise<void> {
    if (!('caches' in window)) {
      return;
    }

    try {
      const names = await caches.keys();
      await Promise.all(names.map((name) => caches.delete(name)));
    } catch (error) {
      console.error('Failed to clear all caches:', error);
    }
  }

  /**
   * Get estimated cache size
   */
  async getCacheSize(): Promise<number> {
    if (!navigator.storage || !navigator.storage.estimate) {
      return 0;
    }

    try {
      const estimate = await navigator.storage.estimate();
      return estimate.usage || 0;
    } catch (error) {
      console.error('Failed to get cache size:', error);
      return 0;
    }
  }
}

export const StorageManager = new StorageManagerClass();
