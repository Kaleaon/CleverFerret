package com.universalmedialibrary.services.comic

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Rect
import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.opencv.android.Utils
import org.opencv.core.*
import org.opencv.imgproc.Imgproc
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton
import kotlin.math.abs

/**
 * Comic Panel Detector
 * 
 * Uses OpenCV edge detection and contour analysis to detect comic panels
 * Supports various comic layouts including:
 * - Traditional grid layouts
 * - Irregular/artistic layouts
 * - Manga-style panels
 * - Splash pages
 */
@Singleton
class ComicPanelDetector @Inject constructor() {
    
    companion object {
        private const val TAG = "ComicPanelDetector"
        
        // Detection parameters
        private const val CANNY_THRESHOLD_LOW = 50.0
        private const val CANNY_THRESHOLD_HIGH = 150.0
        private const val MIN_PANEL_AREA_RATIO = 0.02 // 2% of image area
        private const val MAX_PANEL_AREA_RATIO = 0.95 // 95% of image area
        private const val CONTOUR_APPROX_EPSILON = 0.02
    }
    
    /**
     * Detect panels in a comic page image
     */
    suspend fun detectPanels(imagePath: String, pageNumber: Int): PanelDetectionResult {
        return withContext(Dispatchers.Default) {
            try {
                val bitmap = BitmapFactory.decodeFile(imagePath)
                detectPanelsFromBitmap(bitmap, pageNumber)
            } catch (e: Exception) {
                Log.e(TAG, "Error detecting panels: ${e.message}", e)
                PanelDetectionResult(
                    pageNumber = pageNumber,
                    panels = emptyList(),
                    detectionMethod = "failed",
                    confidence = 0.0f,
                    error = e.message
                )
            }
        }
    }
    
    /**
     * Detect panels from a Bitmap
     */
    suspend fun detectPanelsFromBitmap(bitmap: Bitmap, pageNumber: Int): PanelDetectionResult {
        return withContext(Dispatchers.Default) {
            try {
                // Convert bitmap to OpenCV Mat
                val mat = Mat()
                Utils.bitmapToMat(bitmap, mat)
                
                // Preprocess image
                val preprocessed = preprocessImage(mat)
                
                // Detect edges
                val edges = detectEdges(preprocessed)
                
                // Find contours
                val contours = findContours(edges)
                
                // Filter and sort panels
                val panels = filterAndSortPanels(contours, mat.size(), pageNumber)
                
                // Determine reading order (left-to-right or right-to-left)
                val readingOrder = determineReadingOrder(panels)
                
                // Clean up
                mat.release()
                preprocessed.release()
                edges.release()
                
                PanelDetectionResult(
                    pageNumber = pageNumber,
                    panels = panels,
                    detectionMethod = "edge_detection",
                    confidence = calculateConfidence(panels),
                    isRightToLeft = readingOrder == ReadingOrder.RIGHT_TO_LEFT
                )
            } catch (e: Exception) {
                Log.e(TAG, "Error in panel detection: ${e.message}", e)
                PanelDetectionResult(
                    pageNumber = pageNumber,
                    panels = emptyList(),
                    detectionMethod = "failed",
                    confidence = 0.0f,
                    error = e.message
                )
            }
        }
    }
    
    /**
     * Preprocess image for better edge detection
     */
    private fun preprocessImage(mat: Mat): Mat {
        val gray = Mat()
        
        // Convert to grayscale
        Imgproc.cvtColor(mat, gray, Imgproc.COLOR_BGR2GRAY)
        
        // Apply Gaussian blur to reduce noise
        Imgproc.GaussianBlur(gray, gray, Size(5.0, 5.0), 0.0)
        
        // Apply adaptive threshold to handle varying lighting
        val thresh = Mat()
        Imgproc.adaptiveThreshold(
            gray,
            thresh,
            255.0,
            Imgproc.ADAPTIVE_THRESH_GAUSSIAN_C,
            Imgproc.THRESH_BINARY,
            11,
            2.0
        )
        
        gray.release()
        return thresh
    }
    
    /**
     * Detect edges using Canny edge detector
     */
    private fun detectEdges(mat: Mat): Mat {
        val edges = Mat()
        Imgproc.Canny(mat, edges, CANNY_THRESHOLD_LOW, CANNY_THRESHOLD_HIGH)
        
        // Dilate edges to connect nearby lines (panel borders)
        val kernel = Imgproc.getStructuringElement(Imgproc.MORPH_RECT, Size(3.0, 3.0))
        Imgproc.dilate(edges, edges, kernel)
        kernel.release()
        
        return edges
    }
    
    /**
     * Find contours in edge-detected image
     */
    private fun findContours(edges: Mat): List<MatOfPoint> {
        val contours = mutableListOf<MatOfPoint>()
        val hierarchy = Mat()
        
        Imgproc.findContours(
            edges,
            contours,
            hierarchy,
            Imgproc.RETR_EXTERNAL,
            Imgproc.CHAIN_APPROX_SIMPLE
        )
        
        hierarchy.release()
        return contours
    }
    
    /**
     * Filter and sort detected panels
     */
    private fun filterAndSortPanels(
        contours: List<MatOfPoint>,
        imageSize: Size,
        pageNumber: Int
    ): List<DetectedPanel> {
        val imageArea = imageSize.width * imageSize.height
        val minArea = imageArea * MIN_PANEL_AREA_RATIO
        val maxArea = imageArea * MAX_PANEL_AREA_RATIO
        
        val panels = contours.mapIndexedNotNull { index, contour ->
            val area = Imgproc.contourArea(contour)
            
            // Filter by area
            if (area < minArea || area > maxArea) {
                return@mapIndexedNotNull null
            }
            
            // Approximate contour to polygon
            val approx = MatOfPoint2f()
            val contour2f = MatOfPoint2f(*contour.toArray())
            Imgproc.approxPolyDP(
                contour2f,
                approx,
                CONTOUR_APPROX_EPSILON * Imgproc.arcLength(contour2f, true),
                true
            )
            
            // Get bounding rectangle
            val rect = Imgproc.boundingRect(contour)
            
            // Normalize coordinates (0-1)
            val normalizedRect = NormalizedRect(
                x = rect.x.toFloat() / imageSize.width.toFloat(),
                y = rect.y.toFloat() / imageSize.height.toFloat(),
                width = rect.width.toFloat() / imageSize.width.toFloat(),
                height = rect.height.toFloat() / imageSize.height.toFloat()
            )
            
            // Calculate confidence based on rectangularity
            val confidence = calculatePanelConfidence(rect, area)
            
            approx.release()
            contour2f.release()
            
            DetectedPanel(
                panelIndex = index,
                pageNumber = pageNumber,
                bounds = normalizedRect,
                confidence = confidence,
                area = area.toFloat(),
                readingOrder = 0 // Will be set later
            )
        }
        
        // Sort panels by position (top-to-bottom, left-to-right initially)
        return panels.sortedWith(compareBy({ it.bounds.y }, { it.bounds.x }))
            .mapIndexed { idx, panel -> panel.copy(readingOrder = idx) }
    }
    
    /**
     * Calculate confidence score for a detected panel
     */
    private fun calculatePanelConfidence(rect: Rect, area: Double): Float {
        // Check if panel is roughly rectangular
        val boundingArea = rect.width * rect.height.toDouble()
        val rectangularity = area / boundingArea
        
        // Confidence based on how close to a rectangle (0.7 - 1.0 is good)
        return when {
            rectangularity > 0.85 -> 0.9f
            rectangularity > 0.7 -> 0.7f
            rectangularity > 0.5 -> 0.5f
            else -> 0.3f
        }
    }
    
    /**
     * Determine reading order (LTR vs RTL) based on panel layout
     * Useful for detecting manga vs western comics
     */
    private fun determineReadingOrder(panels: List<DetectedPanel>): ReadingOrder {
        if (panels.size < 2) return ReadingOrder.LEFT_TO_RIGHT
        
        // Analyze first few panels to determine direction
        val topPanels = panels.take(4)
        
        // Check if panels are generally arranged right-to-left
        var rtlScore = 0
        var ltrScore = 0
        
        for (i in 0 until topPanels.size - 1) {
            val current = topPanels[i]
            val next = topPanels[i + 1]
            
            // If same row (similar Y), check X ordering
            if (abs(current.bounds.y - next.bounds.y) < 0.1f) {
                if (current.bounds.x > next.bounds.x) {
                    rtlScore++
                } else {
                    ltrScore++
                }
            }
        }
        
        return if (rtlScore > ltrScore) ReadingOrder.RIGHT_TO_LEFT else ReadingOrder.LEFT_TO_RIGHT
    }
    
    /**
     * Calculate overall detection confidence
     */
    private fun calculateConfidence(panels: List<DetectedPanel>): Float {
        if (panels.isEmpty()) return 0.0f
        
        val avgPanelConfidence = panels.map { it.confidence }.average().toFloat()
        val panelCountScore = when {
            panels.size in 3..8 -> 1.0f // Typical panel count
            panels.size in 1..2 -> 0.7f // Few panels (splash page?)
            panels.size > 8 -> 0.5f // Many panels (might have false positives)
            else -> 0.3f
        }
        
        return (avgPanelConfidence + panelCountScore) / 2
    }
    
    /**
     * Detect speech bubbles within a panel
     */
    suspend fun detectSpeechBubbles(
        imagePath: String,
        panelBounds: NormalizedRect
    ): List<DetectedSpeechBubble> {
        return withContext(Dispatchers.Default) {
            try {
                val bitmap = BitmapFactory.decodeFile(imagePath)
                
                // Crop to panel
                val panelBitmap = cropToPanel(bitmap, panelBounds)
                
                // Convert to OpenCV Mat
                val mat = Mat()
                Utils.bitmapToMat(panelBitmap, mat)
                
                // Detect elliptical/circular contours (speech bubbles)
                val bubbles = detectEllipticalContours(mat)
                
                mat.release()
                panelBitmap.recycle()
                
                bubbles
            } catch (e: Exception) {
                Log.e(TAG, "Error detecting speech bubbles: ${e.message}", e)
                emptyList()
            }
        }
    }
    
    private fun cropToPanel(bitmap: Bitmap, panelBounds: NormalizedRect): Bitmap {
        val x = (panelBounds.x * bitmap.width).toInt()
        val y = (panelBounds.y * bitmap.height).toInt()
        val width = (panelBounds.width * bitmap.width).toInt()
        val height = (panelBounds.height * bitmap.height).toInt()
        
        return Bitmap.createBitmap(
            bitmap,
            x.coerceIn(0, bitmap.width),
            y.coerceIn(0, bitmap.height),
            width.coerceAtMost(bitmap.width - x),
            height.coerceAtMost(bitmap.height - y)
        )
    }
    
    private fun detectEllipticalContours(mat: Mat): List<DetectedSpeechBubble> {
        val gray = Mat()
        Imgproc.cvtColor(mat, gray, Imgproc.COLOR_BGR2GRAY)
        
        // Apply threshold to isolate white speech bubbles
        val thresh = Mat()
        Imgproc.threshold(gray, thresh, 200.0, 255.0, Imgproc.THRESH_BINARY)
        
        // Find contours
        val contours = mutableListOf<MatOfPoint>()
        val hierarchy = Mat()
        Imgproc.findContours(thresh, contours, hierarchy, Imgproc.RETR_EXTERNAL, Imgproc.CHAIN_APPROX_SIMPLE)
        
        val bubbles = contours.mapIndexedNotNull { index, contour ->
            val area = Imgproc.contourArea(contour)
            
            // Filter by area (speech bubbles should be moderately sized)
            if (area < 500 || area > mat.total() * 0.3) {
                return@mapIndexedNotNull null
            }
            
            // Fit ellipse to contour
            if (contour.toArray().size < 5) {
                return@mapIndexedNotNull null
            }
            
            val rect = Imgproc.boundingRect(contour)
            
            // Normalize within panel
            val normalizedBounds = NormalizedRect(
                x = rect.x.toFloat() / mat.width().toFloat(),
                y = rect.y.toFloat() / mat.height().toFloat(),
                width = rect.width.toFloat() / mat.width().toFloat(),
                height = rect.height.toFloat() / mat.height().toFloat()
            )
            
            DetectedSpeechBubble(
                bubbleIndex = index,
                bounds = normalizedBounds,
                confidence = 0.7f
            )
        }
        
        gray.release()
        thresh.release()
        hierarchy.release()
        
        return bubbles
    }
}

// Data classes

data class PanelDetectionResult(
    val pageNumber: Int,
    val panels: List<DetectedPanel>,
    val detectionMethod: String,
    val confidence: Float,
    val isRightToLeft: Boolean = false,
    val error: String? = null
)

data class DetectedPanel(
    val panelIndex: Int,
    val pageNumber: Int,
    val bounds: NormalizedRect,
    val confidence: Float,
    val area: Float,
    val readingOrder: Int
)

data class DetectedSpeechBubble(
    val bubbleIndex: Int,
    val bounds: NormalizedRect,
    val confidence: Float
)

data class NormalizedRect(
    val x: Float,
    val y: Float,
    val width: Float,
    val height: Float
)

enum class ReadingOrder {
    LEFT_TO_RIGHT,
    RIGHT_TO_LEFT
}
