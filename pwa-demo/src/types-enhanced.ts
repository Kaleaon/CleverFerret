export enum MediaType {
  Book = 'Book',
  Movie = 'Movie',
  Music = 'Music',
  Comic = 'Comic',
  Podcast = 'Podcast',
  Radio = 'Radio',
  Audiobook = 'Audiobook',
  Magazine = 'Magazine',
  Documentary = 'Documentary',
  Series = 'Series'
}

export interface MediaItem {
  id: string;
  type: MediaType;
  title: string;
  subtitle?: string;
  sortTitle?: string;
  summary?: string;
  authors?: string[];
  artists?: string[];
  directors?: string[];
  series?: string;
  seriesIndex?: number;
  rating?: number; // 0-5
  releaseDate?: string;
  genres?: string[];
  tags?: string[];
  publisher?: string;
  isbn?: string;
  coverArt: string;
  aiCoverArtPrompt?: string;
  status: 'Unread' | 'Reading' | 'Finished' | 'Unwatched' | 'Watched';
  dateAdded: string;
  lastRead?: string;
  progress?: number; // 0-100 percentage
  duration?: number; // in seconds for media files
  fileSize?: number; // in bytes
  localPath?: string; // for locally imported files
  cloudUrl?: string; // for cloud-synced files
  downloadUrl?: string; // for remote files
  metadata?: {
    width?: number;
    height?: number;
    bitrate?: number;
    sampleRate?: number;
    channels?: number;
    codec?: string;
    [key: string]: any;
  };
}

export interface MediaItemWithOriginal extends MediaItem {
  original?: MediaItem;
}

export interface Library {
  id: string;
  name: string;
  type: string; // 'BOOK' | 'MOVIE' | 'MUSIC' | 'MIXED'
  path: string;
  description?: string;
  itemCount: number;
  totalSize: number;
  lastScanned?: string;
  autoScan: boolean;
  cloudSync: boolean;
  encryptionEnabled: boolean;
}

export interface ReadingProgress {
  id: string;
  mediaItemId: string;
  userId?: string;
  currentPosition: number; // page number or time in seconds
  totalLength?: number; // total pages or duration
  percentage: number; // 0-100
  lastRead: string;
  notes?: string;
  bookmarks: Bookmark[];
}

export interface Bookmark {
  id: string;
  mediaItemId: string;
  position: number; // page or time position
  title?: string;
  note?: string;
  createdAt: string;
}

export interface Collection {
  id: string;
  name: string;
  description?: string;
  mediaItemIds: string[];
  coverArt?: string;
  tags: string[];
  isPublic: boolean;
  createdAt: string;
  updatedAt: string;
}

export interface AppSettings {
  theme: string;
  language: string;
  autoBackup: boolean;
  cloudSync: boolean;
  defaultLibrary?: string;
  readingPreferences: {
    fontSize: number;
    fontFamily: string;
    lineHeight: number;
    theme: 'light' | 'dark' | 'sepia';
    pageTransition: 'slide' | 'fade' | 'curl';
  };
  playbackPreferences: {
    autoPlay: boolean;
    repeatMode: 'none' | 'one' | 'all';
    shuffleEnabled: boolean;
    volume: number;
  };
  notifications: {
    newReleases: boolean;
    readingReminders: boolean;
    syncStatus: boolean;
  };
}

export interface UserProfile {
  id: string;
  name: string;
  email: string;
  avatar?: string;
  preferences: AppSettings;
  stats: {
    totalBooks: number;
    booksRead: number;
    totalReadingTime: number;
    currentStreak: number;
    longestStreak: number;
  };
}

// Enhanced file system types
export interface FileHandle {
  name: string;
  size: number;
  type: string;
  lastModified: number;
  path: string;
  isDirectory: boolean;
}

// Sync and backup types
export interface SyncStatus {
  isOnline: boolean;
  lastSync: string;
  pendingUploads: number;
  pendingDownloads: number;
  conflicts: string[];
}

// Analytics and statistics
export interface ReadingSession {
  id: string;
  mediaItemId: string;
  startTime: string;
  endTime?: string;
  duration: number; // in minutes
  pagesRead?: number;
  progress: number; // ending percentage
}

export interface MediaStats {
  totalItems: number;
  byType: Record<MediaType, number>;
  byStatus: Record<string, number>;
  totalSize: number;
  averageRating: number;
}

// Search and filtering
export interface SearchFilter {
  types: MediaType[];
  statuses: string[];
  genres: string[];
  authors: string[];
  publishers: string[];
  dateRange: {
    start?: string;
    end?: string;
  };
  ratingRange: {
    min: number;
    max: number;
  };
  hasLocalFile: boolean;
}

export interface SearchResult {
  items: MediaItem[];
  total: number;
  filters: {
    availableGenres: string[];
    availableAuthors: string[];
    availablePublishers: string[];
  };
}