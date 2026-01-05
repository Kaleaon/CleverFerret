package com.universalmedialibrary.services.manga.reader

import android.graphics.Bitmap
import android.graphics.Rect
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton
import kotlin.math.max
import kotlin.math.min

/**
 * Page Edge Detector
 * 
 * Detects and crops white/black borders from manga pages
 * Inspired by Futon/Kotatsu edge detection implementation
 * 
 * Features:
 * - Automatic border detection
 * - Configurable threshold for edge detection
 * - Support for both light and dark borders
 * - Smart cropping that preserves content
 */
@Singleton
class PageEdgeDetector @Inject constructor() {
    
    companion object {
        private const val DEFAULT_THRESHOLD = 0.15f // 15% of page can be border
        private const val SCAN_SAMPLE_SIZE = 10     // Sample every Nth pixel for speed
        private const val MIN_CONTENT_RATIO = 0.5f  // At least 50% of page must be content
        private const val EDGE_COLOR_TOLERANCE = 30 // Color variance tolerance
    }
    
    /**
     * Detect content bounds in a page image
     * Returns the rectangle containing the actual content (non-border area)
     */
    suspend fun detectContentBounds(
        bitmap: Bitmap,
        threshold: Float = DEFAULT_THRESHOLD
    ): Rect = withContext(Dispatchers.Default) {
        val width = bitmap.width
        val height = bitmap.height
        
        // Determine if we're looking for light or dark borders
        val borderColor = detectBorderColor(bitmap)
        
        // Scan from each edge to find content
        val left = scanFromLeft(bitmap, borderColor, width, height, threshold)
        val right = scanFromRight(bitmap, borderColor, width, height, threshold)
        val top = scanFromTop(bitmap, borderColor, width, height, threshold)
        val bottom = scanFromBottom(bitmap, borderColor, width, height, threshold)
        
        // Ensure minimum content area
        val contentWidth = right - left
        val contentHeight = bottom - top
        
        if (contentWidth < width * MIN_CONTENT_RATIO || 
            contentHeight < height * MIN_CONTENT_RATIO) {
            // Not enough content detected, return full image
            return@withContext Rect(0, 0, width, height)
        }
        
        Rect(left, top, right, bottom)
    }
    
    /**
     * Crop a bitmap to remove borders
     */
    suspend fun cropBorders(
        bitmap: Bitmap,
        threshold: Float = DEFAULT_THRESHOLD
    ): Bitmap = withContext(Dispatchers.Default) {
        val bounds = detectContentBounds(bitmap, threshold)
        
        // Check if cropping is needed
        if (bounds.left == 0 && bounds.top == 0 && 
            bounds.right == bitmap.width && bounds.bottom == bitmap.height) {
            return@withContext bitmap
        }
        
        // Crop the bitmap
        Bitmap.createBitmap(
            bitmap,
            bounds.left,
            bounds.top,
            bounds.width(),
            bounds.height()
        )
    }
    
    /**
     * Detect if borders are light (white) or dark (black)
     */
    private fun detectBorderColor(bitmap: Bitmap): BorderColor {
        val width = bitmap.width
        val height = bitmap.height
        
        // Sample corners and edges
        val samples = mutableListOf<Int>()
        
        // Top-left corner
        for (x in 0 until min(10, width)) {
            for (y in 0 until min(10, height)) {
                samples.add(bitmap.getPixel(x, y))
            }
        }
        
        // Top-right corner
        for (x in max(0, width - 10) until width) {
            for (y in 0 until min(10, height)) {
                samples.add(bitmap.getPixel(x, y))
            }
        }
        
        // Calculate average brightness
        val avgBrightness = samples.map { pixel ->
            val r = (pixel shr 16) and 0xFF
            val g = (pixel shr 8) and 0xFF
            val b = pixel and 0xFF
            (r + g + b) / 3
        }.average()
        
        return if (avgBrightness > 200) BorderColor.LIGHT
               else if (avgBrightness < 55) BorderColor.DARK
               else BorderColor.UNKNOWN
    }
    
    private fun scanFromLeft(
        bitmap: Bitmap, 
        borderColor: BorderColor,
        width: Int, 
        height: Int,
        threshold: Float
    ): Int {
        val maxBorder = (width * threshold).toInt()
        
        for (x in 0 until min(maxBorder, width)) {
            var nonBorderCount = 0
            for (y in 0 until height step SCAN_SAMPLE_SIZE) {
                if (!isBorderPixel(bitmap.getPixel(x, y), borderColor)) {
                    nonBorderCount++
                }
            }
            val sampleCount = height / SCAN_SAMPLE_SIZE
            if (nonBorderCount > sampleCount * 0.3) {
                // Found content
                return max(0, x - 2) // Small margin
            }
        }
        return 0
    }
    
    private fun scanFromRight(
        bitmap: Bitmap, 
        borderColor: BorderColor,
        width: Int, 
        height: Int,
        threshold: Float
    ): Int {
        val maxBorder = (width * threshold).toInt()
        
        for (x in (width - 1) downTo max(width - maxBorder, 0)) {
            var nonBorderCount = 0
            for (y in 0 until height step SCAN_SAMPLE_SIZE) {
                if (!isBorderPixel(bitmap.getPixel(x, y), borderColor)) {
                    nonBorderCount++
                }
            }
            val sampleCount = height / SCAN_SAMPLE_SIZE
            if (nonBorderCount > sampleCount * 0.3) {
                return min(width, x + 2)
            }
        }
        return width
    }
    
    private fun scanFromTop(
        bitmap: Bitmap, 
        borderColor: BorderColor,
        width: Int, 
        height: Int,
        threshold: Float
    ): Int {
        val maxBorder = (height * threshold).toInt()
        
        for (y in 0 until min(maxBorder, height)) {
            var nonBorderCount = 0
            for (x in 0 until width step SCAN_SAMPLE_SIZE) {
                if (!isBorderPixel(bitmap.getPixel(x, y), borderColor)) {
                    nonBorderCount++
                }
            }
            val sampleCount = width / SCAN_SAMPLE_SIZE
            if (nonBorderCount > sampleCount * 0.3) {
                return max(0, y - 2)
            }
        }
        return 0
    }
    
    private fun scanFromBottom(
        bitmap: Bitmap, 
        borderColor: BorderColor,
        width: Int, 
        height: Int,
        threshold: Float
    ): Int {
        val maxBorder = (height * threshold).toInt()
        
        for (y in (height - 1) downTo max(height - maxBorder, 0)) {
            var nonBorderCount = 0
            for (x in 0 until width step SCAN_SAMPLE_SIZE) {
                if (!isBorderPixel(bitmap.getPixel(x, y), borderColor)) {
                    nonBorderCount++
                }
            }
            val sampleCount = width / SCAN_SAMPLE_SIZE
            if (nonBorderCount > sampleCount * 0.3) {
                return min(height, y + 2)
            }
        }
        return height
    }
    
    private fun isBorderPixel(pixel: Int, borderColor: BorderColor): Boolean {
        val r = (pixel shr 16) and 0xFF
        val g = (pixel shr 8) and 0xFF
        val b = pixel and 0xFF
        val brightness = (r + g + b) / 3
        
        return when (borderColor) {
            BorderColor.LIGHT -> brightness > (255 - EDGE_COLOR_TOLERANCE)
            BorderColor.DARK -> brightness < EDGE_COLOR_TOLERANCE
            BorderColor.UNKNOWN -> brightness > (255 - EDGE_COLOR_TOLERANCE) || 
                                   brightness < EDGE_COLOR_TOLERANCE
        }
    }
    
    private enum class BorderColor {
        LIGHT, DARK, UNKNOWN
    }
}
