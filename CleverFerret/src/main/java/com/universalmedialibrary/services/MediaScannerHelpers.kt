package com.universalmedialibrary.services

import android.graphics.Bitmap
import android.media.MediaMetadataRetriever
import android.util.Log
import com.universalmedialibrary.data.local.entity.LibraryScanSettings
import com.universalmedialibrary.services.MediaScannerService.MusicTrackInfo
import com.universalmedialibrary.utils.media.AudioMetadataUtils
import com.universalmedialibrary.utils.ErrorLogger
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import java.io.File
import java.security.MessageDigest
import kotlin.math.max
import kotlin.math.roundToInt

internal fun determineMediaType(file: File): String? {
    val extension = file.extension.lowercase()
    return when {
        extension in MediaScannerService.BOOK_EXTENSIONS -> "BOOK"
        extension in MediaScannerService.AUDIO_EXTENSIONS -> "MUSIC"
        extension in MediaScannerService.VIDEO_EXTENSIONS -> "MOVIE"
        extension in MediaScannerService.COMIC_EXTENSIONS -> "COMIC"
        extension in MediaScannerService.IMAGE_EXTENSIONS && file.length() > 100000 -> "DOCUMENT"
        else -> null
    }
}

internal fun extractAudioDuration(file: File): Long? {
    return AudioMetadataUtils.extractAudioDuration(file)
}

internal fun extractMusicTrackInfo(file: File): MusicTrackInfo {
    return AudioMetadataUtils.extractMusicTrackInfo(file)
}

internal fun parseNumberPair(raw: String?): Pair<Int?, Int?> {
    return AudioMetadataUtils.parseNumberPair(raw)
}

internal fun extractEmbeddedAlbumArtBytes(filePath: String): ByteArray? {
    return AudioMetadataUtils.extractEmbeddedAlbumArtBytes(filePath)
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

internal fun MediaScannerService.scanLibrary(libraryId: Long, scanPath: String?) {
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

