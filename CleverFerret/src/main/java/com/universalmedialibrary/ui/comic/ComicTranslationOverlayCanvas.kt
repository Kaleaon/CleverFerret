package com.universalmedialibrary.ui.comic

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Rect
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.graphics.drawscope.rotate
import androidx.compose.ui.text.TextMeasurer
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.drawText
import androidx.compose.ui.text.rememberTextMeasurer
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.data.local.entity.ComicPageResponse
import com.universalmedialibrary.data.local.entity.Panel
import com.universalmedialibrary.data.local.entity.TextElement

/**
 * Canvas overlay for drawing translated text on comic pages
 * 
 * This composable draws the translation overlay on top of the comic page image,
 * rendering text elements with appropriate backgrounds and positioning.
 */
@Composable
fun ComicTranslationOverlay(
    translationData: ComicPageResponse,
    imageWidth: Float,
    imageHeight: Float,
    showPanelOutlines: Boolean = false,
    modifier: Modifier = Modifier
) {
    val textMeasurer = rememberTextMeasurer()
    val textColor = MaterialTheme.colorScheme.onSurface
    val backgroundColor = MaterialTheme.colorScheme.surface.copy(alpha = 0.95f)
    val outlineColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.3f)

    Canvas(modifier = modifier.fillMaxSize()) {
        translationData.panels.forEach { panel ->
            // Draw panel outline (optional, for debugging)
            if (showPanelOutlines) {
                drawPanelOutline(panel, imageWidth, imageHeight, outlineColor)
            }

            // Draw each text element
            panel.textElements.forEach { textElement ->
                drawTextElement(
                    textElement = textElement,
                    imageWidth = imageWidth,
                    imageHeight = imageHeight,
                    textMeasurer = textMeasurer,
                    textColor = textColor,
                    backgroundColor = backgroundColor
                )
            }
        }
    }
}

/**
 * Draw a panel outline (for debugging/visualization)
 */
private fun DrawScope.drawPanelOutline(
    panel: Panel,
    imageWidth: Float,
    imageHeight: Float,
    outlineColor: Color
) {
    if (panel.panelCorners.size < 4) return

    val path = Path().apply {
        val first = panel.panelCorners.first()
        moveTo(
            first[0].toFloat() * size.width / imageWidth,
            first[1].toFloat() * size.height / imageHeight
        )

        panel.panelCorners.drop(1).forEach { corner ->
            lineTo(
                corner[0].toFloat() * size.width / imageWidth,
                corner[1].toFloat() * size.height / imageHeight
            )
        }
        close()
    }

    drawPath(
        path = path,
        color = outlineColor,
        style = Stroke(width = 2f)
    )
}

/**
 * Draw a translated text element with background
 */
private fun DrawScope.drawTextElement(
    textElement: TextElement,
    imageWidth: Float,
    imageHeight: Float,
    textMeasurer: TextMeasurer,
    textColor: Color,
    backgroundColor: Color
) {
    if (textElement.elementCorners.size < 4) return

    // Calculate bounds
    val corners = textElement.elementCorners
    val minX = corners.minOf { it[0] }
    val minY = corners.minOf { it[1] }
    val maxX = corners.maxOf { it[0] }
    val maxY = corners.maxOf { it[1] }

    // Scale to canvas size
    val scaledX = minX.toFloat() * size.width / imageWidth
    val scaledY = minY.toFloat() * size.height / imageHeight
    val scaledWidth = (maxX - minX).toFloat() * size.width / imageWidth
    val scaledHeight = (maxY - minY).toFloat() * size.height / imageHeight

    // Measure text
    val textStyle = TextStyle(
        fontSize = calculateFontSize(scaledHeight),
        color = textColor
    )
    
    val textLayoutResult = textMeasurer.measure(
        text = textElement.translatedText,
        style = textStyle
    )

    // Draw background based on shape type
when (textElement.shapeType.lowercase(java.util.Locale.ROOT)) {
        "spherical", "bubble" -> {
            drawOval(
                color = backgroundColor,
                topLeft = Offset(scaledX, scaledY),
                size = Size(scaledWidth, scaledHeight)
            )
        }
        "square", "textbox" -> {
            drawRect(
                color = backgroundColor,
                topLeft = Offset(scaledX, scaledY),
                size = Size(scaledWidth, scaledHeight)
            )
        }
        else -> {
            // Default rectangle with slight padding
            drawRect(
                color = backgroundColor,
                topLeft = Offset(scaledX - 4f, scaledY - 4f),
                size = Size(scaledWidth + 8f, scaledHeight + 8f)
            )
        }
    }

    // Draw text with rotation if needed
    val centerX = scaledX + scaledWidth / 2
    val centerY = scaledY + scaledHeight / 2
    
    if (textElement.rotationAngle != 0f) {
        rotate(
            degrees = textElement.rotationAngle,
            pivot = Offset(centerX, centerY)
        ) {
            drawText(
                textLayoutResult = textLayoutResult,
                topLeft = Offset(
                    centerX - textLayoutResult.size.width / 2,
                    centerY - textLayoutResult.size.height / 2
                )
            )
        }
    } else {
        drawText(
            textLayoutResult = textLayoutResult,
            topLeft = Offset(
                centerX - textLayoutResult.size.width / 2,
                centerY - textLayoutResult.size.height / 2
            )
        )
    }
}

/**
 * Calculate appropriate font size based on bubble height
 */
private fun calculateFontSize(bubbleHeight: Float): androidx.compose.ui.unit.TextUnit {
    val baseFontSize = (bubbleHeight * 0.4f).coerceIn(12f, 24f)
    return baseFontSize.sp
}

/**
 * Helper function to check if a point is inside the text element bounds
 * (useful for tap detection if needed)
 */
fun isPointInTextElement(
    textElement: TextElement,
    x: Float,
    y: Float,
    imageWidth: Float,
    imageHeight: Float,
    canvasWidth: Float,
    canvasHeight: Float
): Boolean {
    if (textElement.elementCorners.size < 4) return false

    val corners = textElement.elementCorners
    val minX = corners.minOf { it[0] }.toFloat() * canvasWidth / imageWidth
    val minY = corners.minOf { it[1] }.toFloat() * canvasHeight / imageHeight
    val maxX = corners.maxOf { it[0] }.toFloat() * canvasWidth / imageWidth
    val maxY = corners.maxOf { it[1] }.toFloat() * canvasHeight / imageHeight

    return x in minX..maxX && y in minY..maxY
}
