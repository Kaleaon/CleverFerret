package com.universalmedialibrary.services.aientertainment

import android.content.Context
import com.universalmedialibrary.data.aientertainment.*
import com.universalmedialibrary.utils.ErrorLogger
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonElement
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.JsonPrimitive
import kotlinx.serialization.json.buildJsonObject
import kotlinx.serialization.json.put
import javax.inject.Inject
import javax.inject.Singleton

/**
 * MCP (Model Context Protocol) Memory Service
 * 
 * Provides memory expansion capabilities for AI characters in SynthChat using
 * the Model Context Protocol standard. This service enables:
 * 
 * - Persistent memory storage and retrieval
 * - Memory categorization and organization
 * - Contextual memory injection into conversations
 * - Memory importance ranking and decay
 * - Cross-session memory persistence
 * 
 * The service exposes MCP-compatible resources and tools for memory operations.
 */
@Singleton
class MCPMemoryService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val memoryStorageService: AIMemoryStorageService
) {
    private val json = Json { 
        ignoreUnknownKeys = true 
        encodeDefaults = true
    }
    
    private val scope = CoroutineScope(Dispatchers.IO)
    
    // Repository will be injected via setter to avoid circular dependency
    private var memoryDao: SynthMemoryDao? = null
    private var categoryDao: SynthMemoryCategoryDao? = null
    private var storeDao: SynthMemoryStoreDao? = null
    private var blockDao: SynthMemoryBlockDao? = null
    private var accessLogDao: SynthMemoryAccessLogDao? = null
    
    private val _isInitialized = MutableStateFlow(false)
    val isInitialized: StateFlow<Boolean> = _isInitialized.asStateFlow()
    
    private val _activeCharacterId = MutableStateFlow<Long?>(null)
    val activeCharacterId: StateFlow<Long?> = _activeCharacterId.asStateFlow()
    
    private val _memoryStats = MutableStateFlow<MemoryStats?>(null)
    val memoryStats: StateFlow<MemoryStats?> = _memoryStats.asStateFlow()
    
    private val _availableTools = MutableStateFlow<List<MCPMemoryTool>>(emptyList())
    val availableTools: StateFlow<List<MCPMemoryTool>> = _availableTools.asStateFlow()
    
    // ==================== Initialization ====================
    
    /**
     * Initialize the service with DAO references
     */
    fun initialize(
        memoryDao: SynthMemoryDao,
        categoryDao: SynthMemoryCategoryDao,
        storeDao: SynthMemoryStoreDao,
        blockDao: SynthMemoryBlockDao,
        accessLogDao: SynthMemoryAccessLogDao
    ) {
        this.memoryDao = memoryDao
        this.categoryDao = categoryDao
        this.storeDao = storeDao
        this.blockDao = blockDao
        this.accessLogDao = accessLogDao
        
        _availableTools.value = getMCPTools()
        _isInitialized.value = true
    }
    
    /**
     * Set the active character for memory operations
     */
    suspend fun setActiveCharacter(characterId: Long) {
        _activeCharacterId.value = characterId
        
        // Initialize default categories if needed
        initializeDefaultCategories(characterId)
        
        // Update memory stats
        refreshMemoryStats(characterId)
    }
    
    /**
     * Initialize default system categories for a character
     */
    private suspend fun initializeDefaultCategories(characterId: Long) {
        val dao = categoryDao ?: return
        
        val existingCount = dao.getCategoryCount(characterId)
        if (existingCount == 0) {
            val systemCategories = SynthMemoryCategory.createSystemCategories(characterId)
            dao.insertAll(systemCategories)
        }
    }
    
    /**
     * Refresh memory statistics for a character
     */
    private suspend fun refreshMemoryStats(characterId: Long) {
        val mDao = memoryDao ?: return
        val cDao = categoryDao ?: return
        val bDao = blockDao ?: return
        
        _memoryStats.value = MemoryStats(
            totalMemories = mDao.getMemoryCount(characterId),
            totalCategories = cDao.getCategoryCount(characterId),
            totalBlocks = bDao.getAllBlocks(characterId).size,
            avgImportance = mDao.getAverageImportance(characterId) ?: 0.5f,
            mostAccessedCount = mDao.getMaxAccessCount(characterId) ?: 0,
            oldestMemoryDate = mDao.getOldestMemoryDate(characterId),
            newestMemoryDate = mDao.getNewestMemoryDate(characterId),
            pinnedCount = mDao.getPinnedCount(characterId),
            archivedCount = mDao.getArchivedCount(characterId)
        )
    }
    
    // ==================== MCP Tools Definition ====================
    
    /**
     * Get available MCP tools for memory operations
     */
    fun getMCPTools(): List<MCPMemoryTool> = listOf(
        MCPMemoryTool(
            name = "remember",
            description = "Store a new memory for the AI character. Use this to remember important facts, preferences, events, or any information the user wants you to remember.",
            inputSchema = mapOf(
                "type" to "object",
                "properties" to mapOf(
                    "key" to mapOf("type" to "string", "description" to "Short identifier for the memory"),
                    "content" to mapOf("type" to "string", "description" to "The information to remember"),
                    "memoryType" to mapOf("type" to "string", "enum" to listOf("fact", "preference", "event", "relationship", "skill", "goal")),
                    "importance" to mapOf("type" to "number", "minimum" to 0, "maximum" to 1),
                    "tags" to mapOf("type" to "array", "items" to mapOf("type" to "string"))
                ),
                "required" to listOf("key", "content")
            )
        ),
        MCPMemoryTool(
            name = "recall",
            description = "Search and retrieve memories based on a query or filter criteria.",
            inputSchema = mapOf(
                "type" to "object",
                "properties" to mapOf(
                    "query" to mapOf("type" to "string", "description" to "Search query"),
                    "category" to mapOf("type" to "string", "description" to "Category name to filter by"),
                    "memoryType" to mapOf("type" to "string"),
                    "limit" to mapOf("type" to "integer", "default" to 10)
                )
            )
        ),
        MCPMemoryTool(
            name = "forget",
            description = "Remove or archive a specific memory.",
            inputSchema = mapOf(
                "type" to "object",
                "properties" to mapOf(
                    "memoryId" to mapOf("type" to "integer", "description" to "ID of the memory to forget"),
                    "key" to mapOf("type" to "string", "description" to "Key of the memory to forget"),
                    "archive" to mapOf("type" to "boolean", "default" to true, "description" to "Archive instead of delete")
                )
            )
        ),
        MCPMemoryTool(
            name = "update_memory",
            description = "Update an existing memory's content or importance.",
            inputSchema = mapOf(
                "type" to "object",
                "properties" to mapOf(
                    "memoryId" to mapOf("type" to "integer"),
                    "key" to mapOf("type" to "string"),
                    "content" to mapOf("type" to "string"),
                    "importance" to mapOf("type" to "number"),
                    "tags" to mapOf("type" to "array", "items" to mapOf("type" to "string"))
                )
            )
        ),
        MCPMemoryTool(
            name = "list_memories",
            description = "List memories by category or type.",
            inputSchema = mapOf(
                "type" to "object",
                "properties" to mapOf(
                    "category" to mapOf("type" to "string"),
                    "memoryType" to mapOf("type" to "string"),
                    "sortBy" to mapOf("type" to "string", "enum" to listOf("importance", "created_at", "access_count")),
                    "limit" to mapOf("type" to "integer", "default" to 20)
                )
            )
        ),
        MCPMemoryTool(
            name = "get_memory_context",
            description = "Get relevant memories for the current conversation context.",
            inputSchema = mapOf(
                "type" to "object",
                "properties" to mapOf(
                    "contextText" to mapOf("type" to "string", "description" to "The current conversation context"),
                    "maxTokens" to mapOf("type" to "integer", "default" to 2000)
                ),
                "required" to listOf("contextText")
            )
        )
    )
    
    // ==================== MCP Tool Execution ====================
    
    /**
     * Execute an MCP memory tool
     */
    suspend fun executeTool(
        toolName: String,
        parameters: Map<String, Any?>
    ): MCPToolResult = withContext(Dispatchers.IO) {
        val characterId = _activeCharacterId.value
            ?: return@withContext MCPToolResult(
                success = false,
                error = "No active character set"
            )
        
        try {
            when (toolName) {
                "remember" -> executeRemember(characterId, parameters)
                "recall" -> executeRecall(characterId, parameters)
                "forget" -> executeForget(characterId, parameters)
                "update_memory" -> executeUpdateMemory(characterId, parameters)
                "list_memories" -> executeListMemories(characterId, parameters)
                "get_memory_context" -> executeGetMemoryContext(characterId, parameters)
                else -> MCPToolResult(success = false, error = "Unknown tool: $toolName")
            }
        } catch (e: Exception) {
            ErrorLogger.logError("MCPMemoryService", "Tool execution failed: $toolName", e)
            MCPToolResult(success = false, error = e.message ?: "Unknown error")
        }
    }
    
    private suspend fun executeRemember(
        characterId: Long,
        params: Map<String, Any?>
    ): MCPToolResult {
        val dao = memoryDao ?: return MCPToolResult(success = false, error = "Memory DAO not initialized")
        val catDao = categoryDao ?: return MCPToolResult(success = false, error = "Category DAO not initialized")
        
        val key = params["key"] as? String ?: return MCPToolResult(success = false, error = "Key is required")
        val content = params["content"] as? String ?: return MCPToolResult(success = false, error = "Content is required")
        val memoryType = ((params["memoryType"] ?: params["type"]) as? String) ?: "fact"
        val importance = (params["importance"] as? Number)?.toFloat() ?: 0.5f
        val tags = (params["tags"] as? List<*>)?.filterIsInstance<String>() ?: emptyList()
        val categoryName = params["category"] as? String
        
        // Find or create category
        val categoryId = categoryName?.let { name ->
            catDao.findByName(characterId, name)?.id
        }
        
        // Check for existing memory with same key
        val existing = dao.findByKey(characterId, key)
        
        val memoryId = if (existing != null) {
            // Update existing memory
            dao.update(existing.copy(
                content = content,
                importance = importance,
                tags = json.encodeToString(tags),
                categoryId = categoryId,
                updatedAt = System.currentTimeMillis()
            ))
            existing.id
        } else {
            // Create new memory
            dao.insert(SynthMemory(
                characterId = characterId,
                key = key,
                content = content,
                memoryType = memoryType,
                importance = importance.coerceIn(0f, 1f),
                categoryId = categoryId,
                tags = json.encodeToString(tags)
            ))
        }
        
        refreshMemoryStats(characterId)
        
        return MCPToolResult(
            success = true,
            data = buildJsonObject {
                put("memoryId", memoryId)
                put("key", key)
                put("action", if (existing != null) "updated" else "created")
            }
        )
    }
    
    private suspend fun executeRecall(
        characterId: Long,
        params: Map<String, Any?>
    ): MCPToolResult {
        val dao = memoryDao ?: return MCPToolResult(success = false, error = "Memory DAO not initialized")
        
        val query = params["query"] as? String
        val limit = (params["limit"] as? Number)?.toInt() ?: 10
        
        val memories = if (!query.isNullOrBlank()) {
            dao.searchMemories(characterId, query, limit)
        } else {
            dao.getRecentMemories(characterId, limit)
        }
        
        // Record access
        memories.forEach { memory ->
            dao.recordAccess(memory.id)
            accessLogDao?.insert(SynthMemoryAccessLog(
                memoryId = memory.id,
                accessType = "read",
                context = query ?: "recall"
            ))
        }
        
        return MCPToolResult(
            success = true,
            data = buildJsonObject {
                put("count", memories.size)
                put("memories", json.encodeToJsonElement(memories.map { memory ->
                    mapOf(
                        "id" to memory.id,
                        "key" to memory.key,
                        "content" to memory.content,
                        "type" to memory.memoryType,
                        "importance" to memory.importance,
                        "tags" to memory.getTagsList()
                    )
                }))
            }
        )
    }
    
    private suspend fun executeForget(
        characterId: Long,
        params: Map<String, Any?>
    ): MCPToolResult {
        val dao = memoryDao ?: return MCPToolResult(success = false, error = "Memory DAO not initialized")
        
        val memoryId = (params["memoryId"] as? Number)?.toLong()
        val key = params["key"] as? String
        val archive = params["archive"] as? Boolean ?: true
        
        val memory = when {
            memoryId != null -> dao.getById(memoryId)
            key != null -> dao.findByKey(characterId, key)
            else -> return MCPToolResult(success = false, error = "Either memoryId or key is required")
        }
        
        if (memory == null) {
            return MCPToolResult(success = false, error = "Memory not found")
        }
        
        if (archive) {
            dao.setArchived(memory.id, true)
        } else {
            // Delete from external storage if applicable
            memory.externalFilePath?.let { path ->
                memoryStorageService.deleteMemoryFromStorage(path)
            }
            dao.deleteById(memory.id)
        }
        
        refreshMemoryStats(characterId)
        
        return MCPToolResult(
            success = true,
            data = buildJsonObject {
                put("memoryId", memory.id)
                put("action", if (archive) "archived" else "deleted")
            }
        )
    }
    
    private suspend fun executeUpdateMemory(
        characterId: Long,
        params: Map<String, Any?>
    ): MCPToolResult {
        val dao = memoryDao ?: return MCPToolResult(success = false, error = "Memory DAO not initialized")
        
        val memoryId = (params["memoryId"] as? Number)?.toLong()
        val key = params["key"] as? String
        
        val memory = when {
            memoryId != null -> dao.getById(memoryId)
            key != null -> dao.findByKey(characterId, key)
            else -> return MCPToolResult(success = false, error = "Either memoryId or key is required")
        }
        
        if (memory == null) {
            return MCPToolResult(success = false, error = "Memory not found")
        }
        
        val newContent = params["content"] as? String
        val newImportance = (params["importance"] as? Number)?.toFloat()
        val newTags = (params["tags"] as? List<*>)?.filterIsInstance<String>()
        
        val updatedMemory = memory.copy(
            content = newContent ?: memory.content,
            importance = newImportance?.coerceIn(0f, 1f) ?: memory.importance,
            tags = newTags?.let { json.encodeToString(it) } ?: memory.tags,
            updatedAt = System.currentTimeMillis()
        )
        
        dao.update(updatedMemory)
        
        return MCPToolResult(
            success = true,
            data = buildJsonObject {
                put("memoryId", memory.id)
                put("updated", true)
            }
        )
    }
    
    private suspend fun executeListMemories(
        characterId: Long,
        params: Map<String, Any?>
    ): MCPToolResult {
        val dao = memoryDao ?: return MCPToolResult(success = false, error = "Memory DAO not initialized")
        val catDao = categoryDao ?: return MCPToolResult(success = false, error = "Category DAO not initialized")
        
        val categoryName = params["category"] as? String
        val memoryType = params["memoryType"] as? String
        val sortBy = params["sortBy"] as? String ?: "importance"
        val limit = (params["limit"] as? Number)?.toInt() ?: 20
        
        // Validate sortBy parameter
        val validSortByValues = listOf("importance", "created_at", "access_count")
        if (sortBy !in validSortByValues) {
            return MCPToolResult(
                success = false,
                error = "Invalid sortBy value. Must be one of: ${validSortByValues.joinToString(", ")}"
            )
        }
        
        val categoryId = categoryName?.let { name ->
            catDao.findByName(characterId, name)?.id
        }
        
        val memories = dao.queryMemories(
            characterId = characterId,
            categoryIds = if (categoryId != null) listOf(categoryId) else null,
            memoryType = memoryType,
            sortBy = sortBy,
            limit = limit
        )
        
        return MCPToolResult(
            success = true,
            data = buildJsonObject {
                put("count", memories.size)
                put("memories", json.encodeToString(memories.map { memory ->
                    mapOf(
                        "id" to memory.id,
                        "key" to memory.key,
                        "content" to memory.content,
                        "type" to memory.memoryType,
                        "importance" to memory.importance,
                        "accessCount" to memory.accessCount,
                        "createdAt" to memory.createdAt
                    )
                }))
            }
        )
    }
    
    private suspend fun executeGetMemoryContext(
        characterId: Long,
        params: Map<String, Any?>
    ): MCPToolResult {
        val dao = memoryDao ?: return MCPToolResult(success = false, error = "Memory DAO not initialized")
        
        val contextText = params["contextText"] as? String 
            ?: return MCPToolResult(success = false, error = "contextText is required")
        val maxTokens = (params["maxTokens"] as? Number)?.toInt() ?: 2000
        
        // Get relevant memories based on context
        val relevantMemories = mutableListOf<SynthMemory>()
        
        // 1. Get pinned memories (always included)
        relevantMemories.addAll(dao.getPinnedMemories(characterId))
        
        // 2. Get high-importance memories
        relevantMemories.addAll(dao.getImportantMemories(characterId, 0.7f, 10))
        
        // 3. Search for context-relevant memories
        val contextWords = contextText.lowercase().split(Regex("\\s+"))
            .filter { it.length > 3 }
            .take(5)
        
        for (word in contextWords) {
            val matches = dao.searchMemories(characterId, word, 5)
            relevantMemories.addAll(matches)
        }
        
        // Remove duplicates and limit by estimated token count
        val uniqueMemories = relevantMemories.distinctBy { it.id }
        var tokenCount = 0
        val finalMemories = mutableListOf<SynthMemory>()
        
        for (memory in uniqueMemories.sortedByDescending { it.importance }) {
            val estimatedTokens = (memory.content.length / 4) + 10 // Rough estimate
            if (tokenCount + estimatedTokens <= maxTokens) {
                finalMemories.add(memory)
                tokenCount += estimatedTokens
                
                // Record access
                dao.recordAccess(memory.id)
            }
        }
        
        // Build context string
        val contextBuilder = StringBuilder()
        contextBuilder.appendLine("## Relevant Memories")
        contextBuilder.appendLine()
        
        for (memory in finalMemories) {
            contextBuilder.appendLine("- **${memory.key}** [${memory.memoryType}]: ${memory.content}")
        }
        
        return MCPToolResult(
            success = true,
            data = buildJsonObject {
                put("memoryContext", contextBuilder.toString())
                put("memoryCount", finalMemories.size)
                put("estimatedTokens", tokenCount)
            }
        )
    }
    
    // ==================== High-Level Memory Operations ====================
    
    /**
     * Convenience method to apply memory decay for the active character
     */
    suspend fun applyMemoryDecay() {
        val characterId = _activeCharacterId.value ?: return
        applyMemoryDecay(characterId)
    }
    
    /**
     * Convenience method to get conversation context as a formatted string
     * for the active character
     */
    suspend fun getConversationContext(
        userMessage: String,
        maxTokens: Int = 500
    ): String {
        val characterId = _activeCharacterId.value ?: return ""
        return getConversationContextString(characterId, userMessage, maxTokens)
    }
    
    /**
     * Get conversation context as formatted string
     */
    suspend fun getConversationContextString(
        characterId: Long,
        userMessage: String,
        maxTokens: Int = 500
    ): String = withContext(Dispatchers.IO) {
        val memories = getConversationContext(characterId, listOf(userMessage), 10)
        if (memories.isEmpty()) return@withContext ""
        
        val builder = StringBuilder()
        var tokenCount = 0
        
        for (memory in memories) {
            val line = "- ${memory.key}: ${memory.content}\n"
            val lineTokens = line.length / 4 // Rough token estimate
            if (tokenCount + lineTokens > maxTokens) break
            
            builder.append(line)
            tokenCount += lineTokens
        }
        
        builder.toString()
    }
    
    /**
     * Convenience method to build memory system prompt for active character
     */
    suspend fun buildMemorySystemPrompt(): String {
        val characterId = _activeCharacterId.value ?: return ""
        return buildMemorySystemPrompt(characterId)
    }
    
    /**
     * Store a memory from a conversation
     */
    suspend fun storeConversationMemory(
        characterId: Long,
        key: String,
        content: String,
        memoryType: String = "fact",
        importance: Float = 0.5f,
        sourceMessageId: Long? = null,
        context: String = ""
    ): Long? = withContext(Dispatchers.IO) {
        val dao = memoryDao ?: return@withContext null
        
        try {
            dao.insert(SynthMemory(
                characterId = characterId,
                key = key,
                content = content,
                memoryType = memoryType,
                importance = importance.coerceIn(0f, 1f),
                sourceMessageId = sourceMessageId,
                context = context
            ))
        } catch (e: Exception) {
            ErrorLogger.logError("MCPMemoryService", "Failed to store conversation memory", e)
            null
        }
    }
    
    /**
     * Get context-relevant memories for injection into conversation
     */
    suspend fun getConversationContext(
        characterId: Long,
        recentMessages: List<String>,
        maxMemories: Int = 10
    ): List<SynthMemory> = withContext(Dispatchers.IO) {
        val dao = memoryDao ?: return@withContext emptyList()
        
        val result = mutableListOf<SynthMemory>()
        
        // Always include pinned memories
        result.addAll(dao.getPinnedMemories(characterId))
        
        // Include high-importance memories
        result.addAll(dao.getImportantMemories(characterId, 0.8f, 5))
        
        // Search for contextually relevant memories
        val contextKeywords = recentMessages
            .flatMap { it.lowercase().split(Regex("\\s+")) }
            .filter { it.length > 3 }
            .distinct()
            .take(5)
        
        for (keyword in contextKeywords) {
            val matches = dao.searchMemories(characterId, keyword, 3)
            result.addAll(matches)
        }
        
        result.distinctBy { it.id }
            .sortedByDescending { it.importance }
            .take(maxMemories)
    }
    
    /**
     * Automatically extract and store memories from a message
     */
    suspend fun extractAndStoreMemories(
        characterId: Long,
        userMessage: String,
        aiResponse: String,
        messageId: Long? = null
    ) = withContext(Dispatchers.IO) {
        // This is a simple heuristic-based extraction
        // In a production system, you'd use the LLM to extract memories
        
        val potentialMemories = mutableListOf<Pair<String, String>>()
        
        // Look for "remember" statements
        val rememberPatterns = listOf(
            Regex("(?:remember|don't forget|keep in mind)[:\\s]+(.+)", RegexOption.IGNORE_CASE),
            Regex("my (?:name|favorite|hobby|job|work|birthday|age) is\\s+(.+)", RegexOption.IGNORE_CASE),
            Regex("I (?:like|love|hate|prefer|enjoy|dislike)\\s+(.+)", RegexOption.IGNORE_CASE),
            Regex("I am (?:a|an)\\s+([\\w\\s-]+(?:teacher|developer|engineer|doctor|student|writer|artist|designer))", RegexOption.IGNORE_CASE),
            Regex("I work (?:as|at|for|in)\\s+(.+)", RegexOption.IGNORE_CASE)
        )
        
        for (pattern in rememberPatterns) {
            val match = pattern.find(userMessage)
            if (match != null) {
                val content = match.groupValues.getOrNull(1)?.trim() ?: continue
                if (content.length > 3) {
                    val key = generateMemoryKey(content)
                    potentialMemories.add(key to content)
                }
            }
        }
        
        // Store extracted memories
        for ((key, content) in potentialMemories) {
            storeConversationMemory(
                characterId = characterId,
                key = key,
                content = content,
                memoryType = "fact",
                importance = 0.6f,
                sourceMessageId = messageId,
                context = "Extracted from conversation"
            )
        }
    }
    
    private fun generateMemoryKey(content: String): String {
        val words = content.split(Regex("\\s+"))
            .filter { it.length > 2 }
            .take(4)
            .joinToString("_")
            .lowercase()
            .replace(Regex("[^a-z0-9_]"), "")
        
        return if (words.length >= 50) words.take(50) else words.ifEmpty { "memory_${System.currentTimeMillis()}" }
    }
    
    /**
     * Apply memory decay - reduce importance of old, unaccessed memories
     */
    suspend fun applyMemoryDecay(
        characterId: Long,
        decayRate: Float = 0.01f,
        minImportance: Float = 0.1f
    ) = withContext(Dispatchers.IO) {
        val dao = memoryDao ?: return@withContext
        
        val oneWeekAgo = System.currentTimeMillis() - (7 * 24 * 60 * 60 * 1000)
        val memories = dao.getMemoriesByCharacterIdOnce(characterId)
        
        for (memory in memories) {
            if (memory.isPinned) continue // Don't decay pinned memories
            
            val lastAccess = memory.lastAccessedAt ?: memory.createdAt
            if (lastAccess < oneWeekAgo) {
                val newImportance = (memory.importance - decayRate).coerceAtLeast(minImportance)
                if (newImportance != memory.importance) {
                    dao.updateImportance(memory.id, newImportance)
                }
            }
        }
    }
    
    /**
     * Build a memory context string for injection into system prompt
     */
    suspend fun buildMemorySystemPrompt(
        characterId: Long,
        maxLength: Int = 2000
    ): String = withContext(Dispatchers.IO) {
        val memories = getConversationContext(characterId, emptyList(), 20)
        if (memories.isEmpty()) return@withContext ""
        
        val builder = StringBuilder()
        builder.appendLine("\n## Your Memories")
        builder.appendLine("You have the following memories about the user and previous conversations:\n")
        
        var length = builder.length
        for (memory in memories) {
            val line = "- ${memory.typeIcon} **${memory.key}**: ${memory.content}\n"
            if (length + line.length > maxLength) break
            builder.append(line)
            length += line.length
        }
        
        builder.toString()
    }
}

// ==================== Result Classes ====================

data class MCPToolResult(
    val success: Boolean,
    val data: JsonObject? = null,
    val error: String? = null
) {
    val summary: String?
        get() = when {
            !success -> "Error: $error"
            data != null -> data.toString()
            else -> "Operation completed"
        }
}
