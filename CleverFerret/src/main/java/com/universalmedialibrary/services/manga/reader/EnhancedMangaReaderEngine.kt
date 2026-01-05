package com.universalmedialibrary.services.manga.reader

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.ColorMatrix
import android.graphics.ColorMatrixColorFilter
import android.graphics.Paint
import android.graphics.Rect
import android.util.Log
import android.util.LruCache
import com.universalmedialibrary.services.manga.source.MangaChapter
import com.universalmedialibrary.services.manga.source.MangaPage
import com.universalmedialibrary.services.manga.source.OnlineManga
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Enhanced Manga Reader Engine
 * 
 * Advanced manga reading engine with features inspired by Futon/Kotatsu:
 * - Page preloading and caching
 * - Edge detection and border cropping
 * - Color filters (brightness, contrast, blue light)
 * - Multiple reading modes
 * - Chapter preloading
 * - Reading progress tracking
 */
@Singleton
class EnhancedMangaReaderEngine @Inject constructor(
    @ApplicationContext private val context: Context,
    private val httpClient: OkHttpClient,
    private val edgeDetector: PageEdgeDetector,
    private val webtoonScroller: WebtoonScroller
) {
    
    companion object {
        private const val TAG = "MangaReaderEngine"
        private const val CACHE_SIZE_MB = 50
        private const val PRELOAD_AHEAD = 3
        private const val PRELOAD_BEHIND = 1
    }
    
    // Page bitmap cache
    private val pageCache: LruCache<String, Bitmap> = LruCache(
        (CACHE_SIZE_MB * 1024 * 1024).toInt() / (1024 * 1024) // Simplified to MB count
    )
    
    // Current state
    private var currentManga: OnlineManga? = null
    private var currentChapter: MangaChapter? = null
    private var chapters: List<MangaChapter> = emptyList()
    private var pages: List<MangaPage> = emptyList()
    private var currentPageIndex: Int = 0
    
    // Settings
    private val _settings = MutableStateFlow(MangaReaderSettings())
    val settings: StateFlow<MangaReaderSettings> = _settings.asStateFlow()
    
    // Page state
    private val _pageState = MutableStateFlow<MangaPageState?>(null)
    val pageState: StateFlow<MangaPageState?> = _pageState.asStateFlow()
    
    // Loading state
    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()
    
    // Current page bitmap
    private val _currentPageBitmap = MutableStateFlow<Bitmap?>(null)
    val currentPageBitmap: StateFlow<Bitmap?> = _currentPageBitmap.asStateFlow()
    
    // Content bounds (for cropped pages)
    private val _contentBounds = MutableStateFlow<Rect?>(null)
    val contentBounds: StateFlow<Rect?> = _contentBounds.asStateFlow()
    
    /**
     * Load manga for reading
     */
    suspend fun loadManga(
        manga: OnlineManga,
        chapter: MangaChapter,
        pageIndex: Int = 0
    ) = withContext(Dispatchers.IO) {
        currentManga = manga
        currentChapter = chapter
        chapters = manga.chapters ?: listOf(chapter)
        currentPageIndex = pageIndex
        
        updatePageState()
    }
    
    /**
     * Load chapter pages
     */
    suspend fun loadPages(chapterPages: List<MangaPage>) {
        pages = chapterPages
        currentPageIndex = 0
        updatePageState()
        
        // Load first page
        loadPage(0)
        
        // Preload next pages
        preloadPages()
    }
    
    /**
     * Go to specific page
     */
    suspend fun goToPage(pageIndex: Int): Boolean {
        if (pageIndex < 0 || pageIndex >= pages.size) return false
        
        currentPageIndex = pageIndex
        updatePageState()
        loadPage(pageIndex)
        preloadPages()
        
        return true
    }
    
    /**
     * Go to next page
     */
    suspend fun nextPage(): Boolean {
        return if (currentPageIndex < pages.size - 1) {
            goToPage(currentPageIndex + 1)
        } else {
            // Try to go to next chapter
            nextChapter()
        }
    }
    
    /**
     * Go to previous page
     */
    suspend fun previousPage(): Boolean {
        return if (currentPageIndex > 0) {
            goToPage(currentPageIndex - 1)
        } else {
            // Try to go to previous chapter (last page)
            previousChapter(goToLastPage = true)
        }
    }
    
    /**
     * Go to next chapter
     */
    suspend fun nextChapter(): Boolean {
        val currentIndex = chapters.indexOf(currentChapter)
        if (currentIndex < chapters.size - 1) {
            val nextChapter = chapters[currentIndex + 1]
            currentChapter = nextChapter
            currentPageIndex = 0
            updatePageState()
            return true
        }
        return false
    }
    
    /**
     * Go to previous chapter
     */
    suspend fun previousChapter(goToLastPage: Boolean = false): Boolean {
        val currentIndex = chapters.indexOf(currentChapter)
        if (currentIndex > 0) {
            val prevChapter = chapters[currentIndex - 1]
            currentChapter = prevChapter
            currentPageIndex = if (goToLastPage) pages.size - 1 else 0
            updatePageState()
            return true
        }
        return false
    }
    
    /**
     * Update reader settings
     */
    fun updateSettings(newSettings: MangaReaderSettings) {
        _settings.value = newSettings
    }
    
    /**
     * Get color filter paint for rendering
     */
    fun getColorFilterPaint(): Paint? {
        val filter = _settings.value.colorFilter ?: return null
        if (filter.isEmpty) return null
        
        val paint = Paint()
        val colorMatrix = ColorMatrix()
        
        // Apply brightness
        if (filter.brightness != 0f) {
            val brightnessMatrix = ColorMatrix()
            val brightness = filter.brightness * 255
            brightnessMatrix.set(floatArrayOf(
                1f, 0f, 0f, 0f, brightness,
                0f, 1f, 0f, 0f, brightness,
                0f, 0f, 1f, 0f, brightness,
                0f, 0f, 0f, 1f, 0f
            ))
            colorMatrix.postConcat(brightnessMatrix)
        }
        
        // Apply contrast
        if (filter.contrast != 0f) {
            val contrastMatrix = ColorMatrix()
            val scale = 1f + filter.contrast
            val translate = (-.5f * scale + .5f) * 255f
            contrastMatrix.set(floatArrayOf(
                scale, 0f, 0f, 0f, translate,
                0f, scale, 0f, 0f, translate,
                0f, 0f, scale, 0f, translate,
                0f, 0f, 0f, 1f, 0f
            ))
            colorMatrix.postConcat(contrastMatrix)
        }
        
        // Apply warmth (blue light filter)
        if (filter.warmth != 0f) {
            val warmthMatrix = ColorMatrix()
            val warm = filter.warmth
            warmthMatrix.set(floatArrayOf(
                1f + warm * 0.1f, 0f, 0f, 0f, 0f,
                0f, 1f + warm * 0.05f, 0f, 0f, 0f,
                0f, 0f, 1f - warm * 0.2f, 0f, 0f,
                0f, 0f, 0f, 1f, 0f
            ))
            colorMatrix.postConcat(warmthMatrix)
        }
        
        // Apply grayscale
        if (filter.grayscale) {
            val grayscaleMatrix = ColorMatrix()
            grayscaleMatrix.setSaturation(0f)
            colorMatrix.postConcat(grayscaleMatrix)
        }
        
        // Apply inversion
        if (filter.inverted) {
            val invertMatrix = ColorMatrix(floatArrayOf(
                -1f, 0f, 0f, 0f, 255f,
                0f, -1f, 0f, 0f, 255f,
                0f, 0f, -1f, 0f, 255f,
                0f, 0f, 0f, 1f, 0f
            ))
            colorMatrix.postConcat(invertMatrix)
        }
        
        paint.colorFilter = ColorMatrixColorFilter(colorMatrix)
        return paint
    }
    
    /**
     * Clear cache and resources
     */
    fun clear() {
        pageCache.evictAll()
        currentManga = null
        currentChapter = null
        chapters = emptyList()
        pages = emptyList()
        currentPageIndex = 0
        _pageState.value = null
        _currentPageBitmap.value = null
        _contentBounds.value = null
    }
    
    // Private methods
    
    private suspend fun loadPage(pageIndex: Int) = withContext(Dispatchers.IO) {
        if (pageIndex < 0 || pageIndex >= pages.size) return@withContext
        
        _isLoading.value = true
        
        try {
            val page = pages[pageIndex]
            val cacheKey = "${currentChapter?.id}_$pageIndex"
            
            // Check cache first
            var bitmap = pageCache.get(cacheKey)
            
            if (bitmap == null) {
                // Download and decode
                bitmap = downloadPage(page)
                
                if (bitmap != null) {
                    // Apply border cropping if enabled
                    if (_settings.value.cropBorders) {
                        val bounds = edgeDetector.detectContentBounds(
                            bitmap, 
                            _settings.value.cropBordersThreshold
                        )
                        _contentBounds.value = bounds
                        
                        // Optionally crop the bitmap
                        if (bounds.left > 0 || bounds.top > 0 || 
                            bounds.right < bitmap.width || bounds.bottom < bitmap.height) {
                            bitmap = Bitmap.createBitmap(
                                bitmap,
                                bounds.left,
                                bounds.top,
                                bounds.width(),
                                bounds.height()
                            )
                        }
                    }
                    
                    // Cache the processed bitmap
                    pageCache.put(cacheKey, bitmap)
                }
            }
            
            if (pageIndex == currentPageIndex) {
                _currentPageBitmap.value = bitmap
            }
            
        } catch (e: Exception) {
            Log.e(TAG, "Failed to load page $pageIndex", e)
        } finally {
            _isLoading.value = false
        }
    }
    
    private suspend fun downloadPage(page: MangaPage): Bitmap? = withContext(Dispatchers.IO) {
        try {
            val requestBuilder = Request.Builder()
                .url(page.url)
                .header("User-Agent", "CleverFerret/1.0")
            
            page.referer?.let { requestBuilder.header("Referer", it) }
            
            httpClient.newCall(requestBuilder.build()).execute().use { response ->
                if (!response.isSuccessful) return@withContext null
                
                val bytes = response.body?.bytes() ?: return@withContext null
                BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to download page", e)
            null
        }
    }
    
    private suspend fun preloadPages() = withContext(Dispatchers.IO) {
        // Preload ahead
        for (i in 1..PRELOAD_AHEAD) {
            val idx = currentPageIndex + i
            if (idx < pages.size) {
                val cacheKey = "${currentChapter?.id}_$idx"
                if (pageCache.get(cacheKey) == null) {
                    loadPage(idx)
                }
            }
        }
        
        // Preload behind
        for (i in 1..PRELOAD_BEHIND) {
            val idx = currentPageIndex - i
            if (idx >= 0) {
                val cacheKey = "${currentChapter?.id}_$idx"
                if (pageCache.get(cacheKey) == null) {
                    loadPage(idx)
                }
            }
        }
    }
    
    private fun updatePageState() {
        val manga = currentManga ?: return
        val chapter = currentChapter ?: return
        
        _pageState.value = MangaPageState(
            pageIndex = currentPageIndex,
            totalPages = pages.size.coerceAtLeast(1),
            chapterIndex = chapters.indexOf(chapter),
            totalChapters = chapters.size,
            chapterTitle = chapter.name,
            mangaTitle = manga.title,
            progress = if (pages.isNotEmpty()) {
                (currentPageIndex + 1).toFloat() / pages.size
            } else 0f
        )
    }
}
