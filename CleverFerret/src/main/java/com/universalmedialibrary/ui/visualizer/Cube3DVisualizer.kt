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
 * 3D Cube spectrum visualization
 */
@Composable
internal fun Cube3DVisualizer(
    state: VisualizerState,
    rotation: Float,
    primaryColor: Color,
    secondaryColor: Color,
    tertiaryColor: Color
) {
    val spectrum = state.frequencyBands.spectrum.ifEmpty { List(64) { 0f } }
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2
        val centerY = size.height / 2
        val cubeSize = min(size.width, size.height) * 0.3f
        
        // Pseudo-3D rotation
        val rotX = rotation * PI.toFloat() / 180f
        val rotY = (rotation * 1.3f) * PI.toFloat() / 180f
        
        // Draw cube edges with spectrum heights
        val edges = listOf(
            // Front face
            listOf(-1f to -1f, 1f to -1f),
            listOf(1f to -1f, 1f to 1f),
            listOf(1f to 1f, -1f to 1f),
            listOf(-1f to 1f, -1f to -1f),
            // Back face
            listOf(-0.7f to -0.7f, 0.7f to -0.7f),
            listOf(0.7f to -0.7f, 0.7f to 0.7f),
            listOf(0.7f to 0.7f, -0.7f to 0.7f),
            listOf(-0.7f to 0.7f, -0.7f to -0.7f)
        )
        
        edges.forEachIndexed { index, (start, end) ->
            val magnitude = spectrum.getOrElse(index % spectrum.size) { 0f }
            val lineColor = when (index % 3) {
                0 -> primaryColor
                1 -> secondaryColor
                else -> tertiaryColor
            }.copy(alpha = 0.5f + magnitude * 0.5f)
            
            // Simple 2D projection
            val (x1, y1) = start
            val (x2, y2) = end
            val scale = cubeSize * (1f + magnitude * 0.5f)
            
            drawLine(
                color = lineColor,
                start = Offset(
                    centerX + x1 * scale * cos(rotY),
                    centerY + y1 * scale
                ),
                end = Offset(
                    centerX + x2 * scale * cos(rotY),
                    centerY + y2 * scale
                ),
                strokeWidth = 3f + magnitude * 3f,
                cap = StrokeCap.Round
            )
        }
        
        // Draw spectrum bars on cube faces
        spectrum.take(12).forEachIndexed { index, magnitude ->
            val angle = (index * 30f + rotation) * PI.toFloat() / 180f
            val radius = cubeSize
            val height = magnitude * 100f
            
            val x = centerX + cos(angle) * radius
            val y = centerY + sin(angle) * radius
            
            drawLine(
                brush = Brush.verticalGradient(
                    colors = listOf(
                        primaryColor.copy(alpha = magnitude),
                        tertiaryColor.copy(alpha = magnitude * 0.3f)
                    )
                ),
                start = Offset(x, y),
                end = Offset(x, y - height),
                strokeWidth = 6f,
                cap = StrokeCap.Round
            )
        }
    }
}
