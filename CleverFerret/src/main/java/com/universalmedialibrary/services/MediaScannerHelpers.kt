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
import com.universalmedialibrary.utils.sha1
import com.universalmedialibrary.utils.computeSha1
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
    return input.sha1()
}

internal fun computeFileHash(file: File): String? {
    return try {
        file.computeSha1()
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

internal data class ResolvedScanSettings(
    val config: LibraryScanSettings,
    val includeMatchers: List<String>,
    val excludeMatchers: List<String>
)

internal fun ResolvedScanSettings.shouldSkipDirectory(directory: File): Boolean {
    val normalized = directory.normalizedPath()
    return excludeMatchers.any { normalized.startsWith(it) }
}

internal fun ResolvedScanSettings.allowsFile(file: File): Boolean {
    val normalizedPath = file.normalizedPath()
    val includeOk = if (includeMatchers.isEmpty()) {
        true
    } else if (config.includeSubdirectories) {
        includeMatchers.any { normalizedPath.startsWith(it) }
    } else {
        val parent = file.parent?.normalizeMatcher() ?: ""
        includeMatchers.any { parent == it || normalizedPath == it }
    }
    if (!includeOk) return false
    if (excludeMatchers.any { normalizedPath.startsWith(it) }) return false
    if (config.minFileSizeBytes > 0 && file.length() < config.minFileSizeBytes) return false
    return true
}

internal fun countEligibleFiles(
    directory: File,
    settings: ResolvedScanSettings?
): Int {
    var count = 0
    val stack = java.util.ArrayDeque<File>()
    stack.push(directory)
    while (!stack.isEmpty()) {
        val current = stack.pop()
        val files = current.listFiles() ?: continue
        for (f in files) {
            if (f.isDirectory && !f.name.startsWith(".")) {
                if (settings == null || !settings.shouldSkipDirectory(f)) {
                    stack.push(f)
                }
            } else if (f.isFile) {
                val mediaType = determineMediaType(f)
                if (mediaType != null) {
                    if (settings == null || settings.allowsFile(f)) {
                        count++
                    }
                }
            }
        }
    }
    return count
}


