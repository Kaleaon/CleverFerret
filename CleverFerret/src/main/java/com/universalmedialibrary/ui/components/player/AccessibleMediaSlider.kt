package com.universalmedialibrary.ui.components.player

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import com.cleverferret.core.designsystem.slider.AccessibleMediaSliderColors
import com.cleverferret.core.designsystem.slider.MediaChapterMarker
import com.cleverferret.core.designsystem.slider.AccessibleMediaSlider as CoreAccessibleMediaSlider

@Composable
fun AccessibleMediaSlider(
    value: Float,
    onValueChange: (Float) -> Unit,
    modifier: Modifier = Modifier,
    valueRange: ClosedFloatingPointRange<Float> = 0f..1f,
    onValueChangeFinished: (() -> Unit)? = null,
    bufferedValue: Float = 0f,
    chapters: List<MediaChapterMarker> = emptyList(),
    durationMs: Long = 0L,
    colors: AccessibleMediaSliderColors = AccessibleMediaSliderColors(
        activeTrackColor = androidx.compose.material3.MaterialTheme.colorScheme.primary,
        inactiveTrackColor = androidx.compose.material3.MaterialTheme.colorScheme.onSurface.copy(alpha = 0.12f),
        bufferedTrackColor = androidx.compose.material3.MaterialTheme.colorScheme.primary.copy(alpha = 0.3f),
        thumbColor = androidx.compose.material3.MaterialTheme.colorScheme.primary
    ),
    stepIncrement: Float? = null,
    contentDescription: String = "Media seek bar",
    valueTextFormatter: ((Float) -> String)? = null,
    enabled: Boolean = true,
    trackHeight: Dp = 4.dp,
    thumbRadius: Dp = 8.dp
) {
    CoreAccessibleMediaSlider(
        value = value,
        onValueChange = onValueChange,
        modifier = modifier,
        valueRange = valueRange,
        onValueChangeFinished = onValueChangeFinished,
        bufferedValue = bufferedValue,
        chapters = chapters,
        durationMs = durationMs,
        colors = colors,
        stepIncrement = stepIncrement,
        contentDescription = contentDescription,
        valueTextFormatter = valueTextFormatter,
        enabled = enabled,
        trackHeight = trackHeight,
        thumbRadius = thumbRadius
    )
}
