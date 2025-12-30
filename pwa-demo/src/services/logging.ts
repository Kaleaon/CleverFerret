/**
 * Logging Service
 *
 * Centralized logging with different log levels and optional persistence
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
  category: string;
  message: string;
  data?: any;
  error?: Error;
}

class LoggingService {
  private logs: LogEntry[] = [];
  private maxLogs = 1000;
  private minLevel: LogLevel = LogLevel.DEBUG;
  private enableConsole = true;
  private enablePersistence = false;

  /**
   * Configure logging service
   */
  configure(options: {
    minLevel?: LogLevel;
    enableConsole?: boolean;
    enablePersistence?: boolean;
    maxLogs?: number;
  }) {
    if (options.minLevel !== undefined) this.minLevel = options.minLevel;
    if (options.enableConsole !== undefined) this.enableConsole = options.enableConsole;
    if (options.enablePersistence !== undefined) this.enablePersistence = options.enablePersistence;
    if (options.maxLogs !== undefined) this.maxLogs = options.maxLogs;
  }

  /**
   * Log a message
   */
  private log(level: LogLevel, category: string, message: string, data?: any, error?: Error) {
    if (level < this.minLevel) return;

    const entry: LogEntry = {
      timestamp: Date.now(),
      level,
      category,
      message,
      data,
      error,
    };

    // Add to in-memory logs
    this.logs.push(entry);
    if (this.logs.length > this.maxLogs) {
      this.logs.shift();
    }

    // Console output
    if (this.enableConsole) {
      const timestamp = new Date(entry.timestamp).toISOString();
      const prefix = `[${timestamp}] [${LogLevel[level]}] [${category}]`;

      switch (level) {
        case LogLevel.DEBUG:
          console.debug(prefix, message, data || '');
          break;
        case LogLevel.INFO:
          console.info(prefix, message, data || '');
          break;
        case LogLevel.WARN:
          console.warn(prefix, message, data || '');
          if (error) console.warn(error);
          break;
        case LogLevel.ERROR:
          console.error(prefix, message, data || '');
          if (error) console.error(error);
          break;
      }
    }

    // Persistence (IndexedDB)
    if (this.enablePersistence) {
      this.persistLog(entry).catch((err) => {
        console.error('Failed to persist log:', err);
      });
    }
  }

  /**
   * Persist log to IndexedDB
   */
  private async persistLog(entry: LogEntry): Promise<void> {
    try {
      // Use Dexie if available
      const { db } = await import('./database-complete');
      await db.logs.add(entry);
    } catch (error) {
      // Fallback to localStorage if IndexedDB fails
      try {
        const logs = JSON.parse(localStorage.getItem('app_logs') || '[]');
        logs.push(entry);
        // Keep only last 100 logs in localStorage
        const recentLogs = logs.slice(-100);
        localStorage.setItem('app_logs', JSON.stringify(recentLogs));
      } catch {
        // Ignore persistence errors
      }
    }
  }

  /**
   * Debug log
   */
  debug(category: string, message: string, data?: any) {
    this.log(LogLevel.DEBUG, category, message, data);
  }

  /**
   * Info log
   */
  info(category: string, message: string, data?: any) {
    this.log(LogLevel.INFO, category, message, data);
  }

  /**
   * Warning log
   */
  warn(category: string, message: string, data?: any, error?: Error) {
    this.log(LogLevel.WARN, category, message, data, error);
  }

  /**
   * Error log
   */
  error(category: string, message: string, data?: any, error?: Error) {
    this.log(LogLevel.ERROR, category, message, data, error);
  }

  /**
   * Get recent logs
   */
  getLogs(level?: LogLevel, category?: string, limit?: number): LogEntry[] {
    let filtered = this.logs;

    if (level !== undefined) {
      filtered = filtered.filter((log) => log.level === level);
    }

    if (category) {
      filtered = filtered.filter((log) => log.category === category);
    }

    if (limit) {
      filtered = filtered.slice(-limit);
    }

    return filtered;
  }

  /**
   * Clear logs
   */
  clearLogs() {
    this.logs = [];
  }

  /**
   * Export logs as JSON
   */
  exportLogs(): string {
    return JSON.stringify(this.logs, null, 2);
  }
}

export const logger = new LoggingService();

// Initialize with production defaults
if (import.meta.env.PROD) {
  logger.configure({
    minLevel: LogLevel.INFO,
    enableConsole: true,
    enablePersistence: false,
  });
} else {
  logger.configure({
    minLevel: LogLevel.DEBUG,
    enableConsole: true,
    enablePersistence: false,
  });
}
