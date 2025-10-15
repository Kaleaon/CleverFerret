/**
 * Network utilities
 * Connection detection, retry logic, and request helpers
 */

export interface RetryOptions {
  maxRetries?: number;
  delay?: number;
  backoff?: boolean;
}

export class NetworkUtils {
  /**
   * Check if online
   */
  static isOnline(): boolean {
    return navigator.onLine;
  }

  /**
   * Get connection info
   */
  static getConnectionInfo(): {
    online: boolean;
    type?: string;
    effectiveType?: string;
    downlink?: number;
    rtt?: number;
  } {
    const connection =
      (navigator as any).connection ||
      (navigator as any).mozConnection ||
      (navigator as any).webkitConnection;

    return {
      online: navigator.onLine,
      type: connection?.type,
      effectiveType: connection?.effectiveType,
      downlink: connection?.downlink,
      rtt: connection?.rtt,
    };
  }

  /**
   * Retry function with exponential backoff
   */
  static async retry<T>(
    fn: () => Promise<T>,
    options: RetryOptions = {}
  ): Promise<T> {
    const { maxRetries = 3, delay = 1000, backoff = true } = options;
    let lastError: Error;

    for (let i = 0; i < maxRetries; i++) {
      try {
        return await fn();
      } catch (error) {
        lastError = error as Error;
        if (i < maxRetries - 1) {
          const waitTime = backoff ? delay * Math.pow(2, i) : delay;
          await new Promise((resolve) => setTimeout(resolve, waitTime));
        }
      }
    }

    throw lastError!;
  }

  /**
   * Fetch with timeout
   */
  static async fetchWithTimeout(
    url: string,
    timeout: number = 10000,
    options?: RequestInit
  ): Promise<Response> {
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), timeout);

    try {
      const response = await fetch(url, {
        ...options,
        signal: controller.signal,
      });
      clearTimeout(timeoutId);
      return response;
    } catch (error) {
      clearTimeout(timeoutId);
      throw error;
    }
  }

  /**
   * Download file with progress
   */
  static async downloadWithProgress(
    url: string,
    onProgress?: (loaded: number, total: number) => void
  ): Promise<Blob> {
    const response = await fetch(url);
    const total = parseInt(response.headers.get('content-length') || '0');
    const reader = response.body?.getReader();

    if (!reader) {
      throw new Error('ReadableStream not supported');
    }

    const chunks: Uint8Array[] = [];
    let loaded = 0;

    while (true) {
      const { done, value } = await reader.read();
      if (done) break;

      chunks.push(value);
      loaded += value.length;

      if (onProgress) {
        onProgress(loaded, total);
      }
    }

    return new Blob(chunks as BlobPart[]);
  }

  /**
   * Check if URL is reachable
   */
  static async isUrlReachable(url: string, timeout: number = 5000): Promise<boolean> {
    try {
      const response = await this.fetchWithTimeout(url, timeout, { method: 'HEAD' });
      return response.ok;
    } catch {
      return false;
    }
  }

  /**
   * Get file size from URL
   */
  static async getFileSize(url: string): Promise<number | null> {
    try {
      const response = await fetch(url, { method: 'HEAD' });
      const contentLength = response.headers.get('content-length');
      return contentLength ? parseInt(contentLength) : null;
    } catch {
      return null;
    }
  }
}
