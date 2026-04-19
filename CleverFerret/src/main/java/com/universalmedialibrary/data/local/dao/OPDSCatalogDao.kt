package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.OPDSCatalog
import com.universalmedialibrary.data.local.entity.OPDSDownload
import com.universalmedialibrary.data.local.entity.DownloadStatus
import kotlinx.coroutines.flow.Flow

/**
 * DAO for OPDS Catalog operations
 */
@Dao
interface OPDSCatalogDao {
    
    // ========== CATALOG OPERATIONS ==========
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(catalog: OPDSCatalog): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCatalog(catalog: OPDSCatalog): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCatalogs(catalogs: List<OPDSCatalog>)
    
    @Update
    suspend fun updateCatalog(catalog: OPDSCatalog)
    
    @Delete
    suspend fun delete(catalog: OPDSCatalog)
    
    @Delete
    suspend fun deleteCatalog(catalog: OPDSCatalog)
    
    @Query("SELECT * FROM opds_catalogs WHERE id = :catalogId")
    suspend fun getCatalogById(catalogId: Long): OPDSCatalog?
    
    @Query("SELECT * FROM opds_catalogs WHERE id = :catalogId")
    fun getCatalogByIdFlow(catalogId: Long): Flow<OPDSCatalog?>
    
    @Query("SELECT * FROM opds_catalogs ORDER BY name ASC")
    fun getAllCatalogs(): Flow<List<OPDSCatalog>>
    
    @Query("SELECT * FROM opds_catalogs ORDER BY name ASC")
    suspend fun getAllCatalogsOnce(): List<OPDSCatalog>
    
    @Query("SELECT * FROM opds_catalogs WHERE isEnabled = 1 ORDER BY name ASC")
    fun getEnabledCatalogs(): Flow<List<OPDSCatalog>>
    
    @Query("SELECT * FROM opds_catalogs WHERE isDefault = 1 ORDER BY name ASC")
    fun getDefaultCatalogs(): Flow<List<OPDSCatalog>>
    
    @Query("SELECT * FROM opds_catalogs WHERE isDefault = 0 ORDER BY accessCount DESC LIMIT :limit")
    fun getRecentlyUsedCatalogs(limit: Int = 5): Flow<List<OPDSCatalog>>
    
    @Query("UPDATE opds_catalogs SET lastAccessedAt = :timestamp, accessCount = accessCount + 1 WHERE id = :catalogId")
    suspend fun updateAccessTime(catalogId: Long, timestamp: Long = System.currentTimeMillis())
    
    @Query("UPDATE opds_catalogs SET lastAccessedAt = :timestamp, accessCount = accessCount + 1 WHERE id = :catalogId")
    suspend fun updateLastAccessed(catalogId: Long, timestamp: Long)
    
    @Query("UPDATE opds_catalogs SET isEnabled = :enabled WHERE id = :catalogId")
    suspend fun setCatalogEnabled(catalogId: Long, enabled: Boolean)
    
    @Query("SELECT COUNT(*) FROM opds_catalogs")
    suspend fun getCatalogCount(): Int
    
    @Query("DELETE FROM opds_catalogs WHERE isDefault = 0")
    suspend fun deleteAllNonDefaultCatalogs()
    
    // ========== DOWNLOAD OPERATIONS ==========
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertDownload(download: OPDSDownload): Long
    
    @Update
    suspend fun updateDownload(download: OPDSDownload)
    
    @Delete
    suspend fun deleteDownload(download: OPDSDownload)
    
    @Query("SELECT * FROM opds_downloads WHERE id = :downloadId")
    suspend fun getDownloadById(downloadId: Long): OPDSDownload?
    
    @Query("SELECT * FROM opds_downloads WHERE id = :downloadId")
    fun getDownloadByIdFlow(downloadId: Long): Flow<OPDSDownload?>
    
    @Query("SELECT * FROM opds_downloads ORDER BY createdAt DESC")
    fun getAllDownloads(): Flow<List<OPDSDownload>>
    
    @Query("SELECT * FROM opds_downloads WHERE catalogId = :catalogId ORDER BY createdAt DESC")
    fun getDownloadsForCatalog(catalogId: Long): Flow<List<OPDSDownload>>
    
    @Query("SELECT * FROM opds_downloads WHERE status = :status ORDER BY createdAt DESC")
    fun getDownloadsByStatus(status: DownloadStatus): Flow<List<OPDSDownload>>
    
    @Query("SELECT * FROM opds_downloads WHERE status = :downloading OR status = :pending ORDER BY createdAt ASC")
    fun getActiveDownloads(
        downloading: DownloadStatus = DownloadStatus.DOWNLOADING,
        pending: DownloadStatus = DownloadStatus.PENDING
    ): Flow<List<OPDSDownload>>
    
    @Query("SELECT * FROM opds_downloads WHERE status = :completed ORDER BY completedAt DESC")
    fun getCompletedDownloads(
        completed: DownloadStatus = DownloadStatus.COMPLETED
    ): Flow<List<OPDSDownload>>
    
    @Query("UPDATE opds_downloads SET status = :status, progress = :progress, downloadedBytes = :downloadedBytes WHERE id = :downloadId")
    suspend fun updateDownloadProgress(downloadId: Long, status: DownloadStatus, progress: Int, downloadedBytes: Long)
    
    @Query("UPDATE opds_downloads SET status = 'COMPLETED', progress = 100, localPath = :localPath, completedAt = :timestamp WHERE id = :downloadId")
    suspend fun markDownloadComplete(downloadId: Long, localPath: String, timestamp: Long = System.currentTimeMillis())

    @Transaction
    suspend fun markDownloadCompleteAtomically(downloadId: Long, localPath: String, timestamp: Long = System.currentTimeMillis()) {
        markDownloadComplete(downloadId, localPath, timestamp)
    }
    
    @Query("UPDATE opds_downloads SET status = 'FAILED', errorMessage = :errorMessage WHERE id = :downloadId")
    suspend fun markDownloadFailed(downloadId: Long, errorMessage: String)
    
    @Query("UPDATE opds_downloads SET status = 'CANCELLED' WHERE id = :downloadId")
    suspend fun markDownloadCancelled(downloadId: Long)
    
    @Query("SELECT COUNT(*) FROM opds_downloads WHERE status = :downloading OR status = :pending")
    suspend fun getActiveDownloadCount(
        downloading: DownloadStatus = DownloadStatus.DOWNLOADING,
        pending: DownloadStatus = DownloadStatus.PENDING
    ): Int
    
    @Query("SELECT COUNT(*) FROM opds_downloads WHERE status = :completed")
    suspend fun getCompletedDownloadCount(
        completed: DownloadStatus = DownloadStatus.COMPLETED
    ): Int
    
    @Query("DELETE FROM opds_downloads WHERE status = :completed AND completedAt < :beforeTimestamp")
    suspend fun deleteOldCompletedDownloads(
        beforeTimestamp: Long,
        completed: DownloadStatus = DownloadStatus.COMPLETED
    )
    
    @Query("DELETE FROM opds_downloads WHERE status = :failed OR status = :cancelled")
    suspend fun clearFailedDownloads(
        failed: DownloadStatus = DownloadStatus.FAILED,
        cancelled: DownloadStatus = DownloadStatus.CANCELLED
    )
}
