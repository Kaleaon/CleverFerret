package com.universalmedialibrary.data.local.model

import androidx.room.Embedded

/**
 * A data class that holds detailed information about a book, intended for display in the UI.
 * This class is typically populated by a query that joins multiple tables.
 *
 * @property mediaItem The core [MediaItem] entity, embedded with a "media_" prefix.
 * @property metadata The [MetadataCommon] entity, embedded with a "meta_" prefix.
 * @property authorName The name of the book's author.
 */
data class BookDetails(
    @Embedded(prefix = "media_") val mediaItem: MediaItem,
    @Embedded(prefix = "meta_") val metadata: MetadataCommon,
    val authorName: String?
)
