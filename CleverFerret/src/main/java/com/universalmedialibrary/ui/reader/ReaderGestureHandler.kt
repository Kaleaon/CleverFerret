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
import kotlinx.coroutines.delay
import kotlin.math.abs

/**
 * Handles reader gestures and touch interactions
 */
class ReaderGestureHandler(
    private val context: Context,
    private val onPreviousPage: () -> Unit,
    private val onNextPage: () -> Unit,
    private val onToggleUI: () -> Unit,
    private val onShowMenu: () -> Unit,
    private val onTextSelection: (startX: Float, startY: Float, endX: Float, endY: Float) -> Unit
) {
    
    private var isSelecting = false
    private var selectionStartX = 0f
    private var selectionStartY = 0f
    
    private val gestureDetector = GestureDetector(context, object : GestureDetector.SimpleOnGestureListener() {
        
        override fun onSingleTapUp(e: MotionEvent): Boolean {
            val screenWidth = context.resources.displayMetrics.widthPixels
            val x = e.x
            
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
            // Start text selection
            isSelecting = true
            selectionStartX = e.x
            selectionStartY = e.y
        }
        
        override fun onFling(
            e1: MotionEvent?,
            e2: MotionEvent,
            velocityX: Float,
            velocityY: Float
        ): Boolean {
            if (e1 == null) return false
            
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
 * Composable for handling reader gestures
 */
@Composable
fun ReaderGestureOverlay(
    onPreviousPage: () -> Unit,
    onNextPage: () -> Unit,
    onToggleUI: () -> Unit,
    onShowMenu: () -> Unit,
    onTextSelection: (startX: Float, startY: Float, endX: Float, endY: Float) -> Unit,
    modifier: Modifier = Modifier
) {
    val context = LocalContext.current
    var isSelecting by remember { mutableStateOf(false) }
    var selectionStart by remember { mutableStateOf(Pair(0f, 0f)) }
    
    Box(
        modifier = modifier
            .fillMaxSize()
            .pointerInput(Unit) {
                detectTapGestures(
                    onTap = { offset ->
                        val screenWidth = size.width
                        when {
                            offset.x < screenWidth * 0.3f -> onPreviousPage()
                            offset.x > screenWidth * 0.7f -> onNextPage()
                            else -> onToggleUI()
                        }
                    },
                    onDoubleTap = { onShowMenu() },
                    onLongPress = { offset ->
                        isSelecting = true
                        selectionStart = Pair(offset.x, offset.y)
                    }
                )
            }
    ) {
        // Overlay content can be added here
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
enum class PageTurnAnimation {
    NONE,
    SLIDE,
    FADE,
    CURL,
    FLIP
}

/**
 * Touch zones configuration
 */
data class TouchZones(
    val leftMargin: Float = 0.3f,
    val rightMargin: Float = 0.3f,
    val topMargin: Float = 0.1f,
    val bottomMargin: Float = 0.1f
)