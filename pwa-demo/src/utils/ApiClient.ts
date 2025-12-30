/**
 * Unified HTTP API client
 * Provides centralized request handling with interceptors
 */

export interface ApiClientConfig {
  baseURL?: string;
  timeout?: number;
  headers?: Record<string, string>;
}

export interface RequestInterceptor {
  onRequest?: (config: RequestInit) => RequestInit | Promise<RequestInit>;
  onResponse?: (response: Response) => Response | Promise<Response>;
  onError?: (error: Error) => void;
}

export class ApiClient {
  private baseURL: string;
  private timeout: number;
  private defaultHeaders: Record<string, string>;
  private interceptors: RequestInterceptor[] = [];

  constructor(config: ApiClientConfig = {}) {
    this.baseURL = config.baseURL || '';
    this.timeout = config.timeout || 30000;
    this.defaultHeaders = config.headers || {};
  }

  /**
   * Add request interceptor
   */
  addInterceptor(interceptor: RequestInterceptor): void {
    this.interceptors.push(interceptor);
  }

  /**
   * GET request
   */
  async get<T = any>(url: string, options?: RequestInit): Promise<T> {
    return this.request<T>(url, { ...options, method: 'GET' });
  }

  /**
   * POST request
   */
  async post<T = any>(url: string, data?: any, options?: RequestInit): Promise<T> {
    return this.request<T>(url, {
      ...options,
      method: 'POST',
      body: JSON.stringify(data),
    });
  }

  /**
   * PUT request
   */
  async put<T = any>(url: string, data?: any, options?: RequestInit): Promise<T> {
    return this.request<T>(url, {
      ...options,
      method: 'PUT',
      body: JSON.stringify(data),
    });
  }

  /**
   * DELETE request
   */
  async delete<T = any>(url: string, options?: RequestInit): Promise<T> {
    return this.request<T>(url, { ...options, method: 'DELETE' });
  }

  /**
   * Core request method
   */
  private async request<T>(url: string, options: RequestInit = {}): Promise<T> {
    const fullUrl = url.startsWith('http') ? url : `${this.baseURL}${url}`;

    let config: RequestInit = {
      ...options,
      headers: {
        'Content-Type': 'application/json',
        ...this.defaultHeaders,
        ...(options.headers || {}),
      },
    };

    // Apply request interceptors
    for (const interceptor of this.interceptors) {
      if (interceptor.onRequest) {
        config = await interceptor.onRequest(config);
      }
    }

    // Add timeout
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), this.timeout);
    config.signal = controller.signal;

    try {
      let response = await fetch(fullUrl, config);
      clearTimeout(timeoutId);

      // Apply response interceptors
      for (const interceptor of this.interceptors) {
        if (interceptor.onResponse) {
          response = await interceptor.onResponse(response);
        }
      }

      if (!response.ok) {
        throw new Error(`HTTP ${response.status}: ${response.statusText}`);
      }

      const contentType = response.headers.get('content-type');
      if (contentType?.includes('application/json')) {
        return await response.json();
      }

      return (await response.text()) as unknown as T;
    } catch (error) {
      clearTimeout(timeoutId);

      // Apply error interceptors
      for (const interceptor of this.interceptors) {
        if (interceptor.onError) {
          interceptor.onError(error as Error);
        }
      }

      throw error;
    }
  }
}
