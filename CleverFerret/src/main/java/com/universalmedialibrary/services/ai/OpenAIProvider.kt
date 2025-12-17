package com.universalmedialibrary.services.ai

import com.universalmedialibrary.data.local.entity.ReaderAIInsightType
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import javax.inject.Inject

class OpenAIProvider @Inject constructor(
    private val okHttpClient: OkHttpClient
) : AIProvider {

    override val providerId: String = "OPENAI"
    override val displayName: String = "OpenAI GPT"

    private var activeKey: String? = null
    private val json = Json { ignoreUnknownKeys = true }

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
            val requestBody = ChatCompletionRequest(
                model = "gpt-4o-mini", // Cost effective
                messages = listOf(
                    Message("system", "You are an expert literary assistant."),
                    Message("user", buildPrompt(prompt, contextText, type))
                )
            )

            val mediaType = "application/json; charset=utf-8".toMediaType()
            val body = json.encodeToString(requestBody).toRequestBody(mediaType)

            val request = Request.Builder()
                .url("https://api.openai.com/v1/chat/completions")
                .addHeader("Authorization", "Bearer $key")
                .post(body)
                .build()

            val response = okHttpClient.newCall(request).execute()
            if (!response.isSuccessful) {
                return@withContext Result.failure(Exception("OpenAI Error: ${response.code} ${response.message}"))
            }

            val responseBody = response.body?.string() ?: return@withContext Result.failure(Exception("Empty response"))
            val parsed = json.decodeFromString<ChatCompletionResponse>(responseBody)
            val content = parsed.choices.firstOrNull()?.message?.content

            if (content != null) {
                Result.success(content)
            } else {
                Result.failure(Exception("No content in response"))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    override suspend fun validateKey(apiKey: String): Boolean = withContext(Dispatchers.IO) {
        try {
            val request = Request.Builder()
                .url("https://api.openai.com/v1/models")
                .addHeader("Authorization", "Bearer $apiKey")
                .get()
                .build()

            val response = okHttpClient.newCall(request).execute()
            response.isSuccessful
        } catch (e: Exception) {
            false
        }
    }

    private fun buildPrompt(prompt: String, context: String, type: ReaderAIInsightType): String {
        return """
            Task: ${type.name}
            Context: $context
            Prompt: $prompt
        """.trimIndent()
    }

    @Serializable
    private data class ChatCompletionRequest(
        val model: String,
        val messages: List<Message>
    )

    @Serializable
    private data class Message(
        val role: String,
        val content: String
    )

    @Serializable
    private data class ChatCompletionResponse(
        val choices: List<Choice>
    )

    @Serializable
    private data class Choice(
        val message: Message
    )
}
