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
        try {
            // Create temporary file for CBR processing
            val tempFile = File.createTempFile("comic", ".cbr", context.cacheDir)
            tempFile.deleteOnExit()
            
            context.contentResolver.openInputStream(uri)?.use { inputStream ->
                tempFile.outputStream().use { outputStream ->
                    inputStream.copyTo(outputStream)
                }
            }

            val archive = Archive(tempFile)
            try {
                val headers: List<FileHeader> = archive.fileHeaders
                for (header in headers) {
                    if (header.fileNameString.equals("ComicInfo.xml", ignoreCase = true)) {
                        val baos = ByteArrayOutputStream()
                        archive.extractFile(header, baos)
                        return ComicInfoParser.parse(baos.toByteArray().inputStream())
                    }
                }
            } finally {
                archive.close()
                tempFile.delete()
            }
        } catch (e: Exception) {
            // Failed to extract ComicInfo
        }
        return null
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
