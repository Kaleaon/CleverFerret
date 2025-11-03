package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.universalmedialibrary.data.local.entity.OcrCacheEntity
import kotlinx.coroutines.flow.Flow

/**
 * DAO for OCR cache operations
 */
@Dao
interface OcrCacheDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(ocrCache: OcrCacheEntity)
    
    @Query("SELECT * FROM ocr_cache WHERE id = :id")
    suspend fun getById(id: String): OcrCacheEntity?
    
    @Query("SELECT * FROM ocr_cache WHERE mediaItemId = :mediaItemId AND pageNumber = :pageNumber")
    suspend fun getByMediaItemAndPage(mediaItemId: String, pageNumber: Int): OcrCacheEntity?
    
    @Query("SELECT * FROM ocr_cache WHERE mediaItemId = :mediaItemId ORDER BY pageNumber ASC")
    fun getByMediaItemFlow(mediaItemId: String): Flow<List<OcrCacheEntity>>
    
    @Query("DELETE FROM ocr_cache WHERE id = :id")
    suspend fun deleteById(id: String)
    
    @Query("DELETE FROM ocr_cache WHERE mediaItemId = :mediaItemId")
    suspend fun deleteByMediaItem(mediaItemId: String)
    
    @Query("DELETE FROM ocr_cache WHERE timestamp < :timestamp")
    suspend fun deleteOlderThan(timestamp: Long)
    
    @Query("SELECT COUNT(*) FROM ocr_cache")
    suspend fun getCount(): Int
}
