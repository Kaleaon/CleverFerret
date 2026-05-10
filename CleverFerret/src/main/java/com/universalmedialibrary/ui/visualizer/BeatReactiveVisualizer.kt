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
 * Beat-reactive shapes visualization
 */
@Composable
internal fun BeatReactiveVisualizer(
    state: VisualizerState,
    primaryColor: Color,
    secondaryColor: Color,
    tertiaryColor: Color
) {
    val bass = state.frequencyBands.bass
    val mid = state.frequencyBands.mid
    val treble = state.frequencyBands.treble
    val isBeat = state.isBeat
    
    // Animate beat pulse
    val beatPulse = remember { Animatable(1f) }
    LaunchedEffect(isBeat) {
        if (isBeat) {
            beatPulse.snapTo(1.5f)
            beatPulse.animateTo(1f, animationSpec = tween(300, easing = FastOutSlowInEasing))
        }
    }
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2
        val centerY = size.height / 2
        val pulseScale = beatPulse.value
        
        // Central circle reacts to beat
        drawCircle(
            color = primaryColor.copy(alpha = 0.8f),
            radius = bass * 150f * pulseScale,
            center = Offset(centerX, centerY)
        )
        
        // Rotating triangles for mid frequencies
        val triangleCount = 8
        for (i in 0 until triangleCount) {
            val angle = (i.toFloat() / triangleCount * 360f) * PI.toFloat() / 180f
            val distance = 200f + mid * 100f
            val size = 40f + mid * 60f
            
            val x = centerX + cos(angle) * distance
            val y = centerY + sin(angle) * distance
            
            val path = Path().apply {
                moveTo(x, y - size / 2)
                lineTo(x + size / 2, y + size / 2)
                lineTo(x - size / 2, y + size / 2)
                close()
            }
            
            drawPath(
                path = path,
                color = secondaryColor.copy(alpha = 0.6f + mid * 0.4f)
            )
        }
        
        // Small circles for treble
        val circleCount = 16
        for (i in 0 until circleCount) {
            val angle = (i.toFloat() / circleCount * 360f) * PI.toFloat() / 180f
            val distance = 100f
            val x = centerX + cos(angle) * distance
            val y = centerY + sin(angle) * distance
            
            drawCircle(
                color = tertiaryColor.copy(alpha = treble),
                radius = treble * 20f,
                center = Offset(x, y)
            )
        }
    }
}
