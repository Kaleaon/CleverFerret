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
 * Frequency rings visualization (concentric reactive rings)
 */
@Composable
internal fun FrequencyRingsVisualizer(
    state: VisualizerState,
    rotation: Float,
    primaryColor: Color,
    secondaryColor: Color,
    tertiaryColor: Color
) {
    val bass = state.frequencyBands.bass
    val mid = state.frequencyBands.mid
    val treble = state.frequencyBands.treble

    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2
        val centerY = size.height / 2
        val maxRadius = min(size.width, size.height) / 2

        // Bass ring (outer)
        drawCircle(
            brush = Brush.radialGradient(
                colors = listOf(
                    primaryColor.copy(alpha = 0f),
                    primaryColor.copy(alpha = bass * 0.8f)
                ),
                center = Offset(centerX, centerY)
            ),
            radius = maxRadius * 0.8f * (0.8f + bass * 0.2f),
            center = Offset(centerX, centerY),
            style = Stroke(width = 20f)
        )

        // Mid ring (middle)
        drawCircle(
            brush = Brush.radialGradient(
                colors = listOf(
                    secondaryColor.copy(alpha = 0f),
                    secondaryColor.copy(alpha = mid * 0.8f)
                ),
                center = Offset(centerX, centerY)
            ),
            radius = maxRadius * 0.5f * (0.9f + mid * 0.1f),
            center = Offset(centerX, centerY),
            style = Stroke(width = 15f)
        )

        // Treble ring (inner)
        drawCircle(
            brush = Brush.radialGradient(
                colors = listOf(
                    tertiaryColor.copy(alpha = treble * 0.8f),
                    tertiaryColor.copy(alpha = 0f)
                ),
                center = Offset(centerX, centerY)
            ),
            radius = maxRadius * 0.3f * (1.0f + treble * 0.2f),
            center = Offset(centerX, centerY),
            style = Stroke(width = 10f)
        )
    }
}
