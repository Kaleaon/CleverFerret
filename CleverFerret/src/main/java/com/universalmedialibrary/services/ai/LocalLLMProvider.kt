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
import okio.BufferedSource
import java.util.concurrent.TimeUnit
import javax.inject.Inject

/**
 * Local LLM Provider - Support for Ollama, LM Studio, llama.cpp, and MLX LM
 * 
 * Inspired by oxproxion's LAN model support, this provider enables:
 * - Running models locally on device or LAN servers
 * - No API costs or internet dependency
 * - Privacy-preserving AI interactions
 * - Support for multiple local server implementations
 * 
 * Supported backends:
 * - Ollama: Popular local LLM server (port 11434)
 * - LM Studio: User-friendly LLM app (port 1234)
 * - llama.cpp: High-performance C++ server (port 8080)
 * - MLX LM: Apple Silicon optimized (port 8080)
 */
class LocalLLMProvider @Inject constructor() : AIProvider {

    override val providerId: String = "LOCAL_LLM"
    override val displayName: String = "Local LLM (Ollama/LM Studio)"

    private val json = Json { 
        ignoreUnknownKeys = true 
        encodeDefaults = true
    }
    
    // Use a longer timeout for local models which may be slower to respond
    private val localClient = OkHttpClient.Builder()
        .connectTimeout(30, TimeUnit.SECONDS)
        .readTimeout(5, TimeUnit.MINUTES)
        .writeTimeout(30, TimeUnit.SECONDS)
        .build()

    private var serverConfig: LocalServerConfig = LocalServerConfig()

    companion object {
        // Default ports for different backends
        const val OLLAMA_DEFAULT_PORT = 11434
        const val LM_STUDIO_DEFAULT_PORT = 1234
        const val LLAMA_CPP_DEFAULT_PORT = 8080
        const val MLX_LM_DEFAULT_PORT = 8080
    }

    /**
     * Configure the local server connection
     */
    fun configure(config: LocalServerConfig) {
        serverConfig = config
    }

    /**
     * Configure with simple parameters
     */
    fun configure(
        host: String = "localhost",
        port: Int = OLLAMA_DEFAULT_PORT,
        backend: LocalLLMBackend = LocalLLMBackend.OLLAMA
    ) {
        serverConfig = LocalServerConfig(
            host = host,
            port = port,
            backend = backend
        )
    }

    override suspend fun generateInsight(
        prompt: String,
        contextText: String,
        type: ReaderAIInsightType
    ): Result<String> = withContext(Dispatchers.IO) {
        val models = getAvailableModels().getOrNull()
        val model = models?.firstOrNull()?.name ?: "llama3"
        
        sendChatRequest(
            model = model,
            messages = listOf(
                ChatMessage("system", "You are an expert literary assistant."),
                ChatMessage("user", buildPrompt(prompt, contextText, type))
            )
        )
    }

    override suspend fun validateKey(apiKey: String): Boolean = withContext(Dispatchers.IO) {
        // Local servers don't need API keys - just check connectivity
        isServerReachable()
    }

    /**
     * Check if the local server is reachable
     */
    suspend fun isServerReachable(): Boolean = withContext(Dispatchers.IO) {
        try {
            val url = when (serverConfig.backend) {
                LocalLLMBackend.OLLAMA -> "${serverConfig.baseUrl}/api/tags"
                LocalLLMBackend.LM_STUDIO -> "${serverConfig.baseUrl}/v1/models"
                LocalLLMBackend.LLAMA_CPP -> "${serverConfig.baseUrl}/health"
                LocalLLMBackend.MLX_LM -> "${serverConfig.baseUrl}/v1/models"
            }
            
            val request = Request.Builder()
                .url(url)
                .get()
                .build()

            val response = localClient.newCall(request).execute()
            response.isSuccessful
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Get available models from the local server
     */
    suspend fun getAvailableModels(): Result<List<LocalModel>> = withContext(Dispatchers.IO) {
        try {
            when (serverConfig.backend) {
                LocalLLMBackend.OLLAMA -> getOllamaModels()
                LocalLLMBackend.LM_STUDIO -> getLMStudioModels()
                LocalLLMBackend.LLAMA_CPP -> getLlamaCppModels()
                LocalLLMBackend.MLX_LM -> getMLXModels()
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    private suspend fun getOllamaModels(): Result<List<LocalModel>> {
        val request = Request.Builder()
            .url("${serverConfig.baseUrl}/api/tags")
            .get()
            .build()

        val response = localClient.newCall(request).execute()
        if (!response.isSuccessful) {
            return Result.failure(Exception("Failed to fetch Ollama models: ${response.code}"))
        }

        val responseBody = response.body?.string() ?: return Result.failure(Exception("Empty response"))
        val parsed = json.decodeFromString<OllamaTagsResponse>(responseBody)
        
        val models = parsed.models.map { model ->
            LocalModel(
                name = model.name,
                displayName = model.name.split(":").first().replaceFirstChar { it.uppercase() },
                size = model.size,
                modifiedAt = model.modifiedAt,
                backend = LocalLLMBackend.OLLAMA
            )
        }
        
        return Result.success(models)
    }

    private suspend fun getLMStudioModels(): Result<List<LocalModel>> {
        val request = Request.Builder()
            .url("${serverConfig.baseUrl}/v1/models")
            .get()
            .build()

        val response = localClient.newCall(request).execute()
        if (!response.isSuccessful) {
            return Result.failure(Exception("Failed to fetch LM Studio models: ${response.code}"))
        }

        val responseBody = response.body?.string() ?: return Result.failure(Exception("Empty response"))
        val parsed = json.decodeFromString<OpenAIModelsResponse>(responseBody)
        
        val models = parsed.data.map { model ->
            LocalModel(
                name = model.id,
                displayName = model.id.split("/").last(),
                backend = LocalLLMBackend.LM_STUDIO
            )
        }
        
        return Result.success(models)
    }

    private suspend fun getLlamaCppModels(): Result<List<LocalModel>> {
        // llama.cpp typically serves a single model, check /props endpoint
        val request = Request.Builder()
            .url("${serverConfig.baseUrl}/props")
            .get()
            .build()

        try {
            val response = localClient.newCall(request).execute()
            if (response.isSuccessful) {
                return Result.success(listOf(
                    LocalModel(
                        name = "current",
                        displayName = "llama.cpp Model",
                        backend = LocalLLMBackend.LLAMA_CPP
                    )
                ))
            }
        } catch (e: Exception) {
            // Fallback
        }
        
        return Result.success(listOf(
            LocalModel(
                name = "current",
                displayName = "llama.cpp Model",
                backend = LocalLLMBackend.LLAMA_CPP
            )
        ))
    }

    private suspend fun getMLXModels(): Result<List<LocalModel>> {
        val request = Request.Builder()
            .url("${serverConfig.baseUrl}/v1/models")
            .get()
            .build()

        val response = localClient.newCall(request).execute()
        if (!response.isSuccessful) {
            return Result.failure(Exception("Failed to fetch MLX models: ${response.code}"))
        }

        val responseBody = response.body?.string() ?: return Result.failure(Exception("Empty response"))
        val parsed = json.decodeFromString<OpenAIModelsResponse>(responseBody)
        
        val models = parsed.data.map { model ->
            LocalModel(
                name = model.id,
                displayName = model.id,
                backend = LocalLLMBackend.MLX_LM
            )
        }
        
        return Result.success(models)
    }

    /**
     * Send a chat request to the local server
     */
    suspend fun sendChatRequest(
        model: String,
        messages: List<ChatMessage>,
        temperature: Float = 0.7f,
        maxTokens: Int? = null,
        systemMessage: String? = null
    ): Result<String> = withContext(Dispatchers.IO) {
        try {
            val allMessages = if (systemMessage != null) {
                listOf(ChatMessage("system", systemMessage)) + messages
            } else {
                messages
            }

            when (serverConfig.backend) {
                LocalLLMBackend.OLLAMA -> sendOllamaRequest(model, allMessages, temperature)
                LocalLLMBackend.LM_STUDIO,
                LocalLLMBackend.MLX_LM -> sendOpenAICompatibleRequest(model, allMessages, temperature, maxTokens)
                LocalLLMBackend.LLAMA_CPP -> sendLlamaCppRequest(model, allMessages, temperature, maxTokens)
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    private suspend fun sendOllamaRequest(
        model: String,
        messages: List<ChatMessage>,
        temperature: Float
    ): Result<String> {
        val requestBody = OllamaChatRequest(
            model = model,
            messages = messages.map { OllamaMessage(it.role, it.content) },
            stream = false,
            options = OllamaOptions(temperature = temperature)
        )

        val mediaType = "application/json; charset=utf-8".toMediaType()
        val body = json.encodeToString(requestBody).toRequestBody(mediaType)

        val request = Request.Builder()
            .url("${serverConfig.baseUrl}/api/chat")
            .post(body)
            .build()

        val response = localClient.newCall(request).execute()
        if (!response.isSuccessful) {
            return Result.failure(Exception("Ollama Error: ${response.code}"))
        }

        val responseBody = response.body?.string() ?: return Result.failure(Exception("Empty response"))
        val parsed = json.decodeFromString<OllamaChatResponse>(responseBody)
        
        return Result.success(parsed.message.content)
    }

    private suspend fun sendOpenAICompatibleRequest(
        model: String,
        messages: List<ChatMessage>,
        temperature: Float,
        maxTokens: Int?
    ): Result<String> {
        val requestBody = OpenAICompatibleRequest(
            model = model,
            messages = messages.map { OpenAICompatibleMessage(it.role, it.content) },
            temperature = temperature,
            maxTokens = maxTokens,
            stream = false
        )

        val mediaType = "application/json; charset=utf-8".toMediaType()
        val body = json.encodeToString(requestBody).toRequestBody(mediaType)

        val request = Request.Builder()
            .url("${serverConfig.baseUrl}/v1/chat/completions")
            .post(body)
            .build()

        val response = localClient.newCall(request).execute()
        if (!response.isSuccessful) {
            return Result.failure(Exception("LM Studio/MLX Error: ${response.code}"))
        }

        val responseBody = response.body?.string() ?: return Result.failure(Exception("Empty response"))
        val parsed = json.decodeFromString<OpenAICompatibleResponse>(responseBody)
        val content = parsed.choices.firstOrNull()?.message?.content
        
        return if (content != null) {
            Result.success(content)
        } else {
            Result.failure(Exception("No content in response"))
        }
    }

    private suspend fun sendLlamaCppRequest(
        model: String,
        messages: List<ChatMessage>,
        temperature: Float,
        maxTokens: Int?
    ): Result<String> {
        // llama.cpp uses completion endpoint with prompt
        val prompt = messages.joinToString("\n") { msg ->
            when (msg.role) {
                "system" -> "System: ${msg.content}"
                "user" -> "User: ${msg.content}"
                "assistant" -> "Assistant: ${msg.content}"
                else -> msg.content
            }
        } + "\nAssistant:"

        val requestBody = LlamaCppRequest(
            prompt = prompt,
            temperature = temperature,
            nPredict = maxTokens ?: 512,
            stream = false
        )

        val mediaType = "application/json; charset=utf-8".toMediaType()
        val body = json.encodeToString(requestBody).toRequestBody(mediaType)

        val request = Request.Builder()
            .url("${serverConfig.baseUrl}/completion")
            .post(body)
            .build()

        val response = localClient.newCall(request).execute()
        if (!response.isSuccessful) {
            return Result.failure(Exception("llama.cpp Error: ${response.code}"))
        }

        val responseBody = response.body?.string() ?: return Result.failure(Exception("Empty response"))
        val parsed = json.decodeFromString<LlamaCppResponse>(responseBody)
        
        return Result.success(parsed.content)
    }

    /**
     * Stream chat responses from the local server
     */
    fun streamChatRequest(
        model: String,
        messages: List<ChatMessage>,
        temperature: Float = 0.7f,
        systemMessage: String? = null
    ): Flow<StreamChunk> = flow {
        val allMessages = if (systemMessage != null) {
            listOf(ChatMessage("system", systemMessage)) + messages
        } else {
            messages
        }

        when (serverConfig.backend) {
            LocalLLMBackend.OLLAMA -> streamOllamaRequest(model, allMessages, temperature).collect { emit(it) }
            LocalLLMBackend.LM_STUDIO,
            LocalLLMBackend.MLX_LM -> streamOpenAICompatibleRequest(model, allMessages, temperature).collect { emit(it) }
            LocalLLMBackend.LLAMA_CPP -> {
                // llama.cpp streaming - simplified fallback
                val result = sendLlamaCppRequest(model, allMessages, temperature, null)
                result.onSuccess { content ->
                    emit(StreamChunk(content = content, isDone = false))
                    emit(StreamChunk(content = null, isDone = true))
                }
            }
        }
    }.flowOn(Dispatchers.IO)

    private fun streamOllamaRequest(
        model: String,
        messages: List<ChatMessage>,
        temperature: Float
    ): Flow<StreamChunk> = flow {
        val requestBody = OllamaChatRequest(
            model = model,
            messages = messages.map { OllamaMessage(it.role, it.content) },
            stream = true,
            options = OllamaOptions(temperature = temperature)
        )

        val mediaType = "application/json; charset=utf-8".toMediaType()
        val body = json.encodeToString(requestBody).toRequestBody(mediaType)

        val request = Request.Builder()
            .url("${serverConfig.baseUrl}/api/chat")
            .post(body)
            .build()

        val response = localClient.newCall(request).execute()
        if (!response.isSuccessful) {
            throw Exception("Ollama Streaming Error: ${response.code}")
        }

        val source: BufferedSource = response.body?.source() ?: throw Exception("Empty response")

        while (!source.exhausted()) {
            val line = source.readUtf8Line() ?: continue
            if (line.isBlank()) continue

            try {
                val chunk = json.decodeFromString<OllamaStreamResponse>(line)
                emit(StreamChunk(
                    content = chunk.message.content,
                    isDone = chunk.done
                ))
                
                if (chunk.done) break
            } catch (e: Exception) {
                // Skip malformed chunks
            }
        }
    }.flowOn(Dispatchers.IO)

    private fun streamOpenAICompatibleRequest(
        model: String,
        messages: List<ChatMessage>,
        temperature: Float
    ): Flow<StreamChunk> = flow {
        val requestBody = OpenAICompatibleRequest(
            model = model,
            messages = messages.map { OpenAICompatibleMessage(it.role, it.content) },
            temperature = temperature,
            stream = true
        )

        val mediaType = "application/json; charset=utf-8".toMediaType()
        val body = json.encodeToString(requestBody).toRequestBody(mediaType)

        val request = Request.Builder()
            .url("${serverConfig.baseUrl}/v1/chat/completions")
            .post(body)
            .build()

        val response = localClient.newCall(request).execute()
        if (!response.isSuccessful) {
            throw Exception("Streaming Error: ${response.code}")
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
                    val chunk = json.decodeFromString<OpenAICompatibleStreamResponse>(data)
                    val content = chunk.choices.firstOrNull()?.delta?.content
                    
                    emit(StreamChunk(
                        content = content,
                        isDone = false
                    ))
                } catch (e: Exception) {
                    // Skip malformed chunks
                }
            }
        }
    }.flowOn(Dispatchers.IO)

    private fun buildPrompt(prompt: String, context: String, type: ReaderAIInsightType): String {
        return """
            Task: ${type.name.replace("_", " ")}
            Context: $context
            Prompt: $prompt
        """.trimIndent()
    }
}

// ==================== Configuration ====================

data class LocalServerConfig(
    val host: String = "localhost",
    val port: Int = LocalLLMProvider.OLLAMA_DEFAULT_PORT,
    val backend: LocalLLMBackend = LocalLLMBackend.OLLAMA,
    val useTLS: Boolean = false
) {
    val baseUrl: String
        get() {
            val scheme = if (useTLS) "https" else "http"
            return "$scheme://$host:$port"
        }
}

enum class LocalLLMBackend(val displayName: String) {
    OLLAMA("Ollama"),
    LM_STUDIO("LM Studio"),
    LLAMA_CPP("llama.cpp"),
    MLX_LM("MLX LM (Apple Silicon)")
}

data class LocalModel(
    val name: String,
    val displayName: String,
    val size: Long = 0,
    val modifiedAt: String = "",
    val backend: LocalLLMBackend = LocalLLMBackend.OLLAMA
)

// ==================== Ollama Request/Response Models ====================

@Serializable
private data class OllamaChatRequest(
    val model: String,
    val messages: List<OllamaMessage>,
    val stream: Boolean = false,
    val options: OllamaOptions? = null
)

@Serializable
private data class OllamaMessage(
    val role: String,
    val content: String
)

@Serializable
private data class OllamaOptions(
    val temperature: Float? = null,
    @SerialName("num_predict")
    val numPredict: Int? = null
)

@Serializable
private data class OllamaChatResponse(
    val model: String,
    val message: OllamaMessage,
    val done: Boolean
)

@Serializable
private data class OllamaStreamResponse(
    val model: String,
    val message: OllamaMessage,
    val done: Boolean
)

@Serializable
private data class OllamaTagsResponse(
    val models: List<OllamaModelInfo>
)

@Serializable
private data class OllamaModelInfo(
    val name: String,
    val size: Long = 0,
    @SerialName("modified_at")
    val modifiedAt: String = ""
)

// ==================== OpenAI-Compatible Request/Response Models ====================

@Serializable
private data class OpenAICompatibleRequest(
    val model: String,
    val messages: List<OpenAICompatibleMessage>,
    val temperature: Float? = null,
    @SerialName("max_tokens")
    val maxTokens: Int? = null,
    val stream: Boolean = false
)

@Serializable
private data class OpenAICompatibleMessage(
    val role: String,
    val content: String
)

@Serializable
private data class OpenAICompatibleResponse(
    val choices: List<OpenAICompatibleChoice>
)

@Serializable
private data class OpenAICompatibleChoice(
    val message: OpenAICompatibleMessage
)

@Serializable
private data class OpenAICompatibleStreamResponse(
    val choices: List<OpenAICompatibleStreamChoice>
)

@Serializable
private data class OpenAICompatibleStreamChoice(
    val delta: OpenAICompatibleDelta
)

@Serializable
private data class OpenAICompatibleDelta(
    val content: String? = null
)

@Serializable
private data class OpenAIModelsResponse(
    val data: List<OpenAIModelInfo>
)

@Serializable
private data class OpenAIModelInfo(
    val id: String
)

// ==================== llama.cpp Request/Response Models ====================

@Serializable
private data class LlamaCppRequest(
    val prompt: String,
    val temperature: Float? = null,
    @SerialName("n_predict")
    val nPredict: Int? = null,
    val stream: Boolean = false
)

@Serializable
private data class LlamaCppResponse(
    val content: String
)
