package com.universalmedialibrary.services.contentcreation

import com.universalmedialibrary.data.local.entity.DownloadedStory
import com.universalmedialibrary.data.local.entity.StoryUpdate
import com.universalmedialibrary.data.repository.StoryRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class StoryUpdateManager @Inject constructor(
    private val storyRepository: StoryRepository
) {

    data class TrackedStory(
        val id: String,
        val url: String,
        val title: String,
        val author: String,
        val totalChapters: Int,
        val lastKnownChapters: Int,
        val epubFilePath: String
    )

    data class UpdateCheck(
        val hasUpdates: Boolean,
        val newChapters: Int = 0,
        val error: String? = null
    )

    data class UpdateResult(
        val success: Boolean,
        val updatedStory: TrackedStory? = null,
        val error: String? = null
    )

    suspend fun checkStoryExists(url: String): TrackedStory? {
        val story = storyRepository.getStoryByUrl(url)
        return story?.toTrackedStory()
    }

    suspend fun checkForUpdates(story: TrackedStory): UpdateCheck = withContext(Dispatchers.IO) {
        return@withContext try {
            // Fetch the story page to check current chapter count
            val currentChapters = fetchCurrentChapterCount(story.url)

            if (currentChapters > story.lastKnownChapters) {
                // Mark as having updates
                storyRepository.markUpdateStatus(story.id, hasUpdates = true)

                UpdateCheck(
                    hasUpdates = true,
                    newChapters = currentChapters - story.lastKnownChapters
                )
            } else {
                // No updates
                storyRepository.markUpdateStatus(story.id, hasUpdates = false)
                UpdateCheck(hasUpdates = false)
            }
        } catch (e: Exception) {
            storyRepository.recordError(story.id, "Update check failed: ${e.message}")
            UpdateCheck(hasUpdates = false, error = e.message)
        }
    }

    suspend fun updateStory(story: TrackedStory): UpdateResult {
        return try {
            // This would trigger a re-download of the story
            // For now, return a placeholder
            UpdateResult(
                success = false,
                error = "Story update re-download not yet implemented. Please use the converter directly."
            )
        } catch (e: Exception) {
            UpdateResult(success = false, error = e.message)
        }
    }

    suspend fun trackDownloadedStory(
        url: String,
        title: String,
        author: String,
        chapters: Int,
        filePath: String,
        site: String,
        siteStoryId: String
    ): String {
        val id = "$site-$siteStoryId"
        val file = File(filePath)

        val story = DownloadedStory(
            id = id,
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
            fileSize = if (file.exists()) file.length() else 0L,
            isCompleted = false,
            hasUpdates = false,
            autoUpdateEnabled = true
        )

        storyRepository.insertStory(story)

        // Record the initial download in update history
        val update = StoryUpdate(
            storyId = id,
            updateType = "INITIAL_DOWNLOAD",
            previousChapters = 0,
            newChapters = chapters,
            updateDescription = "Story downloaded with $chapters chapters",
            wasSuccessful = true
        )
        storyRepository.insertUpdate(update)

        return id
    }

    suspend fun markStoryComplete(storyId: String) {
        val story = storyRepository.getStoryById(storyId) ?: return
        storyRepository.updateStory(
            story.copy(
                isCompleted = true,
                autoUpdateEnabled = false
            )
        )
    }

    fun getAllStoriesFlow() = storyRepository.getAllStories()

    fun getStoriesWithUpdatesFlow() = storyRepository.getStoriesWithUpdates()

    suspend fun getStoriesNeedingUpdateCheck(hoursAgo: Int = 24): List<DownloadedStory> {
        val cutoffTime = System.currentTimeMillis() - (hoursAgo * 3600000L)
        return storyRepository.getStoriesNeedingUpdateCheck(cutoffTime)
    }

    /**
     * Fetch current chapter count from story URL
     * This is a helper method that should be implemented per-site
     */
    private suspend fun fetchCurrentChapterCount(url: String): Int {
        return try {
            val doc = Jsoup.connect(url).get()

            when {
                url.contains("archiveofourown.org") -> {
                    // AO3: Look for chapter count in metadata
                    doc.select("dd.chapters").first()?.text()?.split("/")?.firstOrNull()?.toIntOrNull() ?: 1
                }
                url.contains("fanfiction.net") -> {
                    // FFNet: Look for chapter select dropdown
                    doc.select("select#chap_select option").size
                }
                url.contains("wattpad.com") -> {
                    // Wattpad: Look for story parts
                    doc.select("div.story-parts ul li").size
                }
                else -> {
                    // Generic: try to find chapter indicators
                    doc.select("select option, .chapter, [class*=chapter]").size.coerceAtLeast(1)
                }
            }
        } catch (e: Exception) {
            throw Exception("Failed to fetch chapter count: ${e.message}")
        }
    }

    /**
     * Convert DownloadedStory entity to TrackedStory data class
     */
    private fun DownloadedStory.toTrackedStory(): TrackedStory {
        return TrackedStory(
            id = id,
            url = url,
            title = title,
            author = author,
            totalChapters = totalChapters,
            lastKnownChapters = lastKnownChapters,
            epubFilePath = epubFilePath
        )
    }
}
