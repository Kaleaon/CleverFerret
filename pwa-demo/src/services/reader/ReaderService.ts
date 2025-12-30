/**
 * Reader Service - E-book reading functionality
 * Migrated from Android ReaderService
 */

export interface ReadingPosition {
  bookId: number;
  position: number;
  chapter?: string;
  percentage: number;
}

export interface ReaderSettings {
  fontSize: number;
  fontFamily: string;
  lineHeight: number;
  theme: 'light' | 'dark' | 'sepia';
  brightness: number;
  autoScroll: boolean;
  autoScrollSpeed: number;
}

export class ReaderService {
  private currentPosition: ReadingPosition | null = null;
  private settings: ReaderSettings = {
    fontSize: 16,
    fontFamily: 'serif',
    lineHeight: 1.6,
    theme: 'light',
    brightness: 100,
    autoScroll: false,
    autoScrollSpeed: 50,
  };

  getSettings(): ReaderSettings {
    return { ...this.settings };
  }

  updateSettings(settings: Partial<ReaderSettings>): void {
    this.settings = { ...this.settings, ...settings };
    this.applySettings();
  }

  private applySettings(): void {
    // Apply settings to reading area
    const readerElement = document.querySelector('.reader-content');
    if (readerElement) {
      const el = readerElement as HTMLElement;
      el.style.fontSize = `${this.settings.fontSize}px`;
      el.style.fontFamily = this.settings.fontFamily;
      el.style.lineHeight = `${this.settings.lineHeight}`;

      // Apply theme
      el.classList.remove('light', 'dark', 'sepia');
      el.classList.add(this.settings.theme);

      el.style.filter = `brightness(${this.settings.brightness}%)`;
    }
  }

  savePosition(position: ReadingPosition): void {
    this.currentPosition = position;
    // Save to IndexedDB via database service
    localStorage.setItem(`reading-position-${position.bookId}`, JSON.stringify(position));
  }

  async loadPosition(bookId: number): Promise<ReadingPosition | null> {
    const stored = localStorage.getItem(`reading-position-${bookId}`);
    if (stored) {
      this.currentPosition = JSON.parse(stored);
      return this.currentPosition;
    }
    return null;
  }

  calculateProgress(currentPage: number, totalPages: number): number {
    return (currentPage / totalPages) * 100;
  }

  async highlightText(bookId: number, text: string, color: string): Promise<void> {
    // Placeholder for text highlighting
    console.log('Highlighting:', text, 'with color:', color);
  }

  async addBookmark(bookId: number, position: number, note?: string): Promise<void> {
    // Placeholder for bookmark addition
    console.log('Adding bookmark at:', position, 'note:', note);
  }
}

export default new ReaderService();
