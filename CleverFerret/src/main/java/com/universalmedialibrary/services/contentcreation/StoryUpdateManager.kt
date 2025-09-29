package com.universalmedialibrary.services.contentcreation

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.entity.DownloadedStory
import com.universalmedialibrary.data.local.entity.StoryUpdate
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import java.io.File
import java.security.MessageDigest
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Story Update Manager
 * 
 * Handles automatic detection and updating of previously downloaded stories.
 * Inspired by Calibre's FanFiction downloader plugin which:
 * - Tracks story metadata and update timestamps
 * - Detects new chapters by comparing chapter counts
 * - Manages re-downloading of updated content
 * - Maintains update history and error handling
 */
@Singleton
class StoryUpdateManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val database: AppDatabase
) {
    
    private val cleverFerretDatabase = database
    // Temporarily disabled due to missing DAOs in AppDatabase
    // private val storyDao = database.downloadedStoryDao()
    // private val updateDao = database.storyUpdateDao()
    
    data class UpdateCheckResult(
        val hasUpdates: Boolean,
        val newChapters: Int = 0,
        val totalChapters: Int = 0,
        val lastUpdated: Long = 0,
        val isCompleted: Boolean = false,
        val error: String? = null
    )
    
    data class UpdateResult(
        val success: Boolean,
        val updatedStory: DownloadedStory? = null,
        val newChapters: Int = 0,
        val error: String? = null
    )
    
    // Internal conversion result for unified handling
    private data class UpdateConversionResult(
        val success: Boolean,
        val filePath: String? = null,
        val title: String? = null,
        val author: String? = null,
        val chapters: Int = 0,
        val errorMessage: String? = null
    )
    
    /**
     * Check if a story needs updating by URL
     * Returns existing story if found, null if new
     */
    suspend fun checkStoryExists(url: String): DownloadedStory? {
        return storyDao.getStoryByUrl(url)
    }
    
    /**
     * Store a newly downloaded story in the tracking database
     */
    suspend fun trackDownloadedStory(
        url: String,
        title: String,
        author: String,
        chapters: Int,
        filePath: String,
        site: String,
        siteStoryId: String,
        description: String? = null,
        fandom: String? = null
    ): String {
        val storyId = generateStoryId(url, site, siteStoryId)
        val fileSize = File(filePath).length()
        val checksum = calculateFileChecksum(filePath)
        
        val story = DownloadedStory(
            id = storyId,
            url = url,
            title = title,
            author = author,
            site = site,
            siteStoryId = siteStoryId,
            totalChapters = chapters,
            lastKnownChapters = chapters,
            lastUpdated = System.currentTimeMillis(),
            lastChecked = System.currentTimeMillis(),
            lastDownloaded = System.currentTimeMillis(),
            epubFilePath = filePath,
            fileSize = fileSize,
            checksum = checksum,
            isCompleted = false, // Assume incomplete until proven otherwise
            hasUpdates = false,
            autoUpdateEnabled = true,
            description = description,
            fandom = fandom
        )
        
        storyDao.insertStory(story)
        
        // Record initial download
        val update = StoryUpdate(
            storyId = storyId,
            updateType = "INITIAL_DOWNLOAD",
            previousChapters = 0,
            newChapters = chapters,
            updateDescription = "Story initially downloaded with $chapters chapters"
        )
        updateDao.insertUpdate(update)
        
        return storyId
    }
    
    /**
     * Check for updates to a specific story
     * Uses the same logic as Calibre's plugin for detecting changes
     */
    suspend fun checkForUpdates(story: DownloadedStory): UpdateCheckResult = withContext(Dispatchers.IO) {
        try {
            when (story.site) {
                "ao3" -> checkAO3Updates(story)
                "ffnet" -> checkFFNetUpdates(story)
                "wattpad" -> checkWattpadUpdates(story)
                else -> checkGenericUpdates(story)
            }
        } catch (e: Exception) {
            UpdateCheckResult(
                hasUpdates = false,
                error = "Failed to check for updates: ${e.message}"
            )
        }
    }
    
    /**
     * Update a story that has detected changes
     */
    suspend fun updateStory(story: DownloadedStory): UpdateResult = withContext(Dispatchers.IO) {
        try {
            val result = when (story.site) {
                "ao3", "ffnet", "wattpad" -> {
                    // Create converter without update manager to avoid circular dependency
                    val fanficConverter = FanfictionToEpubConverterBasic(context)
                    val fanficResult = fanficConverter.convertFanfictionToEpub(story.url)
                    // Convert fanfic result to common format
                    UpdateConversionResult(
                        success = fanficResult.success,
                        filePath = fanficResult.filePath,
                        title = fanficResult.title,
                        author = fanficResult.author,
                        chapters = fanficResult.chapters,
                        errorMessage = fanficResult.errorMessage
                    )
                }
                else -> {
                    val newsConverter = NewsToEpubConverter(context)
                    val newsResult = newsConverter.convertNewsToEpub(story.url)
                    // Convert news result to common format
                    UpdateConversionResult(
                        success = newsResult.success,
                        filePath = newsResult.filePath,
                        title = newsResult.title,
                        author = newsResult.author,
                        chapters = 1, // News articles are single chapter
                        errorMessage = newsResult.errorMessage
                    )
                }
            }
            
            if (result.success && result.filePath != null) {
                val oldFilePath = story.epubFilePath
                val newFileSize = File(result.filePath).length()
                val newChecksum = calculateFileChecksum(result.filePath)
                
                val updatedStory = story.copy(
                    totalChapters = result.chapters,
                    lastKnownChapters = result.chapters,
                    lastUpdated = System.currentTimeMillis(),
                    lastChecked = System.currentTimeMillis(),
                    lastDownloaded = System.currentTimeMillis(),
                    epubFilePath = result.filePath,
                    fileSize = newFileSize,
                    checksum = newChecksum,
                    hasUpdates = false,
                    isCompleted = detectStoryCompletion(result.title ?: story.title, result.chapters),
                    lastError = null,
                    failureCount = 0
                )
                
                storyDao.updateStory(updatedStory)
                
                // Delete old file
                try {
                    File(oldFilePath).delete()
                } catch (e: Exception) {
                    // Ignore file deletion errors
                }
                
                // Record update
                val update = StoryUpdate(
                    storyId = story.id,
                    updateType = if (result.chapters > story.lastKnownChapters) "NEW_CHAPTER" else "CONTENT_UPDATE",
                    previousChapters = story.lastKnownChapters,
                    newChapters = result.chapters,
                    updateDescription = "Updated from ${story.lastKnownChapters} to ${result.chapters} chapters"
                )
                updateDao.insertUpdate(update)
                
                UpdateResult(
                    success = true,
                    updatedStory = updatedStory,
                    newChapters = result.chapters - story.lastKnownChapters
                )
            } else {
                storyDao.recordError(story.id, result.errorMessage ?: "Unknown update error")
                UpdateResult(
                    success = false,
                    error = result.errorMessage
                )
            }
            
        } catch (e: Exception) {
            storyDao.recordError(story.id, e.message ?: "Update failed")
            UpdateResult(
                success = false,
                error = e.message
            )
        }
    }
    
    /**
     * Check for updates on all eligible stories
     * Respects rate limiting and error handling like Calibre's plugin
     */
    suspend fun checkAllStoriesForUpdates(): List<DownloadedStory> {
        val cutoffTime = System.currentTimeMillis() - TimeUnit.HOURS.toMillis(6) // Check every 6 hours
        val storiesNeedingCheck = storyDao.getStoriesNeedingUpdateCheck(cutoffTime)
        val updatedStories = mutableListOf<DownloadedStory>()
        
        for (story in storiesNeedingCheck) {
            try {
                val updateCheck = checkForUpdates(story)
                
                if (updateCheck.hasUpdates && updateCheck.error == null) {
                    storyDao.markUpdateStatus(story.id, true)
                    val updatedStory = story.copy(hasUpdates = true)
                    updatedStories.add(updatedStory)
                } else {
                    storyDao.markUpdateStatus(story.id, false)
                }
                
                updateCheck.error?.let { error ->
                    storyDao.recordError(story.id, error)
                }
                
                // Rate limiting - wait 1 second between checks to be respectful
                kotlinx.coroutines.delay(1000)
                
            } catch (e: Exception) {
                storyDao.recordError(story.id, e.message ?: "Update check failed")
            }
        }
        
        return updatedStories
    }
    
    // Private helper methods
    
    private suspend fun checkAO3Updates(story: DownloadedStory): UpdateCheckResult {
        val workId = Regex("works/(\\d+)").find(story.url)?.groupValues?.get(1) ?: return UpdateCheckResult(false, error = "Invalid AO3 URL")
        val fullWorkUrl = "https://archiveofourown.org/works/$workId?view_entire_work=true"
        val document = Jsoup.connect(fullWorkUrl).get()
        
        val chapterElements = document.select("#chapters .chapter")
        val totalChapters = if (chapterElements.isEmpty()) 1 else chapterElements.size
        
        // Check if story is marked as complete
        val isCompleted = document.select(".work.meta .status").text().contains("Complete")
        
        // Try to get last updated date from AO3
        val lastUpdatedElement = document.select(".work.meta .status + p")
        val hasUpdates = totalChapters > story.lastKnownChapters
        
        return UpdateCheckResult(
            hasUpdates = hasUpdates,
            newChapters = totalChapters - story.lastKnownChapters,
            totalChapters = totalChapters,
            lastUpdated = System.currentTimeMillis(), // AO3 doesn't provide easily parseable timestamps
            isCompleted = isCompleted
        )
    }
    
    private suspend fun checkFFNetUpdates(story: DownloadedStory): UpdateCheckResult {
        val document = Jsoup.connect(story.url).get()
        val chapterSelect = document.select("#chap_select option")
        val totalChapters = if (chapterSelect.size <= 1) 1 else chapterSelect.size
        
        // FF.Net shows completion status in the story info
        val storyInfo = document.select("#profile_top").text()
        val isCompleted = storyInfo.contains("Complete")
        
        val hasUpdates = totalChapters > story.lastKnownChapters
        
        return UpdateCheckResult(
            hasUpdates = hasUpdates,
            newChapters = totalChapters - story.lastKnownChapters,
            totalChapters = totalChapters,
            lastUpdated = System.currentTimeMillis(),
            isCompleted = isCompleted
        )
    }
    
    private suspend fun checkWattpadUpdates(story: DownloadedStory): UpdateCheckResult {
        // Wattpad is more complex and would require authentication for full story access
        // For now, just check if the page is still accessible
        val document = Jsoup.connect(story.url).get()
        val title = document.select("h1").first()?.text()
        
        return UpdateCheckResult(
            hasUpdates = false, // Wattpad updates are hard to detect without auth
            totalChapters = story.lastKnownChapters,
            lastUpdated = System.currentTimeMillis(),
            isCompleted = false
        )
    }
    
    private suspend fun checkGenericUpdates(story: DownloadedStory): UpdateCheckResult {
        // For news articles and generic content, we can check if content has changed
        val document = Jsoup.connect(story.url).get()
        val currentContent = document.html()
        val contentHash = MessageDigest.getInstance("MD5").digest(currentContent.toByteArray()).joinToString("") { "%02x".format(it) }
        
        val hasUpdates = story.checksum != null && contentHash != story.checksum
        
        return UpdateCheckResult(
            hasUpdates = hasUpdates,
            totalChapters = 1,
            lastUpdated = System.currentTimeMillis(),
            isCompleted = true // News articles don't have ongoing updates typically
        )
    }
    
    private fun generateStoryId(url: String, site: String, siteStoryId: String): String {
        return "${site}_${siteStoryId}_${url.hashCode().toString().replace("-", "")}"
    }
    
    private fun calculateFileChecksum(filePath: String): String {
        return try {
            val file = File(filePath)
            val digest = MessageDigest.getInstance("MD5")
            file.inputStream().use { input ->
                val buffer = ByteArray(8192)
                var bytes = input.read(buffer)
                while (bytes != -1) {
                    digest.update(buffer, 0, bytes)
                    bytes = input.read(buffer)
                }
            }
            digest.digest().joinToString("") { "%02x".format(it) }
        } catch (e: Exception) {
            ""
        }
    }
    
    private fun detectStoryCompletion(title: String, chapters: Int): Boolean {
        val completionKeywords = listOf("complete", "finished", "ended", "final chapter", "epilogue")
        val titleLower = title.lowercase()
        return completionKeywords.any { titleLower.contains(it) }
    }
}