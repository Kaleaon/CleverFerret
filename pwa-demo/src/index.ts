/**
 * CleverFerret PWA - Main Export Index
 * 
 * Central export file for easy imports throughout the application
 */

// ============================================================================
// Data Entities
// ============================================================================
export * from './data/local/entity';

// ============================================================================
// UI Models
// ============================================================================
export * from './ui/models';

// ============================================================================
// Database
// ============================================================================
export { db, dbUtils, initializeDatabase, CleverFerretDatabase } from './services/database-complete';

// ============================================================================
// Services (to be implemented)
// ============================================================================
// export * from './services/network/NetworkManager';
// export * from './services/metadata/MetadataApiService';
// export * from './services/cache/CacheManager';
// export * from './services/playback/PlaybackManager';
// export * from './services/reader/ReaderService';

// ============================================================================
// Utilities
// ============================================================================
// export * from './utils/coverGenerator';

// ============================================================================
// Store
// ============================================================================
// export * from './store/app-store';

// ============================================================================
// Themes
// ============================================================================
// export * from './themes/themes';
// export * from './themes/unified-themes';

/**
 * Version information
 */
export const VERSION = {
  app: '1.0.0',
  database: 1,
  migrationStatus: 'Phase 1 Complete - Foundation',
  migrationDate: '2025-10-10',
};

/**
 * Application constants
 */
export const APP_CONSTANTS = {
  DATABASE_NAME: 'CleverFerretDB',
  APP_NAME: 'CleverFerret',
  APP_DESCRIPTION: 'Universal Media Library PWA',
  DEFAULT_PAGE_SIZE: 50,
  MAX_CACHE_SIZE: 100 * 1024 * 1024, // 100MB
  THUMBNAIL_SIZE: 300,
  COVER_SIZE: 600,
};

/**
 * Feature flags
 */
export const FEATURES = {
  PLEX_INTEGRATION: true,
  EMBY_INTEGRATION: true,
  JELLYFIN_INTEGRATION: true,
  CALIBRE_IMPORT: true,
  OPDS_SERVER: true,
  CLOUD_SYNC: true,
  AUDIO_VISUALIZER: true,
  TTS: true,
  OCR: false, // Not implemented yet
  NER: false, // Not implemented yet
  WEBFICTION: true,
  PODCASTS: true,
  RADIO: true,
  COLLECTIONS: true,
  SMART_COLLECTIONS: true,
  MAINTENANCE_MODE: true,
};

/**
 * API endpoints (to be configured)
 */
export const API_ENDPOINTS = {
  GOOGLE_BOOKS: 'https://www.googleapis.com/books/v1',
  TMDB: 'https://api.themoviedb.org/3',
  OMDB: 'http://www.omdbapi.com',
  MUSICBRAINZ: 'https://musicbrainz.org/ws/2',
  SPOTIFY: 'https://api.spotify.com/v1',
  LASTFM: 'https://ws.audioscrobbler.com/2.0',
  OPENLIBRARY: 'https://openlibrary.org/api',
};

/**
 * Supported media types
 */
export const MEDIA_TYPES = {
  BOOK: 'BOOK',
  MOVIE: 'MOVIE',
  TV_SHOW: 'TV_SHOW',
  MUSIC_TRACK: 'MUSIC_TRACK',
  PODCAST: 'PODCAST',
  AUDIOBOOK: 'AUDIOBOOK',
  COMIC: 'COMIC',
  RADIO: 'RADIO',
  MAGAZINE: 'MAGAZINE',
  NEWS: 'NEWS',
  FANFICTION: 'FANFICTION',
} as const;

/**
 * Supported file extensions
 */
export const FILE_EXTENSIONS = {
  EBOOK: ['epub', 'pdf', 'mobi', 'azw', 'azw3', 'fb2', 'djvu', 'txt'],
  AUDIO: ['mp3', 'm4a', 'flac', 'wav', 'ogg', 'opus', 'aac', 'wma'],
  VIDEO: ['mp4', 'mkv', 'avi', 'mov', 'webm', 'flv', 'wmv', 'm4v'],
  COMIC: ['cbz', 'cbr', 'cb7', 'cbt'],
  IMAGE: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'svg'],
} as const;

/**
 * Library sources
 */
export const LIBRARY_SOURCES = {
  LOCAL: 'LOCAL',
  PLEX: 'PLEX',
  EMBY: 'EMBY',
  JELLYFIN: 'JELLYFIN',
  CALIBRE: 'CALIBRE',
  OPDS: 'OPDS',
} as const;

export default {
  VERSION,
  APP_CONSTANTS,
  FEATURES,
  API_ENDPOINTS,
  MEDIA_TYPES,
  FILE_EXTENSIONS,
  LIBRARY_SOURCES,
};
