package com.universalmedialibrary.ui.media

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Rect
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.geometry.CornerRadius
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.media.navigation.MediaNavDestinations
import com.universalmedialibrary.ui.media.navigation.isDestinationSelected
import com.universalmedialibrary.ui.modern.theme.CFLcarsFrame
import com.universalmedialibrary.ui.modern.theme.LocalCFLayoutStandard
import java.util.Locale

private const val QUARTER_TURN = 90f
private const val HALF_TURN = 180f
private val ReadoutPadding = 8.dp

@Composable
internal fun CFSweepScaffold(
    navigation: CFMediaNavigationState,
    onNavigate: (String) -> Unit,
    player: @Composable () -> Unit,
    feedback: @Composable () -> Unit,
    content: @Composable () -> Unit
) {
    val frame = checkNotNull(LocalCFLayoutStandard.current?.frame)
    val primary = MaterialTheme.colorScheme.primary
    val secondary = MaterialTheme.colorScheme.secondary
    val title = MediaNavDestinations.allDestinations.firstOrNull {
        isDestinationSelected(navigation.route, it.route)
    }?.label ?: "CleverFerret"
    Box(Modifier.fillMaxSize()) {
        Canvas(Modifier.fillMaxSize()) { drawSweepFrame(frame, primary, secondary) }
        Text(title.uppercase(Locale.ROOT), color = primary, style = MaterialTheme.typography.titleLarge,
            modifier = Modifier.padding(start = frame.rail.dp + ReadoutPadding, end = ReadoutPadding)
                .height(frame.arm.dp).align(Alignment.TopEnd), maxLines = 1)
        Box(Modifier.padding(top = frame.railTop.dp)) { CFLayoutNavigation(navigation, onNavigate, vertical = true) }
        Column(Modifier.fillMaxSize().padding(start = frame.rail.dp, top = frame.shellTop.dp,
            bottom = frame.footer.dp).clip(RoundedCornerShape(topStart = frame.inner.dp))) {
            Box(Modifier.weight(1f).fillMaxWidth()) { content() }
            feedback()
            player()
        }
    }
}

/** Draws exact contract geometry; the two cutouts use the same centers as their outer arcs. */
private fun DrawScope.drawSweepFrame(frame: CFLcarsFrame, color: Color, secondary: Color) {
    val rail = frame.rail.dp.toPx()
    val inner = frame.inner.dp.toPx()
    val outerX = frame.outerX.dp.toPx()
    val outerY = frame.outerY.dp.toPx()
    val headerTop = frame.headerTop.dp.toPx()
    val headerBottom = frame.headerBottom.dp.toPx()
    val contentTop = frame.contentTop.dp.toPx()
    val shellTop = frame.shellTop.dp.toPx()
    val bar = frame.bar.dp.toPx()
    drawRect(secondary, size = Size(rail, frame.arm.dp.toPx()))
    drawPath(
        sweepPath(headerTop, headerBottom, androidx.compose.ui.geometry.Size(outerX, outerY), bottomCorner = true), color
    )
    drawPath(
        sweepPath(headerTop, headerBottom - bar, androidx.compose.ui.geometry.Size(inner, inner),
            bottomCorner = true, left = rail), Color.Black
    )
    drawPath(
        sweepPath(contentTop, contentTop + frame.elbow.dp.toPx(), androidx.compose.ui.geometry.Size(outerX, outerY),
            bottomCorner = false), secondary
    )
    drawPath(
        sweepPath(shellTop, size.height, androidx.compose.ui.geometry.Size(inner, inner), bottomCorner = false, left = rail), Color.Black
    )
    drawBarTail(headerBottom - bar, bar, frame.gap.dp.toPx(), color)
    drawBarTail(contentTop, bar, frame.gap.dp.toPx(), secondary)
}

private fun DrawScope.sweepPath(
    top: Float, bottom: Float, radii: androidx.compose.ui.geometry.Size, bottomCorner: Boolean, left: Float = 0f
): Path = Path().apply {
    val radiusX = radii.width
    val radiusY = radii.height
    if (bottomCorner) {
        moveTo(left, top)
        lineTo(size.width, top)
        lineTo(size.width, bottom)
        lineTo(left + radiusX, bottom)
        arcTo(Rect(left, bottom - radiusY * 2, left + radiusX * 2, bottom), QUARTER_TURN, QUARTER_TURN, false)
    } else {
        moveTo(left, bottom)
        lineTo(left, top + radiusY)
        arcTo(Rect(left, top, left + radiusX * 2, top + radiusY * 2), HALF_TURN, QUARTER_TURN, false)
        lineTo(size.width, top)
        lineTo(size.width, bottom)
    }
    close()
}

private const val TAIL_FRACTION = 0.3f
private const val TAIL_SEGMENTS = 3

private fun DrawScope.drawBarTail(top: Float, height: Float, gap: Float, color: Color) {
    val left = size.width * (1f - TAIL_FRACTION)
    val width = (size.width - left - gap * (TAIL_SEGMENTS + 1)) / TAIL_SEGMENTS
    drawRect(Color.Black, topLeft = Offset(left, top), size = Size(size.width - left, height))
    repeat(TAIL_SEGMENTS) { index ->
        val x = left + gap + (width + gap) * index
        if (index == TAIL_SEGMENTS - 1) {
            drawRoundRect(color, Offset(x, top), Size(width, height), CornerRadius(height / 2))
            drawRect(color, Offset(x, top), Size(width / 2, height))
        } else drawRect(color, Offset(x, top), Size(width, height))
    }
}
