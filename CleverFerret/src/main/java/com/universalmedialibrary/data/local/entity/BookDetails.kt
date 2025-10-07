package com.universalmedialibrary.data.local.entity

/**
 * Combined data class for displaying book information in UI
 * Combines MediaItem, MetadataCommon, and MetadataBook
 */
data class BookDetails(
    val mediaItem: MediaItem,
    val metadata: MetadataCommon,
    val bookMetadata: MetadataBook? = null,
    val authorName: String? = null,
    val seriesName: String? = null
) {
    // Computed properties for easy access in UI
    val title: String get() = metadata.title
    val author: String get() = authorName ?: "Unknown"
    val dateAdded: Long get() = mediaItem.dateAdded
    val lastRead: Long? get() = mediaItem.lastAccessedDate
    val progress: Double get() = mediaItem.duration?.toDouble()?.let { d -> 
        if (d <= 0.0) 0.0 else ((mediaItem.playbackPosition ?: 0L).toDouble() / d).coerceIn(0.0, 1.0) 
    } ?: 0.0
    val rating: Double get() = metadata.userRating?.toDouble() ?: 0.0
    val fileSize: Long get() = mediaItem.fileSize
}
