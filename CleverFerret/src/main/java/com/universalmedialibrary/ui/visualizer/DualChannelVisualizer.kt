package com.universalmedialibrary.ui.visualizer

import androidx.compose.animation.core.*
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.*
import androidx.compose.runtime.snapshots.SnapshotStateMap
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.graphics.drawscope.rotate
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.services.visualizer.VisualizerState
import kotlin.math.*

/**
 * Dual-channel stereo visualization
 */
@Composable
internal fun DualChannelVisualizer(
    state: VisualizerState,
    primaryColor: Color,
    secondaryColor: Color
) {
    val waveform = state.waveform.ifEmpty { List(256) { 0f } }
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerY = size.height / 2
        val stepX = size.width / waveform.size
        val amplitude = size.height * 0.2f
        
        // Left channel (top half)
        val leftPath = Path().apply {
            moveTo(0f, centerY / 2)
            waveform.forEachIndexed { index, value ->
                val x = index * stepX
                val y = centerY / 2 + (value * amplitude * 0.8f)
                lineTo(x, y)
            }
        }
        
        // Right channel (bottom half) - slightly offset
        val rightPath = Path().apply {
            moveTo(0f, centerY + centerY / 2)
            waveform.forEachIndexed { index, value ->
                val x = index * stepX
                // Phase shift for stereo effect
                val shiftedIdx = (index + waveform.size / 16) % waveform.size
                val y = centerY + centerY / 2 + (waveform[shiftedIdx] * amplitude * 0.8f)
                lineTo(x, y)
            }
        }
        
        // Draw center divider
        drawLine(
            color = primaryColor.copy(alpha = 0.2f),
            start = Offset(0f, centerY),
            end = Offset(size.width, centerY),
            strokeWidth = 1f
        )
        
        drawPath(
            path = leftPath,
            color = primaryColor,
            style = Stroke(width = 2f, cap = StrokeCap.Round)
        )
        
        drawPath(
            path = rightPath,
            color = secondaryColor,
            style = Stroke(width = 2f, cap = StrokeCap.Round)
        )
    }
}
