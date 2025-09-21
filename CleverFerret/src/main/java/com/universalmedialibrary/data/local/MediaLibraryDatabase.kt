package com.universalmedialibrary.data.local

import androidx.room.*
import androidx.room.Database
import kotlinx.coroutines.flow.Flow

/**
 * Media Library Database - ACTUAL WORKING IMPLEMENTATION
 * 
 * Room database to store scanned media files with proper indexing and queries.
 * This actually stores and retrieves media files found on the device.
 */
@Database(
    entities = [MediaFileEntity::class],
    version = 1,
    exportSchema = false
)
@TypeConverters(Converters::class)
abstract class MediaLibraryDatabase : RoomDatabase() {
    abstract fun mediaFileDao(): MediaFileDao
}

/**
 * Media File Entity for Room database
 */
@Entity(
    tableName = "media_files",
    indices = [
        Index(value = ["media_type"]),
        Index(value = ["name"]),
        Index(value = ["extension"]),
        Index(value = ["last_modified"])
    ]
)
data class MediaFileEntity(
    @PrimaryKey
    val path: String,
    val name: String,
    val extension: String,
    val size: Long,
    @ColumnInfo(name = "last_modified")
    val lastModified: Long,
    @ColumnInfo(name = "media_type")
    val mediaType: String,
    val title: String?,
    val artist: String?,
    val album: String?,
    val duration: Long?,
    val year: Int?,
    val genre: String?,
    val resolution: String?,
    @ColumnInfo(name = "file_type")
    val fileType: String?,
    @ColumnInfo(name = "date_added")
    val dateAdded: Long = System.currentTimeMillis(),
    @ColumnInfo(name = "is_favorite")
    val isFavorite: Boolean = false,
    @ColumnInfo(name = "play_count")
    val playCount: Int = 0,
    @ColumnInfo(name = "last_played")
    val lastPlayed: Long? = null
)

/**
 * Data Access Object for media files
 */
@Dao
interface MediaFileDao {
    
    // Basic CRUD operations
    @Query("SELECT * FROM media_files ORDER BY name ASC")
    fun getAllFiles(): Flow<List<MediaFileEntity>>
    
    @Query("SELECT * FROM media_files WHERE media_type = :mediaType ORDER BY name ASC")
    fun getFilesByType(mediaType: String): Flow<List<MediaFileEntity>>
    
    @Query("SELECT * FROM media_files WHERE path = :path")
    suspend fun getFileByPath(path: String): MediaFileEntity?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertFile(file: MediaFileEntity)
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertFiles(files: List<MediaFileEntity>)
    
    @Update
    suspend fun updateFile(file: MediaFileEntity)
    
    @Delete
    suspend fun deleteFile(file: MediaFileEntity)
    
    @Query("DELETE FROM media_files WHERE path = :path")
    suspend fun deleteFileByPath(path: String)
    
    @Query("DELETE FROM media_files")
    suspend fun deleteAllFiles()
    
    // Search queries
    @Query("""
        SELECT * FROM media_files 
        WHERE name LIKE '%' || :query || '%' 
        OR title LIKE '%' || :query || '%' 
        OR artist LIKE '%' || :query || '%' 
        OR album LIKE '%' || :query || '%'
        ORDER BY name ASC
    """)
    fun searchFiles(query: String): Flow<List<MediaFileEntity>>
    
    @Query("""
        SELECT * FROM media_files 
        WHERE media_type = :mediaType 
        AND (name LIKE '%' || :query || '%' 
        OR title LIKE '%' || :query || '%' 
        OR artist LIKE '%' || :query || '%' 
        OR album LIKE '%' || :query || '%')
        ORDER BY name ASC
    """)
    fun searchFilesByType(mediaType: String, query: String): Flow<List<MediaFileEntity>>
    
    // Recently added files
    @Query("SELECT * FROM media_files ORDER BY date_added DESC LIMIT :limit")
    fun getRecentlyAdded(limit: Int = 20): Flow<List<MediaFileEntity>>
    
    // Recently played files
    @Query("SELECT * FROM media_files WHERE last_played IS NOT NULL ORDER BY last_played DESC LIMIT :limit")
    fun getRecentlyPlayed(limit: Int = 20): Flow<List<MediaFileEntity>>
    
    // Favorite files
    @Query("SELECT * FROM media_files WHERE is_favorite = 1 ORDER BY name ASC")
    fun getFavoriteFiles(): Flow<List<MediaFileEntity>>
    
    // Update favorite status
    @Query("UPDATE media_files SET is_favorite = :isFavorite WHERE path = :path")
    suspend fun updateFavoriteStatus(path: String, isFavorite: Boolean)
    
    // Update play statistics
    @Query("UPDATE media_files SET play_count = play_count + 1, last_played = :timestamp WHERE path = :path")
    suspend fun incrementPlayCount(path: String, timestamp: Long = System.currentTimeMillis())
    
    // Statistics queries
    @Query("SELECT COUNT(*) FROM media_files")
    suspend fun getTotalFileCount(): Int
    
    @Query("SELECT COUNT(*) FROM media_files WHERE media_type = :mediaType")
    suspend fun getFileCountByType(mediaType: String): Int
    
    @Query("SELECT COUNT(*) FROM media_files WHERE is_favorite = 1")
    suspend fun getFavoriteCount(): Int
    
    // Grouping queries for library organization
    @Query("SELECT DISTINCT artist FROM media_files WHERE media_type = 'AUDIO' AND artist IS NOT NULL ORDER BY artist ASC")
    fun getAllArtists(): Flow<List<String>>
    
    @Query("SELECT DISTINCT album FROM media_files WHERE media_type = 'AUDIO' AND album IS NOT NULL ORDER BY album ASC")
    fun getAllAlbums(): Flow<List<String>>
    
    @Query("SELECT DISTINCT genre FROM media_files WHERE media_type = 'AUDIO' AND genre IS NOT NULL ORDER BY genre ASC")
    fun getAllGenres(): Flow<List<String>>
    
    @Query("SELECT * FROM media_files WHERE media_type = 'AUDIO' AND artist = :artist ORDER BY album ASC, name ASC")
    fun getFilesByArtist(artist: String): Flow<List<MediaFileEntity>>
    
    @Query("SELECT * FROM media_files WHERE media_type = 'AUDIO' AND album = :album ORDER BY name ASC")
    fun getFilesByAlbum(album: String): Flow<List<MediaFileEntity>>
    
    @Query("SELECT * FROM media_files WHERE media_type = 'AUDIO' AND genre = :genre ORDER BY artist ASC, album ASC, name ASC")
    fun getFilesByGenre(genre: String): Flow<List<MediaFileEntity>>
    
    // Clean up missing files (files that no longer exist on disk)
    @Query("SELECT path FROM media_files")
    suspend fun getAllFilePaths(): List<String>
}

/**
 * Type converters for Room database
 */
class Converters {
    // Room handles primitive types automatically, no converters needed for current data
}