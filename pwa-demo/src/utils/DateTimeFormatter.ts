/**
 * Date and time formatting utilities
 * Provides internationalization support
 */

export class DateTimeFormatter {
  /**
   * Format date to locale string
   */
  static formatDate(date: Date | number, locale: string = 'en-US'): string {
    const d = typeof date === 'number' ? new Date(date) : date;
    return d.toLocaleDateString(locale);
  }

  /**
   * Format time to locale string
   */
  static formatTime(date: Date | number, locale: string = 'en-US'): string {
    const d = typeof date === 'number' ? new Date(date) : date;
    return d.toLocaleTimeString(locale);
  }

  /**
   * Format date and time
   */
  static formatDateTime(date: Date | number, locale: string = 'en-US'): string {
    const d = typeof date === 'number' ? new Date(date) : date;
    return d.toLocaleString(locale);
  }

  /**
   * Format relative time (e.g., "2 hours ago")
   */
  static formatRelative(date: Date | number): string {
    const d = typeof date === 'number' ? new Date(date) : date;
    const now = new Date();
    const diffMs = now.getTime() - d.getTime();
    const diffSecs = Math.floor(diffMs / 1000);
    const diffMins = Math.floor(diffSecs / 60);
    const diffHours = Math.floor(diffMins / 60);
    const diffDays = Math.floor(diffHours / 24);

    if (diffSecs < 60) return 'just now';
    if (diffMins < 60) return `${diffMins} minute${diffMins > 1 ? 's' : ''} ago`;
    if (diffHours < 24) return `${diffHours} hour${diffHours > 1 ? 's' : ''} ago`;
    if (diffDays < 7) return `${diffDays} day${diffDays > 1 ? 's' : ''} ago`;
    if (diffDays < 30) return `${Math.floor(diffDays / 7)} week${diffDays >= 14 ? 's' : ''} ago`;
    if (diffDays < 365) return `${Math.floor(diffDays / 30)} month${diffDays >= 60 ? 's' : ''} ago`;
    return `${Math.floor(diffDays / 365)} year${diffDays >= 730 ? 's' : ''} ago`;
  }

  /**
   * Format duration (milliseconds to readable string)
   */
  static formatDuration(ms: number): string {
    const seconds = Math.floor(ms / 1000);
    const minutes = Math.floor(seconds / 60);
    const hours = Math.floor(minutes / 60);
    const days = Math.floor(hours / 24);

    if (days > 0) return `${days}d ${hours % 24}h`;
    if (hours > 0) return `${hours}h ${minutes % 60}m`;
    if (minutes > 0) return `${minutes}m ${seconds % 60}s`;
    return `${seconds}s`;
  }

  /**
   * Parse ISO date string
   */
  static parseISO(dateString: string): Date {
    return new Date(dateString);
  }

  /**
   * Format to ISO string
   */
  static toISO(date: Date | number): string {
    const d = typeof date === 'number' ? new Date(date) : date;
    return d.toISOString();
  }

  /**
   * Check if date is today
   */
  static isToday(date: Date | number): boolean {
    const d = typeof date === 'number' ? new Date(date) : date;
    const today = new Date();
    return d.toDateString() === today.toDateString();
  }

  /**
   * Check if date is yesterday
   */
  static isYesterday(date: Date | number): boolean {
    const d = typeof date === 'number' ? new Date(date) : date;
    const yesterday = new Date();
    yesterday.setDate(yesterday.getDate() - 1);
    return d.toDateString() === yesterday.toDateString();
  }
}
