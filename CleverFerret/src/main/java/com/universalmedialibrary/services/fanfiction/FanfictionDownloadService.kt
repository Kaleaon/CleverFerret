package com.universalmedialibrary.services.fanfiction

import android.content.Context
import com.universalmedialibrary.data.local.dao.FanfictionDao
import com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
import com.universalmedialibrary.services.epub.EpubCreatorService
import com.universalmedialibrary.services.fanfiction.adapters.AO3Adapter
import com.universalmedialibrary.services.fanfiction.adapters.FFNAdapter
import com.universalmedialibrary.services.fanfiction.adapters.RoyalRoadAdapter
import com.universalmedialibrary.services.fanfiction.models.StoryMetadata
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.util.UUID
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for downloading and managing fanfiction stories
 */
@Singleton
class FanfictionDownloadService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val ao3Adapter: AO3Adapter,
    private val ffnAdapter: FFNAdapter,
    private val royalRoadAdapter: RoyalRoadAdapter,
    private val epubCreator: EpubCreatorService,
    private val fanfictionDao: FanfictionDao
) {
    
    private val adapters = listOf(ao3Adapter, ffnAdapter, royalRoadAdapter)
    
    /**
     * Download a story from a URL
     * @param progressCallback Called with (currentChapter, totalChapters, statusMessage)
     */
    suspend fun downloadStory(
        url: String,
        progressCallback: (Int, Int, String) -> Unit = { _, _, _ -> }
    ): Result<StoryMetadata> = withContext(Dispatchers.IO) {
        try {
            // Find appropriate adapter
            val adapter = findAdapter(url)
                ?: return@withContext Result.failure(
                    IllegalArgumentException("Unsupported fanfiction site")
                )
            
            progressCallback(0, 0, "Extracting metadata from ${adapter.siteName}...")
            
            // Extract metadata
            val metadataResult = adapter.extractMetadata(url)
            if (metadataResult.isFailure) {
                return@withContext Result.failure(
                    metadataResult.exceptionOrNull() ?: Exception("Failed to extract metadata")
                )
            }
            val metadata = metadataResult.getOrThrow()
            
            // Download chapters
            progressCallback(0, metadata.chapterCount, "Starting download...")
            val chaptersResult = adapter.downloadChapters(url) { current, total, message ->
                progressCallback(current, total, message)
            }
            
            if (chaptersResult.isFailure) {
                return@withContext Result.failure(
                    chaptersResult.exceptionOrNull() ?: Exception("Failed to download chapters")
                )
            }
            val chapters = chaptersResult.getOrThrow()
            
            progressCallback(chapters.size, chapters.size, "Creating EPUB...")
            
            // Generate EPUB
            val epubPath = createEpub(metadata, chapters)
            
            // Save to database
            progressCallback(chapters.size, chapters.size, "Saving to library...")
            saveToDatabase(metadata, epubPath, chapters.size)
            
            progressCallback(chapters.size, chapters.size, "Download complete!")
            
            Result.success(metadata)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Check for updates on all in-progress stories
     */
    suspend fun checkAllForUpdates(): List<Pair<FanfictionStoryEntity, Int>> = 
        withContext(Dispatchers.IO) {
            val inProgressStories = fanfictionDao.getInProgressStories()
            val updates = mutableListOf<Pair<FanfictionStoryEntity, Int>>()
            
            inProgressStories.forEach { story ->
                val adapter = findAdapter(story.sourceUrl) ?: return@forEach
                val storyId = adapter.extractStoryId(story.sourceUrl) ?: return@forEach
                
                val updateResult = adapter.checkForUpdates(storyId, story.lastChapterDownloaded)
                if (updateResult.isSuccess) {
                    val updateInfo = updateResult.getOrThrow()
                    if (updateInfo.hasUpdates) {
                        updates.add(story to updateInfo.newChapters)
                    }
                }
                
                // Update last checked time
                fanfictionDao.updateLastChecked(story.id, System.currentTimeMillis())
            }
            
            updates
        }
    
    /**
     * Re-download a story to get new chapters
     */
    suspend fun updateStory(
        storyId: String,
        progressCallback: (Int, Int, String) -> Unit = { _, _, _ -> }
    ): Result<StoryMetadata> = withContext(Dispatchers.IO) {
        val story = fanfictionDao.getStoryById(storyId)
            ?: return@withContext Result.failure(Exception("Story not found"))
        
        downloadStory(story.sourceUrl, progressCallback)
    }
    
    private fun findAdapter(url: String): FanfictionSiteAdapter? {
        return adapters.find { it.canHandle(url) }
    }
    
    private suspend fun createEpub(
        metadata: StoryMetadata,
        chapters: List<com.universalmedialibrary.services.fanfiction.models.Chapter>
    ): String {
        val fanficDir = File(context.filesDir, "fanfiction")
        fanficDir.mkdirs()
        
        val filename = "${sanitizeFilename(metadata.title)}.epub"
        val epubFile = File(fanficDir, filename)
        
        // Create EPUB using our EPUB service
        epubCreator.createFanfictionEpub(
            title = metadata.title,
            author = metadata.author,
            chapters = chapters.map { chapter ->
                EpubCreatorService.EpubChapter(
                    title = chapter.title,
                    content = chapter.content
                )
            },
            metadata = mapOf(
                "source" to metadata.sourceSite,
                "sourceUrl" to metadata.sourceUrl,
                "rating" to (metadata.rating ?: ""),
                "summary" to metadata.summary,
                "fandoms" to metadata.fandoms.joinToString(", "),
                "characters" to metadata.characters.joinToString(", "),
                "tags" to metadata.tags.joinToString(", ")
            ),
            outputPath = epubFile.absolutePath
        )
        
        return epubFile.absolutePath
    }
    
    private suspend fun saveToDatabase(
        metadata: StoryMetadata,
        epubPath: String,
        chapterCount: Int
    ) {
        val entity = FanfictionStoryEntity(
            id = UUID.randomUUID().toString(),
            sourceUrl = metadata.sourceUrl,
            sourceSite = metadata.sourceSite,
            title = metadata.title,
            author = metadata.author,
            authorUrl = metadata.authorUrl,
            summary = metadata.summary,
            rating = metadata.rating,
            status = metadata.status.name,
            wordCount = metadata.wordCount,
            chapterCount = metadata.chapterCount,
            lastChapterDownloaded = chapterCount,
            publishDate = metadata.publishDate?.toEpochDay(),
            updateDate = metadata.updateDate?.toEpochDay(),
            lastCheckedDate = System.currentTimeMillis(),
            epubPath = epubPath,
            coverPath = null,
            warnings = metadata.warnings,
            fandoms = metadata.fandoms,
            characters = metadata.characters,
            relationships = metadata.relationships,
            tags = metadata.tags,
            language = metadata.language,
            dateAdded = System.currentTimeMillis()
        )
        
        fanfictionDao.insertStory(entity)
    }
    
    private fun sanitizeFilename(filename: String): String {
        return filename.replace(Regex("[^a-zA-Z0-9.-]"), "_")
            .take(100) // Limit length
    }
}
