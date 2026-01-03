package com.universalmedialibrary.services.ai

import com.universalmedialibrary.data.local.entity.ReaderAIInsightType
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.flowOn
import kotlinx.coroutines.withContext
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.Response
import okio.BufferedSource
import javax.inject.Inject

/**
 * OpenRouter Provider - Access 100+ LLM models through a single API
 * 
 * Inspired by oxproxion's multi-model support, this provider enables:
 * - Access to OpenAI, Anthropic, Google, Meta, Mistral, and many more models
 * - Unified API for all providers
 * - Model-specific features (vision, reasoning, tool use)
 * - Streaming responses
 * - Credit tracking
 * 
 * @see https://openrouter.ai/docs
 */
class OpenRouterProvider @Inject constructor(
    private val okHttpClient: OkHttpClient
) : AIProvider {

    override val providerId: String = "OPENROUTER"
    override val displayName: String = "OpenRouter (Multi-Model)"

    private var activeKey: String? = null
    private val json = Json { 
        ignoreUnknownKeys = true 
        encodeDefaults = true
    }

    companion object {
        private const val BASE_URL = "https://openrouter.ai/api/v1"
        private const val DEFAULT_MODEL = "openai/gpt-4o-mini"
        
        // Popular models for quick access
        val POPULAR_MODELS = listOf(
            OpenRouterModel("openai/gpt-4o", "GPT-4o", true, false),
            OpenRouterModel("openai/gpt-4o-mini", "GPT-4o Mini", true, false),
            OpenRouterModel("anthropic/claude-3.5-sonnet", "Claude 3.5 Sonnet", true, false),
            OpenRouterModel("anthropic/claude-3-haiku", "Claude 3 Haiku", true, false),
            OpenRouterModel("google/gemini-pro-1.5", "Gemini Pro 1.5", true, false),
            OpenRouterModel("google/gemini-flash-1.5", "Gemini Flash 1.5", true, false),
            OpenRouterModel("meta-llama/llama-3.1-70b-instruct", "Llama 3.1 70B", false, false),
            OpenRouterModel("meta-llama/llama-3.1-8b-instruct", "Llama 3.1 8B", false, false),
            OpenRouterModel("mistralai/mistral-large", "Mistral Large", false, false),
            OpenRouterModel("qwen/qwen-2.5-72b-instruct", "Qwen 2.5 72B", false, false),
            OpenRouterModel("openai/o1-preview", "o1 Preview (Reasoning)", false, true),
            OpenRouterModel("openai/o1-mini", "o1 Mini (Reasoning)", false, true),
            OpenRouterModel("deepseek/deepseek-r1", "DeepSeek R1 (Reasoning)", false, true),
        )
    }

    fun setApiKey(key: String) {
        activeKey = key
    }

    override suspend fun generateInsight(
        prompt: String,
        contextText: String,
        type: ReaderAIInsightType
    ): Result<String> = withContext(Dispatchers.IO) {
        sendChatRequest(
            model = DEFAULT_MODEL,
            messages = listOf(
                ChatMessage("system", "You are an expert literary assistant."),
                ChatMessage("user", buildPrompt(prompt, contextText, type))
            ),
            stream = false
        )
    }

    override suspend fun validateKey(apiKey: String): Boolean = withContext(Dispatchers.IO) {
        try {
            val request = Request.Builder()
                .url("$BASE_URL/credits")
                .addHeader("Authorization", "Bearer $apiKey")
                .get()
                .build()

            val response = okHttpClient.newCall(request).execute()
            response.isSuccessful
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Send a chat request with specific model and options
     */
    suspend fun sendChatRequest(
        model: String,
        messages: List<ChatMessage>,
        stream: Boolean = false,
        temperature: Float = 0.7f,
        maxTokens: Int? = null,
        systemMessage: String? = null,
        enableReasoning: Boolean = false,
        reasoningEffort: String = "medium",
        enableWebSearch: Boolean = false
    ): Result<String> = withContext(Dispatchers.IO) {
        val key = activeKey ?: return@withContext Result.failure(IllegalStateException("API Key not set"))

        try {
            val allMessages = if (systemMessage != null) {
                listOf(ChatMessage("system", systemMessage)) + messages
            } else {
                messages
            }

            val requestBody = OpenRouterChatRequest(
                model = model,
                messages = allMessages.map { OpenRouterMessage(it.role, it.content) },
                stream = stream,
                temperature = temperature,
                maxTokens = maxTokens,
                reasoning = if (enableReasoning) ReasoningConfig(
                    effort = reasoningEffort,
                    enabled = true
                ) else null,
                plugins = if (enableWebSearch) listOf(
                    Plugin(id = "web", engine = "google")
                ) else null
            )

            val mediaType = "application/json; charset=utf-8".toMediaType()
            val body = json.encodeToString(requestBody).toRequestBody(mediaType)

            val request = Request.Builder()
                .url("$BASE_URL/chat/completions")
                .addHeader("Authorization", "Bearer $key")
                .addHeader("HTTP-Referer", "https://cleverferret.app")
                .addHeader("X-Title", "Clever Ferret")
                .post(body)
                .build()

            val response = okHttpClient.newCall(request).execute()
            if (!response.isSuccessful) {
                val errorBody = response.body?.string() ?: "Unknown error"
                return@withContext Result.failure(Exception("OpenRouter Error: ${response.code} - $errorBody"))
            }

            val responseBody = response.body?.string() ?: return@withContext Result.failure(Exception("Empty response"))
            val parsed = json.decodeFromString<OpenRouterChatResponse>(responseBody)
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

    /**
     * Send a streaming chat request - yields chunks as they arrive
     */
    fun streamChatRequest(
        model: String,
        messages: List<ChatMessage>,
        temperature: Float = 0.7f,
        maxTokens: Int? = null,
        systemMessage: String? = null,
        enableReasoning: Boolean = false,
        reasoningEffort: String = "medium"
    ): Flow<StreamChunk> = flow {
        val key = activeKey ?: throw IllegalStateException("API Key not set")

        val allMessages = if (systemMessage != null) {
            listOf(ChatMessage("system", systemMessage)) + messages
        } else {
            messages
        }

        val requestBody = OpenRouterChatRequest(
            model = model,
            messages = allMessages.map { OpenRouterMessage(it.role, it.content) },
            stream = true,
            temperature = temperature,
            maxTokens = maxTokens,
            reasoning = if (enableReasoning) ReasoningConfig(
                effort = reasoningEffort,
                enabled = true
            ) else null
        )

        val mediaType = "application/json; charset=utf-8".toMediaType()
        val body = json.encodeToString(requestBody).toRequestBody(mediaType)

        val request = Request.Builder()
            .url("$BASE_URL/chat/completions")
            .addHeader("Authorization", "Bearer $key")
            .addHeader("HTTP-Referer", "https://cleverferret.app")
            .addHeader("X-Title", "Clever Ferret")
            .post(body)
            .build()

        val response = okHttpClient.newCall(request).execute()
        if (!response.isSuccessful) {
            throw Exception("OpenRouter Error: ${response.code}")
        }

        val source: BufferedSource = response.body?.source() ?: throw Exception("Empty response")

        while (!source.exhausted()) {
            val line = source.readUtf8Line() ?: continue
            if (line.startsWith("data: ")) {
                val data = line.removePrefix("data: ").trim()
                if (data == "[DONE]") {
                    emit(StreamChunk(content = null, isDone = true))
                    break
                }

                try {
                    val chunk = json.decodeFromString<StreamedChatResponse>(data)
                    val content = chunk.choices.firstOrNull()?.delta?.content
                    val reasoning = chunk.choices.firstOrNull()?.delta?.reasoning
                    
                    emit(StreamChunk(
                        content = content,
                        reasoning = reasoning,
                        isDone = false
                    ))
                } catch (e: Exception) {
                    // Skip malformed chunks
                }
            }
        }
    }.flowOn(Dispatchers.IO)

    /**
     * Get available models from OpenRouter
     */
    suspend fun getAvailableModels(): Result<List<OpenRouterModel>> = withContext(Dispatchers.IO) {
        val key = activeKey ?: return@withContext Result.failure(IllegalStateException("API Key not set"))

        try {
            val request = Request.Builder()
                .url("$BASE_URL/models")
                .addHeader("Authorization", "Bearer $key")
                .get()
                .build()

            val response = okHttpClient.newCall(request).execute()
            if (!response.isSuccessful) {
                return@withContext Result.failure(Exception("Failed to fetch models: ${response.code}"))
            }

            val responseBody = response.body?.string() ?: return@withContext Result.failure(Exception("Empty response"))
            val parsed = json.decodeFromString<ModelsResponse>(responseBody)
            
            val models = parsed.data.map { modelData ->
                OpenRouterModel(
                    id = modelData.id,
                    name = modelData.name,
                    isVisionCapable = modelData.architecture.inputModalities.contains("image"),
                    isReasoningCapable = modelData.supportedParameters?.contains("reasoning") == true
                )
            }
            
            Result.success(models)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Get remaining credits
     */
    suspend fun getRemainingCredits(): Result<Double> = withContext(Dispatchers.IO) {
        val key = activeKey ?: return@withContext Result.failure(IllegalStateException("API Key not set"))

        try {
            val request = Request.Builder()
                .url("$BASE_URL/credits")
                .addHeader("Authorization", "Bearer $key")
                .get()
                .build()

            val response = okHttpClient.newCall(request).execute()
            if (!response.isSuccessful) {
                return@withContext Result.failure(Exception("Failed to fetch credits: ${response.code}"))
            }

            val responseBody = response.body?.string() ?: return@withContext Result.failure(Exception("Empty response"))
            val parsed = json.decodeFromString<CreditsResponse>(responseBody)
            
            Result.success(parsed.data.totalCredits - parsed.data.totalUsage)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    private fun buildPrompt(prompt: String, context: String, type: ReaderAIInsightType): String {
        return """
            Task: ${type.name.replace("_", " ")}
            Context: $context
            Prompt: $prompt
        """.trimIndent()
    }
}

// ==================== Data Classes ====================

data class ChatMessage(
    val role: String,
    val content: String
)

data class StreamChunk(
    val content: String?,
    val reasoning: String? = null,
    val isDone: Boolean = false
)

data class OpenRouterModel(
    val id: String,
    val name: String,
    val isVisionCapable: Boolean = false,
    val isReasoningCapable: Boolean = false
)

// ==================== Request/Response Models ====================

@Serializable
private data class OpenRouterChatRequest(
    val model: String,
    val messages: List<OpenRouterMessage>,
    val stream: Boolean = false,
    val temperature: Float? = null,
    @SerialName("max_tokens")
    val maxTokens: Int? = null,
    val reasoning: ReasoningConfig? = null,
    val plugins: List<Plugin>? = null
)

@Serializable
private data class OpenRouterMessage(
    val role: String,
    val content: String
)

@Serializable
private data class ReasoningConfig(
    val effort: String? = null,
    val enabled: Boolean? = null
)

@Serializable
private data class Plugin(
    val id: String,
    val engine: String? = null
)

@Serializable
private data class OpenRouterChatResponse(
    val id: String? = null,
    val model: String,
    val choices: List<ChatChoice>,
    val usage: UsageInfo? = null
)

@Serializable
private data class ChatChoice(
    val index: Int,
    val message: MessageContent,
    @SerialName("finish_reason")
    val finishReason: String? = null
)

@Serializable
private data class MessageContent(
    val role: String,
    val content: String? = null,
    val reasoning: String? = null
)

@Serializable
private data class UsageInfo(
    @SerialName("prompt_tokens")
    val promptTokens: Int,
    @SerialName("completion_tokens")
    val completionTokens: Int,
    @SerialName("total_tokens")
    val totalTokens: Int
)

@Serializable
private data class StreamedChatResponse(
    val id: String,
    val model: String,
    val choices: List<StreamedChoice>
)

@Serializable
private data class StreamedChoice(
    val index: Int,
    val delta: DeltaContent,
    @SerialName("finish_reason")
    val finishReason: String? = null
)

@Serializable
private data class DeltaContent(
    val role: String? = null,
    val content: String? = null,
    val reasoning: String? = null
)

@Serializable
private data class ModelsResponse(
    val data: List<ModelData>
)

@Serializable
private data class ModelData(
    val id: String,
    val name: String,
    val architecture: Architecture,
    @SerialName("supported_parameters")
    val supportedParameters: List<String>? = null
)

@Serializable
private data class Architecture(
    @SerialName("input_modalities")
    val inputModalities: List<String>,
    @SerialName("output_modalities")
    val outputModalities: List<String>? = null
)

@Serializable
private data class CreditsResponse(
    val data: CreditsData
)

@Serializable
private data class CreditsData(
    @SerialName("total_credits")
    val totalCredits: Double,
    @SerialName("total_usage")
    val totalUsage: Double
)
