package com.universalmedialibrary.ui.reader

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.gestures.detectDragGestures
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.drawscope.Fill
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import kotlin.math.roundToInt

/**
 * Reading Ruler Feature
 * - Customizable line highlighting
 * - Focus mode (dim surrounding text)
 * - Adjustable height and opacity
 * - Multiple ruler styles
 * - Gesture controls to move ruler
 */

enum class RulerStyle {
    LINE,           // Simple line highlight
    BOX,            // Box around text
    SPOTLIGHT,      // Spotlight effect
    GRADIENT,       // Gradient fade
    UNDERLINE       // Underline only
}

data class ReadingRulerSettings(
    val enabled: Boolean = false,
    val style: RulerStyle = RulerStyle.LINE,
    val height: Int = 100,              // in dp
    val color: Color = Color(0xFF4CAF50),
    val opacity: Float = 0.3f,          // 0.0 to 1.0
    val dimSurroundings: Boolean = true,
    val dimOpacity: Float = 0.5f,       // 0.0 to 1.0
    val followTap: Boolean = true,      // Move to tapped line
    val autoCenter: Boolean = false,    // Keep ruler centered as you scroll
    val borderWidth: Float = 2f,        // for box style
    val gradientSpread: Float = 50f     // for gradient style
)

class ReadingRulerController {
    private var _position = mutableStateOf(0f) // Y position in pixels
    val position: State<Float> = _position

    private var _isDragging = mutableStateOf(false)
    val isDragging: State<Boolean> = _isDragging

    fun setPosition(y: Float) {
        _position.value = y
    }

    fun moveBy(delta: Float) {
        _position.value += delta
    }

    fun setDragging(dragging: Boolean) {
        _isDragging.value = dragging
    }
}

/**
 * Reading ruler overlay that renders on top of the reading content
 */
@Composable
fun ReadingRulerOverlay(
    settings: ReadingRulerSettings,
    controller: ReadingRulerController,
    contentHeight: Float,
    modifier: Modifier = Modifier
) {
    if (!settings.enabled) return

    val position by controller.position
    val isDragging by controller.isDragging

    Canvas(
        modifier = modifier
            .fillMaxSize()
            .pointerInput(Unit) {
                detectDragGestures(
                    onDragStart = { offset ->
                        controller.setDragging(true)
                        controller.setPosition(offset.y)
                    },
                    onDrag = { _, dragAmount ->
                        controller.moveBy(dragAmount.y)
                    },
                    onDragEnd = {
                        controller.setDragging(false)
                    }
                )
            }
    ) {
        val canvasHeight = size.height
        val canvasWidth = size.width
        val rulerHeight = settings.height.dp.toPx()
        val rulerTop = position.coerceIn(0f, canvasHeight - rulerHeight)

        // Draw dimmed surroundings if enabled
        if (settings.dimSurroundings) {
            val dimColor = Color.Black.copy(alpha = settings.dimOpacity)
            
            // Top dim area
            if (rulerTop > 0) {
                drawRect(
                    color = dimColor,
                    topLeft = Offset(0f, 0f),
                    size = Size(canvasWidth, rulerTop)
                )
            }

            // Bottom dim area
            val bottomStart = rulerTop + rulerHeight
            if (bottomStart < canvasHeight) {
                drawRect(
                    color = dimColor,
                    topLeft = Offset(0f, bottomStart),
                    size = Size(canvasWidth, canvasHeight - bottomStart)
                )
            }
        }

        // Draw ruler based on style
        when (settings.style) {
            RulerStyle.LINE -> {
                drawRect(
                    color = settings.color.copy(alpha = settings.opacity),
                    topLeft = Offset(0f, rulerTop),
                    size = Size(canvasWidth, rulerHeight)
                )
            }
            RulerStyle.BOX -> {
                // Fill
                drawRect(
                    color = settings.color.copy(alpha = settings.opacity * 0.3f),
                    topLeft = Offset(0f, rulerTop),
                    size = Size(canvasWidth, rulerHeight)
                )
                // Border
                drawRect(
                    color = settings.color.copy(alpha = settings.opacity),
                    topLeft = Offset(0f, rulerTop),
                    size = Size(canvasWidth, rulerHeight),
                    style = Stroke(width = settings.borderWidth)
                )
            }
            RulerStyle.SPOTLIGHT -> {
                // Create spotlight effect with rounded corners
                val cornerRadius = 12f
                drawRoundRect(
                    color = settings.color.copy(alpha = settings.opacity),
                    topLeft = Offset(8f, rulerTop),
                    size = Size(canvasWidth - 16f, rulerHeight),
                    cornerRadius = androidx.compose.ui.geometry.CornerRadius(cornerRadius, cornerRadius)
                )
            }
            RulerStyle.GRADIENT -> {
                // Top gradient
                drawRect(
                    brush = androidx.compose.ui.graphics.Brush.verticalGradient(
                        colors = listOf(
                            Color.Transparent,
                            settings.color.copy(alpha = settings.opacity)
                        ),
                        startY = rulerTop - settings.gradientSpread,
                        endY = rulerTop
                    ),
                    topLeft = Offset(0f, (rulerTop - settings.gradientSpread).coerceAtLeast(0f)),
                    size = Size(canvasWidth, settings.gradientSpread)
                )

                // Center
                drawRect(
                    color = settings.color.copy(alpha = settings.opacity),
                    topLeft = Offset(0f, rulerTop),
                    size = Size(canvasWidth, rulerHeight)
                )

                // Bottom gradient
                drawRect(
                    brush = androidx.compose.ui.graphics.Brush.verticalGradient(
                        colors = listOf(
                            settings.color.copy(alpha = settings.opacity),
                            Color.Transparent
                        ),
                        startY = rulerTop + rulerHeight,
                        endY = rulerTop + rulerHeight + settings.gradientSpread
                    ),
                    topLeft = Offset(0f, rulerTop + rulerHeight),
                    size = Size(canvasWidth, settings.gradientSpread.coerceAtMost(canvasHeight - rulerTop - rulerHeight))
                )
            }
            RulerStyle.UNDERLINE -> {
                drawLine(
                    color = settings.color.copy(alpha = settings.opacity),
                    start = Offset(0f, rulerTop + rulerHeight),
                    end = Offset(canvasWidth, rulerTop + rulerHeight),
                    strokeWidth = settings.borderWidth * 2
                )
            }
        }

        // Draw drag indicator when dragging
        if (isDragging) {
            val indicatorSize = 40f
            val indicatorX = canvasWidth / 2 - indicatorSize / 2
            
            // Draw small drag indicator
            drawCircle(
                color = settings.color,
                radius = indicatorSize / 2,
                center = Offset(canvasWidth / 2, rulerTop + rulerHeight / 2),
                alpha = 0.8f
            )
            
            // Draw drag lines
            drawLine(
                color = Color.White,
                start = Offset(canvasWidth / 2 - 12f, rulerTop + rulerHeight / 2 - 4f),
                end = Offset(canvasWidth / 2 + 12f, rulerTop + rulerHeight / 2 - 4f),
                strokeWidth = 2f
            )
            drawLine(
                color = Color.White,
                start = Offset(canvasWidth / 2 - 12f, rulerTop + rulerHeight / 2 + 4f),
                end = Offset(canvasWidth / 2 + 12f, rulerTop + rulerHeight / 2 + 4f),
                strokeWidth = 2f
            )
        }
    }
}

/**
 * Settings panel for reading ruler
 */
@Composable
fun ReadingRulerSettingsPanel(
    settings: ReadingRulerSettings,
    onSettingsChange: (ReadingRulerSettings) -> Unit,
    modifier: Modifier = Modifier
) {
    var currentSettings by remember(settings) { mutableStateOf(settings) }

    Card(
        modifier = modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        ),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Header with toggle
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Icon(
                        imageVector = Icons.Default.LinearScale,
                        contentDescription = null,
                        tint = MaterialTheme.colorScheme.primary
                    )
                    Text(
                        text = "Reading Ruler",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                }
                Switch(
                    checked = currentSettings.enabled,
                    onCheckedChange = {
                        currentSettings = currentSettings.copy(enabled = it)
                        onSettingsChange(currentSettings)
                    }
                )
            }

            if (currentSettings.enabled) {
                // Style selector
                Text(
                    text = "Style",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.SemiBold
                )
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                // First row: Line, Box, Spotlight
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    listOf(RulerStyle.LINE, RulerStyle.BOX, RulerStyle.SPOTLIGHT).forEach { style ->
                        FilterChip(
                            selected = currentSettings.style == style,
                            onClick = {
                                currentSettings = currentSettings.copy(style = style)
                                onSettingsChange(currentSettings)
                            },
                            label = {
                                Text(
                                    when (style) {
                                        RulerStyle.LINE -> "Line"
                                        RulerStyle.BOX -> "Box"
                                        RulerStyle.SPOTLIGHT -> "Spot"
                                        RulerStyle.GRADIENT -> "Fade"
                                        RulerStyle.UNDERLINE -> "Under"
                                    },
                                    style = MaterialTheme.typography.bodySmall
                                )
                            },
                            modifier = Modifier.weight(1f)
                        )
                    }
                }
                
                // Second row: Gradient, Underline
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    listOf(RulerStyle.GRADIENT, RulerStyle.UNDERLINE).forEach { style ->
                        FilterChip(
                            selected = currentSettings.style == style,
                            onClick = {
                                currentSettings = currentSettings.copy(style = style)
                                onSettingsChange(currentSettings)
                            },
                            label = {
                                Text(
                                    when (style) {
                                        RulerStyle.LINE -> "Line"
                                        RulerStyle.BOX -> "Box"
                                        RulerStyle.SPOTLIGHT -> "Spot"
                                        RulerStyle.GRADIENT -> "Fade"
                                        RulerStyle.UNDERLINE -> "Under"
                                    },
                                    style = MaterialTheme.typography.bodySmall
                                )
                            },
                            modifier = Modifier.weight(1f)
                        )
                    }
                    // Spacer to maintain alignment
                    Spacer(modifier = Modifier.weight(1f))
                }
            }

                // Height control
                Text(
                    text = "Height: ${currentSettings.height}dp",
                    style = MaterialTheme.typography.bodyMedium
                )
                Slider(
                    value = currentSettings.height.toFloat(),
                    onValueChange = {
                        currentSettings = currentSettings.copy(height = it.roundToInt())
                        onSettingsChange(currentSettings)
                    },
                    valueRange = 40f..200f,
                    steps = 31
                )

                // Opacity control
                Text(
                    text = "Opacity: ${(currentSettings.opacity * 100).roundToInt()}%",
                    style = MaterialTheme.typography.bodyMedium
                )
                Slider(
                    value = currentSettings.opacity,
                    onValueChange = {
                        currentSettings = currentSettings.copy(opacity = it)
                        onSettingsChange(currentSettings)
                    },
                    valueRange = 0.1f..1.0f,
                    steps = 8
                )

                // Color presets
                Text(
                    text = "Color",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.SemiBold
                )
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    val colors = listOf(
                        Color(0xFF4CAF50) to "Green",
                        Color(0xFF2196F3) to "Blue",
                        Color(0xFFFFC107) to "Yellow",
                        Color(0xFFFF5722) to "Orange"
                    )
                    colors.forEach { (color, name) ->
                        FilterChip(
                            selected = currentSettings.color == color,
                            onClick = {
                                currentSettings = currentSettings.copy(color = color)
                                onSettingsChange(currentSettings)
                            },
                            label = { Text(name, style = MaterialTheme.typography.bodySmall) },
                            modifier = Modifier.weight(1f)
                        )
                    }
                }

                HorizontalDivider()

                // Dim surroundings
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Dim Surroundings", style = MaterialTheme.typography.bodyMedium)
                    Switch(
                        checked = currentSettings.dimSurroundings,
                        onCheckedChange = {
                            currentSettings = currentSettings.copy(dimSurroundings = it)
                            onSettingsChange(currentSettings)
                        }
                    )
                }

                if (currentSettings.dimSurroundings) {
                    Text(
                        text = "Dim Amount: ${(currentSettings.dimOpacity * 100).roundToInt()}%",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Slider(
                        value = currentSettings.dimOpacity,
                        onValueChange = {
                            currentSettings = currentSettings.copy(dimOpacity = it)
                            onSettingsChange(currentSettings)
                        },
                        valueRange = 0.1f..0.9f,
                        steps = 7
                    )
                }

                // Follow tap
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Follow Tap", style = MaterialTheme.typography.bodyMedium)
                    Switch(
                        checked = currentSettings.followTap,
                        onCheckedChange = {
                            currentSettings = currentSettings.copy(followTap = it)
                            onSettingsChange(currentSettings)
                        }
                    )
                }

                // Auto center
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Auto Center", style = MaterialTheme.typography.bodyMedium)
                    Switch(
                        checked = currentSettings.autoCenter,
                        onCheckedChange = {
                            currentSettings = currentSettings.copy(autoCenter = it)
                            onSettingsChange(currentSettings)
                        }
                    )
                }
            }
        }
    }
}