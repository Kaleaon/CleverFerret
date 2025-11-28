/**
 * EPUB Reader Service
 * 
 * Handles EPUB file reading using epub.js
 */

import * as ePub from 'epubjs';

export interface EPUBBook {
  book: ePub.Book;
  title: string;
  author: string;
  coverUrl?: string;
  spine: any[];
  toc: any[];
}

export interface EPUBChapter {
  id: string;
  title: string;
  href: string;
  content?: string;
}

export class EPUBReaderService {
  private currentBook: EPUBBook | null = null;

  /**
   * Load an EPUB file
   */
  async loadEPUB(file: File | Blob | string): Promise<EPUBBook> {
    try {
      const book = ePub.default(file);
      
      await book.ready;
      
      const metadata = await book.loaded.metadata;
      const coverUrl = await this.getCoverUrl(book);
      
      const epubBook: EPUBBook = {
        book,
        title: metadata.title || 'Unknown Title',
        author: metadata.creator || 'Unknown Author',
        coverUrl,
        spine: book.spine.spineItems,
        toc: book.navigation.toc,
      };
      
      this.currentBook = epubBook;
      return epubBook;
    } catch (error) {
      throw new Error(`Failed to load EPUB: ${error instanceof Error ? error.message : 'Unknown error'}`);
    }
  }

  /**
   * Get cover image URL from EPUB
   */
  private async getCoverUrl(book: ePub.Book): Promise<string | undefined> {
    try {
      const cover = await book.coverUrl();
      return cover;
    } catch {
      return undefined;
    }
  }

  /**
   * Render a chapter/spine item
   */
  async renderChapter(book: EPUBBook, spineIndex: number): Promise<string> {
    try {
      const spineItem = book.spine[spineIndex];
      if (!spineItem) {
        throw new Error('Chapter not found');
      }
      
      const section = await book.book.load(spineItem.id);
      const content = await section.load(book.book.load.bind(book.book));
      
      return content;
    } catch (error) {
      throw new Error(`Failed to render chapter: ${error instanceof Error ? error.message : 'Unknown error'}`);
    }
  }

  /**
   * Get chapter by index
   */
  async getChapter(book: EPUBBook, index: number): Promise<EPUBChapter> {
    if (index < 0 || index >= book.spine.length) {
      throw new Error('Chapter index out of range');
    }
    
    const spineItem = book.spine[index];
    const tocItem = book.toc.find((item: any) => item.href === spineItem.href);
    
    return {
      id: spineItem.id,
      title: tocItem?.label || `Chapter ${index + 1}`,
      href: spineItem.href,
    };
  }

  /**
   * Get total number of chapters
   */
  getChapterCount(book: EPUBBook): number {
    return book.spine.length;
  }

  /**
   * Get table of contents
   */
  getTableOfContents(book: EPUBBook): EPUBChapter[] {
    return book.toc.map((item: any, index: number) => ({
      id: item.id || `toc-${index}`,
      title: item.label,
      href: item.href,
    }));
  }

  /**
   * Search within the book
   */
  async search(book: EPUBBook, query: string): Promise<any[]> {
    try {
      const results = await book.book.search(query);
      return results;
    } catch (error) {
      console.error('Search error:', error);
      return [];
    }
  }

  /**
   * Get current book
   */
  getCurrentBook(): EPUBBook | null {
    return this.currentBook;
  }

  /**
   * Clear current book
   */
  clear(): void {
    this.currentBook = null;
  }
}

export const epubReaderService = new EPUBReaderService();
