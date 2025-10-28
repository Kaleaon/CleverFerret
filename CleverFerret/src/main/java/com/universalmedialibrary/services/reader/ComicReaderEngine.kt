package com.universalmedialibrary.services.reader

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import com.github.junrar.Archive
import com.github.junrar.rarfile.FileHeader
import com.universalmedialibrary.services.reader.core.BookSource
import com.universalmedialibrary.services.reader.core.Locator
import com.universalmedialibrary.services.reader.core.ReaderEngine
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.io.File
import java.util.zip.ZipFile
import javax.inject.Inject

/**
 * Comic Book Archive Reader Engine for CBZ and CBR formats.
 *
 * Features:
 * - Page-by-page image rendering
 * - Support for CBZ (ZIP) and CBR (RAR) archives
 * - Sequential page navigation
 * - Image caching for performance
 * - Progress tracking by page number
 * - Support for various image formats (JPEG, PNG, WebP, etc.)
 */
class ComicReaderEngine @Inject constructor() : ReaderEngine {

    override val bookId: String get() = currentBookId

    private var currentBookId: String = ""
    private var archiveFile: File? = null
    private var zipFile: ZipFile? = null
    private var rarArchive: Archive? = null
    private var pageEntries: List<ComicPage> = emptyList()
    private var currentPageIndex: Int = 0
    private var isRarFormat: Boolean = false

    private val _currentLocator = MutableStateFlow(
        Locator(href = "", locations = emptyMap())
    )
    override val currentLocator: Flow<Locator> = _currentLocator.asStateFlow()

    override suspend fun open(context: Context, source: BookSource): Result<Unit> {
        return withContext(Dispatchers.IO) {
            try {
                val file = when (source) {
                    is BookSource.File -> {
                        when (source.uri.scheme) {
                            "file" -> File(source.uri.path!!)
                            "content" -> {
                                // Copy content URI to temp file
                                val extension = source.uri.toString().substringAfterLast(".")
                                val tempFile = File(
                                    context.cacheDir,
                                    "temp_comic_${System.currentTimeMillis()}.$extension"
                                )
                                context.contentResolver.openInputStream(source.uri)?.use { input ->
                                    tempFile.outputStream().use { output ->
                                        input.copyTo(output)
                                    }
                                }
                                tempFile
                            }
                            else -> return@withContext Result.failure(
                                IllegalArgumentException("Unsupported URI scheme: ${source.uri.scheme}")
                            )
                        }
                    }
                    is BookSource.Stream -> {
                        // Streaming support for remote comic archives planned for future release
                        // Would require: HTTP range request support and progressive loading
                        return@withContext Result.failure(
                            UnsupportedOperationException("Stream sources not yet implemented")
                        )
                    }
                }

                if (!file.exists()) {
                    return@withContext Result.failure(
                        IllegalArgumentException("Comic archive file not found")
                    )
                }

                // Determine format and parse archive
                isRarFormat = file.extension.lowercase() == "cbr"

                if (isRarFormat) {
                    // CBR format (RAR) - using junrar library
                    try {
                        pageEntries = extractRarImageEntries(file)
                    } catch (e: Exception) {
                        return@withContext Result.failure(
                            RuntimeException("Failed to read CBR archive: ${e.message}", e)
                        )
                    }
                } else {
                    // CBZ format (ZIP)
                    zipFile = ZipFile(file)
                    pageEntries = extractImageEntries(zipFile!!)
                }

                if (pageEntries.isEmpty()) {
                    return@withContext Result.failure(
                        RuntimeException("No valid image pages found in comic archive")
                    )
                }

                archiveFile = file
                currentBookId = file.absolutePath
                currentPageIndex = 0

                // Initialize locator to first page
                updateCurrentLocator(0)

                Result.success(Unit)

            } catch (e: Exception) {
                // Clean up on error
                close()
                Result.failure(e)
            }
        }
    }

    override suspend fun goTo(locator: Locator): Result<Unit> {
        return try {
            val pageIndex = locator.locations["pageIndex"] as? Int ?: 0

            if (pageIndex in pageEntries.indices) {
                currentPageIndex = pageIndex
                updateCurrentLocator(pageIndex)
                Result.success(Unit)
            } else {
                Result.failure(IndexOutOfBoundsException("Page index out of bounds"))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    override suspend fun next(): Boolean {
        return if (currentPageIndex < pageEntries.size - 1) {
            currentPageIndex++
            updateCurrentLocator(currentPageIndex)
            true
        } else {
            false
        }
    }

    override suspend fun previous(): Boolean {
        return if (currentPageIndex > 0) {
            currentPageIndex--
            updateCurrentLocator(currentPageIndex)
            true
        } else {
            false
        }
    }

    override suspend fun search(query: String): List<Locator> {
        // Comic books typically don't have searchable text content
        // Could potentially implement OCR-based search in the future
        return emptyList()
    }

    override suspend fun close() {
        zipFile?.close()
        zipFile = null
        rarArchive?.close()
        rarArchive = null
        archiveFile = null
        pageEntries = emptyList()
        currentBookId = ""
        currentPageIndex = 0
    }

    /**
     * Get current page as bitmap
     */
    suspend fun getCurrentPageBitmap(): Bitmap? {
        return getPageBitmap(currentPageIndex)
    }

    /**
     * Get specific page as bitmap
     */
    suspend fun getPageBitmap(pageIndex: Int): Bitmap? {
        return withContext(Dispatchers.IO) {
            if (pageIndex !in pageEntries.indices) return@withContext null

            val page = pageEntries[pageIndex]

            try {
                if (isRarFormat) {
                    // Extract from RAR
                    val rar = rarArchive ?: return@withContext null
                    var matchingHeader: FileHeader? = null
                    
                    // Find the header for this page
                    val headersList = rar.fileHeaders.toList()
                    for (header in headersList) {
                        if (!header.isDirectory && header.fileName == page.entryName) {
                            matchingHeader = header
                            break
                        }
                    }
                    
                    if (matchingHeader != null) {
                        val inputStream = rar.getInputStream(matchingHeader)
                        val bytes = inputStream.readBytes()
                        inputStream.close()
                        BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
                    } else {
                        null
                    }
                } else {
                    // Extract from ZIP
                    val zip = zipFile ?: return@withContext null
                    val entry = zip.getEntry(page.entryName)
                    zip.getInputStream(entry).use { inputStream ->
                        BitmapFactory.decodeStream(inputStream)
                    }
                }
            } catch (e: Exception) {
                null
            }
        }
    }

    /**
     * Navigate to specific page
     */
    suspend fun goToPage(pageIndex: Int): Boolean {
        return if (pageIndex in pageEntries.indices) {
            currentPageIndex = pageIndex
            updateCurrentLocator(pageIndex)
            true
        } else {
            false
        }
    }

    /**
     * Get current page information
     */
    fun getCurrentPageInfo(): ComicPageInfo? {
        return if (currentPageIndex in pageEntries.indices) {
            val page = pageEntries[currentPageIndex]
            ComicPageInfo(
                pageIndex = currentPageIndex,
                pageNumber = currentPageIndex + 1,
                totalPages = pageEntries.size,
                fileName = page.fileName,
                entryName = page.entryName
            )
        } else null
    }

    /**
     * Get progress information
     */
    fun getProgress(): ComicProgress {
        val progressPercentage = if (pageEntries.isNotEmpty()) {
            ((currentPageIndex + 1).toFloat() / pageEntries.size.toFloat()) * 100f
        } else 0f

        return ComicProgress(
            currentPage = currentPageIndex + 1,
            totalPages = pageEntries.size,
            progressPercentage = progressPercentage
        )
    }

    /**
     * Get all pages information
     */
    fun getAllPages(): List<ComicPage> {
        return pageEntries
    }

    private fun extractImageEntries(zipFile: ZipFile): List<ComicPage> {
        val imageExtensions = setOf("jpg", "jpeg", "png", "gif", "bmp", "webp")
        val pages = mutableListOf<ComicPage>()

        zipFile.entries().asSequence()
            .filter { entry ->
                !entry.isDirectory &&
                imageExtensions.contains(entry.name.substringAfterLast(".").lowercase()) &&
                !entry.name.contains("__MACOSX") && // Exclude macOS metadata
                !entry.name.startsWith(".") // Exclude hidden files
            }
            .sortedBy { it.name } // Sort alphabetically for proper page order
            .forEachIndexed { index, entry ->
                pages.add(
                    ComicPage(
                        index = index,
                        fileName = entry.name.substringAfterLast("/"),
                        entryName = entry.name,
                        size = entry.size
                    )
                )
            }

        return pages
    }
    
    /**
     * Extract image entries from RAR archive
     */
    private fun extractRarImageEntries(file: File): List<ComicPage> {
        val archive = Archive(file)
        rarArchive = archive
        
        val imageExtensions = setOf("jpg", "jpeg", "png", "webp", "bmp", "gif")
        val pages = mutableListOf<ComicPage>()
        
        val headersList = archive.fileHeaders.toList()
        headersList
            .filter { header ->
                !header.isDirectory &&
                imageExtensions.contains(header.fileName.substringAfterLast(".").lowercase()) &&
                !header.fileName.contains("__MACOSX") &&
                !header.fileName.substringAfterLast('/').startsWith(".")
            }
            .sortedBy { it.fileName }
            .forEachIndexed { index, header ->
                pages.add(
                    ComicPage(
                        index = index,
                        fileName = File(header.fileName).name,
                        entryName = header.fileName,
                        size = header.fullUnpackSize
                    )
                )
            }
        
        return pages
    }

    private fun updateCurrentLocator(pageIndex: Int) {
        val page = if (pageIndex in pageEntries.indices) pageEntries[pageIndex] else null

        _currentLocator.value = Locator(
            href = page?.entryName ?: "",
            locations = mapOf(
                "pageIndex" to pageIndex,
                "pageNumber" to pageIndex + 1,
                "totalPages" to pageEntries.size
            ),
            text = "Page ${pageIndex + 1} of ${pageEntries.size}"
        )
    }
}

/**
 * Represents a single page in a comic book archive
 */
data class ComicPage(
    val index: Int,
    val fileName: String,
    val entryName: String, // Full path within archive
    val size: Long
)

/**
 * Information about current comic page
 */
data class ComicPageInfo(
    val pageIndex: Int,
    val pageNumber: Int,
    val totalPages: Int,
    val fileName: String,
    val entryName: String
)

/**
 * Progress information for comic reading
 */
data class ComicProgress(
    val currentPage: Int,
    val totalPages: Int,
    val progressPercentage: Float
)
