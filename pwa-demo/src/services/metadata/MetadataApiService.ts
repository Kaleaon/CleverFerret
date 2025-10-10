/**
 * Metadata API Service
 * 
 * Fetches metadata from various external APIs (Google Books, TMDB, etc.)
 * Migrated from MetadataApiService.kt and RealMetadataService.kt
 */

import { networkManager } from '../network/NetworkManager';
import { API_ENDPOINTS } from '../../index';

export class MetadataApiService {
  /**
   * Search book metadata from Google Books API
   */
  async searchBookMetadata(
    title: string,
    author?: string,
    isbn?: string
  ): Promise<BookMetadataResult> {
    try {
      let query = '';
      if (isbn) {
        query = `isbn:${encodeURIComponent(isbn)}`;
      } else {
        query = `intitle:${encodeURIComponent(title)}`;
        if (author) {
          query += `+inauthor:${encodeURIComponent(author)}`;
        }
      }

      const response = await networkManager.get<GoogleBooksResponse>(
        `${API_ENDPOINTS.GOOGLE_BOOKS}/volumes?q=${query}&maxResults=5`
      );

      if (!response.success || !response.data?.items?.length) {
        return {
          success: false,
          error: 'No results found',
        };
      }

      const book = response.data.items[0].volumeInfo;

      return {
        success: true,
        metadata: {
          title: book.title,
          authors: book.authors || [],
          publisher: book.publisher,
          publishedDate: book.publishedDate,
          description: book.description,
          isbn: book.industryIdentifiers?.find(id => id.type === 'ISBN_13')?.identifier,
          pageCount: book.pageCount,
          coverUrl: book.imageLinks?.thumbnail || book.imageLinks?.smallThumbnail,
          language: book.language,
          categories: book.categories || [],
          averageRating: book.averageRating,
          ratingsCount: book.ratingsCount,
          sourceId: response.data.items[0].id,
        },
        sources: ['Google Books'],
      };
    } catch (error: any) {
      return {
        success: false,
        error: error.message || 'Failed to fetch book metadata',
      };
    }
  }

  /**
   * Search movie metadata from TMDB API
   */
  async searchMovieMetadata(
    title: string,
    year?: number,
    imdbId?: string
  ): Promise<MovieMetadataResult> {
    try {
      // Note: TMDB requires an API key - this is a placeholder
      const apiKey = ''; // User would need to provide their own key

      if (!apiKey) {
        return {
          success: false,
          error: 'TMDB API key not configured',
        };
      }

      let endpoint = '';
      if (imdbId) {
        endpoint = `${API_ENDPOINTS.TMDB}/find/${imdbId}?api_key=${apiKey}&external_source=imdb_id`;
      } else {
        let query = `${API_ENDPOINTS.TMDB}/search/movie?api_key=${apiKey}&query=${encodeURIComponent(title)}`;
        if (year) {
          query += `&year=${year}`;
        }
        endpoint = query;
      }

      const response = await networkManager.get<TMDBSearchResponse>(endpoint);

      if (!response.success || !response.data?.results?.length) {
        return {
          success: false,
          error: 'No results found',
        };
      }

      const movie = response.data.results[0];

      return {
        success: true,
        metadata: {
          title: movie.title,
          originalTitle: movie.original_title,
          overview: movie.overview,
          releaseDate: movie.release_date,
          year: movie.release_date ? parseInt(movie.release_date.substring(0, 4)) : undefined,
          posterUrl: movie.poster_path ? `https://image.tmdb.org/t/p/w500${movie.poster_path}` : undefined,
          backdropUrl: movie.backdrop_path ? `https://image.tmdb.org/t/p/w1280${movie.backdrop_path}` : undefined,
          voteAverage: movie.vote_average,
          voteCount: movie.vote_count,
          popularity: movie.popularity,
          tmdbId: movie.id?.toString(),
          imdbId: imdbId || undefined,
        },
        sources: ['TMDB'],
      };
    } catch (error: any) {
      return {
        success: false,
        error: error.message || 'Failed to fetch movie metadata',
      };
    }
  }

  /**
   * Search music metadata from MusicBrainz API
   */
  async searchMusicMetadata(
    artist?: string,
    album?: string,
    track?: string
  ): Promise<MusicMetadataResult> {
    try {
      const parts: string[] = [];
      if (track) parts.push(`recording:"${track}"`);
      if (artist) parts.push(`artist:"${artist}"`);
      if (album) parts.push(`release:"${album}"`);
      const query = parts.join(' AND ');

      const response = await networkManager.get<MusicBrainzResponse>(
        `${API_ENDPOINTS.MUSICBRAINZ}/recording?query=${encodeURIComponent(query)}&fmt=json&limit=5`
      );

      if (!response.success || !response.data?.recordings?.length) {
        return {
          success: false,
          error: 'No results found',
        };
      }

      const recording = response.data.recordings[0];

      return {
        success: true,
        metadata: {
          title: recording.title,
          artist: recording['artist-credit']?.[0]?.name,
          album: recording.releases?.[0]?.title,
          duration: recording.length,
          releaseDate: recording.releases?.[0]?.date,
          mbid: recording.id,
          coverUrl: undefined, // MusicBrainz doesn't provide cover art directly
        },
        sources: ['MusicBrainz'],
      };
    } catch (error: any) {
      return {
        success: false,
        error: error.message || 'Failed to fetch music metadata',
      };
    }
  }

  /**
   * Get cover art from Cover Art Archive
   */
  async getCoverArt(mbid: string): Promise<string | null> {
    try {
      const response = await networkManager.get<any>(
        `https://coverartarchive.org/release/${mbid}`
      );

      if (response.success && response.data?.images?.length) {
        return response.data.images[0].image;
      }

      return null;
    } catch (error) {
      console.warn(`Failed to fetch cover art for MBID: ${mbid}`, error);
      return null;
    }
  }
}

// Type definitions

interface GoogleBooksResponse {
  items?: Array<{
    id: string;
    volumeInfo: {
      title: string;
      authors?: string[];
      publisher?: string;
      publishedDate?: string;
      description?: string;
      industryIdentifiers?: Array<{ type: string; identifier: string }>;
      pageCount?: number;
      imageLinks?: {
        thumbnail?: string;
        smallThumbnail?: string;
      };
      language?: string;
      categories?: string[];
      averageRating?: number;
      ratingsCount?: number;
    };
  }>;
}

interface TMDBSearchResponse {
  results?: Array<{
    id: number;
    title: string;
    original_title: string;
    overview: string;
    release_date: string;
    poster_path?: string;
    backdrop_path?: string;
    vote_average: number;
    vote_count: number;
    popularity: number;
  }>;
}

interface MusicBrainzResponse {
  recordings?: Array<{
    id: string;
    title: string;
    length?: number;
    'artist-credit'?: Array<{ name: string }>;
    releases?: Array<{
      title: string;
      date?: string;
    }>;
  }>;
}

export interface BookMetadata {
  title: string;
  authors: string[];
  publisher?: string;
  publishedDate?: string;
  description?: string;
  isbn?: string;
  pageCount?: number;
  coverUrl?: string;
  language?: string;
  categories: string[];
  averageRating?: number;
  ratingsCount?: number;
  sourceId?: string;
}

export interface MovieMetadata {
  title: string;
  originalTitle?: string;
  overview?: string;
  releaseDate?: string;
  year?: number;
  posterUrl?: string;
  backdropUrl?: string;
  voteAverage?: number;
  voteCount?: number;
  popularity?: number;
  tmdbId?: string;
  imdbId?: string;
}

export interface MusicMetadata {
  title: string;
  artist?: string;
  album?: string;
  duration?: number;
  releaseDate?: string;
  mbid?: string;
  coverUrl?: string;
}

export interface BookMetadataResult {
  success: boolean;
  metadata?: BookMetadata;
  sources?: string[];
  error?: string;
}

export interface MovieMetadataResult {
  success: boolean;
  metadata?: MovieMetadata;
  sources?: string[];
  error?: string;
}

export interface MusicMetadataResult {
  success: boolean;
  metadata?: MusicMetadata;
  sources?: string[];
  error?: string;
}

// Export singleton instance
export const metadataApiService = new MetadataApiService();
