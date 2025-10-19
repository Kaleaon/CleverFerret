package com.universalmedialibrary.ui.audio

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.audio.visualizer.VisualizerData
import com.universalmedialibrary.audio.visualizer.VisualizerMode
import com.universalmedialibrary.audio.visualizer.VisualizerStyle
import kotlin.math.*

/**
 * Poweramp-quality visualizer canvas
 * Renders beautiful audio visualizations at 60fps
 */
@Composable
fun VisualizerCanvas(
    data: VisualizerData,
    mode: VisualizerMode,
    style: VisualizerStyle,
    modifier: Modifier = Modifier
) {
    val primaryColor = MaterialTheme.colorScheme.primary
    val secondaryColor = MaterialTheme.colorScheme.secondary
    val tertiaryColor = MaterialTheme.colorScheme.tertiary
    
    Canvas(
        modifier = modifier
            .fillMaxWidth()
            .height(200.dp)
            .background(MaterialTheme.colorScheme.surface.copy(alpha = 0.3f))
    ) {
        when (data) {
            is VisualizerData.Spectrum -> {
                if (data.renderAsLines) {
                    drawSpectrumLines(data, style, primaryColor, secondaryColor)
                } else {
                    drawSpectrumBars(data, style, primaryColor, secondaryColor)
                }
            }
            is VisualizerData.Waveform -> {
                drawWaveform(data, style, primaryColor)
            }
            is VisualizerData.Circular -> {
                drawCircularSpectrum(data, style, primaryColor, secondaryColor, tertiaryColor)
            }
            is VisualizerData.Particle -> {
                drawParticleSystem(data, style, primaryColor, secondaryColor)
            }
            is VisualizerData.Empty -> {
                // Draw placeholder
                drawIdleVisualization(primaryColor)
            }
        }
    }
}

/**
 * Draw classic spectrum bars (Poweramp-style)
 */
private fun androidx.compose.ui.graphics.drawscope.DrawScope.drawSpectrumBars(
    data: VisualizerData.Spectrum,
    style: VisualizerStyle,
    primaryColor: Color,
    secondaryColor: Color
) {
    val magnitudes = data.magnitudes
    val peaks = data.peaks
    val barCount = magnitudes.size
    val barWidth = size.width / barCount
    val maxHeight = size.height
    
    // Create gradient brush
    val brush = when (style) {
        VisualizerStyle.DEFAULT -> Brush.verticalGradient(
            colors = listOf(
                primaryColor,
                secondaryColor.copy(alpha = 0.7f),
                primaryColor.copy(alpha = 0.3f)
            )
        )
        VisualizerStyle.RAINBOW -> Brush.horizontalGradient(
            colors = listOf(
                Color(0xFFFF0000), Color(0xFFFF7F00), Color(0xFFFFFF00),
                Color(0xFF00FF00), Color(0xFF0000FF), Color(0xFF4B0082), Color(0xFF9400D3)
            )
        )
        VisualizerStyle.FIRE -> Brush.verticalGradient(
            colors = listOf(Color(0xFFFFFF00), Color(0xFFFF6600), Color(0xFFFF0000))
        )
        VisualizerStyle.OCEAN -> Brush.verticalGradient(
            colors = listOf(Color(0xFF00FFFF), Color(0xFF0080FF), Color(0xFF0000FF))
        )
        VisualizerStyle.NEON -> Brush.verticalGradient(
            colors = listOf(Color(0xFF00FFFF), Color(0xFFFF00FF))
        )
        VisualizerStyle.MONOCHROME -> Brush.verticalGradient(
            colors = listOf(primaryColor, primaryColor.copy(alpha = 0.3f))
        )
        VisualizerStyle.MATERIAL_YOU -> Brush.verticalGradient(
            colors = listOf(primaryColor, secondaryColor)
        )
    }
    
    for (i in magnitudes.indices) {
        val magnitude = magnitudes[i]
        val barHeight = magnitude * maxHeight
        
        // Draw bar
        drawRect(
            brush = brush,
            topLeft = Offset(i * barWidth, maxHeight - barHeight),
            size = Size(barWidth * 0.8f, barHeight)
        )
        
        // Draw peak indicator (small line at top of peak)
        if (peaks[i] > 0) {
            val peakY = maxHeight - (peaks[i] * maxHeight)
            drawLine(
                color = Color.White,
                start = Offset(i * barWidth, peakY),
                end = Offset((i + 1) * barWidth * 0.8f, peakY),
                strokeWidth = 2.dp.toPx()
            )
        }
        
        // Draw reflection (subtle)
        drawRect(
            brush = Brush.verticalGradient(
                colors = listOf(
                    primaryColor.copy(alpha = 0.1f),
                    Color.Transparent
                )
            ),
            topLeft = Offset(i * barWidth, maxHeight),
            size = Size(barWidth * 0.8f, barHeight * 0.3f)
        )
    }
}

/**
 * Draw smooth spectrum lines
 */
private fun androidx.compose.ui.graphics.drawscope.DrawScope.drawSpectrumLines(
    data: VisualizerData.Spectrum,
    style: VisualizerStyle,
    primaryColor: Color,
    secondaryColor: Color
) {
    val magnitudes = data.magnitudes
    val maxHeight = size.height
    val stepX = size.width / (magnitudes.size - 1)
    
    val path = Path()
    
    // Create smooth curve through points
    path.moveTo(0f, maxHeight - (magnitudes[0] * maxHeight))
    
    for (i in 0 until magnitudes.size - 1) {
        val x1 = i * stepX
        val y1 = maxHeight - (magnitudes[i] * maxHeight)
        val x2 = (i + 1) * stepX
        val y2 = maxHeight - (magnitudes[i + 1] * maxHeight)
        
        // Bezier curve for smoothness
        val cx = (x1 + x2) / 2
        path.quadraticBezierTo(x1, y1, cx, (y1 + y2) / 2)
    }
    
    // Final point
    path.lineTo(size.width, maxHeight - (magnitudes.last() * maxHeight))
    
    // Draw filled area under curve
    val fillPath = Path().apply {
        addPath(path)
        lineTo(size.width, maxHeight)
        lineTo(0f, maxHeight)
        close()
    }
    
    drawPath(
        path = fillPath,
        brush = Brush.verticalGradient(
            colors = listOf(
                primaryColor.copy(alpha = 0.5f),
                Color.Transparent
            )
        )
    )
    
    // Draw line
    drawPath(
        path = path,
        color = primaryColor,
        style = Stroke(width = 3.dp.toPx())
    )
}

/**
 * Draw oscilloscope-style waveform
 */
private fun androidx.compose.ui.graphics.drawscope.DrawScope.drawWaveform(
    data: VisualizerData.Waveform,
    style: VisualizerStyle,
    primaryColor: Color
) {
    val amplitudes = data.amplitudes
    val maxHeight = size.height
    val centerY = maxHeight / 2
    val stepX = size.width / amplitudes.size
    
    val path = Path()
    path.moveTo(0f, centerY + (amplitudes[0] - 0.5f) * maxHeight)
    
    for (i in 1 until amplitudes.size) {
        val x = i * stepX
        val y = centerY + (amplitudes[i] - 0.5f) * maxHeight
        path.lineTo(x, y)
    }
    
    // Draw with glow effect
    drawPath(
        path = path,
        color = primaryColor.copy(alpha = 0.3f),
        style = Stroke(width = 6.dp.toPx())
    )
    
    drawPath(
        path = path,
        color = primaryColor,
        style = Stroke(width = 2.dp.toPx())
    )
}

/**
 * Draw circular spectrum (Poweramp's signature style)
 */
private fun androidx.compose.ui.graphics.drawscope.DrawScope.drawCircularSpectrum(
    data: VisualizerData.Circular,
    style: VisualizerStyle,
    primaryColor: Color,
    secondaryColor: Color,
    tertiaryColor: Color
) {
    val magnitudes = data.magnitudes
    val centerX = size.width / 2
    val centerY = size.height / 2
    val baseRadius = min(size.width, size.height) * 0.25f
    val maxBarLength = min(size.width, size.height) * 0.35f
    
    val angleStep = 360f / magnitudes.size
    
    for (i in magnitudes.indices) {
        val angle = i * angleStep - 90 // Start from top
        val magnitude = magnitudes[i]
        val barLength = magnitude * maxBarLength
        
        // Calculate start and end points
        val startAngleRad = Math.toRadians(angle.toDouble())
        val startX = centerX + (baseRadius * cos(startAngleRad)).toFloat()
        val startY = centerY + (baseRadius * sin(startAngleRad)).toFloat()
        val endX = centerX + ((baseRadius + barLength) * cos(startAngleRad)).toFloat()
        val endY = centerY + ((baseRadius + barLength) * sin(startAngleRad)).toFloat()
        
        // Color based on position
        val color = when {
            i < magnitudes.size / 3 -> primaryColor
            i < magnitudes.size * 2 / 3 -> secondaryColor
            else -> tertiaryColor
        }
        
        // Draw bar
        drawLine(
            color = color.copy(alpha = 0.8f),
            start = Offset(startX, startY),
            end = Offset(endX, endY),
            strokeWidth = 4.dp.toPx(),
            cap = StrokeCap.Round
        )
    }
    
    // Draw center circle
    drawCircle(
        brush = Brush.radialGradient(
            colors = listOf(
                primaryColor.copy(alpha = 0.5f),
                Color.Transparent
            )
        ),
        radius = baseRadius * 0.8f,
        center = Offset(centerX, centerY)
    )
    
    // Draw outer ring
    drawCircle(
        color = primaryColor.copy(alpha = 0.3f),
        radius = baseRadius,
        center = Offset(centerX, centerY),
        style = Stroke(width = 2.dp.toPx())
    )
}

/**
 * Draw particle system visualization
 */
private fun androidx.compose.ui.graphics.drawscope.DrawScope.drawParticleSystem(
    data: VisualizerData.Particle,
    style: VisualizerStyle,
    primaryColor: Color,
    secondaryColor: Color
) {
    val magnitudes = data.magnitudes
    val centerX = size.width / 2
    val centerY = size.height / 2
    
    for (i in magnitudes.indices) {
        val magnitude = magnitudes[i]
        if (magnitude < 0.1f) continue // Skip quiet bands
        
        val angle = (i.toFloat() / magnitudes.size) * 2 * PI
        val distance = magnitude * min(size.width, size.height) * 0.4f
        
        val x = centerX + (distance * cos(angle)).toFloat()
        val y = centerY + (distance * sin(angle)).toFloat()
        
        // Draw particle
        drawCircle(
            color = primaryColor.copy(alpha = magnitude),
            radius = magnitude * 10.dp.toPx(),
            center = Offset(x, y)
        )
        
        // Draw connecting line
        drawLine(
            color = secondaryColor.copy(alpha = magnitude * 0.3f),
            start = Offset(centerX, centerY),
            end = Offset(x, y),
            strokeWidth = 1.dp.toPx()
        )
    }
}

/**
 * Draw idle visualization (when no audio playing)
 */
private fun androidx.compose.ui.graphics.drawscope.DrawScope.drawIdleVisualization(
    primaryColor: Color
) {
    val centerY = size.height / 2
    
    // Draw horizontal line
    drawLine(
        color = primaryColor.copy(alpha = 0.3f),
        start = Offset(0f, centerY),
        end = Offset(size.width, centerY),
        strokeWidth = 2.dp.toPx()
    )
    
    // Draw dots
    val dotCount = 20
    val stepX = size.width / dotCount
    
    for (i in 0 until dotCount) {
        drawCircle(
            color = primaryColor.copy(alpha = 0.2f),
            radius = 3.dp.toPx(),
            center = Offset(i * stepX, centerY)
        )
    }
}
