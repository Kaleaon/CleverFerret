package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.local.dao.ProviderKeyPair
import com.universalmedialibrary.data.local.entity.APIKey
import com.universalmedialibrary.data.settings.ImageGeneratorType
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class APIKeyRepository @Inject constructor(
    private val apiKeyDao: APIKeyDao
) {

    fun getAllAPIKeys(): Flow<List<APIKey>> = apiKeyDao.getAllAPIKeys()

    fun getAllActiveAPIKeys(): Flow<List<APIKey>> = apiKeyDao.getAllActiveAPIKeys()

    suspend fun getAPIKeyByProvider(provider: String): APIKey? =
        apiKeyDao.getAPIKeyByProvider(provider)

    suspend fun getAPIKeysByCategory(category: String): List<APIKey> =
        apiKeyDao.getAPIKeysByCategory(category)

    // Deprecated duplicate helper kept for backward compatibility
    @Deprecated("Use getAPIKeyValue(\"gemini\") or the defined helper below")
    suspend fun getGeminiApiKey(): String? = getAPIKeyValue("gemini")

    suspend fun saveAPIKey(provider: String, keyValue: String, category: String, isRequired: Boolean = false) {
        val existingKey = apiKeyDao.getAPIKeyByProvider(provider)

        if (existingKey != null) {
            // Update existing key
            val updatedKey = existingKey.copy(
                keyValue = keyValue,
                lastUsed = System.currentTimeMillis(),
                validationStatus = if (keyValue.isBlank()) "UNKNOWN" else "UNKNOWN" // Reset validation status
            )
            apiKeyDao.updateAPIKey(updatedKey)
        } else {
            // Create new key
            val newKey = APIKey(
                displayName = getDisplayNameForProvider(provider),
                keyValue = keyValue,
                provider = provider,
                category = category,
                validationStatus = if (keyValue.isBlank()) "UNKNOWN" else "UNKNOWN"
            )
            apiKeyDao.insertAPIKey(newKey)
        }
    }

    suspend fun deleteAPIKey(provider: String) {
        apiKeyDao.deleteAPIKeyByProvider(provider)
    }

    suspend fun updateValidationStatus(provider: String, status: String) {
        apiKeyDao.updateValidationStatus(provider, status, System.currentTimeMillis())
    }

    suspend fun getAPIKeyValue(provider: String): String? =
        apiKeyDao.getAPIKeyValue(provider)

    suspend fun getActiveAPIKeysMap(): Map<String, String> {
        val pairs = apiKeyDao.getActiveProviderKeys()
        return pairs.associate { it.provider to it.keyValue }
    }

    suspend fun getValidAPIKeysCountByCategory(category: String): Int =
        apiKeyDao.getValidAPIKeysCountByCategory(category)

    // Initialize default API key configurations
    suspend fun initializeDefaultAPIKeys() {
        val defaultConfigs = listOf(
            // Book APIs
            Triple("google_books", "BOOKS", false),
            Triple("goodreads", "BOOKS", false),
            Triple("hardcover", "BOOKS", false),
            Triple("amazon_access_key", "BOOKS", false),
            Triple("amazon_secret_key", "BOOKS", false),
            Triple("isbn_db", "BOOKS", false),
            Triple("nyt", "BOOKS", false),
            Triple("open_library", "BOOKS", false),

            // Comic/Manga APIs
            Triple("comicvine", "COMICS_MANGA", true),

            // Podcast APIs
            Triple("listen_notes", "PODCASTS", false),
            Triple("spotify_client_id", "PODCASTS", false),
            Triple("spotify_client_secret", "PODCASTS", false),
            Triple("taddy", "PODCASTS", false),

            // Movie/TV APIs
            Triple("tmdb", "MOVIES_TV", false),
            Triple("omdb", "MOVIES_TV", false),
            Triple("tvdb", "MOVIES_TV", false),

            // Music APIs
            Triple("lastfm", "MUSIC", false),
            Triple("discogs_token", "MUSIC", false),
            
            // Sound Effects APIs
            Triple("freesound", "AUDIO", false),
            // Artwork APIs
            Triple("fanart_tv", "ARTWORK", false),
            Triple("cover_art_archive", "ARTWORK", false),
            // Lyrics APIs
            Triple("musixmatch", "LYRICS", false),
            Triple("genius", "LYRICS", false),

            // Recommendation APIs
            Triple("tastedive", "RECOMMENDATIONS", false),

            // AI Services - PRIMARY AI for all devices
            Triple("gemini", "AI_SERVICES", false),
            Triple("openai", "AI_SERVICES", false),
            Triple("elevenlabs", "AI_SERVICES", false),
            Triple("google_cloud_tts", "AI_SERVICES", false)
        )

        defaultConfigs.forEach { (provider, category, isRequired) ->
            val existingKey = apiKeyDao.getAPIKeyByProvider(provider)
            if (existingKey == null) {
                // Use BuildConfig for defaults if available
                val defaultKeyValue = when(provider) {
                    "tastedive" -> try { com.universalmedialibrary.BuildConfig.TASTEDIVE_API_KEY } catch (e: Exception) { "" }
                    "nyt" -> try { com.universalmedialibrary.BuildConfig.NYT_API_KEY } catch (e: Exception) { "" }
                    else -> ""
                }
                
                val apiKey = APIKey(
                    displayName = getDisplayNameForProvider(provider),
                    keyValue = defaultKeyValue,
                    provider = provider,
                    category = category,
                    validationStatus = if (defaultKeyValue.isNotBlank()) "VALID" else "UNKNOWN"
                )
                apiKeyDao.insertAPIKey(apiKey)
            }
        }
    }

    private fun getDisplayNameForProvider(provider: String): String {
        return when (provider) {
            "google_books" -> "Google Books API"
            "goodreads" -> "Goodreads API"
            "hardcover" -> "Hardcover API"
            "amazon_access_key" -> "Amazon Access Key"
            "amazon_secret_key" -> "Amazon Secret Key"
            "isbn_db" -> "ISBN-DB API"
            "nyt" -> "New York Times API"
            "open_library" -> "Open Library API"
            "comicvine" -> "ComicVine API"
            "listen_notes" -> "Listen Notes API"
            "spotify_client_id" -> "Spotify Client ID"
            "spotify_client_secret" -> "Spotify Client Secret"
            "taddy" -> "Taddy API"
            "tmdb" -> "TMDB API"
            "omdb" -> "OMDb API"
            "tvdb" -> "TVDB API"
            "lastfm" -> "Last.fm API"
            "discogs_token" -> "Discogs API"
            "freesound" -> "Freesound API"
            "fanart_tv" -> "Fanart.tv API"
            "cover_art_archive" -> "Cover Art Archive"
            "musixmatch" -> "Musixmatch API"
            "genius" -> "Genius API"
            "tastedive" -> "TasteDive API"
            "gemini" -> "Google Gemini AI"
            "openai" -> "OpenAI API"
            "elevenlabs" -> "ElevenLabs API"
            "google_cloud_tts" -> "Google Cloud TTS"
            else -> provider.replace("_", " ").split(" ").joinToString(" ") {
                it.replaceFirstChar { char -> char.uppercaseChar() }
            }
        }
    }

    // Gemini API key convenience methods

    suspend fun setGeminiApiKey(apiKey: String) {
        saveAPIKey("gemini", apiKey, "AI", false)
    }

    // Last.fm API key convenience methods
    suspend fun getLastFmApiKey(): String? = getAPIKeyValue("lastfm")
    
    suspend fun saveLastFmApiKey(apiKey: String) {
        saveAPIKey("lastfm", apiKey, "MUSIC", false)
    }
    
    suspend fun getLastFmSecret(): String? = getAPIKeyValue("lastfm_secret")
    
    suspend fun saveLastFmSecret(secret: String) {
        saveAPIKey("lastfm_secret", secret, "MUSIC", false)
    }
    
    suspend fun getLastFmSessionKey(): String? = getAPIKeyValue("lastfm_session")
    
    suspend fun saveLastFmSessionKey(sessionKey: String) {
        saveAPIKey("lastfm_session", sessionKey, "MUSIC", false)
    }

    // Image generator type persistence methods
    suspend fun saveImageGeneratorType(type: ImageGeneratorType) {
        // Store as a special API key entry with the enum name as the value
        saveAPIKey("image_generator_type", type.name, "AI_SETTINGS", false)
    }

    suspend fun getImageGeneratorType(): ImageGeneratorType {
        val value = getAPIKeyValue("image_generator_type")
        return try {
            if (value.isNullOrBlank()) {
                ImageGeneratorType.IMAGEN // Default
            } else {
                ImageGeneratorType.valueOf(value)
            }
        } catch (e: IllegalArgumentException) {
            ImageGeneratorType.IMAGEN // Default on invalid value
        }
    }
}
