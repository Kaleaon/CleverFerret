package com.universalmedialibrary.ui.plex.components

import android.graphics.RuntimeShader
import android.os.Build
import androidx.compose.animation.core.*
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.plex.theme.PlexColors
import kotlin.math.*
import kotlin.random.Random

/**
 * Visualizer Background Component
 * 
 * Beautiful audio visualizer that can be used as app background while:
 * - Music is playing
 * - Podcasts are playing
 * - Radio is playing
 * - Ambient sounds are playing
 * 
 * Supports multiple visualization modes:
 * - Bars
 * - Waves
 * - Circular
 * - Particles
 * - Spectrum
 */

@Composable
fun PlexVisualizerBackground(
    audioData: List<Float>, // Normalized 0-1 amplitude data from audio session
    visualizerMode: VisualizerMode = VisualizerMode.BARS,
    accentColor: Color = PlexColors.AccentPrimary,
    isPlaying: Boolean = true,
    modifier: Modifier = Modifier
) {
    val infiniteTransition = rememberInfiniteTransition(label = "visualizer")
    
    // Animation for smooth transitions when no real audio data
    val animatedPhase by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 2 * PI.toFloat(),
        animationSpec = infiniteRepeatable(
            animation = tween(3000, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "phase"
    )
    
    val animatedScale by infiniteTransition.animateFloat(
        initialValue = 0.8f,
        targetValue = 1.2f,
        animationSpec = infiniteRepeatable(
            animation = tween(2000, easing = FastOutSlowInEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "scale"
    )
    
    // Generate simulated data if no real data provided
    val visualData = remember(audioData, animatedPhase) {
        if (audioData.isEmpty() && isPlaying) {
            // Generate simulated audio bars
            List(64) { i ->
                val freq = i / 64f
                val amplitude = (sin(animatedPhase * (1 + freq * 3)) + 1) / 2 * 0.8f +
                        (sin(animatedPhase * 2 + freq * 5) + 1) / 4 * 0.2f
                amplitude.coerceIn(0.1f, 1f)
            }
        } else {
            audioData.ifEmpty { List(64) { 0.1f } }
        }
    }
    
    Canvas(
        modifier = modifier
            .fillMaxSize()
            .background(PlexColors.Background)
    ) {
        when (visualizerMode) {
            VisualizerMode.BARS -> drawBarsVisualizer(visualData, accentColor, animatedScale)
            VisualizerMode.WAVES -> drawWaveVisualizer(visualData, accentColor, animatedPhase)
            VisualizerMode.CIRCULAR -> drawCircularVisualizer(visualData, accentColor, animatedPhase)
            VisualizerMode.PARTICLES -> drawParticleVisualizer(visualData, accentColor, animatedPhase)
            VisualizerMode.SPECTRUM -> drawSpectrumVisualizer(visualData, accentColor, animatedScale)
        }
    }
}

enum class VisualizerMode {
    BARS,
    WAVES,
    CIRCULAR,
    PARTICLES,
    SPECTRUM
}

private fun DrawScope.drawBarsVisualizer(
    data: List<Float>,
    accentColor: Color,
    scale: Float
) {
    val barCount = data.size.coerceAtMost(64)
    val barWidth = size.width / barCount
    val maxHeight = size.height * 0.6f
    val centerY = size.height
    
    data.take(barCount).forEachIndexed { index, amplitude ->
        val barHeight = amplitude * maxHeight * scale
        val x = index * barWidth
        
        // Gradient from accent to transparent
        val brush = Brush.verticalGradient(
            colors = listOf(
                accentColor.copy(alpha = 0.8f),
                accentColor.copy(alpha = 0.4f),
                accentColor.copy(alpha = 0.1f)
            ),
            startY = centerY - barHeight,
            endY = centerY
        )
        
        drawRect(
            brush = brush,
            topLeft = Offset(x + barWidth * 0.1f, centerY - barHeight),
            size = Size(barWidth * 0.8f, barHeight)
        )
        
        // Mirror effect
        drawRect(
            brush = Brush.verticalGradient(
                colors = listOf(
                    accentColor.copy(alpha = 0.2f),
                    Color.Transparent
                )
            ),
            topLeft = Offset(x + barWidth * 0.1f, centerY),
            size = Size(barWidth * 0.8f, barHeight * 0.3f)
        )
    }
}

private fun DrawScope.drawWaveVisualizer(
    data: List<Float>,
    accentColor: Color,
    phase: Float
) {
    val path = Path()
    val mirrorPath = Path()
    val centerY = size.height / 2
    val amplitude = size.height * 0.3f
    
    path.moveTo(0f, centerY)
    mirrorPath.moveTo(0f, centerY)
    
    data.forEachIndexed { index, value ->
        val x = (index.toFloat() / data.size) * size.width
        val y = centerY + sin(phase + index * 0.1f) * amplitude * value
        val mirrorY = centerY - sin(phase + index * 0.1f) * amplitude * value
        
        if (index == 0) {
            path.moveTo(x, y)
            mirrorPath.moveTo(x, mirrorY)
        } else {
            path.lineTo(x, y)
            mirrorPath.lineTo(x, mirrorY)
        }
    }
    
    // Complete paths for fill
    path.lineTo(size.width, centerY)
    path.lineTo(size.width, size.height)
    path.lineTo(0f, size.height)
    path.close()
    
    mirrorPath.lineTo(size.width, centerY)
    mirrorPath.lineTo(size.width, 0f)
    mirrorPath.lineTo(0f, 0f)
    mirrorPath.close()
    
    drawPath(
        path = path,
        brush = Brush.verticalGradient(
            colors = listOf(
                accentColor.copy(alpha = 0.6f),
                accentColor.copy(alpha = 0.1f)
            ),
            startY = centerY,
            endY = size.height
        )
    )
    
    drawPath(
        path = mirrorPath,
        brush = Brush.verticalGradient(
            colors = listOf(
                accentColor.copy(alpha = 0.1f),
                accentColor.copy(alpha = 0.4f)
            ),
            startY = 0f,
            endY = centerY
        )
    )
}

private fun DrawScope.drawCircularVisualizer(
    data: List<Float>,
    accentColor: Color,
    phase: Float
) {
    val centerX = size.width / 2
    val centerY = size.height / 2
    val baseRadius = minOf(size.width, size.height) * 0.25f
    val maxExtension = minOf(size.width, size.height) * 0.2f
    
    val barCount = data.size.coerceAtMost(64)
    val angleStep = (2 * PI / barCount).toFloat()
    
    data.take(barCount).forEachIndexed { index, amplitude ->
        val angle = index * angleStep + phase * 0.5f
        val extension = amplitude * maxExtension
        
        val innerX = centerX + cos(angle) * baseRadius
        val innerY = centerY + sin(angle) * baseRadius
        val outerX = centerX + cos(angle) * (baseRadius + extension)
        val outerY = centerY + sin(angle) * (baseRadius + extension)
        
        drawLine(
            color = accentColor.copy(alpha = 0.6f + amplitude * 0.4f),
            start = Offset(innerX, innerY),
            end = Offset(outerX, outerY),
            strokeWidth = 3.dp.toPx()
        )
    }
    
    // Center glow
    drawCircle(
        brush = Brush.radialGradient(
            colors = listOf(
                accentColor.copy(alpha = 0.3f),
                Color.Transparent
            ),
            radius = baseRadius * 0.8f
        ),
        center = Offset(centerX, centerY)
    )
}

private fun DrawScope.drawParticleVisualizer(
    data: List<Float>,
    accentColor: Color,
    phase: Float
) {
    val particleCount = 100
    val random = Random(42) // Fixed seed for consistent particles
    
    repeat(particleCount) { i ->
        val baseX = random.nextFloat() * size.width
        val baseY = random.nextFloat() * size.height
        val dataIndex = (i % data.size).coerceIn(0, data.lastIndex)
        val amplitude = data.getOrElse(dataIndex) { 0.5f }
        
        // Particle movement based on amplitude and phase
        val x = baseX + sin(phase + i * 0.1f) * 20 * amplitude
        val y = baseY + cos(phase + i * 0.1f) * 20 * amplitude
        val particleSize = (2 + amplitude * 6).dp.toPx()
        
        drawCircle(
            color = accentColor.copy(alpha = 0.3f + amplitude * 0.5f),
            radius = particleSize,
            center = Offset(x, y)
        )
    }
}

private fun DrawScope.drawSpectrumVisualizer(
    data: List<Float>,
    accentColor: Color,
    scale: Float
) {
    val barCount = data.size.coerceAtMost(32)
    val barWidth = size.width / barCount
    val maxHeight = size.height * 0.7f
    
    // Draw spectrum bars with gradient colors
    data.take(barCount).forEachIndexed { index, amplitude ->
        val barHeight = amplitude * maxHeight * scale
        val x = index * barWidth
        val hue = (index.toFloat() / barCount * 60 + 10).coerceIn(0f, 360f) // Orange to yellow
        
        val barColor = Color.hsv(hue, 0.8f, 0.9f)
        
        // Main bar
        drawRect(
            brush = Brush.verticalGradient(
                colors = listOf(
                    barColor.copy(alpha = 0.9f),
                    accentColor.copy(alpha = 0.5f)
                )
            ),
            topLeft = Offset(x + 2, size.height - barHeight),
            size = Size(barWidth - 4, barHeight)
        )
        
        // Glow effect
        drawRect(
            brush = Brush.verticalGradient(
                colors = listOf(
                    barColor.copy(alpha = 0.3f),
                    Color.Transparent
                )
            ),
            topLeft = Offset(x - 2, size.height - barHeight - 10),
            size = Size(barWidth + 4, barHeight + 20)
        )
    }
}

/**
 * Composable wrapper that shows visualizer when audio is playing
 */
@Composable
fun VisualizerBackgroundWrapper(
    isPlaying: Boolean,
    audioData: List<Float> = emptyList(),
    visualizerMode: VisualizerMode = VisualizerMode.BARS,
    accentColor: Color = PlexColors.AccentPrimary,
    modifier: Modifier = Modifier,
    content: @Composable () -> Unit
) {
    Box(modifier = modifier.fillMaxSize()) {
        // Show visualizer when playing
        if (isPlaying) {
            PlexVisualizerBackground(
                audioData = audioData,
                visualizerMode = visualizerMode,
                accentColor = accentColor,
                isPlaying = true
            )
        } else {
            // Static background when not playing
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .background(PlexColors.Background)
            )
        }
        
        // Content on top
        content()
    }
}
