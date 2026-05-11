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
 * Circular visualization (radial spectrum with rainbow effect)
 */
@Composable
internal fun CircularVisualizer(
    state: VisualizerState,
    rotation: Float
) {
    val spectrum = state.frequencyBands.spectrum.ifEmpty { List(64) { 0f } }
    val bass = state.frequencyBands.bass
    val mid = state.frequencyBands.mid

    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2
        val centerY = size.height / 2
        val baseRadius = min(size.width, size.height) * 0.15f
        val pulseRadius = baseRadius * (1f + bass * 0.3f) // Pulse with bass
        
        // Draw center glow
        drawCircle(
            brush = Brush.radialGradient(
                colors = listOf(
                    VisualizerColors.neonCyan.copy(alpha = 0.4f * bass),
                    VisualizerColors.neonMagenta.copy(alpha = 0.2f * bass),
                    Color.Transparent
                ),
                center = Offset(centerX, centerY),
                radius = baseRadius * 2f
            ),
            radius = baseRadius * 2f,
            center = Offset(centerX, centerY)
        )
        
        // Draw inner circle
        drawCircle(
            color = VisualizerColors.neonCyan.copy(alpha = 0.3f),
            radius = pulseRadius * 0.5f,
            center = Offset(centerX, centerY),
            style = Stroke(width = 2f)
        )

        // Draw spectrum bars radiating outward
        spectrum.forEachIndexed { index, magnitude ->
            val angle = (index.toFloat() / spectrum.size * 360f + rotation) * PI.toFloat() / 180f
            val length = magnitude * min(size.width, size.height) * 0.35f
            val startRadius = pulseRadius
            val endRadius = pulseRadius + length

            val startX = centerX + cos(angle) * startRadius
            val startY = centerY + sin(angle) * startRadius
            val endX = centerX + cos(angle) * endRadius
            val endY = centerY + sin(angle) * endRadius

            // Rainbow color based on position
            val hue = (index.toFloat() / spectrum.size * 360f + rotation * 0.5f) % 360f
            val barColor = Color.hsv(hue, 0.9f, 0.95f)
            val glowColor = Color.hsv(hue, 0.7f, 1f)

            // Draw glow
            if (magnitude > 0.15f) {
                drawLine(
                    color = glowColor.copy(alpha = 0.4f * magnitude),
                    start = Offset(startX, startY),
                    end = Offset(endX, endY),
                    strokeWidth = 8f,
                    cap = StrokeCap.Round
                )
            }

            // Draw main line
            drawLine(
                brush = Brush.linearGradient(
                    colors = listOf(
                        barColor.copy(alpha = 0.7f),
                        barColor,
                        Color.White.copy(alpha = 0.8f * magnitude)
                    ),
                    start = Offset(startX, startY),
                    end = Offset(endX, endY)
                ),
                start = Offset(startX, startY),
                end = Offset(endX, endY),
                strokeWidth = 3f + magnitude * 2f,
                cap = StrokeCap.Round
            )
        }
        
        // Draw outer ring that pulses with mid frequencies
        drawCircle(
            color = VisualizerColors.neonMagenta.copy(alpha = 0.5f * mid),
            radius = baseRadius + min(size.width, size.height) * 0.35f * mid,
            center = Offset(centerX, centerY),
            style = Stroke(width = 2f + mid * 3f)
        )
    }
}
