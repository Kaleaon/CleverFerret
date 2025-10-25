package com.universalmedialibrary.data.music

import android.content.Context
import androidx.room.*
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Music tagging system for custom categorization
 * 
 * Features:
 * - Custom tags (user-defined)
 * - Predefined tag categories (Series, Mood, Era, etc.)
 * - Many-to-many track-tag relationships
 * - Tag suggestions from AI
 * - Tag usage statistics
 */

// ==================== ENTITIES ====================

/**
 * Tag entity - represents a single tag
 */
@Entity(tableName = "music_tags")
data class MusicTag(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    @ColumnInfo(name = "name")
    val name: String, // Tag name (e.g., "Workout", "Relaxing", "90s")
    
    @ColumnInfo(name = "category")
    val category: TagCategory = TagCategory.CUSTOM,
    
    @ColumnInfo(name = "color")
    val color: String? = null, // Hex color (e.g., "#FF5722")
    
    @ColumnInfo(name = "icon")
    val icon: String? = null, // Icon name (e.g., "music_note")
    
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis(),
    
    @ColumnInfo(name = "usage_count")
    val usageCount: Int = 0 // How many tracks have this tag
)

/**
 * Track-tag relationship (many-to-many)
 */
@Entity(
    tableName = "track_tags",
    primaryKeys = ["track_id", "tag_id"],
    indices = [Index("track_id"), Index("tag_id")]
)
data class TrackTagCrossRef(
    @ColumnInfo(name = "track_id")
    val trackId: Long, // MediaStore track ID
    
    @ColumnInfo(name = "tag_id")
    val tagId: Long,
    
    @ColumnInfo(name = "added_at")
    val addedAt: Long = System.currentTimeMillis()
)

/**
 * Track with its tags (for queries)
 */
data class TrackWithTags(
    @Embedded val trackId: Long,
    @Relation(
        parentColumn = "trackId",
        entityColumn = "id",
        associateBy = Junction(
            TrackTagCrossRef::class,
            parentColumn = "track_id",
            entityColumn = "tag_id"
        )
    )
    val tags: List<MusicTag>
)

/**
 * Tag with track count (for display)
 */
data class TagWithCount(
    @Embedded val tag: MusicTag,
    val trackCount: Int
)

/**
 * Tag categories for organization
 */
enum class TagCategory {
    CUSTOM,        // User-defined
    SERIES,        // Part of a series (e.g., "James Bond", "Disney")
    GENRE,         // Custom genre/subgenre
    MOOD,          // Emotional mood (Happy, Sad, Energetic)
    ACTIVITY,      // Activity context (Workout, Study, Party)
    ERA,           // Time period (80s, 90s, 2000s)
    LANGUAGE,      // Language of lyrics
    INSTRUMENT,    // Prominent instruments
    THEME,         // Thematic content (Love, Adventure, etc.)
    OCCASION,      // Special occasions (Wedding, Christmas, etc.)
    TEMPO,         // Speed/tempo (Fast, Slow, Medium)
    COLLECTION     // User collections/playlists context
}

// ==================== DAO ====================

@Dao
interface MusicTagDao {
    
    // ===== Tag CRUD =====
    
    @Query("SELECT * FROM music_tags ORDER BY name ASC")
    fun getAllTags(): Flow<List<MusicTag>>
    
    @Query("SELECT * FROM music_tags WHERE category = :category ORDER BY name ASC")
    fun getTagsByCategory(category: TagCategory): Flow<List<MusicTag>>
    
    @Query("SELECT * FROM music_tags WHERE id = :tagId")
    suspend fun getTagById(tagId: Long): MusicTag?
    
    @Query("SELECT * FROM music_tags WHERE name = :name")
    suspend fun getTagByName(name: String): MusicTag?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertTag(tag: MusicTag): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertTags(tags: List<MusicTag>)
    
    @Update
    suspend fun updateTag(tag: MusicTag)
    
    @Delete
    suspend fun deleteTag(tag: MusicTag)
    
    @Query("DELETE FROM music_tags WHERE id = :tagId")
    suspend fun deleteTagById(tagId: Long)
    
    // ===== Track-Tag Relationships =====
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun addTagToTrack(crossRef: TrackTagCrossRef)
    
    @Delete
    suspend fun removeTagFromTrack(crossRef: TrackTagCrossRef)
    
    @Query("DELETE FROM track_tags WHERE track_id = :trackId AND tag_id = :tagId")
    suspend fun removeTagFromTrackById(trackId: Long, tagId: Long)
    
    @Query("DELETE FROM track_tags WHERE track_id = :trackId")
    suspend fun removeAllTagsFromTrack(trackId: Long)
    
    @Query("SELECT * FROM music_tags WHERE id IN (SELECT tag_id FROM track_tags WHERE track_id = :trackId)")
    suspend fun getTagsForTrack(trackId: Long): List<MusicTag>
    
    @Query("SELECT * FROM music_tags WHERE id IN (SELECT tag_id FROM track_tags WHERE track_id = :trackId)")
    fun getTagsForTrackFlow(trackId: Long): Flow<List<MusicTag>>
    
    @Query("SELECT track_id FROM track_tags WHERE tag_id = :tagId")
    suspend fun getTrackIdsForTag(tagId: Long): List<Long>
    
    // ===== Statistics =====
    
    @Query("""
        SELECT music_tags.*, COUNT(track_tags.track_id) as trackCount
        FROM music_tags
        LEFT JOIN track_tags ON music_tags.id = track_tags.tag_id
        GROUP BY music_tags.id
        ORDER BY trackCount DESC, music_tags.name ASC
    """)
    fun getTagsWithCount(): Flow<List<TagWithCount>>
    
    @Query("""
        SELECT music_tags.*, COUNT(track_tags.track_id) as trackCount
        FROM music_tags
        LEFT JOIN track_tags ON music_tags.id = track_tags.tag_id
        WHERE music_tags.category = :category
        GROUP BY music_tags.id
        ORDER BY trackCount DESC, music_tags.name ASC
    """)
    fun getTagsWithCountByCategory(category: TagCategory): Flow<List<TagWithCount>>
    
    @Query("UPDATE music_tags SET usage_count = (SELECT COUNT(*) FROM track_tags WHERE tag_id = :tagId) WHERE id = :tagId")
    suspend fun updateUsageCount(tagId: Long)
    
    // ===== Search =====
    
    @Query("SELECT * FROM music_tags WHERE name LIKE '%' || :query || '%' ORDER BY usage_count DESC, name ASC")
    suspend fun searchTags(query: String): List<MusicTag>
    
    // ===== Cleanup =====
    
    @Query("DELETE FROM music_tags WHERE id NOT IN (SELECT DISTINCT tag_id FROM track_tags)")
    suspend fun deleteUnusedTags()
}

// ==================== DATABASE ====================

@Database(
    entities = [MusicTag::class, TrackTagCrossRef::class],
    version = 1,
    exportSchema = false
)
abstract class MusicTagDatabase : RoomDatabase() {
    abstract fun musicTagDao(): MusicTagDao
}

// ==================== REPOSITORY ====================

@Singleton
class MusicTagRepository @Inject constructor(
    @ApplicationContext context: Context
) {
    private val database = Room.databaseBuilder(
        context,
        MusicTagDatabase::class.java,
        "music_tags.db"
    ).build()
    
    private val dao = database.musicTagDao()
    
    // ===== Tags =====
    
    fun getAllTags(): Flow<List<MusicTag>> = dao.getAllTags()
    
    fun getTagsByCategory(category: TagCategory): Flow<List<MusicTag>> = 
        dao.getTagsByCategory(category)
    
    suspend fun getTagById(tagId: Long): MusicTag? = withContext(Dispatchers.IO) {
        dao.getTagById(tagId)
    }
    
    suspend fun getTagByName(name: String): MusicTag? = withContext(Dispatchers.IO) {
        dao.getTagByName(name)
    }
    
    suspend fun createTag(
        name: String,
        category: TagCategory = TagCategory.CUSTOM,
        color: String? = null,
        icon: String? = null
    ): Long = withContext(Dispatchers.IO) {
        // Check if tag already exists
        val existing = dao.getTagByName(name)
        if (existing != null) return@withContext existing.id
        
        val tag = MusicTag(
            name = name,
            category = category,
            color = color,
            icon = icon
        )
        dao.insertTag(tag)
    }
    
    suspend fun updateTag(tag: MusicTag) = withContext(Dispatchers.IO) {
        dao.updateTag(tag)
    }
    
    suspend fun deleteTag(tagId: Long) = withContext(Dispatchers.IO) {
        dao.deleteTagById(tagId)
    }
    
    suspend fun searchTags(query: String): List<MusicTag> = withContext(Dispatchers.IO) {
        dao.searchTags(query)
    }
    
    // ===== Track-Tag Relationships =====
    
    suspend fun addTagToTrack(trackId: Long, tagId: Long) = withContext(Dispatchers.IO) {
        val crossRef = TrackTagCrossRef(trackId = trackId, tagId = tagId)
        dao.addTagToTrack(crossRef)
        dao.updateUsageCount(tagId)
    }
    
    suspend fun removeTagFromTrack(trackId: Long, tagId: Long) = withContext(Dispatchers.IO) {
        dao.removeTagFromTrackById(trackId, tagId)
        dao.updateUsageCount(tagId)
    }
    
    suspend fun setTagsForTrack(trackId: Long, tagIds: List<Long>) = withContext(Dispatchers.IO) {
        // Remove all existing tags
        dao.removeAllTagsFromTrack(trackId)
        
        // Add new tags
        tagIds.forEach { tagId ->
            val crossRef = TrackTagCrossRef(trackId = trackId, tagId = tagId)
            dao.addTagToTrack(crossRef)
        }
        
        // Update usage counts
        tagIds.forEach { dao.updateUsageCount(it) }
    }
    
    suspend fun getTagsForTrack(trackId: Long): List<MusicTag> = withContext(Dispatchers.IO) {
        dao.getTagsForTrack(trackId)
    }
    
    fun getTagsForTrackFlow(trackId: Long): Flow<List<MusicTag>> = 
        dao.getTagsForTrackFlow(trackId)
    
    suspend fun getTrackIdsForTag(tagId: Long): List<Long> = withContext(Dispatchers.IO) {
        dao.getTrackIdsForTag(tagId)
    }
    
    // ===== Statistics =====
    
    fun getTagsWithCount(): Flow<List<TagWithCount>> = dao.getTagsWithCount()
    
    fun getTagsWithCountByCategory(category: TagCategory): Flow<List<TagWithCount>> =
        dao.getTagsWithCountByCategory(category)
    
    suspend fun deleteUnusedTags() = withContext(Dispatchers.IO) {
        dao.deleteUnusedTags()
    }
    
    // ===== Bulk Operations =====
    
    suspend fun createPredefinedTags() = withContext(Dispatchers.IO) {
        val predefinedTags = listOf(
            // Moods
            MusicTag(name = "Happy", category = TagCategory.MOOD, color = "#FFC107"),
            MusicTag(name = "Sad", category = TagCategory.MOOD, color = "#607D8B"),
            MusicTag(name = "Energetic", category = TagCategory.MOOD, color = "#FF5722"),
            MusicTag(name = "Relaxing", category = TagCategory.MOOD, color = "#4CAF50"),
            MusicTag(name = "Romantic", category = TagCategory.MOOD, color = "#E91E63"),
            
            // Activities
            MusicTag(name = "Workout", category = TagCategory.ACTIVITY, color = "#F44336"),
            MusicTag(name = "Study", category = TagCategory.ACTIVITY, color = "#2196F3"),
            MusicTag(name = "Party", category = TagCategory.ACTIVITY, color = "#9C27B0"),
            MusicTag(name = "Sleep", category = TagCategory.ACTIVITY, color = "#3F51B5"),
            MusicTag(name = "Driving", category = TagCategory.ACTIVITY, color = "#FF9800"),
            
            // Tempo
            MusicTag(name = "Fast", category = TagCategory.TEMPO, color = "#FF5722"),
            MusicTag(name = "Medium", category = TagCategory.TEMPO, color = "#FF9800"),
            MusicTag(name = "Slow", category = TagCategory.TEMPO, color = "#4CAF50"),
            
            // Occasions
            MusicTag(name = "Christmas", category = TagCategory.OCCASION, color = "#C62828"),
            MusicTag(name = "Halloween", category = TagCategory.OCCASION, color = "#FF6F00"),
            MusicTag(name = "Wedding", category = TagCategory.OCCASION, color = "#FFFFFF"),
            MusicTag(name = "Birthday", category = TagCategory.OCCASION, color = "#FFC107")
        )
        
        predefinedTags.forEach { tag ->
            if (dao.getTagByName(tag.name) == null) {
                dao.insertTag(tag)
            }
        }
    }
}
