package com.universalmedialibrary.ui.reader

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
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
                    Icon(Icons.Default.ArrowBack, contentDescription = "Back")
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
                onBackgroundColorChanged = { color -> viewModel.updateBackgroundColor(color) },
                onTextColorChanged = { color -> viewModel.updateTextColor(color) }
            )
            
            // Typography Section
            TypographySection(
                readerSettings = readerSettings,
                onFontFamilyChanged = { family -> viewModel.updateFontFamily(family) },
                onFontSizeChanged = { size -> viewModel.updateFontSize(size) },
                onLineSpacingChanged = { spacing -> viewModel.updateLineSpacing(spacing) }
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
                    lineHeight = androidx.compose.ui.unit.TextUnit((readerSettings.fontSize * readerSettings.lineSpacing), androidx.compose.ui.unit.TextUnitType.Sp),
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
                text = "Line Spacing: ${String.format(Locale.getDefault(), "%.1f", readerSettings.lineSpacing)}",
                style = MaterialTheme.typography.bodyMedium,
                modifier = Modifier.padding(bottom = 8.dp)
            )
            
            Slider(
                value = readerSettings.lineSpacing,
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
 * Data class for margin settings
 */
data class Margins(
    val left: Int,
    val right: Int,
    val top: Int,
    val bottom: Int
)