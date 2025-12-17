package com.universalmedialibrary.api.plugin

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.serialization.Serializable

/**
 * Multi-Purpose API System
 * 
 * Recognizes that APIs often serve multiple purposes and allows
 * flexible configuration of what each API is used for.
 * 
 * Examples:
 * - TMDB: Movie metadata, TV show metadata, person info, images, recommendations
 * - Google Books: Book metadata, cover art, reading progress sync
 * - Spotify: Music metadata, podcast search, playback
 * - Last.fm: Music metadata, scrobbling, recommendations
 * - Plex: Media server, metadata, sync, streaming
 */

// =============================================================================
// API CAPABILITY DEFINITIONS
// =============================================================================

/**
 * Defines all possible capabilities an API can provide
 */
enum class ApiCapability(
    val displayName: String,
    val description: String,
    val category: ApiCapabilityCategory
) {
    // Metadata Capabilities
    BOOK_METADATA("Book Metadata", "Fetch book title, author, description, ISBN", ApiCapabilityCategory.METADATA),
    MOVIE_METADATA("Movie Metadata", "Fetch movie info, cast, crew, runtime", ApiCapabilityCategory.METADATA),
    TV_METADATA("TV Show Metadata", "Fetch TV show info, seasons, episodes", ApiCapabilityCategory.METADATA),
    MUSIC_METADATA("Music Metadata", "Fetch album, artist, track info", ApiCapabilityCategory.METADATA),
    PODCAST_METADATA("Podcast Metadata", "Fetch podcast and episode info", ApiCapabilityCategory.METADATA),
    COMIC_METADATA("Comic Metadata", "Fetch comic series, issue info", ApiCapabilityCategory.METADATA),
    AUDIOBOOK_METADATA("Audiobook Metadata", "Fetch audiobook narrator, duration", ApiCapabilityCategory.METADATA),
    
    // Artwork Capabilities
    COVER_ART("Cover Art", "Fetch cover/poster images", ApiCapabilityCategory.ARTWORK),
    BACKDROP_ART("Backdrop Art", "Fetch widescreen backdrop images", ApiCapabilityCategory.ARTWORK),
    ARTIST_IMAGES("Artist Images", "Fetch artist/author photos", ApiCapabilityCategory.ARTWORK),
    FANART("Fan Art", "Fetch community-created artwork", ApiCapabilityCategory.ARTWORK),
    
    // Content Capabilities
    BOOK_DOWNLOAD("Book Download", "Download ebooks", ApiCapabilityCategory.CONTENT),
    AUDIOBOOK_DOWNLOAD("Audiobook Download", "Download audiobooks", ApiCapabilityCategory.CONTENT),
    MUSIC_STREAM("Music Streaming", "Stream music tracks", ApiCapabilityCategory.CONTENT),
    PODCAST_STREAM("Podcast Streaming", "Stream podcast episodes", ApiCapabilityCategory.CONTENT),
    VIDEO_STREAM("Video Streaming", "Stream movies/TV", ApiCapabilityCategory.CONTENT),
    RADIO_STREAM("Radio Streaming", "Stream radio stations", ApiCapabilityCategory.CONTENT),
    FANFICTION_DOWNLOAD("Fanfiction Download", "Download web fiction", ApiCapabilityCategory.CONTENT),
    
    // Discovery Capabilities
    SEARCH("Search", "Search for content", ApiCapabilityCategory.DISCOVERY),
    RECOMMENDATIONS("Recommendations", "Get personalized recommendations", ApiCapabilityCategory.DISCOVERY),
    SIMILAR_CONTENT("Similar Content", "Find similar items", ApiCapabilityCategory.DISCOVERY),
    TRENDING("Trending Content", "Get trending/popular items", ApiCapabilityCategory.DISCOVERY),
    NEW_RELEASES("New Releases", "Get newly released content", ApiCapabilityCategory.DISCOVERY),
    
    // Sync Capabilities
    LIBRARY_SYNC("Library Sync", "Sync library contents", ApiCapabilityCategory.SYNC),
    PROGRESS_SYNC("Progress Sync", "Sync reading/watching progress", ApiCapabilityCategory.SYNC),
    RATING_SYNC("Rating Sync", "Sync ratings and reviews", ApiCapabilityCategory.SYNC),
    COLLECTION_SYNC("Collection Sync", "Sync collections/playlists", ApiCapabilityCategory.SYNC),
    
    // Social Capabilities
    SCROBBLING("Scrobbling", "Track listening history", ApiCapabilityCategory.SOCIAL),
    SOCIAL_SHARING("Social Sharing", "Share activity to social networks", ApiCapabilityCategory.SOCIAL),
    REVIEWS("Reviews", "Fetch or submit reviews", ApiCapabilityCategory.SOCIAL),
    SHELVES("Reading Shelves", "Manage want-to-read, reading, read shelves", ApiCapabilityCategory.SOCIAL),
    
    // Extra Capabilities
    TRAILERS("Trailers", "Fetch movie/show trailers", ApiCapabilityCategory.EXTRA),
    SUBTITLES("Subtitles", "Fetch subtitles/captions", ApiCapabilityCategory.EXTRA),
    LYRICS("Lyrics", "Fetch song lyrics", ApiCapabilityCategory.EXTRA),
    TRANSLATION("Translation", "Translate content", ApiCapabilityCategory.EXTRA),
    TTS("Text-to-Speech", "Convert text to audio", ApiCapabilityCategory.EXTRA),
    OCR("OCR", "Extract text from images", ApiCapabilityCategory.EXTRA)
}

enum class ApiCapabilityCategory(val displayName: String) {
    METADATA("Metadata"),
    ARTWORK("Artwork"),
    CONTENT("Content"),
    DISCOVERY("Discovery"),
    SYNC("Synchronization"),
    SOCIAL("Social"),
    EXTRA("Additional Features")
}

// =============================================================================
// API PROVIDER DEFINITIONS
// =============================================================================

/**
 * Known API providers with their supported capabilities
 */
@Serializable
data class ApiProvider(
    val id: String,
    val name: String,
    val description: String,
    val website: String,
    val supportedCapabilities: Set<ApiCapability>,
    val requiresApiKey: Boolean = false,
    val requiresOAuth: Boolean = false,
    val isFree: Boolean = true,
    val rateLimit: Int? = null,
    val icon: String? = null
)

/**
 * Registry of all known API providers
 */
object ApiProviderRegistry {
    
    // Book APIs
    val GOOGLE_BOOKS = ApiProvider(
        id = "google_books",
        name = "Google Books",
        description = "Google's book metadata and cover art service",
        website = "https://books.google.com",
        supportedCapabilities = setOf(
            ApiCapability.BOOK_METADATA,
            ApiCapability.COVER_ART,
            ApiCapability.SEARCH,
            ApiCapability.RECOMMENDATIONS
        ),
        requiresApiKey = false,
        isFree = true
    )
    
    val OPEN_LIBRARY = ApiProvider(
        id = "open_library",
        name = "Open Library",
        description = "Internet Archive's open book database",
        website = "https://openlibrary.org",
        supportedCapabilities = setOf(
            ApiCapability.BOOK_METADATA,
            ApiCapability.COVER_ART,
            ApiCapability.SEARCH,
            ApiCapability.BOOK_DOWNLOAD
        ),
        requiresApiKey = false,
        isFree = true
    )
    
    val GOODREADS = ApiProvider(
        id = "goodreads",
        name = "Goodreads",
        description = "Book reviews, ratings, and social features",
        website = "https://goodreads.com",
        supportedCapabilities = setOf(
            ApiCapability.BOOK_METADATA,
            ApiCapability.REVIEWS,
            ApiCapability.RECOMMENDATIONS,
            ApiCapability.SHELVES,
            ApiCapability.RATING_SYNC,
            ApiCapability.PROGRESS_SYNC
        ),
        requiresOAuth = true,
        isFree = true
    )
    
    // Movie/TV APIs
    val TMDB = ApiProvider(
        id = "tmdb",
        name = "The Movie Database (TMDB)",
        description = "Comprehensive movie and TV show metadata",
        website = "https://themoviedb.org",
        supportedCapabilities = setOf(
            ApiCapability.MOVIE_METADATA,
            ApiCapability.TV_METADATA,
            ApiCapability.COVER_ART,
            ApiCapability.BACKDROP_ART,
            ApiCapability.ARTIST_IMAGES,
            ApiCapability.SEARCH,
            ApiCapability.RECOMMENDATIONS,
            ApiCapability.SIMILAR_CONTENT,
            ApiCapability.TRENDING,
            ApiCapability.NEW_RELEASES,
            ApiCapability.TRAILERS
        ),
        requiresApiKey = true,
        isFree = true,
        rateLimit = 50
    )
    
    val OMDB = ApiProvider(
        id = "omdb",
        name = "OMDb API",
        description = "Movie ratings from Rotten Tomatoes, IMDB, Metacritic",
        website = "https://omdbapi.com",
        supportedCapabilities = setOf(
            ApiCapability.MOVIE_METADATA,
            ApiCapability.TV_METADATA,
            ApiCapability.COVER_ART,
            ApiCapability.SEARCH,
            ApiCapability.REVIEWS
        ),
        requiresApiKey = true,
        isFree = true,
        rateLimit = 1000
    )
    
    val TV_MAZE = ApiProvider(
        id = "tv_maze",
        name = "TVMaze",
        description = "TV show scheduling and episode information",
        website = "https://tvmaze.com",
        supportedCapabilities = setOf(
            ApiCapability.TV_METADATA,
            ApiCapability.COVER_ART,
            ApiCapability.SEARCH,
            ApiCapability.NEW_RELEASES
        ),
        requiresApiKey = false,
        isFree = true
    )
    
    val FANART_TV = ApiProvider(
        id = "fanart_tv",
        name = "Fanart.tv",
        description = "High-quality fan artwork for movies, TV, and music",
        website = "https://fanart.tv",
        supportedCapabilities = setOf(
            ApiCapability.COVER_ART,
            ApiCapability.BACKDROP_ART,
            ApiCapability.FANART,
            ApiCapability.ARTIST_IMAGES
        ),
        requiresApiKey = true,
        isFree = true
    )
    
    // Music APIs
    val MUSICBRAINZ = ApiProvider(
        id = "musicbrainz",
        name = "MusicBrainz",
        description = "Open music encyclopedia",
        website = "https://musicbrainz.org",
        supportedCapabilities = setOf(
            ApiCapability.MUSIC_METADATA,
            ApiCapability.SEARCH,
            ApiCapability.SIMILAR_CONTENT
        ),
        requiresApiKey = false,
        isFree = true
    )
    
    val LAST_FM = ApiProvider(
        id = "last_fm",
        name = "Last.fm",
        description = "Music scrobbling and recommendations",
        website = "https://last.fm",
        supportedCapabilities = setOf(
            ApiCapability.MUSIC_METADATA,
            ApiCapability.COVER_ART,
            ApiCapability.ARTIST_IMAGES,
            ApiCapability.SCROBBLING,
            ApiCapability.RECOMMENDATIONS,
            ApiCapability.SIMILAR_CONTENT,
            ApiCapability.TRENDING
        ),
        requiresApiKey = true,
        isFree = true
    )
    
    val SPOTIFY = ApiProvider(
        id = "spotify",
        name = "Spotify",
        description = "Music and podcast streaming with metadata",
        website = "https://spotify.com",
        supportedCapabilities = setOf(
            ApiCapability.MUSIC_METADATA,
            ApiCapability.PODCAST_METADATA,
            ApiCapability.COVER_ART,
            ApiCapability.ARTIST_IMAGES,
            ApiCapability.SEARCH,
            ApiCapability.RECOMMENDATIONS,
            ApiCapability.TRENDING,
            ApiCapability.NEW_RELEASES,
            ApiCapability.MUSIC_STREAM,
            ApiCapability.PODCAST_STREAM
        ),
        requiresOAuth = true,
        isFree = false
    )
    
    // Podcast APIs
    val PODCAST_INDEX = ApiProvider(
        id = "podcast_index",
        name = "Podcast Index",
        description = "Open podcast directory and search",
        website = "https://podcastindex.org",
        supportedCapabilities = setOf(
            ApiCapability.PODCAST_METADATA,
            ApiCapability.COVER_ART,
            ApiCapability.SEARCH,
            ApiCapability.TRENDING,
            ApiCapability.NEW_RELEASES
        ),
        requiresApiKey = true,
        isFree = true
    )
    
    val APPLE_PODCASTS = ApiProvider(
        id = "apple_podcasts",
        name = "Apple Podcasts",
        description = "Apple's podcast directory",
        website = "https://podcasts.apple.com",
        supportedCapabilities = setOf(
            ApiCapability.PODCAST_METADATA,
            ApiCapability.COVER_ART,
            ApiCapability.SEARCH
        ),
        requiresApiKey = false,
        isFree = true
    )
    
    // Media Server APIs
    val PLEX = ApiProvider(
        id = "plex",
        name = "Plex",
        description = "Personal media server with rich metadata",
        website = "https://plex.tv",
        supportedCapabilities = setOf(
            ApiCapability.MOVIE_METADATA,
            ApiCapability.TV_METADATA,
            ApiCapability.MUSIC_METADATA,
            ApiCapability.COVER_ART,
            ApiCapability.BACKDROP_ART,
            ApiCapability.VIDEO_STREAM,
            ApiCapability.MUSIC_STREAM,
            ApiCapability.LIBRARY_SYNC,
            ApiCapability.PROGRESS_SYNC,
            ApiCapability.COLLECTION_SYNC
        ),
        requiresOAuth = true,
        isFree = false
    )
    
    val JELLYFIN = ApiProvider(
        id = "jellyfin",
        name = "Jellyfin",
        description = "Free and open source media server",
        website = "https://jellyfin.org",
        supportedCapabilities = setOf(
            ApiCapability.MOVIE_METADATA,
            ApiCapability.TV_METADATA,
            ApiCapability.MUSIC_METADATA,
            ApiCapability.COVER_ART,
            ApiCapability.VIDEO_STREAM,
            ApiCapability.MUSIC_STREAM,
            ApiCapability.LIBRARY_SYNC,
            ApiCapability.PROGRESS_SYNC
        ),
        requiresApiKey = true,
        isFree = true
    )
    
    val EMBY = ApiProvider(
        id = "emby",
        name = "Emby",
        description = "Personal media server",
        website = "https://emby.media",
        supportedCapabilities = setOf(
            ApiCapability.MOVIE_METADATA,
            ApiCapability.TV_METADATA,
            ApiCapability.MUSIC_METADATA,
            ApiCapability.COVER_ART,
            ApiCapability.VIDEO_STREAM,
            ApiCapability.MUSIC_STREAM,
            ApiCapability.LIBRARY_SYNC,
            ApiCapability.PROGRESS_SYNC
        ),
        requiresApiKey = true,
        isFree = false
    )
    
    val CALIBRE = ApiProvider(
        id = "calibre",
        name = "Calibre Content Server",
        description = "Calibre library server",
        website = "https://calibre-ebook.com",
        supportedCapabilities = setOf(
            ApiCapability.BOOK_METADATA,
            ApiCapability.COVER_ART,
            ApiCapability.BOOK_DOWNLOAD,
            ApiCapability.LIBRARY_SYNC,
            ApiCapability.SEARCH
        ),
        requiresApiKey = false,
        isFree = true
    )
    
    // AI/Cloud APIs
    val GEMINI = ApiProvider(
        id = "gemini",
        name = "Google Gemini",
        description = "AI-powered features",
        website = "https://ai.google.dev",
        supportedCapabilities = setOf(
            ApiCapability.RECOMMENDATIONS,
            ApiCapability.TRANSLATION,
            ApiCapability.TTS,
            ApiCapability.OCR,
            ApiCapability.SIMILAR_CONTENT
        ),
        requiresApiKey = true,
        isFree = false
    )
    
    val OPENAI = ApiProvider(
        id = "openai",
        name = "OpenAI",
        description = "AI-powered text and speech",
        website = "https://openai.com",
        supportedCapabilities = setOf(
            ApiCapability.RECOMMENDATIONS,
            ApiCapability.TRANSLATION,
            ApiCapability.TTS
        ),
        requiresApiKey = true,
        isFree = false
    )
    
    val ELEVEN_LABS = ApiProvider(
        id = "eleven_labs",
        name = "ElevenLabs",
        description = "High-quality AI voice synthesis",
        website = "https://elevenlabs.io",
        supportedCapabilities = setOf(
            ApiCapability.TTS
        ),
        requiresApiKey = true,
        isFree = false
    )
    
    // Radio
    val RADIO_BROWSER = ApiProvider(
        id = "radio_browser",
        name = "Radio Browser",
        description = "Internet radio station directory",
        website = "https://radio-browser.info",
        supportedCapabilities = setOf(
            ApiCapability.RADIO_STREAM,
            ApiCapability.SEARCH
        ),
        requiresApiKey = false,
        isFree = true
    )
    
    // Audiobooks
    val LIBRIVOX = ApiProvider(
        id = "librivox",
        name = "LibriVox",
        description = "Free public domain audiobooks",
        website = "https://librivox.org",
        supportedCapabilities = setOf(
            ApiCapability.AUDIOBOOK_METADATA,
            ApiCapability.AUDIOBOOK_DOWNLOAD,
            ApiCapability.SEARCH
        ),
        requiresApiKey = false,
        isFree = true
    )
    
    /**
     * All registered providers
     */
    val allProviders = listOf(
        GOOGLE_BOOKS, OPEN_LIBRARY, GOODREADS,
        TMDB, OMDB, TV_MAZE, FANART_TV,
        MUSICBRAINZ, LAST_FM, SPOTIFY,
        PODCAST_INDEX, APPLE_PODCASTS,
        PLEX, JELLYFIN, EMBY, CALIBRE,
        GEMINI, OPENAI, ELEVEN_LABS,
        RADIO_BROWSER, LIBRIVOX
    )
    
    /**
     * Get providers that support a specific capability
     */
    fun getProvidersForCapability(capability: ApiCapability): List<ApiProvider> {
        return allProviders.filter { capability in it.supportedCapabilities }
    }
    
    /**
     * Get all capabilities for a provider
     */
    fun getCapabilitiesForProvider(providerId: String): Set<ApiCapability> {
        return allProviders.find { it.id == providerId }?.supportedCapabilities ?: emptySet()
    }
}

// =============================================================================
// API CONFIGURATION
// =============================================================================

/**
 * User's configuration for which provider to use for each capability
 */
@Serializable
data class ApiConfiguration(
    val providerId: String,
    val apiKey: String? = null,
    val accessToken: String? = null,
    val serverUrl: String? = null,
    val enabledCapabilities: Set<ApiCapability>,
    val isEnabled: Boolean = true,
    val priority: Int = 0
)

/**
 * Manager for API configurations
 */
class ApiConfigurationManager {
    
    private val _configurations = MutableStateFlow<Map<String, ApiConfiguration>>(emptyMap())
    val configurations: StateFlow<Map<String, ApiConfiguration>> = _configurations.asStateFlow()
    
    /**
     * Get the preferred provider for a specific capability
     */
    fun getPreferredProvider(capability: ApiCapability): ApiConfiguration? {
        return _configurations.value.values
            .filter { it.isEnabled && capability in it.enabledCapabilities }
            .maxByOrNull { it.priority }
    }
    
    /**
     * Get all configured providers for a capability (fallback chain)
     */
    fun getProvidersForCapability(capability: ApiCapability): List<ApiConfiguration> {
        return _configurations.value.values
            .filter { it.isEnabled && capability in it.enabledCapabilities }
            .sortedByDescending { it.priority }
    }
    
    /**
     * Add or update a provider configuration
     */
    fun setConfiguration(config: ApiConfiguration) {
        _configurations.value = _configurations.value + (config.providerId to config)
    }
    
    /**
     * Remove a provider configuration
     */
    fun removeConfiguration(providerId: String) {
        _configurations.value = _configurations.value - providerId
    }
    
    /**
     * Set which capabilities to use from a provider
     */
    fun setEnabledCapabilities(providerId: String, capabilities: Set<ApiCapability>) {
        val existing = _configurations.value[providerId] ?: return
        _configurations.value = _configurations.value + (providerId to existing.copy(
            enabledCapabilities = capabilities
        ))
    }
    
    /**
     * Set priority for a provider (higher = preferred)
     */
    fun setPriority(providerId: String, priority: Int) {
        val existing = _configurations.value[providerId] ?: return
        _configurations.value = _configurations.value + (providerId to existing.copy(
            priority = priority
        ))
    }
}

// =============================================================================
// UNIFIED API SERVICE
// =============================================================================

/**
 * Unified service that routes requests to the appropriate configured provider
 */
interface UnifiedApiService {
    
    /**
     * Search across all configured providers for a capability
     */
    suspend fun <T> executeWithFallback(
        capability: ApiCapability,
        request: suspend (ApiConfiguration) -> Result<T>
    ): Result<T>
    
    /**
     * Execute on all providers and merge results
     */
    suspend fun <T> executeOnAll(
        capability: ApiCapability,
        request: suspend (ApiConfiguration) -> Result<List<T>>
    ): List<T>
}

/**
 * Implementation of unified API service
 */
class UnifiedApiServiceImpl(
    private val configManager: ApiConfigurationManager
) : UnifiedApiService {
    
    override suspend fun <T> executeWithFallback(
        capability: ApiCapability,
        request: suspend (ApiConfiguration) -> Result<T>
    ): Result<T> {
        val providers = configManager.getProvidersForCapability(capability)
        
        for (provider in providers) {
            val result = request(provider)
            if (result.isSuccess) {
                return result
            }
        }
        
        return Result.failure(NoConfiguredProviderException(capability))
    }
    
    override suspend fun <T> executeOnAll(
        capability: ApiCapability,
        request: suspend (ApiConfiguration) -> Result<List<T>>
    ): List<T> {
        val providers = configManager.getProvidersForCapability(capability)
        
        return providers.flatMap { provider ->
            request(provider).getOrDefault(emptyList())
        }
    }
}

class NoConfiguredProviderException(capability: ApiCapability) : 
    Exception("No configured provider for capability: ${capability.displayName}")
