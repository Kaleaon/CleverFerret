package com.universalmedialibrary.services.reader

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import org.apache.commons.compress.archivers.sevenz.SevenZFile
import org.apache.commons.compress.archivers.tar.TarArchiveInputStream
import java.io.File
import java.io.FileInputStream

/**
 * Handler for CB7 (7-Zip) and CBT (TAR) comic archive formats
 * 
 * Uses Apache Commons Compress library for extraction
 */
object ComicArchiveHandler {

    /**
     * Maximum image file size in bytes (100 MB) to prevent memory issues
     */
    private const val MAX_IMAGE_SIZE_BYTES = 100 * 1024 * 1024L

    /**
     * Extract image entries from a CB7 (7-Zip) archive
     * 
     * @param file The CB7 file
     * @return List of comic pages metadata (compatible with ComicReaderEngine)
     */
    fun extractSevenZipImageEntries(file: File): List<ExtractedComicPage> {
        val pages = mutableListOf<ExtractedComicPage>()
        
        SevenZFile.builder().setFile(file).get().use { sevenZFile ->
            var entry = sevenZFile.nextEntry
            var index = 0
            
            while (entry != null) {
                if (!entry.isDirectory && isImageFile(entry.name)) {
                    pages.add(
                        ExtractedComicPage(
                            index = index++,
                            fileName = entry.name.substringAfterLast('/'),
                            entryName = entry.name,
                            size = entry.size
                        )
                    )
                }
                entry = sevenZFile.nextEntry
            }
        }
        
        return pages.sortedBy { it.entryName }
    }

    /**
     * Extract image entries from a CBT (TAR) archive
     * 
     * @param file The CBT file
     * @return List of comic pages metadata (compatible with ComicReaderEngine)
     */
    fun extractTarImageEntries(file: File): List<ExtractedComicPage> {
        val pages = mutableListOf<ExtractedComicPage>()
        
        TarArchiveInputStream(FileInputStream(file)).use { tarInput ->
            var entry = tarInput.nextEntry
            var index = 0
            
            while (entry != null) {
                if (!entry.isDirectory && isImageFile(entry.name)) {
                    pages.add(
                        ExtractedComicPage(
                            index = index++,
                            fileName = entry.name.substringAfterLast('/'),
                            entryName = entry.name,
                            size = entry.size
                        )
                    )
                }
                entry = tarInput.nextEntry
            }
        }
        
        return pages.sortedBy { it.entryName }
    }

    /**
     * Get a bitmap for a specific page from CB7 archive by entry name
     */
    fun getPageBitmapFromSevenZip(file: File, entryName: String): Bitmap? {
        SevenZFile.builder().setFile(file).get().use { sevenZFile ->
            var entry = sevenZFile.nextEntry
            
            while (entry != null) {
                if (!entry.isDirectory && entry.name == entryName) {
                    // Validate entry size to prevent memory issues (100MB limit)
                    if (entry.size > MAX_IMAGE_SIZE_BYTES) {
                        throw IllegalStateException("Image file too large: ${entry.size} bytes (max ${MAX_IMAGE_SIZE_BYTES})")
                    }
                    
                    val content = ByteArray(entry.size.toInt())
                    sevenZFile.read(content)
                    return BitmapFactory.decodeByteArray(content, 0, content.size)
                }
                entry = sevenZFile.nextEntry
            }
        }
        
        return null
    }

    /**
     * Get a bitmap for a specific page from CBT archive by entry name
     */
    fun getPageBitmapFromTar(file: File, entryName: String): Bitmap? {
        TarArchiveInputStream(FileInputStream(file)).use { tarInput ->
            var entry = tarInput.nextEntry
            
            while (entry != null) {
                if (!entry.isDirectory && entry.name == entryName) {
                    // Validate entry size to prevent memory issues (100MB limit)
                    if (entry.size > MAX_IMAGE_SIZE_BYTES) {
                        throw IllegalStateException("Image file too large: ${entry.size} bytes (max ${MAX_IMAGE_SIZE_BYTES})")
                    }
                    
                    val content = ByteArray(entry.size.toInt())
                    tarInput.read(content)
                    return BitmapFactory.decodeByteArray(content, 0, content.size)
                }
                entry = tarInput.nextEntry
            }
        }
        
        return null
    }

    /**
     * Check if a filename represents an image file
     */
    private fun isImageFile(name: String): Boolean {
        val imageExtensions = setOf("jpg", "jpeg", "png", "gif", "bmp", "webp", "avif", "heic")
        val extension = name.substringAfterLast('.', "").lowercase()
        return extension in imageExtensions
    }
}

/**
 * Data class representing a comic page (compatible with ComicReaderEngine)
 */
data class ExtractedComicPage(
    val index: Int,
    val fileName: String,
    val entryName: String, // Full path within archive
    val size: Long
)
