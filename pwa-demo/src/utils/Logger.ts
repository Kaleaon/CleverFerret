/* eslint-disable no-console */
/**
 * Structured logging utility
 * Provides leveled logging with persistence option
 */

export enum LogLevel {
  DEBUG = 0,
  INFO = 1,
  WARN = 2,
  ERROR = 3,
}

export interface LogEntry {
  timestamp: number;
  level: LogLevel;
  message: string;
  data?: any;
  stack?: string;
}

const MAX_LOGS = 1000;
const STORAGE_KEY = 'app_logs';

class LoggerClass {
  private logs: LogEntry[] = [];
  private minLevel: LogLevel = LogLevel.INFO;
  private persistLogs = false;

  constructor() {
    // Load persisted logs if available
    this.loadLogs();
  }

  /**
   * Set minimum log level
   */
  setMinLevel(level: LogLevel): void {
    this.minLevel = level;
  }

  /**
   * Enable or disable log persistence
   */
  setPersistence(enabled: boolean): void {
    this.persistLogs = enabled;
    if (!enabled) {
      this.clearPersistedLogs();
    }
  }

  /**
   * Log debug message
   */
  debug(message: string, data?: any): void {
    this.log(LogLevel.DEBUG, message, data);
  }

  /**
   * Log info message
   */
  info(message: string, data?: any): void {
    this.log(LogLevel.INFO, message, data);
  }

  /**
   * Log warning message
   */
  warn(message: string, data?: any): void {
    this.log(LogLevel.WARN, message, data);
  }

  /**
   * Log error message
   */
  error(message: string, error?: Error | any): void {
    const data = error instanceof Error ? { message: error.message, name: error.name } : error;
    const stack = error instanceof Error ? error.stack : undefined;
    this.log(LogLevel.ERROR, message, data, stack);
  }

  /**
   * Core logging method
   */
  private log(level: LogLevel, message: string, data?: any, stack?: string): void {
    if (level < this.minLevel) {
      return;
    }

    const entry: LogEntry = {
      timestamp: Date.now(),
      level,
      message,
      data,
      stack,
    };

    this.logs.push(entry);

    // Keep only last MAX_LOGS entries
    if (this.logs.length > MAX_LOGS) {
      this.logs = this.logs.slice(-MAX_LOGS);
    }

    // Console output
    this.outputToConsole(entry);

    // Persist if enabled
    if (this.persistLogs) {
      this.persistLog();
    }
  }

  /**
   * Output log entry to console
   */
  private outputToConsole(entry: LogEntry): void {
    const timestamp = new Date(entry.timestamp).toISOString();
    const levelName = LogLevel[entry.level];
    const prefix = `[${timestamp}] [${levelName}]`;

    switch (entry.level) {
      case LogLevel.DEBUG:
        console.debug(prefix, entry.message, entry.data || '');
        break;
      case LogLevel.INFO:
        console.info(prefix, entry.message, entry.data || '');
        break;
      case LogLevel.WARN:
        console.warn(prefix, entry.message, entry.data || '');
        break;
      case LogLevel.ERROR:
        console.error(prefix, entry.message, entry.data || '');
        if (entry.stack) {
          console.error(entry.stack);
        }
        break;
    }
  }

  /**
   * Get all logs
   */
  getLogs(): LogEntry[] {
    return [...this.logs];
  }

  /**
   * Get logs filtered by level
   */
  getLogsByLevel(level: LogLevel): LogEntry[] {
    return this.logs.filter((log) => log.level === level);
  }

  /**
   * Get recent logs
   */
  getRecentLogs(count: number = 100): LogEntry[] {
    return this.logs.slice(-count);
  }

  /**
   * Clear all logs
   */
  clear(): void {
    this.logs = [];
    this.clearPersistedLogs();
  }

  /**
   * Export logs as JSON
   */
  exportLogs(): string {
    return JSON.stringify(this.logs, null, 2);
  }

  /**
   * Persist logs to localStorage
   */
  private persistLog(): void {
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(this.logs));
    } catch (error) {
      // Silently fail if storage is full
      console.warn('Failed to persist logs:', error);
    }
  }

  /**
   * Load persisted logs
   */
  private loadLogs(): void {
    try {
      const stored = localStorage.getItem(STORAGE_KEY);
      if (stored) {
        this.logs = JSON.parse(stored);
      }
    } catch (error) {
      console.warn('Failed to load persisted logs:', error);
    }
  }

  /**
   * Clear persisted logs
   */
  private clearPersistedLogs(): void {
    try {
      localStorage.removeItem(STORAGE_KEY);
    } catch (error) {
      console.warn('Failed to clear persisted logs:', error);
    }
  }
}

export const Logger = new LoggerClass();

// Set up global error handler
if (typeof window !== 'undefined') {
  window.addEventListener('error', (event) => {
    Logger.error('Uncaught error', event.error);
  });

  window.addEventListener('unhandledrejection', (event) => {
    Logger.error('Unhandled promise rejection', event.reason);
  });
}
