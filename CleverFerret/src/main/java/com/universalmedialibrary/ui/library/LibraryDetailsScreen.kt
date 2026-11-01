package com.universalmedialibrary.ui.library

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.GridItemSpan
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.CheckBox
import androidx.compose.material.icons.filled.CheckBoxOutlineBlank
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.ui.icons.PhosphorIcons
import com.universalmedialibrary.ui.selection.GlobalSelectionViewModel
import com.universalmedialibrary.ui.selection.SelectedMediaItem

/**
 * Library details screen showing the contents of a specific library.
 * Converted from React LibraryDetailsScreen component.
 * Now integrated with Room database via ViewModel.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LibraryDetailsScreen(
    libraryId: Int,
    onNavigateBack: () -> Unit = {},
    onNavigateToMediaViewer: (Int) -> Unit = {},
    viewModel: LibraryDetailsScreenViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val selectionViewModel: GlobalSelectionViewModel = hiltViewModel()
    val selectionState by selectionViewModel.selectionState.collectAsStateWithLifecycle()
    var selectionMode by remember { mutableStateOf(false) }
    var isSettingsExpanded by remember { mutableStateOf(false) }

    LaunchedEffect(selectionState.totalCount) {
        if (selectionState.totalCount == 0 && selectionMode) {
            selectionMode = false
        }
    }

    // Load library details on composition
    LaunchedEffect(libraryId) {
        viewModel.loadLibraryDetails(libraryId.toLong())
    }

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(MaterialTheme.colorScheme.background)
    ) {
        Column {
            // App Bar
            TopAppBar(
                title = {
                    Text(
                        text = uiState.library?.name ?: "Library Contents",
                        style = MaterialTheme.typography.titleLarge,
                        color = MaterialTheme.colorScheme.onSurface
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(
                            PhosphorIcons.ArrowLeft,
                            contentDescription = "Back",
                            tint = MaterialTheme.colorScheme.onSurface
                        )
                    }
                },
                actions = {
                    IconButton(onClick = { selectionMode = !selectionMode }) {
                        Icon(
                            imageVector = if (selectionMode) Icons.Filled.CheckBox else Icons.Filled.CheckBoxOutlineBlank,
                            contentDescription = "Toggle Selection",
                            tint = MaterialTheme.colorScheme.onSurface
                        )
                    }
                    IconButton(onClick = { viewModel.refresh(libraryId.toLong()) }) {
                        Icon(
                            PhosphorIcons.ArrowClockwise,
                            contentDescription = "Refresh",
                            tint = MaterialTheme.colorScheme.onSurface
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.surfaceContainer,
                    titleContentColor = MaterialTheme.colorScheme.onSurface
                )
            )

            // Main content
            LazyVerticalGrid(
                columns = GridCells.Adaptive(minSize = 160.dp),
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp),
                contentPadding = PaddingValues(16.dp),
                modifier = Modifier.fillMaxSize()
            ) {
                // Header section
                item(span = { GridItemSpan(maxLineSpan) }) {
                    Column {
                        Text(
                            text = uiState.library?.name ?: "Library",
                            style = MaterialTheme.typography.headlineMedium,
                            fontWeight = FontWeight.Light,
                            color = MaterialTheme.colorScheme.onBackground
                        )

                        Spacer(modifier = Modifier.height(4.dp))

                        val itemCount = uiState.mediaItems.size
                        val libraryType = uiState.library?.type?.lowercase() ?: "mixed"
                        Text(
                            text = "$itemCount items • $libraryType media",
                            style = MaterialTheme.typography.bodyLarge,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )

                        Spacer(modifier = Modifier.height(16.dp))

                        // Metadata management actions
                        Row(
                            horizontalArrangement = Arrangement.spacedBy(12.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            // Bulk API Search button
                            Surface(
                                modifier = Modifier
                                    .clip(RoundedCornerShape(12.dp))
                                    .clickable { /* Handle bulk API metadata search */ },
                                color = MaterialTheme.colorScheme.primaryContainer
                            ) {
                                Row(
                                    modifier = Modifier.padding(horizontal = 12.dp, vertical = 8.dp),
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                                ) {
                                    Icon(
                                        imageVector = PhosphorIcons.MagnifyingGlass,
                                        contentDescription = "Search all metadata",
                                        modifier = Modifier.size(16.dp),
                                        tint = MaterialTheme.colorScheme.onPrimaryContainer
                                    )
                                    Text(
                                        text = "Find Metadata",
                                        style = MaterialTheme.typography.labelMedium,
                                        color = MaterialTheme.colorScheme.onPrimaryContainer
                                    )
                                }
                            }

                            // Bulk Edit button
                            Surface(
                                modifier = Modifier
                                    .clip(RoundedCornerShape(12.dp))
                                    .clickable { /* Handle bulk metadata edit */ },
                                color = MaterialTheme.colorScheme.secondaryContainer
                            ) {
                                Row(
                                    modifier = Modifier.padding(horizontal = 12.dp, vertical = 8.dp),
                                    verticalAlignment = Alignment.CenterVertically,
                                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                                ) {
                                    Icon(
                                        imageVector = PhosphorIcons.Pencil,
                                        contentDescription = "Edit metadata",
                                        modifier = Modifier.size(16.dp),
                                        tint = MaterialTheme.colorScheme.onSecondaryContainer
                                    )
                                    Text(
                                        text = "Edit Metadata",
                                        style = MaterialTheme.typography.labelMedium,
                                        color = MaterialTheme.colorScheme.onSecondaryContainer
                                    )
                                }
                            }
                        }
                        Spacer(modifier = Modifier.height(24.dp))
                    }
                }

                // Scan Settings (Collapsible)
                if (uiState.scanSettings != null) {
                    item(span = { GridItemSpan(maxLineSpan) }) {
                        Column {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .clip(RoundedCornerShape(8.dp))
                                    .clickable { isSettingsExpanded = !isSettingsExpanded }
                                    .padding(vertical = 8.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Text(
                                    "Library Scan Preferences",
                                    style = MaterialTheme.typography.titleMedium,
                                    color = MaterialTheme.colorScheme.onBackground
                                )
                                Icon(
                                    imageVector = if (isSettingsExpanded) PhosphorIcons.CaretUp else PhosphorIcons.CaretDown,
                                    contentDescription = if (isSettingsExpanded) "Collapse" else "Expand",
                                    tint = MaterialTheme.colorScheme.onBackground
                                )
                            }

                            if (isSettingsExpanded) {
                                uiState.scanSettings?.let { settings ->
                                    LibraryScanSettingsCard(
                                        settings = settings,
                                        onSave = viewModel::updateScanSettings
                                    )
                                }
                            }
                            Spacer(modifier = Modifier.height(16.dp))
                        }
                    }
                }

                // History
                item(span = { GridItemSpan(maxLineSpan) }) {
                    Column {
                        HistoryInsightsCard(
                            topItems = uiState.topHistory,
                            dailyCounts = uiState.dailyCounts
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                    }
                }

                // Error handling
                if (uiState.error != null) {
                    item(span = { GridItemSpan(maxLineSpan) }) {
                        Column {
                            Card(
                                modifier = Modifier.fillMaxWidth(),
                                colors = CardDefaults.cardColors(
                                    containerColor = MaterialTheme.colorScheme.errorContainer
                                )
                            ) {
                                Text(
                                    text = "Error: ${uiState.error}",
                                    modifier = Modifier.padding(16.dp),
                                    color = MaterialTheme.colorScheme.onErrorContainer
                                )
                            }
                            Spacer(modifier = Modifier.height(16.dp))
                        }
                    }
                }

                // Loading state
                if (uiState.isLoading) {
                    item(span = { GridItemSpan(maxLineSpan) }) {
                        Box(
                            modifier = Modifier.fillMaxWidth().height(200.dp),
                            contentAlignment = Alignment.Center
                        ) {
                            Column(
                                horizontalAlignment = Alignment.CenterHorizontally,
                                verticalArrangement = Arrangement.spacedBy(16.dp)
                            ) {
                                CircularProgressIndicator(color = MaterialTheme.colorScheme.primary)
                                Text(
                                    text = "Loading media items...",
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }
                    }
                } else if (uiState.mediaItems.isEmpty()) {
                    // Empty state
                    item(span = { GridItemSpan(maxLineSpan) }) {
                        Box(
                            modifier = Modifier.fillMaxWidth().height(200.dp),
                            contentAlignment = Alignment.Center
                        ) {
                            Column(
                                horizontalAlignment = Alignment.CenterHorizontally,
                                verticalArrangement = Arrangement.spacedBy(16.dp)
                            ) {
                                Icon(
                                    PhosphorIcons.FolderOpen,
                                    contentDescription = "Media image",
                                    modifier = Modifier.size(64.dp),
                                    tint = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.6f)
                                )
                                Text(
                                    text = "No media items found",
                                    style = MaterialTheme.typography.headlineSmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                                Text(
                                    text = "Add some files to this library to get started",
                                    style = MaterialTheme.typography.bodyMedium,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.8f)
                                )
                            }
                        }
                    }
                } else {
                    val selectionEnabled = selectionMode || selectionState.totalCount > 0

                    // Media items grid
                    items(uiState.mediaItems) { mediaItemWithMetadata ->
                        val mediaData = mediaItemWithMetadata.toMediaItemData()
                        MediaItem(
                            item = mediaData,
                            onClick = { onNavigateToMediaViewer(mediaItemWithMetadata.mediaItem.itemId.toInt()) },
                            selectionEnabled = selectionEnabled,
                            isSelected = selectionState.isSelected(mediaItemWithMetadata.mediaItem.itemId),
                            onSelectionToggle = {
                                selectionViewModel.toggle(
                                    SelectedMediaItem(
                                        id = mediaItemWithMetadata.mediaItem.itemId,
                                        title = mediaData.title,
                                        type = mediaItemWithMetadata.mediaItem.mediaType,
                                        libraryId = mediaItemWithMetadata.mediaItem.libraryId
                                    )
                                )
                            }
                        )
                    }
                }
            }
        }

        if (selectionState.totalCount > 0) {
            GlobalSelectionBar(
                selectionState = selectionState,
                onClear = selectionViewModel::clear,
                modifier = Modifier.align(Alignment.BottomCenter)
            )
        }
    }
}
