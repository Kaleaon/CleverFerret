package com.universalmedialibrary.services

import android.graphics.Bitmap
import android.media.MediaMetadataRetriever
import com.universalmedialibrary.services.metadata.MusicTrackInfo
import com.universalmedialibrary.data.local.entity.LibraryScanSettings
import java.io.File
import java.security.MessageDigest

internal fun determineMediaType(file: File): String? {
    val extension = file.extension.lowercase()
    return when {
        extension in BOOK_EXTENSIONS -> "BOOK"
        extension in AUDIO_EXTENSIONS -> "MUSIC"
        extension in VIDEO_EXTENSIONS -> "MOVIE"
        extension in COMIC_EXTENSIONS -> "COMIC"
        extension in IMAGE_EXTENSIONS && file.length() > 100000 -> "DOCUMENT"
        else -> null
    }
}

internal fun extractAudioDuration(file: File): Long? {
    val retriever = MediaMetadataRetriever()
    return try {
        retriever.setDataSource(file.absolutePath)
        retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull()
    } catch (_: Exception) {
        null
    } finally {
        try {
            retriever.release()
        } catch (e: Exception) { Log.w("MediaScannerService", "Error releasing MediaMetadataRetriever", e) }
    }
}

internal fun extractMusicTrackInfo(file: File): MusicTrackInfo {
    val retriever = MediaMetadataRetriever()
    return try {
        retriever.setDataSource(file.absolutePath)
        val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE)
        val artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST)
        val album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM)
        val albumArtist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST)
        val composer = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_COMPOSER)
        val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull()
        val bitrate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_BITRATE)?.toIntOrNull()
        val sampleRate = AudioMetadataUtils.extractSampleRate(file)
        val trackPair = parseNumberPair(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER))
        val discPair = parseNumberPair(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DISC_NUMBER))
        val totalTracks = trackPair.second
            ?: retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_NUM_TRACKS)?.toIntOrNull()

        MusicTrackInfo(
            title = title ?: file.nameWithoutExtension,
            artist = artist,
            album = album,
            albumArtist = albumArtist,
            composer = composer,
            trackNumber = trackPair.first,
            totalTracks = totalTracks,
            discNumber = discPair.first,
            totalDiscs = discPair.second,
            durationMs = duration,
            bitrate = bitrate,
            sampleRate = sampleRate,
            channels = null
        )
    } catch (_: Exception) {
        MusicTrackInfo(title = file.nameWithoutExtension)
    } finally {
        try {
            retriever.release()
        } catch (e: Exception) { Log.w("MediaScannerService", "Error releasing MediaMetadataRetriever", e) }
    }
}

internal fun parseNumberPair(raw: String?): Pair<Int?, Int?> {
    if (raw.isNullOrBlank()) return null to null
    val parts = raw.split("/")
    val first = parts.getOrNull(0)?.toIntOrNull()
    val second = parts.getOrNull(1)?.toIntOrNull()
    return first to second
}

internal fun extractEmbeddedAlbumArtBytes(filePath: String): ByteArray? {
    val retriever = MediaMetadataRetriever()
    return try {
        retriever.setDataSource(filePath)
        retriever.embeddedPicture
    } catch (_: Exception) {
        null
    } finally {
        try {
            retriever.release()
        } catch (e: Exception) { Log.w("MediaScannerService", "Error releasing MediaMetadataRetriever", e) }
    }
}

internal fun scaleBitmap(bitmap: Bitmap, maxDimension: Int): Bitmap {
    val largestSide = max(bitmap.width, bitmap.height)
    if (largestSide <= maxDimension) return bitmap
    val scale = maxDimension.toFloat() / largestSide.toFloat()
    val width = (bitmap.width * scale).roundToInt().coerceAtLeast(1)
    val height = (bitmap.height * scale).roundToInt().coerceAtLeast(1)
    return Bitmap.createScaledBitmap(bitmap, width, height, true)
}

internal fun hashString(input: String): String {
    val digest = MessageDigest.getInstance("SHA-1")
    val bytes = digest.digest(input.toByteArray())
    return bytes.joinToString("") { "%02x".format(it) }
}

internal fun computeFileHash(file: File): String? {
    return try {
        val digest = MessageDigest.getInstance("SHA-1")
        file.inputStream().use { stream ->
            val buffer = ByteArray(DEFAULT_BUFFER_SIZE)
            var bytesRead = stream.read(buffer)
            while (bytesRead > 0) {
                digest.update(buffer, 0, bytesRead)
                bytesRead = stream.read(buffer)
            }
        }
        digest.digest().joinToString("") { "%02x".format(it) }
    } catch (_: Exception) {
        null
    }
}

internal fun String.normalizeMatcher(): String? {
    if (isBlank()) return null
    return try {
        val raw = if (startsWith("content://")) {
            trim()
        } else {
            File(this).canonicalPath
        }
        raw.replace("\\", "/").trim().lowercase()
    } catch (_: Exception) {
        trim().replace("\\", "/").lowercase()
    }
}

internal fun File.normalizedPath(): String =
    absolutePath.normalizeMatcher() ?: absolutePath.lowercase()

private fun scanLibrary(libraryId: Long, scanPath: String?) {
    scanJob?.cancel()
    scanJob = serviceScope.launch {
        try {
            val library = libraryDao.getLibraryById(libraryId)
            if (library != null) {
                val path = scanPath ?: library.path
                val directory = File(path)
                if (directory.exists() && directory.isDirectory) {
                    val resolvedSettings = getCachedScanSettings(library)
                    updateNotification("Scanning ${library.name}...")
                    scanDirectory(directory, resolvedSettings, library)
                    updateNotification("Library scan complete!")
                }
            }
            delay(2000)
            stopSelf()
        } catch (e: Exception) {
            ErrorLogger.logMediaScanError("Library scan failed", e)
            updateNotification("Scan failed: ${e.message}")
            delay(2000)
            stopSelf()
        }
    }
}

