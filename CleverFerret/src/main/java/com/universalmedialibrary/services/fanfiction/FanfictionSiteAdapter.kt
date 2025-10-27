package com.universalmedialibrary.services.fanfiction

import com.universalmedialibrary.services.fanfiction.models.Chapter
import com.universalmedialibrary.services.fanfiction.models.StoryMetadata
import com.universalmedialibrary.services.fanfiction.models.UpdateInfo

/**
 * Interface for fanfiction site adapters
 * Each supported site implements this interface
 */
interface FanfictionSiteAdapter {
    /**
     * Name of the site (e.g., "Archive of Our Own")
     */
    val siteName: String
    
    /**
     * Base URL of the site
     */
    val baseUrl: String
    
    /**
     * Check if this adapter can handle the given URL
     */
    fun canHandle(url: String): Boolean
    
    /**
     * Extract metadata from a story URL
     */
    suspend fun extractMetadata(url: String): Result<StoryMetadata>
    
    /**
     * Download all chapters from a story
     * @param progressCallback Called with (currentChapter, totalChapters, statusMessage)
     */
    suspend fun downloadChapters(
        url: String,
        progressCallback: (Int, Int, String) -> Unit = { _, _, _ -> }
    ): Result<List<Chapter>>
    
    /**
     * Check if there are updates available for a story
     */
    suspend fun checkForUpdates(
        storyId: String,
        lastChapter: Int
    ): Result<UpdateInfo>
    
    /**
     * Extract story ID from URL
     */
    fun extractStoryId(url: String): String?
}
