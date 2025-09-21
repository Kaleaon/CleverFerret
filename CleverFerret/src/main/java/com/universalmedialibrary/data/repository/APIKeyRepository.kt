package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.local.entity.APIKey
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class APIKeyRepository @Inject constructor(
    private val apiKeyDao: APIKeyDao
) {
    
    suspend fun saveAPIKey(
        provider: String, 
        keyValue: String, 
        category: String, 
        isRequired: Boolean = false
    ) {
        val apiKey = APIKey(
            provider = provider,
            keyValue = keyValue,
            category = category,
            isRequired = isRequired,
            lastUpdated = System.currentTimeMillis()
        )
        apiKeyDao.insertOrUpdate(apiKey)
    }
    
    suspend fun getAPIKeyValue(provider: String): String? {
        return apiKeyDao.getAPIKey(provider)?.keyValue
    }
    
    fun getAllAPIKeys(): Flow<List<APIKey>> {
        return apiKeyDao.getAllAPIKeys()
    }
    
    suspend fun updateValidationStatus(provider: String, status: String) {
        apiKeyDao.updateValidationStatus(provider, status)
    }
    
    suspend fun initializeDefaultAPIKeys() {
        val defaultKeys = mapOf(
            "google_books" to "BOOKS",
            "tmdb" to "MOVIES_TV",
            "comicvine" to "COMICS_MANGA",
            "listen_notes" to "PODCASTS",
            "lastfm" to "MUSIC"
        )
        
        defaultKeys.forEach { (provider, category) ->
            if (apiKeyDao.getAPIKey(provider) == null) {
                saveAPIKey(provider, "", category)
            }
        }
    }
}