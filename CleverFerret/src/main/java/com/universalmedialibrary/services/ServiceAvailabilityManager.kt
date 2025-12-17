package com.universalmedialibrary.services

import com.universalmedialibrary.data.repository.APIKeyRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.combine
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service Availability Manager
 * 
 * Manages the availability status of external services based on:
 * - API key configuration
 * - Service health checks
 * - Feature flags
 * 
 * Provides a centralized way for ViewModels and screens to check
 * which features are available before attempting to use them.
 */
@Singleton
class ServiceAvailabilityManager @Inject constructor(
    private val apiKeyRepository: APIKeyRepository
) {
    private val _serviceStatus = MutableStateFlow<Map<ServiceType, ServiceStatus>>(emptyMap())
    val serviceStatus = _serviceStatus.asStateFlow()
    
    /**
     * Check if a specific service is available
     */
    suspend fun isServiceAvailable(serviceType: ServiceType): Boolean {
        val requiredKeys = serviceType.requiredApiKeys
        if (requiredKeys.isEmpty()) return true
        
        return requiredKeys.all { provider ->
            val key = apiKeyRepository.getAPIKeyValue(provider)
            !key.isNullOrBlank()
        }
    }
    
    /**
     * Get the status of a service with detailed information
     */
    suspend fun getServiceStatus(serviceType: ServiceType): ServiceStatus {
        val requiredKeys = serviceType.requiredApiKeys
        
        if (requiredKeys.isEmpty()) {
            return ServiceStatus.Available
        }
        
        val missingKeys = requiredKeys.filter { provider ->
            val key = apiKeyRepository.getAPIKeyValue(provider)
            key.isNullOrBlank()
        }
        
        return when {
            missingKeys.isEmpty() -> ServiceStatus.Available
            missingKeys.size < requiredKeys.size -> ServiceStatus.PartiallyConfigured(missingKeys)
            else -> ServiceStatus.NotConfigured(missingKeys)
        }
    }
    
    /**
     * Refresh status for all services
     */
    suspend fun refreshAllStatuses() {
        val statuses = ServiceType.entries.associateWith { serviceType ->
            getServiceStatus(serviceType)
        }
        _serviceStatus.value = statuses
    }
    
    /**
     * Get all services that need API key configuration
     */
    fun getServicesNeedingConfiguration(): Flow<List<ServiceType>> {
        return combine(apiKeyRepository.getAllAPIKeys()) { allKeys ->
            val keyMap = allKeys.firstOrNull()?.associate { it.provider to it.keyValue } ?: emptyMap()
            
            ServiceType.entries.filter { serviceType ->
                serviceType.requiredApiKeys.any { provider ->
                    keyMap[provider].isNullOrBlank()
                }
            }
        }
    }
}

/**
 * Types of external services the app can use
 */
enum class ServiceType(
    val displayName: String,
    val description: String,
    val requiredApiKeys: List<String>,
    val category: ServiceCategory
) {
    // AI Services
    GEMINI_AI(
        "Gemini AI",
        "OCR, book identification, and AI features",
        listOf("gemini"),
        ServiceCategory.AI
    ),
    OPENAI(
        "OpenAI",
        "Advanced AI text generation",
        listOf("openai"),
        ServiceCategory.AI
    ),
    
    // TTS Services
    ELEVENLABS_TTS(
        "ElevenLabs TTS",
        "High-quality voice synthesis",
        listOf("elevenlabs"),
        ServiceCategory.TTS
    ),
    GOOGLE_CLOUD_TTS(
        "Google Cloud TTS",
        "Google's text-to-speech service",
        listOf("google_cloud_tts"),
        ServiceCategory.TTS
    ),
    
    // Book Metadata
    GOOGLE_BOOKS(
        "Google Books",
        "Book metadata and covers",
        listOf("google_books"),
        ServiceCategory.METADATA
    ),
    GOODREADS(
        "Goodreads",
        "Book reviews and ratings",
        listOf("goodreads"),
        ServiceCategory.METADATA
    ),
    NYT_BOOKS(
        "NYT Books",
        "New York Times bestseller lists",
        listOf("nyt"),
        ServiceCategory.METADATA
    ),
    
    // Comic/Manga
    COMICVINE(
        "ComicVine",
        "Comic and manga metadata",
        listOf("comicvine"),
        ServiceCategory.METADATA
    ),
    
    // Movie/TV
    TMDB(
        "TMDB",
        "Movie and TV show metadata",
        listOf("tmdb"),
        ServiceCategory.METADATA
    ),
    OMDB(
        "OMDb",
        "Open Movie Database",
        listOf("omdb"),
        ServiceCategory.METADATA
    ),
    TVDB(
        "TheTVDB",
        "TV show metadata",
        listOf("tvdb"),
        ServiceCategory.METADATA
    ),
    
    // Music
    LASTFM(
        "Last.fm",
        "Music metadata and scrobbling",
        listOf("lastfm"),
        ServiceCategory.MUSIC
    ),
    DISCOGS(
        "Discogs",
        "Music database and marketplace",
        listOf("discogs_token"),
        ServiceCategory.MUSIC
    ),
    MUSIXMATCH(
        "Musixmatch",
        "Song lyrics",
        listOf("musixmatch"),
        ServiceCategory.MUSIC
    ),
    GENIUS(
        "Genius",
        "Song lyrics and annotations",
        listOf("genius"),
        ServiceCategory.MUSIC
    ),
    
    // Podcasts
    LISTEN_NOTES(
        "Listen Notes",
        "Podcast search and discovery",
        listOf("listen_notes"),
        ServiceCategory.PODCASTS
    ),
    PODCAST_INDEX(
        "Podcast Index",
        "Open podcast directory",
        listOf("podcast_index"),
        ServiceCategory.PODCASTS
    ),
    
    // Recommendations
    TASTEDIVE(
        "TasteDive",
        "Media recommendations",
        listOf("tastedive"),
        ServiceCategory.RECOMMENDATIONS
    ),
    
    // Artwork
    FANART_TV(
        "Fanart.tv",
        "High-quality media artwork",
        listOf("fanart_tv"),
        ServiceCategory.ARTWORK
    ),
    
    // Local Services (no API key required)
    LOCAL_LIBRARY(
        "Local Library",
        "Your local media files",
        emptyList(),
        ServiceCategory.LOCAL
    ),
    RADIO_BROWSER(
        "Radio Browser",
        "Internet radio stations",
        emptyList(),
        ServiceCategory.LOCAL
    ),
    OPDS(
        "OPDS Catalogs",
        "Open Publication Distribution",
        emptyList(),
        ServiceCategory.LOCAL
    )
}

enum class ServiceCategory {
    AI,
    TTS,
    METADATA,
    MUSIC,
    PODCASTS,
    RECOMMENDATIONS,
    ARTWORK,
    LOCAL
}

sealed class ServiceStatus {
    object Available : ServiceStatus()
    data class PartiallyConfigured(val missingKeys: List<String>) : ServiceStatus()
    data class NotConfigured(val requiredKeys: List<String>) : ServiceStatus()
    data class Error(val message: String) : ServiceStatus()
}
