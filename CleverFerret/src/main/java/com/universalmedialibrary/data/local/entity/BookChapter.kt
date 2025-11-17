package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * BookChapter entity - stores individual chapters for books.
 * Inspired by Legado's chapter management system.
 */
@Serializable
@Entity(
    tableName = "book_chapters",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["bookId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["bookId"]),
        Index(value = ["chapterIndex"])
    ]
)
data class BookChapter(
    @PrimaryKey(autoGenerate = true)
    val chapterId: Long = 0,

    val bookId: Long,
    val chapterIndex: Int,
    val chapterName: String,
    val chapterUrl: String? = null,

    // Content
    val content: String? = null,
    val contentCached: Boolean = false,

    // Metadata
    val wordCount: Int = 0,
    val isVolume: Boolean = false,
    val isVip: Boolean = false,
    val isPay: Boolean = false,

    // Timestamps
    val updateTime: Long = System.currentTimeMillis(),
    val lastReadTime: Long? = null,

    // Reading Progress
    val readProgress: Float = 0f,
    val isRead: Boolean = false
)
