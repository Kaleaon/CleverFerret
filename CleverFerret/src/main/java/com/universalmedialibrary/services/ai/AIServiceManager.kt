package com.universalmedialibrary.services.ai

import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.preferences.AISettingsPreferencesStore
import kotlinx.coroutines.flow.first
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class AIServiceManager @Inject constructor(
    private val geminiProvider: GeminiAIProvider,
    private val openAIProvider: OpenAIProvider,
    private val apiKeyDao: APIKeyDao,
    private val aiSettings: AISettingsPreferencesStore
) {

    suspend fun getActiveProvider(): AIProvider? {
        val providerId = aiSettings.selectedProvider.first()
        val provider = when (providerId) {
            "GEMINI" -> geminiProvider
            "OPENAI" -> openAIProvider
            else -> geminiProvider
        }

        // Fetch key
        val keyEntity = apiKeyDao.getAPIKeyByProvider(providerId.lowercase())
        
        return if (keyEntity != null) {
            when (provider) {
                is GeminiAIProvider -> provider.setApiKey(keyEntity.keyValue)
                is OpenAIProvider -> provider.setApiKey(keyEntity.keyValue)
            }
            provider
        } else {
            null
        }
    }
    
    suspend fun getAvailableProviders(): List<AIProvider> {
        return listOf(geminiProvider, openAIProvider)
    }
}
