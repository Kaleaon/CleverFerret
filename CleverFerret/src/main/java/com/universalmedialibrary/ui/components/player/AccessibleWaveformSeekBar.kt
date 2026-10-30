package com.universalmedialibrary.ui.components.player

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import com.cleverferret.core.designsystem.slider.AccessibleWaveformSeekBar as CoreAccessibleWaveformSeekBar

@Composable
fun AccessibleWaveformSeekBar(
    points: List<Float>,
    progress: Float,
    accent: Color,
    backgroundColor: Color,
    onSeek: (Float) -> Unit,
    modifier: Modifier = Modifier,
    contentDescription: String = "Audio waveform seek bar",
    valueTextFormatter: ((Float) -> String)? = null,
    stepIncrement: Float = 0.05f,
    enabled: Boolean = true
) {
    CoreAccessibleWaveformSeekBar(
        points = points,
        progress = progress,
        accent = accent,
        backgroundColor = backgroundColor,
        onSeek = onSeek,
        modifier = modifier,
        contentDescription = contentDescription,
        valueTextFormatter = valueTextFormatter,
        stepIncrement = stepIncrement,
        enabled = enabled
    )
}
