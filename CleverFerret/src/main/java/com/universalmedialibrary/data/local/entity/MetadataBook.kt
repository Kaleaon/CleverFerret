package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey

/**
 * Book-specific metadata entity
 */
@Entity(
    tableName = "metadata_book",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ]
)
data class MetadataBook(
    @PrimaryKey
    val itemId: Long,

    val subtitle: String? = null,
    val publisher: String? = null,
    val isbn: String? = null,
    val isbn13: String? = null,
    val asin: String? = null,

    val pageCount: Int? = null,
    val wordCount: Int? = null,
    val chapterCount: Int? = null,

    val series: String? = null,
    val seriesIndex: Float? = null,

    val format: String? = null, // EPUB, PDF, MOBI, etc.
    val edition: String? = null,
    val printLength: Int? = null,

    val publicationDate: Long? = null,
    val firstPublishedDate: Long? = null,

    val readingProgress: Float = 0f, // 0.0 to 1.0
    val isRead: Boolean = false,
    val lastReadDate: Long? = null,
    val currentPage: Int = 0,
    val currentChapter: Int = 0,

    val averageRating: Float? = null,
    val ratingsCount: Int? = null,
    val reviewsCount: Int? = null
)
