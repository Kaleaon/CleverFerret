// ============================================================================
// Plex Integration Entities
// ============================================================================

/**
 * Entity for tracking Plex tags/genres
 */
export interface PlexTag {
  id: number;
  serverId: number;
  tag: string;
  type: string; // genre, director, actor, etc.
  lastSynced: number;
}

/**
 * Junction entity for media item tags
 */
export interface PlexMediaTag {
  id: number;
  plexMediaItemId: number;
  tagId: number;
}

/**
 * Entity for tracking Plex collections/playlists
 */
export interface PlexCollection {
  id: number;
  serverId: number;
  plexRatingKey: string; // Plex's unique identifier for the collection
  title: string;
  type: string; // collection, playlist
  summary?: string;
  itemCount: number;
  thumb?: string;
  art?: string;
  lastSynced: number;
}

/**
 * Junction entity for collection items
 */
export interface PlexCollectionItem {
  id: number;
  collectionId: number;
  plexMediaItemId: number;
  sortOrder: number;
}

/**
 * Entity for tracking playback progress sync between local and Plex
 */
export interface PlexProgress {
  id: number;
  plexMediaItemId: number;
  // Progress information
  viewOffset: number; // Progress in milliseconds
  viewCount: number;
  lastViewedAt?: number;
  // Sync status
  localProgress: number; // Progress tracked locally
  plexProgress: number; // Progress from Plex
  needsSync: boolean;
  lastSyncedAt: number;
  updatedAt: number;
}

/**
 * Entity for tracking rating sync between local and Plex
 */
export interface PlexRating {
  id: number;
  plexMediaItemId: number;
  // Rating information
  localRating?: number; // Rating in local system (0-10)
  plexRating?: number; // Rating from Plex (0-10)
  // Sync status
  needsSync: boolean;
  lastSyncedAt: number;
  updatedAt: number;
}
