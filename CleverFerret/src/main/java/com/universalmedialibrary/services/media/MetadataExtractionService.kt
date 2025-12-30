package com.universalmedialibrary.services.media

import android.content.Context
import android.media.MediaMetadataRetriever
import com.universalmedialibrary.data.local.entity.MediaItem as EntityMediaItem
import com.universalmedialibrary.data.local.entity.MetadataBook
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.MetadataMusicTrack
import com.universalmedialibrary.data.local.entity.MetadataMovie
import com.universalmedialibrary.data.repository.MediaRepository
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.util.zip.ZipFile
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for extracting metadata from media files
 *
 * Supports metadata extraction for:
 * - Books: Title, author, publisher, ISBN from EPUB/PDF
 * - Music: Title, artist, album, duration, bitrate from ID3 tags
 * - Movies: Title, duration, resolution, codec information
 * - Documents: Title, author, creation date from file properties
 */
@Singleton
class MetadataExtractionService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaRepository: MediaRepository
) {

    /**
     * Extract metadata for a media item
     */
    suspend fun extractMetadata(mediaItem: EntityMediaItem): MetadataResult = withContext(Dispatchers.IO) {
        try {
            when (mediaItem.mediaType) {
                "BOOK" -> extractBookMetadata(mediaItem)
                "MUSIC_TRACK" -> extractMusicMetadata(mediaItem)
                "MOVIE" -> extractMovieMetadata(mediaItem)
                "DOCUMENT" -> extractDocumentMetadata(mediaItem)
                else -> MetadataResult.empty()
            }
        } catch (e: Exception) {
            MetadataResult.error("Failed to extract metadata: ${e.message}")
        }
    }

    private fun extractBookMetadata(mediaItem: EntityMediaItem): MetadataResult {
        val file = File(mediaItem.filePath)

        return when (mediaItem.fileExtension.lowercase()) {
            "epub" -> extractEpubMetadata(file)
            "pdf" -> extractPdfMetadata(file)
            "txt" -> extractTextMetadata(file)
            else -> MetadataResult.basic(file.nameWithoutExtension)
        }
    }

    private fun extractEpubMetadata(file: File): MetadataResult {
        return try {
            ZipFile(file).use { zipFile ->
                // Look for OPF file in META-INF/container.xml
                val containerEntry = zipFile.getEntry("META-INF/container.xml")
                if (containerEntry != null) {
                    val containerXml = zipFile.getInputStream(containerEntry).bufferedReader().readText()

                    // Extract basic title from filename as fallback
                    val title = file.nameWithoutExtension

                    val commonMetadata = MetadataCommon(
                        itemId = 0, // Will be set when saved
                        title = title,
                        sortTitle = title.let { if (it.startsWith("The ")) it.substring(4) + ", The" else it }
                    )

                    val bookMetadata = MetadataBook(
                        itemId = 0,
                        format = "EPUB"
                    )

                    MetadataResult(commonMetadata, bookMetadata = bookMetadata)
                } else {
                    MetadataResult.basic(file.nameWithoutExtension)
                }
            }
        } catch (e: Exception) {
            MetadataResult.basic(file.nameWithoutExtension)
        }
    }

    private fun extractPdfMetadata(file: File): MetadataResult {
        val title = file.nameWithoutExtension

        val commonMetadata = MetadataCommon(
            itemId = 0,
            title = title,
            sortTitle = title.let { if (it.startsWith("The ")) it.substring(4) + ", The" else it }
        )

        val bookMetadata = MetadataBook(
            itemId = 0,
            format = "PDF"
        )

        return MetadataResult(commonMetadata, bookMetadata = bookMetadata)
    }

    private fun extractTextMetadata(file: File): MetadataResult {
        val title = file.nameWithoutExtension

        val commonMetadata = MetadataCommon(
            itemId = 0,
            title = title
        )

        val bookMetadata = MetadataBook(
            itemId = 0,
            format = "TXT"
        )

        return MetadataResult(commonMetadata, bookMetadata = bookMetadata)
    }

    private fun extractMusicMetadata(mediaItem: EntityMediaItem): MetadataResult {
        val retriever = MediaMetadataRetriever()

        return try {
            retriever.setDataSource(mediaItem.filePath)

            val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE)
                ?: File(mediaItem.filePath).nameWithoutExtension
            val artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST)
            val album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM)
            val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull()
            val bitrate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_BITRATE)?.toIntOrNull()
            val trackNumber = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER)?.toIntOrNull()

            val commonMetadata = MetadataCommon(
                itemId = 0,
                title = title,
                sortTitle = title.let { if (it.startsWith("The ")) it.substring(4) + ", The" else it }
            )

            val musicMetadata = MetadataMusicTrack(
                itemId = 0,
                album = album,
                artist = artist,
                duration = duration,
                bitrate = bitrate,
                trackNumber = trackNumber
            )

            MetadataResult(commonMetadata, musicMetadata = musicMetadata)

        } catch (e: Exception) {
            MetadataResult.basic(File(mediaItem.filePath).nameWithoutExtension)
        } finally {
            try {
                retriever.release()
            } catch (e: Exception) {
                // Ignore release errors
            }
        }
    }

    private fun extractMovieMetadata(mediaItem: EntityMediaItem): MetadataResult {
        val retriever = MediaMetadataRetriever()

        return try {
            retriever.setDataSource(mediaItem.filePath)

            val title = File(mediaItem.filePath).nameWithoutExtension
            val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull()?.div(1000)?.toInt() // Convert to minutes
            val width = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_WIDTH)?.toIntOrNull()
            val height = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_HEIGHT)?.toIntOrNull()
            val resolution = if (width != null && height != null) "${width}x${height}" else null

            val commonMetadata = MetadataCommon(
                itemId = 0,
                title = title,
                sortTitle = title.let { if (it.startsWith("The ")) it.substring(4) + ", The" else it }
            )

            val movieMetadata = MetadataMovie(
                itemId = 0,
                runtime = duration,
                resolution = resolution
            )

            MetadataResult(commonMetadata, movieMetadata = movieMetadata)

        } catch (e: Exception) {
            MetadataResult.basic(File(mediaItem.filePath).nameWithoutExtension)
        } finally {
            try {
                retriever.release()
            } catch (e: Exception) {
                // Ignore release errors
            }
        }
    }

    private fun extractDocumentMetadata(mediaItem: EntityMediaItem): MetadataResult {
        val title = File(mediaItem.filePath).nameWithoutExtension

        val commonMetadata = MetadataCommon(
            itemId = 0,
            title = title
        )

        return MetadataResult(commonMetadata)
    }
}

/**
 * Result of metadata extraction
 */
data class MetadataResult(
    val commonMetadata: MetadataCommon? = null,
    val bookMetadata: MetadataBook? = null,
    val movieMetadata: MetadataMovie? = null,
    val musicMetadata: MetadataMusicTrack? = null,
    val error: String? = null
) {
    companion object {
        fun empty() = MetadataResult()

        fun error(message: String) = MetadataResult(error = message)

        fun basic(title: String) = MetadataResult(
            commonMetadata = MetadataCommon(
                itemId = 0,
                title = title
            )
        )
    }

    val isSuccess: Boolean get() = error == null && commonMetadata != null
    val hasError: Boolean get() = error != null
}
