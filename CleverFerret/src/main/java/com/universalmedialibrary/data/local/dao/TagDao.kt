package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.Tag
import kotlinx.coroutines.flow.Flow

/**
 * Data Access Object for Tag entities
 * Provides CRUD operations for managing tags in the database
 */
@Dao
interface TagDao {

    /**
     * Get all tags as a Flow for reactive updates
     */
    @Query("SELECT * FROM tags ORDER BY name ASC")
    fun getAllTags(): Flow<List<Tag>>

    /**
     * Get all tags as a list
     */
    @Query("SELECT * FROM tags ORDER BY name ASC")
    suspend fun getAllTagsList(): List<Tag>

    /**
     * Get a tag by ID
     */
    @Query("SELECT * FROM tags WHERE id = :tagId")
    suspend fun getTagById(tagId: Long): Tag?

    /**
     * Get a tag by name
     */
    @Query("SELECT * FROM tags WHERE name = :name")
    suspend fun getTagByName(name: String): Tag?

    /**
     * Search tags by name pattern
     */
    @Query("SELECT * FROM tags WHERE name LIKE '%' || :query || '%' ORDER BY name ASC")
    fun searchTags(query: String): Flow<List<Tag>>

    /**
     * Insert a new tag
     * @return the row ID of the inserted tag
     */
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insert(tag: Tag): Long

    /**
     * Insert multiple tags
     * @return list of row IDs
     */
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insertAll(tags: List<Tag>): List<Long>

    /**
     * Update an existing tag
     */
    @Update
    suspend fun update(tag: Tag)

    /**
     * Delete a tag
     */
    @Delete
    suspend fun delete(tag: Tag)

    /**
     * Delete a tag by ID
     */
    @Query("DELETE FROM tags WHERE id = :tagId")
    suspend fun deleteById(tagId: Long)

    /**
     * Delete all tags
     */
    @Query("DELETE FROM tags")
    suspend fun deleteAll()

    /**
     * Get the count of all tags
     */
    @Query("SELECT COUNT(*) FROM tags")
    suspend fun getTagCount(): Int

    /**
     * Check if a tag exists by name
     */
    @Query("SELECT EXISTS(SELECT 1 FROM tags WHERE name = :name)")
    suspend fun tagExists(name: String): Boolean
}
