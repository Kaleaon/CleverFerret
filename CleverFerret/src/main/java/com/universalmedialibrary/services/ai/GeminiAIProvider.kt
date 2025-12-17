package com.universalmedialibrary.services.ai

import com.google.ai.client.generativeai.GenerativeModel
import com.google.ai.client.generativeai.type.GenerateContentResponse
import com.universalmedialibrary.data.local.entity.ReaderAIInsightType
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject

class GeminiAIProvider @Inject constructor() : AIProvider {

    override val providerId: String = "GEMINI"
    override val displayName: String = "Google Gemini"

    // This should be injected or passed during the call, but for now we instantiate per request
    // based on the key provided by the manager.
    // Ideally, the manager holds the key.
    
    private var activeKey: String? = null

    fun setApiKey(key: String) {
        activeKey = key
    }

    override suspend fun generateInsight(
        prompt: String,
        contextText: String,
        type: ReaderAIInsightType
    ): Result<String> = withContext(Dispatchers.IO) {
        val key = activeKey ?: return@withContext Result.failure(IllegalStateException("API Key not set"))
        
        try {
            // Use Gemini 1.5 Flash for speed and efficiency, or Pro for quality
            val model = GenerativeModel(
                modelName = "gemini-1.5-flash",
                apiKey = key
            )

            val fullPrompt = buildPrompt(prompt, contextText, type)
            val response: GenerateContentResponse = model.generateContent(fullPrompt)
            val text = response.text

            if (text != null) {
                Result.success(text)
            } else {
                Result.failure(Exception("Empty response from Gemini"))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    override suspend fun validateKey(apiKey: String): Boolean = withContext(Dispatchers.IO) {
        try {
            val model = GenerativeModel(
                modelName = "gemini-1.5-flash",
                apiKey = apiKey
            )
            // Simple test generation
            model.generateContent("Hello")
            true
        } catch (e: Exception) {
            false
        }
    }

    private fun buildPrompt(prompt: String, context: String, type: ReaderAIInsightType): String {
        return """
            You are an expert literary assistant.
            Task: ${type.name.replace("_", " ")}
            
            Context:
            $context
            
            User Prompt:
            $prompt
            
            Please provide a concise and insightful response.
        """.trimIndent()
    }
}
