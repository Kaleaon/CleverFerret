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
    val primaryColor = MaterialTheme.colorScheme.primary
    val secondaryColor = MaterialTheme.colorScheme.secondary
    val tertiaryColor = MaterialTheme.colorScheme.tertiary
    val backgroundColor = MaterialTheme.colorScheme.background
    
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
            .background(backgroundColor.copy(alpha = 0.95f)),
        contentAlignment = Alignment.Center
    ) {
        when (style) {
            VisualizerStyle.SPECTRUM_BARS -> SpectrumBarsVisualizer(visualizerState, primaryColor, secondaryColor)
            VisualizerStyle.WAVEFORM -> WaveformVisualizer(visualizerState, primaryColor, secondaryColor, tertiaryColor)
            VisualizerStyle.CIRCULAR -> CircularVisualizer(visualizerState, rotation, primaryColor)
            VisualizerStyle.PARTICLES -> ParticleVisualizer(visualizerState, primaryColor, secondaryColor, tertiaryColor)
            VisualizerStyle.FREQUENCY_RINGS -> FrequencyRingsVisualizer(visualizerState, rotation, primaryColor, secondaryColor, tertiaryColor)
        }
    }
}

/**
 * Spectrum bars visualization (classic frequency bars)
 */
@Composable
private fun SpectrumBarsVisualizer(
    state: VisualizerState,
    primaryColor: Color,
    secondaryColor: Color
) {
    val spectrum = state.frequencyBands.spectrum.ifEmpty { List(64) { 0f } }

    Canvas(modifier = Modifier.fillMaxSize()) {
        val barWidth = size.width / spectrum.size
        val maxHeight = size.height

        spectrum.forEachIndexed { index, magnitude ->
            val barHeight = magnitude * maxHeight
            val x = index * barWidth
            val progress = index.toFloat() / spectrum.size

            drawRect(
                brush = Brush.verticalGradient(
                    colors = listOf(
                        androidx.compose.ui.graphics.lerp(primaryColor, secondaryColor, progress),
                        primaryColor.copy(alpha = 0.6f)
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
private fun WaveformVisualizer(
    state: VisualizerState,
    primaryColor: Color,
    secondaryColor: Color,
    tertiaryColor: Color
) {
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
                    primaryColor,
                    secondaryColor,
                    tertiaryColor
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
private fun CircularVisualizer(
    state: VisualizerState,
    rotation: Float,
    primaryColor: Color
) {
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

            val alpha = 0.6f + (magnitude * 0.4f)

            drawLine(
                brush = Brush.linearGradient(
                    colors = listOf(
                        primaryColor.copy(alpha = alpha * 0.6f),
                        primaryColor.copy(alpha = alpha)
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
private fun ParticleVisualizer(
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

/**
 * Frequency rings visualization (concentric reactive rings)
 */
@Composable
private fun FrequencyRingsVisualizer(
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
