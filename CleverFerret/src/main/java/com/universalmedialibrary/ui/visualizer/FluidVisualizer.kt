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
 * Fluid visualization
 */
@Composable
internal fun FluidVisualizer(
    state: VisualizerState,
    color1: Color,
    color2: Color,
    color3: Color
) {
    val waveform = state.waveform.ifEmpty { List(128) { 0f } }
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2
        val centerY = size.height / 2
        val radius = min(size.width, size.height) * 0.4f
        
        val path = Path()
        val points = waveform.size
        
        for (i in 0 until points) {
            val angle = (i.toFloat() / points) * 2 * PI.toFloat()
            val amplitude = waveform[i] * 100f
            val r = radius + amplitude
            
            val x = centerX + cos(angle) * r
            val y = centerY + sin(angle) * r
            
            if (i == 0) path.moveTo(x, y)
            else path.lineTo(x, y)
        }
        path.close()
        
        // Draw filled fluid
        drawPath(
            path = path,
            brush = Brush.radialGradient(
                colors = listOf(color1, color2, color3),
                center = Offset(centerX, centerY)
            )
        )
        
        // Draw outline
        drawPath(
            path = path,
            color = color1.copy(alpha = 0.8f),
            style = Stroke(width = 3f)
        )
    }
}
