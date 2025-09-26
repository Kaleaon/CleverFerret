package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.local.entity.APIKey
import kotlinx.coroutines.flow.first
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for managing API keys
 */
@Singleton
class APIKeyRepository @Inject constructor(
    private val apiKeyDao: APIKeyDao
) {
    
    /**
     * Get Gemini API key
     */
    suspend fun getGeminiApiKey(): String? {
        return apiKeyDao.getAPIKeyByProvider("gemini")?.keyValue
    }
    
    /**
     * Set Gemini API key
     */
    suspend fun setGeminiApiKey(key: String) {
        val existingKey = apiKeyDao.getAPIKeyByProvider("gemini")
        if (existingKey != null) {
            apiKeyDao.updateAPIKeyValue("gemini", key)
        } else {
            val apiKey = APIKey(
                provider = "gemini",
                keyValue = key,
                displayName = "Google Gemini AI",
                description = "API key for Google Gemini AI services",
                category = "AI"
            )
            apiKeyDao.insertAPIKey(apiKey)
        }
    }
    
    /**
     * Get all API keys
     */
    suspend fun getAllApiKeys(): List<APIKey> {
        return apiKeyDao.getAllAPIKeys().first()
    }
    
    /**
     * Get API key for a specific service
     */
    suspend fun getApiKey(service: String): String? {
        return apiKeyDao.getAPIKeyByProvider(service)?.keyValue
    }
    
    /**
     * Set API key for a specific service
     */
    suspend fun setApiKey(provider: String, key: String, displayName: String, category: String = "OTHER") {
        val existingKey = apiKeyDao.getAPIKeyByProvider(provider)
        if (existingKey != null) {
            apiKeyDao.updateAPIKeyValue(provider, key)
        } else {
            val apiKey = APIKey(
                provider = provider,
                keyValue = key,
                displayName = displayName,
                category = category
            )
            apiKeyDao.insertAPIKey(apiKey)
        }
    }
    
    /**
     * Delete API key for a service
     */
    suspend fun deleteApiKey(provider: String) {
        val apiKey = apiKeyDao.getAPIKeyByProvider(provider)
        if (apiKey != null) {
            apiKeyDao.deleteAPIKey(apiKey)
        }
    }
}