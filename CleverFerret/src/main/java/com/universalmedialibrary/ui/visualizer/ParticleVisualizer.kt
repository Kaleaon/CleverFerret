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
 * Particle visualization (reactive particles)
 */
@Composable
internal fun ParticleVisualizer(
    state: VisualizerState,
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

        // Bass particles (large)
        drawCircle(
            color = primaryColor.copy(alpha = bass),
            radius = bass * 100f,
            center = Offset(centerX, centerY)
        )

        // Mid particles (medium)
        drawCircle(
            color = secondaryColor.copy(alpha = mid),
            radius = mid * 80f,
            center = Offset(centerX - 100f, centerY)
        )
        drawCircle(
            color = secondaryColor.copy(alpha = mid),
            radius = mid * 80f,
            center = Offset(centerX + 100f, centerY)
        )

        // Treble particles (small)
        for (i in 0..7) {
            val angle = (i / 8f) * 2 * PI.toFloat()
            val x = centerX + cos(angle) * 150f
            val y = centerY + sin(angle) * 150f
            drawCircle(
                color = tertiaryColor.copy(alpha = treble),
                radius = treble * 40f,
                center = Offset(x, y)
            )
        }
    }
}
