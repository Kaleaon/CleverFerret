package com.universalmedialibrary.data.aientertainment

import androidx.room.*
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json

/**
 * AI Memory Entities for SynthChat Memory Expansion
 * 
 * This module provides Model Context Protocol (MCP) integrated memory storage
 * for AI characters, allowing them to:
 * - Store and retrieve persistent memories across conversations
 * - Organize memories by type, category, and importance
 * - Export/import memories to/from internal storage or SD card
 * - Share memories between characters (with permissions)
 */

// ==================== Memory Storage Location ====================

/**
 * Represents a storage location for AI memories (internal or SD card)
 */
@Entity(tableName = "synth_memory_stores")
data class SynthMemoryStore(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "name")
    val name: String,
    @ColumnInfo(name = "description")
    val description: String = "",
    @ColumnInfo(name = "storage_path")
    val storagePath: String, // URI or file path
    @ColumnInfo(name = "storage_type")
    val storageType: String = "internal", // "internal", "external", "sdcard"
    @ColumnInfo(name = "is_primary")
    val isPrimary: Boolean = false,
    @ColumnInfo(name = "total_size_bytes")
    val totalSizeBytes: Long = 0,
    @ColumnInfo(name = "used_size_bytes")
    val usedSizeBytes: Long = 0,
    @ColumnInfo(name = "is_available")
    val isAvailable: Boolean = true,
    @ColumnInfo(name = "last_synced_at")
    val lastSyncedAt: Long = System.currentTimeMillis(),
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis()
) {
    val availableSpace: Long
        get() = totalSizeBytes - usedSizeBytes
    
    val usagePercent: Float
        get() = if (totalSizeBytes > 0) usedSizeBytes.toFloat() / totalSizeBytes else 0f
    
    val storageTypeIcon: String
        get() = when (storageType) {
            "internal" -> "📱"
            "external" -> "💾"
            "sdcard" -> "💿"
            else -> "📁"
        }
}

// ==================== Memory Category ====================

/**
 * Categories for organizing AI memories
 */
@Entity(
    tableName = "synth_memory_categories",
    foreignKeys = [
        ForeignKey(
            entity = SynthCharacter::class,
            parentColumns = ["id"],
            childColumns = ["character_id"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("character_id")]
)
data class SynthMemoryCategory(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "character_id")
    val characterId: Long,
    @ColumnInfo(name = "name")
    val name: String,
    @ColumnInfo(name = "description")
    val description: String = "",
    @ColumnInfo(name = "icon")
    val icon: String = "📝", // Emoji icon
    @ColumnInfo(name = "color")
    val color: Int = 0xFF808080.toInt(),
    @ColumnInfo(name = "is_system")
    val isSystem: Boolean = false, // System-created categories cannot be deleted
    @ColumnInfo(name = "memory_count")
    val memoryCount: Int = 0,
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis()
) {
    companion object {
        // Default system categories
        fun createSystemCategories(characterId: Long): List<SynthMemoryCategory> = listOf(
            SynthMemoryCategory(
                characterId = characterId,
                name = "Facts",
                description = "Factual information about users, places, and things",
                icon = "📋",
                color = 0xFF4169E1.toInt(),
                isSystem = true
            ),
            SynthMemoryCategory(
                characterId = characterId,
                name = "Preferences",
                description = "User preferences and likes/dislikes",
                icon = "⭐",
                color = 0xFFFFD700.toInt(),
                isSystem = true
            ),
            SynthMemoryCategory(
                characterId = characterId,
                name = "Relationships",
                description = "Information about people and their relationships",
                icon = "👥",
                color = 0xFFFF69B4.toInt(),
                isSystem = true
            ),
            SynthMemoryCategory(
                characterId = characterId,
                name = "Events",
                description = "Past events and experiences",
                icon = "📅",
                color = 0xFF32CD32.toInt(),
                isSystem = true
            ),
            SynthMemoryCategory(
                characterId = characterId,
                name = "Skills",
                description = "User skills, abilities, and knowledge areas",
                icon = "🎯",
                color = 0xFF9370DB.toInt(),
                isSystem = true
            ),
            SynthMemoryCategory(
                characterId = characterId,
                name = "Goals",
                description = "User goals, aspirations, and plans",
                icon = "🎯",
                color = 0xFFFF4500.toInt(),
                isSystem = true
            ),
            SynthMemoryCategory(
                characterId = characterId,
                name = "Emotions",
                description = "Emotional memories and significant moments",
                icon = "💭",
                color = 0xFF87CEEB.toInt(),
                isSystem = true
            )
        )
    }
}

// ==================== Memory Entity ====================

/**
 * A single memory unit stored by an AI character
 */
@Entity(
    tableName = "synth_memories",
    foreignKeys = [
        ForeignKey(
            entity = SynthCharacter::class,
            parentColumns = ["id"],
            childColumns = ["character_id"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = SynthMemoryStore::class,
            parentColumns = ["id"],
            childColumns = ["store_id"],
            onDelete = ForeignKey.SET_NULL
        ),
        ForeignKey(
            entity = SynthMemoryCategory::class,
            parentColumns = ["id"],
            childColumns = ["category_id"],
            onDelete = ForeignKey.SET_NULL
        )
    ],
    indices = [
        Index("character_id"),
        Index("store_id"),
        Index("category_id"),
        Index("importance"),
        Index("created_at")
    ]
)
data class SynthMemory(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "character_id")
    val characterId: Long,
    @ColumnInfo(name = "store_id")
    val storeId: Long? = null, // null = stored in DB only
    @ColumnInfo(name = "category_id")
    val categoryId: Long? = null,
    @ColumnInfo(name = "memory_type")
    val memoryType: String = "fact", // fact, episodic, semantic, procedural
    @ColumnInfo(name = "key")
    val key: String, // Short identifier for quick lookup
    @ColumnInfo(name = "content")
    val content: String, // The actual memory content
    @ColumnInfo(name = "context")
    val context: String = "", // Additional context or source
    @ColumnInfo(name = "importance")
    val importance: Float = 0.5f, // 0.0 - 1.0, higher = more important
    @ColumnInfo(name = "confidence")
    val confidence: Float = 1.0f, // How confident the AI is in this memory
    @ColumnInfo(name = "access_count")
    val accessCount: Int = 0, // How many times this memory was retrieved
    @ColumnInfo(name = "last_accessed_at")
    val lastAccessedAt: Long? = null,
    @ColumnInfo(name = "source_message_id")
    val sourceMessageId: Long? = null, // Message that created this memory
    @ColumnInfo(name = "embedding")
    val embedding: String = "", // Vector embedding for semantic search (JSON array)
    @ColumnInfo(name = "tags")
    val tags: String = "[]", // JSON array of tags
    @ColumnInfo(name = "metadata")
    val metadata: String = "{}", // Additional JSON metadata
    @ColumnInfo(name = "is_archived")
    val isArchived: Boolean = false,
    @ColumnInfo(name = "is_pinned")
    val isPinned: Boolean = false,
    @ColumnInfo(name = "expires_at")
    val expiresAt: Long? = null, // Optional expiration time
    @ColumnInfo(name = "external_file_path")
    val externalFilePath: String? = null, // Path if stored externally
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis(),
    @ColumnInfo(name = "updated_at")
    val updatedAt: Long = System.currentTimeMillis()
) {
    val isExpired: Boolean
        get() = expiresAt?.let { System.currentTimeMillis() > it } ?: false
    
    val isExternallyStored: Boolean
        get() = !externalFilePath.isNullOrBlank()
    
    val ageInDays: Int
        get() = ((System.currentTimeMillis() - createdAt) / (24 * 60 * 60 * 1000)).toInt()
    
    fun getTagsList(): List<String> {
        return try {
            Json.decodeFromString<List<String>>(tags)
        } catch (e: kotlinx.serialization.SerializationException) {
            emptyList()
        }
    }
    
    val typeIcon: String
        get() = when (memoryType) {
            "fact" -> "📋"
            "episodic" -> "📅"
            "semantic" -> "💡"
            "procedural" -> "⚙️"
            "preference" -> "⭐"
            "relationship" -> "👥"
            else -> "📝"
        }
    
    val importanceLevel: String
        get() = when {
            importance >= 0.8f -> "Critical"
            importance >= 0.6f -> "High"
            importance >= 0.4f -> "Medium"
            importance >= 0.2f -> "Low"
            else -> "Trivial"
        }
}

// ==================== Memory Block ====================

/**
 * A group of related memories forming a coherent knowledge block
 * Used for context window management and efficient memory retrieval
 */
@Entity(
    tableName = "synth_memory_blocks",
    foreignKeys = [
        ForeignKey(
            entity = SynthCharacter::class,
            parentColumns = ["id"],
            childColumns = ["character_id"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("character_id")]
)
data class SynthMemoryBlock(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "character_id")
    val characterId: Long,
    @ColumnInfo(name = "name")
    val name: String,
    @ColumnInfo(name = "summary")
    val summary: String = "", // AI-generated summary of the block
    @ColumnInfo(name = "memory_ids")
    val memoryIds: String = "[]", // JSON array of memory IDs in this block
    @ColumnInfo(name = "token_count")
    val tokenCount: Int = 0, // Estimated token count for context management
    @ColumnInfo(name = "relevance_score")
    val relevanceScore: Float = 0.5f,
    @ColumnInfo(name = "is_active")
    val isActive: Boolean = true, // Whether to include in context
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis(),
    @ColumnInfo(name = "updated_at")
    val updatedAt: Long = System.currentTimeMillis()
) {
    fun getMemoryIdsList(): List<Long> {
        return try {
            Json.decodeFromString<List<Long>>(memoryIds)
        } catch (e: kotlinx.serialization.SerializationException) {
            emptyList()
        }
    }
}

// ==================== Memory Sync Record ====================

/**
 * Tracks synchronization between local DB and external storage
 */
@Entity(
    tableName = "synth_memory_sync_records",
    foreignKeys = [
        ForeignKey(
            entity = SynthMemory::class,
            parentColumns = ["id"],
            childColumns = ["memory_id"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = SynthMemoryStore::class,
            parentColumns = ["id"],
            childColumns = ["store_id"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("memory_id"), Index("store_id")]
)
data class SynthMemorySyncRecord(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "memory_id")
    val memoryId: Long,
    @ColumnInfo(name = "store_id")
    val storeId: Long,
    @ColumnInfo(name = "sync_status")
    val syncStatus: String = "pending", // pending, synced, failed, deleted
    @ColumnInfo(name = "external_path")
    val externalPath: String = "",
    @ColumnInfo(name = "checksum")
    val checksum: String = "",
    @ColumnInfo(name = "last_synced_at")
    val lastSyncedAt: Long? = null,
    @ColumnInfo(name = "error_message")
    val errorMessage: String? = null,
    @ColumnInfo(name = "retry_count")
    val retryCount: Int = 0,
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis()
)

// ==================== Memory Access Log ====================

/**
 * Tracks memory access patterns for analytics and optimization
 */
@Entity(
    tableName = "synth_memory_access_logs",
    foreignKeys = [
        ForeignKey(
            entity = SynthMemory::class,
            parentColumns = ["id"],
            childColumns = ["memory_id"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("memory_id"), Index("accessed_at")]
)
data class SynthMemoryAccessLog(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "memory_id")
    val memoryId: Long,
    @ColumnInfo(name = "access_type")
    val accessType: String = "read", // read, write, update, delete
    @ColumnInfo(name = "context")
    val context: String = "", // What triggered the access
    @ColumnInfo(name = "relevance_score")
    val relevanceScore: Float? = null,
    @ColumnInfo(name = "accessed_at")
    val accessedAt: Long = System.currentTimeMillis()
)

// ==================== Relation Classes ====================

data class MemoryWithCategory(
    @Embedded val memory: SynthMemory,
    @Relation(
        parentColumn = "category_id",
        entityColumn = "id"
    )
    val category: SynthMemoryCategory?
)

data class CategoryWithMemories(
    @Embedded val category: SynthMemoryCategory,
    @Relation(
        parentColumn = "id",
        entityColumn = "category_id"
    )
    val memories: List<SynthMemory>
)

data class StoreWithSyncRecords(
    @Embedded val store: SynthMemoryStore,
    @Relation(
        parentColumn = "id",
        entityColumn = "store_id"
    )
    val syncRecords: List<SynthMemorySyncRecord>
)

data class MemoryStats(
    val totalMemories: Int = 0,
    val totalCategories: Int = 0,
    val totalBlocks: Int = 0,
    val avgImportance: Float = 0.5f,
    val mostAccessedCount: Int = 0,
    val oldestMemoryDate: Long? = null,
    val newestMemoryDate: Long? = null,
    val totalExternalBytes: Long = 0,
    val pinnedCount: Int = 0,
    val archivedCount: Int = 0
)

// ==================== MCP Resource Types ====================

/**
 * MCP Resource representation for memory items
 */
@Serializable
data class MCPMemoryResource(
    val uri: String,
    val name: String,
    val mimeType: String = "application/json",
    val description: String = "",
    val metadata: Map<String, String> = emptyMap()
)

/**
 * MCP Tool definition for memory operations
 */
@Serializable
data class MCPMemoryTool(
    val name: String,
    val description: String,
    @Serializable(with = AnyMapSerializer::class)
    val inputSchema: Map<String, Any> = emptyMap()
)

/**
 * Custom serializer for Map<String, Any> to handle JSON schema structures
 * 
 * **Numeric Range Handling:**
 * - Integer values are parsed as Long (supports -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807)
 * - Decimal values are parsed as Double (supports ~±5.0×10⁻³²⁴ to ±1.7×10³⁰⁸)
 * - Values exceeding these ranges will lose precision or fall back to String representation
 * - For extremely large integers or precise decimals, consider using String encoding
 */
object AnyMapSerializer : kotlinx.serialization.KSerializer<Map<String, Any>> {
    override val descriptor = kotlinx.serialization.descriptors.buildClassSerialDescriptor("AnyMap")
    
    override fun serialize(encoder: kotlinx.serialization.encoding.Encoder, value: Map<String, Any>) {
        val jsonEncoder = encoder as? kotlinx.serialization.json.JsonEncoder
            ?: throw kotlinx.serialization.SerializationException("This class can only be serialized as JSON")
        
        val jsonObject = kotlinx.serialization.json.buildJsonObject {
            for ((key, v) in value) {
                put(key, serializeAny(v))
            }
        }
        jsonEncoder.encodeJsonElement(jsonObject)
    }
    
    override fun deserialize(decoder: kotlinx.serialization.encoding.Decoder): Map<String, Any> {
        val jsonDecoder = decoder as? kotlinx.serialization.json.JsonDecoder
            ?: throw kotlinx.serialization.SerializationException("This class can only be deserialized from JSON")
        
        val jsonObject = jsonDecoder.decodeJsonElement() as kotlinx.serialization.json.JsonObject
        return deserializeJsonObject(jsonObject)
    }
    
    private fun serializeAny(value: Any): kotlinx.serialization.json.JsonElement {
        return when (value) {
            is String -> kotlinx.serialization.json.JsonPrimitive(value)
            is Number -> kotlinx.serialization.json.JsonPrimitive(value)
            is Boolean -> kotlinx.serialization.json.JsonPrimitive(value)
            is Map<*, *> -> kotlinx.serialization.json.buildJsonObject {
                for ((k, v) in value) {
                    if (k is String && v != null) {
                        put(k, serializeAny(v))
                    }
                }
            }
            is List<*> -> kotlinx.serialization.json.buildJsonArray {
                for (item in value) {
                    if (item != null) {
                        add(serializeAny(item))
                    }
                }
            }
            else -> kotlinx.serialization.json.JsonPrimitive(value.toString())
        }
    }
    
    private fun deserializeJsonObject(jsonObject: kotlinx.serialization.json.JsonObject): Map<String, Any> {
        return jsonObject.mapValues { (_, element) -> deserializeElement(element) }
    }
    
    private fun deserializeElement(element: kotlinx.serialization.json.JsonElement): Any {
        return when (element) {
            is kotlinx.serialization.json.JsonPrimitive -> {
                when {
                    element.isString -> element.content
                    element.content == "true" -> true
                    element.content == "false" -> false
                    else -> {
                        // Try parsing as number: first try long, then double
                        // This ensures integers within Long range are not converted to Double
                        // Falls back to String if parsing fails (e.g., very large numbers, invalid formats)
                        element.content.toLongOrNull()
                            ?: element.content.toDoubleOrNull()
                            ?: element.content
                    }
                }
            }
            is kotlinx.serialization.json.JsonObject -> deserializeJsonObject(element)
            is kotlinx.serialization.json.JsonArray -> element.map { deserializeElement(it) }
            else -> element.toString()
        }
    }
}

/**
 * Memory query parameters for MCP-style queries
 */
@Serializable
data class MemoryQuery(
    val characterId: Long,
    val query: String? = null, // Natural language query
    val categoryIds: List<Long>? = null,
    val memoryTypes: List<String>? = null,
    val minImportance: Float? = null,
    val maxImportance: Float? = null,
    val tags: List<String>? = null,
    val includeArchived: Boolean = false,
    val limit: Int = 50,
    val offset: Int = 0,
    val sortBy: String = "importance", // importance, created_at, access_count
    val sortOrder: String = "desc" // asc, desc
)

/**
 * Memory creation request
 */
@Serializable
data class CreateMemoryRequest(
    val characterId: Long,
    val key: String,
    val content: String,
    val memoryType: String = "fact",
    val categoryId: Long? = null,
    val importance: Float = 0.5f,
    val context: String = "",
    val tags: List<String> = emptyList(),
    val expiresAt: Long? = null
)

/**
 * Memory update request
 */
@Serializable
data class UpdateMemoryRequest(
    val memoryId: Long,
    val content: String? = null,
    val importance: Float? = null,
    val categoryId: Long? = null,
    val tags: List<String>? = null,
    val isArchived: Boolean? = null,
    val isPinned: Boolean? = null
)

/**
 * Memory export options
 */
@Serializable
data class MemoryExportOptions(
    val format: String = "json", // json, markdown, csv
    val includeMetadata: Boolean = true,
    val includeAccessLogs: Boolean = false,
    val categoryIds: List<Long>? = null, // null = all categories
    val minImportance: Float? = null,
    val compress: Boolean = true
)

/**
 * Memory import options
 */
@Serializable
data class MemoryImportOptions(
    val mergeStrategy: String = "skip", // skip, replace, merge
    val categoryMapping: Map<String, Long> = emptyMap(), // Map imported category names to local IDs
    val importTags: Boolean = true,
    val resetAccessCounts: Boolean = true
)
