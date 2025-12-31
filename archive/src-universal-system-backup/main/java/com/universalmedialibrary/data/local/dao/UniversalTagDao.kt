package com.universalmedialibrary.data.local.dao

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import com.universalmedialibrary.data.local.entity.UniversalTag
import com.universalmedialibrary.data.local.entity.TagCategory

/**
 * Data Access Object for UniversalTag operations.
 * Provides comprehensive CRUD operations and analytics for the universal tagging system.
 */
@Dao
interface UniversalTagDao {
    
    // Basic CRUD Operations
    @Insert
    suspend fun insertTag(tag: UniversalTag): Long
    
    @Insert
    suspend fun insertTags(tags: List<UniversalTag>): List<Long>
    
    @Update
    suspend fun updateTag(tag: UniversalTag)
    
    @Delete
    suspend fun deleteTag(tag: UniversalTag)
    
    @Query("DELETE FROM universal_tags WHERE id = :tagId")
    suspend fun deleteTagById(tagId: Long)
    
    @Query("SELECT * FROM universal_tags WHERE id = :tagId")
    suspend fun getTagById(tagId: Long): UniversalTag?
    
    @Query("SELECT * FROM universal_tags WHERE name = :name LIMIT 1")
    suspend fun getTagByName(name: String): UniversalTag?
    
    // Query Operations
    @Query("SELECT * FROM universal_tags ORDER BY name ASC")
    fun getAllTags(): Flow<List<UniversalTag>>
    
    @Query("SELECT * FROM universal_tags WHERE category = :category ORDER BY usage_count DESC")
    fun getTagsByCategory(category: TagCategory): Flow<List<UniversalTag>>
    
    @Query("SELECT * FROM universal_tags WHERE is_active = 1 ORDER BY usage_count DESC")
    fun getActiveTags(): Flow<List<UniversalTag>>
    
    @Query("SELECT * FROM universal_tags WHERE is_system_tag = 1 ORDER BY name ASC")
    fun getSystemTags(): Flow<List<UniversalTag>>
    
    @Query("SELECT * FROM universal_tags WHERE is_system_tag = 0 ORDER BY name ASC")
    fun getUserTags(): Flow<List<UniversalTag>>
    
    // Search Operations
    @Query("""
        SELECT * FROM universal_tags 
        WHERE name LIKE '%' || :query || '%' 
           OR description LIKE '%' || :query || '%'
        ORDER BY usage_count DESC, name ASC
        LIMIT :limit
    """)
    suspend fun searchTags(query: String, limit: Int = 50): List<UniversalTag>
    
    @Query("""
        SELECT * FROM universal_tags 
        WHERE name LIKE :query || '%' 
        ORDER BY usage_count DESC, name ASC
        LIMIT :limit
    """)
    suspend fun getTagSuggestions(query: String, limit: Int = 10): List<UniversalTag>
    
    // Analytics Operations
    @Query("SELECT * FROM universal_tags ORDER BY usage_count DESC LIMIT :limit")
    fun getPopularTags(limit: Int = 50): Flow<List<UniversalTag>>
    
    @Query("SELECT * FROM universal_tags ORDER BY created_at DESC LIMIT :limit")
    fun getRecentTags(limit: Int = 20): Flow<List<UniversalTag>>
    
    @Query("""
        SELECT category, COUNT(*) as count, SUM(usage_count) as total_usage
        FROM universal_tags 
        WHERE is_active = 1
        GROUP BY category
        ORDER BY total_usage DESC
    """)
    fun getTagCategoriesWithStats(): Flow<List<CategoryStats>>
    
    // Usage Tracking
    @Query("UPDATE universal_tags SET usage_count = usage_count + 1, updated_at = :timestamp WHERE id = :tagId")
    suspend fun incrementTagUsage(tagId: Long, timestamp: Long = System.currentTimeMillis())
    
    @Query("UPDATE universal_tags SET usage_count = :count, updated_at = :timestamp WHERE id = :tagId")
    suspend fun updateTagUsage(tagId: Long, count: Int, timestamp: Long = System.currentTimeMillis())
    
    // Bulk Operations
    @Query("UPDATE universal_tags SET is_active = 0 WHERE id IN (:tagIds)")
    suspend fun deactivateTags(tagIds: List<Long>)
    
    @Query("UPDATE universal_tags SET is_active = 1 WHERE id IN (:tagIds)")
    suspend fun activateTags(tagIds: List<Long>)
    
    @Query("DELETE FROM universal_tags WHERE is_system_tag = 0 AND usage_count = 0 AND created_at < :cutoffTime")
    suspend fun cleanupUnusedTags(cutoffTime: Long)
    
    // Parent/Child Relationships
    @Query("SELECT * FROM universal_tags WHERE parent_tag_id = :parentTagId ORDER BY name ASC")
    fun getChildTags(parentTagId: Long): Flow<List<UniversalTag>>
    
    @Query("SELECT * FROM universal_tags WHERE parent_tag_id IS NULL ORDER BY name ASC")
    fun getRootTags(): Flow<List<UniversalTag>>
    
    // Statistics and Analytics
    @Query("SELECT COUNT(*) FROM universal_tags")
    suspend fun getTotalTagCount(): Int
    
    @Query("SELECT COUNT(*) FROM universal_tags WHERE is_active = 1")
    suspend fun getActiveTagCount(): Int
    
    @Query("SELECT COUNT(*) FROM universal_tags WHERE category = :category")
    suspend fun getTagCountByCategory(category: TagCategory): Int
    
    @Query("SELECT SUM(usage_count) FROM universal_tags WHERE is_active = 1")
    suspend fun getTotalUsageCount(): Long
    
    // Migration and Maintenance
    @Query("SELECT name FROM universal_tags GROUP BY name HAVING COUNT(*) > 1")
    suspend fun findDuplicateTagNames(): List<String>
    
    @Query("SELECT * FROM universal_tags WHERE color IS NULL OR color = ''")
    suspend fun getTagsWithoutColor(): List<UniversalTag>
    
    @Query("SELECT * FROM universal_tags WHERE icon IS NULL OR icon = ''")
    suspend fun getTagsWithoutIcon(): List<UniversalTag>
    
    // Batch Operations for Performance
    @Transaction
    suspend fun updateTagsWithUsage(tagUsages: List<TagUsageUpdate>) {
        tagUsages.forEach { update ->
            updateTagUsage(update.tagId, update.usageCount)
        }
    }
}

// Data classes for complex queries
data class CategoryStats(
    val category: TagCategory,
    val count: Int,
    val totalUsage: Long
)

data class TagUsageUpdate(
    val tagId: Long,
    val usageCount: Int
)