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
    val reviewsCount: Int? = null,
    
    // Enhanced fields from badreads integration
    val bookmarked: Boolean = false, // Flag for quick access/favorites
    val shelf: String? = null, // currently-reading, read, to-read
    val notes: String? = null, // User's personal notes/review
    val additionalAuthors: String? = null, // Co-authors, editors, etc.
    val customCoverUrl: String? = null, // User-provided cover URL
    
    // Barcode scanning tracking
    val scannedViaBarcode: Boolean = false, // Track if added via ISBN scan
    val purchaseLinksShown: Boolean = false, // Track if user has seen purchase options
    val dateScanned: Long? = null // When the book was scanned
)
