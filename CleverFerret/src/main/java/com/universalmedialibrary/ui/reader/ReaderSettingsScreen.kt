package com.universalmedialibrary.ui.reader

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.data.local.entity.ReaderSettings
import java.util.Locale

/**
 * Reader Settings Screen
 *
 * Allows users to customize reading experience:
 * - Theme (light/dark/sepia)
 * - Typography (font family, size, spacing)
 * - Layout (margins, alignment)
 * - Advanced settings (brightness, contrast)
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ReaderSettingsScreen(
    mediaId: Long? = null, // null for global settings, mediaId for book-specific
    onNavigateBack: () -> Unit,
    modifier: Modifier = Modifier,
    viewModel: ReaderSettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val readerSettings by viewModel.readerSettings.collectAsStateWithLifecycle()

    LaunchedEffect(mediaId) {
        viewModel.loadSettings(mediaId)
    }

    Column(
        modifier = modifier.fillMaxSize()
    ) {
        // Top App Bar
        TopAppBar(
            title = {
                Text(
                    text = if (mediaId != null) "Book Settings" else "Reader Settings"
                )
            },
            navigationIcon = {
                IconButton(onClick = onNavigateBack) {
                    Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                }
            }
        )

        // Settings Content
        Column(
            modifier = Modifier
                .fillMaxSize()
                .verticalScroll(rememberScrollState())
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(24.dp)
        ) {
            // Preview Section
            PreviewSection(readerSettings = readerSettings)

            // Theme Section
            ThemeSection(
                readerSettings = readerSettings,
                onThemeChanged = { theme -> viewModel.updateTheme(theme) },
                onBackgroundColorChanged = { color -> viewModel.updateTheme(color) },
                onTextColorChanged = { color -> viewModel.updateTheme(color) }
            )

            // Typography Section
            TypographySection(
                readerSettings = readerSettings,
                onFontFamilyChanged = { family -> viewModel.updateFontFamily(family) },
                onFontSizeChanged = { size -> viewModel.updateFontSize(size) },
                onLineSpacingChanged = { spacing -> viewModel.updateLineHeight(spacing) }
            )

            // Layout Section
            LayoutSection(
                readerSettings = readerSettings,
                onMarginChanged = { margins -> viewModel.updateMargins(margins) },
                onTextAlignmentChanged = { alignment -> viewModel.updateTextAlignment(alignment) }
            )

            // Advanced Section
            AdvancedSection(
                readerSettings = readerSettings,
                onBrightnessChanged = { brightness -> viewModel.updateBrightness(brightness) },
                onKeepScreenOnChanged = { keepOn -> viewModel.updateKeepScreenOn(keepOn) }
            )

            // Enhanced Reading Features Section
            EnhancedReadingFeaturesSection(
                readerSettings = readerSettings,
                viewModel = viewModel
            )

            // Reset to Defaults
            if (mediaId != null) {
                Button(
                    onClick = { viewModel.resetToGlobalDefaults() },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text("Reset to Global Defaults")
                }
            }
        }
    }
}

@Composable
private fun PreviewSection(readerSettings: ReaderSettings) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Preview",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(bottom = 12.dp)
            )

            // Preview box
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(120.dp)
                    .background(Color(android.graphics.Color.parseColor(readerSettings.backgroundColor)))
                    .padding(readerSettings.marginLeft.dp, readerSettings.marginTop.dp),
                contentAlignment = Alignment.TopStart
            ) {
                Text(
                    text = "Sample text with current settings. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    color = Color(android.graphics.Color.parseColor(readerSettings.textColor)),
                    fontSize = androidx.compose.ui.unit.TextUnit(readerSettings.fontSize.toFloat(), androidx.compose.ui.unit.TextUnitType.Sp),
                    lineHeight = androidx.compose.ui.unit.TextUnit((readerSettings.fontSize * readerSettings.lineHeight), androidx.compose.ui.unit.TextUnitType.Sp),
                    fontFamily = when (readerSettings.fontFamily) {
                        "SERIF" -> androidx.compose.ui.text.font.FontFamily.Serif
                        "MONOSPACE" -> androidx.compose.ui.text.font.FontFamily.Monospace
                        else -> androidx.compose.ui.text.font.FontFamily.SansSerif
                    }
                )
            }
        }
    }
}

@Composable
private fun ThemeSection(
    readerSettings: ReaderSettings,
    onThemeChanged: (String) -> Unit,
    onBackgroundColorChanged: (String) -> Unit,
    onTextColorChanged: (String) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Theme",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(bottom = 12.dp)
            )

            // Theme selector
            val themes = listOf("LIGHT", "DARK", "SEPIA", "SYSTEM")
            themes.forEach { theme ->
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(vertical = 4.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    RadioButton(
                        selected = readerSettings.theme == theme,
                        onClick = { onThemeChanged(theme) }
                    )
                    Text(
                        text = theme.lowercase().replaceFirstChar { it.uppercase() },
                        modifier = Modifier.padding(start = 8.dp)
                    )
                }
            }
        }
    }
}

@Composable
private fun TypographySection(
    readerSettings: ReaderSettings,
    onFontFamilyChanged: (String) -> Unit,
    onFontSizeChanged: (Int) -> Unit,
    onLineSpacingChanged: (Float) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Typography",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(bottom = 12.dp)
            )

            // Font family
            Text(
                text = "Font Family",
                style = MaterialTheme.typography.bodyMedium,
                modifier = Modifier.padding(bottom = 8.dp)
            )

            val fontFamilies = listOf("DEFAULT", "SERIF", "SANS_SERIF", "MONOSPACE")
            fontFamilies.forEach { family ->
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(vertical = 2.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    RadioButton(
                        selected = readerSettings.fontFamily == family,
                        onClick = { onFontFamilyChanged(family) }
                    )
                    Text(
                        text = family.lowercase().replaceFirstChar { it.uppercase() },
                        modifier = Modifier.padding(start = 8.dp)
                    )
                }
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Font size
            Text(
                text = "Font Size: ${readerSettings.fontSize}sp",
                style = MaterialTheme.typography.bodyMedium,
                modifier = Modifier.padding(bottom = 8.dp)
            )

            Slider(
                value = readerSettings.fontSize.toFloat(),
                onValueChange = { onFontSizeChanged(it.toInt()) },
                valueRange = 12f..24f,
                steps = 11
            )

            Spacer(modifier = Modifier.height(16.dp))

            // Line spacing
            Text(
                text = "Line Spacing: ${String.format(Locale.getDefault(), "%.1f", readerSettings.lineHeight)}",
                style = MaterialTheme.typography.bodyMedium,
                modifier = Modifier.padding(bottom = 8.dp)
            )

            Slider(
                value = readerSettings.lineHeight,
                onValueChange = onLineSpacingChanged,
                valueRange = 1.0f..2.0f,
                steps = 9
            )
        }
    }
}

@Composable
private fun LayoutSection(
    readerSettings: ReaderSettings,
    onMarginChanged: (Margins) -> Unit,
    onTextAlignmentChanged: (String) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Layout",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(bottom = 12.dp)
            )

            // Margins
            Text(
                text = "Margins: ${readerSettings.marginLeft}dp",
                style = MaterialTheme.typography.bodyMedium,
                modifier = Modifier.padding(bottom = 8.dp)
            )

            Slider(
                value = readerSettings.marginLeft.toFloat(),
                onValueChange = { margin ->
                    onMarginChanged(
                        Margins(
                            left = margin.toInt(),
                            right = margin.toInt(),
                            top = margin.toInt(),
                            bottom = margin.toInt()
                        )
                    )
                },
                valueRange = 8f..32f,
                steps = 11
            )

            Spacer(modifier = Modifier.height(16.dp))

            // Text alignment
            Text(
                text = "Text Alignment",
                style = MaterialTheme.typography.bodyMedium,
                modifier = Modifier.padding(bottom = 8.dp)
            )

            val alignments = listOf("LEFT", "CENTER", "RIGHT", "JUSTIFY")
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                alignments.forEach { alignment ->
                    FilterChip(
                        onClick = { onTextAlignmentChanged(alignment) },
                        label = { Text(alignment) },
                        selected = readerSettings.textAlignment == alignment
                    )
                }
            }
        }
    }
}

@Composable
private fun AdvancedSection(
    readerSettings: ReaderSettings,
    onBrightnessChanged: (Float) -> Unit,
    onKeepScreenOnChanged: (Boolean) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Advanced",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(bottom = 12.dp)
            )

            // Brightness
            Text(
                text = "Brightness: ${(readerSettings.brightness * 100).toInt()}%",
                style = MaterialTheme.typography.bodyMedium,
                modifier = Modifier.padding(bottom = 8.dp)
            )

            Slider(
                value = readerSettings.brightness,
                onValueChange = onBrightnessChanged,
                valueRange = 0.1f..1.0f
            )

            Spacer(modifier = Modifier.height(16.dp))

            // Keep screen on
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Keep screen on while reading",
                    style = MaterialTheme.typography.bodyMedium
                )
                Switch(
                    checked = readerSettings.keepScreenOn,
                    onCheckedChange = onKeepScreenOnChanged
                )
            }
        }
    }
}

/**
 * Enhanced Reading Features Section
 * LibreraReader-inspired features
 */
@Composable
private fun EnhancedReadingFeaturesSection(
    readerSettings: ReaderSettings,
    viewModel: ReaderSettingsViewModel
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Enhanced Reading Features",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(bottom = 12.dp)
            )

            // Color Scheme
            Text(
                text = "Color Scheme",
                style = MaterialTheme.typography.bodyMedium,
                fontWeight = FontWeight.Medium,
                modifier = Modifier.padding(bottom = 8.dp)
            )
            
            val colorSchemes = listOf(
                "Classic Day", "Warm Day", "Paper Day", "High Contrast Day",
                "Sepia", "Dark Sepia",
                "Classic Night", "Dark Gray", "OLED Black", "Midnight Blue", 
                "Dark Green", "Amber Night", "High Contrast Night"
            )
            
            var expandedColorScheme by remember { mutableStateOf(false) }
            
            ExposedDropdownMenuBox(
                expanded = expandedColorScheme,
                onExpandedChange = { expandedColorScheme = !expandedColorScheme }
            ) {
                OutlinedTextField(
                    value = readerSettings.colorScheme,
                    onValueChange = {},
                    readOnly = true,
                    label = { Text("Select color scheme") },
                    trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded = expandedColorScheme) },
                    modifier = Modifier
                        .fillMaxWidth()
                        .menuAnchor()
                )
                ExposedDropdownMenu(
                    expanded = expandedColorScheme,
                    onDismissRequest = { expandedColorScheme = false }
                ) {
                    colorSchemes.forEach { scheme ->
                        DropdownMenuItem(
                            text = { Text(scheme) },
                            onClick = {
                                viewModel.updateColorScheme(scheme)
                                expandedColorScheme = false
                            }
                        )
                    }
                }
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Reading Ruler
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 4.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Reading Ruler",
                    style = MaterialTheme.typography.bodyMedium
                )
                Switch(
                    checked = readerSettings.rulerEnabled,
                    onCheckedChange = { viewModel.updateRulerEnabled(it) }
                )
            }

            if (readerSettings.rulerEnabled) {
                Column(modifier = Modifier.padding(start = 16.dp, top = 8.dp)) {
                    Text(
                        text = "Ruler Height: ${readerSettings.rulerHeight}dp",
                        style = MaterialTheme.typography.bodySmall
                    )
                    Slider(
                        value = readerSettings.rulerHeight.toFloat(),
                        onValueChange = { height ->
                            viewModel.updateRulerSettings(
                                height = height.toInt(),
                                color = readerSettings.rulerColor,
                                alpha = readerSettings.rulerAlpha,
                                position = readerSettings.rulerPosition
                            )
                        },
                        valueRange = 30f..120f,
                        steps = 17,
                        modifier = Modifier.fillMaxWidth()
                    )
                    
                    Text(
                        text = "Ruler Opacity: ${(readerSettings.rulerAlpha * 100).toInt()}%",
                        style = MaterialTheme.typography.bodySmall
                    )
                    Slider(
                        value = readerSettings.rulerAlpha,
                        onValueChange = { alpha ->
                            viewModel.updateRulerSettings(
                                height = readerSettings.rulerHeight,
                                color = readerSettings.rulerColor,
                                alpha = alpha,
                                position = readerSettings.rulerPosition
                            )
                        },
                        valueRange = 0.1f..0.7f,
                        modifier = Modifier.fillMaxWidth()
                    )
                }
            }

            Spacer(modifier = Modifier.height(16.dp))

            // RSVP Speed Reading
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 4.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "RSVP Speed Reading",
                    style = MaterialTheme.typography.bodyMedium
                )
                Switch(
                    checked = readerSettings.rsvpEnabled,
                    onCheckedChange = { viewModel.updateRsvpEnabled(it) }
                )
            }

            if (readerSettings.rsvpEnabled) {
                Column(modifier = Modifier.padding(start = 16.dp, top = 8.dp)) {
                    Text(
                        text = "Speed: ${readerSettings.rsvpWpm} WPM",
                        style = MaterialTheme.typography.bodySmall
                    )
                    Slider(
                        value = readerSettings.rsvpWpm.toFloat(),
                        onValueChange = { wpm ->
                            viewModel.updateRsvpSettings(
                                wpm = wpm.toInt(),
                                fontSize = readerSettings.rsvpFontSize
                            )
                        },
                        valueRange = 100f..600f,
                        steps = 49,
                        modifier = Modifier.fillMaxWidth()
                    )
                    
                    Text(
                        text = "Font Size: ${readerSettings.rsvpFontSize}sp",
                        style = MaterialTheme.typography.bodySmall
                    )
                    Slider(
                        value = readerSettings.rsvpFontSize.toFloat(),
                        onValueChange = { size ->
                            viewModel.updateRsvpSettings(
                                wpm = readerSettings.rsvpWpm,
                                fontSize = size.toInt()
                            )
                        },
                        valueRange = 20f..48f,
                        steps = 27,
                        modifier = Modifier.fillMaxWidth()
                    )
                }
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Enhanced Auto-Scroll
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 4.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Enhanced Auto-Scroll",
                    style = MaterialTheme.typography.bodyMedium
                )
                Switch(
                    checked = readerSettings.autoScrollEnabled,
                    onCheckedChange = { viewModel.updateAutoScrollEnabled(it) }
                )
            }

            if (readerSettings.autoScrollEnabled) {
                Column(modifier = Modifier.padding(start = 16.dp, top = 8.dp)) {
                    Text(
                        text = "Speed: ${String.format("%.1f", readerSettings.autoScrollSpeedMultiplier)}x",
                        style = MaterialTheme.typography.bodySmall
                    )
                    Slider(
                        value = readerSettings.autoScrollSpeedMultiplier,
                        onValueChange = { speed ->
                            viewModel.updateAutoScrollSpeed(speed)
                        },
                        valueRange = 0.1f..5.0f,
                        steps = 48,
                        modifier = Modifier.fillMaxWidth()
                    )
                    
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        TextButton(onClick = { viewModel.updateAutoScrollSpeed(0.5f) }) {
                            Text("Slow", style = MaterialTheme.typography.bodySmall)
                        }
                        TextButton(onClick = { viewModel.updateAutoScrollSpeed(1.0f) }) {
                            Text("Normal", style = MaterialTheme.typography.bodySmall)
                        }
                        TextButton(onClick = { viewModel.updateAutoScrollSpeed(2.0f) }) {
                            Text("Fast", style = MaterialTheme.typography.bodySmall)
                        }
                        TextButton(onClick = { viewModel.updateAutoScrollSpeed(3.0f) }) {
                            Text("Ultra", style = MaterialTheme.typography.bodySmall)
                        }
                    }
                }
            }
        }
    }
}

/**
 * Data class for margin settings
 */
data class Margins(
    val left: Int,
    val right: Int,
    val top: Int,
    val bottom: Int
)
