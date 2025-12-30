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
  spine: ePub.SpineItem[];
  toc: ePub.NavigationItem[];
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
        spine: book.spine.spineItems || [],
        toc: book.navigation?.toc || [],
      };

      this.currentBook = epubBook;
      return epubBook;
    } catch (error) {
      throw new Error(
        `Failed to load EPUB: ${error instanceof Error ? error.message : 'Unknown error'}`,
      );
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
      if (spineIndex < 0 || spineIndex >= book.spine.length) {
        throw new Error('Chapter index out of range');
      }

      const spineItem = book.spine[spineIndex];
      if (!spineItem) {
        throw new Error('Chapter not found');
      }

      // Load the section using epub.js API
      const section = await book.book.load(spineItem.idref || spineItem.id);

      // Get the HTML content from the section
      // epub.js sections return content directly or via get()
      let content: any;
      try {
        if (typeof section.get === 'function') {
          content = await section.get(book.book.load.bind(book.book));
        } else {
          content = await section.load(book.book.load.bind(book.book));
        }
      } catch {
        // Try alternative method
        content = section;
      }

      // Handle different content types
      if (content && typeof content === 'object') {
        if ('documentElement' in content) {
          return (content as Document).documentElement.outerHTML;
        }
        if ('innerHTML' in content) {
          return (content as HTMLElement).innerHTML;
        }
        if ('textContent' in content) {
          return (content as HTMLElement).innerHTML || (content as HTMLElement).textContent || '';
        }
        // If it's a Section object, try to extract HTML
        if ((content as any).html) {
          return (content as any).html;
        }
      }

      // Fallback: try to get as string
      return typeof content === 'string' ? content : String(content || '');
    } catch (error) {
      throw new Error(
        `Failed to render chapter: ${error instanceof Error ? error.message : 'Unknown error'}`,
      );
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

    // Try to find matching TOC item
    let tocItem: ePub.NavigationItem | undefined;
    try {
      tocItem = book.toc.find((item: ePub.NavigationItem) => {
        const itemHref = item.href || (item as any).id;
        const spineHref = (spineItem as any).href || spineItem.idref || spineItem.id;
        if (!itemHref || !spineHref) return false;
        return (
          itemHref === spineHref || itemHref.includes(spineHref) || spineHref.includes(itemHref)
        );
      });
    } catch {
      // If TOC matching fails, continue without it
    }

    return {
      id: spineItem.id || spineItem.idref || `spine-${index}`,
      title: tocItem?.label || (tocItem as any)?.title || `Chapter ${index + 1}`,
      href: (spineItem as any).href || spineItem.idref || '',
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
    return book.toc.map((item: ePub.NavigationItem, index: number) => ({
      id: (item as any).id || `toc-${index}`,
      title: item.label,
      href: item.href,
    }));
  }

  /**
   * Search within the book
   */
  async search(book: EPUBBook, query: string): Promise<unknown[]> {
    try {
      const results = await book.book.search(query);
      return results as unknown[];
    } catch (error) {
      const { logger } = await import('../logging');
      logger.warn('EPUBReader', 'Search error', undefined, error as Error);
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
