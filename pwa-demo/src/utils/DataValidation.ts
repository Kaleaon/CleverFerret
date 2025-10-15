/**
 * Data validation and sanitization utilities
 */

export class DataValidation {
  /**
   * Validate email address
   */
  static isValidEmail(email: string): boolean {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }

  /**
   * Validate URL
   */
  static isValidUrl(url: string): boolean {
    try {
      new URL(url);
      return true;
    } catch {
      return false;
    }
  }

  /**
   * Validate ISBN
   */
  static isValidISBN(isbn: string): boolean {
    // Remove hyphens and spaces
    const clean = isbn.replace(/[-\s]/g, '');

    // Check ISBN-10
    if (clean.length === 10) {
      let sum = 0;
      for (let i = 0; i < 9; i++) {
        sum += parseInt(clean[i]) * (10 - i);
      }
      const lastChar = clean[9].toUpperCase();
      sum += lastChar === 'X' ? 10 : parseInt(lastChar);
      return sum % 11 === 0;
    }

    // Check ISBN-13
    if (clean.length === 13) {
      let sum = 0;
      for (let i = 0; i < 13; i++) {
        sum += parseInt(clean[i]) * (i % 2 === 0 ? 1 : 3);
      }
      return sum % 10 === 0;
    }

    return false;
  }

  /**
   * Sanitize HTML string
   */
  static sanitizeHtml(html: string): string {
    const div = document.createElement('div');
    div.textContent = html;
    return div.innerHTML;
  }

  /**
   * Sanitize filename
   */
  static sanitizeFilename(filename: string): string {
    return filename
      .replace(/[^a-z0-9.-]/gi, '_')
      .replace(/_{2,}/g, '_')
      .replace(/^_|_$/g, '');
  }

  /**
   * Validate string length
   */
  static isValidLength(str: string, min: number, max: number): boolean {
    return str.length >= min && str.length <= max;
  }

  /**
   * Validate numeric range
   */
  static isInRange(num: number, min: number, max: number): boolean {
    return num >= min && num <= max;
  }

  /**
   * Validate date
   */
  static isValidDate(date: string): boolean {
    const timestamp = Date.parse(date);
    return !isNaN(timestamp);
  }

  /**
   * Validate phone number (basic)
   */
  static isValidPhone(phone: string): boolean {
    const phoneRegex = /^\+?[\d\s-()]+$/;
    const cleaned = phone.replace(/[\s-()]/g, '');
    return phoneRegex.test(phone) && cleaned.length >= 10 && cleaned.length <= 15;
  }

  /**
   * Validate JSON string
   */
  static isValidJson(json: string): boolean {
    try {
      JSON.parse(json);
      return true;
    } catch {
      return false;
    }
  }

  /**
   * Strip HTML tags
   */
  static stripHtml(html: string): string {
    const div = document.createElement('div');
    div.innerHTML = html;
    return div.textContent || div.innerText || '';
  }

  /**
   * Validate hex color
   */
  static isValidHexColor(color: string): boolean {
    return /^#[0-9A-F]{6}$/i.test(color) || /^#[0-9A-F]{3}$/i.test(color);
  }

  /**
   * Escape special characters for regex
   */
  static escapeRegex(str: string): string {
    return str.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  }

  /**
   * Validate credit card number (Luhn algorithm)
   */
  static isValidCreditCard(cardNumber: string): boolean {
    const cleaned = cardNumber.replace(/\D/g, '');
    if (cleaned.length < 13 || cleaned.length > 19) {
      return false;
    }

    let sum = 0;
    let isEven = false;

    for (let i = cleaned.length - 1; i >= 0; i--) {
      let digit = parseInt(cleaned[i]);

      if (isEven) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
      isEven = !isEven;
    }

    return sum % 10 === 0;
  }

  /**
   * Validate password strength
   */
  static validatePasswordStrength(password: string): {
    isValid: boolean;
    strength: 'weak' | 'medium' | 'strong';
    feedback: string[];
  } {
    const feedback: string[] = [];
    let score = 0;

    if (password.length < 8) {
      feedback.push('Password should be at least 8 characters');
    } else {
      score++;
    }

    if (!/[a-z]/.test(password)) {
      feedback.push('Add lowercase letters');
    } else {
      score++;
    }

    if (!/[A-Z]/.test(password)) {
      feedback.push('Add uppercase letters');
    } else {
      score++;
    }

    if (!/[0-9]/.test(password)) {
      feedback.push('Add numbers');
    } else {
      score++;
    }

    if (!/[^a-zA-Z0-9]/.test(password)) {
      feedback.push('Add special characters');
    } else {
      score++;
    }

    const strength = score <= 2 ? 'weak' : score <= 4 ? 'medium' : 'strong';
    const isValid = score >= 3 && password.length >= 8;

    return { isValid, strength, feedback };
  }
}
