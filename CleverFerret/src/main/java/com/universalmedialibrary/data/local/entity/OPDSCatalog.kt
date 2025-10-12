package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * OPDS Catalog Entity
 * 
 * Stores user-added OPDS catalogs for browsing and downloading books.
 * 
 * OPDS (Open Publication Distribution System) is a syndication format for
 * electronic publications allowing users to browse, search, and download
 * books from various sources.
 * 
 * Popular OPDS catalogs:
 * - Project Gutenberg (70,000+ free books)
 * - Internet Archive
 * - Standard Ebooks
 * - Feedbooks
 * - O'Reilly
 * - And many more!
 */
@Entity(tableName = "opds_catalogs")
data class OPDSCatalog(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    /**
     * Catalog name (e.g., "Project Gutenberg")
     */
    val name: String,
    
    /**
     * Root URL of OPDS feed
     */
    val url: String,
    
    /**
     * Optional authentication username
     */
    val username: String? = null,
    
    /**
     * Optional authentication password (encrypted)
     */
    val password: String? = null,
    
    /**
     * Catalog description
     */
    val description: String? = null,
    
    /**
     * Icon URL for catalog
     */
    val iconUrl: String? = null,
    
    /**
     * Whether this is a default catalog (can't be deleted)
     */
    val isDefault: Boolean = false,
    
    /**
     * Whether catalog is currently enabled
     */
    val isEnabled: Boolean = true,
    
    /**
     * Last successful access timestamp
     */
    val lastAccessedAt: Long = 0,
    
    /**
     * Number of times catalog has been accessed
     */
    val accessCount: Int = 0,
    
    /**
     * OPDS version (1.2 or 2.0)
     */
    val opdsVersion: String = "1.2",
    
    /**
     * Search URL template (if catalog supports search)
     */
    val searchUrl: String? = null,
    
    /**
     * Creation timestamp
     */
    val createdAt: Long = System.currentTimeMillis(),
    
    /**
     * Last update timestamp
     */
    val updatedAt: Long = System.currentTimeMillis()
)

/**
 * Downloaded OPDS Publication
 * 
 * Tracks books downloaded from OPDS catalogs
 */
@Entity(tableName = "opds_downloads")
data class OPDSDownload(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    /**
     * Catalog ID this was downloaded from
     */
    val catalogId: Long,
    
    /**
     * Publication title
     */
    val title: String,
    
    /**
     * Authors
     */
    val authors: String,
    
    /**
     * Download URL
     */
    val downloadUrl: String,
    
    /**
     * Local file path after download
     */
    val localPath: String? = null,
    
    /**
     * Download status
     */
    val status: DownloadStatus = DownloadStatus.PENDING,
    
    /**
     * Download progress (0-100)
     */
    val progress: Int = 0,
    
    /**
     * File size in bytes
     */
    val fileSize: Long = 0,
    
    /**
     * Downloaded bytes
     */
    val downloadedBytes: Long = 0,
    
    /**
     * MIME type
     */
    val mimeType: String? = null,
    
    /**
     * Cover image URL
     */
    val coverUrl: String? = null,
    
    /**
     * Publication identifier
     */
    val identifier: String? = null,
    
    /**
     * Publisher
     */
    val publisher: String? = null,
    
    /**
     * Published date
     */
    val publishedDate: String? = null,
    
    /**
     * Language
     */
    val language: String? = null,
    
    /**
     * Description
     */
    val description: String? = null,
    
    /**
     * Created timestamp
     */
    val createdAt: Long = System.currentTimeMillis(),
    
    /**
     * Started download timestamp
     */
    val startedAt: Long? = null,
    
    /**
     * Completed download timestamp
     */
    val completedAt: Long? = null,
    
    /**
     * Error message if failed
     */
    val errorMessage: String? = null
)

enum class DownloadStatus {
    PENDING,
    DOWNLOADING,
    COMPLETED,
    FAILED,
    CANCELLED
}
