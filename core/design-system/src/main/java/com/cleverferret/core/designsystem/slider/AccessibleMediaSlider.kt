package com.cleverferret.core.designsystem.slider

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.gestures.detectDragGestures
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.progressSemantics
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.CornerRadius
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.semantics.CustomAccessibilityAction
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.customActions
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.semantics.setProgress
import androidx.compose.ui.semantics.stateDescription
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import java.util.Locale
import kotlin.math.roundToInt

data class MediaChapterMarker(
    val positionMs: Long,
    val title: String? = null
)

data class AccessibleMediaSliderColors(
    val activeTrackColor: Color,
    val inactiveTrackColor: Color,
    val bufferedTrackColor: Color = activeTrackColor.copy(alpha = 0.3f),
    val thumbColor: Color = activeTrackColor,
    val chapterMarkerColor: Color = Color.White
)

/**
 * Unified accessible media slider composable that encapsulates visual progress,
 * touch/drag gestures, chapter markers, buffered progress, and WCAG 2.1 range semantics.
 */
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
        activeTrackColor = MaterialTheme.colorScheme.primary,
        inactiveTrackColor = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.12f),
        bufferedTrackColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.3f),
        thumbColor = MaterialTheme.colorScheme.primary
    ),
    stepIncrement: Float? = null,
    contentDescription: String = "Media seek bar",
    valueTextFormatter: ((Float) -> String)? = null,
    enabled: Boolean = true,
    trackHeight: Dp = 4.dp,
    thumbRadius: Dp = 8.dp
) {
    val rangeSpan = (valueRange.endInclusive - valueRange.start).coerceAtLeast(0.0001f)
    val clampedValue = value.coerceIn(valueRange.start, valueRange.endInclusive)
    val currentFraction = ((clampedValue - valueRange.start) / rangeSpan).coerceIn(0f, 1f)
    val bufferedFraction = ((bufferedValue.coerceIn(valueRange.start, valueRange.endInclusive) - valueRange.start) / rangeSpan).coerceIn(0f, 1f)

    val formattedState = valueTextFormatter?.invoke(clampedValue)
        ?: "${(currentFraction * 100).roundToInt()}%"

    val step = stepIncrement ?: (rangeSpan * 0.05f)

    Box(
        modifier = modifier
            .height(maxOf(trackHeight * 2 + thumbRadius * 2, 48.dp))
            .progressSemantics(
                value = clampedValue,
                valueRange = valueRange
            )
            .semantics(mergeDescendants = true) {
                this.contentDescription = contentDescription
                this.stateDescription = formattedState
                setProgress { targetValue ->
                    val coerced = targetValue.coerceIn(valueRange.start, valueRange.endInclusive)
                    onValueChange(coerced)
                    onValueChangeFinished?.invoke()
                    true
                }
                customActions = listOf(
                    CustomAccessibilityAction("Step forward") {
                        val next = (clampedValue + step).coerceAtMost(valueRange.endInclusive)
                        onValueChange(next)
                        onValueChangeFinished?.invoke()
                        true
                    },
                    CustomAccessibilityAction("Step backward") {
                        val prev = (clampedValue - step).coerceAtLeast(valueRange.start)
                        onValueChange(prev)
                        onValueChangeFinished?.invoke()
                        true
                    }
                )
            }
            .pointerInput(enabled, valueRange) {
                if (!enabled) return@pointerInput
                detectTapGestures { offset ->
                    val frac = (offset.x / size.width).coerceIn(0f, 1f)
                    val newValue = valueRange.start + frac * rangeSpan
                    onValueChange(newValue)
                    onValueChangeFinished?.invoke()
                }
            }
            .pointerInput(enabled, valueRange) {
                if (!enabled) return@pointerInput
                detectDragGestures(
                    onDrag = { change, _ ->
                        change.consume()
                        val frac = (change.position.x / size.width).coerceIn(0f, 1f)
                        val newValue = valueRange.start + frac * rangeSpan
                        onValueChange(newValue)
                    },
                    onDragEnd = {
                        onValueChangeFinished?.invoke()
                    }
                )
            }
    ) {
        Canvas(modifier = Modifier.matchParentSize()) {
            val widthPx = size.width
            val heightPx = size.height
            val centerY = heightPx / 2f
            val trackHeightPx = trackHeight.toPx()
            val thumbRadiusPx = thumbRadius.toPx()
            val cornerRadiusPx = trackHeightPx / 2f

            // Inactive track
            drawRoundRect(
                color = colors.inactiveTrackColor,
                topLeft = Offset(0f, centerY - trackHeightPx / 2f),
                size = Size(widthPx, trackHeightPx),
                cornerRadius = CornerRadius(cornerRadiusPx, cornerRadiusPx)
            )

            // Buffered progress
            if (bufferedFraction > 0f) {
                drawRoundRect(
                    color = colors.bufferedTrackColor,
                    topLeft = Offset(0f, centerY - trackHeightPx / 2f),
                    size = Size(widthPx * bufferedFraction, trackHeightPx),
                    cornerRadius = CornerRadius(cornerRadiusPx, cornerRadiusPx)
                )
            }

            // Chapter markers
            if (chapters.isNotEmpty() && durationMs > 0L) {
                chapters.forEach { chapter ->
                    val chapterFrac = (chapter.positionMs.toFloat() / durationMs.toFloat()).coerceIn(0f, 1f)
                    val chapterX = widthPx * chapterFrac
                    drawCircle(
                        color = colors.chapterMarkerColor,
                        radius = trackHeightPx * 0.8f,
                        center = Offset(chapterX, centerY)
                    )
                }
            }

            // Active track
            val activeWidth = widthPx * currentFraction
            drawRoundRect(
                color = colors.activeTrackColor,
                topLeft = Offset(0f, centerY - trackHeightPx / 2f),
                size = Size(activeWidth, trackHeightPx),
                cornerRadius = CornerRadius(cornerRadiusPx, cornerRadiusPx)
            )

            // Thumb
            val thumbX = activeWidth.coerceIn(thumbRadiusPx, (widthPx - thumbRadiusPx).coerceAtLeast(thumbRadiusPx))
            drawCircle(
                color = colors.thumbColor,
                radius = thumbRadiusPx,
                center = Offset(thumbX, centerY)
            )
        }
    }
}

/**
 * Overloaded variant of AccessibleMediaSlider working directly with millisecond timestamps.
 */
@Composable
fun AccessibleMediaSlider(
    currentPositionMs: Long,
    durationMs: Long,
    onSeekMs: (Long) -> Unit,
    modifier: Modifier = Modifier,
    bufferedPositionMs: Long = 0L,
    chapters: List<MediaChapterMarker> = emptyList(),
    colors: AccessibleMediaSliderColors = AccessibleMediaSliderColors(
        activeTrackColor = MaterialTheme.colorScheme.primary,
        inactiveTrackColor = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.12f),
        bufferedTrackColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.3f),
        thumbColor = MaterialTheme.colorScheme.primary
    ),
    stepIncrementMs: Long? = null,
    contentDescription: String = "Media seek bar",
    enabled: Boolean = true,
    trackHeight: Dp = 4.dp,
    thumbRadius: Dp = 8.dp
) {
    val duration = maxOf(durationMs, 1L)
    AccessibleMediaSlider(
        value = currentPositionMs.toFloat().coerceIn(0f, duration.toFloat()),
        onValueChange = { onSeekMs(it.toLong()) },
        modifier = modifier,
        valueRange = 0f..duration.toFloat(),
        bufferedValue = bufferedPositionMs.toFloat().coerceIn(0f, duration.toFloat()),
        chapters = chapters,
        durationMs = duration,
        colors = colors,
        stepIncrement = stepIncrementMs?.toFloat() ?: (duration * 0.05f),
        contentDescription = contentDescription,
        valueTextFormatter = { valMs -> formatMsTime(valMs.toLong(), duration) },
        enabled = enabled,
        trackHeight = trackHeight,
        thumbRadius = thumbRadius
    )
}

internal fun formatMsTime(positionMs: Long, durationMs: Long): String {
    val posSec = (positionMs / 1000).coerceAtLeast(0)
    val durSec = (durationMs / 1000).coerceAtLeast(0)

    val pMin = posSec / 60
    val pSec = posSec % 60
    val dMin = durSec / 60
    val dSec = durSec % 60

    return String.format(Locale.US, "%d:%02d / %d:%02d", pMin, pSec, dMin, dSec)
}
