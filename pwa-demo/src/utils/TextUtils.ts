/**
 * Text manipulation and formatting utilities
 */

export class TextUtils {
  /**
   * Truncate text to specified length
   */
  static truncate(text: string, maxLength: number, suffix: string = '...'): string {
    if (text.length <= maxLength) return text;
    return text.substring(0, maxLength - suffix.length) + suffix;
  }

  /**
   * Capitalize first letter
   */
  static capitalize(text: string): string {
    if (!text) return '';
    return text.charAt(0).toUpperCase() + text.slice(1).toLowerCase();
  }

  /**
   * Title case
   */
  static titleCase(text: string): string {
    return text
      .toLowerCase()
      .split(' ')
      .map((word) => this.capitalize(word))
      .join(' ');
  }

  /**
   * Slug-ify text
   */
  static slugify(text: string): string {
    return text
      .toLowerCase()
      .trim()
      .replace(/[^\w\s-]/g, '')
      .replace(/[\s_-]+/g, '-')
      .replace(/^-+|-+$/g, '');
  }

  /**
   * Remove HTML tags
   */
  static stripHtml(html: string): string {
    const div = document.createElement('div');
    div.innerHTML = html;
    return div.textContent || div.innerText || '';
  }

  /**
   * Word count
   */
  static wordCount(text: string): number {
    return text
      .trim()
      .split(/\s+/)
      .filter((word) => word.length > 0).length;
  }

  /**
   * Character count (excluding spaces)
   */
  static charCount(text: string, includeSpaces: boolean = false): number {
    return includeSpaces ? text.length : text.replace(/\s/g, '').length;
  }

  /**
   * Estimate reading time (words per minute)
   */
  static estimateReadingTime(text: string, wpm: number = 200): number {
    const words = this.wordCount(text);
    return Math.ceil(words / wpm);
  }

  /**
   * Highlight search term in text
   */
  static highlight(text: string, searchTerm: string, className: string = 'highlight'): string {
    if (!searchTerm) return text;
    const regex = new RegExp(`(${searchTerm})`, 'gi');
    return text.replace(regex, `<span class="${className}">$1</span>`);
  }

  /**
   * Convert newlines to <br> tags
   */
  static nl2br(text: string): string {
    return text.replace(/\n/g, '<br>');
  }

  /**
   * Reverse string
   */
  static reverse(text: string): string {
    return text.split('').reverse().join('');
  }

  /**
   * Pad string
   */
  static pad(text: string, length: number, char: string = ' ', right: boolean = false): string {
    const padding = char.repeat(Math.max(0, length - text.length));
    return right ? text + padding : padding + text;
  }

  /**
   * Extract URLs from text
   */
  static extractUrls(text: string): string[] {
    const urlRegex = /(https?:\/\/[^\s]+)/g;
    return text.match(urlRegex) || [];
  }

  /**
   * Extract emails from text
   */
  static extractEmails(text: string): string[] {
    const emailRegex = /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/g;
    return text.match(emailRegex) || [];
  }
}
