package com.universalmedialibrary.services.webfiction

import android.content.Context
import com.universalmedialibrary.data.local.entity.DownloadedStory
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.StoryUpdate
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.data.repository.StoryRepository
import com.universalmedialibrary.services.contentcreation.SimpleEpubCreator
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.withContext
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Enhanced Reddit Story Manager
 * - Downloads Reddit series (like "Out of Cruel Space")
 * - Generates EPUB files natively
 * - Automatically adds to library
 * - Tracks and auto-updates stories
 */
@Singleton
class RedditStoryManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val storyRepository: StoryRepository,
    private val mediaRepository: MediaRepository,
    private val libraryRepository: LibraryRepository
) {

    companion object {
        const val DEFAULT_LIBRARY_NAME = "Reddit Stories"
        const val REDDIT_SITE = "Reddit"
    }

    data class RedditSeriesConfig(
        val seriesName: String,
        val author: String,
        val subreddit: String = "HFY",
        val autoUpdate: Boolean = true
    )

    data class DownloadResult(
        val success: Boolean,
        val storyId: String? = null,
        val epubPath: String? = null,
        val mediaItemId: Long? = null,
        val chapters: Int = 0,
        val errorMessage: String? = null
    )

    data class UpdateResult(
        val success: Boolean,
        val newChapters: Int = 0,
        val totalChapters: Int = 0,
        val errorMessage: String? = null
    )

    private val downloader = RedditFanficDownloader()
    private val epubCreator = SimpleEpubCreator()
    
    @Inject
    lateinit var textSanitizer: com.universalmedialibrary.utils.TextSanitizer

    /**
     * Download a Reddit series and add it to the library
     */
    suspend fun downloadAndAddToLibrary(config: RedditSeriesConfig): DownloadResult = withContext(Dispatchers.IO) {
        try {
            // Check if story already exists
            val existingStory = storyRepository.getStoryBySiteId(
                REDDIT_SITE,
                "${config.subreddit}:${config.seriesName}"
            )

            if (existingStory != null) {
                // Story already exists, check for updates instead
                return@withContext DownloadResult(
                    success = false,
                    storyId = existingStory.id,
                    errorMessage = "Story already exists. Use updateStory() to check for new chapters."
                )
            }

            // Download series from Reddit
            val series = downloader.fetchSeries(
                seriesQuery = config.seriesName,
                subreddit = config.subreddit,
                author = config.author.takeIf { it.isNotEmpty() }
            )

            if (series.chapters.isEmpty()) {
                return@withContext DownloadResult(
                    success = false,
                    errorMessage = "No chapters found for ${config.seriesName}"
                )
            }

            // Refine chapters if necessary (e.g. fetch titles from comments)
            // Note: This is a potential bottleneck, but necessary for "Out of Cruel Space" quality
            // We rely on downloader's internal logic which now uses heuristics or deeper fetching if needed.
            // But fetchSeries only gets the list. The CONTENT is in `html`.
            // If `html` was built from `selftext` in `fetchSeries`, `downloadPostBody` was NOT called.
            // If we suspect titles are missing (e.g. generic "Chapter X"), we could force a re-fetch here.
            // However, for now we trust `fetchSeries`'s heuristic logic.

            // Generate EPUB
            val epubResult = generateEpub(series, config)
            if (!epubResult.success) {
                return@withContext DownloadResult(
                    success = false,
                    errorMessage = epubResult.errorMessage
                )
            }

            // Get or create library
            val library = getOrCreateRedditLibrary()

            // Add to library as MediaItem
            val mediaItem = createMediaItem(
                library.libraryId,
                epubResult.epubPath!!,
                config.seriesName,
                config.author,
                series.chapters.size
            )
            val mediaItemId = mediaRepository.createMediaItem(mediaItem)

            // Add metadata
            val metadata = MetadataCommon(
                itemId = mediaItemId,
                title = config.seriesName,
                summary = "Reddit series from r/${config.subreddit} by ${config.author} - ${series.chapters.size} chapters"
            )
            mediaRepository.saveCommonMetadata(metadata)

            // Track in StoryRepository
            val storyId = trackDownloadedStory(
                config = config,
                epubPath = epubResult.epubPath,
                chapters = series.chapters.size,
                mediaItemId = mediaItemId
            )

            // Record initial download
            storyRepository.insertUpdate(
                StoryUpdate(
                    storyId = storyId,
                    updateType = "INITIAL_DOWNLOAD",
                    previousChapters = 0,
                    newChapters = series.chapters.size,
                    updateDescription = "Initial download: ${series.chapters.size} chapters",
                    timestamp = System.currentTimeMillis(),
                    wasSuccessful = true
                )
            )

            DownloadResult(
                success = true,
                storyId = storyId,
                epubPath = epubResult.epubPath,
                mediaItemId = mediaItemId,
                chapters = series.chapters.size
            )

        } catch (e: Exception) {
            DownloadResult(
                success = false,
                errorMessage = "Failed to download series: ${e.message}"
            )
        }
    }

    /**
     * Check for updates and update existing story
     */
    suspend fun updateStory(storyId: String): UpdateResult = withContext(Dispatchers.IO) {
        try {
            val story = storyRepository.getStoryById(storyId)
                ?: return@withContext UpdateResult(
                    success = false,
                    errorMessage = "Story not found: $storyId"
                )

            // Parse story info
            val parts = story.siteStoryId.split(":")
            if (parts.size != 2) {
                return@withContext UpdateResult(
                    success = false,
                    errorMessage = "Invalid story ID format"
                )
            }

            val subreddit = parts[0]
            val seriesName = parts[1]

            // Fetch current chapters
            val series = downloader.fetchSeries(
                seriesQuery = seriesName,
                subreddit = subreddit,
                author = story.author.takeIf { it.isNotEmpty() }
            )

            val currentChapters = series.chapters.size
            val previousChapters = story.lastKnownChapters
            val newChapterCount = currentChapters - previousChapters

            if (newChapterCount <= 0) {
                // No updates
                storyRepository.markUpdateStatus(storyId, hasUpdates = false)
                return@withContext UpdateResult(
                    success = true,
                    newChapters = 0,
                    totalChapters = currentChapters
                )
            }

            // Generate new EPUB with all chapters
            val config = RedditSeriesConfig(
                seriesName = seriesName,
                author = story.author,
                subreddit = subreddit
            )
            val epubResult = generateEpub(series, config)
            if (!epubResult.success) {
                return@withContext UpdateResult(
                    success = false,
                    errorMessage = epubResult.errorMessage
                )
            }

            // Delete old EPUB file
            val oldFile = File(story.epubFilePath)
            if (oldFile.exists()) {
                oldFile.delete()
            }

            // Update story record
            val updatedStory = story.copy(
                totalChapters = currentChapters,
                lastKnownChapters = currentChapters,
                lastUpdated = System.currentTimeMillis(),
                lastChecked = System.currentTimeMillis(),
                lastDownloaded = System.currentTimeMillis(),
                epubFilePath = epubResult.epubPath!!,
                fileSize = File(epubResult.epubPath).length(),
                hasUpdates = false
            )
            storyRepository.updateStory(updatedStory)

            // Update MediaItem
            val mediaItem = mediaRepository.getMediaItemById(story.id.hashCode().toLong())
            if (mediaItem != null) {
                val updatedMediaItem = mediaItem.copy(
                    filePath = epubResult.epubPath,
                    fileSize = File(epubResult.epubPath).length(),
                    lastModified = System.currentTimeMillis()
                )
                mediaRepository.updateMediaItem(updatedMediaItem)
            }

            // Record update
            storyRepository.insertUpdate(
                StoryUpdate(
                    storyId = storyId,
                    updateType = "CHAPTER_UPDATE",
                    previousChapters = previousChapters,
                    newChapters = currentChapters,
                    updateDescription = "Added $newChapterCount new chapters",
                    timestamp = System.currentTimeMillis(),
                    wasSuccessful = true
                )
            )

            UpdateResult(
                success = true,
                newChapters = newChapterCount,
                totalChapters = currentChapters
            )

        } catch (e: Exception) {
            UpdateResult(
                success = false,
                errorMessage = "Failed to update story: ${e.message}"
            )
        }
    }

    /**
     * Check all tracked stories for updates
     */
    suspend fun updateAllStories(): List<UpdateResult> = withContext(Dispatchers.IO) {
        val stories = storyRepository.getAllStories().first()
        val results = mutableListOf<UpdateResult>()

        for (story in stories) {
            if (!story.autoUpdateEnabled || story.isCompleted) {
                continue
            }

            val result = updateStory(story.id)
            results.add(result)

            // Rate limiting
            kotlinx.coroutines.delay(2000)
        }

        results
    }

    /**
     * Get all tracked Reddit stories
     */
    fun getAllTrackedStories(): Flow<List<DownloadedStory>> {
        return storyRepository.getAllStories()
    }

    /**
     * Get stories that have updates available
     */
    fun getStoriesWithUpdates(): Flow<List<DownloadedStory>> {
        return storyRepository.getStoriesWithUpdates()
    }

    /**
     * Remove a tracked story (and optionally delete the EPUB)
     */
    suspend fun removeStory(storyId: String, deleteFile: Boolean = false): Boolean = withContext(Dispatchers.IO) {
        try {
            val story = storyRepository.getStoryById(storyId) ?: return@withContext false

            if (deleteFile) {
                val file = File(story.epubFilePath)
                if (file.exists()) {
                    file.delete()
                }
            }

            storyRepository.deleteStory(story)
            true
        } catch (e: Exception) {
            false
        }
    }

    // Private helper methods

    private suspend fun generateEpub(
        series: RedditFanficDownloader.SeriesResult,
        config: RedditSeriesConfig
    ): EpubGenerationResult {
        return try {
            val outputDir = File(context.getExternalFilesDir(null), "reddit_stories")
            if (!outputDir.exists()) outputDir.mkdirs()

            val safeFileName = config.seriesName
                .replace(Regex("[^a-zA-Z0-9\\s]"), "")
                .replace("\\s+".toRegex(), "_")
            val timestamp = System.currentTimeMillis()
            val outputFile = File(outputDir, "${safeFileName}_$timestamp.epub")

            val chapters = series.chapters.mapIndexed { index, ch ->
                // Sanitize content
                val cleanContent = textSanitizer.sanitize(ch.html)
                
                SimpleEpubCreator.Chapter(
                    title = if (ch.number > 0) {
                        "Chapter ${ch.number}" // Clean title for TOC
                    } else {
                        ch.title
                    },
                    content = cleanContent,
                    id = "chapter_${ch.number}_${index}"
                )
            }

            val metadata = SimpleEpubCreator.EpubMetadata(
                title = config.seriesName,
                author = config.author ?: config.subreddit,
                description = "Reddit series from r/${config.subreddit} - ${chapters.size} chapters",
                publisher = "CleverFerret - Reddit Stories"
            )

            epubCreator.createEpub(outputFile, metadata, chapters)

            EpubGenerationResult(
                success = true,
                epubPath = outputFile.absolutePath
            )
        } catch (e: Exception) {
            EpubGenerationResult(
                success = false,
                errorMessage = "Failed to generate EPUB: ${e.message}"
            )
        }
    }

    private fun createMediaItem(
        libraryId: Long,
        filePath: String,
        title: String,
        author: String,
        chapters: Int
    ): MediaItem {
        val file = File(filePath)
        return MediaItem(
            itemId = 0, // Auto-generated
            libraryId = libraryId,
            filePath = filePath,
            fileName = file.name,
            fileExtension = file.extension,
            fileSize = file.length(),
            mediaType = "BOOK",
            mimeType = "application/epub+zip",
            dateAdded = System.currentTimeMillis(),
            lastModified = System.currentTimeMillis(),
            isAvailable = true
        )
    }

    private suspend fun trackDownloadedStory(
        config: RedditSeriesConfig,
        epubPath: String,
        chapters: Int,
        mediaItemId: Long
    ): String {
        val storyId = "${REDDIT_SITE}:${config.subreddit}:${config.seriesName}"
        val file = File(epubPath)

        val story = DownloadedStory(
            id = storyId,
            url = "https://www.reddit.com/r/${config.subreddit}/search?q=${config.seriesName}",
            title = config.seriesName,
            author = config.author,
            site = REDDIT_SITE,
            siteStoryId = "${config.subreddit}:${config.seriesName}",
            totalChapters = chapters,
            lastKnownChapters = chapters,
            lastUpdated = System.currentTimeMillis(),
            lastChecked = System.currentTimeMillis(),
            lastDownloaded = System.currentTimeMillis(),
            epubFilePath = epubPath,
            fileSize = file.length(),
            isCompleted = false,
            hasUpdates = false,
            autoUpdateEnabled = config.autoUpdate
        )

        storyRepository.insertStory(story)
        return storyId
    }

    private suspend fun getOrCreateRedditLibrary(): Library {
        // Look for existing Reddit library
        val libraries = libraryRepository.getLibrariesByType("BOOK").first()
        val existing = libraries.firstOrNull { it.name == DEFAULT_LIBRARY_NAME }
        if (existing != null) {
            return existing
        }

        // Create new library
        val libraryPath = File(context.getExternalFilesDir(null), "reddit_stories").absolutePath
        val library = Library(
            libraryId = 0,
            name = DEFAULT_LIBRARY_NAME,
            path = libraryPath,
            type = "BOOK",
            isActive = true,
            lastScanned = System.currentTimeMillis()
        )

        val libraryId = libraryRepository.createLibrary(library)
        return library.copy(libraryId = libraryId)
    }

    private data class EpubGenerationResult(
        val success: Boolean,
        val epubPath: String? = null,
        val errorMessage: String? = null
    )
}

/**
 * Predefined configurations for popular Reddit series
 */
object PopularRedditSeries {
    val OUT_OF_CRUEL_SPACE = RedditStoryManager.RedditSeriesConfig(
        seriesName = "Out of Cruel Space",
        author = "KyleKKent",
        subreddit = "HFY",
        autoUpdate = true
    )

    val ALL_CONFIGS = listOf(
        OUT_OF_CRUEL_SPACE
        // Add more popular series here
    )
}
