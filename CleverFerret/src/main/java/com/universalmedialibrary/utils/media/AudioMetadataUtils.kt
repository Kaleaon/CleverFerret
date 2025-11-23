package com.universalmedialibrary.utils.media

import android.media.MediaExtractor
import android.media.MediaFormat
import java.io.File

/**
 * Utility helpers for extracting audio metadata in a backward-compatible way.
 */
object AudioMetadataUtils {

    /**
     * Attempts to read the audio sample rate for the provided media file.
     *
     * @return Sample rate in Hz when available, otherwise null.
     */
    fun extractSampleRate(file: File): Int? {
        val extractor = MediaExtractor()
        return try {
            extractor.setDataSource(file.absolutePath)
            for (trackIndex in 0 until extractor.trackCount) {
                val format = extractor.getTrackFormat(trackIndex)
                val mime = format.getString(MediaFormat.KEY_MIME) ?: continue
                if (!mime.startsWith("audio/")) continue

                if (format.containsKey(MediaFormat.KEY_SAMPLE_RATE)) {
                    return format.getInteger(MediaFormat.KEY_SAMPLE_RATE)
                }
            }
            null
        } catch (_: Exception) {
            null
        } finally {
            runCatching { extractor.release() }
        }
    }
}
