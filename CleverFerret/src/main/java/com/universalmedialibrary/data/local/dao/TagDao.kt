package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.Tag
import com.universalmedialibrary.data.local.entity.ItemTag
import kotlinx.coroutines.flow.Flow

/**
 * Data Access Object for Tag and ItemTag entities
 * 
 * Provides methods for managing tags and their relationships to media items
 */
@Dao
interface TagDao {
    
    // Tag CRUD operations
    @Query("SELECT * FROM tag WHERE isActive = 1 ORDER BY name ASC")
    fun getAllActiveTags(): Flow<List<Tag>>
    
    @Query("SELECT * FROM tag WHERE tagId = :tagId")
    suspend fun getTagById(tagId: Long): Tag?
    
    @Query("SELECT * FROM tag WHERE name = :name LIMIT 1")
    suspend fun getTagByName(name: String): Tag?
    
    @Query("SELECT * FROM tag WHERE category = :category AND isActive = 1 ORDER BY name ASC")
    fun getTagsByCategory(category: String): Flow<List<Tag>>
    
    @Query("SELECT * FROM tag WHERE isSystem = :isSystem AND isActive = 1 ORDER BY name ASC")
    fun getTagsByType(isSystem: Boolean): Flow<List<Tag>>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertTag(tag: Tag): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertTags(tags: List<Tag>): List<Long>
    
    @Update
    suspend fun updateTag(tag: Tag)
    
    @Delete
    suspend fun deleteTag(tag: Tag)
    
    @Query("UPDATE tag SET isActive = 0 WHERE tagId = :tagId")
    suspend fun deactivateTag(tagId: Long)
    
    @Query("UPDATE tag SET lastUsed = :timestamp, usageCount = usageCount + 1 WHERE tagId = :tagId")
    suspend fun updateTagUsage(tagId: Long, timestamp: Long = System.currentTimeMillis())
    
    // ItemTag relationship operations
    @Query("SELECT t.* FROM tag t INNER JOIN item_tag it ON t.tagId = it.tagId WHERE it.itemId = :itemId AND t.isActive = 1 ORDER BY t.name ASC")
    fun getTagsForItem(itemId: Long): Flow<List<Tag>>
    
    @Query("SELECT it.itemId FROM item_tag it INNER JOIN tag t ON it.tagId = t.tagId WHERE t.tagId = :tagId")
    suspend fun getItemIdsWithTag(tagId: Long): List<Long>
    
    @Query("SELECT COUNT(*) FROM item_tag WHERE tagId = :tagId")
    suspend fun getTagUsageCount(tagId: Long): Int
    
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun addTagToItem(itemTag: ItemTag)
    
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun addTagsToItem(itemTags: List<ItemTag>)
    
    @Query("DELETE FROM item_tag WHERE itemId = :itemId AND tagId = :tagId")
    suspend fun removeTagFromItem(itemId: Long, tagId: Long)
    
    @Query("DELETE FROM item_tag WHERE itemId = :itemId")
    suspend fun removeAllTagsFromItem(itemId: Long)
    
    @Query("DELETE FROM item_tag WHERE tagId = :tagId")
    suspend fun removeTagFromAllItems(tagId: Long)
    
    @Query("SELECT EXISTS(SELECT 1 FROM item_tag WHERE itemId = :itemId AND tagId = :tagId)")
    suspend fun isItemTagged(itemId: Long, tagId: Long): Boolean
    
    // Search and filtering
    @Query("SELECT * FROM tag WHERE name LIKE '%' || :query || '%' AND isActive = 1 ORDER BY name ASC")
    fun searchTags(query: String): Flow<List<Tag>>
    
    @Query("SELECT DISTINCT category FROM tag WHERE category IS NOT NULL AND isActive = 1 ORDER BY category ASC")
    suspend fun getAllCategories(): List<String>
    
    // Popular and recommended tags
    @Query("SELECT * FROM tag WHERE isActive = 1 ORDER BY usageCount DESC LIMIT :limit")
    suspend fun getPopularTags(limit: Int = 10): List<Tag>
    
    @Query("SELECT * FROM tag WHERE lastUsed > :since AND isActive = 1 ORDER BY lastUsed DESC LIMIT :limit")
    suspend fun getRecentlyUsedTags(since: Long, limit: Int = 10): List<Tag>
    
    // Batch operations
    @Transaction
    suspend fun replaceItemTags(itemId: Long, tagIds: List<Long>) {
        removeAllTagsFromItem(itemId)
        val itemTags = tagIds.map { tagId ->
            ItemTag(itemId = itemId, tagId = tagId)
        }
        addTagsToItem(itemTags)
        
        // Update tag usage
        val timestamp = System.currentTimeMillis()
        tagIds.forEach { tagId ->
            updateTagUsage(tagId, timestamp)
        }
    }
    
    @Transaction
    suspend fun createTagAndAddToItem(tagName: String, itemId: Long, category: String? = null): Long {
        val tag = Tag(
            name = tagName,
            category = category,
            isSystem = false,
            isActive = true
        )
        val tagId = insertTag(tag)
        addTagToItem(ItemTag(itemId = itemId, tagId = tagId))
        updateTagUsage(tagId)
        return tagId
    }
}