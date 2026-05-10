package com.universalmedialibrary.ui.reader.components

import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.*
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.automirrored.filled.NavigateBefore
import androidx.compose.material.icons.automirrored.filled.NavigateNext
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalSoftwareKeyboardController
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import com.universalmedialibrary.ui.reader.ReadingStats
import com.universalmedialibrary.ui.viewer.MediaViewerManager
import com.universalmedialibrary.ui.viewer.common.ReadingDirection
import com.universalmedialibrary.ui.viewer.common.ReadingMode
import com.universalmedialibrary.ui.viewer.common.TextAlignment
import com.universalmedialibrary.ui.viewer.common.ViewerSettings

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DocumentReaderSettingsSheet(
    settings: ViewerSettings,
    documentType: MediaViewerManager.DocumentFormat,
    onDismiss: () -> Unit,
    onSettingsChanged: (ViewerSettings) -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        modifier = Modifier.fillMaxHeight(0.8f)
    ) {
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            item {
                Text(
                    text = "Reading Settings",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Medium
                )
            }

            // Display Settings
            item {
                SettingsCard(title = "Display") {
                    Column(
                        verticalArrangement = Arrangement.spacedBy(16.dp)
                    ) {
                        // Brightness
                        Text("Brightness: ${(settings.brightness * 100).toInt()}%")
                        Slider(
                            value = settings.brightness,
                            onValueChange = {
                                onSettingsChanged(settings.copy(brightness = it))
                            },
                            valueRange = 0.1f..1f
                        )

                        // Night mode
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Night Mode")
                            Switch(
                                checked = settings.nightMode,
                                onCheckedChange = {
                                    val newSettings = if (it) {
                                        settings.copy(
                                            nightMode = true,
                                            backgroundColor = Color.Black,
                                            textColor = Color.White
                                        )
                                    } else {
                                        settings.copy(
                                            nightMode = false,
                                            backgroundColor = Color.White,
                                            textColor = Color.Black
                                        )
                                    }
                                    onSettingsChanged(newSettings)
                                }
                            )
                        }

                        // Blue light filter
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Blue Light Filter")
                            Switch(
                                checked = settings.blueLightFilter,
                                onCheckedChange = {
                                    onSettingsChanged(settings.copy(blueLightFilter = it))
                                }
                            )
                        }

                        // Keep screen on
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Keep Screen On")
                            Switch(
                                checked = settings.keepScreenOn,
                                onCheckedChange = {
                                    onSettingsChanged(settings.copy(keepScreenOn = it))
                                }
                            )
                        }
                    }
                }
            }

            // Typography Settings (for text-based documents)
            if (documentType != MediaViewerManager.DocumentFormat.PDF) {
                item {
                    SettingsCard(title = "Typography") {
                        Column(
                            verticalArrangement = Arrangement.spacedBy(16.dp)
                        ) {
                            // Font size
                            Text("Font Size: ${settings.fontSize.toInt()}sp")
                            Slider(
                                value = settings.fontSize,
                                onValueChange = {
                                    onSettingsChanged(settings.copy(fontSize = it))
                                },
                                valueRange = 10f..36f,
                                steps = 25
                            )

                            // Line spacing
                            Text("Line Spacing: ${(settings.lineSpacing * 100).toInt()}%")
                            Slider(
                                value = settings.lineSpacing,
                                onValueChange = {
                                    onSettingsChanged(settings.copy(lineSpacing = it))
                                },
                                valueRange = 1.0f..3.0f,
                                steps = 19
                            )

                            // Font family
                            Text("Font Family")
                            Row(
                                modifier = Modifier.fillMaxWidth(),
                                horizontalArrangement = Arrangement.spacedBy(8.dp)
                            ) {
                                FilterChip(
                                    onClick = {
                                        onSettingsChanged(settings.copy(fontFamily = FontFamily.Default))
                                    },
                                    label = { Text("Default") },
                                    selected = settings.fontFamily == FontFamily.Default
                                )
                                FilterChip(
                                    onClick = {
                                        onSettingsChanged(settings.copy(fontFamily = FontFamily.Serif))
                                    },
                                    label = { Text("Serif") },
                                    selected = settings.fontFamily == FontFamily.Serif
                                )
                                FilterChip(
                                    onClick = {
                                        onSettingsChanged(settings.copy(fontFamily = FontFamily.SansSerif))
                                    },
                                    label = { Text("Sans Serif") },
                                    selected = settings.fontFamily == FontFamily.SansSerif
                                )
                                FilterChip(
                                    onClick = {
                                        onSettingsChanged(settings.copy(fontFamily = FontFamily.Monospace))
                                    },
                                    label = { Text("Mono") },
                                    selected = settings.fontFamily == FontFamily.Monospace
                                )
                            }

                            // Text alignment
                            Text("Text Alignment")
                            Row(
                                modifier = Modifier.fillMaxWidth(),
                                horizontalArrangement = Arrangement.spacedBy(8.dp)
                            ) {
                                FilterChip(
                                    onClick = {
                                        onSettingsChanged(settings.copy(textAlignment = TextAlignment.LEFT))
                                    },
                                    label = { Text("Left") },
                                    selected = settings.textAlignment == TextAlignment.LEFT
                                )
                                FilterChip(
                                    onClick = {
                                        onSettingsChanged(settings.copy(textAlignment = TextAlignment.CENTER))
                                    },
                                    label = { Text("Center") },
                                    selected = settings.textAlignment == TextAlignment.CENTER
                                )
                                FilterChip(
                                    onClick = {
                                        onSettingsChanged(settings.copy(textAlignment = TextAlignment.JUSTIFY))
                                    },
                                    label = { Text("Justify") },
                                    selected = settings.textAlignment == TextAlignment.JUSTIFY
                                )
                            }

                            // Margins
                            Text("Horizontal Margin: ${settings.marginHorizontal.toInt()}dp")
                            Slider(
                                value = settings.marginHorizontal,
                                onValueChange = {
                                    onSettingsChanged(settings.copy(marginHorizontal = it))
                                },
                                valueRange = 8f..48f,
                                steps = 39
                            )
                        }
                    }
                }
            }

            // Reading Settings
            item {
                SettingsCard(title = "Reading") {
                    Column(
                        verticalArrangement = Arrangement.spacedBy(16.dp)
                    ) {
                        // Reading mode
                        Text("Reading Mode")
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            FilterChip(
                                onClick = {
                                    onSettingsChanged(settings.copy(readingMode = ReadingMode.PAGE_BY_PAGE))
                                },
                                label = { Text("Page") },
                                selected = settings.readingMode == ReadingMode.PAGE_BY_PAGE
                            )
                            FilterChip(
                                onClick = {
                                    onSettingsChanged(settings.copy(readingMode = ReadingMode.CONTINUOUS_VERTICAL))
                                },
                                label = { Text("Vertical") },
                                selected = settings.readingMode == ReadingMode.CONTINUOUS_VERTICAL
                            )
                            FilterChip(
                                onClick = {
                                    onSettingsChanged(settings.copy(readingMode = ReadingMode.CONTINUOUS_HORIZONTAL))
                                },
                                label = { Text("Horizontal") },
                                selected = settings.readingMode == ReadingMode.CONTINUOUS_HORIZONTAL
                            )
                            FilterChip(
                                onClick = {
                                    onSettingsChanged(settings.copy(readingMode = ReadingMode.WEBTOON))
                                },
                                label = { Text("Webtoon") },
                                selected = settings.readingMode == ReadingMode.WEBTOON
                            )
                        }

                        // Reading direction
                        Text("Reading Direction")
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            FilterChip(
                                onClick = {
                                    onSettingsChanged(settings.copy(readingDirection = ReadingDirection.LEFT_TO_RIGHT))
                                },
                                label = { Text("L → R") },
                                selected = settings.readingDirection == ReadingDirection.LEFT_TO_RIGHT
                            )
                            FilterChip(
                                onClick = {
                                    onSettingsChanged(settings.copy(readingDirection = ReadingDirection.RIGHT_TO_LEFT))
                                },
                                label = { Text("R → L") },
                                selected = settings.readingDirection == ReadingDirection.RIGHT_TO_LEFT
                            )
                        }

                        // Volume keys navigation
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Volume Keys Navigation")
                            Switch(
                                checked = settings.volumeKeysForNavigation,
                                onCheckedChange = {
                                    onSettingsChanged(settings.copy(volumeKeysForNavigation = it))
                                }
                            )
                        }

                        // Auto bookmarks
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Auto Bookmarks")
                            Switch(
                                checked = settings.autoBookmarks,
                                onCheckedChange = {
                                    onSettingsChanged(settings.copy(autoBookmarks = it))
                                }
                            )
                        }

                        // Reading analytics
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Reading Analytics")
                            Switch(
                                checked = settings.readingAnalytics,
                                onCheckedChange = {
                                    onSettingsChanged(settings.copy(readingAnalytics = it))
                                }
                            )
                        }
                    }
                }
            }

            // Gestures
            item {
                SettingsCard(title = "Gestures") {
                    Column(
                        verticalArrangement = Arrangement.spacedBy(16.dp)
                    ) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Double Tap to Zoom")
                            Switch(
                                checked = settings.doubleTapToZoom,
                                onCheckedChange = {
                                    onSettingsChanged(settings.copy(doubleTapToZoom = it))
                                }
                            )
                        }

                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Pinch to Zoom")
                            Switch(
                                checked = settings.pinchToZoom,
                                onCheckedChange = {
                                    onSettingsChanged(settings.copy(pinchToZoom = it))
                                }
                            )
                        }
                    }
                }
            }
        }
    }
}
