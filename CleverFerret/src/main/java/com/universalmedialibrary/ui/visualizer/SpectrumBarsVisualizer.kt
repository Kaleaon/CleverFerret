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
 * Spectrum bars visualization (classic frequency bars with neon glow effect)
 */
@Composable
internal fun SpectrumBarsVisualizer(
    state: VisualizerState,
    primaryColor: Color,
    secondaryColor: Color
) {
    val spectrum = state.frequencyBands.spectrum.ifEmpty { List(64) { 0f } }
    val bass = state.frequencyBands.bass

    Canvas(modifier = Modifier.fillMaxSize()) {
        val barWidth = size.width / spectrum.size
        val maxHeight = size.height
        val gap = 2f

        spectrum.forEachIndexed { index, magnitude ->
            val barHeight = magnitude * maxHeight * 0.9f
            val x = index * barWidth
            val progress = index.toFloat() / spectrum.size
            
            // Calculate rainbow color based on position and intensity
            val hue = (progress * 270f + bass * 90f) % 360f
            val barColor = Color.hsv(hue, 0.9f, 0.95f + magnitude * 0.05f)
            val glowColor = Color.hsv(hue, 0.7f, 1f)

            // Draw glow effect (wider, semi-transparent bar behind)
            if (magnitude > 0.1f) {
                drawRect(
                    color = glowColor.copy(alpha = 0.3f * magnitude),
                    topLeft = Offset(x - gap, maxHeight - barHeight - gap * 2),
                    size = androidx.compose.ui.geometry.Size(barWidth + gap * 2, barHeight + gap * 4)
                )
            }

            // Draw main bar with gradient
            drawRect(
                brush = Brush.verticalGradient(
                    colors = listOf(
                        barColor,
                        barColor.copy(alpha = 0.8f),
                        androidx.compose.ui.graphics.lerp(barColor, primaryColor, 0.3f).copy(alpha = 0.6f)
                    ),
                    startY = maxHeight - barHeight,
                    endY = maxHeight
                ),
                topLeft = Offset(x + gap, maxHeight - barHeight),
                size = androidx.compose.ui.geometry.Size(barWidth - gap * 2, barHeight)
            )
            
            // Draw top cap (bright white highlight for peaks)
            if (magnitude > 0.2f) {
                drawRect(
                    color = Color.White.copy(alpha = 0.8f * magnitude),
                    topLeft = Offset(x + gap, maxHeight - barHeight),
                    size = androidx.compose.ui.geometry.Size(barWidth - gap * 2, 3f)
                )
            }
        }
        
        // Draw reflection effect at bottom
        spectrum.forEachIndexed { index, magnitude ->
            val barHeight = magnitude * maxHeight * 0.15f // Shorter reflection
            val x = index * barWidth
            val progress = index.toFloat() / spectrum.size
            val hue = (progress * 270f + bass * 90f) % 360f
            val barColor = Color.hsv(hue, 0.9f, 0.95f)

            drawRect(
                brush = Brush.verticalGradient(
                    colors = listOf(
                        barColor.copy(alpha = 0.3f),
                        barColor.copy(alpha = 0f)
                    ),
                    startY = maxHeight,
                    endY = maxHeight + barHeight
                ),
                topLeft = Offset(x + gap, maxHeight),
                size = androidx.compose.ui.geometry.Size(barWidth - gap * 2, barHeight)
            )
        }
    }
}
