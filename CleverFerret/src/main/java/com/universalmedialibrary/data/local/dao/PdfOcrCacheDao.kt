package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.universalmedialibrary.data.local.entity.PdfOcrCacheEntity

/**
 * Data Access Object for PDF OCR Cache operations.
 */
@Dao
interface PdfOcrCacheDao {

    @Query("SELECT * FROM pdf_ocr_cache WHERE fileHash = :fileHash ORDER BY pageIndex ASC")
    suspend fun getPagesForFile(fileHash: String): List<PdfOcrCacheEntity>

    @Query("SELECT * FROM pdf_ocr_cache WHERE fileHash = :fileHash AND pageIndex = :pageIndex LIMIT 1")
    suspend fun getPageText(fileHash: String, pageIndex: Int): PdfOcrCacheEntity?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(entries: List<PdfOcrCacheEntity>)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(entry: PdfOcrCacheEntity)

    @Query("DELETE FROM pdf_ocr_cache WHERE fileHash = :fileHash")
    suspend fun deleteByFileHash(fileHash: String)

    @Query("DELETE FROM pdf_ocr_cache WHERE timestamp < :timestamp")
    suspend fun deleteOlderThan(timestamp: Long)

    @Query("SELECT COUNT(*) FROM pdf_ocr_cache")
    suspend fun getCacheCount(): Int

    @Query("DELETE FROM pdf_ocr_cache")
    suspend fun clearAll()
}
