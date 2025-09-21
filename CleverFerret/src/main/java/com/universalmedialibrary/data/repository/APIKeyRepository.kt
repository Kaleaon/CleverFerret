package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.local.dao.ProviderKeyPair
import com.universalmedialibrary.data.local.model.APIKey
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for managing API keys, acting as a single source of truth for API key data.
 * It abstracts the underlying data source (DAO) and provides a clean API for the application
 * to interact with API keys.
 *
 * @param apiKeyDao The Data Access Object for API key database operations.
 */
@Singleton
class APIKeyRepository @Inject constructor(
    private val apiKeyDao: APIKeyDao
) {

    /**
     * Retrieves all API keys from the database, wrapped in a [Flow] for reactive updates.
     * @return A [Flow] emitting a list of all [APIKey]s.
     */
    fun getAllAPIKeys(): Flow<List<APIKey>> = apiKeyDao.getAllAPIKeys()

    /**
     * Retrieves all currently active API keys, wrapped in a [Flow].
     * @return A [Flow] emitting a list of active [APIKey]s.
     */
    fun getAllActiveAPIKeys(): Flow<List<APIKey>> = apiKeyDao.getAllActiveAPIKeys()

    /**
     * Retrieves a specific API key by its provider name.
     * @param provider The unique name of the provider (e.g., "tmdb").
     * @return The corresponding [APIKey] if found, otherwise `null`.
     */
    suspend fun getAPIKeyByProvider(provider: String): APIKey? =
        apiKeyDao.getAPIKeyByProvider(provider)

    /**
     * Retrieves all active API keys for a specific category (e.g., "MOVIES_TV").
     * @param category The category to search for.
     * @return A list of matching [APIKey]s.
     */
    suspend fun getAPIKeysByCategory(category: String): List<APIKey> =
        apiKeyDao.getAPIKeysByCategory(category)

    /**
     * Saves or updates an API key in the database.
     * If a key for the given provider already exists, it is updated. Otherwise, a new key is created.
     *
     * @param provider The unique name of the provider.
     * @param keyValue The value of the API key.
     * @param category The category the key belongs to (e.g., "BOOKS").
     * @param isRequired Indicates whether the key is required for basic app functionality.
     */
    suspend fun saveAPIKey(provider: String, keyValue: String, category: String, isRequired: Boolean = false) {
        val existingKey = apiKeyDao.getAPIKeyByProvider(provider)

        if (existingKey != null) {
            // Update existing key
            val updatedKey = existingKey.copy(
                keyValue = keyValue,
                updatedAt = System.currentTimeMillis(),
                validationStatus = if (keyValue.isBlank()) "untested" else null // Reset validation status
            )
            apiKeyDao.updateAPIKey(updatedKey)
        } else {
            // Create new key
            val newKey = APIKey(
                keyName = getDisplayNameForProvider(provider),
                keyValue = keyValue,
                provider = provider,
                category = category,
                isRequired = isRequired,
                validationStatus = if (keyValue.isBlank()) "untested" else null
            )
            apiKeyDao.insertAPIKey(newKey)
        }
    }

    /**
     * Deletes an API key for a specific provider.
     * @param provider The provider name of the key to delete.
     */
    suspend fun deleteAPIKey(provider: String) {
        apiKeyDao.deleteAPIKeyByProvider(provider)
    }

    /**
     * Updates the validation status of a specific API key.
     * @param provider The provider name of the key to update.
     * @param status The new validation status (e.g., "valid", "invalid").
     */
    suspend fun updateValidationStatus(provider: String, status: String) {
        apiKeyDao.updateValidationStatus(provider, status, System.currentTimeMillis())
    }

    /**
     * Retrieves the raw value of an API key for a specific provider.
     * @param provider The provider name.
     * @return The API key value as a [String], or `null` if not found.
     */
    suspend fun getAPIKeyValue(provider: String): String? =
        apiKeyDao.getAPIKeyValue(provider)

    /**
     * Retrieves a map of all active provider-key pairs, useful for network interceptors or API clients.
     * @return A map where the key is the provider name and the value is the API key.
     */
    suspend fun getActiveAPIKeysMap(): Map<String, String> {
        val pairs = apiKeyDao.getActiveProviderKeys()
        return pairs.associate { it.provider to it.keyValue }
    }

    /**
     * Counts the number of valid and active API keys for a specific category.
     * @param category The category to count.
     * @return The number of valid and active keys as an [Int].
     */
    suspend fun getValidAPIKeysCountByCategory(category: String): Int =
        apiKeyDao.getValidAPIKeysCountByCategory(category)

    /**
     * Initializes the database with a default set of API key configurations if they don't already exist.
     * This ensures the app has placeholders for all required and optional keys on first launch.
     */
    suspend fun initializeDefaultAPIKeys() {
        val defaultConfigs = listOf(
            // Book APIs
            Triple("google_books", "BOOKS", false),
            Triple("goodreads", "BOOKS", false),
            Triple("hardcover", "BOOKS", false),
            Triple("amazon_access_key", "BOOKS", false),
            Triple("amazon_secret_key", "BOOKS", false),
            Triple("isbn_db", "BOOKS", false),

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
            Triple("discogs_token", "MUSIC", false)
        )

        defaultConfigs.forEach { (provider, category, isRequired) ->
            val existingKey = apiKeyDao.getAPIKeyByProvider(provider)
            if (existingKey == null) {
                val apiKey = APIKey(
                    keyName = getDisplayNameForProvider(provider),
                    keyValue = "",
                    provider = provider,
                    category = category,
                    isRequired = isRequired,
                    validationStatus = "untested"
                )
                apiKeyDao.insertAPIKey(apiKey)
            }
        }
    }

    /**
     * Converts a provider's technical name into a user-friendly display name.
     * @param provider The technical name of the provider (e.g., "google_books").
     * @return A user-friendly, capitalized display name (e.g., "Google Books API").
     */
    private fun getDisplayNameForProvider(provider: String): String {
        return when (provider) {
            "google_books" -> "Google Books API"
            "goodreads" -> "Goodreads API"
            "hardcover" -> "Hardcover API"
            "amazon_access_key" -> "Amazon Access Key"
            "amazon_secret_key" -> "Amazon Secret Key"
            "isbn_db" -> "ISBN-DB API"
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
            else -> provider.replace("_", " ").split(" ").joinToString(" ") {
                it.replaceFirstChar { char -> char.uppercaseChar() }
            }
        }
    }
}