package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * Entity tracking local disk caching state for remote media streams.
 */
@Serializable
@Entity(
    tableName = "media_cache_items",
    indices = [
        Index(value = ["remoteUri"]),
        Index(value = ["downloadState"]),
        Index(value = ["isPinned"]),
        Index(value = ["lastAccessed"])
    ]
)
data class MediaCacheItem(
    @PrimaryKey
    val itemId: Long,

    val remoteUri: String,
    val downloadUrl: String,
    val localPath: String,
    val fileSize: Long = 0L,
    val downloadedBytes: Long = 0L,

    val downloadState: String = DownloadState.QUEUED,
    val priority: String = DownloadPriority.NORMAL,
    val isPinned: Boolean = false,

    val lastAccessed: Long = System.currentTimeMillis(),
    val createdAt: Long = System.currentTimeMillis(),
    val errorMessage: String? = null
)

object DownloadState {
    const val QUEUED = "QUEUED"
    const val DOWNLOADING = "DOWNLOADING"
    const val CACHED = "CACHED"
    const val FAILED = "FAILED"
    const val CANCELLED = "CANCELLED"
}

object DownloadPriority {
    const val NORMAL = "NORMAL"
    const val HIGH = "HIGH"
}
