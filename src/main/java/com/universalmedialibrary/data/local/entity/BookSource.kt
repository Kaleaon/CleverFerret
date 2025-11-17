package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.TypeConverters
import com.universalmedialibrary.data.local.converters.StringListConverter
import kotlinx.serialization.Serializable

/**
 * BookSource entity - inspired by Legado's custom source system
 * Allows users to add custom online book sources with flexible rule-based content extraction
 */
@Serializable
@Entity(tableName = "book_sources")
@TypeConverters(StringListConverter::class)
data class BookSource(
    @PrimaryKey(autoGenerate = true)
    val sourceId: Long = 0,
    
    // Basic Information
    val sourceName: String,
    val sourceUrl: String,
    val sourceGroup: String? = null,
    val sourceType: BookSourceType = BookSourceType.TEXT,
    
    // Configuration
    val enabled: Boolean = true,
    val enabledExplore: Boolean = true,
    val customOrder: Int = 0,
    val weight: Int = 0,
    
    // Network Configuration
    val header: String? = null,
    val loginUrl: String? = null,
    val loginCheckJs: String? = null,
    val enabledCookieJar: Boolean = true,
    val concurrentRate: String? = null,
    
    // JavaScript Support
    val jsLib: String? = null,
    
    // Content Rules (stored as JSON)
    val searchUrl: String? = null,
    val searchRule: String? = null, // JSON string
    val exploreUrl: String? = null,
    val exploreRule: String? = null, // JSON string
    val bookInfoRule: String? = null, // JSON string
    val tocRule: String? = null, // JSON string (Table of Contents)
    val contentRule: String? = null, // JSON string
    
    // Metadata
    val bookSourceComment: String? = null,
    val lastUpdateTime: Long = System.currentTimeMillis(),
    val respondTime: Long = 180000L,
    
    // Pattern matching
    val bookUrlPattern: String? = null,
    val coverDecodeJs: String? = null
)

enum class BookSourceType {
    TEXT,      // Regular text books
    AUDIO,     // Audiobooks
    IMAGE,     // Comics/Manga
    FILE       // Downloadable files
}

/**
 * Search rule for finding books
 */
@Serializable
data class SearchRule(
    val url: String,
    val method: String = "GET",
    val charset: String = "UTF-8",
    val bookList: String,
    val name: String,
    val author: String? = null,
    val coverUrl: String? = null,
    val intro: String? = null,
    val bookUrl: String,
    val kind: String? = null
)

/**
 * Book info rule for extracting book details
 */
@Serializable
data class BookInfoRule(
    val init: String? = null,
    val name: String,
    val author: String? = null,
    val intro: String? = null,
    val coverUrl: String? = null,
    val kind: String? = null,
    val lastChapter: String? = null,
    val tocUrl: String? = null,
    val wordCount: String? = null,
    val canReName: String? = null
)

/**
 * Table of Contents rule
 */
@Serializable
data class TocRule(
    val chapterList: String,
    val chapterName: String,
    val chapterUrl: String,
    val isVolume: String? = null,
    val updateTime: String? = null,
    val isVip: String? = null,
    val isPay: String? = null
)

/**
 * Content extraction rule
 */
@Serializable
data class ContentRule(
    val content: String,
    val nextContentUrl: String? = null,
    val webJs: String? = null,
    val sourceRegex: String? = null,
    val replaceRegex: String? = null,
    val imageStyle: String? = null,
    val payAction: String? = null
)