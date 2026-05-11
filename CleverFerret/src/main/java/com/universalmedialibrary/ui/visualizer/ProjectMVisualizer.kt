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
 * Vibrant color palettes for visualizer effects
 */
private object VisualizerColors {
    // Neon Cyber palette - electric and punchy
    val neonCyan = Color(0xFF00FFFF)
    val neonMagenta = Color(0xFFFF00FF)
    val neonPink = Color(0xFFFF1493)
    val neonBlue = Color(0xFF00BFFF)
    val neonGreen = Color(0xFF39FF14)
    val neonOrange = Color(0xFFFF6B00)
    val neonYellow = Color(0xFFFFFF00)
    val neonPurple = Color(0xFFBF00FF)
    
    // Aurora palette - rich gradients
    val auroraGreen = Color(0xFF00FF87)
    val auroraTeal = Color(0xFF00D4AA)
    val auroraBlue = Color(0xFF00A8E8)
    val auroraPurple = Color(0xFF8B5CF6)
    val auroraViolet = Color(0xFFA855F7)
    
    // Fire palette - warm and intense
    val fireRed = Color(0xFFFF4500)
    val fireOrange = Color(0xFFFF8C00)
    val fireYellow = Color(0xFFFFD700)
    val fireGold = Color(0xFFFFA500)
    
    // Deep space palette - cosmic
    val spacePurple = Color(0xFF6B5B95)
    val spaceBlue = Color(0xFF4169E1)
    val starWhite = Color(0xFFF0F8FF)
    
    fun getRainbowColor(position: Float): Color {
        val hue = (position * 360f) % 360f
        return Color.hsv(hue, 0.9f, 1f)
    }
}

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
    // Use vibrant neon colors instead of dull Material theme colors
    val primaryColor = VisualizerColors.neonCyan
    val secondaryColor = VisualizerColors.neonMagenta
    val tertiaryColor = VisualizerColors.neonGreen
    val backgroundColor = Color(0xFF0A0A0F) // Deep dark background for contrast
    
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
    
    // Color cycling animation for dynamic effects
    val colorPhase by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 1f,
        animationSpec = infiniteRepeatable(
            animation = tween(5000, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "colorPhase"
    )
    
    // Dynamic colors based on audio
    val dynamicPrimary = remember(visualizerState.frequencyBands.bass, colorPhase) {
        VisualizerColors.getRainbowColor(colorPhase + visualizerState.frequencyBands.bass * 0.3f)
    }
    val dynamicSecondary = remember(visualizerState.frequencyBands.mid, colorPhase) {
        VisualizerColors.getRainbowColor(colorPhase + 0.33f + visualizerState.frequencyBands.mid * 0.3f)
    }
    val dynamicTertiary = remember(visualizerState.frequencyBands.treble, colorPhase) {
        VisualizerColors.getRainbowColor(colorPhase + 0.66f + visualizerState.frequencyBands.treble * 0.3f)
    }

    Box(
        modifier = modifier
            .fillMaxSize()
            .background(backgroundColor),
        contentAlignment = Alignment.Center
    ) {
        when (style) {
            VisualizerStyle.SPECTRUM_BARS -> SpectrumBarsVisualizer(visualizerState, dynamicPrimary, dynamicSecondary)
            VisualizerStyle.WAVEFORM -> WaveformVisualizer(visualizerState, dynamicPrimary, dynamicSecondary, dynamicTertiary)
            VisualizerStyle.CIRCULAR -> CircularVisualizer(visualizerState, rotation)
            VisualizerStyle.PARTICLES -> ParticleVisualizer(visualizerState, dynamicPrimary, dynamicSecondary, dynamicTertiary)
            VisualizerStyle.FREQUENCY_RINGS -> FrequencyRingsVisualizer(visualizerState, rotation, VisualizerColors.neonCyan, VisualizerColors.neonMagenta, VisualizerColors.neonGreen)
            VisualizerStyle.OSCILLOSCOPE -> OscilloscopeVisualizer(visualizerState, VisualizerColors.neonCyan, VisualizerColors.neonPink)
            VisualizerStyle.SPECTROGRAPH -> SpectrographVisualizer(visualizerState, VisualizerColors.neonBlue, VisualizerColors.neonMagenta, VisualizerColors.fireOrange)
            VisualizerStyle.LISSAJOUS -> LissajousVisualizer(visualizerState, dynamicPrimary, dynamicSecondary)
            VisualizerStyle.RADIAL_WAVEFORM -> RadialWaveformVisualizer(visualizerState, rotation, dynamicPrimary)
            VisualizerStyle.BEAT_REACTIVE -> BeatReactiveVisualizer(visualizerState, VisualizerColors.neonMagenta, VisualizerColors.neonCyan, VisualizerColors.neonGreen)
            VisualizerStyle.KALEIDOSCOPE -> KaleidoscopeVisualizer(visualizerState, rotation, dynamicPrimary, dynamicSecondary)
            VisualizerStyle.FRACTAL -> FractalVisualizer(visualizerState, rotation, VisualizerColors.auroraPurple, VisualizerColors.auroraGreen)
            VisualizerStyle.MATRIX_RAIN -> MatrixRainVisualizer(visualizerState, VisualizerColors.neonGreen)
            VisualizerStyle.DUAL_CHANNEL -> DualChannelVisualizer(visualizerState, VisualizerColors.neonCyan, VisualizerColors.neonMagenta)
            VisualizerStyle.CUBE_3D -> Cube3DVisualizer(visualizerState, rotation, dynamicPrimary, dynamicSecondary, dynamicTertiary)
            VisualizerStyle.TUNNEL -> TunnelVisualizer(visualizerState, rotation, VisualizerColors.neonPurple, VisualizerColors.neonBlue)
            VisualizerStyle.STARFIELD -> StarfieldVisualizer(visualizerState, rotation, VisualizerColors.starWhite)
            VisualizerStyle.FLUID -> FluidVisualizer(visualizerState, VisualizerColors.auroraTeal, VisualizerColors.auroraPurple, VisualizerColors.auroraBlue)
        }
    }
}

/**
 * Tunnel visualization
 */
@Composable
private fun TunnelVisualizer(
    state: VisualizerState,
    rotation: Float,
    primaryColor: Color,
    secondaryColor: Color
) {
    val bass = state.frequencyBands.bass
    val mid = state.frequencyBands.mid
    
    Canvas(modifier = Modifier.fillMaxSize()) {
        val centerX = size.width / 2
        val centerY = size.height / 2
        val maxRadius = max(size.width, size.height)
        
        // Draw concentric squares creating tunnel effect
        for (i in 0..10) {
            val progress = (i + (rotation / 30f)) % 10f / 10f
            val size = maxRadius * progress
            val alpha = progress * (0.5f + bass * 0.5f)
            val rotationOffset = progress * 90f
            
            rotate(rotation + rotationOffset, pivot = Offset(centerX, centerY)) {
                drawRect(
                    color = primaryColor.copy(alpha = alpha),
                    topLeft = Offset(centerX - size / 2, centerY - size / 2),
                    size = androidx.compose.ui.geometry.Size(size, size),
                    style = Stroke(width = 5f + mid * 10f)
                )
                
                // Connect corners to next square for depth illusion
                if (i > 0) {
                     val prevProgress = (i - 1 + (rotation / 30f)) % 10f / 10f
                     val prevSize = maxRadius * prevProgress
                     // Simple connecting lines could be added here
                }
            }
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
    CUBE_3D,
    TUNNEL,
    STARFIELD,
    FLUID
}
