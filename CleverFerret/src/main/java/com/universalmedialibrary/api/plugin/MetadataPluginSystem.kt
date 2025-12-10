package com.universalmedialibrary.api.plugin

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.serialization.Serializable
import java.util.UUID

/**
 * CleverFerret Modular Plugin Architecture
 * 
 * A flexible, extensible plugin system for metadata providers, content sources,
 * and media services. Designed for easy addition of new APIs and services.
 */

// =============================================================================
// CORE PLUGIN INTERFACES
// =============================================================================

/**
 * Base interface for all plugins in the system
 */
interface Plugin {
    /** Unique identifier for this plugin */
    val id: String
    
    /** Human-readable name */
    val name: String
    
    /** Plugin version */
    val version: String
    
    /** Plugin description */
    val description: String
    
    /** Plugin author/maintainer */
    val author: String
    
    /** Plugin category */
    val category: PluginCategory
    
    /** Whether the plugin is enabled */
    var isEnabled: Boolean
    
    /** Plugin capabilities */
    val capabilities: Set<PluginCapability>
    
    /** Configuration options for this plugin */
    val configurationOptions: List<ConfigurationOption>
    
    /** Initialize the plugin */
    suspend fun initialize(): Result<Unit>
    
    /** Shutdown the plugin */
    suspend fun shutdown()
    
    /** Check if the plugin is healthy/working */
    suspend fun healthCheck(): PluginHealth
}

/**
 * Plugin categories
 */
enum class PluginCategory {
    METADATA_PROVIDER,      // Provides metadata for media items
    CONTENT_SOURCE,         // Provides content/files
    STREAMING_SERVICE,      // Streaming services integration
    MEDIA_SERVER,           // Media server integration (Plex, Jellyfin, etc.)
    CLOUD_STORAGE,          // Cloud storage providers
    SOCIAL_INTEGRATION,     // Social features (Goodreads, Last.fm, etc.)
    AI_SERVICE,             // AI/ML services
    FORMAT_CONVERTER,       // Format conversion services
    ANALYTICS,              // Analytics and tracking
    NOTIFICATION,           // Notification services
    BACKUP,                 // Backup services
    EXTENSION               // General extensions
}

/**
 * Plugin capabilities
 */
enum class PluginCapability {
    // Metadata capabilities
    SEARCH_BY_TITLE,
    SEARCH_BY_AUTHOR,
    SEARCH_BY_ISBN,
    SEARCH_BY_BARCODE,
    FETCH_COVER_ART,
    FETCH_DESCRIPTIONS,
    FETCH_RATINGS,
    FETCH_REVIEWS,
    FETCH_RECOMMENDATIONS,
    FETCH_SERIES_INFO,
    FETCH_AUTHOR_INFO,
    
    // Content capabilities
    DOWNLOAD_CONTENT,
    STREAM_CONTENT,
    PREVIEW_CONTENT,
    
    // Social capabilities
    SYNC_PROGRESS,
    SYNC_RATINGS,
    SYNC_REVIEWS,
    SHARE_ACTIVITY,
    
    // Analytics capabilities
    TRACK_READING,
    TRACK_LISTENING,
    TRACK_WATCHING,
    GENERATE_STATS,
    
    // Conversion capabilities
    CONVERT_EPUB,
    CONVERT_PDF,
    CONVERT_AUDIO,
    CONVERT_VIDEO,
    
    // Server capabilities
    LIBRARY_SYNC,
    MEDIA_STREAMING,
    USER_MANAGEMENT
}

/**
 * Plugin health status
 */
@Serializable
data class PluginHealth(
    val status: HealthStatus,
    val message: String? = null,
    val lastCheck: Long = System.currentTimeMillis(),
    val details: Map<String, String> = emptyMap()
)

enum class HealthStatus {
    HEALTHY,
    DEGRADED,
    UNHEALTHY,
    UNKNOWN
}

/**
 * Configuration option for plugins
 */
@Serializable
sealed class ConfigurationOption {
    abstract val key: String
    abstract val label: String
    abstract val description: String
    abstract val required: Boolean
    abstract val defaultValue: Any?
    
    @Serializable
    data class Text(
        override val key: String,
        override val label: String,
        override val description: String,
        override val required: Boolean = false,
        override val defaultValue: String? = null,
        val placeholder: String? = null,
        val isSecret: Boolean = false,
        val validation: TextValidation? = null
    ) : ConfigurationOption()
    
    @Serializable
    data class Number(
        override val key: String,
        override val label: String,
        override val description: String,
        override val required: Boolean = false,
        override val defaultValue: kotlin.Number? = null,
        val min: kotlin.Number? = null,
        val max: kotlin.Number? = null
    ) : ConfigurationOption()
    
    @Serializable
    data class Toggle(
        override val key: String,
        override val label: String,
        override val description: String,
        override val required: Boolean = false,
        override val defaultValue: Boolean = false
    ) : ConfigurationOption()
    
    @Serializable
    data class Selection(
        override val key: String,
        override val label: String,
        override val description: String,
        override val required: Boolean = false,
        override val defaultValue: String? = null,
        val options: List<SelectionItem>
    ) : ConfigurationOption()
    
    @Serializable
    data class MultiSelection(
        override val key: String,
        override val label: String,
        override val description: String,
        override val required: Boolean = false,
        override val defaultValue: List<String>? = null,
        val options: List<SelectionItem>
    ) : ConfigurationOption()
}

@Serializable
data class SelectionItem(
    val value: String,
    val label: String,
    val description: String? = null
)

@Serializable
data class TextValidation(
    val pattern: String? = null,
    val minLength: Int? = null,
    val maxLength: Int? = null
)

// =============================================================================
// METADATA PROVIDER PLUGIN
// =============================================================================

/**
 * Interface for metadata provider plugins
 */
interface MetadataProviderPlugin : Plugin {
    /** Media types this provider supports */
    val supportedMediaTypes: Set<MediaType>
    
    /** Search for metadata */
    suspend fun search(query: MetadataQuery): Result<List<MetadataSearchResult>>
    
    /** Fetch detailed metadata for an item */
    suspend fun fetchDetails(id: String, mediaType: MediaType): Result<MediaMetadata>
    
    /** Fetch cover art */
    suspend fun fetchCoverArt(id: String, size: CoverSize = CoverSize.LARGE): Result<String>
    
    /** Fetch recommendations based on an item */
    suspend fun fetchRecommendations(id: String, limit: Int = 10): Result<List<MetadataSearchResult>>
}

/**
 * Media types
 */
enum class MediaType {
    BOOK,
    EBOOK,
    AUDIOBOOK,
    COMIC,
    MANGA,
    MUSIC_ALBUM,
    MUSIC_TRACK,
    PODCAST,
    PODCAST_EPISODE,
    MOVIE,
    TV_SHOW,
    TV_EPISODE,
    DOCUMENT,
    FANFICTION,
    NEWS_ARTICLE,
    RADIO_STATION
}

/**
 * Cover art sizes
 */
enum class CoverSize {
    SMALL,      // ~150px
    MEDIUM,     // ~300px
    LARGE,      // ~600px
    ORIGINAL    // Full resolution
}

/**
 * Metadata search query
 */
@Serializable
data class MetadataQuery(
    val title: String? = null,
    val author: String? = null,
    val isbn: String? = null,
    val barcode: String? = null,
    val year: Int? = null,
    val mediaType: MediaType? = null,
    val language: String? = null,
    val limit: Int = 20
)

/**
 * Search result from metadata provider
 */
@Serializable
data class MetadataSearchResult(
    val id: String,
    val providerId: String,
    val title: String,
    val subtitle: String? = null,
    val authors: List<String> = emptyList(),
    val year: Int? = null,
    val coverUrl: String? = null,
    val mediaType: MediaType,
    val relevanceScore: Float = 0f,
    val additionalInfo: Map<String, String> = emptyMap()
)

/**
 * Complete media metadata
 */
@Serializable
data class MediaMetadata(
    val id: String,
    val providerId: String,
    val title: String,
    val originalTitle: String? = null,
    val subtitle: String? = null,
    val description: String? = null,
    val authors: List<PersonInfo> = emptyList(),
    val narrators: List<PersonInfo> = emptyList(),
    val publisher: String? = null,
    val publishDate: String? = null,
    val language: String? = null,
    val isbn: String? = null,
    val isbn13: String? = null,
    val asin: String? = null,
    val genres: List<String> = emptyList(),
    val tags: List<String> = emptyList(),
    val series: SeriesInfo? = null,
    val rating: RatingInfo? = null,
    val pageCount: Int? = null,
    val duration: Long? = null,     // in seconds for audio/video
    val coverUrls: Map<CoverSize, String> = emptyMap(),
    val additionalImages: List<String> = emptyList(),
    val externalLinks: Map<String, String> = emptyMap(),
    val mediaType: MediaType,
    val additionalMetadata: Map<String, Any> = emptyMap()
)

@Serializable
data class PersonInfo(
    val name: String,
    val id: String? = null,
    val role: String? = null,
    val imageUrl: String? = null,
    val bio: String? = null
)

@Serializable
data class SeriesInfo(
    val name: String,
    val id: String? = null,
    val position: Float? = null,    // Position in series (supports decimals like 1.5)
    val totalBooks: Int? = null
)

@Serializable
data class RatingInfo(
    val average: Float,
    val count: Int,
    val distribution: Map<Int, Int>? = null  // Star rating -> count
)

// =============================================================================
// CONTENT SOURCE PLUGIN
// =============================================================================

/**
 * Interface for content source plugins (e.g., Calibre, Project Gutenberg, etc.)
 */
interface ContentSourcePlugin : Plugin {
    /** Media types this source provides */
    val supportedMediaTypes: Set<MediaType>
    
    /** Supported file formats */
    val supportedFormats: Set<String>
    
    /** Browse available content */
    suspend fun browse(
        category: String? = null,
        page: Int = 1,
        pageSize: Int = 50
    ): Result<ContentBrowseResult>
    
    /** Search content */
    suspend fun search(query: String, mediaType: MediaType? = null): Result<List<ContentItem>>
    
    /** Get content details */
    suspend fun getDetails(id: String): Result<ContentItem>
    
    /** Download content */
    suspend fun download(id: String, format: String? = null): Flow<DownloadProgress>
    
    /** Stream content (if supported) */
    suspend fun getStreamUrl(id: String): Result<String>
}

@Serializable
data class ContentBrowseResult(
    val items: List<ContentItem>,
    val totalCount: Int,
    val page: Int,
    val pageSize: Int,
    val categories: List<ContentCategory>? = null
)

@Serializable
data class ContentCategory(
    val id: String,
    val name: String,
    val description: String? = null,
    val itemCount: Int? = null,
    val subcategories: List<ContentCategory>? = null
)

@Serializable
data class ContentItem(
    val id: String,
    val sourceId: String,
    val title: String,
    val authors: List<String> = emptyList(),
    val description: String? = null,
    val coverUrl: String? = null,
    val mediaType: MediaType,
    val formats: List<ContentFormat> = emptyList(),
    val fileSize: Long? = null,
    val duration: Long? = null,
    val language: String? = null,
    val publishDate: String? = null,
    val license: String? = null,
    val downloadUrl: String? = null
)

@Serializable
data class ContentFormat(
    val format: String,
    val url: String,
    val fileSize: Long? = null,
    val quality: String? = null
)

@Serializable
data class DownloadProgress(
    val id: String,
    val status: DownloadStatus,
    val progress: Float = 0f,           // 0.0 to 1.0
    val bytesDownloaded: Long = 0,
    val totalBytes: Long = 0,
    val speed: Long = 0,                // bytes per second
    val localPath: String? = null,
    val error: String? = null
)

enum class DownloadStatus {
    PENDING,
    DOWNLOADING,
    PROCESSING,
    COMPLETED,
    FAILED,
    CANCELLED
}

// =============================================================================
// MEDIA SERVER PLUGIN
// =============================================================================

/**
 * Interface for media server integration plugins (Plex, Jellyfin, Emby, etc.)
 */
interface MediaServerPlugin : Plugin {
    /** Connect to a server */
    suspend fun connect(config: ServerConfig): Result<ServerInfo>
    
    /** Disconnect from server */
    suspend fun disconnect()
    
    /** Get server status */
    suspend fun getServerStatus(): Result<ServerStatus>
    
    /** Get libraries */
    suspend fun getLibraries(): Result<List<ServerLibrary>>
    
    /** Browse library content */
    suspend fun browseLibrary(
        libraryId: String,
        parentId: String? = null,
        page: Int = 1,
        pageSize: Int = 50
    ): Result<ServerBrowseResult>
    
    /** Search across libraries */
    suspend fun search(query: String, libraryId: String? = null): Result<List<ServerMediaItem>>
    
    /** Get item details */
    suspend fun getItemDetails(itemId: String): Result<ServerMediaItem>
    
    /** Get stream URL for playback */
    suspend fun getStreamUrl(itemId: String, quality: StreamQuality? = null): Result<StreamInfo>
    
    /** Sync progress */
    suspend fun syncProgress(itemId: String, progress: PlaybackProgress): Result<Unit>
}

@Serializable
data class ServerConfig(
    val url: String,
    val username: String? = null,
    val password: String? = null,
    val apiKey: String? = null,
    val token: String? = null,
    val deviceId: String = UUID.randomUUID().toString()
)

@Serializable
data class ServerInfo(
    val id: String,
    val name: String,
    val version: String,
    val platform: String? = null,
    val features: List<String> = emptyList()
)

@Serializable
data class ServerStatus(
    val isOnline: Boolean,
    val libraryCount: Int,
    val itemCount: Int,
    val lastScan: Long? = null
)

@Serializable
data class ServerLibrary(
    val id: String,
    val name: String,
    val type: MediaType,
    val itemCount: Int,
    val coverUrl: String? = null
)

@Serializable
data class ServerBrowseResult(
    val items: List<ServerMediaItem>,
    val totalCount: Int,
    val page: Int,
    val pageSize: Int
)

@Serializable
data class ServerMediaItem(
    val id: String,
    val serverId: String,
    val title: String,
    val subtitle: String? = null,
    val overview: String? = null,
    val mediaType: MediaType,
    val coverUrl: String? = null,
    val backdropUrl: String? = null,
    val year: Int? = null,
    val duration: Long? = null,
    val rating: Float? = null,
    val playbackProgress: PlaybackProgress? = null,
    val children: List<ServerMediaItem>? = null
)

@Serializable
data class PlaybackProgress(
    val position: Long,             // Current position in milliseconds
    val duration: Long,             // Total duration in milliseconds
    val lastPlayed: Long? = null,   // Timestamp of last playback
    val completed: Boolean = false
)

@Serializable
data class StreamInfo(
    val url: String,
    val format: String,
    val quality: StreamQuality,
    val subtitles: List<SubtitleTrack>? = null,
    val audioTracks: List<AudioTrack>? = null
)

enum class StreamQuality {
    AUTO,
    LOW,
    MEDIUM,
    HIGH,
    ORIGINAL
}

@Serializable
data class SubtitleTrack(
    val id: String,
    val language: String,
    val label: String,
    val url: String,
    val format: String
)

@Serializable
data class AudioTrack(
    val id: String,
    val language: String,
    val label: String,
    val codec: String
)

// =============================================================================
// SOCIAL INTEGRATION PLUGIN
// =============================================================================

/**
 * Interface for social/community integration plugins (Goodreads, Last.fm, etc.)
 */
interface SocialIntegrationPlugin : Plugin {
    /** Authenticate with the service */
    suspend fun authenticate(credentials: SocialCredentials): Result<SocialUser>
    
    /** Get current user profile */
    suspend fun getCurrentUser(): Result<SocialUser>
    
    /** Sync reading/listening progress */
    suspend fun syncProgress(item: SocialMediaItem): Result<Unit>
    
    /** Rate an item */
    suspend fun rateItem(itemId: String, rating: Float): Result<Unit>
    
    /** Get user's shelves/lists */
    suspend fun getShelves(): Result<List<SocialShelf>>
    
    /** Add item to shelf */
    suspend fun addToShelf(itemId: String, shelfId: String): Result<Unit>
    
    /** Get user's activity feed */
    suspend fun getActivityFeed(page: Int = 1): Result<List<SocialActivity>>
    
    /** Get friends/followers */
    suspend fun getFriends(): Result<List<SocialUser>>
}

@Serializable
data class SocialCredentials(
    val username: String? = null,
    val password: String? = null,
    val apiKey: String? = null,
    val oauthToken: String? = null,
    val oauthSecret: String? = null
)

@Serializable
data class SocialUser(
    val id: String,
    val username: String,
    val displayName: String,
    val avatarUrl: String? = null,
    val profileUrl: String? = null,
    val booksCount: Int? = null,
    val friendsCount: Int? = null
)

@Serializable
data class SocialMediaItem(
    val externalId: String,
    val title: String,
    val authors: List<String> = emptyList(),
    val isbn: String? = null,
    val progress: Float? = null,
    val currentPage: Int? = null,
    val totalPages: Int? = null,
    val status: ReadingStatus? = null,
    val startDate: String? = null,
    val finishDate: String? = null
)

enum class ReadingStatus {
    WANT_TO_READ,
    CURRENTLY_READING,
    READ,
    DID_NOT_FINISH
}

@Serializable
data class SocialShelf(
    val id: String,
    val name: String,
    val description: String? = null,
    val itemCount: Int = 0,
    val isDefault: Boolean = false
)

@Serializable
data class SocialActivity(
    val id: String,
    val type: ActivityType,
    val user: SocialUser,
    val item: SocialMediaItem? = null,
    val message: String? = null,
    val timestamp: Long
)

enum class ActivityType {
    STARTED_READING,
    FINISHED_READING,
    RATED,
    REVIEWED,
    ADDED_TO_SHELF,
    FRIEND_ADDED
}

// =============================================================================
// PLUGIN REGISTRY
// =============================================================================

/**
 * Central registry for managing plugins
 */
interface PluginRegistry {
    /** Get all registered plugins */
    fun getAllPlugins(): List<Plugin>
    
    /** Get plugins by category */
    fun getPluginsByCategory(category: PluginCategory): List<Plugin>
    
    /** Get a specific plugin by ID */
    fun getPlugin(id: String): Plugin?
    
    /** Get all metadata providers */
    fun getMetadataProviders(): List<MetadataProviderPlugin>
    
    /** Get all content sources */
    fun getContentSources(): List<ContentSourcePlugin>
    
    /** Get all media server plugins */
    fun getMediaServers(): List<MediaServerPlugin>
    
    /** Get all social integrations */
    fun getSocialIntegrations(): List<SocialIntegrationPlugin>
    
    /** Register a plugin */
    fun registerPlugin(plugin: Plugin)
    
    /** Unregister a plugin */
    fun unregisterPlugin(id: String)
    
    /** Enable/disable a plugin */
    fun setPluginEnabled(id: String, enabled: Boolean)
    
    /** Get plugin configuration */
    fun getPluginConfig(id: String): Map<String, Any>
    
    /** Update plugin configuration */
    fun updatePluginConfig(id: String, config: Map<String, Any>)
}

/**
 * Plugin manager events
 */
sealed class PluginEvent {
    data class PluginRegistered(val plugin: Plugin) : PluginEvent()
    data class PluginUnregistered(val pluginId: String) : PluginEvent()
    data class PluginEnabled(val pluginId: String) : PluginEvent()
    data class PluginDisabled(val pluginId: String) : PluginEvent()
    data class PluginError(val pluginId: String, val error: Throwable) : PluginEvent()
    data class PluginConfigUpdated(val pluginId: String) : PluginEvent()
}

/**
 * Plugin lifecycle callbacks
 */
interface PluginLifecycleCallback {
    fun onPluginRegistered(plugin: Plugin)
    fun onPluginUnregistered(pluginId: String)
    fun onPluginEnabled(plugin: Plugin)
    fun onPluginDisabled(plugin: Plugin)
    fun onPluginError(pluginId: String, error: Throwable)
}
