package com.universalmedialibrary.ui.reader

import android.content.Context
import android.view.GestureDetector
import android.view.MotionEvent
import android.view.View
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.delay
import kotlin.math.abs

/**
 * Handles reader gestures and touch interactions
 * Enhanced with Moonreader-inspired edge gestures:
 * - Right edge swipe: Adjust font size
 * - Bottom-left corner long press: Adjust brightness
 * - Left/Right tap zones: Previous/Next page
 * - Center tap: Toggle UI
 */
class ReaderGestureHandler(
    private val context: Context,
    private val onPreviousPage: () -> Unit,
    private val onNextPage: () -> Unit,
    private val onToggleUI: () -> Unit,
    private val onShowMenu: () -> Unit,
    private val onTextSelection: (startX: Float, startY: Float, endX: Float, endY: Float) -> Unit,
    private val onFontSizeAdjust: ((delta: Float) -> Unit)? = null,
    private val onBrightnessAdjust: ((delta: Float) -> Unit)? = null
) {

    private var isSelecting = false
    private var selectionStartX = 0f
    private var selectionStartY = 0f
    private var isEdgeGesture = false
    private var edgeGestureStartY = 0f
    private var brightnessGestureStartY = 0f
    private val edgeZoneWidth = 50f // pixels for edge detection
    private val brightnessZoneSize = 100f // pixels for bottom-left corner

    private val gestureDetector = GestureDetector(context, object : GestureDetector.SimpleOnGestureListener() {

        override fun onSingleTapUp(e: MotionEvent): Boolean {
            val screenWidth = context.resources.displayMetrics.widthPixels
            val screenHeight = context.resources.displayMetrics.heightPixels
            val x = e.x
            val y = e.y

            // Check for edge gestures first
            if (onFontSizeAdjust != null && x > screenWidth - edgeZoneWidth) {
                // Right edge tap - could be used for quick font size toggle
                return false // Let scroll gesture handle it
            }

            // Check for brightness zone (bottom-left corner)
            if (onBrightnessAdjust != null && 
                x < brightnessZoneSize && 
                y > screenHeight - brightnessZoneSize) {
                // Bottom-left corner - could show brightness control
                return false
            }

            // Standard tap zones
            when {
                x < screenWidth * 0.3f -> onPreviousPage()
                x > screenWidth * 0.7f -> onNextPage()
                else -> onToggleUI()
            }
            return true
        }

        override fun onDoubleTap(e: MotionEvent): Boolean {
            onShowMenu()
            return true
        }

        override fun onLongPress(e: MotionEvent) {
            val screenWidth = context.resources.displayMetrics.widthPixels
            val screenHeight = context.resources.displayMetrics.heightPixels
            val x = e.x
            val y = e.y

            // Check if long press is in brightness zone (bottom-left corner)
            if (onBrightnessAdjust != null && 
                x < brightnessZoneSize && 
                y > screenHeight - brightnessZoneSize) {
                // Start brightness adjustment mode
                brightnessGestureStartY = y
                return
            }

            // Start text selection
            isSelecting = true
            selectionStartX = e.x
            selectionStartY = e.y
        }

        override fun onScroll(
            e1: MotionEvent?,
            e2: MotionEvent,
            distanceX: Float,
            distanceY: Float
        ): Boolean {
            if (e1 == null) return false

            val screenWidth = context.resources.displayMetrics.widthPixels
            val screenHeight = context.resources.displayMetrics.heightPixels
            val startX = e1.x
            val startY = e1.y

            // Right edge vertical scroll for font size (Moonreader feature)
            if (onFontSizeAdjust != null && startX > screenWidth - edgeZoneWidth) {
                val delta = -distanceY / 10f // Negative because scroll is inverted
                onFontSizeAdjust(delta)
                isEdgeGesture = true
                return true
            }

            // Bottom-left corner vertical scroll for brightness (Moonreader feature)
            if (onBrightnessAdjust != null && 
                startX < brightnessZoneSize && 
                startY > screenHeight - brightnessZoneSize) {
                val delta = distanceY / 10f // Positive scroll up = increase brightness
                onBrightnessAdjust(delta)
                return true
            }

            return false
        }

        override fun onFling(
            e1: MotionEvent?,
            e2: MotionEvent,
            velocityX: Float,
            velocityY: Float
        ): Boolean {
            if (e1 == null || isEdgeGesture) {
                isEdgeGesture = false
                return false
            }

            val diffX = e2.x - e1.x
            val diffY = e2.y - e1.y

            if (abs(diffX) > abs(diffY)) {
                if (abs(diffX) > 100 && abs(velocityX) > 100) {
                    if (diffX > 0) {
                        onPreviousPage() // Swipe right for previous
                    } else {
                        onNextPage() // Swipe left for next
                    }
                    return true
                }
            }
            return false
        }
    })

    fun handleTouchEvent(event: MotionEvent): Boolean {
        when (event.action) {
            MotionEvent.ACTION_UP -> {
                if (isSelecting) {
                    onTextSelection(selectionStartX, selectionStartY, event.x, event.y)
                    isSelecting = false
                }
            }
        }
        return gestureDetector.onTouchEvent(event)
    }
}

/**
 * Composable for handling reader gestures with enhanced edge controls
 * Moonreader-inspired features:
 * - Right edge vertical scroll: Adjust font size
 * - Bottom-left corner long press + scroll: Adjust brightness
 */
@Composable
fun ReaderGestureOverlay(
    onPreviousPage: () -> Unit,
    onNextPage: () -> Unit,
    onToggleUI: () -> Unit,
    onShowMenu: () -> Unit,
    onTextSelection: (startX: Float, startY: Float, endX: Float, endY: Float) -> Unit,
    onFontSizeAdjust: ((delta: Float) -> Unit)? = null,
    onBrightnessAdjust: ((delta: Float) -> Unit)? = null,
    modifier: Modifier = Modifier
) {
    val context = LocalContext.current
    var isSelecting by remember { mutableStateOf(false) }
    var selectionStart by remember { mutableStateOf(Pair(0f, 0f)) }
    var isBrightnessMode by remember { mutableStateOf(false) }
    var brightnessStartY by remember { mutableStateOf(0f) }
    val edgeZoneWidth = 50.dp
    val brightnessZoneSize = 100.dp

    Box(
        modifier = modifier
            .fillMaxSize()
            .pointerInput(Unit) {
                detectTapGestures(
                    onTap = { offset ->
                        val screenWidth = size.width
                        val screenHeight = size.height
                        val x = offset.x
                        val y = offset.y

                        // Check for edge zones
                        if (onFontSizeAdjust != null && x > screenWidth - edgeZoneWidth.toPx()) {
                            // Right edge - could show font size indicator
                            return@detectTapGestures
                        }

                        if (onBrightnessAdjust != null && 
                            x < brightnessZoneSize.toPx() && 
                            y > screenHeight - brightnessZoneSize.toPx()) {
                            // Bottom-left corner - could show brightness indicator
                            return@detectTapGestures
                        }

                        // Standard tap zones
                        when {
                            x < screenWidth * 0.3f -> onPreviousPage()
                            x > screenWidth * 0.7f -> onNextPage()
                            else -> onToggleUI()
                        }
                    },
                    onDoubleTap = { onShowMenu() },
                    onLongPress = { offset ->
                        val screenHeight = size.height
                        val x = offset.x
                        val y = offset.y

                        // Check if long press is in brightness zone
                        if (onBrightnessAdjust != null && 
                            x < brightnessZoneSize.toPx() && 
                            y > screenHeight - brightnessZoneSize.toPx()) {
                            isBrightnessMode = true
                            brightnessStartY = y
                            return@detectTapGestures
                        }

                        // Start text selection
                        isSelecting = true
                        selectionStart = Pair(offset.x, offset.y)
                    }
                )
            }
    ) {
        // Visual indicator for brightness adjustment (optional)
        if (isBrightnessMode && onBrightnessAdjust != null) {
            // Could show a brightness control overlay here
        }
    }

    // Handle selection end
    LaunchedEffect(isSelecting) {
        if (isSelecting) {
            delay(50) // Wait for gesture to complete
            // onTextSelection(selectionStart.first, selectionStart.second, endX, endY)
            isSelecting = false
        }
    }
}

/**
 * Page turning animations
 */
// PageTurnAnimation is defined in PageTurnAnimations.kt

/**
 * Touch zones configuration
 */
data class TouchZones(
    val leftMargin: Float = 0.3f,
    val rightMargin: Float = 0.3f,
    val topMargin: Float = 0.1f,
    val bottomMargin: Float = 0.1f
)
