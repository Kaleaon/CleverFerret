package com.universalmedialibrary.utils

import android.content.Context
import android.net.Uri
import com.github.junrar.Archive
import com.github.junrar.rarfile.FileHeader
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileInputStream
import java.util.zip.ZipInputStream

/**
 * Utilities for extracting metadata and images from comic book archives (CBZ/CBR)
 */
object ComicArchiveUtils {

    /**
     * Executes a block with a temporary cache file created from a Uri stream,
     * guaranteeing deletion of the temporary file in a finally block upon completion or failure.
     */
    fun <T> executeWithTempCacheFile(
        context: Context,
        uri: Uri,
        prefix: String = "comic",
        suffix: String = ".cbr",
        block: (File) -> T
    ): T? {
        val tempFile = try {
            File.createTempFile(prefix, suffix, context.cacheDir)
        } catch (_: Exception) {
            return null
        }

        return try {
            val copied = context.contentResolver.openInputStream(uri)?.use { inputStream ->
                tempFile.outputStream().use { outputStream ->
                    inputStream.copyTo(outputStream)
                }
                true
            } ?: false

            if (!copied) {
                null
            } else {
                block(tempFile)
            }
        } finally {
            try {
                if (tempFile.exists()) {
                    if (!tempFile.delete()) {
                        tempFile.deleteOnExit()
                    }
                }
            } catch (_: Exception) {
                // Ignore deletion errors gracefully
            }
        }
    }

    /**
     * Cleans up stale temporary comic files in context.cacheDir that are older than maxAgeMillis.
     */
    fun cleanupStaleComicTempFiles(
        context: Context,
        maxAgeMillis: Long = 5 * 60 * 1000L
    ): Int {
        var deletedCount = 0
        try {
            val cacheDir = context.cacheDir ?: return 0
            val files = cacheDir.listFiles() ?: return 0
            val now = System.currentTimeMillis()

            for (file in files) {
                try {
                    if (file.isFile && isComicTempFile(file)) {
                        val lastModified = file.lastModified()
                        if (lastModified > 0L && (now - lastModified) >= maxAgeMillis) {
                            if (file.delete()) {
                                deletedCount++
                            }
                        }
                    }
                } catch (_: Exception) {
                    // Ignore individual file deletion errors gracefully
                }
            }
        } catch (_: Exception) {
            // Ignore directory listing errors gracefully
        }
        return deletedCount
    }

    private fun isComicTempFile(file: File): Boolean {
        val name = file.name.lowercase()
        val isComicPattern = name.startsWith("comic") || name.startsWith("cf_tmp_")
        val hasComicExtension = name.endsWith(".cbr") || name.endsWith(".cbz") || name.endsWith(".tmp")
        return isComicPattern && hasComicExtension
    }

    /**
     * Extract ComicInfo.xml from a CBZ archive
     */
    fun extractComicInfoFromCbz(context: Context, uri: Uri): ComicInfo? {
        try {
            context.contentResolver.openInputStream(uri)?.use { inputStream ->
                val zipStream = ZipInputStream(inputStream)
                var entry = zipStream.nextEntry
                
                while (entry != null) {
                    if (entry.name.equals("ComicInfo.xml", ignoreCase = true)) {
                        return ComicInfoParser.parse(zipStream)
                    }
                    entry = zipStream.nextEntry
                }
            }
        } catch (e: Exception) {
            // Failed to extract ComicInfo
        }
        return null
    }

    /**
     * Extract ComicInfo.xml from a CBR archive
     */
    fun extractComicInfoFromCbr(context: Context, uri: Uri): ComicInfo? {
        return try {
            executeWithTempCacheFile(context, uri, prefix = "comic", suffix = ".cbr") { tempFile ->
                val archive = Archive(tempFile)
                try {
                    val headers: List<FileHeader> = archive.fileHeaders
                    for (header in headers) {
                        if (header.fileNameString.equals("ComicInfo.xml", ignoreCase = true)) {
                            val baos = ByteArrayOutputStream()
                            archive.extractFile(header, baos)
                            return@executeWithTempCacheFile ComicInfoParser.parse(baos.toByteArray().inputStream())
                        }
                    }
                    null
                } finally {
                    try {
                        archive.close()
                    } catch (_: Exception) {
                        // Ignore archive close errors
                    }
                }
            }
        } catch (e: Exception) {
            null
        }
    }

    /**
     * Extract ComicInfo from either CBZ or CBR based on file extension
     */
    fun extractComicInfo(context: Context, uri: Uri, fileName: String): ComicInfo? {
        val extension = fileName.substringAfterLast('.', "").lowercase()
        return when (extension) {
            "cbz" -> extractComicInfoFromCbz(context, uri)
            "cbr" -> extractComicInfoFromCbr(context, uri)
            else -> null
        }
    }
}
