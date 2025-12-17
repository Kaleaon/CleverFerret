package com.universalmedialibrary.services.ai

import com.universalmedialibrary.data.local.entity.ReaderAIInsightType

/**
 * Interface for AI Providers (Gemini, OpenAI, etc.)
 */
interface AIProvider {
    val providerId: String
    val displayName: String

    /**
     * Generate insight content based on text input.
     */
    suspend fun generateInsight(
        prompt: String,
        contextText: String,
        type: ReaderAIInsightType
    ): Result<String>

    /**
     * Validate the API key.
     */
    suspend fun validateKey(apiKey: String): Boolean
}
