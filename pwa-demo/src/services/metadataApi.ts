/**
 * Interface defining the structure for a standardized metadata search result
 * from various external APIs.
 */
export interface MetadataSearchResult {
  id: string;
  title: string;
  author?: string;
  director?: string;
  artist?: string;
  year?: number;
  poster?: string;
  cover?: string;
  description?: string;
  genre?: string[];
  rating?: number;
  isbn?: string;
  imdbId?: string;
  source: 'google-books' | 'open-library' | 'tmdb' | 'omdb' | 'musicbrainz' | 'spotify' | 'hardcover' | 'comicvine';
}

/**
 * A wrapper for the Google Books API to search for and retrieve book metadata.
 */
export class GoogleBooksAPI {
  private static readonly BASE_URL = 'https://www.googleapis.com/books/v1/volumes';

  /**
   * Searches the Google Books API for a given query.
   * @param {string} query - The search term.
   * @returns {Promise<MetadataSearchResult[]>} A promise that resolves to an array of search results.
   */
  static async searchBooks(query: string): Promise<MetadataSearchResult[]> {
    try {
      const response = await fetch(`${this.BASE_URL}?q=${encodeURIComponent(query)}&maxResults=10`);
      const data = await response.json();

      return data.items?.map((item: any) => ({
        id: item.id,
        title: item.volumeInfo.title || 'Unknown Title',
        author: item.volumeInfo.authors?.join(', '),
        year: item.volumeInfo.publishedDate ? new Date(item.volumeInfo.publishedDate).getFullYear() : undefined,
        cover: item.volumeInfo.imageLinks?.thumbnail,
        description: item.volumeInfo.description,
        genre: item.volumeInfo.categories,
        rating: item.volumeInfo.averageRating,
        isbn: item.volumeInfo.industryIdentifiers?.find((id: any) => id.type === 'ISBN_13')?.identifier,
        source: 'google-books' as const,
      })) || [];
    } catch (error) {
      console.error('Google Books API error:', error);
      return [];
    }
  }

  /**
   * Retrieves detailed information for a single book by its Google Books ID.
   * @param {string} id - The Google Books volume ID.
   * @returns {Promise<MetadataSearchResult | null>} A promise that resolves to the book details or null on error.
   */
  static async getBookDetails(id: string): Promise<MetadataSearchResult | null> {
    try {
      const response = await fetch(`${this.BASE_URL}/${id}`);
      const item = await response.json();

      return {
        id: item.id,
        title: item.volumeInfo.title || 'Unknown Title',
        author: item.volumeInfo.authors?.join(', '),
        year: item.volumeInfo.publishedDate ? new Date(item.volumeInfo.publishedDate).getFullYear() : undefined,
        cover: item.volumeInfo.imageLinks?.thumbnail || item.volumeInfo.imageLinks?.smallThumbnail,
        description: item.volumeInfo.description,
        genre: item.volumeInfo.categories,
        rating: item.volumeInfo.averageRating,
        isbn: item.volumeInfo.industryIdentifiers?.find((id: any) => id.type === 'ISBN_13')?.identifier,
        source: 'google-books',
      };
    } catch (error) {
      console.error('Google Books API error:', error);
      return null;
    }
  }
}

/**
 * A wrapper for the Open Library API to search for book metadata.
 */
export class OpenLibraryAPI {
  private static readonly BASE_URL = 'https://openlibrary.org';

  /**
   * Searches the Open Library API for a given query.
   * @param {string} query - The search term.
   * @returns {Promise<MetadataSearchResult[]>} A promise that resolves to an array of search results.
   */
  static async searchBooks(query: string): Promise<MetadataSearchResult[]> {
    try {
      const response = await fetch(`${this.BASE_URL}/search.json?q=${encodeURIComponent(query)}&limit=10`);
      const data = await response.json();

      return data.docs?.map((doc: any) => ({
        id: doc.key,
        title: doc.title,
        author: doc.author_name?.join(', '),
        year: doc.first_publish_year,
        cover: doc.cover_i ? `https://covers.openlibrary.org/b/id/${doc.cover_i}-M.jpg` : undefined,
        isbn: doc.isbn?.[0],
        source: 'open-library' as const,
      })) || [];
    } catch (error) {
      console.error('Open Library API error:', error);
      return [];
    }
  }
}

/**
 * A wrapper for the TMDB API to search for movie and TV show metadata.
 * Note: This implementation uses mock data as it requires a valid API key.
 */
export class TMDBAPI {
  private static readonly BASE_URL = 'https://api.themoviedb.org/3';
  private static readonly API_KEY = 'demo'; // Would need actual API key

  /**
   * Searches the TMDB API for movies. (Currently returns mock data).
   * @param {string} query - The search term.
   * @returns {Promise<MetadataSearchResult[]>} A promise that resolves to an array of mock search results.
   */
  static async searchMovies(query: string): Promise<MetadataSearchResult[]> {
    try {
      // Using a demo endpoint for now - would need actual API key
      const mockResults: MetadataSearchResult[] = [
        {
          id: '1',
          title: `Search result for: ${query}`,
          director: 'Demo Director',
          year: 2024,
          poster: 'https://via.placeholder.com/300x450/1a1a1a/e5a00d?text=Movie+Poster',
          description: 'This is a demo movie result. In production, this would use the actual TMDB API.',
          genre: ['Action', 'Drama'],
          rating: 8.5,
          source: 'tmdb',
        }
      ];
      return mockResults;
    } catch (error) {
      console.error('TMDB API error:', error);
      return [];
    }
  }
}

/**
 * A wrapper for the OMDb API.
 * Note: This implementation uses mock data as it requires a valid API key.
 */
export class OMDbAPI {
  private static readonly BASE_URL = 'https://www.omdbapi.com/';

  /**
   * Searches the OMDb API for movies. (Currently returns mock data).
   * @param {string} query - The search term.
   * @returns {Promise<MetadataSearchResult[]>} A promise that resolves to an array of mock search results.
   */
  static async searchMovies(query: string): Promise<MetadataSearchResult[]> {
    try {
      // Demo implementation - would need actual API key
      const mockResults: MetadataSearchResult[] = [
        {
          id: '1',
          title: `OMDb result: ${query}`,
          director: 'Demo Director',
          year: 2024,
          poster: 'https://via.placeholder.com/300x450/1a1a1a/e5a00d?text=OMDb+Result',
          description: 'Demo OMDb result. Would use actual API in production.',
          rating: 7.8,
          source: 'omdb',
        }
      ];
      return mockResults;
    } catch (error) {
      console.error('OMDb API error:', error);
      return [];
    }
  }
}

/**
 * A wrapper for the MusicBrainz API to search for music metadata.
 */
export class MusicBrainzAPI {
  private static readonly BASE_URL = 'https://musicbrainz.org/ws/2';

  /**
   * Searches the MusicBrainz API for music releases.
   * @param {string} query - The search term.
   * @returns {Promise<MetadataSearchResult[]>} A promise that resolves to an array of search results.
   */
  static async searchMusic(query: string): Promise<MetadataSearchResult[]> {
    try {
      const response = await fetch(
        `${this.BASE_URL}/release-group/?query=${encodeURIComponent(query)}&fmt=json&limit=10`
      );
      const data = await response.json();

      return data['release-groups']?.map((release: any) => ({
        id: release.id,
        title: release.title,
        artist: release['artist-credit']?.[0]?.name,
        year: release['first-release-date'] ? new Date(release['first-release-date']).getFullYear() : undefined,
        genre: release.tags?.map((tag: any) => tag.name),
        source: 'musicbrainz' as const,
      })) || [];
    } catch (error) {
      console.error('MusicBrainz API error:', error);
      return [];
    }
  }
}

/**
 * A facade service for searching across multiple metadata APIs based on media type.
 */
export class MetadataAPIService {
  /**
   * Searches for metadata across relevant APIs based on the specified media type.
   * @param {string} query - The search term.
   * @param {string} mediaType - The type of media to search for (e.g., 'book', 'movie').
   * @returns {Promise<MetadataSearchResult[]>} A promise that resolves to a combined array of search results.
   */
  static async searchMetadata(query: string, mediaType: string): Promise<MetadataSearchResult[]> {
    const results: MetadataSearchResult[] = [];

    try {
      switch (mediaType.toLowerCase()) {
        case 'book':
          const [googleBooks, openLibrary] = await Promise.all([
            GoogleBooksAPI.searchBooks(query),
            OpenLibraryAPI.searchBooks(query),
          ]);
          results.push(...googleBooks, ...openLibrary);
          break;

        case 'movie':
        case 'tv':
          const [tmdb, omdb] = await Promise.all([
            TMDBAPI.searchMovies(query),
            OMDbAPI.searchMovies(query),
          ]);
          results.push(...tmdb, ...omdb);
          break;

        case 'music':
          const musicbrainz = await MusicBrainzAPI.searchMusic(query);
          results.push(...musicbrainz);
          break;

        default:
          // Try Google Books as fallback
          const fallback = await GoogleBooksAPI.searchBooks(query);
          results.push(...fallback);
      }
    } catch (error) {
      console.error('Metadata search error:', error);
    }

    return results;
  }
}