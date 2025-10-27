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
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.services.visualizer.VisualizerState
import kotlin.math.*

/**
 * ProjectM-style Audio Visualizer UI Component
 *
 * Renders beautiful, reactive visualizations based on audio data
 * inspired by the projectM music visualizer
 * 
 * Optimized for 60 FPS rendering with hardware acceleration
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
    
    // Force recomposition on every state change for smooth 60 FPS
    // Using timestamp as key ensures updates at audio capture rate
    key(visualizerState.timestamp) {
        // This block will recompose whenever audio data updates
    }

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
            VisualizerStyle.OSCILLOSCOPE -> OscilloscopeVisualizer(visualizerState, primaryColor, secondaryColor)
            VisualizerStyle.SPECTROGRAPH -> SpectrographVisualizer(visualizerState, primaryColor, secondaryColor, tertiaryColor)
            VisualizerStyle.LISSAJOUS -> LissajousVisualizer(visualizerState, primaryColor, secondaryColor)
            VisualizerStyle.RADIAL_WAVEFORM -> RadialWaveformVisualizer(visualizerState, rotation, primaryColor)
            VisualizerStyle.BEAT_REACTIVE -> BeatReactiveVisualizer(visualizerState, primaryColor, secondaryColor, tertiaryColor)
            VisualizerStyle.KALEIDOSCOPE -> KaleidoscopeVisualizer(visualizerState, rotation, primaryColor, secondaryColor)
            VisualizerStyle.FRACTAL -> FractalVisualizer(visualizerState, rotation, primaryColor, tertiaryColor)
            VisualizerStyle.MATRIX_RAIN -> MatrixRainVisualizer(visualizerState, primaryColor)
            VisualizerStyle.DUAL_CHANNEL -> DualChannelVisualizer(visualizerState, primaryColor, secondaryColor)
            VisualizerStyle.CUBE_3D -> Cube3DVisualizer(visualizerState, rotation, primaryColor, secondaryColor, tertiaryColor)
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
 * Oscilloscope visualization (XY mode waveform)
 */
@Composable
private fun OscilloscopeVisualizer(
    state: VisualizerState,
    primaryColor: Color,
    secondaryColor: Color
) {
    val waveform = state.waveform.ifEmpty { List(256) { 0f } }
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2
        val centerY = size.height / 2
        val scale = min(size.width, size.height) * 0.4f
        
        // Create Lissajous-style XY plot
        val path = Path().apply {
            waveform.forEachIndexed { index, amplitude ->
                val nextIdx = (index + waveform.size / 4) % waveform.size
                val x = centerX + (amplitude * scale)
                val y = centerY + (waveform[nextIdx] * scale)
                
                if (index == 0) moveTo(x, y)
                else lineTo(x, y)
            }
        }
        
        // Draw with glow effect
        drawPath(
            path = path,
            brush = Brush.radialGradient(
                colors = listOf(primaryColor, secondaryColor.copy(alpha = 0.3f)),
                center = Offset(centerX, centerY)
            ),
            style = Stroke(width = 3f, cap = StrokeCap.Round)
        )
    }
}

/**
 * Spectrograph visualization (frequency over time)
 */
@Composable
private fun SpectrographVisualizer(
    state: VisualizerState,
    primaryColor: Color,
    secondaryColor: Color,
    tertiaryColor: Color
) {
    val spectrum = state.frequencyBands.spectrum.ifEmpty { List(64) { 0f } }
    
    // Store history for scrolling effect
    val history = remember { mutableListOf<List<Float>>() }
    LaunchedEffect(state.timestamp) {
        history.add(spectrum)
        if (history.size > 60) history.removeAt(0)
    }
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        val cellWidth = size.width / spectrum.size
        val cellHeight = size.height / maxOf(history.size, 1)
        
        history.forEachIndexed { timeIndex, spectrumData ->
            spectrumData.forEachIndexed { freqIndex, magnitude ->
                val x = freqIndex * cellWidth
                val y = timeIndex * cellHeight
                val progress = magnitude
                
                val color = when {
                    progress > 0.7f -> tertiaryColor
                    progress > 0.4f -> secondaryColor
                    else -> primaryColor
                }.copy(alpha = progress.coerceIn(0.1f, 1f))
                
                drawRect(
                    color = color,
                    topLeft = Offset(x, y),
                    size = androidx.compose.ui.geometry.Size(cellWidth * 0.9f, cellHeight * 0.9f)
                )
            }
        }
    }
}

/**
 * Lissajous curves visualization
 */
@Composable
private fun LissajousVisualizer(
    state: VisualizerState,
    primaryColor: Color,
    secondaryColor: Color
) {
    val waveform = state.waveform.ifEmpty { List(256) { 0f } }
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2
        val centerY = size.height / 2
        val scale = min(size.width, size.height) * 0.35f
        
        // Different phase offsets for Lissajous patterns
        val phaseOffsets = listOf(
            waveform.size / 8,
            waveform.size / 6,
            waveform.size / 4
        )
        
        phaseOffsets.forEachIndexed { index, phase ->
            val path = Path().apply {
                waveform.forEachIndexed { i, amplitude ->
                    val nextIdx = (i + phase) % waveform.size
                    val x = centerX + (amplitude * scale * (1f + index * 0.1f))
                    val y = centerY + (waveform[nextIdx] * scale * (1f + index * 0.1f))
                    
                    if (i == 0) moveTo(x, y)
                    else lineTo(x, y)
                }
            }
            
            val alpha = 0.4f - (index * 0.1f)
            drawPath(
                path = path,
                color = androidx.compose.ui.graphics.lerp(primaryColor, secondaryColor, index / 3f).copy(alpha = alpha),
                style = Stroke(width = 2f, cap = StrokeCap.Round)
            )
        }
    }
}

/**
 * Radial waveform visualization
 */
@Composable
private fun RadialWaveformVisualizer(
    state: VisualizerState,
    rotation: Float,
    primaryColor: Color
) {
    val waveform = state.waveform.ifEmpty { List(256) { 0f } }
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2
        val centerY = size.height / 2
        val baseRadius = min(size.width, size.height) * 0.2f
        
        val path = Path().apply {
            waveform.forEachIndexed { index, amplitude ->
                val angle = (index.toFloat() / waveform.size * 360f + rotation) * PI.toFloat() / 180f
                val radius = baseRadius + (amplitude * baseRadius * 2f)
                val x = centerX + cos(angle) * radius
                val y = centerY + sin(angle) * radius
                
                if (index == 0) moveTo(x, y)
                else lineTo(x, y)
            }
            close()
        }
        
        drawPath(
            path = path,
            brush = Brush.radialGradient(
                colors = listOf(
                    primaryColor.copy(alpha = 0.8f),
                    primaryColor.copy(alpha = 0.2f)
                ),
                center = Offset(centerX, centerY)
            ),
            style = Stroke(width = 3f)
        )
    }
}

/**
 * Beat-reactive shapes visualization
 */
@Composable
private fun BeatReactiveVisualizer(
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

/**
 * Kaleidoscope visualization
 */
@Composable
private fun KaleidoscopeVisualizer(
    state: VisualizerState,
    rotation: Float,
    primaryColor: Color,
    secondaryColor: Color
) {
    val spectrum = state.frequencyBands.spectrum.ifEmpty { List(64) { 0f } }
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2
        val centerY = size.height / 2
        val segments = 6
        
        for (segment in 0 until segments) {
            val segmentAngle = (segment * 360f / segments + rotation) * PI.toFloat() / 180f
            
            spectrum.take(20).forEachIndexed { index, magnitude ->
                val distance = 50f + index * 15f
                val spread = magnitude * 50f
                
                for (side in -1..1 step 2) {
                    val offset = side * spread
                    val x = centerX + cos(segmentAngle) * distance + sin(segmentAngle) * offset
                    val y = centerY + sin(segmentAngle) * distance - cos(segmentAngle) * offset
                    
                    val progress = index.toFloat() / 20f
                    val color = androidx.compose.ui.graphics.lerp(primaryColor, secondaryColor, progress)
                    
                    drawCircle(
                        color = color.copy(alpha = magnitude),
                        radius = magnitude * 15f,
                        center = Offset(x, y)
                    )
                }
            }
        }
    }
}

/**
 * Fractal-inspired visualization
 */
@Composable
private fun FractalVisualizer(
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

/**
 * Matrix rain style visualization
 */
@Composable
private fun MatrixRainVisualizer(
    state: VisualizerState,
    primaryColor: Color
) {
    val spectrum = state.frequencyBands.spectrum.ifEmpty { List(64) { 0f } }
    
    // Store falling positions
    val dropPositions = remember { mutableStateMapOf<Int, Float>() }
    
    LaunchedEffect(state.timestamp) {
        spectrum.forEachIndexed { index, magnitude ->
            val current = dropPositions.getOrPut(index) { 0f }
            dropPositions[index] = (current + magnitude * 20f) % 100f
        }
    }
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        val columnWidth = size.width / spectrum.size
        
        spectrum.forEachIndexed { index, magnitude ->
            val x = index * columnWidth
            val dropY = (dropPositions[index] ?: 0f) * size.height / 100f
            
            // Draw trail
            for (i in 0..10) {
                val y = dropY - (i * 20f)
                if (y >= 0 && y < size.height) {
                    val alpha = magnitude * (1f - i / 10f)
                    drawCircle(
                        color = primaryColor.copy(alpha = alpha),
                        radius = columnWidth * 0.4f,
                        center = Offset(x + columnWidth / 2, y)
                    )
                }
            }
        }
    }
}

/**
 * Dual-channel stereo visualization
 */
@Composable
private fun DualChannelVisualizer(
    state: VisualizerState,
    primaryColor: Color,
    secondaryColor: Color
) {
    val waveform = state.waveform.ifEmpty { List(256) { 0f } }
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerY = size.height / 2
        val stepX = size.width / waveform.size
        val amplitude = size.height * 0.2f
        
        // Left channel (top half)
        val leftPath = Path().apply {
            moveTo(0f, centerY / 2)
            waveform.forEachIndexed { index, value ->
                val x = index * stepX
                val y = centerY / 2 + (value * amplitude * 0.8f)
                lineTo(x, y)
            }
        }
        
        // Right channel (bottom half) - slightly offset
        val rightPath = Path().apply {
            moveTo(0f, centerY + centerY / 2)
            waveform.forEachIndexed { index, value ->
                val x = index * stepX
                // Phase shift for stereo effect
                val shiftedIdx = (index + waveform.size / 16) % waveform.size
                val y = centerY + centerY / 2 + (waveform[shiftedIdx] * amplitude * 0.8f)
                lineTo(x, y)
            }
        }
        
        // Draw center divider
        drawLine(
            color = primaryColor.copy(alpha = 0.2f),
            start = Offset(0f, centerY),
            end = Offset(size.width, centerY),
            strokeWidth = 1f
        )
        
        drawPath(
            path = leftPath,
            color = primaryColor,
            style = Stroke(width = 2f, cap = StrokeCap.Round)
        )
        
        drawPath(
            path = rightPath,
            color = secondaryColor,
            style = Stroke(width = 2f, cap = StrokeCap.Round)
        )
    }
}

/**
 * 3D Cube spectrum visualization
 */
@Composable
private fun Cube3DVisualizer(
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

/**
 * Available visualizer styles
 */
enum class VisualizerStyle {
    SPECTRUM_BARS,
    WAVEFORM,
    CIRCULAR,
    PARTICLES,
    FREQUENCY_RINGS,
    OSCILLOSCOPE,
    SPECTROGRAPH,
    LISSAJOUS,
    RADIAL_WAVEFORM,
    BEAT_REACTIVE,
    KALEIDOSCOPE,
    FRACTAL,
    MATRIX_RAIN,
    DUAL_CHANNEL,
    CUBE_3D
}
