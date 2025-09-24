package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.*
import kotlinx.coroutines.flow.Flow

/**
 * DAO for metadata operations across all media types
 */
@Dao
interface MetadataDao {
    
    // Common metadata operations
    @Query("SELECT * FROM metadata_common WHERE itemId = :itemId")
    suspend fun getCommonMetadata(itemId: Long): MetadataCommon?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCommonMetadata(metadata: MetadataCommon)
    
    @Update
    suspend fun updateCommonMetadata(metadata: MetadataCommon)
    
    @Delete
    suspend fun deleteCommonMetadata(metadata: MetadataCommon)
    
    // Book metadata operations
    @Query("SELECT * FROM metadata_book WHERE itemId = :itemId")
    suspend fun getBookMetadata(itemId: Long): MetadataBook?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertBookMetadata(metadata: MetadataBook)
    
    @Update
    suspend fun updateBookMetadata(metadata: MetadataBook)
    
    @Query("UPDATE metadata_book SET readingProgress = :progress WHERE itemId = :itemId")
    suspend fun updateReadingProgress(itemId: Long, progress: Float)
    
    @Query("UPDATE metadata_book SET isRead = :isRead, lastReadDate = :date WHERE itemId = :itemId")
    suspend fun markAsRead(itemId: Long, isRead: Boolean, date: Long?)
    
    // Movie metadata operations
    @Query("SELECT * FROM metadata_movie WHERE itemId = :itemId")
    suspend fun getMovieMetadata(itemId: Long): MetadataMovie?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMovieMetadata(metadata: MetadataMovie)
    
    @Update
    suspend fun updateMovieMetadata(metadata: MetadataMovie)
    
    @Query("UPDATE metadata_movie SET watchedStatus = :status, watchedDate = :date WHERE itemId = :itemId")
    suspend fun updateWatchStatus(itemId: Long, status: String, date: Long?)
    
    @Query("UPDATE metadata_movie SET watchProgress = :progress, resumePosition = :position WHERE itemId = :itemId")
    suspend fun updateWatchProgress(itemId: Long, progress: Float, position: Long)
    
    // Music metadata operations
    @Query("SELECT * FROM metadata_music_track WHERE itemId = :itemId")
    suspend fun getMusicMetadata(itemId: Long): MetadataMusicTrack?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMusicMetadata(metadata: MetadataMusicTrack)
    
    @Update
    suspend fun updateMusicMetadata(metadata: MetadataMusicTrack)
    
    @Query("UPDATE metadata_music_track SET playCount = playCount + 1, lastPlayed = :timestamp WHERE itemId = :itemId")
    suspend fun incrementPlayCount(itemId: Long, timestamp: Long)
    
    @Query("UPDATE metadata_music_track SET isFavorite = :isFavorite WHERE itemId = :itemId")
    suspend fun setFavorite(itemId: Long, isFavorite: Boolean)
    
    // Search operations
    @Query("""
        SELECT m.* FROM metadata_common m
        WHERE m.title LIKE '%' || :query || '%'
        OR m.summary LIKE '%' || :query || '%'
        ORDER BY m.title ASC
        LIMIT :limit
    """)
    suspend fun searchByTitle(query: String, limit: Int = 50): List<MetadataCommon>
    
    @Query("""
        SELECT m.* FROM metadata_common m
        WHERE m.year = :year
        ORDER BY m.title ASC
    """)
    suspend fun getMetadataByYear(year: Int): List<MetadataCommon>
    
    @Query("""
        SELECT m.* FROM metadata_common m
        WHERE m.rating >= :minRating
        ORDER BY m.rating DESC
        LIMIT :limit
    """)
    suspend fun getHighRatedItems(minRating: Float, limit: Int = 50): List<MetadataCommon>
    
    // Batch operations
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCommonMetadataBatch(metadata: List<MetadataCommon>)
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertBookMetadataBatch(metadata: List<MetadataBook>)
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMovieMetadataBatch(metadata: List<MetadataMovie>)
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMusicMetadataBatch(metadata: List<MetadataMusicTrack>)
}