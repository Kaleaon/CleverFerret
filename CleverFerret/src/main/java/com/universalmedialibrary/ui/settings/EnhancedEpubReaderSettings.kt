package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel

/**
 * Enhanced EPUB Reader Settings (Phase 3)
 * 
 * Advanced EPUB customization options inspired by Myne:
 * - Font family selection (System, Serif, Sans-Serif, Monospace, OpenDyslexic)
 * - Reading theme presets (Default, Sepia, Night, Custom)
 * - Text alignment options
 * - Line height adjustment
 * - Custom colors
 * 
 * All settings persist per user and can be overridden per-book.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedEpubReaderSettingsScreen(
    onBack: () -> Unit,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val readerSettings by viewModel.readerSettings.collectAsState()
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("EPUB Reader Settings") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(
                            imageVector = Icons.AutoMirrored.Filled.ArrowBack,
                            contentDescription = "Back"
                        )
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .verticalScroll(rememberScrollState())
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Font Family Section
            SettingsSection(title = "Font & Typography") {
                FontFamilySelector(
                    currentFont = readerSettings.fontFamily,
                    onFontSelected = { font ->
                        viewModel.updateReaderSettings(
                            readerSettings.copy(fontFamily = font)
                        )
                    }
                )
                
                Spacer(modifier = Modifier.height(8.dp))
                
                // Line Height Slider
                Text(
                    text = "Line Height: ${String.format("%.1f", readerSettings.lineHeight)}",
                    style = MaterialTheme.typography.bodyMedium
                )
                Slider(
                    value = readerSettings.lineHeight,
                    onValueChange = { value ->
                        viewModel.updateReaderSettings(
                            readerSettings.copy(lineHeight = value)
                        )
                    },
                    valueRange = 1.0f..2.0f,
                    steps = 10
                )
            }
            
            // Reading Theme Section
            SettingsSection(title = "Reading Theme") {
                ReadingThemeSelector(
                    currentTheme = readerSettings.theme,
                    onThemeSelected = { theme ->
                        viewModel.updateReaderSettings(
                            readerSettings.copy(theme = theme)
                        )
                    }
                )
            }
            
            // Text Alignment Section
            SettingsSection(title = "Text Layout") {
                TextAlignmentSelector(
                    currentAlignment = readerSettings.textAlignment,
                    onAlignmentSelected = { alignment ->
                        viewModel.updateReaderSettings(
                            readerSettings.copy(textAlignment = alignment)
                        )
                    }
                )
            }
            
            // Feature Toggles Section
            SettingsSection(title = "Features") {
                SwitchPreference(
                    title = "Enable Swipe Actions",
                    description = "Swipe on library items for quick actions",
                    checked = true, // This would come from GeneralSettings
                    onCheckedChange = { /* Update general settings */ }
                )
                
                SwitchPreference(
                    title = "Enable Tutorial Hints",
                    description = "Show helpful hints for first-time features",
                    checked = true, // This would come from GeneralSettings
                    onCheckedChange = { /* Update general settings */ }
                )
            }
        }
    }
}

@Composable
private fun FontFamilySelector(
    currentFont: String,
    onFontSelected: (String) -> Unit
) {
    val fonts = listOf(
        "System" to "System Default",
        "Serif" to "Serif (Georgia)",
        "Sans-Serif" to "Sans-Serif (Roboto)",
        "Monospace" to "Monospace (Courier)",
        "OpenDyslexic" to "OpenDyslexic (Dyslexia-friendly)"
    )
    
    Column {
        Text(
            text = "Font Family",
            style = MaterialTheme.typography.titleSmall,
            modifier = Modifier.padding(bottom = 8.dp)
        )
        
        fonts.forEach { (value, label) ->
            FilterChip(
                selected = currentFont == value,
                onClick = { onFontSelected(value) },
                label = { Text(label) },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 4.dp)
            )
        }
    }
}

@Composable
private fun ReadingThemeSelector(
    currentTheme: String,
    onThemeSelected: (String) -> Unit
) {
    val themes = listOf(
        "Default" to "Default (White)",
        "Sepia" to "Sepia (Warm)",
        "Night" to "Night (Dark)",
        "Custom" to "Custom Colors"
    )
    
    Column {
        Text(
            text = "Reading Theme",
            style = MaterialTheme.typography.titleSmall,
            modifier = Modifier.padding(bottom = 8.dp)
        )
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            themes.forEach { (value, label) ->
                FilterChip(
                    selected = currentTheme == value,
                    onClick = { onThemeSelected(value) },
                    label = { Text(label) },
                    modifier = Modifier.weight(1f)
                )
            }
        }
    }
}

@Composable
private fun TextAlignmentSelector(
    currentAlignment: String,
    onAlignmentSelected: (String) -> Unit
) {
    val alignments = listOf(
        "Left" to "Left",
        "Center" to "Center",
        "Justify" to "Justify"
    )
    
    Column {
        Text(
            text = "Text Alignment",
            style = MaterialTheme.typography.titleSmall,
            modifier = Modifier.padding(bottom = 8.dp)
        )
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            alignments.forEach { (value, label) ->
                FilterChip(
                    selected = currentAlignment == value,
                    onClick = { onAlignmentSelected(value) },
                    label = { Text(label) },
                    modifier = Modifier.weight(1f)
                )
            }
        }
    }
}

@Composable
private fun SettingsSection(
    title: String,
    content: @Composable ColumnScope.() -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text(
                text = title,
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.primary
            )
            content()
        }
    }
}

@Composable
private fun SwitchPreference(
    title: String,
    description: String,
    checked: Boolean,
    onCheckedChange: (Boolean) -> Unit
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = title,
                style = MaterialTheme.typography.bodyLarge
            )
            Text(
                text = description,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
        Switch(
            checked = checked,
            onCheckedChange = onCheckedChange
        )
    }
}
