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
 * Fractal-inspired visualization
 */
@Composable
internal fun FractalVisualizer(
    state: VisualizerState,
    rotation: Float,
    primaryColor: Color,
    tertiaryColor: Color
) {
    val bass = state.frequencyBands.bass
    val mid = state.frequencyBands.mid
    val treble = state.frequencyBands.treble
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2
        val centerY = size.height / 2
        
        // Recursive circle pattern
        fun drawFractalCircle(x: Float, y: Float, radius: Float, depth: Int, angle: Float) {
            if (depth <= 0 || radius < 5f) return
            
            val intensity = when (depth) {
                3 -> bass
                2 -> mid
                else -> treble
            }
            
            drawCircle(
                color = androidx.compose.ui.graphics.lerp(primaryColor, tertiaryColor, depth / 3f)
                    .copy(alpha = 0.3f + intensity * 0.7f),
                radius = radius,
                center = Offset(x, y),
                style = Stroke(width = 2f)
            )
            
            // Draw child circles
            val childCount = 4
            val childRadius = radius * 0.4f
            for (i in 0 until childCount) {
                val childAngle = angle + (i * 360f / childCount) * PI.toFloat() / 180f
                val childX = x + cos(childAngle) * radius * 0.6f
                val childY = y + sin(childAngle) * radius * 0.6f
                drawFractalCircle(childX, childY, childRadius, depth - 1, angle + rotation)
            }
        }
        
        drawFractalCircle(centerX, centerY, min(size.width, size.height) * 0.25f, 3, rotation)
    }
}
