package com.universalmedialibrary.ui.visualizer

import androidx.compose.animation.core.*
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.services.visualizer.VisualizerState
import kotlin.math.*

/**
 * ProjectM-style Audio Visualizer UI Component
 *
 * Renders beautiful, reactive visualizations based on audio data
 * inspired by the projectM music visualizer
 */
@Composable
fun ProjectMVisualizer(
    visualizerState: VisualizerState,
    modifier: Modifier = Modifier,
    style: VisualizerStyle = VisualizerStyle.SPECTRUM_BARS
) {
    val infiniteTransition = rememberInfiniteTransition(label = "visualizer")
    val rotation by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 360f,
        animationSpec = infiniteRepeatable(
            animation = tween(20000, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "rotation"
    )

    Box(
        modifier = modifier
            .fillMaxSize()
            .background(Color.Black),
        contentAlignment = Alignment.Center
    ) {
        when (style) {
            VisualizerStyle.SPECTRUM_BARS -> SpectrumBarsVisualizer(visualizerState)
            VisualizerStyle.WAVEFORM -> WaveformVisualizer(visualizerState)
            VisualizerStyle.CIRCULAR -> CircularVisualizer(visualizerState, rotation)
            VisualizerStyle.PARTICLES -> ParticleVisualizer(visualizerState)
            VisualizerStyle.FREQUENCY_RINGS -> FrequencyRingsVisualizer(visualizerState, rotation)
        }
    }
}

/**
 * Spectrum bars visualization (classic frequency bars)
 */
@Composable
private fun SpectrumBarsVisualizer(state: VisualizerState) {
    val spectrum = state.frequencyBands.spectrum.ifEmpty { List(64) { 0f } }

    Canvas(modifier = Modifier.fillMaxSize()) {
        val barWidth = size.width / spectrum.size
        val maxHeight = size.height

        spectrum.forEachIndexed { index, magnitude ->
            val barHeight = magnitude * maxHeight
            val x = index * barWidth
            val hue = (index.toFloat() / spectrum.size) * 360f

            drawRect(
                brush = Brush.verticalGradient(
                    colors = listOf(
                        Color.hsv(hue, 0.8f, 1f),
                        Color.hsv(hue, 0.6f, 0.8f)
                    )
                ),
                topLeft = Offset(x, maxHeight - barHeight),
                size = androidx.compose.ui.geometry.Size(barWidth * 0.9f, barHeight)
            )
        }
    }
}

/**
 * Waveform visualization (time-domain)
 */
@Composable
private fun WaveformVisualizer(state: VisualizerState) {
    val waveform = state.waveform.ifEmpty { List(128) { 0f } }

    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerY = size.height / 2
        val stepX = size.width / waveform.size

        val path = Path().apply {
            moveTo(0f, centerY)
            waveform.forEachIndexed { index, amplitude ->
                val x = index * stepX
                val y = centerY + (amplitude * centerY * 0.8f)
                lineTo(x, y)
            }
        }

        drawPath(
            path = path,
            brush = Brush.horizontalGradient(
                colors = listOf(
                    Color(0xFF00FF00),
                    Color(0xFF00FFFF),
                    Color(0xFF0000FF)
                )
            ),
            style = Stroke(width = 3f)
        )
    }
}

/**
 * Circular visualization (radial spectrum)
 */
@Composable
private fun CircularVisualizer(state: VisualizerState, rotation: Float) {
    val spectrum = state.frequencyBands.spectrum.ifEmpty { List(64) { 0f } }

    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2
        val centerY = size.height / 2
        val baseRadius = min(size.width, size.height) * 0.2f

        spectrum.forEachIndexed { index, magnitude ->
            val angle = (index.toFloat() / spectrum.size * 360f + rotation) * PI.toFloat() / 180f
            val length = magnitude * min(size.width, size.height) * 0.3f
            val startRadius = baseRadius
            val endRadius = baseRadius + length

            val startX = centerX + cos(angle) * startRadius
            val startY = centerY + sin(angle) * startRadius
            val endX = centerX + cos(angle) * endRadius
            val endY = centerY + sin(angle) * endRadius

            val hue = (index.toFloat() / spectrum.size) * 360f

            drawLine(
                brush = Brush.linearGradient(
                    colors = listOf(
                        Color.hsv(hue, 0.8f, 0.6f),
                        Color.hsv(hue, 1f, 1f)
                    )
                ),
                start = Offset(startX, startY),
                end = Offset(endX, endY),
                strokeWidth = 4f,
                cap = StrokeCap.Round
            )
        }
    }
}

/**
 * Particle visualization (reactive particles)
 */
@Composable
private fun ParticleVisualizer(state: VisualizerState) {
    val bass = state.frequencyBands.bass
    val mid = state.frequencyBands.mid
    val treble = state.frequencyBands.treble

    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2
        val centerY = size.height / 2

        // Bass particles (large, red)
        drawCircle(
            color = Color(0xFFFF0000).copy(alpha = bass),
            radius = bass * 100f,
            center = Offset(centerX, centerY)
        )

        // Mid particles (medium, green)
        drawCircle(
            color = Color(0xFF00FF00).copy(alpha = mid),
            radius = mid * 80f,
            center = Offset(centerX - 100f, centerY)
        )
        drawCircle(
            color = Color(0xFF00FF00).copy(alpha = mid),
            radius = mid * 80f,
            center = Offset(centerX + 100f, centerY)
        )

        // Treble particles (small, blue)
        for (i in 0..7) {
            val angle = (i / 8f) * 2 * PI.toFloat()
            val x = centerX + cos(angle) * 150f
            val y = centerY + sin(angle) * 150f
            drawCircle(
                color = Color(0xFF00FFFF).copy(alpha = treble),
                radius = treble * 40f,
                center = Offset(x, y)
            )
        }
    }
}

/**
 * Frequency rings visualization (concentric reactive rings)
 */
@Composable
private fun FrequencyRingsVisualizer(state: VisualizerState, rotation: Float) {
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
                    Color(0xFFFF0000).copy(alpha = 0f),
                    Color(0xFFFF0000).copy(alpha = bass * 0.8f)
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
                    Color(0xFF00FF00).copy(alpha = 0f),
                    Color(0xFF00FF00).copy(alpha = mid * 0.8f)
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
                    Color(0xFF00FFFF).copy(alpha = treble * 0.8f),
                    Color(0xFF00FFFF).copy(alpha = 0f)
                ),
                center = Offset(centerX, centerY)
            ),
            radius = maxRadius * 0.3f * (1.0f + treble * 0.2f),
            center = Offset(centerX, centerY),
            style = Stroke(width = 10f)
        )
    }
}

/**
 * Available visualizer styles
 */
enum class VisualizerStyle {
    SPECTRUM_BARS,
    WAVEFORM,
    CIRCULAR,
    PARTICLES,
    FREQUENCY_RINGS
}
