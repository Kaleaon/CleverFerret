package com.cleverferret.core.designsystem.slider

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.gestures.detectDragGestures
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.progressSemantics
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
import kotlin.math.roundToInt

/**
 * Unified accessible waveform seek bar composable that encapsulates visual amplitude rendering
 * and WCAG 2.1 range accessibility semantics.
 */
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
    val clampedProgress = progress.coerceIn(0f, 1f)
    val formattedState = valueTextFormatter?.invoke(clampedProgress)
        ?: "${(clampedProgress * 100).roundToInt()}%"

    Box(
        modifier = modifier
            .progressSemantics(
                value = clampedProgress,
                valueRange = 0f..1f
            )
            .semantics(mergeDescendants = true) {
                this.contentDescription = contentDescription
                this.stateDescription = formattedState
                setProgress { targetValue ->
                    val coerced = targetValue.coerceIn(0f, 1f)
                    onSeek(coerced)
                    true
                }
                customActions = listOf(
                    CustomAccessibilityAction("Step forward") {
                        onSeek((clampedProgress + stepIncrement).coerceAtMost(1f))
                        true
                    },
                    CustomAccessibilityAction("Step backward") {
                        onSeek((clampedProgress - stepIncrement).coerceAtLeast(0f))
                        true
                    }
                )
            }
            .pointerInput(enabled, points) {
                if (!enabled) return@pointerInput
                detectTapGestures { offset ->
                    val fraction = (offset.x / size.width).coerceIn(0f, 1f)
                    onSeek(fraction)
                }
            }
            .pointerInput(enabled, points) {
                if (!enabled) return@pointerInput
                detectDragGestures { change, _ ->
                    change.consume()
                    val fraction = (change.position.x / size.width).coerceIn(0f, 1f)
                    onSeek(fraction)
                }
            }
    ) {
        Canvas(modifier = Modifier.matchParentSize()) {
            if (points.isEmpty()) return@Canvas
            val barSpacing = size.width / (points.size * 1.2f)
            val barWidth = barSpacing * 0.6f
            val centerY = size.height / 2f
            val progressX = size.width * clampedProgress

            points.forEachIndexed { index, amplitude ->
                val x = index * barSpacing + barSpacing / 2
                val height = (amplitude * size.height / 2).coerceAtLeast(2f)
                val color = if (x <= progressX) accent else backgroundColor
                drawRoundRect(
                    color = color,
                    topLeft = Offset(x - barWidth / 2, centerY - height),
                    size = Size(barWidth, height * 2),
                    cornerRadius = CornerRadius(barWidth / 2, barWidth / 2)
                )
            }
        }
    }
}
