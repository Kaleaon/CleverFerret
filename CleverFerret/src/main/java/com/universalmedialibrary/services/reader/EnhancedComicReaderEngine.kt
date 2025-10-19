package com.universalmedialibrary.services.reader

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Log
import com.github.junrar.Archive
import com.universalmedialibrary.services.reader.core.BookSource
import com.universalmedialibrary.services.reader.core.Locator
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.ByteArrayOutputStream
import java.io.File
import java.util.zip.ZipFile
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Enhanced Comic Reader Engine
 * 
 * Features:
 * - Full CBZ (ZIP) and CBR (RAR) support
 * - Page-by-page navigation
 * - Image caching for smooth scrolling
 * - Reading mode (fit width, fit height, original size)
 * - Double-page spread support
 * - Manga mode (right-to-left reading)
 * - Progress tracking
 * - Bookmark support
 */
@Singleton
class EnhancedComicReaderEngine @Inject constructor() {
    
    private var archiveFile: File? = null
    private var zipFile: ZipFile? = null
    private var rarArchive: Archive? = null
    private var pageFiles: List<PageFile> = emptyList()
    private var isRarFormat = false
    
    private val _currentPage = MutableStateFlow(0)
    val currentPage: StateFlow<Int> = _currentPage.asStateFlow()
    
    private val _totalPages = MutableStateFlow(0)
    val totalPages: StateFlow<Int> = _totalPages.asStateFlow()
    
    private val _readingMode = MutableStateFlow(ReadingMode.FIT_WIDTH)
    val readingMode: StateFlow<ReadingMode> = _readingMode.asStateFlow()
    
    private val _isDoublePage = MutableStateFlow(false)
    val isDoublePage: StateFlow<Boolean> = _isDoublePage.asStateFlow()
    
    private val _isMangaMode = MutableStateFlow(false)
    val isMangaMode: StateFlow<Boolean> = _isMangaMode.asStateFlow()
    
    // Image cache for smooth navigation
    private val imageCache = mutableMapOf<Int, Bitmap>()
    private var cacheSize = 3 // Cache current + next 2 pages (configurable)
    private var preloadJob: Job? = null
    
    companion object {
        private const val TAG = "EnhancedComicReader"
        private const val MAX_IMAGE_SIZE = 50L * 1024L * 1024L // 50MB safety limit
    }
    
    /**
     * Open comic archive file
     */
    suspend fun open(context: Context, filePath: String): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            val file = File(filePath)
            if (!file.exists()) {
                return@withContext Result.failure(IllegalArgumentException("File not found"))
            }
            
            archiveFile = file
            isRarFormat = file.extension.lowercase() == "cbr"
            
            // Extract page list
            pageFiles = if (isRarFormat) {
                extractRarPages(file)
            } else {
                extractZipPages(file)
            }
            
            if (pageFiles.isEmpty()) {
                return@withContext Result.failure(RuntimeException("No images found in archive"))
            }
            
            _totalPages.value = pageFiles.size
            _currentPage.value = 0
            
            // Preload first few pages
            preloadPages(0)
            
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Get current page as bitmap
     */
    suspend fun getCurrentPageBitmap(): Bitmap? {
        return getPageBitmap(_currentPage.value)
    }
    
    /**
     * Get specific page as bitmap
     */
    suspend fun getPageBitmap(pageIndex: Int): Bitmap? = withContext(Dispatchers.IO) {
        if (pageIndex !in pageFiles.indices) return@withContext null
        
        // Check cache first
        imageCache[pageIndex]?.let { return@withContext it }
        
        // Load from archive
        val bitmap = try {
            if (isRarFormat) {
                loadFromRar(pageIndex)
            } else {
                loadFromZip(pageIndex)
            }
        } catch (e: Exception) {
            null
        }
        
        // Cache the bitmap
        bitmap?.let {
            imageCache[pageIndex] = it
            trimCache()
        }
        
        bitmap
    }
    
    /**
     * Navigate to next page
     */
    suspend fun nextPage(): Boolean {
        val increment = if (_isDoublePage.value) 2 else 1
        val newPage = _currentPage.value + increment
        
        return if (newPage < _totalPages.value) {
            _currentPage.value = newPage
            // Cancel previous preload and start new one
            preloadJob?.cancel()
            preloadJob = CoroutineScope(Dispatchers.IO).launch {
                preloadPages(newPage)
            }
            true
        } else {
            false
        }
    }
    
    /**
     * Navigate to previous page
     */
    suspend fun previousPage(): Boolean {
        val decrement = if (_isDoublePage.value) 2 else 1
        val newPage = _currentPage.value - decrement
        
        return if (newPage >= 0) {
            _currentPage.value = newPage
            preloadPages(newPage)
            true
        } else {
            false
        }
    }
    
    /**
     * Go to specific page
     */
    suspend fun goToPage(pageIndex: Int): Boolean {
        return if (pageIndex in pageFiles.indices) {
            _currentPage.value = pageIndex
            preloadPages(pageIndex)
            true
        } else {
            false
        }
    }
    
    /**
     * Set reading mode
     */
    fun setReadingMode(mode: ReadingMode) {
        _readingMode.value = mode
    }
    
    /**
     * Toggle double-page mode
     */
    fun toggleDoublePage() {
        _isDoublePage.value = !_isDoublePage.value
    }
    
    /**
     * Toggle manga (right-to-left) mode
     */
    fun toggleMangaMode() {
        _isMangaMode.value = !_isMangaMode.value
    }
    
    /**
     * Get reading progress
     */
    fun getProgress(): Float {
        return if (_totalPages.value > 0) {
            (_currentPage.value + 1).toFloat() / _totalPages.value.toFloat()
        } else {
            0f
        }
    }
    
    /**
     * Close and cleanup
     */
    fun close() {
        // Cancel any ongoing preload
        preloadJob?.cancel()
        preloadJob = null
        
        // Recycle bitmaps before clearing cache
        imageCache.values.forEach { it.recycle() }
        imageCache.clear()
        
        zipFile?.close()
        zipFile = null
        rarArchive?.close()
        rarArchive = null
        archiveFile = null
        pageFiles = emptyList()
    }
    
    // Private helper methods
    
    private fun extractZipPages(file: File): List<PageFile> {
        val zip = ZipFile(file)
        zipFile = zip
        
        val imageExtensions = setOf("jpg", "jpeg", "png", "webp", "bmp", "gif")
        
        return zip.entries().toList()
            .filter { !it.isDirectory }
            .filter { entry ->
                val ext = entry.name.substringAfterLast('.', "").lowercase()
                ext in imageExtensions
            }
            .sortedBy { it.name }
            .mapIndexed { index, entry ->
                PageFile(
                    fileName = File(entry.name).name,
                    entryName = entry.name,
                    pageNumber = index + 1
                )
            }
    }
    
    private fun extractRarPages(file: File): List<PageFile> {
        val archive = Archive(file)
        rarArchive = archive
        
        val imageExtensions = setOf("jpg", "jpeg", "png", "webp", "bmp", "gif")
        
        return archive.fileHeaders
            .filter { !it.isDirectory }
            .filter { header ->
                val ext = header.fileName.substringAfterLast('.', "").lowercase()
                ext in imageExtensions
            }
            .sortedBy { it.fileName }
            .mapIndexed { index, header ->
                PageFile(
                    fileName = File(header.fileName).name,
                    entryName = header.fileName,
                    pageNumber = index + 1
                )
            }
    }
    
    private fun loadFromZip(pageIndex: Int): Bitmap? {
        val zip = zipFile ?: return null
        val pageFile = pageFiles.getOrNull(pageIndex) ?: return null
        
        val entry = zip.getEntry(pageFile.entryName)
        return zip.getInputStream(entry).use { stream ->
            BitmapFactory.decodeStream(stream)
        }
    }
    
    private fun loadFromRar(pageIndex: Int): Bitmap? {
        val rar = rarArchive ?: return null
        val pageFile = pageFiles.getOrNull(pageIndex) ?: return null
        
        val header = rar.fileHeaders.find { it.fileName == pageFile.entryName } ?: return null
        
        // Check size to prevent overflow/OOM
        if (header.fullUnpackSize > MAX_IMAGE_SIZE) {
            Log.w(TAG, "Page $pageIndex exceeds max size: ${header.fullUnpackSize} bytes")
            return null
        }
        
        // Stream into ByteArrayOutputStream to avoid pre-allocation and partial reads
        return rar.getInputStream(header).use { input ->
            val outputStream = ByteArrayOutputStream()
            input.copyTo(outputStream)
            val bytes = outputStream.toByteArray()
            BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
        }
    }
    
    private suspend fun preloadPages(fromIndex: Int) = withContext(Dispatchers.IO) {
        // Preload current + next pages
        for (i in fromIndex until minOf(fromIndex + cacheSize, _totalPages.value)) {
            if (!imageCache.containsKey(i)) {
                getPageBitmap(i) // This will cache it
            }
        }
    }
    
    private fun trimCache() {
        if (imageCache.size > cacheSize * 2) {
            val currentPage = _currentPage.value
            imageCache.keys.filter { it < currentPage - cacheSize || it > currentPage + cacheSize }
                .forEach { key ->
                    imageCache.remove(key)?.recycle() // Explicit bitmap cleanup
                }
        }
    }
    
    /**
     * Configure cache size based on available memory
     */
    fun setCacheSize(size: Int) {
        this.cacheSize = size.coerceIn(1, 10) // Min 1, max 10 pages
    }
    
    data class PageFile(
        val fileName: String,
        val entryName: String,
        val pageNumber: Int
    )
    
    enum class ReadingMode {
        FIT_WIDTH,      // Fit to screen width
        FIT_HEIGHT,     // Fit to screen height
        FIT_SCREEN,     // Fit entire page to screen
        ORIGINAL_SIZE   // No scaling
    }
}
