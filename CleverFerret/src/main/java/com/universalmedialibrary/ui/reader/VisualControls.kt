package com.universalmedialibrary.ui.reader

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import kotlin.math.roundToInt

/**
 * Deep Visual Controls for Reader
 * Provides advanced visual customization including:
 * - Brightness control
 * - Contrast adjustment
 * - Color temperature
 * - Page tint
 * - Text scaling
 * - Custom fonts
 */

data class VisualSettings(
    val brightness: Float = 1.0f,           // 0.1 to 2.0
    val contrast: Float = 1.0f,             // 0.5 to 2.0
    val colorTemperature: Float = 6500f,    // 2700K (warm) to 9000K (cool)
    val pageTint: Color = Color.White,
    val textColor: Color = Color.Black,
    val textScale: Float = 1.0f,            // 0.5 to 2.0
    val fontFamily: String = "DEFAULT",     // DEFAULT, SERIF, SANS_SERIF, MONOSPACE, CUSTOM
    val letterSpacing: Float = 0f,          // -0.1 to 0.3
    val wordSpacing: Float = 0f,            // 0 to 0.5
    val lineHeight: Float = 1.5f,           // 1.0 to 3.0
    val paragraphSpacing: Float = 1.0f      // 0.5 to 3.0
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun VisualControlsPanel(
    visualSettings: VisualSettings,
    onSettingsChanged: (VisualSettings) -> Unit,
    onDismiss: () -> Unit,
    modifier: Modifier = Modifier
) {
    var settings by remember(visualSettings) { mutableStateOf(visualSettings) }

    Surface(
        modifier = modifier.fillMaxSize(),
        color = MaterialTheme.colorScheme.surface
    ) {
        Column(
            modifier = Modifier.fillMaxSize()
        ) {
            // Top bar
            TopAppBar(
                title = { Text("Visual Controls") },
                navigationIcon = {
                    IconButton(onClick = { 
                        onSettingsChanged(settings)
                        onDismiss()
                    }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    TextButton(onClick = {
                        settings = VisualSettings()
                        onSettingsChanged(settings)
                    }) {
                        Text("Reset")
                    }
                }
            )

            // Scrollable content
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .verticalScroll(rememberScrollState())
                    .padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(24.dp)
            ) {
                // Brightness control
                BrightnessControl(
                    brightness = settings.brightness,
                    onBrightnessChange = { settings = settings.copy(brightness = it) }
                )

                // Contrast control
                ContrastControl(
                    contrast = settings.contrast,
                    onContrastChange = { settings = settings.copy(contrast = it) }
                )

                // Color temperature
                ColorTemperatureControl(
                    temperature = settings.colorTemperature,
                    onTemperatureChange = { settings = settings.copy(colorTemperature = it) }
                )

                // Page tint
                PageTintControl(
                    pageTint = settings.pageTint,
                    onTintChange = { settings = settings.copy(pageTint = it) }
                )

                // Text color
                TextColorControl(
                    textColor = settings.textColor,
                    onColorChange = { settings = settings.copy(textColor = it) }
                )

                // Text scale
                TextScaleControl(
                    textScale = settings.textScale,
                    onScaleChange = { settings = settings.copy(textScale = it) }
                )

                // Font family
                FontFamilyControl(
                    fontFamily = settings.fontFamily,
                    onFontChange = { settings = settings.copy(fontFamily = it) }
                )

                // Letter spacing
                LetterSpacingControl(
                    letterSpacing = settings.letterSpacing,
                    onSpacingChange = { settings = settings.copy(letterSpacing = it) }
                )

                // Word spacing
                WordSpacingControl(
                    wordSpacing = settings.wordSpacing,
                    onSpacingChange = { settings = settings.copy(wordSpacing = it) }
                )

                // Line height
                LineHeightControl(
                    lineHeight = settings.lineHeight,
                    onHeightChange = { settings = settings.copy(lineHeight = it) }
                )

                // Paragraph spacing
                ParagraphSpacingControl(
                    paragraphSpacing = settings.paragraphSpacing,
                    onSpacingChange = { settings = settings.copy(paragraphSpacing = it) }
                )

                // Preview section
                PreviewSection(settings)

                Spacer(modifier = Modifier.height(32.dp))
            }
        }
    }
}

@Composable
private fun BrightnessControl(
    brightness: Float,
    onBrightnessChange: (Float) -> Unit
) {
    ControlSection(
        title = "Brightness",
        icon = Icons.Default.Brightness6,
        value = "${(brightness * 100).roundToInt()}%"
    ) {
        Slider(
            value = brightness,
            onValueChange = onBrightnessChange,
            valueRange = 0.1f..2.0f,
            steps = 18
        )
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text("10%", style = MaterialTheme.typography.bodySmall)
            Text("200%", style = MaterialTheme.typography.bodySmall)
        }
    }
}

@Composable
private fun ContrastControl(
    contrast: Float,
    onContrastChange: (Float) -> Unit
) {
    ControlSection(
        title = "Contrast",
        icon = Icons.Default.Contrast,
        value = "${(contrast * 100).roundToInt()}%"
    ) {
        Slider(
            value = contrast,
            onValueChange = onContrastChange,
            valueRange = 0.5f..2.0f,
            steps = 14
        )
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text("50%", style = MaterialTheme.typography.bodySmall)
            Text("200%", style = MaterialTheme.typography.bodySmall)
        }
    }
}

@Composable
private fun ColorTemperatureControl(
    temperature: Float,
    onTemperatureChange: (Float) -> Unit
) {
    val tempDescription = when {
        temperature < 4000f -> "Very Warm"
        temperature < 5000f -> "Warm"
        temperature < 6000f -> "Neutral"
        temperature < 7000f -> "Cool"
        else -> "Very Cool"
    }

    ControlSection(
        title = "Color Temperature",
        icon = Icons.Default.WbSunny,
        value = "${temperature.roundToInt()}K ($tempDescription)"
    ) {
        Slider(
            value = temperature,
            onValueChange = onTemperatureChange,
            valueRange = 2700f..9000f,
            steps = 62
        )
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text("Warm", style = MaterialTheme.typography.bodySmall, color = Color(0xFFFF8C00))
            Text("Cool", style = MaterialTheme.typography.bodySmall, color = Color(0xFF87CEEB))
        }
    }
}

@Composable
private fun PageTintControl(
    pageTint: Color,
    onTintChange: (Color) -> Unit
) {
    val tintPresets = mapOf(
        "White" to Color.White,
        "Cream" to Color(0xFFFFFDD0),
        "Sepia" to Color(0xFFF4ECD8),
        "Light Gray" to Color(0xFFF5F5F5),
        "Warm" to Color(0xFFFFF8E1),
        "Cool" to Color(0xFFE3F2FD)
    )

    ControlSection(
        title = "Page Tint",
        icon = Icons.Default.Palette,
        value = tintPresets.entries.find { it.value == pageTint }?.key ?: "Custom"
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            tintPresets.forEach { (name, color) ->
                FilterChip(
                    selected = pageTint == color,
                    onClick = { onTintChange(color) },
                    label = { Text(name, style = MaterialTheme.typography.bodySmall) },
                    modifier = Modifier.weight(1f)
                )
            }
        }
    }
}

@Composable
private fun TextColorControl(
    textColor: Color,
    onColorChange: (Color) -> Unit
) {
    val colorPresets = mapOf(
        "Black" to Color.Black,
        "Dark Gray" to Color(0xFF424242),
        "Warm Black" to Color(0xFF3E2723),
        "Cool Black" to Color(0xFF263238)
    )

    ControlSection(
        title = "Text Color",
        icon = Icons.Default.FormatColorText,
        value = colorPresets.entries.find { it.value == textColor }?.key ?: "Custom"
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            colorPresets.forEach { (name, color) ->
                FilterChip(
                    selected = textColor == color,
                    onClick = { onColorChange(color) },
                    label = { Text(name, style = MaterialTheme.typography.bodySmall) },
                    modifier = Modifier.weight(1f)
                )
            }
        }
    }
}

@Composable
private fun TextScaleControl(
    textScale: Float,
    onScaleChange: (Float) -> Unit
) {
    ControlSection(
        title = "Text Scale",
        icon = Icons.Default.FormatSize,
        value = "${(textScale * 100).roundToInt()}%"
    ) {
        Slider(
            value = textScale,
            onValueChange = onScaleChange,
            valueRange = 0.5f..2.0f,
            steps = 14
        )
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text("50%", style = MaterialTheme.typography.bodySmall)
            Text("200%", style = MaterialTheme.typography.bodySmall)
        }
    }
}

@Composable
private fun FontFamilyControl(
    fontFamily: String,
    onFontChange: (String) -> Unit
) {
    val fonts = listOf(
        "DEFAULT" to "System Default",
        "SERIF" to "Serif",
        "SANS_SERIF" to "Sans Serif",
        "MONOSPACE" to "Monospace",
        "CURSIVE" to "Cursive"
    )

    ControlSection(
        title = "Font Family",
        icon = Icons.Default.TextFields,
        value = fonts.find { it.first == fontFamily }?.second ?: "Default"
    ) {
        Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
            fonts.forEach { (value, name) ->
                FilterChip(
                    selected = fontFamily == value,
                    onClick = { onFontChange(value) },
                    label = { Text(name) },
                    modifier = Modifier.fillMaxWidth()
                )
            }
        }
    }
}

@Composable
private fun LetterSpacingControl(
    letterSpacing: Float,
    onSpacingChange: (Float) -> Unit
) {
    ControlSection(
        title = "Letter Spacing",
        icon = Icons.Default.SpaceBar,
        value = String.format("%.2f", letterSpacing)
    ) {
        Slider(
            value = letterSpacing,
            onValueChange = onSpacingChange,
            valueRange = -0.1f..0.3f,
            steps = 39
        )
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text("Tight", style = MaterialTheme.typography.bodySmall)
            Text("Loose", style = MaterialTheme.typography.bodySmall)
        }
    }
}

@Composable
private fun WordSpacingControl(
    wordSpacing: Float,
    onSpacingChange: (Float) -> Unit
) {
    ControlSection(
        title = "Word Spacing",
        icon = Icons.Default.Dehaze,
        value = String.format("%.2f", wordSpacing)
    ) {
        Slider(
            value = wordSpacing,
            onValueChange = onSpacingChange,
            valueRange = 0f..0.5f,
            steps = 49
        )
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text("Normal", style = MaterialTheme.typography.bodySmall)
            Text("Wide", style = MaterialTheme.typography.bodySmall)
        }
    }
}

@Composable
private fun LineHeightControl(
    lineHeight: Float,
    onHeightChange: (Float) -> Unit
) {
    ControlSection(
        title = "Line Height",
        icon = Icons.Default.FormatLineSpacing,
        value = String.format(java.util.Locale.US, "%.1f", lineHeight)
    ) {
        Slider(
            value = lineHeight,
            onValueChange = onHeightChange,
            valueRange = 1.0f..3.0f,
            steps = 19
        )
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text("Tight", style = MaterialTheme.typography.bodySmall)
            Text("Loose", style = MaterialTheme.typography.bodySmall)
        }
    }
}

@Composable
private fun ParagraphSpacingControl(
    paragraphSpacing: Float,
    onSpacingChange: (Float) -> Unit
) {
    ControlSection(
        title = "Paragraph Spacing",
        icon = Icons.Default.Subject,
        value = String.format(java.util.Locale.US, "%.1f", paragraphSpacing)
    ) {
        Slider(
            value = paragraphSpacing,
            onValueChange = onSpacingChange,
            valueRange = 0.5f..3.0f,
            steps = 24
        )
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text("Compact", style = MaterialTheme.typography.bodySmall)
            Text("Spacious", style = MaterialTheme.typography.bodySmall)
        }
    }
}

@Composable
private fun ControlSection(
    title: String,
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    value: String,
    content: @Composable () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
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
                        imageVector = icon,
                        contentDescription = null,
                        modifier = Modifier.size(20.dp),
                        tint = MaterialTheme.colorScheme.primary
                    )
                    Text(
                        text = title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold
                    )
                }
                Text(
                    text = value,
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.Bold
                )
            }
            content()
        }
    }
}

@Composable
private fun PreviewSection(settings: VisualSettings) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text(
                text = "Preview",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(200.dp)
                    .background(settings.pageTint)
                    .padding(16.dp)
            ) {
                Text(
                    text = "Sample text with your current visual settings. " +
                          "The quick brown fox jumps over the lazy dog. " +
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    color = settings.textColor,
                    fontSize = MaterialTheme.typography.bodyLarge.fontSize * settings.textScale,
                    lineHeight = MaterialTheme.typography.bodyLarge.lineHeight * settings.lineHeight,
                    letterSpacing = androidx.compose.ui.unit.TextUnit(
                        settings.letterSpacing,
                        androidx.compose.ui.unit.TextUnitType.Em
                    )
                )
            }
        }
    }
}