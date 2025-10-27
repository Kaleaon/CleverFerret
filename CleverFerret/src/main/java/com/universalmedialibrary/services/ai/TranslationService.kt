package com.universalmedialibrary.services.ai

import com.universalmedialibrary.data.repository.APIKeyRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONArray
import org.json.JSONObject
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for translating ebook content using AI
 */
@Singleton
class TranslationService @Inject constructor(
    private val httpClient: OkHttpClient,
    private val apiKeyRepository: APIKeyRepository
) {
    
    /**
     * Translate text using OpenAI
     */
    suspend fun translateWithOpenAI(
        text: String,
        targetLanguage: String,
        sourceLanguage: String = "auto"
    ): Result<String> = withContext(Dispatchers.IO) {
        try {
            val apiKey = apiKeyRepository.getAPIKeyValue("openai")
                ?: return@withContext Result.failure(
                    Exception("OpenAI API key not configured")
                )
            
            val prompt = buildTranslationPrompt(text, sourceLanguage, targetLanguage)
            
            val json = JSONObject().apply {
                put("model", "gpt-4-turbo-preview")
                put("messages", JSONArray().apply {
                    put(JSONObject().apply {
                        put("role", "system")
                        put("content", "You are a professional translator. Translate the given text accurately while preserving formatting, tone, and context.")
                    })
                    put(JSONObject().apply {
                        put("role", "user")
                        put("content", prompt)
                    })
                })
                put("temperature", 0.3)
            }
            
            val request = Request.Builder()
                .url("https://api.openai.com/v1/chat/completions")
                .header("Authorization", "Bearer $apiKey")
                .header("Content-Type", "application/json")
                .post(json.toString().toRequestBody("application/json".toMediaType()))
                .build()
            
            val response = httpClient.newCall(request).execute()
            
            if (!response.isSuccessful) {
                return@withContext Result.failure(
                    Exception("HTTP error: ${response.code}")
                )
            }
            
            val responseJson = JSONObject(response.body?.string() ?: "")
            val translatedText = responseJson
                .getJSONArray("choices")
                .getJSONObject(0)
                .getJSONObject("message")
                .getString("content")
            
            Result.success(translatedText)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Translate text using xAI Grok
     */
    suspend fun translateWithGrok(
        text: String,
        targetLanguage: String,
        sourceLanguage: String = "auto"
    ): Result<String> = withContext(Dispatchers.IO) {
        try {
            val apiKey = apiKeyRepository.getAPIKeyValue("xai_grok")
                ?: return@withContext Result.failure(
                    Exception("xAI Grok API key not configured")
                )
            
            val prompt = buildTranslationPrompt(text, sourceLanguage, targetLanguage)
            
            val json = JSONObject().apply {
                put("messages", JSONArray().apply {
                    put(JSONObject().apply {
                        put("role", "system")
                        put("content", "You are a professional translator with expertise in preserving literary style and context.")
                    })
                    put(JSONObject().apply {
                        put("role", "user")
                        put("content", prompt)
                    })
                })
                put("model", "grok-beta")
                put("stream", false)
                put("temperature", 0.3)
            }
            
            val request = Request.Builder()
                .url("https://api.x.ai/v1/chat/completions")
                .header("Authorization", "Bearer $apiKey")
                .header("Content-Type", "application/json")
                .post(json.toString().toRequestBody("application/json".toMediaType()))
                .build()
            
            val response = httpClient.newCall(request).execute()
            
            if (!response.isSuccessful) {
                return@withContext Result.failure(
                    Exception("HTTP error: ${response.code}")
                )
            }
            
            val responseJson = JSONObject(response.body?.string() ?: "")
            val translatedText = responseJson
                .getJSONArray("choices")
                .getJSONObject(0)
                .getJSONObject("message")
                .getString("content")
            
            Result.success(translatedText)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Translate in chunks (for large texts)
     */
    suspend fun translateLargeText(
        text: String,
        targetLanguage: String,
        chunkSize: Int = 2000,
        progressCallback: (Int, Int) -> Unit = { _, _ -> }
    ): Result<String> = withContext(Dispatchers.IO) {
        try {
            val chunks = splitIntoChunks(text, chunkSize)
            val translatedChunks = mutableListOf<String>()
            
            chunks.forEachIndexed { index, chunk ->
                progressCallback(index + 1, chunks.size)
                
                val result = translateWithGrok(chunk, targetLanguage)
                
                result.onSuccess { translatedChunk ->
                    translatedChunks.add(translatedChunk)
                }.onFailure { error ->
                    return@withContext Result.failure(error)
                }
            }
            
            Result.success(translatedChunks.joinToString("\n\n"))
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    private fun buildTranslationPrompt(
        text: String,
        sourceLanguage: String,
        targetLanguage: String
    ): String {
        val sourceLangText = if (sourceLanguage == "auto") "the source language" else sourceLanguage
        return """
            Translate the following text from $sourceLangText to $targetLanguage.
            Preserve all formatting, including line breaks and HTML tags if present.
            Maintain the tone, style, and literary quality of the original.
            
            Text to translate:
            
            $text
        """.trimIndent()
    }
    
    private fun splitIntoChunks(text: String, chunkSize: Int): List<String> {
        val chunks = mutableListOf<String>()
        var currentChunk = StringBuilder()
        
        text.split("\n").forEach { line ->
            if (currentChunk.length + line.length > chunkSize && currentChunk.isNotEmpty()) {
                chunks.add(currentChunk.toString())
                currentChunk = StringBuilder()
            }
            currentChunk.append(line).append("\n")
        }
        
        if (currentChunk.isNotEmpty()) {
            chunks.add(currentChunk.toString())
        }
        
        return chunks
    }
    
    /**
     * Get list of supported languages
     */
    fun getSupportedLanguages(): List<Language> {
        return listOf(
            Language("en", "English"),
            Language("es", "Spanish"),
            Language("fr", "French"),
            Language("de", "German"),
            Language("it", "Italian"),
            Language("pt", "Portuguese"),
            Language("ru", "Russian"),
            Language("ja", "Japanese"),
            Language("ko", "Korean"),
            Language("zh", "Chinese (Simplified)"),
            Language("ar", "Arabic"),
            Language("hi", "Hindi"),
            Language("nl", "Dutch"),
            Language("pl", "Polish"),
            Language("tr", "Turkish"),
            Language("vi", "Vietnamese"),
            Language("th", "Thai"),
            Language("id", "Indonesian")
        )
    }
}

data class Language(
    val code: String,
    val name: String
)
