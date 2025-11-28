/**
 * Metadata Service
 * 
 * Fetches metadata from various sources (OpenLibrary, Google Books, etc.)
 */

import { logger } from '../logging';

export interface BookMetadata {
  title: string;
  authors: string[];
  description?: string;
  isbn?: string;
  publishedDate?: string;
  publisher?: string;
  pageCount?: number;
  categories?: string[];
  thumbnailUrl?: string;
  language?: string;
}

export interface MetadataSource {
  name: string;
  fetchMetadata(query: string, isbn?: string): Promise<BookMetadata | null>;
}

class MetadataService {
  private sources: MetadataSource[] = [];

  constructor() {
    this.registerDefaultSources();
  }

  /**
   * Register a metadata source
   */
  registerSource(source: MetadataSource) {
    this.sources.push(source);
    logger.info('MetadataService', `Registered metadata source: ${source.name}`);
  }

  /**
   * Register default sources
   */
  private registerDefaultSources() {
    this.registerSource(new OpenLibrarySource());
    this.registerSource(new GoogleBooksSource());
  }

  /**
   * Fetch metadata from all sources
   */
  async fetchMetadata(query: string, isbn?: string): Promise<BookMetadata | null> {
    logger.info('MetadataService', `Fetching metadata for: ${query}`, { isbn });

    // Try each source until we get a result
    for (const source of this.sources) {
      try {
        const metadata = await source.fetchMetadata(query, isbn);
        if (metadata) {
          logger.info('MetadataService', `Found metadata from ${source.name}`);
          return metadata;
        }
      } catch (error) {
        logger.warn('MetadataService', `Failed to fetch from ${source.name}`, undefined, error as Error);
      }
    }

    logger.warn('MetadataService', 'No metadata found from any source');
    return null;
  }

  /**
   * Fetch metadata by ISBN
   */
  async fetchByISBN(isbn: string): Promise<BookMetadata | null> {
    return this.fetchMetadata(isbn, isbn);
  }
}

/**
 * Open Library metadata source
 */
class OpenLibrarySource implements MetadataSource {
  name = 'OpenLibrary';

  async fetchMetadata(query: string, isbn?: string): Promise<BookMetadata | null> {
    try {
      let url: string;
      if (isbn) {
        url = `https://openlibrary.org/api/books?bibkeys=ISBN:${isbn}&format=json&jscmd=data`;
      } else {
        url = `https://openlibrary.org/search.json?q=${encodeURIComponent(query)}&limit=1`;
      }

      const response = await fetch(url);
      if (!response.ok) {
        throw new Error(`HTTP ${response.status}`);
      }

      const data = await response.json();

      if (isbn) {
        const bookData = data[`ISBN:${isbn}`];
        if (!bookData) return null;

        return {
          title: bookData.title || query,
          authors: bookData.authors?.map((a: any) => a.name) || [],
          description: bookData.notes || undefined,
          isbn,
          publishedDate: bookData.publish_date,
          publisher: bookData.publishers?.[0]?.name,
          pageCount: bookData.number_of_pages,
          categories: bookData.subjects?.map((s: any) => s.name) || [],
          thumbnailUrl: bookData.cover?.large || bookData.cover?.medium,
          language: bookData.languages?.[0]?.key?.replace('/languages/', ''),
        };
      } else {
        const docs = data.docs;
        if (!docs || docs.length === 0) return null;

        const book = docs[0];
        return {
          title: book.title || query,
          authors: book.author_name || [],
          description: undefined,
          isbn: book.isbn?.[0],
          publishedDate: book.first_publish_year?.toString(),
          pageCount: book.number_of_pages?.[0],
          categories: book.subject || [],
          thumbnailUrl: book.cover_i ? `https://covers.openlibrary.org/b/id/${book.cover_i}-L.jpg` : undefined,
          language: book.language?.[0],
        };
      }
    } catch (error) {
      throw new Error(`OpenLibrary fetch failed: ${error instanceof Error ? error.message : 'Unknown error'}`);
    }
  }
}

/**
 * Google Books metadata source
 */
class GoogleBooksSource implements MetadataSource {
  name = 'GoogleBooks';

  async fetchMetadata(query: string, isbn?: string): Promise<BookMetadata | null> {
    try {
      const searchQuery = isbn ? `isbn:${isbn}` : query;
      const url = `https://www.googleapis.com/books/v1/volumes?q=${encodeURIComponent(searchQuery)}&maxResults=1`;

      const response = await fetch(url);
      if (!response.ok) {
        throw new Error(`HTTP ${response.status}`);
      }

      const data = await response.json();
      if (!data.items || data.items.length === 0) return null;

      const volume = data.items[0].volumeInfo;
      if (!volume) return null;

      return {
        title: volume.title || query,
        authors: volume.authors || [],
        description: volume.description,
        isbn: volume.industryIdentifiers?.find((id: any) => id.type === 'ISBN_13' || id.type === 'ISBN_10')?.identifier,
        publishedDate: volume.publishedDate,
        publisher: volume.publisher,
        pageCount: volume.pageCount,
        categories: volume.categories,
        thumbnailUrl: volume.imageLinks?.thumbnail || volume.imageLinks?.smallThumbnail,
        language: volume.language,
      };
    } catch (error) {
      throw new Error(`Google Books fetch failed: ${error instanceof Error ? error.message : 'Unknown error'}`);
    }
  }
}

export const metadataService = new MetadataService();
