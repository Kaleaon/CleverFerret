package com.universalmedialibrary.services.aientertainment

import com.universalmedialibrary.data.aientertainment.AIEntertainmentRepository
import com.universalmedialibrary.data.aientertainment.SynthMemory
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Manager for SynthMemory operations
 * 
 * Provides high-level operations for memory management including:
 * - Memory creation and updates
 * - Memory retrieval and querying
 * - Memory organization and categorization
 * - Memory deletion and archival
 */
@Singleton
class SynthMemoryManager @Inject constructor(
    private val repository: AIEntertainmentRepository
) {
    
    private val json = Json { 
        ignoreUnknownKeys = true
        encodeDefaults = true
    }
    
    /**
     * Get all memories for a character
     */
    suspend fun getMemoriesForCharacter(characterId: Long, limit: Int = 1000): List<SynthMemory> {
        return repository.getMemoriesOnce(characterId, limit)
    }
    
    /**
     * Get a single memory by ID
     */
    suspend fun getMemory(id: Long): SynthMemory? {
        return repository.getMemory(id)
    }
    
    /**
     * Create a new memory
     */
    suspend fun createMemory(
        characterId: Long,
        key: String,
        content: String,
        memoryType: String = "fact",
        importance: Float = 0.5f,
        confidence: Float = 1.0f,
        tags: List<String> = emptyList(),
        context: String = "",
        metadata: Map<String, Any> = emptyMap(),
        isPinned: Boolean = false,
        categoryId: Long? = null
    ): SynthMemory {
        val memory = SynthMemory(
            characterId = characterId,
            key = key,
            content = content,
            memoryType = memoryType,
            importance = importance,
            confidence = confidence,
            tags = json.encodeToString(tags),
            context = context,
            metadata = json.encodeToString(metadata),
            isPinned = isPinned,
            categoryId = categoryId
        )
        val memoryId = repository.createMemory(memory)
        return repository.getMemory(memoryId)!!
    }
    
    /**
     * Update an existing memory
     */
    suspend fun updateMemory(memory: SynthMemory) {
        repository.updateMemory(memory)
    }
    
    /**
     * Delete a memory
     */
    suspend fun deleteMemory(memoryId: Long) {
        repository.deleteMemory(memoryId)
    }
    
    /**
     * Search memories by query string
     */
    suspend fun searchMemories(characterId: Long, query: String, limit: Int = 50): List<SynthMemory> {
        return repository.searchMemories(characterId, query, limit)
    }
    
    /**
     * Get pinned memories for a character
     */
    suspend fun getPinnedMemories(characterId: Long): List<SynthMemory> {
        return repository.getPinnedMemories(characterId)
    }
    
    /**
     * Get important memories for a character
     */
    suspend fun getImportantMemories(characterId: Long, minImportance: Float = 0.7f, limit: Int = 20): List<SynthMemory> {
        return repository.getImportantMemories(characterId, minImportance, limit)
    }
    
    /**
     * Get recent memories for a character
     */
    suspend fun getRecentMemories(characterId: Long, limit: Int = 20): List<SynthMemory> {
        return repository.getRecentMemories(characterId, limit)
    }
    
    /**
     * Set memory pinned status
     */
    suspend fun setMemoryPinned(memoryId: Long, pinned: Boolean) {
        repository.setMemoryPinned(memoryId, pinned)
    }
    
    /**
     * Set memory archived status
     */
    suspend fun setMemoryArchived(memoryId: Long, archived: Boolean) {
        repository.setMemoryArchived(memoryId, archived)
    }
    
    /**
     * Update memory importance
     */
    suspend fun updateMemoryImportance(memoryId: Long, importance: Float) {
        repository.updateMemoryImportance(memoryId, importance)
    }
    
    /**
     * Get memory count for a character
     */
    suspend fun getMemoryCount(characterId: Long): Int {
        return repository.getMemoryCount(characterId)
    }
    
    /**
     * Delete all memories for a character
     */
    suspend fun deleteAllMemoriesForCharacter(characterId: Long) {
        repository.deleteAllMemoriesForCharacter(characterId)
    }
}
