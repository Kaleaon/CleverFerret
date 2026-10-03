package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.ItemTag
import com.universalmedialibrary.data.local.entity.TagType
import com.universalmedialibrary.data.local.entity.UnifiedTag
import kotlinx.coroutines.flow.Flow

/**
 * DAO for UnifiedTag operations
 *
 * Provides comprehensive tag management with:
 * - CRUD operations for tags
 * - Tag-item associations
 * - Tag suggestions based on usage
 * - Batch operations for performance
 */
@Dao
interface UnifiedTagDao {

    // Basic CRUD operations
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertTag(tag: UnifiedTag): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertTags(tags: List<UnifiedTag>): List<Long>

    @Update
    suspend fun updateTag(tag: UnifiedTag)

    @Delete
    suspend fun deleteTag(tag: UnifiedTag)

    @Query("DELETE FROM unified_tags WHERE tagId = :tagId")
    suspend fun deleteTagById(tagId: Long)
    
    @Query("DELETE FROM unified_tags WHERE tagId = :tagId")
    suspend fun deleteTag(tagId: Long)
    
    @Query("UPDATE unified_tags SET name = :newName WHERE tagId = :tagId")
    suspend fun updateTagName(tagId: Long, newName: String)

    // Query operations
    @Query("SELECT * FROM unified_tags WHERE tagId = :tagId")
    suspend fun getTagById(tagId: Long): UnifiedTag?

    @Query("SELECT * FROM unified_tags WHERE name = :name LIMIT 1")
    suspend fun getTagByName(name: String): UnifiedTag?

    @Query("SELECT * FROM unified_tags ORDER BY name ASC")
    fun getAllTags(): Flow<List<UnifiedTag>>

    @Query("SELECT * FROM unified_tags WHERE type = :type ORDER BY name ASC")
    fun getTagsByType(type: TagType): Flow<List<UnifiedTag>>

    @Query("SELECT * FROM unified_tags ORDER BY lastUsed DESC LIMIT :limit")
    fun getRecentlyUsedTags(limit: Int = 10): Flow<List<UnifiedTag>>

    @Query("SELECT * FROM unified_tags ORDER BY usageCount DESC LIMIT :limit")
    fun getMostUsedTags(limit: Int = 10): Flow<List<UnifiedTag>>

    @Query("SELECT * FROM unified_tags WHERE name LIKE '%' || :query || '%' ORDER BY usageCount DESC")
    fun searchTags(query: String): Flow<List<UnifiedTag>>

    // Tag-Item associations
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun addTagToItem(itemTag: ItemTag)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun addTagsToItem(itemTags: List<ItemTag>)

    @Query("DELETE FROM item_tags WHERE itemId = :itemId AND tagId = :tagId")
    suspend fun removeTagFromItem(itemId: Long, tagId: Long)

    @Query("DELETE FROM item_tags WHERE itemId = :itemId")
    suspend fun removeAllTagsFromItem(itemId: Long)

    @Query("DELETE FROM item_tags WHERE tagId = :tagId")
    suspend fun removeTagFromAllItems(tagId: Long)

    // Get tags for an item
    @Query("""
        SELECT t.* FROM unified_tags t
        INNER JOIN item_tags it ON t.tagId = it.tagId
        WHERE it.itemId = :itemId
        ORDER BY t.name ASC
    """)
    fun getTagsForItem(itemId: Long): Flow<List<UnifiedTag>>

    @Query("""
        SELECT t.* FROM unified_tags t
        INNER JOIN item_tags it ON t.tagId = it.tagId
        WHERE it.itemId = :itemId
        ORDER BY t.name ASC
    """)
    suspend fun getTagsForItemSync(itemId: Long): List<UnifiedTag>

    // Get items for a tag
    @Query("""
        SELECT it.itemId FROM item_tags it
        WHERE it.tagId = :tagId
        ORDER BY it.id DESC
    """)
    suspend fun getItemIdsForTag(tagId: Long): List<Long>

    // Update tag statistics
    @Query("UPDATE unified_tags SET usageCount = usageCount + 1, lastUsed = :timestamp WHERE tagId = :tagId")
    suspend fun incrementUsageCount(tagId: Long, timestamp: Long = System.currentTimeMillis())

    @Query("UPDATE unified_tags SET usageCount = (SELECT COUNT(*) FROM item_tags WHERE tagId = :tagId) WHERE tagId = :tagId")
    suspend fun recalculateUsageCount(tagId: Long)

    @Query("""
        UPDATE unified_tags 
        SET usageCount = (SELECT COUNT(*) FROM item_tags WHERE tagId = unified_tags.tagId)
    """)
    suspend fun recalculateAllUsageCounts()

    // Batch operations for performance
    @Transaction
    suspend fun applyTagsToItem(itemId: Long, tagIds: List<Long>) {
        // Remove existing tags
        removeAllTagsFromItem(itemId)
        
        // Add new tags
        val itemTags = tagIds.map { tagId ->
            ItemTag(itemId = itemId, tagId = tagId)
        }
        addTagsToItem(itemTags)
        
        // Update usage counts
        tagIds.forEach { tagId ->
            incrementUsageCount(tagId)
        }
    }

    @Transaction
    suspend fun mergeTag(fromTagId: Long, toTagId: Long) {
        // Get all items with the source tag
        val itemIds = getItemIdsForTag(fromTagId)
        
        // Add the destination tag to all those items
        val itemTags = itemIds.map { itemId ->
            ItemTag(itemId = itemId, tagId = toTagId)
        }
        addTagsToItem(itemTags)
        
        // Delete the source tag (cascade will remove item_tags)
        deleteTagById(fromTagId)
        
        // Recalculate usage for destination tag
        recalculateUsageCount(toTagId)
    }

    // Find or create tag
    @Transaction
    suspend fun findOrCreateTag(name: String, type: TagType = TagType.USER_DEFINED, color: String? = null): Long {
        val existing = getTagByName(name)
        return existing?.tagId ?: insertTag(
            UnifiedTag(
                name = name,
                type = type,
                color = color
            )
        )
    }

    // Get tag suggestions based on partial match and usage
    @Query("""
        SELECT * FROM unified_tags 
        WHERE name LIKE :query || '%'
        ORDER BY usageCount DESC, name ASC
        LIMIT :limit
    """)
    fun getTagSuggestions(query: String, limit: Int = 5): Flow<List<UnifiedTag>>

    // Get popular tags for a media type (via items)
    @Query("""
        SELECT t.*
        FROM unified_tags t
        INNER JOIN item_tags it ON t.tagId = it.tagId
        INNER JOIN media_items mi ON it.itemId = mi.itemId
        WHERE mi.mediaType = :mediaType
        GROUP BY t.tagId
        ORDER BY COUNT(DISTINCT it.itemId) DESC
        LIMIT :limit
    """)
    suspend fun getPopularTagsForMediaType(mediaType: String, limit: Int = 10): List<UnifiedTag>

    @RewriteQueriesToDropUnusedColumns
    @Query("""
        SELECT 
            t.tagId, 
            t.name, 
            t.type, 
            t.color, 
            t.description, 
            t.createdAt, 
            t.lastUsed, 
            t.usageCount, 
            t.externalId,
            COUNT(mi.itemId) AS filteredUsage
        FROM unified_tags t
        LEFT JOIN item_tags it ON t.tagId = it.tagId
        LEFT JOIN media_items mi ON it.itemId = mi.itemId
        WHERE (:mediaType IS NULL) OR mi.mediaType = :mediaType
        GROUP BY t.tagId
        ORDER BY filteredUsage DESC, t.name COLLATE NOCASE ASC
    """)
    fun observeTagUsage(mediaType: String?): Flow<List<UnifiedTagWithUsage>>
}

data class UnifiedTagWithUsage(
    @Embedded val tag: UnifiedTag,
    @ColumnInfo(name = "filteredUsage") val filteredUsage: Int
)
