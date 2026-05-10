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
 * Starfield visualization
 */
@Composable
internal fun StarfieldVisualizer(
    state: VisualizerState,
    rotation: Float,
    starColor: Color
) {
    val spectrum = state.frequencyBands.spectrum.ifEmpty { List(64) { 0f } }
    val bass = state.frequencyBands.bass
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2
        val centerY = size.height / 2
        
        // Use spectrum to determine star brightness/size
        spectrum.forEachIndexed { index, magnitude ->
            // Random-ish position based on index
            val angle = (index * 137.5f + rotation) * PI.toFloat() / 180f
            val distance = (index * 10f + (state.timestamp % 1000)) % (min(size.width, size.height) / 2)
            
            val x = centerX + cos(angle) * distance
            val y = centerY + sin(angle) * distance
            
            val size = 2f + magnitude * 10f + bass * 5f
            
            drawCircle(
                color = starColor.copy(alpha = magnitude.coerceIn(0.2f, 1f)),
                radius = size,
                center = Offset(x, y)
            )
            
            // Trailing effect for fast moving stars (bass kick)
            if (bass > 0.5f) {
                drawLine(
                    color = starColor.copy(alpha = 0.3f),
                    start = Offset(centerX, centerY),
                    end = Offset(x, y),
                    strokeWidth = 1f
                )
            }
        }
    }
}
