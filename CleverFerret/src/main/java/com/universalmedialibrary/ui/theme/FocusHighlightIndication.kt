package com.universalmedialibrary.ui.theme

import androidx.compose.foundation.IndicationNodeFactory
import androidx.compose.foundation.interaction.FocusInteraction
import androidx.compose.foundation.interaction.InteractionSource
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ripple
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.ui.geometry.CornerRadius
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.drawscope.ContentDrawScope
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.node.DelegatableNode
import androidx.compose.ui.node.DelegatingNode
import androidx.compose.ui.node.DrawModifierNode
import androidx.compose.ui.node.invalidateDraw
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.launch

/**
 * FocusHighlightIndication provides automated, system-wide focus indication across composables.
 * When an element receives keyboard focus (isFocused = true), it draws a high-contrast focus ring.
 *
 * @param focusColor The color of the focus ring outline.
 * @param strokeWidth The width of the focus ring line.
 * @param drawRipple Whether press ripple animation is enabled.
 */
class FocusHighlightIndication(
    private val focusColor: Color,
    private val strokeWidth: Dp = 2.5.dp,
    private val drawRipple: Boolean = true
) : IndicationNodeFactory {

    override fun create(interactionSource: InteractionSource): DelegatableNode {
        return FocusHighlightIndicationNode(interactionSource, focusColor, strokeWidth, drawRipple)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is FocusHighlightIndication) return false
        return focusColor == other.focusColor &&
                strokeWidth == other.strokeWidth &&
                drawRipple == other.drawRipple
    }

    override fun hashCode(): Int {
        var result = focusColor.hashCode()
        result = 31 * result + strokeWidth.hashCode()
        result = 31 * result + drawRipple.hashCode()
        return result
    }
}

private class FocusHighlightIndicationNode(
    private val interactionSource: InteractionSource,
    private val focusColor: Color,
    private val strokeWidth: Dp,
    private val drawRipple: Boolean
) : DelegatingNode(), DrawModifierNode {

    private var isFocused = false

    init {
        if (drawRipple) {
            val rippleFactory = ripple()
            val rippleNode = rippleFactory.create(interactionSource)
            delegate(rippleNode)
        }
    }

    override fun onAttach() {
        coroutineScope.launch {
            interactionSource.interactions.collect { interaction ->
                when (interaction) {
                    is FocusInteraction.Focus -> {
                        isFocused = true
                        invalidateDraw()
                    }
                    is FocusInteraction.Unfocus -> {
                        isFocused = false
                        invalidateDraw()
                    }
                }
            }
        }
    }

    override fun ContentDrawScope.draw() {
        drawContent()

        if (isFocused) {
            val strokeWidthPx = strokeWidth.toPx()
            val halfStroke = strokeWidthPx / 2f
            val w = size.width
            val h = size.height

            if (w > 0f && h > 0f) {
                // Respect component clipping shape by rounding corners proportionally or up to standard card radius
                val radiusPx = minOf(w / 8f, h / 8f, 12.dp.toPx())

                drawRoundRect(
                    color = focusColor,
                    topLeft = Offset(halfStroke, halfStroke),
                    size = Size(w - strokeWidthPx, h - strokeWidthPx),
                    cornerRadius = CornerRadius(radiusPx, radiusPx),
                    style = Stroke(width = strokeWidthPx)
                )
            }
        }
    }
}

/**
 * Remember a FocusHighlightIndication instance using the current MaterialTheme primary color.
 */
@Composable
fun rememberFocusHighlightIndication(
    focusColor: Color = MaterialTheme.colorScheme.primary,
    strokeWidth: Dp = 2.5.dp,
    drawRipple: Boolean = true
): FocusHighlightIndication {
    return remember(focusColor, strokeWidth, drawRipple) {
        FocusHighlightIndication(
            focusColor = focusColor,
            strokeWidth = strokeWidth,
            drawRipple = drawRipple
        )
    }
}
