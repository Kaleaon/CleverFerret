/**
 * Complete Dexie.js Database Implementation
 * 
 * Migrated from AppDatabase.kt
 * Implements IndexedDB database with all entities from the Android app
 */

import Dexie, { Table } from 'dexie';
import type { LogEntry } from './logging';

// Import all entity types
import type {
  MediaItem,
  Library,
  MetadataCommon,
  MetadataBook,
  MetadataMovie,
  MetadataMusicTrack,
  People,
  ItemPersonRole,
  Series,
  Album,
  Genre,
  ItemGenre,
  Playlist,
  PlaylistItem,
  Bookmark,
  ReadingProgress,
  ReadingSession,
  TextAnnotation,
  SearchIndex,
  ReadingStatistics,
  UnifiedTag,
  ItemTag,
  UnifiedCollection,
  ItemCollection,
  PlaybackQueue,
  QueueItem,
  PlaybackSession,
  RadioStation,
  ReaderSettingsEntity,
  BookReaderSettingsEntity,
  PlexServer,
  PlexMediaItem,
  EmbyServer,
  JellyfinServer,
  DownloadedStory,
  StoryUpdate,
  SharedLink,
  MaintenanceChange,
  APIKey,
} from '../data/local/entity';

import type {
  PodcastEntity,
  PodcastEpisodeEntity,
  PodcastSubscriptionEntity,
  PodcastChapterEntity,
} from '../data/local/entity/podcast-types';

import type {
  PlexTag,
  PlexMediaTag,
  PlexCollection,
  PlexCollectionItem,
  PlexProgress,
  PlexRating,
} from '../data/local/entity/plex-types';

/**
 * CleverFerret Universal Media Library Database
 * 
 * Complete database implementation supporting all media types with metadata,
 * progress tracking, bookmarks, and external service integration.
 */
export class CleverFerretDatabase extends Dexie {
  // Core tables
  libraries!: Table<Library, number>;
  mediaItems!: Table<MediaItem, number>;
  metadataCommon!: Table<MetadataCommon, number>;
  metadataBook!: Table<MetadataBook, number>;
  metadataMovie!: Table<MetadataMovie, number>;
  metadataMusicTrack!: Table<MetadataMusicTrack, number>;

  // People and relationships
  people!: Table<People, number>;
  itemPersonRoles!: Table<ItemPersonRole, number>;

  // Series and albums
  series!: Table<Series, number>;
  albums!: Table<Album, number>;

  // Genres
  genres!: Table<Genre, number>;
  itemGenres!: Table<ItemGenre, number>;

  // Playlists
  playlists!: Table<Playlist, number>;
  playlistItems!: Table<PlaylistItem, number>;

  // Bookmarks and progress
  bookmarks!: Table<Bookmark, number>;
  readingProgress!: Table<ReadingProgress, number>;
  readingSessions!: Table<ReadingSession, number>;
  textAnnotations!: Table<TextAnnotation, number>;
  searchIndex!: Table<SearchIndex, number>;
  readingStatistics!: Table<ReadingStatistics, number>;

  // Tags and collections
  unifiedTags!: Table<UnifiedTag, number>;
  itemTags!: Table<ItemTag, number>;
  unifiedCollections!: Table<UnifiedCollection, number>;
  itemCollections!: Table<ItemCollection, number>;

  // Playback queues
  playbackQueues!: Table<PlaybackQueue, number>;
  queueItems!: Table<QueueItem, number>;
  playbackSessions!: Table<PlaybackSession, number>;

  // Podcasts
  podcasts!: Table<PodcastEntity, number>;
  podcastEpisodes!: Table<PodcastEpisodeEntity, number>;
  podcastSubscriptions!: Table<PodcastSubscriptionEntity, number>;
  podcastChapters!: Table<PodcastChapterEntity, number>;

  // Radio
  radioStations!: Table<RadioStation, number>;

  // Reader settings
  readerSettings!: Table<ReaderSettingsEntity, number>;
  bookReaderSettings!: Table<BookReaderSettingsEntity, number>;

  // Server integrations
  plexServers!: Table<PlexServer, number>;
  plexMediaItems!: Table<PlexMediaItem, number>;
  plexTags!: Table<PlexTag, number>;
  plexMediaTags!: Table<PlexMediaTag, number>;
  plexCollections!: Table<PlexCollection, number>;
  plexCollectionItems!: Table<PlexCollectionItem, number>;
  plexProgress!: Table<PlexProgress, number>;
  plexRatings!: Table<PlexRating, number>;
  embyServers!: Table<EmbyServer, number>;
  jellyfinServers!: Table<JellyfinServer, number>;

  // Story management
  downloadedStories!: Table<DownloadedStory, string>;
  storyUpdates!: Table<StoryUpdate, number>;

  // Comic management
  downloadedComics!: Table<any, string>;

  // Miscellaneous
  sharedLinks!: Table<SharedLink, number>;
  maintenanceChanges!: Table<MaintenanceChange, number>;
  apiKeys!: Table<APIKey, number>;
  logs!: Table<LogEntry, number>;

  constructor() {
    super('CleverFerretDB');

    // Version 50 - consolidated database schema
    // Higher version number to handle upgrades from older database versions
    this.version(50).stores({
      // Core tables
      libraries: '++libraryId, type, source, isActive, lastScanned',
      mediaItems: '++itemId, libraryId, filePath, fileHash, mediaType, dateAdded, lastScanned',
      metadataCommon: 'itemId, isFavorite, isDownloaded',
      metadataBook: 'itemId, isRead, series',
      metadataMovie: 'itemId, watchedStatus, imdbId, tmdbId',
      metadataMusicTrack: 'itemId, album, artist, playCount, isFavorite',

      // People and relationships
      people: '++personId, name, imdbId, tmdbId, musicBrainzId',
      itemPersonRoles: '[itemId+personId+role], itemId, personId, role',

      // Series and albums
      series: '++seriesId, name, mediaType',
      albums: '++albumId, title, albumArtistId, musicBrainzAlbumId, spotifyAlbumId',

      // Genres
      genres: '++genreId, name, mediaType, externalId',
      itemGenres: '[itemId+genreId], itemId, genreId',

      // Playlists
      playlists: '++playlistId, name, plexPlaylistId',
      playlistItems: '++id, playlistId, mediaItemId, [playlistId+position]',

      // Bookmarks and progress
      bookmarks: '++bookmarkId, itemId, dateCreated, isActive',
      readingProgress: '++progressId, itemId, isCompleted, lastUpdate',
      readingSessions: '++sessionId, itemId, sessionStart',
      textAnnotations: '++annotationId, itemId, chapterIndex, dateCreated',
      searchIndex: '++indexId, itemId, chapterIndex, searchText',
      readingStatistics: '++statisticsId, itemId, date',

      // Tags and collections
      unifiedTags: '++tagId, name, type, lastUsed',
      itemTags: '++id, [itemId+tagId], itemId, tagId, appliedAt',
      unifiedCollections: '++collectionId, name, type, createdAt, lastModified, isSmartCollection',
      itemCollections: '[itemId+collectionId], itemId, collectionId, [collectionId+sortOrder], addedAt',

      // Playback queues
      playbackQueues: '++queueId, queueName, isActive, lastUsed',
      queueItems: '++queueItemId, [queueId+queuePosition], mediaItemId, queueId, addedToQueue',
      playbackSessions: '++sessionId, sessionName, isActive, lastUsed',

      // Podcasts
      podcasts: '++id, feedUrl, title, isSubscribed',
      podcastEpisodes: '++id, podcastId, guid, publishDate, isNew, downloaded',
      podcastSubscriptions: '++id, podcastId',
      podcastChapters: '++id, episodeId, startTime',

      // Radio
      radioStations: '++id, name, genre, isFavorite',

      // Reader settings
      readerSettings: 'id, updatedAt',
      bookReaderSettings: 'bookId, lastReadAt',

      // Server integrations
      plexServers: '++serverId, machineIdentifier, isActive',
      plexMediaItems: '++id, serverId, plexRatingKey, localMediaItemId',
      plexTags: '++id, [serverId+tag], serverId',
      plexMediaTags: '++id, plexMediaItemId, tagId',
      plexCollections: '++id, serverId, plexRatingKey',
      plexCollectionItems: '++id, collectionId, plexMediaItemId',
      plexProgress: '++id, plexMediaItemId',
      plexRatings: '++id, plexMediaItemId',
      embyServers: '++id, [host+port], isActive',
      jellyfinServers: '++id, [host+port], isActive',

      // Story management
      downloadedStories: 'id, site, siteStoryId, hasUpdates, lastChecked',
      storyUpdates: '++id, storyId, timestamp',

      // Comic management
      downloadedComics: 'id, site, url, title, lastUpdated',

      // Miscellaneous
      sharedLinks: '++id, token, [targetType+targetId]',
      maintenanceChanges: '++changeId, itemId, status, createdAt',
      apiKeys: '++keyId, provider, isActive',
      logs: '++id, timestamp, level, category',
    });
  }

  /**
   * Clear all data from database (for testing/reset)
   */
  async clearAll(): Promise<void> {
    await this.transaction('rw', this.tables, async () => {
      for (const table of this.tables) {
        await table.clear();
      }
    });
  }

  /**
   * Export database to JSON (for backup)
   */
  async exportToJSON(): Promise<string> {
    const data: Record<string, any[]> = {};

    await this.transaction('r', this.tables, async () => {
      for (const table of this.tables) {
        data[table.name] = await table.toArray();
      }
    });

    return JSON.stringify(data, null, 2);
  }

  /**
   * Import database from JSON (for restore)
   */
  async importFromJSON(jsonData: string): Promise<void> {
    const data = JSON.parse(jsonData);

    await this.transaction('rw', this.tables, async () => {
      for (const [tableName, records] of Object.entries(data)) {
        const table = (this as any)[tableName];
        if (table) {
          await table.bulkPut(records);
        }
      }
    });
  }

  /**
   * Get database statistics
   */
  async getStatistics(): Promise<Record<string, number>> {
    const stats: Record<string, number> = {};

    await this.transaction('r', this.tables, async () => {
      for (const table of this.tables) {
        stats[table.name] = await table.count();
      }
    });

    return stats;
  }
}

// Create and export singleton instance
export const db = new CleverFerretDatabase();

// Export database instance as default
export default db;

/**
 * Initialize database with default data if needed
 */
export async function initializeDatabase(): Promise<void> {
  // Check if database is empty
  const libraryCount = await db.libraries.count();

  if (libraryCount === 0) {
    // Add default reader settings
    await db.readerSettings.add({
      id: 1,
      fontSize: 18,
      fontFamily: 'System Default',
      lineHeight: 1.5,
      letterSpacing: 0,
      fontWeight: 'Normal',
      marginTop: 32,
      marginBottom: 32,
      marginLeft: 24,
      marginRight: 24,
      textAlignment: 'Left',
      paragraphSpacing: 8,
      pageTurnAnimation: 'Slide',
      pageTurnSpeed: 'Normal',
      tapToTurnPages: true,
      swipeToTurnPages: true,
      volumeKeysToTurnPages: true,
      theme: 'Auto',
      brightness: -1,
      nightMode: false,
      autoNightMode: true,
      nightModeStart: '22:00',
      nightModeEnd: '07:00',
      enableHyphenation: true,
      enablePageNumbers: true,
      enableProgressIndicator: true,
      fullScreenMode: false,
      keepScreenOn: true,
      enableDictionaryLookup: true,
      enableTextSelection: true,
      enableTranslation: true,
      scrollingMode: false,
      updatedAt: Date.now(),
    });

    console.log('Database initialized with default data');
  }
}

/**
 * Database utility functions
 */
export const dbUtils = {
  /**
   * Get media item with all metadata
   */
  async getMediaItemWithMetadata(itemId: number) {
    const [item, metadata, bookMetadata, movieMetadata, musicMetadata] = await Promise.all([
      db.mediaItems.get(itemId),
      db.metadataCommon.get(itemId),
      db.metadataBook.get(itemId),
      db.metadataMovie.get(itemId),
      db.metadataMusicTrack.get(itemId),
    ]);

    return {
      item,
      metadata,
      bookMetadata,
      movieMetadata,
      musicMetadata,
    };
  },

  /**
   * Search media items by title
   */
  async searchMediaItems(query: string, limit: number = 50) {
    const lowerQuery = query.toLowerCase();

    const items = await db.mediaItems
      .filter((item) => item.fileName.toLowerCase().includes(lowerQuery))
      .limit(limit)
      .toArray();

    return items;
  },

  /**
   * Get recent media items
   */
  async getRecentMediaItems(limit: number = 20) {
    return db.mediaItems
      .orderBy('dateAdded')
      .reverse()
      .limit(limit)
      .toArray();
  },

  /**
   * Get media items by library
   */
  async getMediaItemsByLibrary(libraryId: number) {
    return db.mediaItems
      .where('libraryId')
      .equals(libraryId)
      .toArray();
  },

  /**
   * Get current reading progress
   */
  async getCurrentReadingProgress() {
    return db.readingProgress
      .where('isCompleted')
      .equals(0) // false in IndexedDB
      .reverse()
      .sortBy('lastUpdate');
  },
};
