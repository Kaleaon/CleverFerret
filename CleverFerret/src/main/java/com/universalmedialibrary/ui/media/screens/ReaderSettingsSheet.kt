package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.gestures.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.pager.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.launch

@OptIn(ExperimentalMaterial3Api::class)
@Composable
internal fun ReaderSettingsSheet(
    settings: ReaderSettings,
    onSettingsChange: (ReaderSettings) -> Unit,
    onDismiss: () -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        containerColor = MediaColors.BackgroundElevated
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(MediaSpacing.MD)
                .verticalScroll(rememberScrollState())
        ) {
            Text(
                "Reader Settings",
                style = MediaTypography.TitleMedium,
                color = MediaColors.TextPrimary,
                modifier = Modifier.padding(bottom = MediaSpacing.MD)
            )
            
            // Font size
            SettingSection(title = "Font Size") {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    IconButton(onClick = {
                        if (settings.fontSize > 12) {
                            onSettingsChange(settings.copy(fontSize = settings.fontSize - 2))
                        }
                    }) {
                        Icon(Icons.Default.Remove, "Decrease", tint = MediaColors.TextSecondary)
                    }
                    
                    Text(
                        "${settings.fontSize.toInt()}",
                        style = MediaTypography.TitleMedium,
                        color = MediaColors.TextPrimary,
                        modifier = Modifier.weight(1f),
                        textAlign = TextAlign.Center
                    )
                    
                    IconButton(onClick = {
                        if (settings.fontSize < 32) {
                            onSettingsChange(settings.copy(fontSize = settings.fontSize + 2))
                        }
                    }) {
                        Icon(Icons.Default.Add, "Increase", tint = MediaColors.TextSecondary)
                    }
                }
            }
            
            // Font family
            SettingSection(title = "Font") {
                LazyRow(
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
                ) {
                    items(ReaderFontFamily.entries.toList()) { font ->
                        FilterChip(
                            selected = settings.fontFamily == font,
                            onClick = { onSettingsChange(settings.copy(fontFamily = font)) },
                            label = { Text(font.displayName) }
                        )
                    }
                }
            }
            
            // Line height
            SettingSection(title = "Line Height") {
                Slider(
                    value = settings.lineHeight,
                    onValueChange = { onSettingsChange(settings.copy(lineHeight = it)) },
                    valueRange = 1.2f..2.5f,
                    colors = SliderDefaults.colors(
                        thumbColor = MediaColors.AccentPrimary,
                        activeTrackColor = MediaColors.AccentPrimary
                    )
                )
            }
            
            // Theme presets
            SettingSection(title = "Theme") {
                LazyRow(
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
                ) {
                    items(ReaderThemePreset.entries.toList()) { preset ->
                        ThemePresetChip(
                            preset = preset,
                            isSelected = settings.themePreset == preset,
                            onClick = { 
                                onSettingsChange(settings.copy(
                                    themePreset = preset,
                                    theme = preset.toTheme()
                                ))
                            }
                        )
                    }
                }
            }
            
            // Reading mode
            SettingSection(title = "Reading Mode") {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
                ) {
                    ReadingMode.entries.forEach { mode ->
                        FilterChip(
                            selected = settings.readingMode == mode,
                            onClick = { onSettingsChange(settings.copy(readingMode = mode)) },
                            label = { Text(mode.displayName) },
                            modifier = Modifier.weight(1f)
                        )
                    }
                }
            }
            
            // Page animation
            SettingSection(title = "Page Animation") {
                LazyRow(
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
                ) {
                    items(PageAnimation.entries.toList()) { animation ->
                        FilterChip(
                            selected = settings.pageAnimation == animation,
                            onClick = { onSettingsChange(settings.copy(pageAnimation = animation)) },
                            label = { Text(animation.displayName) }
                        )
                    }
                }
            }
            
            // Toggles
            SettingSection(title = "Display") {
                SettingToggle(
                    title = "Show Page Number",
                    checked = settings.showPageNumber,
                    onCheckedChange = { onSettingsChange(settings.copy(showPageNumber = it)) }
                )
                SettingToggle(
                    title = "Keep Screen On",
                    checked = settings.keepScreenOn,
                    onCheckedChange = { onSettingsChange(settings.copy(keepScreenOn = it)) }
                )
                SettingToggle(
                    title = "Volume Page Turn",
                    checked = settings.volumePageTurn,
                    onCheckedChange = { onSettingsChange(settings.copy(volumePageTurn = it)) }
                )
            }
            
            Spacer(Modifier.height(MediaSpacing.XL))
        }
    }
}
