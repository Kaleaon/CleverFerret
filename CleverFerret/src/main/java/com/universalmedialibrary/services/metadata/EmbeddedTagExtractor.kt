package com.universalmedialibrary.services.metadata

import android.content.Context
import android.media.MediaMetadataRetriever
import android.net.Uri
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Shared delegate for extracting embedded tags from audio and video files.
 * Unifies FFmpegMetadataExtractor and MediaMetadataRetriever fallback parsing.
 */
@Singleton
class EmbeddedTagExtractor @Inject constructor(
    @ApplicationContext private val context: Context,
    private val ffmpegExtractor: FFmpegMetadataExtractor
) {
    companion object {
        private const val TAG = "EmbeddedTagExtractor"

        /**
         * Consolidated track number parser supporting "3", "3/12", "3-12" formats.
         */
        fun parseTrackNumber(trackInfo: String?): Int? {
            if (trackInfo.isNullOrBlank()) return null
            return trackInfo.split('/', '-').firstOrNull()?.trim()?.toIntOrNull()
        }

        /**
         * Consolidated track total parser supporting "3/12", "3-12" formats.
         */
        fun parseTrackTotal(trackInfo: String?): Int? {
            if (trackInfo.isNullOrBlank()) return null
            return trackInfo.split('/', '-').getOrNull(1)?.trim()?.toIntOrNull()
        }

        /**
         * Consolidated disc number parser supporting "1", "1/2", "1-2" formats.
         */
        fun parseDiscNumber(discInfo: String?): Int? {
            if (discInfo.isNullOrBlank()) return null
            return discInfo.split('/', '-').firstOrNull()?.trim()?.toIntOrNull()
        }

        /**
         * Consolidated disc total parser supporting "1/2", "1-2" formats.
         */
        fun parseDiscTotal(discInfo: String?): Int? {
            if (discInfo.isNullOrBlank()) return null
            return discInfo.split('/', '-').getOrNull(1)?.trim()?.toIntOrNull()
        }
    }

    /**
     * Extract comprehensive metadata from file path using FFmpeg with MediaMetadataRetriever fallback.
     */
    suspend fun extractMetadata(filePath: String): UniversalMetadata = withContext(Dispatchers.IO) {
        try {
            val ffmpegMeta = ffmpegExtractor.extractMetadata(filePath)
            if (ffmpegMeta.extractionSuccess && (!ffmpegMeta.title.isNullOrBlank() || !ffmpegMeta.artist.isNullOrBlank())) {
                return@withContext ffmpegMeta
            }
        } catch (e: Exception) {
            Log.w(TAG, "FFmpeg extraction failed for $filePath, falling back to MediaMetadataRetriever", e)
        }

        extractMetadataViaRetriever(filePath)
    }

    /**
     * Extract AudioMetadata directly from Uri using MediaMetadataRetriever.
     */
    suspend fun extractMetadataFromUri(uri: Uri): AudioMetadata? = withContext(Dispatchers.IO) {
        val retriever = MediaMetadataRetriever()
        try {
            retriever.setDataSource(context, uri)

            val rawTrack = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER)
            val rawDisc = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DISC_NUMBER)

            AudioMetadata(
                title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE),
                artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST),
                album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM),
                albumArtist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST),
                trackNumber = parseTrackNumber(rawTrack),
                discNumber = parseDiscNumber(rawDisc),
                year = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_YEAR)?.toIntOrNull(),
                genre = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_GENRE),
                composer = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_COMPOSER),
                duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull(),
                bitrate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_BITRATE)?.toIntOrNull(),
                sampleRate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_SAMPLERATE)?.toIntOrNull(),
                mimeType = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_MIMETYPE),
                embeddedArtwork = retriever.embeddedPicture,
                source = AudioMetadataSource.EMBEDDED
            )
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting metadata from Uri: $uri", e)
            null
        } finally {
            try {
                retriever.release()
            } catch (e: Exception) {
                Log.w(TAG, "Error releasing MediaMetadataRetriever", e)
            }
        }
    }

    private fun extractMetadataViaRetriever(filePath: String): UniversalMetadata {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(filePath)

            val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE)
            val artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST)
            val album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM)
            val albumArtist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST)
            val rawTrack = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER)
            val rawDisc = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DISC_NUMBER)
            val date = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DATE)
                ?: retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_YEAR)
            val year = date?.take(4)?.toIntOrNull()

            val hasVideo = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_HAS_VIDEO) == "yes"
            val hasAudio = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_HAS_AUDIO) == "yes"

            UniversalMetadata(
                title = title ?: filePath.substringAfterLast('/').substringBeforeLast('.'),
                artist = artist,
                album = album,
                albumArtist = albumArtist,
                composer = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_COMPOSER),
                genre = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_GENRE),
                year = year,
                date = date,
                trackNumber = parseTrackNumber(rawTrack),
                discNumber = parseDiscNumber(rawDisc),
                duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull(),
                bitrate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_BITRATE)?.toIntOrNull(),
                sampleRate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_SAMPLERATE)?.toIntOrNull(),
                width = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_WIDTH)?.toIntOrNull(),
                height = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_HEIGHT)?.toIntOrNull(),
                mimeType = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_MIMETYPE),
                hasVideo = hasVideo,
                hasAudio = hasAudio,
                extractionSuccess = true,
                filePath = filePath
            )
        } catch (e: Exception) {
            Log.e(TAG, "MediaMetadataRetriever extraction failed for $filePath", e)
            UniversalMetadata(
                title = filePath.substringAfterLast('/').substringBeforeLast('.'),
                extractionSuccess = false,
                extractionError = e.message,
                filePath = filePath
            )
        } finally {
            try {
                retriever.release()
            } catch (e: Exception) {
                Log.w(TAG, "Error releasing MediaMetadataRetriever", e)
            }
        }
    }
}
