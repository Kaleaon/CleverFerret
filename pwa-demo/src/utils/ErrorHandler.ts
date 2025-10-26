/**
 * Global error handling and reporting
 */

import { Logger } from './Logger';

export interface ErrorReport {
  message: string;
  stack?: string;
  timestamp: number;
  userAgent: string;
  url: string;
  context?: Record<string, any>;
}

class ErrorHandlerClass {
  private errorReports: ErrorReport[] = [];
  private maxReports = 100;
  private onErrorCallback?: (error: ErrorReport) => void;

  constructor() {
    this.setupGlobalHandlers();
  }

  /**
   * Setup global error handlers
   */
  private setupGlobalHandlers(): void {
    // Handle uncaught errors
    window.addEventListener('error', (event) => {
      this.handleError(event.error || new Error(event.message), {
        type: 'uncaught',
        filename: event.filename,
        lineno: event.lineno,
        colno: event.colno,
      });
    });

    // Handle unhandled promise rejections
    window.addEventListener('unhandledrejection', (event) => {
      this.handleError(event.reason, {
        type: 'unhandled_promise',
      });
    });
  }

  /**
   * Handle an error
   */
  handleError(error: Error | any, context?: Record<string, any>): void {
    const report: ErrorReport = {
      message: error?.message || String(error),
      stack: error?.stack,
      timestamp: Date.now(),
      userAgent: navigator.userAgent,
      url: window.location.href,
      context,
    };

    this.errorReports.push(report);

    // Keep only last maxReports
    if (this.errorReports.length > this.maxReports) {
      this.errorReports = this.errorReports.slice(-this.maxReports);
    }

    // Log the error
    Logger.error(report.message, error);

    // Call callback if set
    if (this.onErrorCallback) {
      this.onErrorCallback(report);
    }
  }

  /**
   * Set error callback for custom handling
   */
  setErrorCallback(callback: (error: ErrorReport) => void): void {
    this.onErrorCallback = callback;
  }

  /**
   * Get all error reports
   */
  getErrorReports(): ErrorReport[] {
    return [...this.errorReports];
  }

  /**
   * Get recent errors
   */
  getRecentErrors(count: number = 10): ErrorReport[] {
    return this.errorReports.slice(-count);
  }

  /**
   * Clear all error reports
   */
  clearErrors(): void {
    this.errorReports = [];
  }

  /**
   * Export errors as JSON
   */
  exportErrors(): string {
    return JSON.stringify(this.errorReports, null, 2);
  }

  /**
   * Create a safe error boundary wrapper
   */
  wrapAsync<T>(fn: () => Promise<T>): Promise<T | null> {
    return fn().catch((error) => {
      this.handleError(error, { wrappedFunction: fn.name });
      return null;
    });
  }

  /**
   * Create a safe sync wrapper
   */
  wrapSync<T>(fn: () => T): T | null {
    try {
      return fn();
    } catch (error) {
      this.handleError(error, { wrappedFunction: fn.name });
      return null;
    }
  }
}

export const ErrorHandler = new ErrorHandlerClass();
