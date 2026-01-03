package com.universalmedialibrary.data.aientertainment

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

/**
 * Chat Presets System - Inspired by oxproxion's presets feature
 * 
 * Allows users to save and quickly switch between combinations of:
 * - AI Model selection
 * - System message/persona
 * - Chat settings (temperature, streaming, etc.)
 * - Feature toggles (reasoning, web search, etc.)
 * 
 * Use cases:
 * - "Creative Writing" preset with high temperature and Claude
 * - "Code Helper" preset with GPT-4 and structured output
 * - "Book Discussion" preset with character persona and spoiler awareness
 * - "Research Assistant" preset with web search enabled
 */

// ==================== Entity ====================

@Entity(
    tableName = "chat_presets",
    foreignKeys = [
        ForeignKey(
            entity = SynthUser::class,
            parentColumns = ["id"],
            childColumns = ["user_id"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("user_id")]
)
data class ChatPreset(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    @ColumnInfo(name = "user_id")
    val userId: Long,
    
    @ColumnInfo(name = "title")
    val title: String,
    
    @ColumnInfo(name = "description")
    val description: String = "",
    
    @ColumnInfo(name = "icon")
    val icon: String = "🤖", // Emoji icon
    
    @ColumnInfo(name = "color")
    val color: Int = 0xFF6366F1.toInt(), // Default purple
    
    // Model configuration
    @ColumnInfo(name = "provider_id")
    val providerId: String = "OPENAI", // OPENAI, GEMINI, OPENROUTER, LOCAL_LLM
    
    @ColumnInfo(name = "model_id")
    val modelId: String = "gpt-4o-mini",
    
    // System message configuration
    @ColumnInfo(name = "system_message")
    val systemMessage: String = "",
    
    @ColumnInfo(name = "system_message_title")
    val systemMessageTitle: String = "", // For display purposes
    
    // Chat settings
    @ColumnInfo(name = "temperature")
    val temperature: Float = 0.7f,
    
    @ColumnInfo(name = "max_tokens")
    val maxTokens: Int = 1024,
    
    @ColumnInfo(name = "streaming_enabled")
    val streamingEnabled: Boolean = true,
    
    // Feature toggles
    @ColumnInfo(name = "reasoning_enabled")
    val reasoningEnabled: Boolean = false,
    
    @ColumnInfo(name = "reasoning_effort")
    val reasoningEffort: String = "medium", // low, medium, high
    
    @ColumnInfo(name = "web_search_enabled")
    val webSearchEnabled: Boolean = false,
    
    @ColumnInfo(name = "conversation_mode_enabled")
    val conversationModeEnabled: Boolean = false,
    
    // Local LLM specific settings
    @ColumnInfo(name = "local_host")
    val localHost: String = "localhost",
    
    @ColumnInfo(name = "local_port")
    val localPort: Int = 11434,
    
    @ColumnInfo(name = "local_backend")
    val localBackend: String = "OLLAMA", // OLLAMA, LM_STUDIO, LLAMA_CPP, MLX_LM
    
    // Metadata
    @ColumnInfo(name = "is_favorite")
    val isFavorite: Boolean = false,
    
    @ColumnInfo(name = "use_count")
    val useCount: Int = 0,
    
    @ColumnInfo(name = "last_used_at")
    val lastUsedAt: Long? = null,
    
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis(),
    
    @ColumnInfo(name = "updated_at")
    val updatedAt: Long = System.currentTimeMillis()
) {
    /**
     * Get a display name for the model
     */
    val modelDisplayName: String
        get() = modelId.split("/").last().replaceFirstChar { it.uppercase() }
    
    /**
     * Check if this preset uses a local model
     */
    val isLocalModel: Boolean
        get() = providerId == "LOCAL_LLM"
    
    /**
     * Get the full configuration as a summary string
     */
    val configurationSummary: String
        get() = buildString {
            append(modelDisplayName)
            if (streamingEnabled) append(" • Streaming")
            if (reasoningEnabled) append(" • Reasoning ($reasoningEffort)")
            if (webSearchEnabled) append(" • Web Search")
            if (conversationModeEnabled) append(" • Voice Mode")
        }
}

// ==================== DAO ====================

@Dao
interface ChatPresetDao {
    @Query("SELECT * FROM chat_presets WHERE user_id = :userId ORDER BY is_favorite DESC, use_count DESC")
    fun getPresetsForUser(userId: Long): Flow<List<ChatPreset>>
    
    @Query("SELECT * FROM chat_presets WHERE user_id = :userId AND is_favorite = 1 ORDER BY use_count DESC")
    fun getFavoritePresets(userId: Long): Flow<List<ChatPreset>>
    
    @Query("SELECT * FROM chat_presets WHERE id = :presetId")
    suspend fun getPresetById(presetId: Long): ChatPreset?
    
    @Query("SELECT * FROM chat_presets WHERE user_id = :userId ORDER BY use_count DESC LIMIT 5")
    suspend fun getRecentPresets(userId: Long): List<ChatPreset>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertPreset(preset: ChatPreset): Long
    
    @Update
    suspend fun updatePreset(preset: ChatPreset)
    
    @Delete
    suspend fun deletePreset(preset: ChatPreset)
    
    @Query("DELETE FROM chat_presets WHERE id = :presetId")
    suspend fun deletePresetById(presetId: Long)
    
    @Query("UPDATE chat_presets SET use_count = use_count + 1, last_used_at = :timestamp WHERE id = :presetId")
    suspend fun incrementUseCount(presetId: Long, timestamp: Long = System.currentTimeMillis())
    
    @Query("UPDATE chat_presets SET is_favorite = :isFavorite WHERE id = :presetId")
    suspend fun setFavorite(presetId: Long, isFavorite: Boolean)
}

// ==================== Preset Templates ====================

/**
 * Pre-built preset templates that users can customize
 */
object PresetTemplates {
    
    val CREATIVE_WRITING = ChatPreset(
        id = 0,
        userId = 0,
        title = "Creative Writing",
        description = "For creative stories and imaginative content",
        icon = "✍️",
        color = 0xFFEC4899.toInt(), // Pink
        providerId = "OPENROUTER",
        modelId = "anthropic/claude-3.5-sonnet",
        systemMessage = "You are a creative writing assistant. Help users craft compelling narratives, develop characters, and explore imaginative scenarios. Be expressive, use vivid language, and encourage creativity.",
        systemMessageTitle = "Creative Assistant",
        temperature = 0.9f,
        streamingEnabled = true
    )
    
    val CODE_HELPER = ChatPreset(
        id = 0,
        userId = 0,
        title = "Code Helper",
        description = "Programming assistance and code review",
        icon = "💻",
        color = 0xFF10B981.toInt(), // Green
        providerId = "OPENROUTER",
        modelId = "openai/gpt-4o",
        systemMessage = "You are an expert programmer. Provide clear, well-documented code solutions. Explain your reasoning and consider best practices, performance, and maintainability.",
        systemMessageTitle = "Code Expert",
        temperature = 0.3f,
        maxTokens = 2048,
        streamingEnabled = true
    )
    
    val BOOK_DISCUSSION = ChatPreset(
        id = 0,
        userId = 0,
        title = "Book Discussion",
        description = "Literary analysis and book discussions",
        icon = "📚",
        color = 0xFF8B5CF6.toInt(), // Purple
        providerId = "OPENROUTER",
        modelId = "anthropic/claude-3-haiku",
        systemMessage = "You are a thoughtful literary companion. Discuss books with genuine interest, ask engaging questions, and help users explore themes and characters. Be careful about spoilers based on reading progress.",
        systemMessageTitle = "Book Companion",
        temperature = 0.7f,
        streamingEnabled = true
    )
    
    val RESEARCH_ASSISTANT = ChatPreset(
        id = 0,
        userId = 0,
        title = "Research Assistant",
        description = "Fact-finding with web search",
        icon = "🔍",
        color = 0xFF0EA5E9.toInt(), // Sky blue
        providerId = "OPENROUTER",
        modelId = "openai/gpt-4o-mini",
        systemMessage = "You are a research assistant. Provide accurate, well-sourced information. When using web search, cite your sources and clearly distinguish between facts and opinions.",
        systemMessageTitle = "Research Helper",
        temperature = 0.3f,
        webSearchEnabled = true,
        streamingEnabled = true
    )
    
    val REASONING_MODE = ChatPreset(
        id = 0,
        userId = 0,
        title = "Deep Thinking",
        description = "Complex reasoning and problem solving",
        icon = "🧠",
        color = 0xFFF59E0B.toInt(), // Amber
        providerId = "OPENROUTER",
        modelId = "openai/o1-mini",
        systemMessage = "",
        temperature = 0.5f,
        reasoningEnabled = true,
        reasoningEffort = "high",
        streamingEnabled = false // o1 doesn't support streaming
    )
    
    val LOCAL_PRIVATE = ChatPreset(
        id = 0,
        userId = 0,
        title = "Private Local",
        description = "Offline, private AI on your device/network",
        icon = "🏠",
        color = 0xFF6B7280.toInt(), // Gray
        providerId = "LOCAL_LLM",
        modelId = "llama3",
        systemMessage = "You are a helpful assistant running locally. Provide thoughtful, accurate responses while respecting user privacy.",
        systemMessageTitle = "Local Assistant",
        temperature = 0.7f,
        streamingEnabled = true,
        localBackend = "OLLAMA"
    )
    
    val VOICE_CONVERSATION = ChatPreset(
        id = 0,
        userId = 0,
        title = "Voice Chat",
        description = "Speak to AI and hear responses",
        icon = "🎙️",
        color = 0xFFEF4444.toInt(), // Red
        providerId = "OPENROUTER",
        modelId = "openai/gpt-4o-mini",
        systemMessage = "You are a conversational assistant. Keep responses concise and natural for spoken dialogue. Use simple language and avoid long lists or complex formatting.",
        systemMessageTitle = "Voice Assistant",
        temperature = 0.7f,
        maxTokens = 256,
        streamingEnabled = true,
        conversationModeEnabled = true
    )
    
    val allTemplates = listOf(
        CREATIVE_WRITING,
        CODE_HELPER,
        BOOK_DISCUSSION,
        RESEARCH_ASSISTANT,
        REASONING_MODE,
        LOCAL_PRIVATE,
        VOICE_CONVERSATION
    )
}

// ==================== Serializable Export Format ====================

@Serializable
data class ChatPresetExport(
    val title: String,
    val description: String,
    val icon: String,
    val providerId: String,
    val modelId: String,
    val systemMessage: String,
    val systemMessageTitle: String,
    val temperature: Float,
    val maxTokens: Int,
    val streamingEnabled: Boolean,
    val reasoningEnabled: Boolean,
    val reasoningEffort: String,
    val webSearchEnabled: Boolean,
    val conversationModeEnabled: Boolean
) {
    companion object {
        private val json = Json { prettyPrint = true }
        
        fun fromPreset(preset: ChatPreset) = ChatPresetExport(
            title = preset.title,
            description = preset.description,
            icon = preset.icon,
            providerId = preset.providerId,
            modelId = preset.modelId,
            systemMessage = preset.systemMessage,
            systemMessageTitle = preset.systemMessageTitle,
            temperature = preset.temperature,
            maxTokens = preset.maxTokens,
            streamingEnabled = preset.streamingEnabled,
            reasoningEnabled = preset.reasoningEnabled,
            reasoningEffort = preset.reasoningEffort,
            webSearchEnabled = preset.webSearchEnabled,
            conversationModeEnabled = preset.conversationModeEnabled
        )
        
        fun toJson(preset: ChatPreset): String = json.encodeToString(fromPreset(preset))
        
        fun fromJson(jsonString: String): ChatPresetExport = json.decodeFromString(jsonString)
    }
    
    fun toPreset(userId: Long): ChatPreset = ChatPreset(
        userId = userId,
        title = title,
        description = description,
        icon = icon,
        providerId = providerId,
        modelId = modelId,
        systemMessage = systemMessage,
        systemMessageTitle = systemMessageTitle,
        temperature = temperature,
        maxTokens = maxTokens,
        streamingEnabled = streamingEnabled,
        reasoningEnabled = reasoningEnabled,
        reasoningEffort = reasoningEffort,
        webSearchEnabled = webSearchEnabled,
        conversationModeEnabled = conversationModeEnabled
    )
}
