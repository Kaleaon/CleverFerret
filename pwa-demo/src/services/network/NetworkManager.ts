/**
 * Network Manager
 * 
 * Centralized network request handling with error handling,
 * retry logic, and caching support.
 * Migrated from NetworkManager.kt
 */

export class NetworkManager {
  private baseURL: string = '';
  private defaultHeaders: Record<string, string> = {
    'Content-Type': 'application/json',
  };
  private timeout: number = 30000; // 30 seconds

  /**
   * Set base URL for all requests
   */
  setBaseURL(url: string): void {
    this.baseURL = url;
  }

  /**
   * Set default headers
   */
  setDefaultHeaders(headers: Record<string, string>): void {
    this.defaultHeaders = { ...this.defaultHeaders, ...headers };
  }

  /**
   * Set timeout for requests
   */
  setTimeout(timeout: number): void {
    this.timeout = timeout;
  }

  /**
   * Make GET request
   */
  async get<T>(
    endpoint: string,
    options?: RequestOptions
  ): Promise<NetworkResponse<T>> {
    return this.request<T>('GET', endpoint, undefined, options);
  }

  /**
   * Make POST request
   */
  async post<T>(
    endpoint: string,
    data?: any,
    options?: RequestOptions
  ): Promise<NetworkResponse<T>> {
    return this.request<T>('POST', endpoint, data, options);
  }

  /**
   * Make PUT request
   */
  async put<T>(
    endpoint: string,
    data?: any,
    options?: RequestOptions
  ): Promise<NetworkResponse<T>> {
    return this.request<T>('PUT', endpoint, data, options);
  }

  /**
   * Make DELETE request
   */
  async delete<T>(
    endpoint: string,
    options?: RequestOptions
  ): Promise<NetworkResponse<T>> {
    return this.request<T>('DELETE', endpoint, undefined, options);
  }

  /**
   * Core request method
   */
  private async request<T>(
    method: string,
    endpoint: string,
    data?: any,
    options?: RequestOptions
  ): Promise<NetworkResponse<T>> {
    const url = this.buildURL(endpoint);
    const headers = { ...this.defaultHeaders, ...(options?.headers || {}) };
    
    const controller = new AbortController();
    const timeoutMs = options?.timeout ?? this.timeout;
    const timeoutId = setTimeout(() => controller.abort(), timeoutMs);

    try {
      const response = await fetch(url, {
        method,
        headers,
        body: data ? JSON.stringify(data) : undefined,
        signal: controller.signal,
      });

      clearTimeout(timeoutId);

      const responseData = await this.parseResponse<T>(response);

      if (!response.ok) {
        return {
          success: false,
          error: `HTTP ${response.status}: ${response.statusText}`,
          statusCode: response.status,
          data: undefined,
        };
      }

      return {
        success: true,
        data: responseData,
        statusCode: response.status,
      };
    } catch (error: any) {
      clearTimeout(timeoutId);

      if (error.name === 'AbortError') {
        return {
          success: false,
          error: 'Request timeout',
          statusCode: 408,
          data: undefined,
        };
      }

      return {
        success: false,
        error: error.message || 'Network request failed',
        statusCode: 0,
        data: undefined,
      };
    }
  }

  /**
   * Parse response based on content type
   */
  private async parseResponse<T>(response: Response): Promise<T> {
    const contentType = response.headers.get('content-type');

    if (contentType?.includes('application/json')) {
      return response.json();
    }

    if (contentType?.includes('text')) {
      return response.text() as any;
    }

    return response.blob() as any;
  }

  /**
   * Build full URL from endpoint
   */
  private buildURL(endpoint: string): string {
    if (endpoint.startsWith('http://') || endpoint.startsWith('https://')) {
      return endpoint;
    }

    const base = this.baseURL.endsWith('/') ? this.baseURL.slice(0, -1) : this.baseURL;
    const path = endpoint.startsWith('/') ? endpoint : `/${endpoint}`;
    return `${base}${path}`;
  }

  /**
   * Check if device is online
   */
  isOnline(): boolean {
    return navigator.onLine;
  }

  /**
   * Listen for online/offline events
   */
  onNetworkChange(callback: (isOnline: boolean) => void): () => void {
    const onlineHandler = () => callback(true);
    const offlineHandler = () => callback(false);

    window.addEventListener('online', onlineHandler);
    window.addEventListener('offline', offlineHandler);

    return () => {
      window.removeEventListener('online', onlineHandler);
      window.removeEventListener('offline', offlineHandler);
    };
  }

  /**
   * Make request with retry logic
   */
  async requestWithRetry<T>(
    method: string,
    endpoint: string,
    data?: any,
    options?: RequestOptions,
    maxRetries: number = 3
  ): Promise<NetworkResponse<T>> {
    let lastError: NetworkResponse<T> | null = null;

    for (let attempt = 0; attempt < maxRetries; attempt++) {
      const response = await this.request<T>(method, endpoint, data, options);

      if (response.success) {
        return response;
      }

      lastError = response;

      // Don't retry on 4xx errors (client errors)
      if (response.statusCode && response.statusCode >= 400 && response.statusCode < 500) {
        break;
      }

      // Wait before retrying (exponential backoff)
      if (attempt < maxRetries - 1) {
        await this.delay(Math.pow(2, attempt) * 1000);
      }
    }

    return lastError || {
      success: false,
      error: 'Max retries exceeded',
      statusCode: 0,
      data: undefined,
    };
  }

  /**
   * Download file
   */
  async downloadFile(
    url: string,
    onProgress?: (progress: number) => void
  ): Promise<Blob | null> {
    try {
      const response = await fetch(url);

      if (!response.ok) {
        throw new Error(`HTTP ${response.status}`);
      }

      const contentLength = response.headers.get('content-length');
      const total = contentLength ? parseInt(contentLength, 10) : 0;

      if (!response.body) {
        return response.blob();
      }

      const reader = response.body.getReader();
      const chunks: Uint8Array[] = [];
      let received = 0;

      while (true) {
        const { done, value } = await reader.read();

        if (done) break;

        chunks.push(value);
        received += value.length;

        if (onProgress && total > 0) {
          onProgress((received / total) * 100);
        }
      }

      return new Blob(chunks);
    } catch (error) {
      console.error('Download error:', error);
      return null;
    }
  }

  /**
   * Delay helper
   */
  private delay(ms: number): Promise<void> {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
}

/**
 * Request options
 */
export interface RequestOptions {
  headers?: Record<string, string>;
  timeout?: number;
}

/**
 * Network response
 */
export interface NetworkResponse<T> {
  success: boolean;
  data?: T;
  error?: string;
  statusCode?: number;
}

// Export singleton instance
export const networkManager = new NetworkManager();
