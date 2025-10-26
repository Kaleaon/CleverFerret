/**
 * Security Service - Authentication and encryption
 * Migrated from Android Security Service
 */

export class SecurityService {
  private readonly storageKey = 'app-password-hash';

  async hashPassword(password: string): Promise<string> {
    const encoder = new TextEncoder();
    const data = encoder.encode(password);
    const hashBuffer = await crypto.subtle.digest('SHA-256', data);
    const hashArray = Array.from(new Uint8Array(hashBuffer));
    return hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
  }

  async setPassword(password: string): Promise<void> {
    const hash = await this.hashPassword(password);
    localStorage.setItem(this.storageKey, hash);
  }

  async verifyPassword(password: string): Promise<boolean> {
    const stored = localStorage.getItem(this.storageKey);
    if (!stored) return false;
    
    const hash = await this.hashPassword(password);
    return hash === stored;
  }

  hasPassword(): boolean {
    return localStorage.getItem(this.storageKey) !== null;
  }

  clearPassword(): void {
    localStorage.removeItem(this.storageKey);
  }

  async encrypt(data: string, password: string): Promise<string> {
    // Placeholder for encryption
    // In production, use Web Crypto API with proper key derivation
    return btoa(data);
  }

  async decrypt(encryptedData: string, password: string): Promise<string> {
    // Placeholder for decryption
    return atob(encryptedData);
  }

  generateSecureToken(length: number = 32): string {
    const array = new Uint8Array(length);
    crypto.getRandomValues(array);
    return Array.from(array, b => b.toString(16).padStart(2, '0')).join('');
  }
}

export default new SecurityService();
