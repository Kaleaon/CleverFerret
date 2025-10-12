package com.universalmedialibrary.services.epub

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.readium.r2.shared.publication.Publication
import org.readium.r2.shared.util.Try
import org.readium.r2.shared.util.asset.AssetRetriever
import org.readium.r2.shared.util.http.DefaultHttpClient
import org.readium.r2.streamer.Streamer
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Readium Audiobook Service
 * 
 * Handles Readium Audiobook format (manifest-based audiobooks)
 * Complements our ExoPlayer-based AudioPlaybackManager for standalone files
 * 
 * Supports:
 * - Readium Audiobook Manifest (.audiobook)
 * - Zipped audiobooks
 * - LCP-protected audiobooks (.lcpa)
 * - Chapter markers and navigation
 * - Synchronized narration
 * 
 * Use cases:
 * - Packaged audiobooks from publishers
 * - OPDS audiobook downloads
 * - Audiobooks with structured metadata
 * 
 * For standalone MP3/M4A/FLAC files, use AudioPlaybackManager instead
 */
@Singleton
class ReadiumAudiobookService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val TAG = "ReadiumAudiobookService"
    
    // Readium Streamer for opening publications
    private val streamer by lazy {
        Streamer(
            context = context,
            assetRetriever = AssetRetriever(
                context = context,
                httpClient = DefaultHttpClient()
            )
        )
    }

    /**
     * Check if file is a Readium Audiobook
     * 
     * @param filePath Path to potential audiobook
     * @return True if Readium Audiobook format
     */
    fun isReadiumAudiobook(filePath: String): Boolean {
        val extension = File(filePath).extension.lowercase()
        // Note: lcpdf is an LCP-protected PDF, not an audiobook
        return extension in listOf("audiobook", "lcpa")
    }

    /**
     * Open Readium Audiobook publication
     * 
     * @param audiobookPath Path to audiobook file
     * @return Publication object for playback
     */
    suspend fun openPublication(audiobookPath: String): Publication? = withContext(Dispatchers.IO) {
        try {
            val file = File(audiobookPath)
            if (!file.exists()) {
                Log.e(TAG, "Audiobook file not found: $audiobookPath")
                return@withContext null
            }

            val asset = streamer.assetRetriever.retrieve(file)
            if (asset !is Try.Success) {
                Log.e(TAG, "Failed to retrieve audiobook asset: $audiobookPath")
                return@withContext null
            }

            val publication = streamer.open(asset.value, allowUserInteraction = false)
            if (publication !is Try.Success) {
                Log.e(TAG, "Failed to open audiobook: $audiobookPath")
                return@withContext null
            }

            publication.value
        } catch (e: Exception) {
            Log.e(TAG, "Error opening audiobook: ${e.message}", e)
            null
        }
    }

    /**
     * Extract metadata from audiobook
     * 
     * @param audiobookPath Path to audiobook file
     * @return AudiobookMetadata or null if failed
     */
    suspend fun extractMetadata(audiobookPath: String): AudiobookMetadata? = withContext(Dispatchers.IO) {
        try {
            val publication = openPublication(audiobookPath) ?: return@withContext null
            
            val metadata = publication.metadata
            
            val result = AudiobookMetadata(
                title = metadata.title ?: "Unknown",
                authors = metadata.authors.map { it.name },
                narrators = metadata.narrators.map { it.name },
                publisher = metadata.publisher?.name,
                publishedDate = metadata.published?.toString(),
                description = metadata.description,
                duration = metadata.duration?.toLong(),
                numberOfChapters = publication.readingOrder.size,
                language = metadata.languages.firstOrNull(),
                identifier = metadata.identifier
            )
            
            publication.close()
            result
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting audiobook metadata: ${e.message}", e)
            null
        }
    }

    /**
     * Extract cover artwork from audiobook
     * 
     * @param audiobookPath Path to audiobook file
     * @return Cover bitmap or null
     */
    suspend fun extractCover(audiobookPath: String): Bitmap? = withContext(Dispatchers.IO) {
        try {
            val publication = openPublication(audiobookPath) ?: return@withContext null
            
            val coverLink = publication.coverLink
            val coverBitmap = if (coverLink != null) {
                val resource = publication.get(coverLink.url())
                if (resource is Try.Success) {
                    val bytes = resource.value.read().getOrNull()
                    bytes?.let { BitmapFactory.decodeByteArray(it, 0, it.size) }
                } else null
            } else {
                // Fallback: try first image
                val images = publication.images
                if (images.isNotEmpty()) {
                    val resource = publication.get(images.first().url())
                    if (resource is Try.Success) {
                        val bytes = resource.value.read().getOrNull()
                        bytes?.let { BitmapFactory.decodeByteArray(it, 0, it.size) }
                    } else null
                } else null
            }
            
            publication.close()
            coverBitmap
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting audiobook cover: ${e.message}", e)
            null
        }
    }

    /**
     * Get chapter list with durations
     * 
     * @param audiobookPath Path to audiobook file
     * @return List of chapters
     */
    suspend fun extractChapters(audiobookPath: String): List<AudiobookChapter> = withContext(Dispatchers.IO) {
        try {
            val publication = openPublication(audiobookPath) ?: return@withContext emptyList()
            
            val chapters = publication.readingOrder.mapIndexed { index, link ->
                AudiobookChapter(
                    index = index,
                    title = link.title ?: "Chapter ${index + 1}",
                    href = link.url().toString(),
                    duration = link.duration?.toLong()
                )
            }
            
            publication.close()
            chapters
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting audiobook chapters: ${e.message}", e)
            emptyList()
        }
    }

    /**
     * Extract audio file URLs from audiobook for playback
     * 
     * @param publication Opened publication
     * @return List of audio file paths/URLs
     */
    suspend fun extractAudioFiles(publication: Publication): List<String> {
        return publication.readingOrder.map { it.url().toString() }
    }
}

/**
 * Audiobook Metadata
 */
data class AudiobookMetadata(
    val title: String,
    val authors: List<String> = emptyList(),
    val narrators: List<String> = emptyList(),
    val publisher: String? = null,
    val publishedDate: String? = null,
    val description: String? = null,
    val duration: Long? = null,
    val numberOfChapters: Int = 0,
    val language: String? = null,
    val identifier: String? = null
)

/**
 * Audiobook Chapter
 */
data class AudiobookChapter(
    val index: Int,
    val title: String,
    val href: String,
    val duration: Long? = null
)
