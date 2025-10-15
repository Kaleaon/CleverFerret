/**
 * Services Index - Central export for all services
 * Provides easy access to all app services
 */

// Core Services
export { default as AudioService } from './audio/AudioService';
export { default as MediaService } from './media/MediaService';
export { default as TTSService } from './tts/TTSService';

// Reader Services
export { default as EPUBService } from './epub/EPUBService';
export { default as ReaderService } from './reader/ReaderService';

// Media Management
export { default as ThumbnailService } from './thumbnails/ThumbnailService';
export { default as ArtworkService } from './artwork/ArtworkService';

// Content Services
export { default as PodcastService } from './podcast/PodcastService';
export { default as WebFictionService } from './webfiction/WebFictionService';
export { default as OPDSService } from './opds/OPDSService';

// Integration Services
export { default as PlexService } from './integration/plex/PlexService';

// Maintenance
export { default as MaintenanceService } from './maintenance/MaintenanceService';

// Database
export { db } from './database-complete';

// Network & Cache
export { networkManager as NetworkManager } from './network/NetworkManager';
export { cacheManager as CacheManager } from './cache/CacheManager';

// Metadata
export { metadataApiService as MetadataApiService } from './metadata/MetadataApiService';

// Playback
export { audioPlayerService as AudioPlayerService } from './playback/AudioPlayerService';
