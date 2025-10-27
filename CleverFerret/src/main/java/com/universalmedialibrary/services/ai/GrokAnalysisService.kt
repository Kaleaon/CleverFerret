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
 * Service for AI-powered book analysis using xAI Grok
 */
@Singleton
class GrokAnalysisService @Inject constructor(
    private val httpClient: OkHttpClient,
    private val apiKeyRepository: APIKeyRepository
) {
    
    /**
     * Ask Grok a question about a book
     */
    suspend fun askAboutBook(
        bookTitle: String,
        bookAuthor: String?,
        question: String
    ): Result<String> = withContext(Dispatchers.IO) {
        try {
            val apiKey = apiKeyRepository.getAPIKeyValue("xai_grok")
                ?: return@withContext Result.failure(
                    Exception("xAI Grok API key not configured")
                )
            
            val authorText = if (bookAuthor != null) " by $bookAuthor" else ""
            val context = "Book: $bookTitle$authorText"
            
            val json = JSONObject().apply {
                put("messages", JSONArray().apply {
                    put(JSONObject().apply {
                        put("role", "system")
                        put("content", "You are a knowledgeable literary assistant. Answer questions about books with detailed, insightful responses.")
                    })
                    put(JSONObject().apply {
                        put("role", "user")
                        put("content", "$context\n\nQuestion: $question")
                    })
                })
                put("model", "grok-beta")
                put("stream", false)
                put("temperature", 0.7)
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
            val answer = responseJson
                .getJSONArray("choices")
                .getJSONObject(0)
                .getJSONObject("message")
                .getString("content")
            
            Result.success(answer)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Generate a summary of a book
     */
    suspend fun summarizeBook(
        bookTitle: String,
        bookAuthor: String?,
        bookDescription: String?
    ): Result<BookSummary> = withContext(Dispatchers.IO) {
        try {
            val apiKey = apiKeyRepository.getAPIKeyValue("xai_grok")
                ?: return@withContext Result.failure(
                    Exception("xAI Grok API key not configured")
                )
            
            val authorText = if (bookAuthor != null) " by $bookAuthor" else ""
            val context = buildString {
                append("Book: $bookTitle$authorText\n")
                if (bookDescription != null) {
                    append("Description: $bookDescription\n")
                }
            }
            
            val prompt = """
                $context
                
                Please provide:
                1. A concise 2-3 sentence summary
                2. The main themes (list 3-5 themes)
                3. Key characters (if known)
                4. Target audience
                5. Similar books
                
                Format your response as structured text.
            """.trimIndent()
            
            val json = JSONObject().apply {
                put("messages", JSONArray().apply {
                    put(JSONObject().apply {
                        put("role", "user")
                        put("content", prompt)
                    })
                })
                put("model", "grok-beta")
                put("stream", false)
                put("temperature", 0.5)
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
            val content = responseJson
                .getJSONArray("choices")
                .getJSONObject(0)
                .getJSONObject("message")
                .getString("content")
            
            // Parse the response into structured data
            val summary = parseSummaryResponse(content)
            
            Result.success(summary)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Get book recommendations based on a book
     */
    suspend fun getRecommendations(
        bookTitle: String,
        bookAuthor: String?,
        maxRecommendations: Int = 5
    ): Result<List<BookRecommendation>> = withContext(Dispatchers.IO) {
        try {
            val apiKey = apiKeyRepository.getAPIKeyValue("xai_grok")
                ?: return@withContext Result.failure(
                    Exception("xAI Grok API key not configured")
                )
            
            val authorText = if (bookAuthor != null) " by $bookAuthor" else ""
            val prompt = """
                Based on the book "$bookTitle"$authorText, please recommend $maxRecommendations similar books.
                
                For each recommendation, provide:
                1. Title
                2. Author
                3. Brief reason for recommendation (1 sentence)
                
                Format each as: "Title by Author - Reason"
            """.trimIndent()
            
            val json = JSONObject().apply {
                put("messages", JSONArray().apply {
                    put(JSONObject().apply {
                        put("role", "user")
                        put("content", prompt)
                    })
                })
                put("model", "grok-beta")
                put("stream", false)
                put("temperature", 0.7)
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
            val content = responseJson
                .getJSONArray("choices")
                .getJSONObject(0)
                .getJSONObject("message")
                .getString("content")
            
            val recommendations = parseRecommendations(content)
            
            Result.success(recommendations)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Analyze book content for themes, sentiment, etc.
     */
    suspend fun analyzeContent(
        bookTitle: String,
        content: String,
        analysisType: AnalysisType
    ): Result<String> = withContext(Dispatchers.IO) {
        try {
            val apiKey = apiKeyRepository.getAPIKeyValue("xai_grok")
                ?: return@withContext Result.failure(
                    Exception("xAI Grok API key not configured")
                )
            
            val prompt = when (analysisType) {
                AnalysisType.THEMES -> "Identify and explain the main themes in this text from \"$bookTitle\""
                AnalysisType.CHARACTERS -> "Analyze the main characters and their development in this text from \"$bookTitle\""
                AnalysisType.WRITING_STYLE -> "Analyze the writing style and literary techniques used in this text from \"$bookTitle\""
                AnalysisType.SENTIMENT -> "Analyze the overall tone and sentiment of this text from \"$bookTitle\""
            }
            
            val json = JSONObject().apply {
                put("messages", JSONArray().apply {
                    put(JSONObject().apply {
                        put("role", "system")
                        put("content", "You are a literary analyst providing detailed, insightful analysis.")
                    })
                    put(JSONObject().apply {
                        put("role", "user")
                        put("content", "$prompt\n\nText:\n$content")
                    })
                })
                put("model", "grok-beta")
                put("stream", false)
                put("temperature", 0.6)
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
            val analysis = responseJson
                .getJSONArray("choices")
                .getJSONObject(0)
                .getJSONObject("message")
                .getString("content")
            
            Result.success(analysis)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    private fun parseSummaryResponse(content: String): BookSummary {
        // Basic parsing - could be enhanced
        return BookSummary(
            summary = content,
            themes = emptyList(),
            characters = emptyList(),
            targetAudience = null,
            similarBooks = emptyList()
        )
    }
    
    private fun parseRecommendations(content: String): List<BookRecommendation> {
        val recommendations = mutableListOf<BookRecommendation>()
        
        // Parse lines like: "Title by Author - Reason"
        content.lines().forEach { line ->
            val match = Regex("(.+?)\\s+by\\s+(.+?)\\s+-\\s+(.+)").find(line)
            match?.let {
                val (title, author, reason) = it.destructured
                recommendations.add(
                    BookRecommendation(
                        title = title.trim(),
                        author = author.trim(),
                        reason = reason.trim()
                    )
                )
            }
        }
        
        return recommendations
    }
}

data class BookSummary(
    val summary: String,
    val themes: List<String>,
    val characters: List<String>,
    val targetAudience: String?,
    val similarBooks: List<String>
)

data class BookRecommendation(
    val title: String,
    val author: String,
    val reason: String
)

enum class AnalysisType {
    THEMES,
    CHARACTERS,
    WRITING_STYLE,
    SENTIMENT
}
