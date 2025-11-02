package com.universalmedialibrary.ui.reader.components

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.gestures.detectDragGestures
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.PathEffect
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp

/**
 * Reading Ruler - A visual guide that helps focus on a specific line while reading
 * Inspired by LibreraReader's reading ruler feature
 * 
 * @param enabled Whether the ruler is visible
 * @param rulerPosition Vertical position of the ruler (0f = top, 1f = bottom)
 * @param rulerHeight Height of the highlighted area in dp
 * @param rulerColor Color of the ruler overlay
 * @param rulerAlpha Transparency of the overlay (0f = transparent, 1f = opaque)
 * @param onPositionChange Callback when user drags the ruler
 */
@Composable
fun ReadingRuler(
    enabled: Boolean,
    rulerPosition: Float = 0.5f,
    rulerHeight: Dp = 60.dp,
    rulerColor: Color = Color.Gray,
    rulerAlpha: Float = 0.3f,
    onPositionChange: (Float) -> Unit = {}
) {
    if (!enabled) return

    var currentPosition by remember { mutableStateOf(rulerPosition) }
    val density = LocalDensity.current
    val rulerHeightPx = with(density) { rulerHeight.toPx() }

    LaunchedEffect(rulerPosition) {
        currentPosition = rulerPosition.coerceIn(0f, 1f)
    }

    Canvas(
        modifier = Modifier
            .fillMaxSize()
            .pointerInput(Unit) {
                detectDragGestures { change, dragAmount ->
                    change.consume()
                    val newPosition = currentPosition + (dragAmount.y / size.height)
                    currentPosition = newPosition.coerceIn(0f, 1f)
                    onPositionChange(currentPosition)
                }
            }
    ) {
        val canvasHeight = size.height
        val canvasWidth = size.width
        
        // Calculate ruler position
        val centerY = canvasHeight * currentPosition
        val topY = (centerY - rulerHeightPx / 2).coerceAtLeast(0f)
        val bottomY = (centerY + rulerHeightPx / 2).coerceAtMost(canvasHeight)

        // Draw top overlay (above ruler)
        drawRect(
            color = rulerColor.copy(alpha = rulerAlpha * 0.7f),
            topLeft = Offset(0f, 0f),
            size = androidx.compose.ui.geometry.Size(canvasWidth, topY)
        )

        // Draw bottom overlay (below ruler)
        drawRect(
            color = rulerColor.copy(alpha = rulerAlpha * 0.7f),
            topLeft = Offset(0f, bottomY),
            size = androidx.compose.ui.geometry.Size(canvasWidth, canvasHeight - bottomY)
        )

        // Draw ruler border lines
        val borderColor = rulerColor.copy(alpha = rulerAlpha * 1.5f)
        drawLine(
            color = borderColor,
            start = Offset(0f, topY),
            end = Offset(canvasWidth, topY),
            strokeWidth = 2f
        )
        drawLine(
            color = borderColor,
            start = Offset(0f, bottomY),
            end = Offset(canvasWidth, bottomY),
            strokeWidth = 2f
        )
        
        // Draw dashed line at center for precise positioning
        drawLine(
            color = borderColor,
            start = Offset(0f, centerY),
            end = Offset(canvasWidth, centerY),
            strokeWidth = 1f,
            pathEffect = PathEffect.dashPathEffect(floatArrayOf(10f, 5f))
        )
    }
}

/**
 * Reading Ruler Settings
 */
data class ReadingRulerSettings(
    val enabled: Boolean = false,
    val position: Float = 0.5f,
    val height: Dp = 60.dp,
    val color: Color = Color.Gray,
    val alpha: Float = 0.3f
)
