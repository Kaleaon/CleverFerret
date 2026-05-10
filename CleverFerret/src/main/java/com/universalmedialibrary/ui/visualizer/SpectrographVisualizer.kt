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
 * Spectrograph visualization (frequency over time)
 */
@Composable
internal fun SpectrographVisualizer(
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
