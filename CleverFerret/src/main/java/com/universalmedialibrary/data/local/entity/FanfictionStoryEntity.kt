package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey
import androidx.room.TypeConverters
import com.universalmedialibrary.data.local.converters.StringListConverter

/**
 * Database entity for fanfiction stories
 */
@Entity(
    tableName = "fanfiction_stories",
    indices = [
        Index(value = ["sourceSite"]),
        Index(value = ["status"]),
        Index(value = ["dateAdded"])
    ]
)
@TypeConverters(StringListConverter::class)
data class FanfictionStoryEntity(
    @PrimaryKey
    val id: String,
    
    // Source information
    val sourceUrl: String,
    val sourceSite: String, // "Archive of Our Own", "FanFiction.Net", etc.
    
    // Basic metadata
    val title: String,
    val author: String,
    val authorUrl: String? = null,
    val summary: String,
    val rating: String? = null,
    val status: String, // IN_PROGRESS, COMPLETE, HIATUS, ABANDONED
    
    // Statistics
    val wordCount: Int,
    val chapterCount: Int,
    val lastChapterDownloaded: Int,
    
    // Dates
    val publishDate: Long? = null,
    val updateDate: Long? = null,
    val lastCheckedDate: Long,
    val dateAdded: Long = System.currentTimeMillis(),
    
    // Files
    val epubPath: String?,
    val coverPath: String? = null,
    
    // Tags and categories
    val warnings: List<String> = emptyList(),
    val fandoms: List<String> = emptyList(),
    val characters: List<String> = emptyList(),
    val relationships: List<String> = emptyList(),
    val tags: List<String> = emptyList(),
    val language: String = "English"
)
