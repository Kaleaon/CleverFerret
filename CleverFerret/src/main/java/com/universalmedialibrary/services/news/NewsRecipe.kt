package com.universalmedialibrary.services.news

import com.universalmedialibrary.data.local.entity.BookSource
import kotlinx.serialization.Serializable

/**
 * Configuration for a News Recipe (Calibre-style).
 * Defines how to fetch and aggregate news from RSS/Atom feeds into an eBook.
 */
@Serializable
data class NewsRecipe(
    val id: String,
    val title: String,
    val category: String = "News",
    val description: String = "",
    val coverUrl: String? = null,
    val feeds: List<NewsFeed>,
    
    // Fetching rules
    val oldestArticleDays: Int = 7,
    val maxArticlesPerFeed: Int = 30,
    val autoCleanup: Boolean = true, // Use readability mode
    
    // Advanced rules (similar to Calibre)
    val keepOnlyTags: List<String> = emptyList(), // CSS selectors
    val removeTags: List<String> = emptyList(), // CSS selectors
    val userAgent: String = "Mozilla/5.0 (Compatible; CleverFerret/1.0)",
    
    // Scheduling
    val autoDownload: Boolean = false,
    val downloadIntervalHours: Int = 24,
    val lastDownloadTime: Long = 0
)

@Serializable
data class NewsFeed(
    val title: String,
    val url: String
)
