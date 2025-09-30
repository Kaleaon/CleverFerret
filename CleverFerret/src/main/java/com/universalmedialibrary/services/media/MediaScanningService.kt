package com.universalmedialibrary.services.media

import android.content.Context
import android.webkit.MimeTypeMap
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.MediaRepository
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.security.MessageDigest
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for scanning and indexing media files in libraries
 *
 * Handles detection, indexing, and metadata extraction for all supported media types:
 * - Books: EPUB, PDF, TXT, MOBI, AZW, CBZ, CBR
 * - Music: MP3, FLAC, OGG, M4A, WAV, AAC
 * - Movies: MP4, MKV, AVI, MOV, WMV, FLV
 * - Documents: PDF, DOC, DOCX, RTF
 * - Images: JPG, PNG, GIF, BMP, WEBP
 */
@Singleton
class MediaScanningService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val libraryRepository: LibraryRepository,
    private val mediaRepository: MediaRepository
) {

    companion object {
        // Supported file extensions by media type
        val BOOK_EXTENSIONS = setOf("epub", "pdf", "txt", "mobi", "azw", "azw3", "cbz", "cbr", "fb2")
        val MUSIC_EXTENSIONS = setOf("mp3", "flac", "ogg", "m4a", "wav", "aac", "wma", "opus")
        val MOVIE_EXTENSIONS = setOf("mp4", "mkv", "avi", "mov", "wmv", "flv", "webm", "m4v")
        val DOCUMENT_EXTENSIONS = setOf("doc", "docx", "rtf", "odt", "pages")
        val IMAGE_EXTENSIONS = setOf("jpg", "jpeg", "png", "gif", "bmp", "webp", "tiff", "svg")
        val PODCAST_EXTENSIONS = setOf("mp3", "m4a", "ogg", "wav")

        private const val MIN_FILE_SIZE = 1024 // 1KB minimum
        private const val MAX_BATCH_SIZE = 50
    }

    /**
     * Scan all active libraries for media files
     */
    suspend fun scanAllLibraries(): ScanResult = withContext(Dispatchers.IO) {
        val scanResult = ScanResult()

        try {
            libraryRepository.getAllActiveLibraries().collect { libraries ->
                for (library in libraries) {
                    val libraryResult = scanLibrary(library)
                    scanResult.merge(libraryResult)
                }
            }
        } catch (e: Exception) {
            scanResult.errors.add("Failed to scan libraries: ${e.message}")
        }

        scanResult
    }

    /**
     * Scan a specific library for media files
     */
    suspend fun scanLibrary(library: Library): ScanResult = withContext(Dispatchers.IO) {
        val scanResult = ScanResult()

        try {
            val rootDir = File(library.path)
            if (!rootDir.exists() || !rootDir.isDirectory) {
                scanResult.errors.add("Library path does not exist or is not a directory: ${library.path}")
                return@withContext scanResult
            }

            val mediaItems = collectMediaFiles(rootDir, library, scanResult)

            // Save media items in batches
            val batches = mediaItems.chunked(MAX_BATCH_SIZE)
            for (batch in batches) {
                try {
                    mediaRepository.createMediaItems(batch)
                    scanResult.itemsAdded += batch.size
                } catch (e: Exception) {
                    scanResult.errors.add("Failed to save batch: ${e.message}")
                }
            }

            // Update library last scanned timestamp
            libraryRepository.updateLastScanned(library.libraryId)

        } catch (e: Exception) {
            scanResult.errors.add("Failed to scan library ${library.name}: ${e.message}")
        }

        scanResult
    }

    private suspend fun collectMediaFiles(
        directory: File,
        library: Library,
        scanResult: ScanResult
    ): List<MediaItem> {
        val mediaItems = mutableListOf<MediaItem>()
        val filesToProcess = mutableListOf<File>()

        // First collect all files recursively
        collectFilesRecursively(directory, filesToProcess)

        // Then process each file
        for (file in filesToProcess) {
            try {
                scanResult.filesProcessed++

                // Skip if file is too small
                if (file.length() < MIN_FILE_SIZE) {
                    scanResult.skippedFiles++
                    continue
                }

                val extension = file.extension.lowercase()
                val mediaType = determineMediaType(extension, library.type)

                if (mediaType == null) {
                    scanResult.skippedFiles++
                    continue
                }

                // Check if file already exists in database
                val existingItem = mediaRepository.getMediaItemByPath(file.absolutePath)
                if (existingItem != null) {
                    // Check if file was modified
                    if (existingItem.lastModified < file.lastModified()) {
                        scanResult.itemsUpdated++
                        // Update existing item
                        val updatedItem = existingItem.copy(
                            fileSize = file.length(),
                            lastModified = file.lastModified(),
                            lastScanned = System.currentTimeMillis()
                        )
                        mediaRepository.updateMediaItem(updatedItem)
                    }
                    continue
                }

                // Create new media item
                val mediaItem = MediaItem(
                    libraryId = library.libraryId,
                    filePath = file.absolutePath,
                    fileName = file.name,
                    fileExtension = extension,
                    fileSize = file.length(),
                    fileHash = generateFileHash(file),
                    mediaType = mediaType,
                    mimeType = getMimeType(file),
                    lastModified = file.lastModified(),
                    isAvailable = true
                )

                mediaItems.add(mediaItem)

            } catch (e: Exception) {
                scanResult.errors.add("Error processing file ${file.path}: ${e.message}")
            }
        }

        return mediaItems
    }

    private fun collectFilesRecursively(directory: File, files: MutableList<File>) {
        try {
            val directoryFiles = directory.listFiles() ?: return

            for (file in directoryFiles) {
                when {
                    file.isDirectory -> {
                        collectFilesRecursively(file, files)
                    }
                    file.isFile -> {
                        files.add(file)
                    }
                }
            }
        } catch (e: Exception) {
            // Skip directories that can't be read
        }
    }

    // Remove the processFile function since we've inlined it above

    private fun determineMediaType(extension: String, libraryType: String): String? {
        return when {
            extension in BOOK_EXTENSIONS -> "BOOK"
            extension in MUSIC_EXTENSIONS -> when (libraryType) {
                "MUSIC" -> "MUSIC_TRACK"
                "PODCAST" -> "PODCAST_EPISODE"
                else -> "MUSIC_TRACK"
            }
            extension in MOVIE_EXTENSIONS -> "MOVIE"
            extension in DOCUMENT_EXTENSIONS -> "DOCUMENT"
            extension in IMAGE_EXTENSIONS -> "IMAGE"
            else -> null
        }
    }

    private fun getMimeType(file: File): String? {
        return MimeTypeMap.getSingleton().getMimeTypeFromExtension(file.extension.lowercase())
    }

    private fun generateFileHash(file: File): String? {
        return try {
            val digest = MessageDigest.getInstance("MD5")
            file.inputStream().use { fis ->
                val buffer = ByteArray(8192)
                var read: Int
                while (fis.read(buffer).also { read = it } != -1) {
                    digest.update(buffer, 0, read)
                }
            }
            digest.digest().joinToString("") { "%02x".format(it) }
        } catch (e: Exception) {
            null
        }
    }
}

/**
 * Result of a media scanning operation
 */
data class ScanResult(
    var filesProcessed: Int = 0,
    var itemsAdded: Int = 0,
    var itemsUpdated: Int = 0,
    var skippedFiles: Int = 0,
    val errors: MutableList<String> = mutableListOf()
) {
    fun merge(other: ScanResult) {
        filesProcessed += other.filesProcessed
        itemsAdded += other.itemsAdded
        itemsUpdated += other.itemsUpdated
        skippedFiles += other.skippedFiles
        errors.addAll(other.errors)
    }

    val totalItems: Int get() = itemsAdded + itemsUpdated
    val hasErrors: Boolean get() = errors.isNotEmpty()
}
