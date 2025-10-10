// ============================================================================
// Podcast Entities
// Based on AntennaPod's architecture
// ============================================================================

/**
 * Podcast entity - represents a podcast feed/show
 */
export interface PodcastEntity {
  id: number;
  // Basic info
  title: string;
  description?: string;
  author?: string;
  language?: string;
  // URLs
  feedUrl: string;
  websiteUrl?: string;
  imageUrl?: string;
  localImagePath?: string;
  // Categories and metadata
  category?: string;
  keywords?: string; // Comma-separated
  explicit: boolean;
  // Subscription info
  isSubscribed: boolean;
  subscribedAt?: number;
  // Auto-download settings
  autoDownload: boolean;
  downloadWifiOnly: boolean;
  keepEpisodes: number; // Number of episodes to keep, -1 = all
  autoDelete: boolean;
  // Notifications
  notifyNewEpisodes: boolean;
  // Update info
  lastChecked?: number;
  lastUpdated?: number;
  lastRefreshError?: string;
  // Stats
  totalEpisodes: number;
  newEpisodeCount: number;
  // Playback preferences
  playbackSpeed: number;
  skipIntro: number; // Seconds to skip at start
  skipOutro: number; // Seconds to skip at end
  // Organization
  tags?: string; // Comma-separated tags
  customOrder: number;
  isFavorite: boolean;
  // Metadata
  createdAt: number;
  modifiedAt: number;
}

/**
 * Podcast episode entity
 */
export interface PodcastEpisodeEntity {
  id: number;
  // Foreign key
  podcastId: number;
  // Basic info
  guid: string; // Unique identifier from RSS feed
  title: string;
  description?: string;
  link?: string;
  // Media info
  audioUrl: string;
  mimeType?: string;
  fileSize: number; // in bytes
  duration: number; // in milliseconds
  // Publishing info
  publishDate: number;
  episodeNumber?: number;
  seasonNumber?: number;
  // Images
  imageUrl?: string;
  localImagePath?: string;
  // Download status
  downloaded: boolean;
  localFilePath?: string;
  downloadProgress: number; // 0.0 to 1.0
  downloadedAt?: number;
  downloadError?: string;
  // Playback status
  played: boolean;
  playPosition: number; // in milliseconds
  playbackSpeed?: number; // null = use podcast default
  lastPlayedAt?: number;
  // User flags
  isNew: boolean;
  isFavorite: boolean;
  isQueued: boolean;
  queuePosition?: number;
  // Chapter support
  hasChapters: boolean;
  chaptersUrl?: string;
  // Metadata
  addedAt: number;
  modifiedAt: number;
}

/**
 * Podcast subscription settings
 * Stores per-podcast preferences for subscriptions
 */
export interface PodcastSubscriptionEntity {
  id: number;
  // Foreign key
  podcastId: number;
  // Subscription info
  subscribedAt: number;
  isActive: boolean;
  // Auto-download settings
  autoDownload: boolean;
  downloadWifiOnly: boolean;
  downloadLimit: number; // Max episodes to auto-download
  // Episode management
  keepEpisodes: number; // Number to keep, -1 = all
  autoDelete: boolean;
  deleteAfterPlayed: boolean;
  // Notifications
  notifyNewEpisodes: boolean;
  notificationSound?: string;
  // Update frequency
  updateInterval: number; // in milliseconds
  lastChecked: number;
  // Playback preferences
  defaultPlaybackSpeed: number;
  skipIntro: number;
  skipOutro: number;
  removesilence: boolean;
  // Filter settings
  episodeFilter?: string; // JSON string for complex filters
  sortOrder: string; // newest_first, oldest_first, etc.
  // Metadata
  modifiedAt: number;
}

/**
 * Podcast chapter entity
 * Represents chapter marks within a podcast episode (based on Podlove Simple Chapters)
 */
export interface PodcastChapterEntity {
  id: number;
  // Foreign key
  episodeId: number;
  // Chapter info
  title: string;
  startTime: number; // in milliseconds
  endTime?: number; // in milliseconds, null if unknown
  // Optional metadata
  url?: string; // Link to chapter resource
  imageUrl?: string; // Chapter-specific image
  // Chapter type
  chapterType: string; // normal, ad, intro, outro, etc.
  // Order
  chapterIndex: number;
}
