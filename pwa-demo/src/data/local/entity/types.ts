// ============================================================================
// Core Media Entities
// ============================================================================

/**
 * Central entity for all individual media files in the system
 * 
 * This interface stores the core file information and relationships
 * to libraries, with detailed metadata stored in separate tables.
 */
export interface MediaItem {
  itemId: number;
  libraryId: number;
  filePath: string;
  fileName: string;
  fileExtension: string;
  fileSize: number;
  fileHash?: string;
  dateAdded: number;
  lastScanned: number;
  lastModified: number;
  mediaType: string; // BOOK, MOVIE, TV_SHOW, MUSIC_TRACK, etc.
  mimeType?: string;
  isAvailable: boolean;
  hasMetadata: boolean;
  hasThumbnail: boolean;
  thumbnailPath?: string;
}

/**
 * Entity representing a media library in the Universal Media Library system
 * 
 * Each library represents a collection of media items of a specific type
 * (books, movies, music, etc.) stored in a particular file system location.
 */
export interface Library {
  libraryId: number;
  name: string;
  type: string; // BOOK, MOVIE, TV_SHOW, MUSIC, COMIC, PODCAST, etc.
  path: string;
  source: string; // LOCAL, PLEX, JELLYFIN, EMBY, CALIBRE
  dateModified: number;
  description?: string;
  isActive: boolean;
  lastScanned?: number;
}

// ============================================================================
// Metadata Entities
// ============================================================================

/**
 * Common metadata fields shared across all media types
 * 
 * This interface stores metadata that applies to books, movies, music, etc.
 * Type-specific metadata is stored in separate interfaces.
 */
export interface MetadataCommon {
  itemId: number;
  title: string;
  sortTitle?: string;
  originalTitle?: string;
  year?: number;
  releaseDate?: number;
  rating?: number;
  userRating?: number;
  communityRating?: number;
  summary?: string;
  plot?: string;
  tagline?: string;
  coverImagePath?: string;
  backdropImagePath?: string;
  language?: string;
  country?: string;
  lastUpdated: number;
  metadataSource?: string;
  externalId?: string;
  isFavorite: boolean;
  isDownloaded: boolean;
}

/**
 * Book-specific metadata entity
 */
export interface MetadataBook {
  itemId: number;
  subtitle?: string;
  publisher?: string;
  isbn?: string;
  isbn13?: string;
  asin?: string;
  pageCount?: number;
  wordCount?: number;
  chapterCount?: number;
  series?: string;
  seriesIndex?: number;
  format?: string; // EPUB, PDF, MOBI, etc.
  edition?: string;
  printLength?: number;
  publicationDate?: number;
  firstPublishedDate?: number;
  readingProgress: number; // 0.0 to 1.0
  isRead: boolean;
  lastReadDate?: number;
  currentPage: number;
  currentChapter: number;
  averageRating?: number;
  ratingsCount?: number;
  reviewsCount?: number;
}

/**
 * Movie-specific metadata entity
 */
export interface MetadataMovie {
  itemId: number;
  runtime?: number; // Duration in minutes
  budget?: number;
  revenue?: number;
  imdbId?: string;
  tmdbId?: string;
  rottenTomatoesId?: string;
  collection?: string;
  franchise?: string;
  certification?: string; // Rating like PG-13, R, etc.
  contentRating?: string;
  aspectRatio?: string;
  resolution?: string; // 1080p, 4K, etc.
  videoCodec?: string;
  audioCodec?: string;
  watchedStatus: string; // UNWATCHED, WATCHING, WATCHED
  watchedDate?: number;
  watchProgress: number; // 0.0 to 1.0
  resumePosition: number; // Position in milliseconds
  criticScore?: number;
  audienceScore?: number;
  metacriticScore?: number;
}

/**
 * Music track-specific metadata entity
 */
export interface MetadataMusicTrack {
  itemId: number;
  album?: string;
  albumArtist?: string;
  artist?: string;
  composer?: string;
  trackNumber?: number;
  totalTracks?: number;
  discNumber?: number;
  totalDiscs?: number;
  duration?: number; // Duration in milliseconds
  bitrate?: number;
  sampleRate?: number;
  channels?: number;
  musicBrainzTrackId?: string;
  musicBrainzAlbumId?: string;
  musicBrainzArtistId?: string;
  spotifyId?: string;
  bpm?: number;
  key?: string;
  mood?: string;
  energy?: number;
  playCount: number;
  lastPlayed?: number;
  isFavorite: boolean;
  skipCount: number;
  lyrics?: string;
  hasLyrics: boolean;
  lyricsSource?: string;
}

// ============================================================================
// Person, Series, Album, Genre Entities
// ============================================================================

/**
 * Entity for storing people (authors, directors, actors, musicians, etc.)
 */
export interface People {
  personId: number;
  name: string;
  sortName?: string;
  biography?: string;
  birthDate?: number;
  deathDate?: number;
  birthPlace?: string;
  nationality?: string;
  photoPath?: string;
  imdbId?: string;
  tmdbId?: string;
  musicBrainzId?: string;
  website?: string;
  socialMedia?: string; // JSON with social media links
  lastUpdated: number;
}

/**
 * Junction entity linking media items to people with roles
 */
export interface ItemPersonRole {
  itemId: number;
  personId: number;
  role: string; // AUTHOR, DIRECTOR, ACTOR, ARTIST, COMPOSER, etc.
  characterName?: string; // For actors
  roleOrder?: number; // For ordering in credits
  department?: string; // For crew roles
  job?: string; // Specific job title
}

/**
 * Entity for storing series information (book series, TV series, etc.)
 */
export interface Series {
  seriesId: number;
  name: string;
  sortName: string;
  description?: string;
  totalItems?: number;
  mediaType: string; // BOOK, TV_SHOW, etc.
  startYear?: number;
  endYear?: number;
  status?: string; // ONGOING, COMPLETED, CANCELLED, HIATUS
  publisher?: string;
  ageRating?: string; // E, E10+, T, M, AO
  thumbnail?: string;
  releaseDate?: number;
  folderPath?: string;
  autoDetected: boolean;
  coverImagePath?: string;
  externalId?: string;
  lastUpdated: number;
}

/**
 * Entity for storing album information (music albums)
 */
export interface Album {
  albumId: number;
  title: string;
  albumArtistId?: number; // Reference to People table
  releaseYear?: number;
  releaseDate?: number;
  albumArtPath?: string;
  totalTracks?: number;
  totalDiscs?: number;
  duration?: number; // Total duration in milliseconds
  recordLabel?: string;
  catalogNumber?: string;
  barcode?: string;
  musicBrainzAlbumId?: string;
  spotifyAlbumId?: string;
  lastFmAlbumId?: string;
  lastUpdated: number;
}

/**
 * Entity for storing genres
 */
export interface Genre {
  genreId: number;
  name: string;
  description?: string;
  mediaType?: string; // Optional: BOOK, MOVIE, MUSIC, etc.
  parentGenreId?: number; // For hierarchical genres
  externalId?: string; // ID in external database
  lastUpdated: number;
}

/**
 * Junction entity linking media items to genres
 */
export interface ItemGenre {
  itemId: number;
  genreId: number;
}

// ============================================================================
// Playlist Entities
// ============================================================================

/**
 * Playlists and items for music (and potentially other audio).
 * Designed to support local persistence, sharing (export), and Plex sync.
 */
export interface Playlist {
  playlistId: number;
  name: string;
  description?: string;
  isLiked: boolean;
  isPublic: boolean;
  shareCode?: string;
  plexPlaylistId?: string;
  lastSyncedAt?: number;
  createdAt: number;
  updatedAt: number;
}

export interface PlaylistItem {
  id: number;
  playlistId: number;
  mediaItemId: number;
  position: number;
  addedAt: number;
}

// ============================================================================
// Bookmark and Progress Tracking Entities
// ============================================================================

/**
 * Entity for storing bookmarks and reading progress
 */
export interface Bookmark {
  bookmarkId: number;
  itemId: number;
  title?: string;
  description?: string;
  position: number; // Position in milliseconds (video/audio) or characters (text)
  page?: number; // Page number for books
  chapter?: string; // Chapter name/number
  percentage: number; // Progress as percentage (0.0 to 1.0)
  contextBefore?: string; // Text before bookmark
  contextAfter?: string; // Text after bookmark
  screenCapture?: string; // Path to screenshot
  bookmarkType: string; // MANUAL, AUTO, RESUME
  isActive: boolean;
  dateCreated: number;
  lastAccessed?: number;
}

/**
 * Entity for detailed reading progress tracking
 */
export interface ReadingProgress {
  progressId: number;
  itemId: number;
  currentPosition: number; // Milliseconds or character position
  currentPage: number;
  currentChapter: number;
  percentage: number;
  totalReadingTime: number; // Total time spent reading (milliseconds)
  sessionCount: number;
  averageSessionTime: number;
  isCompleted: boolean;
  completedDate?: number;
  startedDate?: number;
  lastUpdate: number;
  pagesRead: number;
  chaptersRead: number;
  readingSpeed?: number; // Pages per minute or WPM
  locator?: string;
  notes?: string;
}

/**
 * Entity for individual reading sessions
 */
export interface ReadingSession {
  sessionId: number;
  itemId: number;
  sessionStart: number;
  sessionEnd?: number;
  duration: number; // Duration in milliseconds
  startPosition: number;
  endPosition: number;
  startPage: number;
  endPage: number;
  pagesRead: number;
  charactersRead: number;
  averageReadingSpeed?: number;
  deviceType?: string; // PHONE, TABLET, DESKTOP
  appVersion?: string;
}

/**
 * Entity for storing text highlights and annotations
 */
export interface TextAnnotation {
  annotationId: number;
  itemId: number;
  chapterIndex: number;
  chapterTitle?: string;
  startOffset: number;
  endOffset: number;
  selectedText: string;
  highlightColor: string; // Yellow default
  annotationType: string; // HIGHLIGHT, NOTE, BOOKMARK
  noteText?: string;
  contextBefore?: string;
  contextAfter?: string;
  dateCreated: number;
  dateModified: number;
  isDeleted: boolean;
}

/**
 * Entity for storing full-text search index
 */
export interface SearchIndex {
  indexId: number;
  itemId: number;
  chapterIndex: number;
  chapterTitle?: string;
  searchText: string; // Processed text for search
  originalText: string; // Original text content
  startOffset: number;
  endOffset: number;
  dateIndexed: number;
}

/**
 * Entity for storing reading statistics
 */
export interface ReadingStatistics {
  statisticsId: number;
  itemId: number;
  date: number; // Date as timestamp (day granularity)
  readingTimeMinutes: number;
  pagesRead: number;
  chaptersCompleted: number;
  wordsRead: number;
  startProgress: number; // Progress at start of session
  endProgress: number; // Progress at end of session
  sessionCount: number;
  lastUpdated: number;
}

// ============================================================================
// Tag and Collection Entities
// ============================================================================

/**
 * Tag type enumeration
 */
export enum TagType {
  USER_DEFINED = 'USER_DEFINED',
  AUTO_GENERATED = 'AUTO_GENERATED',
  IMPORTED_PLEX = 'IMPORTED_PLEX',
  IMPORTED_CALIBRE = 'IMPORTED_CALIBRE',
  IMPORTED_JELLYFIN = 'IMPORTED_JELLYFIN'
}

/**
 * Unified tag system that works across all media types
 */
export interface UnifiedTag {
  tagId: number;
  name: string;
  type: TagType;
  color?: string;
  description?: string;
  createdAt: number;
  lastUsed: number;
  usageCount: number;
  externalId?: string;
}

/**
 * Junction table for many-to-many relationship between items and tags
 */
export interface ItemTag {
  id: number;
  itemId: number;
  tagId: number;
  appliedAt: number;
  appliedBy?: number;
}

/**
 * Collection type enumeration
 */
export enum CollectionType {
  PLAYLIST = 'PLAYLIST',
  SERIES = 'SERIES',
  READING_LIST = 'READING_LIST',
  WATCH_LIST = 'WATCH_LIST',
  USER_DEFINED = 'USER_DEFINED',
  SMART = 'SMART'
}

/**
 * Sort field options for collections
 */
export enum SortField {
  CUSTOM = 'CUSTOM',
  TITLE = 'TITLE',
  DATE_ADDED = 'DATE_ADDED',
  RELEASE_DATE = 'RELEASE_DATE',
  RATING = 'RATING',
  PLAY_COUNT = 'PLAY_COUNT',
  CREATOR = 'CREATOR'
}

/**
 * Sort order enumeration
 */
export enum SortOrder {
  ASCENDING = 'ASCENDING',
  DESCENDING = 'DESCENDING'
}

/**
 * Unified collection system for cross-media organization
 */
export interface UnifiedCollection {
  collectionId: number;
  name: string;
  type: CollectionType;
  description?: string;
  coverArtPath?: string;
  sortBy: SortField;
  sortOrder: SortOrder;
  isSmartCollection: boolean;
  smartQuery?: string;
  isVisible: boolean;
  isPinned: boolean;
  createdAt: number;
  lastModified: number;
  externalId?: string;
  itemCount: number;
}

/**
 * Junction entity linking media items to collections
 */
export interface ItemCollection {
  itemId: number;
  collectionId: number;
  sortOrder: number;
  addedAt: number;
  addedBy?: string;
  notes?: string;
}

// ============================================================================
// Playback Queue Entities
// ============================================================================

/**
 * Entity representing a persistent playback queue
 */
export interface PlaybackQueue {
  queueId: number;
  queueName: string; // "MAIN_QUEUE", "MUSIC_QUEUE", etc.
  displayName: string; // User-friendly name
  queueType: string; // "MAIN", "MUSIC", "AUDIOBOOK", "TTS", "CUSTOM"
  isActive: boolean;
  isPersistent: boolean;
  repeatMode: string; // "NONE", "ONE", "ALL", "SHUFFLE"
  shuffleEnabled: boolean;
  created: number;
  lastUsed: number;
  lastModified: number;
}

/**
 * Entity representing an item in a playback queue
 */
export interface QueueItem {
  queueItemId: number;
  queueId: number;
  mediaItemId: number;
  queuePosition: number;
  isCurrentlyPlaying: boolean;
  playbackPositionMs: number;
  durationMs: number;
  mediaType: string; // "MUSIC", "AUDIOBOOK", "TTS", "VIDEO", "PODCAST"
  chapterIndex?: number;
  chapterTitle?: string;
  playbackSpeed: number;
  title: string;
  artist?: string;
  album?: string;
  coverArtUrl?: string;
  addedToQueue: number;
  lastPlayed?: number;
  playCount: number;
  skipSilence: boolean;
  crossfadeEnabled: boolean;
}

/**
 * Entity representing a playback session state
 */
export interface PlaybackSession {
  sessionId: number;
  sessionName: string; // "DEFAULT", "MUSIC_SESSION", "AUDIOBOOK_SESSION"
  sessionType: string; // "GLOBAL", "MUSIC", "AUDIOBOOK", "TTS"
  isActive: boolean;
  activeQueueId?: number;
  currentQueueItemId?: number;
  isPlaying: boolean;
  isPaused: boolean;
  currentPositionMs: number;
  playbackSpeed: number;
  volume: number;
  audioFocusGained: boolean;
  skipSilenceEnabled: boolean;
  crossfadeEnabled: boolean;
  crossfadeDurationMs: number;
  sleepTimerEndTime?: number;
  sleepTimerPauseOnComplete: boolean;
  equalizerPreset?: string;
  created: number;
  lastUsed: number;
  sessionDurationMs: number;
  mediaSessionToken?: string;
  notificationId?: number;
}

// ============================================================================
// Radio Station Entity
// ============================================================================

/**
 * Radio Station entity for internet radio streaming
 */
export interface RadioStation {
  id: number;
  name: string;
  description?: string;
  streamUrl: string;
  websiteUrl?: string;
  logoUrl?: string;
  genre?: string;
  country?: string;
  language?: string;
  bitrate?: number; // kbps
  codec?: string; // mp3, aac, ogg, etc.
  isFavorite: boolean;
  customOrder: number;
  tags?: string; // Comma-separated
  addedAt: number;
  lastPlayedAt?: number;
  playCount: number;
}

// ============================================================================
// Reader Settings Entities
// ============================================================================

/**
 * Page turn animation types
 */
export enum PageTurnAnimation {
  SLIDE = 'SLIDE',
  FADE = 'FADE',
  CURL = 'CURL',
  FLIP = 'FLIP',
  NONE = 'NONE'
}

/**
 * Page turn speed settings
 */
export enum PageTurnSpeed {
  SLOW = 'SLOW',
  NORMAL = 'NORMAL',
  FAST = 'FAST'
}

/**
 * Reading themes
 */
export enum ReadingTheme {
  AUTO = 'AUTO',    // Follow system
  LIGHT = 'LIGHT',   // White background
  DARK = 'DARK',    // Dark background
  SEPIA = 'SEPIA',   // Warm sepia tone
  NIGHT = 'NIGHT'    // OLED black
}

/**
 * Text alignment options
 */
export enum TextAlignment {
  LEFT = 'LEFT',
  CENTER = 'CENTER',
  RIGHT = 'RIGHT',
  JUSTIFY = 'JUSTIFY'
}

/**
 * Reader settings for ebooks and documents
 */
export interface ReaderSettingsEntity {
  id: number;
  // Typography
  fontSize: number;
  fontFamily: string;
  lineHeight: number;
  letterSpacing: number;
  fontWeight: string;
  // Layout
  marginTop: number;
  marginBottom: number;
  marginLeft: number;
  marginRight: number;
  textAlignment: string;
  paragraphSpacing: number;
  // Page Turn Settings
  pageTurnAnimation: string;
  pageTurnSpeed: string;
  tapToTurnPages: boolean;
  swipeToTurnPages: boolean;
  volumeKeysToTurnPages: boolean;
  // Display
  theme: string;
  brightness: number;
  nightMode: boolean;
  autoNightMode: boolean;
  nightModeStart: string;
  nightModeEnd: string;
  // Reading Experience
  enableHyphenation: boolean;
  enablePageNumbers: boolean;
  enableProgressIndicator: boolean;
  fullScreenMode: boolean;
  keepScreenOn: boolean;
  // Advanced
  enableDictionaryLookup: boolean;
  enableTextSelection: boolean;
  enableTranslation: boolean;
  scrollingMode: boolean;
  updatedAt: number;
}

/**
 * Book-specific reader settings that override global settings
 */
export interface BookReaderSettingsEntity {
  bookId: number;
  fontSize?: number;
  fontFamily?: string;
  lineHeight?: number;
  theme?: string;
  brightness?: number;
  currentPage: number;
  currentChapter: number;
  currentPosition: number;
  lastReadAt: number;
  updatedAt: number;
}

// ============================================================================
// Server Integration Entities
// ============================================================================

/**
 * Entity representing a Plex Media Server connection
 */
export interface PlexServer {
  serverId: number;
  name: string;
  host: string;
  port: number;
  token: string;
  machineIdentifier?: string;
  version?: string;
  isActive: boolean;
  lastConnected: number;
  lastSynced: number;
  dateAdded: number;
}

/**
 * Entity representing a media item from Plex server for sync purposes
 */
export interface PlexMediaItem {
  id: number;
  serverId: number;
  plexRatingKey: string; // Plex's unique identifier for the item
  localMediaItemId?: number; // Link to local MediaItem if matched
  title: string;
  type: string; // movie, episode, track, etc.
  year?: number;
  duration?: number; // in milliseconds
  libraryName: string;
  librarySectionId: string;
  lastSynced: number;
}

export interface EmbyServer {
  id: number;
  name: string;
  host: string;
  port: number;
  apiKey?: string;
  userId?: string;
  lastSynced: number;
  isActive: boolean;
}

export interface JellyfinServer {
  id: number;
  name: string;
  host: string;
  port: number;
  apiKey?: string;
  userId?: string;
  lastSynced: number;
  isActive: boolean;
}

// ============================================================================
// Story/Fanfiction Management Entities
// ============================================================================

/**
 * Entity to track downloaded stories for update detection and management
 */
export interface DownloadedStory {
  id: string; // Generated from URL or site-specific ID
  url: string;
  title: string;
  author: string;
  site: string; // "ao3", "ffnet", "wattpad", etc.
  siteStoryId: string;
  totalChapters: number;
  lastKnownChapters: number;
  lastUpdated: number;
  lastChecked: number;
  lastDownloaded: number;
  epubFilePath: string;
  fileSize: number;
  checksum?: string;
  isCompleted: boolean;
  hasUpdates: boolean;
  autoUpdateEnabled: boolean;
  description?: string;
  tags: string[];
  rating?: string;
  language: string;
  fandom?: string;
  lastError?: string;
  failureCount: number;
}

/**
 * Entity to track story update history
 */
export interface StoryUpdate {
  id: number;
  storyId: string;
  updateType: string; // "NEW_CHAPTER", "METADATA_UPDATE", "COMPLETION", "ERROR"
  previousChapters: number;
  newChapters: number;
  updateDescription: string;
  timestamp: number;
  wasSuccessful: boolean;
}

// ============================================================================
// Miscellaneous Entities
// ============================================================================

/**
 * Entity for storing shared links
 */
export interface SharedLink {
  id: number;
  targetType: string; // LIBRARY, COLLECTION, ITEM
  targetId: number;
  token: string;
  createdAt: number;
  expiresAt?: number;
  enabled: boolean;
}

/**
 * Entity for storing maintenance changes
 */
export interface MaintenanceChange {
  changeId: number;
  itemId: number;
  changeType: string; // METADATA_UPDATE, COVER_UPDATE, FILE_RENAME, DUPLICATE, OTHER
  summary: string;
  oldDataJson?: string;
  newDataJson?: string;
  status: string; // PENDING, ACCEPTED, REJECTED
  createdAt: number;
  decidedAt?: number;
}

/**
 * Entity for storing API keys for external services
 */
export interface APIKey {
  keyId: number;
  provider: string; // "google_books", "tmdb", "omdb", "spotify", etc.
  keyValue: string; // Encrypted API key
  displayName: string;
  description?: string;
  isActive: boolean;
  validationStatus: string; // VALID, INVALID, EXPIRED, UNKNOWN
  lastValidated?: number;
  usageCount: number;
  dailyLimit?: number;
  monthlyLimit?: number;
  currentDailyUsage: number;
  currentMonthlyUsage: number;
  category: string; // METADATA, MEDIA_DOWNLOAD, CLOUD_SYNC, etc.
  requiredPermissions?: string;
  dateAdded: number;
  lastUsed?: number;
  lastError?: string;
}

/**
 * Combined data class for displaying book information in UI
 */
export interface BookDetails {
  mediaItem: MediaItem;
  metadata: MetadataCommon;
  bookMetadata?: MetadataBook;
  authorName?: string;
  seriesName?: string;
  lastAccessedDate?: number;
  duration?: number;
  playbackPosition?: number;
}

// ============================================================================
// Helper Type Exports
// ============================================================================

export type MediaType = 'BOOK' | 'MOVIE' | 'TV_SHOW' | 'MUSIC_TRACK' | 'COMIC' | 'PODCAST' | 'AUDIOBOOK';
export type LibrarySource = 'LOCAL' | 'PLEX' | 'JELLYFIN' | 'EMBY' | 'CALIBRE';
export type WatchStatus = 'UNWATCHED' | 'WATCHING' | 'WATCHED';
export type BookmarkType = 'MANUAL' | 'AUTO' | 'RESUME';
export type AnnotationType = 'HIGHLIGHT' | 'NOTE' | 'BOOKMARK';
