package com.universalmedialibrary.data.aientertainment

import androidx.room.*
import kotlinx.coroutines.flow.Flow

/**
 * Data Access Objects for AI Memory operations
 * Supports MCP-style memory management for SynthChat characters
 */

@Dao
interface SynthMemoryStoreDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(store: SynthMemoryStore): Long
    
    @Update
    suspend fun update(store: SynthMemoryStore)
    
    @Delete
    suspend fun delete(store: SynthMemoryStore)
    
    @Query("SELECT * FROM synth_memory_stores WHERE id = :id")
    suspend fun getById(id: Long): SynthMemoryStore?
    
    @Query("SELECT * FROM synth_memory_stores WHERE is_primary = 1 LIMIT 1")
    suspend fun getPrimaryStore(): SynthMemoryStore?
    
    @Query("SELECT * FROM synth_memory_stores WHERE is_available = 1 ORDER BY is_primary DESC, created_at ASC")
    fun getAvailableStores(): Flow<List<SynthMemoryStore>>
    
    @Query("SELECT * FROM synth_memory_stores ORDER BY is_primary DESC, created_at ASC")
    suspend fun getAllStoresOnce(): List<SynthMemoryStore>
    
    @Query("UPDATE synth_memory_stores SET is_primary = CASE WHEN id = :storeId THEN 1 ELSE 0 END")
    suspend fun setPrimaryStore(storeId: Long)
    
    @Query("UPDATE synth_memory_stores SET used_size_bytes = :usedBytes, last_synced_at = :syncTime WHERE id = :storeId")
    suspend fun updateUsage(storeId: Long, usedBytes: Long, syncTime: Long = System.currentTimeMillis())
    
    @Query("UPDATE synth_memory_stores SET is_available = :available WHERE id = :storeId")
    suspend fun setAvailability(storeId: Long, available: Boolean)
    
    @Query("SELECT SUM(used_size_bytes) FROM synth_memory_stores")
    suspend fun getTotalUsedBytes(): Long?
}

@Dao
interface SynthMemoryCategoryDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(category: SynthMemoryCategory): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(categories: List<SynthMemoryCategory>): List<Long>
    
    @Update
    suspend fun update(category: SynthMemoryCategory)
    
    @Delete
    suspend fun delete(category: SynthMemoryCategory)
    
    @Query("SELECT * FROM synth_memory_categories WHERE id = :id")
    suspend fun getById(id: Long): SynthMemoryCategory?
    
    @Query("SELECT * FROM synth_memory_categories WHERE character_id = :characterId ORDER BY is_system DESC, name ASC")
    fun getCategoriesByCharacterId(characterId: Long): Flow<List<SynthMemoryCategory>>
    
    @Query("SELECT * FROM synth_memory_categories WHERE character_id = :characterId ORDER BY is_system DESC, name ASC")
    suspend fun getCategoriesByCharacterIdOnce(characterId: Long): List<SynthMemoryCategory>
    
    @Query("SELECT COUNT(*) FROM synth_memory_categories WHERE character_id = :characterId")
    suspend fun getCategoryCount(characterId: Long): Int
    
    @Query("UPDATE synth_memory_categories SET memory_count = (SELECT COUNT(*) FROM synth_memories WHERE category_id = :categoryId) WHERE id = :categoryId")
    suspend fun updateMemoryCount(categoryId: Long)
    
    @Query("DELETE FROM synth_memory_categories WHERE character_id = :characterId AND is_system = 0")
    suspend fun deleteCustomCategories(characterId: Long)
    
    @Query("SELECT * FROM synth_memory_categories WHERE character_id = :characterId AND name = :name LIMIT 1")
    suspend fun findByName(characterId: Long, name: String): SynthMemoryCategory?
}

@Dao
interface SynthMemoryDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(memory: SynthMemory): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(memories: List<SynthMemory>): List<Long>
    
    @Update
    suspend fun update(memory: SynthMemory)
    
    @Delete
    suspend fun delete(memory: SynthMemory)
    
    @Query("DELETE FROM synth_memories WHERE id = :memoryId")
    suspend fun deleteById(memoryId: Long)
    
    @Query("SELECT * FROM synth_memories WHERE id = :id")
    suspend fun getById(id: Long): SynthMemory?
    
    @Query("SELECT * FROM synth_memories WHERE character_id = :characterId AND is_archived = 0 ORDER BY importance DESC, created_at DESC LIMIT :limit")
    fun getMemoriesByCharacterId(characterId: Long, limit: Int = 100): Flow<List<SynthMemory>>
    
    @Query("SELECT * FROM synth_memories WHERE character_id = :characterId AND is_archived = 0 ORDER BY importance DESC, created_at DESC LIMIT :limit")
    suspend fun getMemoriesByCharacterIdOnce(characterId: Long, limit: Int = 100): List<SynthMemory>
    
    @Query("SELECT * FROM synth_memories WHERE character_id = :characterId AND category_id = :categoryId AND is_archived = 0 ORDER BY importance DESC, created_at DESC")
    fun getMemoriesByCategory(characterId: Long, categoryId: Long): Flow<List<SynthMemory>>
    
    @Query("SELECT * FROM synth_memories WHERE character_id = :characterId AND category_id = :categoryId AND is_archived = 0 ORDER BY importance DESC, created_at DESC")
    suspend fun getMemoriesByCategoryOnce(characterId: Long, categoryId: Long): List<SynthMemory>
    
    @Query("SELECT * FROM synth_memories WHERE character_id = :characterId AND memory_type = :memoryType AND is_archived = 0 ORDER BY importance DESC")
    suspend fun getMemoriesByType(characterId: Long, memoryType: String): List<SynthMemory>
    
    @Query("SELECT * FROM synth_memories WHERE character_id = :characterId AND is_pinned = 1 ORDER BY importance DESC")
    suspend fun getPinnedMemories(characterId: Long): List<SynthMemory>
    
    @Query("SELECT * FROM synth_memories WHERE character_id = :characterId AND is_archived = 1 ORDER BY updated_at DESC")
    suspend fun getArchivedMemories(characterId: Long): List<SynthMemory>
    
    @Query("SELECT * FROM synth_memories WHERE character_id = :characterId AND importance >= :minImportance ORDER BY importance DESC LIMIT :limit")
    suspend fun getImportantMemories(characterId: Long, minImportance: Float = 0.7f, limit: Int = 20): List<SynthMemory>
    
    @Query("SELECT * FROM synth_memories WHERE character_id = :characterId ORDER BY access_count DESC LIMIT :limit")
    suspend fun getMostAccessedMemories(characterId: Long, limit: Int = 20): List<SynthMemory>
    
    @Query("SELECT * FROM synth_memories WHERE character_id = :characterId ORDER BY created_at DESC LIMIT :limit")
    suspend fun getRecentMemories(characterId: Long, limit: Int = 20): List<SynthMemory>
    
    @Query("""
        SELECT * FROM synth_memories 
        WHERE character_id = :characterId 
        AND is_archived = 0
        AND (
            key LIKE '%' || :query || '%' 
            OR content LIKE '%' || :query || '%' 
            OR tags LIKE '%' || :query || '%'
        )
        ORDER BY importance DESC, created_at DESC
        LIMIT :limit
    """)
    suspend fun searchMemories(characterId: Long, query: String, limit: Int = 50): List<SynthMemory>
    
    @Query("""
        SELECT * FROM synth_memories 
        WHERE character_id = :characterId 
        AND is_archived = 0
        AND (:categoryIds IS NULL OR category_id IN (:categoryIds))
        AND (:memoryTypes IS NULL OR memory_type IN (:memoryTypes))
        AND (:minImportance IS NULL OR importance >= :minImportance)
        ORDER BY 
            CASE WHEN :sortBy = 'importance' AND :sortOrder = 'desc' THEN importance END DESC,
            CASE WHEN :sortBy = 'importance' AND :sortOrder = 'asc' THEN importance END ASC,
            CASE WHEN :sortBy = 'created_at' AND :sortOrder = 'desc' THEN created_at END DESC,
            CASE WHEN :sortBy = 'created_at' AND :sortOrder = 'asc' THEN created_at END ASC,
            CASE WHEN :sortBy = 'access_count' AND :sortOrder = 'desc' THEN access_count END DESC,
            CASE WHEN :sortBy = 'access_count' AND :sortOrder = 'asc' THEN access_count END ASC
        LIMIT :limit OFFSET :offset
    """)
    suspend fun queryMemories(
        characterId: Long,
        categoryIds: List<Long>? = null,
        memoryTypes: List<String>? = null,
        minImportance: Float? = null,
        sortBy: String = "importance",
        sortOrder: String = "desc",
        limit: Int = 50,
        offset: Int = 0
    ): List<SynthMemory>
    
    @Query("UPDATE synth_memories SET access_count = access_count + 1, last_accessed_at = :accessTime WHERE id = :memoryId")
    suspend fun recordAccess(memoryId: Long, accessTime: Long = System.currentTimeMillis())
    
    @Query("UPDATE synth_memories SET importance = :importance, updated_at = :updateTime WHERE id = :memoryId")
    suspend fun updateImportance(memoryId: Long, importance: Float, updateTime: Long = System.currentTimeMillis())
    
    @Query("UPDATE synth_memories SET is_archived = :archived, updated_at = :updateTime WHERE id = :memoryId")
    suspend fun setArchived(memoryId: Long, archived: Boolean, updateTime: Long = System.currentTimeMillis())
    
    @Query("UPDATE synth_memories SET is_pinned = :pinned, updated_at = :updateTime WHERE id = :memoryId")
    suspend fun setPinned(memoryId: Long, pinned: Boolean, updateTime: Long = System.currentTimeMillis())
    
    @Query("UPDATE synth_memories SET category_id = :categoryId, updated_at = :updateTime WHERE id = :memoryId")
    suspend fun updateCategory(memoryId: Long, categoryId: Long?, updateTime: Long = System.currentTimeMillis())
    
    @Query("UPDATE synth_memories SET external_file_path = :path, store_id = :storeId, updated_at = :updateTime WHERE id = :memoryId")
    suspend fun setExternalStorage(memoryId: Long, storeId: Long?, path: String?, updateTime: Long = System.currentTimeMillis())
    
    @Query("SELECT COUNT(*) FROM synth_memories WHERE character_id = :characterId AND is_archived = 0")
    suspend fun getMemoryCount(characterId: Long): Int
    
    @Query("SELECT COUNT(*) FROM synth_memories WHERE character_id = :characterId AND is_pinned = 1")
    suspend fun getPinnedCount(characterId: Long): Int
    
    @Query("SELECT COUNT(*) FROM synth_memories WHERE character_id = :characterId AND is_archived = 1")
    suspend fun getArchivedCount(characterId: Long): Int
    
    @Query("SELECT AVG(importance) FROM synth_memories WHERE character_id = :characterId AND is_archived = 0")
    suspend fun getAverageImportance(characterId: Long): Float?
    
    @Query("SELECT MAX(access_count) FROM synth_memories WHERE character_id = :characterId")
    suspend fun getMaxAccessCount(characterId: Long): Int?
    
    @Query("SELECT MIN(created_at) FROM synth_memories WHERE character_id = :characterId")
    suspend fun getOldestMemoryDate(characterId: Long): Long?
    
    @Query("SELECT MAX(created_at) FROM synth_memories WHERE character_id = :characterId")
    suspend fun getNewestMemoryDate(characterId: Long): Long?
    
    @Query("DELETE FROM synth_memories WHERE character_id = :characterId")
    suspend fun deleteAllForCharacter(characterId: Long)
    
    @Query("DELETE FROM synth_memories WHERE character_id = :characterId AND is_archived = 1")
    suspend fun deleteArchivedMemories(characterId: Long)
    
    @Query("DELETE FROM synth_memories WHERE character_id = :characterId AND expires_at IS NOT NULL AND expires_at < :currentTime")
    suspend fun deleteExpiredMemories(characterId: Long, currentTime: Long = System.currentTimeMillis())
    
    @Query("SELECT * FROM synth_memories WHERE character_id = :characterId AND `key` = :key LIMIT 1")
    suspend fun findByKey(characterId: Long, key: String): SynthMemory?
    
    @Query("SELECT * FROM synth_memories WHERE store_id = :storeId")
    suspend fun getMemoriesByStore(storeId: Long): List<SynthMemory>
    
    @Transaction
    @Query("SELECT * FROM synth_memories WHERE character_id = :characterId AND is_archived = 0 ORDER BY importance DESC")
    fun getMemoriesWithCategory(characterId: Long): Flow<List<MemoryWithCategory>>
}

@Dao
interface SynthMemoryBlockDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(block: SynthMemoryBlock): Long
    
    @Update
    suspend fun update(block: SynthMemoryBlock)
    
    @Delete
    suspend fun delete(block: SynthMemoryBlock)
    
    @Query("SELECT * FROM synth_memory_blocks WHERE id = :id")
    suspend fun getById(id: Long): SynthMemoryBlock?
    
    @Query("SELECT * FROM synth_memory_blocks WHERE character_id = :characterId AND is_active = 1 ORDER BY relevance_score DESC")
    fun getActiveBlocks(characterId: Long): Flow<List<SynthMemoryBlock>>
    
    @Query("SELECT * FROM synth_memory_blocks WHERE character_id = :characterId AND is_active = 1 ORDER BY relevance_score DESC")
    suspend fun getActiveBlocksOnce(characterId: Long): List<SynthMemoryBlock>
    
    @Query("SELECT * FROM synth_memory_blocks WHERE character_id = :characterId ORDER BY created_at DESC")
    suspend fun getAllBlocks(characterId: Long): List<SynthMemoryBlock>
    
    @Query("SELECT COUNT(*) FROM synth_memory_blocks WHERE character_id = :characterId")
    suspend fun getBlocksCount(characterId: Long): Int
    
    @Query("SELECT SUM(token_count) FROM synth_memory_blocks WHERE character_id = :characterId AND is_active = 1")
    suspend fun getActiveTokenCount(characterId: Long): Int?
    
    @Query("UPDATE synth_memory_blocks SET is_active = :active, updated_at = :updateTime WHERE id = :blockId")
    suspend fun setActive(blockId: Long, active: Boolean, updateTime: Long = System.currentTimeMillis())
    
    @Query("UPDATE synth_memory_blocks SET relevance_score = :score, updated_at = :updateTime WHERE id = :blockId")
    suspend fun updateRelevanceScore(blockId: Long, score: Float, updateTime: Long = System.currentTimeMillis())
    
    @Query("DELETE FROM synth_memory_blocks WHERE character_id = :characterId")
    suspend fun deleteAllForCharacter(characterId: Long)
}

@Dao
interface SynthMemorySyncRecordDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(record: SynthMemorySyncRecord): Long
    
    @Update
    suspend fun update(record: SynthMemorySyncRecord)
    
    @Delete
    suspend fun delete(record: SynthMemorySyncRecord)
    
    @Query("SELECT * FROM synth_memory_sync_records WHERE memory_id = :memoryId AND store_id = :storeId LIMIT 1")
    suspend fun findByMemoryAndStore(memoryId: Long, storeId: Long): SynthMemorySyncRecord?
    
    @Query("SELECT * FROM synth_memory_sync_records WHERE store_id = :storeId AND sync_status = :status")
    suspend fun getBySyncStatus(storeId: Long, status: String): List<SynthMemorySyncRecord>
    
    @Query("SELECT * FROM synth_memory_sync_records WHERE store_id = :storeId AND sync_status = 'pending' ORDER BY created_at ASC LIMIT :limit")
    suspend fun getPendingSync(storeId: Long, limit: Int = 100): List<SynthMemorySyncRecord>
    
    @Query("UPDATE synth_memory_sync_records SET sync_status = :status, last_synced_at = :syncTime, error_message = :error WHERE id = :recordId")
    suspend fun updateSyncStatus(recordId: Long, status: String, syncTime: Long? = System.currentTimeMillis(), error: String? = null)
    
    @Query("UPDATE synth_memory_sync_records SET retry_count = retry_count + 1 WHERE id = :recordId")
    suspend fun incrementRetryCount(recordId: Long)
    
    @Query("DELETE FROM synth_memory_sync_records WHERE memory_id = :memoryId")
    suspend fun deleteByMemoryId(memoryId: Long)
    
    @Query("DELETE FROM synth_memory_sync_records WHERE store_id = :storeId")
    suspend fun deleteByStoreId(storeId: Long)
}

@Dao
interface SynthMemoryAccessLogDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(log: SynthMemoryAccessLog): Long
    
    @Query("SELECT * FROM synth_memory_access_logs WHERE memory_id = :memoryId ORDER BY accessed_at DESC LIMIT :limit")
    suspend fun getLogsForMemory(memoryId: Long, limit: Int = 100): List<SynthMemoryAccessLog>
    
    @Query("SELECT * FROM synth_memory_access_logs WHERE accessed_at >= :sinceTime ORDER BY accessed_at DESC")
    suspend fun getLogsSince(sinceTime: Long): List<SynthMemoryAccessLog>
    
    @Query("SELECT COUNT(*) FROM synth_memory_access_logs WHERE memory_id = :memoryId AND access_type = :accessType")
    suspend fun getAccessCount(memoryId: Long, accessType: String = "read"): Int
    
    @Query("DELETE FROM synth_memory_access_logs WHERE accessed_at < :beforeTime")
    suspend fun deleteOldLogs(beforeTime: Long)
    
    @Query("DELETE FROM synth_memory_access_logs WHERE memory_id = :memoryId")
    suspend fun deleteLogsForMemory(memoryId: Long)
}
