package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index

/**
 * Entity for storing text highlights and annotations
 */
@Entity(
    tableName = "text_annotations", // Changed from "annotations" to avoid conflicts
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["chapterIndex"]),
        Index(value = ["dateCreated"])
    ]
)
data class TextAnnotation( // Renamed from Annotation to avoid Kotlin conflicts
    @PrimaryKey(autoGenerate = true)
    val annotationId: Long = 0,
    
    val itemId: Long,
    val chapterIndex: Int,
    val chapterTitle: String?,
    
    // Text selection information
    val startOffset: Int,
    val endOffset: Int,
    val selectedText: String,
    
    // Annotation details
    val highlightColor: String = "#FFFF00", // Yellow default
    val annotationType: String = "HIGHLIGHT", // HIGHLIGHT, NOTE, BOOKMARK
    val noteText: String? = null,
    
    // Context for better positioning
    val contextBefore: String? = null,
    val contextAfter: String? = null,
    
    // Metadata
    val dateCreated: Long = System.currentTimeMillis(),
    val dateModified: Long = System.currentTimeMillis(),
    val isDeleted: Boolean = false
)

/**
 * Entity for storing full-text search index
 */
@Entity(
    tableName = "search_index",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["chapterIndex"]),
        Index(value = ["searchText"])
    ]
)
data class SearchIndex(
    @PrimaryKey(autoGenerate = true)
    val indexId: Long = 0,
    
    val itemId: Long,
    val chapterIndex: Int,
    val chapterTitle: String?,
    
    // Searchable content
    val searchText: String, // Processed text for search
    val originalText: String, // Original text content
    
    // Position information
    val startOffset: Int,
    val endOffset: Int,
    
    // Metadata
    val dateIndexed: Long = System.currentTimeMillis()
)

/**
 * Entity for storing reading statistics
 */
@Entity(
    tableName = "reading_statistics",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["date"])
    ]
)
data class ReadingStatistics(
    @PrimaryKey(autoGenerate = true)
    val statisticsId: Long = 0,
    
    val itemId: Long,
    val date: Long, // Date as timestamp (day granularity)
    
    // Reading metrics
    val readingTimeMinutes: Int = 0,
    val pagesRead: Int = 0,
    val chaptersCompleted: Int = 0,
    val wordsRead: Int = 0,
    
    // Progress tracking
    val startProgress: Float = 0f,  // Progress at start of session
    val endProgress: Float = 0f,    // Progress at end of session
    
    // Metadata
    val sessionCount: Int = 1,
    val lastUpdated: Long = System.currentTimeMillis()
)