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

data class Bookmark(
    val id: String,
    val title: String,
    val page: Int,
    val position: Float,
    val createdAt: Long,
    val note: String? = null
)

data class SearchResult(
    val page: Int,
    val position: Int,
    val text: String,
    val context: String
)

data class TableOfContentsItem(
    val id: String,
    val title: String,
    val page: Int,
    val level: Int,
    val children: List<TableOfContentsItem> = emptyList()
)

@Composable
fun TopReaderControls(
    title: String,
    currentPage: Int,
    totalPages: Int,
    readingProgress: Float,
    onBack: () -> Unit,
    onSearch: () -> Unit,
    onBookmarks: () -> Unit,
    onTableOfContents: () -> Unit,
    onSettings: () -> Unit
) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(80.dp)
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        Color.Black.copy(alpha = 0.7f),
                        Color.Transparent
                    )
                )
            )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(onClick = onBack) {
                Icon(
                    Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = Color.White,
                    modifier = Modifier.size(24.dp)
                )
            }

            Column(
                modifier = Modifier
                    .weight(1f)
                    .padding(horizontal = 16.dp),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(
                    text = title,
                    style = MaterialTheme.typography.titleMedium,
                    color = Color.White,
                    fontWeight = FontWeight.Medium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    text = "Page $currentPage of $totalPages • ${(readingProgress * 100).toInt()}%",
                    style = MaterialTheme.typography.bodySmall,
                    color = Color.White.copy(alpha = 0.7f)
                )
            }

            Row {
                IconButton(onClick = onSearch) {
                    Icon(
                        Icons.Default.Search,
                        contentDescription = "Search",
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                }
                IconButton(onClick = onBookmarks) {
                    Icon(
                        Icons.Default.Bookmark,
                        contentDescription = "Bookmarks",
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                }
                IconButton(onClick = onTableOfContents) {
                    Icon(
                        Icons.AutoMirrored.Filled.List,
                        contentDescription = "Table of Contents",
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                }
                IconButton(onClick = onSettings) {
                    Icon(
                        Icons.Default.Settings,
                        contentDescription = "Settings",
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                }
            }
        }
    }
}

@Composable
fun BottomReaderControls(
    currentPage: Int,
    totalPages: Int,
    readingProgress: Float,
    canGoPrevious: Boolean,
    canGoNext: Boolean,
    onPreviousPage: () -> Unit,
    onNextPage: () -> Unit,
    onPageSeek: (Int) -> Unit
) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(100.dp)
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        Color.Transparent,
                        Color.Black.copy(alpha = 0.7f)
                    )
                )
            )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .align(Alignment.BottomStart)
                .padding(16.dp)
        ) {
            // Progress slider
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = currentPage.toString(),
                    color = Color.White,
                    style = MaterialTheme.typography.bodySmall,
                    modifier = Modifier.width(40.dp),
                    textAlign = TextAlign.Center
                )

                Slider(
                    value = currentPage.toFloat(),
                    onValueChange = { onPageSeek(it.toInt()) },
                    valueRange = 1f..totalPages.toFloat(),
                    modifier = Modifier.weight(1f),
                    colors = SliderDefaults.colors(
                        thumbColor = MaterialTheme.colorScheme.primary,
                        activeTrackColor = MaterialTheme.colorScheme.primary,
                        inactiveTrackColor = Color.White.copy(alpha = 0.3f)
                    )
                )

                Text(
                    text = totalPages.toString(),
                    color = Color.White,
                    style = MaterialTheme.typography.bodySmall,
                    modifier = Modifier.width(40.dp),
                    textAlign = TextAlign.Center
                )
            }

            Spacer(modifier = Modifier.height(8.dp))

            // Navigation buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Previous page
                IconButton(
                    onClick = onPreviousPage,
                    enabled = canGoPrevious
                ) {
                    Icon(
                        Icons.Default.NavigateBefore,
                        contentDescription = "Previous Page",
                        tint = if (canGoPrevious) Color.White else Color.White.copy(alpha = 0.3f),
                        modifier = Modifier.size(32.dp)
                    )
                }

                // Progress indicator
                LinearProgressIndicator(
                    progress = readingProgress,
                    modifier = Modifier
                        .weight(1f)
                        .height(4.dp)
                        .clip(RoundedCornerShape(2.dp)),
                    color = MaterialTheme.colorScheme.primary,
                    trackColor = Color.White.copy(alpha = 0.3f)
                )

                // Next page
                IconButton(
                    onClick = onNextPage,
                    enabled = canGoNext
                ) {
                    Icon(
                        Icons.Default.NavigateNext,
                        contentDescription = "Next Page",
                        tint = if (canGoNext) Color.White else Color.White.copy(alpha = 0.3f),
                        modifier = Modifier.size(32.dp)
                    )
                }
            }
        }
    }
}

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

                            // Font family - TODO: Add fontFamily to ViewerSettings
                            // Text("Font Family")
                            // Row(
                            //     modifier = Modifier.fillMaxWidth(),
                            //     horizontalArrangement = Arrangement.spacedBy(8.dp)
                            // ) {
                            //     FilterChip(
                            //         onClick = {
                            //             onSettingsChanged(settings.copy(fontFamily = FontFamily.Default))
                            //         },
                            //         label = { Text("Default") },
                            //         selected = settings.fontFamily == FontFamily.Default
                            //     )
                            //     FilterChip(
                            //         onClick = {
                            //             onSettingsChanged(settings.copy(fontFamily = FontFamily.Serif))
                            //         },
                            //         label = { Text("Serif") },
                            //         selected = settings.fontFamily == FontFamily.Serif
                            //     )
                            //     FilterChip(
                            //         onClick = {
                            //             onSettingsChanged(settings.copy(fontFamily = FontFamily.SansSerif))
                            //         },
                            //         label = { Text("Sans Serif") },
                            //         selected = settings.fontFamily == FontFamily.SansSerif
                            //     )
                            //     FilterChip(
                            //         onClick = {
                            //             onSettingsChanged(settings.copy(fontFamily = FontFamily.Monospace))
                            //         },
                            //         label = { Text("Mono") },
                            //         selected = settings.fontFamily == FontFamily.Monospace
                            //     )
                            // }

                            // Text alignment - TODO: Add to ViewerSettings
                            // Text("Text Alignment")
                            // Row(
                            //     modifier = Modifier.fillMaxWidth(),
                            //     horizontalArrangement = Arrangement.spacedBy(8.dp)
                            // ) {
                            //     FilterChip(
                            //         onClick = {
                            //             onSettingsChanged(settings.copy(textAlignment = TextAlignment.LEFT))
                            //         },
                            //         label = { Text("Left") },
                            //         selected = settings.textAlignment == TextAlignment.LEFT
                            //     )
                            //     FilterChip(
                            //         onClick = {
                            //             onSettingsChanged(settings.copy(textAlignment = TextAlignment.CENTER))
                            //         },
                            //         label = { Text("Center") },
                            //         selected = settings.textAlignment == TextAlignment.CENTER
                            //     )
                            //     FilterChip(
                            //         onClick = {
                            //             onSettingsChanged(settings.copy(textAlignment = TextAlignment.JUSTIFY))
                            //         },
                            //         label = { Text("Justify") },
                            //         selected = settings.textAlignment == TextAlignment.JUSTIFY
                            //     )
                            // }

                            // Margins - TODO: Add to ViewerSettings
                            // Text("Horizontal Margin: ${settings.marginHorizontal.toInt()}dp")
                            // Slider(
                            //     value = settings.marginHorizontal,
                            //     onValueChange = {
                            //         onSettingsChanged(settings.copy(marginHorizontal = it))
                            //     },
                            //     valueRange = 8f..48f,
                            //     steps = 39
                            // )
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
                        // Reading mode - TODO: ViewerSettings doesn't have readingMode
                        // Text("Reading Mode")
                        // Row(
                        //     modifier = Modifier.fillMaxWidth(),
                        //     horizontalArrangement = Arrangement.spacedBy(8.dp)
                        // ) {
                        //     FilterChip(
                        //         onClick = {
                        //             onSettingsChanged(settings.copy(readingMode = ReadingMode.SINGLE_PAGE))
                        //         },
                        //         label = { Text("Single") },
                        //         selected = settings.readingMode == ReadingMode.SINGLE_PAGE
                        //     )
                        //     FilterChip(
                        //         onClick = {
                        //             onSettingsChanged(settings.copy(readingMode = ReadingMode.DOUBLE_PAGE))
                        //         },
                        //         label = { Text("Double") },
                        //         selected = settings.readingMode == ReadingMode.DOUBLE_PAGE
                        //     )
                        //     FilterChip(
                        //         onClick = {
                        //             onSettingsChanged(settings.copy(readingMode = ReadingMode.CONTINUOUS_SCROLL))
                        //         },
                        //         label = { Text("Scroll") },
                        //         selected = settings.readingMode == ReadingMode.CONTINUOUS_SCROLL
                        //     )
                        // }

                        // Reading direction - TODO: ViewerSettings doesn't have readingDirection
                        // Text("Reading Direction")
                        // Row(
                        //     modifier = Modifier.fillMaxWidth(),
                        //     horizontalArrangement = Arrangement.spacedBy(8.dp)
                        // ) {
                        //     FilterChip(
                        //         onClick = {
                        //             onSettingsChanged(settings.copy(readingDirection = ReadingDirection.LEFT_TO_RIGHT))
                        //         },
                        //         label = { Text("L → R") },
                        //         selected = settings.readingDirection == ReadingDirection.LEFT_TO_RIGHT
                        //     )
                        //     FilterChip(
                        //         onClick = {
                        //             onSettingsChanged(settings.copy(readingDirection = ReadingDirection.RIGHT_TO_LEFT))
                        //         },
                        //         label = { Text("R → L") },
                        //         selected = settings.readingDirection == ReadingDirection.RIGHT_TO_LEFT
                        //     )
                        // }

                        // Volume keys navigation - TODO: Add to ViewerSettings
                        // Row(
                        //     modifier = Modifier.fillMaxWidth(),
                        //     horizontalArrangement = Arrangement.SpaceBetween,
                        //     verticalAlignment = Alignment.CenterVertically
                        // ) {
                        //     Text("Volume Keys Navigation")
                        //     Switch(
                        //         checked = settings.volumeKeysForNavigation,
                        //         onCheckedChange = {
                        //             onSettingsChanged(settings.copy(volumeKeysForNavigation = it))
                        //         }
                        //     )
                        // }

                        // Auto bookmarks - TODO: Add to ViewerSettings
                        // Row(
                        //     modifier = Modifier.fillMaxWidth(),
                        //     horizontalArrangement = Arrangement.SpaceBetween,
                        //     verticalAlignment = Alignment.CenterVertically
                        // ) {
                        //     Text("Auto Bookmarks")
                        //     Switch(
                        //         checked = settings.autoBookmarks,
                        //         onCheckedChange = {
                        //             onSettingsChanged(settings.copy(autoBookmarks = it))
                        //         }
                        //     )
                        // }

                        // Reading analytics - TODO: Add to ViewerSettings
                        // Row(
                        //     modifier = Modifier.fillMaxWidth(),
                        //     horizontalArrangement = Arrangement.SpaceBetween,
                        //     verticalAlignment = Alignment.CenterVertically
                        // ) {
                        //     Text("Reading Analytics")
                        //     Switch(
                        //         checked = settings.readingAnalytics,
                        //         onCheckedChange = {
                        //             onSettingsChanged(settings.copy(readingAnalytics = it))
                        //         }
                        //     )
                        // }
                    }
                }
            }

            // Gestures - TODO: Add doubleTapToZoom and pinchToZoom to ViewerSettings
            // item {
            //     SettingsCard(title = "Gestures") {
            //         Column(
            //             verticalArrangement = Arrangement.spacedBy(16.dp)
            //         ) {
            //             Row(
            //                 modifier = Modifier.fillMaxWidth(),
            //                 horizontalArrangement = Arrangement.SpaceBetween,
            //                 verticalAlignment = Alignment.CenterVertically
            //             ) {
            //                 Text("Double Tap to Zoom")
            //                 Switch(
            //                     checked = settings.doubleTapToZoom,
            //                     onCheckedChange = {
            //                         onSettingsChanged(settings.copy(doubleTapToZoom = it))
            //                     }
            //                 )
            //             }

            //             Row(
            //                 modifier = Modifier.fillMaxWidth(),
            //                 horizontalArrangement = Arrangement.SpaceBetween,
            //                 verticalAlignment = Alignment.CenterVertically
            //             ) {
            //                 Text("Pinch to Zoom")
            //                 Switch(
            //                     checked = settings.pinchToZoom,
            //                     onCheckedChange = {
            //                         onSettingsChanged(settings.copy(pinchToZoom = it))
            //                     }
            //                 )
            //             }
            //         }
            //     }
            // }
        }
    }
}

@Composable
private fun SettingsCard(
    title: String,
    content: @Composable () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = title,
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Medium,
                modifier = Modifier.padding(bottom = 12.dp)
            )
            content()
        }
    }
}

@Composable
fun SearchDialog(
    searchQuery: String,
    searchResults: List<SearchResult>,
    currentSearchIndex: Int,
    onDismiss: () -> Unit,
    onSearch: (String) -> Unit,
    onNavigateToResult: (Int) -> Unit
) {
    Dialog(onDismissRequest = onDismiss) {
        Card(
            modifier = Modifier
                .fillMaxWidth()
                .fillMaxHeight(0.8f),
            colors = CardDefaults.cardColors(
                containerColor = MaterialTheme.colorScheme.surface
            )
        ) {
            Column(
                modifier = Modifier.padding(16.dp)
            ) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Search in Document",
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.Medium
                    )
                    IconButton(onClick = onDismiss) {
                        Icon(Icons.Default.Close, contentDescription = "Close")
                    }
                }

                Spacer(modifier = Modifier.height(16.dp))

                var query by remember { mutableStateOf(searchQuery) }
                val keyboardController = LocalSoftwareKeyboardController.current

                OutlinedTextField(
                    value = query,
                    onValueChange = { query = it },
                    label = { Text("Search text") },
                    placeholder = { Text("Enter text to search") },
                    modifier = Modifier.fillMaxWidth(),
                    keyboardOptions = KeyboardOptions(imeAction = ImeAction.Search),
                    keyboardActions = KeyboardActions(
                        onSearch = {
                            onSearch(query)
                            keyboardController?.hide()
                        }
                    ),
                    trailingIcon = {
                        Row {
                            if (query.isNotEmpty()) {
                                IconButton(onClick = { query = "" }) {
                                    Icon(Icons.Default.Clear, contentDescription = "Clear")
                                }
                            }
                            IconButton(
                                onClick = {
                                    onSearch(query)
                                    keyboardController?.hide()
                                }
                            ) {
                                Icon(Icons.Default.Search, contentDescription = "Search")
                            }
                        }
                    }
                )

                if (searchResults.isNotEmpty()) {
                    Spacer(modifier = Modifier.height(16.dp))

                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = "${searchResults.size} results found",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )

                        if (searchResults.size > 1) {
                            Row {
                                IconButton(
                                    onClick = {
                                        val newIndex = if (currentSearchIndex > 0)
                                            currentSearchIndex - 1
                                        else
                                            searchResults.size - 1
                                        onNavigateToResult(newIndex)
                                    }
                                ) {
                                    Icon(Icons.Default.KeyboardArrowUp, contentDescription = "Previous")
                                }
                                Text(
                                    text = "${currentSearchIndex + 1}",
                                    style = MaterialTheme.typography.bodyMedium,
                                    modifier = Modifier.align(Alignment.CenterVertically)
                                )
                                IconButton(
                                    onClick = {
                                        val newIndex = if (currentSearchIndex < searchResults.size - 1)
                                            currentSearchIndex + 1
                                        else
                                            0
                                        onNavigateToResult(newIndex)
                                    }
                                ) {
                                    Icon(Icons.Default.KeyboardArrowDown, contentDescription = "Next")
                                }
                            }
                        }
                    }

                    Spacer(modifier = Modifier.height(8.dp))

                    LazyColumn {
                        items(searchResults.withIndex().toList()) { (index, result) ->
                            SearchResultItem(
                                result = result,
                                isSelected = index == currentSearchIndex,
                                onClick = { onNavigateToResult(index) }
                            )
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun SearchResultItem(
    result: SearchResult,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp)
            .clickable { onClick() },
        colors = CardDefaults.cardColors(
            containerColor = if (isSelected)
                MaterialTheme.colorScheme.primaryContainer
            else
                MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier.padding(12.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text(
                    text = "Page ${result.page}",
                    style = MaterialTheme.typography.labelMedium,
                    color = MaterialTheme.colorScheme.primary
                )
            }
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = result.context,
                style = MaterialTheme.typography.bodySmall,
                maxLines = 3,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun BookmarksSheet(
    bookmarks: List<Bookmark>,
    onDismiss: () -> Unit,
    onBookmarkSelected: (Bookmark) -> Unit,
    onBookmarkDeleted: (Bookmark) -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        modifier = Modifier.fillMaxHeight(0.7f)
    ) {
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            item {
                Text(
                    text = "Bookmarks",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Medium,
                    modifier = Modifier.padding(bottom = 16.dp)
                )
            }

            if (bookmarks.isEmpty()) {
                item {
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.surfaceVariant
                        )
                    ) {
                        Column(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(24.dp),
                            horizontalAlignment = Alignment.CenterHorizontally
                        ) {
                            Icon(
                                Icons.Default.BookmarkBorder,
                                contentDescription = null,
                                modifier = Modifier.size(48.dp),
                                tint = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.6f)
                            )
                            Spacer(modifier = Modifier.height(16.dp))
                            Text(
                                text = "No bookmarks yet",
                                style = MaterialTheme.typography.titleMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                            Text(
                                text = "Tap the bookmark icon while reading to add one",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.7f),
                                textAlign = TextAlign.Center
                            )
                        }
                    }
                }
            } else {
                items(bookmarks) { bookmark ->
                    BookmarkItem(
                        bookmark = bookmark,
                        onBookmarkSelected = onBookmarkSelected,
                        onBookmarkDeleted = onBookmarkDeleted
                    )
                }
            }
        }
    }
}

@Composable
private fun BookmarkItem(
    bookmark: Bookmark,
    onBookmarkSelected: (Bookmark) -> Unit,
    onBookmarkDeleted: (Bookmark) -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp)
            .clickable { onBookmarkSelected(bookmark) },
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = bookmark.title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = "Page ${bookmark.page}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                bookmark.note?.let { note ->
                    if (note.isNotEmpty()) {
                        Spacer(modifier = Modifier.height(4.dp))
                        Text(
                            text = note,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.7f),
                            maxLines = 2,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                }
            }

            IconButton(
                onClick = { onBookmarkDeleted(bookmark) }
            ) {
                Icon(
                    Icons.Default.Delete,
                    contentDescription = "Delete bookmark",
                    tint = MaterialTheme.colorScheme.error
                )
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TableOfContentsSheet(
    chapters: List<TableOfContentsItem>,
    currentChapter: String?,
    onDismiss: () -> Unit,
    onChapterSelected: (TableOfContentsItem) -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        modifier = Modifier.fillMaxHeight(0.7f)
    ) {
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            item {
                Text(
                    text = "Table of Contents",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Medium,
                    modifier = Modifier.padding(bottom = 16.dp)
                )
            }

            if (chapters.isEmpty()) {
                item {
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.surfaceVariant
                        )
                    ) {
                        Column(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(24.dp),
                            horizontalAlignment = Alignment.CenterHorizontally
                        ) {
                            Icon(
                                Icons.Default.MenuBook,
                                contentDescription = null,
                                modifier = Modifier.size(48.dp),
                                tint = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.6f)
                            )
                            Spacer(modifier = Modifier.height(16.dp))
                            Text(
                                text = "No table of contents available",
                                style = MaterialTheme.typography.titleMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                }
            } else {
                items(chapters) { chapter ->
                    TableOfContentsItem(
                        chapter = chapter,
                        currentChapter = currentChapter,
                        onChapterSelected = onChapterSelected
                    )
                }
            }
        }
    }
}

@Composable
private fun TableOfContentsItem(
    chapter: TableOfContentsItem,
    currentChapter: String?,
    onChapterSelected: (TableOfContentsItem) -> Unit
) {
    val isCurrentChapter = currentChapter == chapter.title

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 2.dp)
            .clickable { onChapterSelected(chapter) },
        colors = CardDefaults.cardColors(
            containerColor = if (isCurrentChapter)
                MaterialTheme.colorScheme.primaryContainer
            else
                MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(
                    start = (16 + chapter.level * 16).dp,
                    end = 16.dp,
                    top = 12.dp,
                    bottom = 12.dp
                ),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = chapter.title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = if (isCurrentChapter) FontWeight.SemiBold else FontWeight.Normal,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    color = if (isCurrentChapter)
                        MaterialTheme.colorScheme.onPrimaryContainer
                    else
                        MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Text(
                text = chapter.page.toString(),
                style = MaterialTheme.typography.bodySmall,
                color = if (isCurrentChapter)
                    MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                else
                    MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.7f)
            )
        }
    }
}
