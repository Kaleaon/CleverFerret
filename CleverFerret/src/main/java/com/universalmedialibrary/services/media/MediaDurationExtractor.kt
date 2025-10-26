package com.universalmedialibrary.services.media

import android.content.Context
import android.media.MediaMetadataRetriever
import android.net.Uri
import com.universalmedialibrary.utils.ErrorHandler
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for extracting media duration from various file formats
 * 
 * Uses MediaMetadataRetriever to extract accurate duration information
 * for audio and video files.
 */
@Singleton
class MediaDurationExtractor @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    /**
     * Extract duration from a file path
     * @param filePath Path to the media file
     * @return Duration in milliseconds, or 0 if extraction fails
     */
    fun extractDuration(filePath: String): Long {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(filePath)
            val durationStr = retriever.extractMetadata(
                MediaMetadataRetriever.METADATA_KEY_DURATION
            )
            durationStr?.toLongOrNull() ?: 0L
        } catch (e: Exception) {
            ErrorHandler.logError(
                tag = "MediaDurationExtractor",
                message = "Failed to extract duration",
                error = e,
                context = mapOf("filePath" to filePath)
            )
            0L
        } finally {
            try {
                retriever.release()
            } catch (e: Exception) {
                // Ignore release errors
            }
        }
    }
    
    /**
     * Extract duration from a URI
     * @param uri URI to the media file
     * @return Duration in milliseconds, or 0 if extraction fails
     */
    fun extractDuration(uri: Uri): Long {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(context, uri)
            val durationStr = retriever.extractMetadata(
                MediaMetadataRetriever.METADATA_KEY_DURATION
            )
            durationStr?.toLongOrNull() ?: 0L
        } catch (e: Exception) {
            ErrorHandler.logError(
                tag = "MediaDurationExtractor",
                message = "Failed to extract duration from URI",
                error = e,
                context = mapOf("uri" to uri.toString())
            )
            0L
        } finally {
            try {
                retriever.release()
            } catch (e: Exception) {
                // Ignore release errors
            }
        }
    }
    
    /**
     * Extract multiple metadata fields from a file
     * @param filePath Path to the media file
     * @return MediaMetadata object with duration, bitrate, etc.
     */
    fun extractMetadata(filePath: String): MediaMetadata {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(filePath)
            
            MediaMetadata(
                duration = retriever.extractMetadata(
                    MediaMetadataRetriever.METADATA_KEY_DURATION
                )?.toLongOrNull() ?: 0L,
                bitrate = retriever.extractMetadata(
                    MediaMetadataRetriever.METADATA_KEY_BITRATE
                )?.toLongOrNull() ?: 0L,
                mimeType = retriever.extractMetadata(
                    MediaMetadataRetriever.METADATA_KEY_MIMETYPE
                ),
                title = retriever.extractMetadata(
                    MediaMetadataRetriever.METADATA_KEY_TITLE
                ),
                artist = retriever.extractMetadata(
                    MediaMetadataRetriever.METADATA_KEY_ARTIST
                ),
                album = retriever.extractMetadata(
                    MediaMetadataRetriever.METADATA_KEY_ALBUM
                ),
                year = retriever.extractMetadata(
                    MediaMetadataRetriever.METADATA_KEY_YEAR
                )?.toIntOrNull()
            )
        } catch (e: Exception) {
            ErrorHandler.logError(
                tag = "MediaDurationExtractor",
                message = "Failed to extract metadata",
                error = e,
                context = mapOf("filePath" to filePath)
            )
            MediaMetadata()
        } finally {
            try {
                retriever.release()
            } catch (e: Exception) {
                // Ignore release errors
            }
        }
    }
}

/**
 * Container for extracted media metadata
 */
data class MediaMetadata(
    val duration: Long = 0L,
    val bitrate: Long = 0L,
    val mimeType: String? = null,
    val title: String? = null,
    val artist: String? = null,
    val album: String? = null,
    val year: Int? = null
)
