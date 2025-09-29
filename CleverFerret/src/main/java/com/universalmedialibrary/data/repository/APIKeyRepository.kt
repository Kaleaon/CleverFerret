package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.local.dao.ProviderKeyPair
import com.universalmedialibrary.data.local.model.APIKey
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