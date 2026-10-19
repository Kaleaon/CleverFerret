package com.universalmedialibrary.utils.media

import android.media.MediaExtractor
import android.media.MediaFormat
import android.media.MediaMetadataRetriever
import android.util.Log
import com.universalmedialibrary.services.MediaScannerService.MusicTrackInfo
import wseemann.media.FFmpegMediaMetadataRetriever
import java.io.File

/**
 * Utility helpers for extracting audio metadata using FFmpegMediaMetadataRetriever as primary engine
 * with system MediaMetadataRetriever fallback.
 */
object AudioMetadataUtils {
    private const val TAG = "AudioMetadataUtils"

    data class AudioTrackMetadata(
        val title: String? = null,
        val artist: String? = null,
        val album: String? = null,
        val albumArtist: String? = null,
        val composer: String? = null,
        val genre: String? = null,
        val trackNumber: Int? = null,
        val totalTracks: Int? = null,
        val discNumber: Int? = null,
        val totalDiscs: Int? = null,
        val durationMs: Long? = null,
        val bitrate: Int? = null,
        val sampleRate: Int? = null,
        val channels: Int? = null,
        val year: Int? = null,
        val date: String? = null,
        val mimeType: String? = null,
        val embeddedArtwork: ByteArray? = null
    )

    /**
     * Parse pair of numbers like "3/12" or "3-12" or "3".
     */
    fun parseNumberPair(raw: String?): Pair<Int?, Int?> {
        if (raw.isNullOrBlank()) return null to null
        val parts = raw.split('/', '-')
        val first = parts.getOrNull(0)?.trim()?.toIntOrNull()
        val second = parts.getOrNull(1)?.trim()?.toIntOrNull()
        return first to second
    }

    /**
     * Comprehensive metadata extraction using FFmpegMediaMetadataRetriever as primary engine,
     * falling back to system MediaMetadataRetriever if native retriever fails or returns no metadata.
     */
    fun extractAudioMetadata(file: File): AudioTrackMetadata {
        if (!file.exists()) return AudioTrackMetadata()

        // Primary: FFmpegMediaMetadataRetriever
        try {
            val ffmpegResult = extractViaFFmpeg(file)
            if (isUsefulMetadata(ffmpegResult)) {
                return ffmpegResult
            }
        } catch (t: Throwable) {
            Log.w(TAG, "FFmpeg extraction failed for ${file.name}: ${t.message}")
        }

        // Secondary Fallback: System MediaMetadataRetriever
        try {
            val systemResult = extractViaSystemRetriever(file)
            if (isUsefulMetadata(systemResult)) {
                return systemResult
            }
        } catch (t: Throwable) {
            Log.w(TAG, "System MediaMetadataRetriever extraction failed for ${file.name}: ${t.message}")
        }

        return AudioTrackMetadata(title = file.nameWithoutExtension)
    }

    private fun isUsefulMetadata(meta: AudioTrackMetadata): Boolean {
        return !meta.title.isNullOrBlank() ||
                !meta.artist.isNullOrBlank() ||
                !meta.album.isNullOrBlank() ||
                meta.durationMs != null
    }

    private fun extractViaFFmpeg(file: File): AudioTrackMetadata {
        val retriever = FFmpegMediaMetadataRetriever()
        return try {
            retriever.setDataSource(file.absolutePath)

            val title = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_TITLE)?.takeIf { it.isNotBlank() }
            val artist = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_ARTIST)?.takeIf { it.isNotBlank() }
            val album = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_ALBUM)?.takeIf { it.isNotBlank() }
            val albumArtist = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_ALBUM_ARTIST)?.takeIf { it.isNotBlank() }
            val composer = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_COMPOSER)?.takeIf { it.isNotBlank() }
            val genre = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_GENRE)?.takeIf { it.isNotBlank() }
            val date = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_DATE)?.takeIf { it.isNotBlank() }
            val year = date?.take(4)?.toIntOrNull()

            val rawTrack = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_TRACK)
            val trackPair = parseNumberPair(rawTrack)
            val rawDisc = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_DISC)
            val discPair = parseNumberPair(rawDisc)

            val duration = retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull()
            val bitrate = (retriever.extractMetadata("bitrate") ?: retriever.extractMetadata(FFmpegMediaMetadataRetriever.METADATA_KEY_VARIANT_BITRATE))?.toIntOrNull()
            val sampleRate = (retriever.extractMetadata("sample_rate") ?: retriever.extractMetadata("samplerate"))?.toIntOrNull()
                ?: extractSampleRateViaExtractor(file)
            val channels = retriever.extractMetadata("channels")?.toIntOrNull()
            val artwork = retriever.embeddedPicture

            AudioTrackMetadata(
                title = title ?: file.nameWithoutExtension,
                artist = artist,
                album = album,
                albumArtist = albumArtist,
                composer = composer,
                genre = genre,
                trackNumber = trackPair.first,
                totalTracks = trackPair.second,
                discNumber = discPair.first,
                totalDiscs = discPair.second,
                durationMs = duration,
                bitrate = bitrate,
                sampleRate = sampleRate,
                channels = channels,
                year = year,
                date = date,
                mimeType = retriever.extractMetadata("mimetype"),
                embeddedArtwork = artwork
            )
        } finally {
            try {
                retriever.release()
            } catch (t: Throwable) {
                Log.w(TAG, "Error releasing FFmpegMediaMetadataRetriever", t)
            }
        }
    }

    private fun extractViaSystemRetriever(file: File): AudioTrackMetadata {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(file.absolutePath)

            val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE)?.takeIf { it.isNotBlank() }
            val artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST)?.takeIf { it.isNotBlank() }
            val album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM)?.takeIf { it.isNotBlank() }
            val albumArtist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST)?.takeIf { it.isNotBlank() }
            val composer = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_COMPOSER)?.takeIf { it.isNotBlank() }
            val genre = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_GENRE)?.takeIf { it.isNotBlank() }
            val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull()
            val bitrate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_BITRATE)?.toIntOrNull()
            val sampleRate = extractSampleRateViaExtractor(file)

            val rawTrack = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER)
            val trackPair = parseNumberPair(rawTrack)
            val rawDisc = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DISC_NUMBER)
            val discPair = parseNumberPair(rawDisc)

            val totalTracks = trackPair.second
                ?: retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_NUM_TRACKS)?.toIntOrNull()

            val year = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_YEAR)?.toIntOrNull()
            val date = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DATE)
            val artwork = retriever.embeddedPicture

            AudioTrackMetadata(
                title = title ?: file.nameWithoutExtension,
                artist = artist,
                album = album,
                albumArtist = albumArtist,
                composer = composer,
                genre = genre,
                trackNumber = trackPair.first,
                totalTracks = totalTracks,
                discNumber = discPair.first,
                totalDiscs = discPair.second,
                durationMs = duration,
                bitrate = bitrate,
                sampleRate = sampleRate,
                year = year,
                date = date,
                mimeType = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_MIMETYPE),
                embeddedArtwork = artwork
            )
        } finally {
            try {
                retriever.release()
            } catch (t: Throwable) {
                Log.w(TAG, "Error releasing MediaMetadataRetriever", t)
            }
        }
    }

    /**
     * Converts AudioTrackMetadata to MusicTrackInfo for MediaScannerHelpers / MediaScannerService
     */
    internal fun extractMusicTrackInfo(file: File): MusicTrackInfo {
        val meta = extractAudioMetadata(file)
        return MusicTrackInfo(
            title = meta.title ?: file.nameWithoutExtension,
            artist = meta.artist,
            album = meta.album,
            albumArtist = meta.albumArtist,
            composer = meta.composer,
            genre = meta.genre,
            trackNumber = meta.trackNumber,
            totalTracks = meta.totalTracks,
            discNumber = meta.discNumber,
            totalDiscs = meta.totalDiscs,
            durationMs = meta.durationMs,
            bitrate = meta.bitrate,
            sampleRate = meta.sampleRate,
            channels = meta.channels
        )
    }

    /**
     * Extract audio duration in milliseconds.
     */
    fun extractAudioDuration(file: File): Long? {
        return extractAudioMetadata(file).durationMs
    }

    /**
     * Extract embedded album art bytes.
     */
    fun extractEmbeddedAlbumArtBytes(filePath: String): ByteArray? {
        val file = File(filePath)
        if (!file.exists()) return null
        return extractAudioMetadata(file).embeddedArtwork
    }

    /**
     * Attempts to read the audio sample rate for the provided media file using FFmpeg, system retriever,
     * or MediaExtractor.
     *
     * @return Sample rate in Hz when available, otherwise null.
     */
    fun extractSampleRate(file: File): Int? {
        val metaSampleRate = extractAudioMetadata(file).sampleRate
        if (metaSampleRate != null && metaSampleRate > 0) {
            return metaSampleRate
        }
        return extractSampleRateViaExtractor(file)
    }

    private fun extractSampleRateViaExtractor(file: File): Int? {
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
        } catch (_: Throwable) {
            null
        } finally {
            runCatching { extractor.release() }
        }
    }
}

