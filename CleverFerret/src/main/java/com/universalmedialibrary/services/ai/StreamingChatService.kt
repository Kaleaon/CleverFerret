package com.universalmedialibrary.services.ai

import android.content.Context
import com.universalmedialibrary.data.aientertainment.ChatPreset
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.catch
import kotlinx.coroutines.flow.onCompletion
import kotlinx.coroutines.launch
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Streaming Chat Service - Real-time streaming AI responses
 * 
 * Inspired by oxproxion's streaming support, this service enables:
 * - Real-time token-by-token response streaming
 * - Cancellation of in-progress requests
 * - Support for multiple providers (OpenRouter, Local LLM)
 * - Unified streaming interface
 * 
 * Benefits:
 * - Better UX with immediate feedback
 * - Ability to cancel long responses
 * - Lower perceived latency
 * - Progress visibility
 */
@Singleton
class StreamingChatService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val openRouterProvider: OpenRouterProvider,
    private val localLLMProvider: LocalLLMProvider
) {
    private val scope = CoroutineScope(Dispatchers.IO + SupervisorJob())
    private var currentStreamJob: Job? = null

    // State management
    private val _streamState = MutableStateFlow<StreamState>(StreamState.Idle)
    val streamState: StateFlow<StreamState> = _streamState.asStateFlow()

    private val _currentContent = MutableStateFlow("")
    val currentContent: StateFlow<String> = _currentContent.asStateFlow()

    private val _currentReasoning = MutableStateFlow("")
    val currentReasoning: StateFlow<String> = _currentReasoning.asStateFlow()

    private val _streamEvents = MutableSharedFlow<StreamEvent>(replay = 0)
    val streamEvents: SharedFlow<StreamEvent> = _streamEvents.asSharedFlow()

    /**
     * Send a streaming chat request using a preset configuration
     */
    fun streamWithPreset(
        preset: ChatPreset,
        messages: List<ChatMessage>,
        onChunk: ((String) -> Unit)? = null,
        onComplete: ((String) -> Unit)? = null,
        onError: ((Exception) -> Unit)? = null
    ) {
        // Cancel any existing stream
        cancelCurrentStream()

        _streamState.value = StreamState.Starting
        _currentContent.value = ""
        _currentReasoning.value = ""

        currentStreamJob = scope.launch {
            try {
                _streamEvents.emit(StreamEvent.Started)

                val flow: Flow<StreamChunk> = when (preset.providerId) {
                    "OPENROUTER" -> {
                        openRouterProvider.streamChatRequest(
                            model = preset.modelId,
                            messages = messages,
                            temperature = preset.temperature,
                            maxTokens = preset.maxTokens,
                            systemMessage = preset.systemMessage.ifBlank { null },
                            enableReasoning = preset.reasoningEnabled,
                            reasoningEffort = preset.reasoningEffort
                        )
                    }
                    "LOCAL_LLM" -> {
                        localLLMProvider.configure(
                            host = preset.localHost,
                            port = preset.localPort,
                            backend = LocalLLMBackend.valueOf(preset.localBackend)
                        )
                        localLLMProvider.streamChatRequest(
                            model = preset.modelId,
                            messages = messages,
                            temperature = preset.temperature,
                            systemMessage = preset.systemMessage.ifBlank { null }
                        )
                    }
                    else -> throw IllegalArgumentException("Provider ${preset.providerId} does not support streaming")
                }

                _streamState.value = StreamState.Streaming

                flow.catch { e ->
                    _streamState.value = StreamState.Error(e.message ?: "Stream error")
                    _streamEvents.emit(StreamEvent.Error(e.message ?: "Stream error"))
                    onError?.invoke(Exception(e))
                }.onCompletion { cause ->
                    if (cause == null) {
                        _streamState.value = StreamState.Completed
                        _streamEvents.emit(StreamEvent.Completed(_currentContent.value))
                        onComplete?.invoke(_currentContent.value)
                    }
                }.collect { chunk ->
                    if (chunk.isDone) {
                        _streamState.value = StreamState.Completed
                        _streamEvents.emit(StreamEvent.Completed(_currentContent.value))
                        onComplete?.invoke(_currentContent.value)
                    } else {
                        chunk.content?.let { content ->
                            _currentContent.value += content
                            _streamEvents.emit(StreamEvent.Chunk(content))
                            onChunk?.invoke(content)
                        }
                        chunk.reasoning?.let { reasoning ->
                            _currentReasoning.value += reasoning
                            _streamEvents.emit(StreamEvent.Reasoning(reasoning))
                        }
                    }
                }
            } catch (e: Exception) {
                _streamState.value = StreamState.Error(e.message ?: "Unknown error")
                _streamEvents.emit(StreamEvent.Error(e.message ?: "Unknown error"))
                onError?.invoke(e)
            }
        }
    }

    /**
     * Send a streaming chat request with explicit configuration
     */
    fun stream(
        providerId: String,
        model: String,
        messages: List<ChatMessage>,
        systemMessage: String? = null,
        temperature: Float = 0.7f,
        maxTokens: Int? = null,
        enableReasoning: Boolean = false,
        reasoningEffort: String = "medium",
        localConfig: LocalServerConfig? = null,
        onChunk: ((String) -> Unit)? = null,
        onComplete: ((String) -> Unit)? = null,
        onError: ((Exception) -> Unit)? = null
    ) {
        cancelCurrentStream()

        _streamState.value = StreamState.Starting
        _currentContent.value = ""
        _currentReasoning.value = ""

        currentStreamJob = scope.launch {
            try {
                _streamEvents.emit(StreamEvent.Started)

                val flow: Flow<StreamChunk> = when (providerId) {
                    "OPENROUTER" -> {
                        openRouterProvider.streamChatRequest(
                            model = model,
                            messages = messages,
                            temperature = temperature,
                            maxTokens = maxTokens,
                            systemMessage = systemMessage,
                            enableReasoning = enableReasoning,
                            reasoningEffort = reasoningEffort
                        )
                    }
                    "LOCAL_LLM" -> {
                        localConfig?.let { config ->
                            localLLMProvider.configure(config)
                        }
                        localLLMProvider.streamChatRequest(
                            model = model,
                            messages = messages,
                            temperature = temperature,
                            systemMessage = systemMessage
                        )
                    }
                    else -> throw IllegalArgumentException("Provider $providerId does not support streaming")
                }

                _streamState.value = StreamState.Streaming

                flow.catch { e ->
                    _streamState.value = StreamState.Error(e.message ?: "Stream error")
                    _streamEvents.emit(StreamEvent.Error(e.message ?: "Stream error"))
                    onError?.invoke(Exception(e))
                }.onCompletion { cause ->
                    if (cause == null) {
                        _streamState.value = StreamState.Completed
                        _streamEvents.emit(StreamEvent.Completed(_currentContent.value))
                        onComplete?.invoke(_currentContent.value)
                    }
                }.collect { chunk ->
                    if (chunk.isDone) {
                        _streamState.value = StreamState.Completed
                        _streamEvents.emit(StreamEvent.Completed(_currentContent.value))
                        onComplete?.invoke(_currentContent.value)
                    } else {
                        chunk.content?.let { content ->
                            _currentContent.value += content
                            _streamEvents.emit(StreamEvent.Chunk(content))
                            onChunk?.invoke(content)
                        }
                        chunk.reasoning?.let { reasoning ->
                            _currentReasoning.value += reasoning
                            _streamEvents.emit(StreamEvent.Reasoning(reasoning))
                        }
                    }
                }
            } catch (e: Exception) {
                _streamState.value = StreamState.Error(e.message ?: "Unknown error")
                _streamEvents.emit(StreamEvent.Error(e.message ?: "Unknown error"))
                onError?.invoke(e)
            }
        }
    }

    /**
     * Cancel the current streaming request
     */
    fun cancelCurrentStream() {
        currentStreamJob?.cancel()
        currentStreamJob = null
        
        if (_streamState.value is StreamState.Streaming || 
            _streamState.value is StreamState.Starting) {
            _streamState.value = StreamState.Cancelled
            scope.launch {
                _streamEvents.emit(StreamEvent.Cancelled)
            }
        }
    }

    /**
     * Reset the service state
     */
    fun reset() {
        cancelCurrentStream()
        _streamState.value = StreamState.Idle
        _currentContent.value = ""
        _currentReasoning.value = ""
    }

    /**
     * Check if currently streaming
     */
    fun isStreaming(): Boolean {
        return _streamState.value is StreamState.Streaming
    }
}

// ==================== State Models ====================

sealed class StreamState {
    data object Idle : StreamState()
    data object Starting : StreamState()
    data object Streaming : StreamState()
    data object Completed : StreamState()
    data object Cancelled : StreamState()
    data class Error(val message: String) : StreamState()
}

sealed class StreamEvent {
    data object Started : StreamEvent()
    data class Chunk(val content: String) : StreamEvent()
    data class Reasoning(val content: String) : StreamEvent()
    data class Completed(val fullContent: String) : StreamEvent()
    data object Cancelled : StreamEvent()
    data class Error(val message: String) : StreamEvent()
}
