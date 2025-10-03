package com.universalmedialibrary.ui.reader

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Color
import android.net.Uri
import androidx.compose.ui.geometry.Rect
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.ui.viewer.MediaViewerManager
import com.universalmedialibrary.ui.viewer.common.ComicSettings
import com.universalmedialibrary.ui.viewer.common.ViewerSettings
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import org.apache.commons.compress.archivers.zip.ZipArchiveInputStream
import java.io.ByteArrayInputStream
import java.io.File
import java.io.FileOutputStream
import java.util.*
import javax.inject.Inject
import kotlin.collections.ArrayList
import kotlin.math.abs
import kotlin.math.max
import kotlin.math.min

@HiltViewModel
class AdvancedComicReaderViewModel @Inject constructor(
    private val mediaViewerManager: MediaViewerManager
) : ViewModel() {

    private val _uiState = MutableStateFlow(AdvancedComicReaderUiState())
    val uiState: StateFlow<AdvancedComicReaderUiState> = _uiState.asStateFlow()

    private var extractedPages: List<String> = emptyList()
    private var panelDetector: GeometricPanelDetector? = null

    fun loadComic(context: Context, comicUri: Uri) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(
                    isLoading = true,
                    error = null
                )

                val mediaInfo = mediaViewerManager.analyzeMedia(context, comicUri)
                
                when (mediaInfo.comicFormat) {
                    MediaViewerManager.ComicFormat.CBZ -> {
                        extractedPages = extractCBZ(context, comicUri)
                    }
                    MediaViewerManager.ComicFormat.CBR -> {
                        extractedPages = extractCBR(context, comicUri)
                    }
                    MediaViewerManager.ComicFormat.PDF_COMIC -> {
                        // Handle PDF as comic (would need PDF page extraction)
                        extractedPages = extractPDFPages(context, comicUri)
                    }
                    else -> {
                        throw Exception("Unsupported comic format")
                    }
                }

                val fileName = comicUri.lastPathSegment ?: "Unknown Comic"
                panelDetector = GeometricPanelDetector()

                _uiState.value = _uiState.value.copy(
                    isLoaded = true,
                    isLoading = false,
                    title = fileName.substringBeforeLast('.'),
                    pages = extractedPages,
                    totalPages = extractedPages.size,
                    currentPage = 1
                )

                // Detect panels for the first page
                if (extractedPages.isNotEmpty()) {
                    detectPanelsForCurrentPage(context)
                }

            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to load comic: ${e.message}"
                )
            }
        }
    }

    private suspend fun extractCBZ(context: Context, comicUri: Uri): List<String> {
        return withContext(Dispatchers.IO) {
            val extractedFiles = mutableListOf<String>()
            val tempDir = File(context.cacheDir, "comic_${UUID.randomUUID()}")
            tempDir.mkdirs()

            try {
                context.contentResolver.openInputStream(comicUri)?.use { inputStream ->
                    ZipArchiveInputStream(inputStream).use { zipStream ->
                        var entry = zipStream.nextZipEntry
                        
                        while (entry != null) {
                            if (!entry.isDirectory && isImageFile(entry.name)) {
                                val file = File(tempDir, entry.name)
                                file.parentFile?.mkdirs()
                                
                                FileOutputStream(file).use { outputStream ->
                                    zipStream.copyTo(outputStream)
                                }
                                
                                extractedFiles.add(file.absolutePath)
                            }
                            entry = zipStream.nextZipEntry
                        }
                    }
                }
                
                // Sort files naturally (1, 2, 3... instead of 1, 10, 11, 2...)
                extractedFiles.sortWith(compareBy { naturalSort(it) })
                
            } catch (e: Exception) {
                tempDir.deleteRecursively()
                throw e
            }
            
            extractedFiles
        }
    }

    private suspend fun extractCBR(context: Context, comicUri: Uri): List<String> {
        return withContext(Dispatchers.IO) {
            // CBR extraction would require RAR library
            // For now, return empty list with error
            throw Exception("CBR format not yet supported. Please use CBZ format.")
        }
    }

    private suspend fun extractPDFPages(context: Context, comicUri: Uri): List<String> {
        return withContext(Dispatchers.IO) {
            // PDF page extraction would require PDF library
            // For now, return empty list with error
            throw Exception("PDF comic format not yet supported. Please use CBZ format.")
        }
    }

    private fun isImageFile(filename: String): Boolean {
        val extension = filename.substringAfterLast('.', "").lowercase()
        return extension in listOf("jpg", "jpeg", "png", "gif", "bmp", "webp")
    }

    private fun naturalSort(path: String): String {
        val filename = File(path).nameWithoutExtension
        return filename.replace(Regex("\\d+")) { match ->
            match.value.padStart(10, '0')
        }
    }

    fun setCurrentPage(page: Int) {
        val clampedPage = page.coerceIn(1, _uiState.value.totalPages)
        if (clampedPage != _uiState.value.currentPage) {
            _uiState.value = _uiState.value.copy(
                currentPage = clampedPage,
                currentPanel = 0
            )
            
            // Detect panels for the new page
            viewModelScope.launch {
                detectPanelsForCurrentPage(null) // Context will be preserved from previous call
            }
        }
    }

    fun nextPage() {
        val nextPage = _uiState.value.currentPage + 1
        if (nextPage <= _uiState.value.totalPages) {
            setCurrentPage(nextPage)
        }
    }

    fun previousPage() {
        val prevPage = _uiState.value.currentPage - 1
        if (prevPage >= 1) {
            setCurrentPage(prevPage)
        }
    }

    fun setCurrentPanel(panel: Int) {
        val maxPanel = _uiState.value.currentPagePanels.size - 1
        val clampedPanel = panel.coerceIn(0, maxPanel)
        
        _uiState.value = _uiState.value.copy(currentPanel = clampedPanel)
        
        // Update current panel rect for guided view
        if (clampedPanel < _uiState.value.currentPagePanels.size) {
            _uiState.value = _uiState.value.copy(
                currentPanelRect = _uiState.value.currentPagePanels[clampedPanel]
            )
        }
    }

    fun nextPanel() {
        val currentPanel = _uiState.value.currentPanel
        val totalPanels = _uiState.value.currentPagePanels.size
        
        if (currentPanel < totalPanels - 1) {
            setCurrentPanel(currentPanel + 1)
        } else {
            // Move to next page and reset to first panel
            nextPage()
        }
    }

    fun previousPanel() {
        val currentPanel = _uiState.value.currentPanel
        
        if (currentPanel > 0) {
            setCurrentPanel(currentPanel - 1)
        } else {
            // Move to previous page and go to last panel
            val prevPage = _uiState.value.currentPage - 1
            if (prevPage >= 1) {
                setCurrentPage(prevPage)
                // Will be set to last panel after panels are detected
                viewModelScope.launch {
                    // Wait for panel detection to complete
                    kotlinx.coroutines.delay(100)
                    val lastPanel = _uiState.value.currentPagePanels.size - 1
                    if (lastPanel >= 0) {
                        setCurrentPanel(lastPanel)
                    }
                }
            }
        }
    }

    fun togglePanelByPanelMode() {
        val newSettings = _uiState.value.comicSettings.copy(
            panelByPanelMode = !_uiState.value.comicSettings.panelByPanelMode
        )
        _uiState.value = _uiState.value.copy(comicSettings = newSettings)
    }

    fun updateSettings(settings: ViewerSettings) {
        _uiState.value = _uiState.value.copy(settings = settings)
    }

    fun updateComicSettings(comicSettings: ComicSettings) {
        _uiState.value = _uiState.value.copy(comicSettings = comicSettings)
        
        // Re-detect panels if detection settings changed
        if (comicSettings.smartPanelDetection != _uiState.value.comicSettings.smartPanelDetection) {
            viewModelScope.launch {
                detectPanelsForCurrentPage(null)
            }
        }
    }

    private suspend fun detectPanelsForCurrentPage(context: Context?) {
        if (!_uiState.value.comicSettings.smartPanelDetection) {
            _uiState.value = _uiState.value.copy(
                currentPagePanels = emptyList(),
                currentPanelRect = null
            )
            return
        }

        withContext(Dispatchers.IO) {
            try {
                val currentPagePath = extractedPages[_uiState.value.currentPage - 1]
                val bitmap = BitmapFactory.decodeFile(currentPagePath)
                
                val panels = panelDetector?.detectPanels(bitmap) ?: emptyList()
                
                _uiState.value = _uiState.value.copy(
                    currentPagePanels = panels,
                    currentPanelRect = if (panels.isNotEmpty()) panels[0] else null
                )
                
                // Update all page panels map
                val updatedAllPanels = _uiState.value.allPagePanels.toMutableMap()
                updatedAllPanels[_uiState.value.currentPage] = panels
                _uiState.value = _uiState.value.copy(allPagePanels = updatedAllPanels)
                
            } catch (e: Exception) {
                // Fallback to no panels if detection fails
                _uiState.value = _uiState.value.copy(
                    currentPagePanels = emptyList(),
                    currentPanelRect = null
                )
            }
        }
    }
}

/**
 * Geometric Panel Detection Algorithm
 * Uses edge detection and contour finding to identify comic panels
 */
class GeometricPanelDetector {
    
    fun detectPanels(bitmap: Bitmap): List<Rect> {
        return try {
            val panels = mutableListOf<Rect>()
            
            // Convert to grayscale for edge detection
            val grayBitmap = toGrayscale(bitmap)
            
            // Apply edge detection
            val edgeBitmap = detectEdges(grayBitmap)
            
            // Find rectangular contours that could be panels
            val contours = findRectangularContours(edgeBitmap)
            
            // Filter and refine contours to get actual panels
            val refinedPanels = refineContours(contours, bitmap.width, bitmap.height)
            
            // Sort panels by reading order (top to bottom, left to right)
            refinedPanels.sortedWith(compareBy<Rect> { it.top }.thenBy { it.left })
            
        } catch (e: Exception) {
            // Fallback: create a simple grid-based panel detection
            createGridPanels(bitmap.width, bitmap.height)
        }
    }
    
    private fun toGrayscale(bitmap: Bitmap): Bitmap {
        val grayBitmap = Bitmap.createBitmap(bitmap.width, bitmap.height, Bitmap.Config.RGB_565)
        
        for (x in 0 until bitmap.width) {
            for (y in 0 until bitmap.height) {
                val pixel = bitmap.getPixel(x, y)
                val gray = (Color.red(pixel) * 0.299 + Color.green(pixel) * 0.587 + Color.blue(pixel) * 0.114).toInt()
                val grayPixel = Color.rgb(gray, gray, gray)
                grayBitmap.setPixel(x, y, grayPixel)
            }
        }
        
        return grayBitmap
    }
    
    private fun detectEdges(bitmap: Bitmap): Bitmap {
        val edgeBitmap = Bitmap.createBitmap(bitmap.width, bitmap.height, Bitmap.Config.RGB_565)
        
        // Simple Sobel edge detection
        for (x in 1 until bitmap.width - 1) {
            for (y in 1 until bitmap.height - 1) {
                val gx = sobelX(bitmap, x, y)
                val gy = sobelY(bitmap, x, y)
                val magnitude = kotlin.math.sqrt((gx * gx + gy * gy).toDouble()).toInt()
                
                val edgeValue = magnitude.coerceIn(0, 255)
                val edgePixel = Color.rgb(edgeValue, edgeValue, edgeValue)
                edgeBitmap.setPixel(x, y, edgePixel)
            }
        }
        
        return edgeBitmap
    }
    
    private fun sobelX(bitmap: Bitmap, x: Int, y: Int): Int {
        val kernel = arrayOf(
            intArrayOf(-1, 0, 1),
            intArrayOf(-2, 0, 2),
            intArrayOf(-1, 0, 1)
        )
        
        var sum = 0
        for (i in -1..1) {
            for (j in -1..1) {
                val pixel = bitmap.getPixel(x + i, y + j)
                val gray = Color.red(pixel) // Already grayscale
                sum += gray * kernel[i + 1][j + 1]
            }
        }
        
        return sum
    }
    
    private fun sobelY(bitmap: Bitmap, x: Int, y: Int): Int {
        val kernel = arrayOf(
            intArrayOf(-1, -2, -1),
            intArrayOf(0, 0, 0),
            intArrayOf(1, 2, 1)
        )
        
        var sum = 0
        for (i in -1..1) {
            for (j in -1..1) {
                val pixel = bitmap.getPixel(x + i, y + j)
                val gray = Color.red(pixel) // Already grayscale
                sum += gray * kernel[i + 1][j + 1]
            }
        }
        
        return sum
    }
    
    private fun findRectangularContours(edgeBitmap: Bitmap): List<Rect> {
        val contours = mutableListOf<Rect>()
        val visited = Array(edgeBitmap.width) { BooleanArray(edgeBitmap.height) }
        
        // Simplified contour detection - look for rectangular regions with strong edges
        for (x in 0 until edgeBitmap.width step 20) {
            for (y in 0 until edgeBitmap.height step 20) {
                if (!visited[x][y] && isEdgePixel(edgeBitmap, x, y)) {
                    val rect = traceRectangle(edgeBitmap, x, y, visited)
                    if (rect != null && isValidPanel(rect, edgeBitmap.width, edgeBitmap.height)) {
                        contours.add(rect)
                    }
                }
            }
        }
        
        return contours
    }
    
    private fun isEdgePixel(bitmap: Bitmap, x: Int, y: Int): Boolean {
        val pixel = bitmap.getPixel(x, y)
        val intensity = Color.red(pixel) // Grayscale value
        return intensity > 100 // Threshold for edge detection
    }
    
    private fun traceRectangle(bitmap: Bitmap, startX: Int, startY: Int, visited: Array<BooleanArray>): Rect? {
        // Simplified rectangle tracing - look for rectangular regions
        var left = startX
        var right = startX
        var top = startY
        var bottom = startY
        
        // Expand rectangle to find bounds
        val maxExpansion = 200
        var expansion = 0
        
        while (expansion < maxExpansion) {
            var expanded = false
            
            // Try to expand right
            if (right + 20 < bitmap.width && hasVerticalEdge(bitmap, right + 20, top, bottom)) {
                right += 20
                expanded = true
            }
            
            // Try to expand down
            if (bottom + 20 < bitmap.height && hasHorizontalEdge(bitmap, left, right, bottom + 20)) {
                bottom += 20
                expanded = true
            }
            
            if (!expanded) break
            expansion++
        }
        
        val width = right - left
        val height = bottom - top
        
        return if (width > 50 && height > 50) {
            Rect(left.toFloat(), top.toFloat(), width.toFloat(), height.toFloat())
        } else {
            null
        }
    }
    
    private fun hasVerticalEdge(bitmap: Bitmap, x: Int, top: Int, bottom: Int): Boolean {
        var edgeCount = 0
        val samplePoints = 10
        val step = max(1, (bottom - top) / samplePoints)
        
        for (y in top until bottom step step) {
            if (y < bitmap.height && isEdgePixel(bitmap, x, y)) {
                edgeCount++
            }
        }
        
        return edgeCount > samplePoints / 3
    }
    
    private fun hasHorizontalEdge(bitmap: Bitmap, left: Int, right: Int, y: Int): Boolean {
        var edgeCount = 0
        val samplePoints = 10
        val step = max(1, (right - left) / samplePoints)
        
        for (x in left until right step step) {
            if (x < bitmap.width && isEdgePixel(bitmap, x, y)) {
                edgeCount++
            }
        }
        
        return edgeCount > samplePoints / 3
    }
    
    private fun isValidPanel(rect: Rect, imageWidth: Int, imageHeight: Int): Boolean {
        val minSize = min(imageWidth, imageHeight) * 0.1f
        val maxSize = min(imageWidth, imageHeight) * 0.8f
        
        return rect.width >= minSize && 
               rect.height >= minSize && 
               rect.width <= maxSize && 
               rect.height <= maxSize &&
               rect.width * rect.height >= minSize * minSize * 4 // Minimum area
    }
    
    private fun refineContours(contours: List<Rect>, imageWidth: Int, imageHeight: Int): List<Rect> {
        // Remove overlapping panels and merge nearby ones
        val refinedPanels = mutableListOf<Rect>()
        
        for (contour in contours) {
            var shouldAdd = true
            var mergedContour = contour
            
            // Check for overlaps and merges
            for (i in refinedPanels.indices.reversed()) {
                val existing = refinedPanels[i]
                
                if (doRectsOverlap(contour, existing)) {
                    if (getOverlapArea(contour, existing) > 0.3f * min(contour.width * contour.height, existing.width * existing.height)) {
                        // Significant overlap - merge them
                        mergedContour = mergeRects(contour, existing)
                        refinedPanels.removeAt(i)
                    } else {
                        // Small overlap - keep the larger one
                        if (contour.width * contour.height > existing.width * existing.height) {
                            refinedPanels.removeAt(i)
                        } else {
                            shouldAdd = false
                            break
                        }
                    }
                }
            }
            
            if (shouldAdd) {
                refinedPanels.add(mergedContour)
            }
        }
        
        return refinedPanels
    }
    
    private fun doRectsOverlap(rect1: Rect, rect2: Rect): Boolean {
        return !(rect1.right < rect2.left || 
                rect2.right < rect1.left || 
                rect1.bottom < rect2.top || 
                rect2.bottom < rect1.top)
    }
    
    private fun getOverlapArea(rect1: Rect, rect2: Rect): Float {
        val left = max(rect1.left, rect2.left)
        val top = max(rect1.top, rect2.top)
        val right = min(rect1.right, rect2.right)
        val bottom = min(rect1.bottom, rect2.bottom)
        
        return if (left < right && top < bottom) {
            (right - left) * (bottom - top)
        } else {
            0f
        }
    }
    
    private fun mergeRects(rect1: Rect, rect2: Rect): Rect {
        val left = min(rect1.left, rect2.left)
        val top = min(rect1.top, rect2.top)
        val right = max(rect1.right, rect2.right)
        val bottom = max(rect1.bottom, rect2.bottom)
        
        return Rect(left, top, right - left, bottom - top)
    }
    
    private fun createGridPanels(width: Int, height: Int): List<Rect> {
        // Fallback: create a simple 2x3 grid of panels
        val panels = mutableListOf<Rect>()
        val cols = 2
        val rows = 3
        
        val panelWidth = width.toFloat() / cols
        val panelHeight = height.toFloat() / rows
        
        for (row in 0 until rows) {
            for (col in 0 until cols) {
                val left = col * panelWidth
                val top = row * panelHeight
                panels.add(Rect(left, top, panelWidth * 0.9f, panelHeight * 0.9f))
            }
        }
        
        return panels
    }
}

data class AdvancedComicReaderUiState(
    val isLoading: Boolean = false,
    val isLoaded: Boolean = false,
    val error: String? = null,
    val title: String = "",
    
    // Page management
    val pages: List<String> = emptyList(),
    val currentPage: Int = 1,
    val totalPages: Int = 1,
    
    // Panel management
    val currentPagePanels: List<Rect> = emptyList(),
    val allPagePanels: Map<Int, List<Rect>> = emptyMap(),
    val currentPanel: Int = 0,
    val currentPanelRect: Rect? = null,
    
    // Settings
    val settings: ViewerSettings = ViewerSettings(),
    val comicSettings: ComicSettings = ComicSettings()
)