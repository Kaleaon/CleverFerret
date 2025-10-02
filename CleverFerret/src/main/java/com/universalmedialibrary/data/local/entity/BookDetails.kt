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
)
