package com.universalmedialibrary.ui.reader.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Rect
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.universalmedialibrary.ui.viewer.common.ComicSettings
import com.universalmedialibrary.ui.viewer.common.ReadingDirection
import com.universalmedialibrary.ui.viewer.common.ReadingMode
import com.universalmedialibrary.ui.viewer.common.ViewerSettings

@Composable
fun TopComicControls(
    title: String,
    currentPage: Int,
    totalPages: Int,
    currentPanel: Int,
    totalPanels: Int,
    panelByPanelMode: Boolean,
    onBack: () -> Unit,
    onPanelBrowser: () -> Unit,
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
                    text = if (panelByPanelMode && totalPanels > 1) {
                        "Page $currentPage/$totalPages • Panel ${currentPanel + 1}/$totalPanels"
                    } else {
                        "Page $currentPage of $totalPages"
                    },
                    style = MaterialTheme.typography.bodySmall,
                    color = Color.White.copy(alpha = 0.7f)
                )
            }

            Row {
                IconButton(onClick = onPanelBrowser) {
                    Icon(
                        Icons.Default.GridView,
                        contentDescription = "Panel Browser",
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
fun BottomComicControls(
    currentPage: Int,
    totalPages: Int,
    currentPanel: Int,
    totalPanels: Int,
    panelByPanelMode: Boolean,
    readingDirection: ReadingDirection,
    canGoPrevious: Boolean,
    canGoNext: Boolean,
    onPreviousPage: () -> Unit,
    onNextPage: () -> Unit,
    onPreviousPanel: () -> Unit,
    onNextPanel: () -> Unit,
    onPageSeek: (Int) -> Unit,
    onTogglePanelMode: () -> Unit
) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(120.dp)
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
            // Page progress slider
            if (!panelByPanelMode) {
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
            }

            // Navigation controls
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Previous button
                val previousAction = if (panelByPanelMode && currentPanel > 0) {
                    onPreviousPanel
                } else {
                    onPreviousPage
                }

                IconButton(
                    onClick = previousAction,
                    enabled = canGoPrevious
                ) {
                    Icon(
                        imageVector = if (readingDirection == ReadingDirection.RIGHT_TO_LEFT) {
                            Icons.Default.NavigateNext
                        } else {
                            Icons.Default.NavigateBefore
                        },
                        contentDescription = "Previous",
                        tint = if (canGoPrevious) Color.White else Color.White.copy(alpha = 0.3f),
                        modifier = Modifier.size(32.dp)
                    )
                }

                // Panel mode toggle
                if (totalPanels > 1) {
                    FilledTonalButton(
                        onClick = onTogglePanelMode,
                        colors = ButtonDefaults.filledTonalButtonColors(
                            containerColor = if (panelByPanelMode)
                                MaterialTheme.colorScheme.primary
                            else
                                Color.White.copy(alpha = 0.2f)
                        )
                    ) {
                        Icon(
                            Icons.Default.CropFree,
                            contentDescription = "Panel Mode",
                            modifier = Modifier.size(16.dp)
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text(
                            text = if (panelByPanelMode) "Panel" else "Page",
                            style = MaterialTheme.typography.bodySmall
                        )
                    }
                }

                // Page indicator
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = Color.White.copy(alpha = 0.2f)
                    ),
                    shape = RoundedCornerShape(12.dp)
                ) {
                    Column(
                        modifier = Modifier.padding(horizontal = 12.dp, vertical = 8.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "$currentPage/$totalPages",
                            color = Color.White,
                            style = MaterialTheme.typography.bodySmall,
                            fontWeight = FontWeight.Medium
                        )
                        if (panelByPanelMode && totalPanels > 1) {
                            Text(
                                text = "P${currentPanel + 1}/$totalPanels",
                                color = Color.White.copy(alpha = 0.7f),
                                style = MaterialTheme.typography.labelSmall
                            )
                        }
                    }
                }

                // Next button
                val nextAction = if (panelByPanelMode && currentPanel < totalPanels - 1) {
                    onNextPanel
                } else {
                    onNextPage
                }

                IconButton(
                    onClick = nextAction,
                    enabled = canGoNext
                ) {
                    Icon(
                        imageVector = if (readingDirection == ReadingDirection.RIGHT_TO_LEFT) {
                            Icons.Default.NavigateBefore
                        } else {
                            Icons.Default.NavigateNext
                        },
                        contentDescription = "Next",
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
fun ComicReaderSettingsSheet(
    settings: ViewerSettings,
    comicSettings: ComicSettings,
    onDismiss: () -> Unit,
    onSettingsChanged: (ViewerSettings) -> Unit,
    onComicSettingsChanged: (ComicSettings) -> Unit
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
                    text = "Comic Reading Settings",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Medium
                )
            }

            // Reading Mode
            item {
                SettingsCard(title = "Reading Mode") {
                    Column(
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            FilterChip(
                                onClick = {
                                    onSettingsChanged(settings.copy(readingMode = ReadingMode.SINGLE_PAGE))
                                },
                                label = { Text("Single Page") },
                                selected = settings.readingMode == ReadingMode.SINGLE_PAGE,
                                modifier = Modifier.weight(1f)
                            )
                            FilterChip(
                                onClick = {
                                    onSettingsChanged(settings.copy(readingMode = ReadingMode.DOUBLE_PAGE))
                                },
                                label = { Text("Double Page") },
                                selected = settings.readingMode == ReadingMode.DOUBLE_PAGE,
                                modifier = Modifier.weight(1f)
                            )
                        }
                        FilterChip(
                            onClick = {
                                onSettingsChanged(settings.copy(readingMode = ReadingMode.CONTINUOUS_SCROLL))
                                onComicSettingsChanged(comicSettings.copy(webtoonMode = true))
                            },
                            label = { Text("Webtoon (Continuous Scroll)") },
                            selected = settings.readingMode == ReadingMode.CONTINUOUS_SCROLL,
                            modifier = Modifier.fillMaxWidth()
                        )
                    }
                }
            }

            // Reading Direction
            item {
                SettingsCard(title = "Reading Direction") {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        FilterChip(
                            onClick = {
                                onSettingsChanged(settings.copy(readingDirection = ReadingDirection.LEFT_TO_RIGHT))
                            },
                            label = { Text("Left to Right") },
                            selected = settings.readingDirection == ReadingDirection.LEFT_TO_RIGHT,
                            modifier = Modifier.weight(1f)
                        )
                        FilterChip(
                            onClick = {
                                onSettingsChanged(settings.copy(readingDirection = ReadingDirection.RIGHT_TO_LEFT))
                            },
                            label = { Text("Right to Left") },
                            selected = settings.readingDirection == ReadingDirection.RIGHT_TO_LEFT,
                            modifier = Modifier.weight(1f)
                        )
                    }
                }
            }

            // Panel Settings
            item {
                SettingsCard(title = "Panel Settings") {
                    Column(
                        verticalArrangement = Arrangement.spacedBy(16.dp)
                    ) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Panel-by-Panel Mode")
                            Switch(
                                checked = comicSettings.panelByPanelMode,
                                onCheckedChange = {
                                    onComicSettingsChanged(comicSettings.copy(panelByPanelMode = it))
                                }
                            )
                        }

                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Smart Panel Detection")
                            Switch(
                                checked = comicSettings.smartPanelDetection,
                                onCheckedChange = {
                                    onComicSettingsChanged(comicSettings.copy(smartPanelDetection = it))
                                }
                            )
                        }

                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Zoom on Panel Focus")
                            Switch(
                                checked = comicSettings.zoomOnPanelFocus,
                                onCheckedChange = {
                                    onComicSettingsChanged(comicSettings.copy(zoomOnPanelFocus = it))
                                }
                            )
                        }

                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Show Panel Borders")
                            Switch(
                                checked = comicSettings.showPanelBorders,
                                onCheckedChange = {
                                    onComicSettingsChanged(comicSettings.copy(showPanelBorders = it))
                                }
                            )
                        }

                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Panel Navigation Hints")
                            Switch(
                                checked = comicSettings.panelNavigationHints,
                                onCheckedChange = {
                                    onComicSettingsChanged(comicSettings.copy(panelNavigationHints = it))
                                }
                            )
                        }

                        // Panel transition duration
                        Text("Panel Transition: ${comicSettings.panelTransitionDuration}ms")
                        Slider(
                            value = comicSettings.panelTransitionDuration.toFloat(),
                            onValueChange = {
                                onComicSettingsChanged(comicSettings.copy(panelTransitionDuration = it.toLong()))
                            },
                            valueRange = 100f..1000f,
                            steps = 8
                        )
                    }
                }
            }

            // Display Settings
            item {
                SettingsCard(title = "Display") {
                    Column(
                        verticalArrangement = Arrangement.spacedBy(16.dp)
                    ) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Crop White Space")
                            Switch(
                                checked = comicSettings.cropWhiteSpace,
                                onCheckedChange = {
                                    onComicSettingsChanged(comicSettings.copy(cropWhiteSpace = it))
                                }
                            )
                        }

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

                        // Brightness
                        Text("Brightness: ${(settings.brightness * 100).toInt()}%")
                        Slider(
                            value = settings.brightness,
                            onValueChange = {
                                onSettingsChanged(settings.copy(brightness = it))
                            },
                            valueRange = 0.1f..1f
                        )
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
                    }
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PanelBrowserSheet(
    pages: List<String>,
    currentPage: Int,
    panels: Map<Int, List<Rect>>,
    onDismiss: () -> Unit,
    onPageSelected: (Int) -> Unit,
    onPanelSelected: (Int, Int) -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        modifier = Modifier.fillMaxHeight(0.9f)
    ) {
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            item {
                Text(
                    text = "Panel Browser",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Medium,
                    modifier = Modifier.padding(bottom = 16.dp)
                )
            }

            items(pages.withIndex().toList()) { (pageIndex, pageUri) ->
                val pageNumber = pageIndex + 1
                val pagePanels = panels[pageNumber] ?: emptyList()

                PageBrowserItem(
                    pageNumber = pageNumber,
                    pageUri = pageUri,
                    panels = pagePanels,
                    isCurrentPage = pageNumber == currentPage,
                    onPageSelected = onPageSelected,
                    onPanelSelected = { panelIndex ->
                        onPanelSelected(pageNumber, panelIndex)
                    }
                )
            }
        }
    }
}

@Composable
private fun PageBrowserItem(
    pageNumber: Int,
    pageUri: String,
    panels: List<Rect>,
    isCurrentPage: Boolean,
    onPageSelected: (Int) -> Unit,
    onPanelSelected: (Int) -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 8.dp),
        colors = CardDefaults.cardColors(
            containerColor = if (isCurrentPage)
                MaterialTheme.colorScheme.primaryContainer
            else
                MaterialTheme.colorScheme.surfaceVariant
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
                    text = "Page $pageNumber",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium
                )

                if (panels.isNotEmpty()) {
                    Text(
                        text = "${panels.size} panels",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            Spacer(modifier = Modifier.height(12.dp))

            // Page thumbnail
            AsyncImage(
                model = ImageRequest.Builder(LocalContext.current)
                    .data(pageUri)
                    .crossfade(true)
                    .build(),
                contentDescription = "Page $pageNumber",
                modifier = Modifier
                    .fillMaxWidth()
                    .height(200.dp)
                    .clip(RoundedCornerShape(8.dp))
                    .clickable { onPageSelected(pageNumber) },
                contentScale = ContentScale.Fit
            )

            // Panel thumbnails
            if (panels.isNotEmpty()) {
                Spacer(modifier = Modifier.height(12.dp))

                LazyRow(
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(panels.withIndex().toList()) { (panelIndex, panel) ->
                        Card(
                            modifier = Modifier
                                .size(80.dp)
                                .clickable { onPanelSelected(panelIndex) },
                            colors = CardDefaults.cardColors(
                                containerColor = MaterialTheme.colorScheme.surface
                            )
                        ) {
                            Box(
                                modifier = Modifier.fillMaxSize(),
                                contentAlignment = Alignment.Center
                            ) {
                                Text(
                                    text = "${panelIndex + 1}",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurface
                                )
                            }
                        }
                    }
                }
            }
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
