package com.universalmedialibrary.ui.player

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import com.cleverferret.core.designsystem.slider.AccessibleWaveformSeekBar

@Composable
internal fun WaveformSeekBar(
    points: List<Float>,
    progress: Float,
    accent: Color,
    backgroundColor: Color,
    onSeek: (Float) -> Unit,
    modifier: Modifier = Modifier
) {
    AccessibleWaveformSeekBar(
        points = points,
        progress = progress,
        accent = accent,
        backgroundColor = backgroundColor,
        onSeek = onSeek,
        modifier = modifier
    )
}
