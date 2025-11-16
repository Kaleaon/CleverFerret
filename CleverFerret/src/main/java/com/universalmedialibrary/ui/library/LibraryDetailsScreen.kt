package com.universalmedialibrary.ui.library

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material.icons.filled.CheckBox
import androidx.compose.material.icons.filled.CheckBoxOutlineBlank
import androidx.compose.material.icons.filled.Delete
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.data.local.entity.LibraryScanSettings
import com.universalmedialibrary.data.local.entity.ListenHistoryDailyCount
import com.universalmedialibrary.data.local.entity.ListenHistoryTopItem
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
    viewModel: LibraryDetailsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val selectionViewModel: GlobalSelectionViewModel = hiltViewModel()
    val selectionState by selectionViewModel.selectionState.collectAsStateWithLifecycle()
    var selectionMode by remember { mutableStateOf(false) }

    LaunchedEffect(selectionState.totalCount) {
        if (selectionState.totalCount == 0 && selectionMode) {
            selectionMode = false
        }
    }

    // Plex-inspired colors
    val backgroundColor = Color(0xFF1A1A1A)
    val surfaceColor = Color(0xFF1F2326)
    val primaryColor = Color(0xFFE5A00D)

    // Load library details on composition
    LaunchedEffect(libraryId) {
        viewModel.loadLibraryDetails(libraryId.toLong())
        viewModel.createSampleMediaItems(libraryId.toLong())
    }

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(backgroundColor)
    ) {
        Column {
            // App Bar
            TopAppBar(
                title = {
                    Text(
                        text = uiState.library?.name ?: "Library Contents",
                        style = MaterialTheme.typography.titleLarge,
                        color = Color.White
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(
                            PhosphorIcons.ArrowLeft,
                            contentDescription = "Back",
                            tint = Color.White
                        )
                    }
                },
                actions = {
                    IconButton(onClick = { selectionMode = !selectionMode }) {
                        Icon(
                            imageVector = if (selectionMode) Icons.Filled.CheckBox else Icons.Filled.CheckBoxOutlineBlank,
                            contentDescription = "Toggle Selection",
                            tint = Color.White
                        )
                    }
                    IconButton(onClick = { viewModel.refresh(libraryId.toLong()) }) {
                        Icon(
                            PhosphorIcons.ArrowClockwise,
                            contentDescription = "Refresh",
                            tint = Color.White
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = surfaceColor,
                    titleContentColor = Color.White
                )
            )

            // Main content
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(16.dp)
            ) {
                // Header section
                Text(
                    text = uiState.library?.name ?: "Library",
                    style = MaterialTheme.typography.headlineMedium,
                    fontWeight = FontWeight.Light,
                    color = Color.White
                )

                Spacer(modifier = Modifier.height(4.dp))

                val itemCount = uiState.mediaItems.size
                val libraryType = uiState.library?.type?.lowercase() ?: "mixed"
                Text(
                    text = "$itemCount items • $libraryType media",
                    style = MaterialTheme.typography.bodyLarge,
                    color = Color(0xFFB3B3B3)
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
                        color = Color(0xFF2C5F2D).copy(alpha = 0.4f)
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
                                tint = Color(0xFF97BC62)
                            )
                            Text(
                                text = "Find Metadata",
                                style = MaterialTheme.typography.labelMedium,
                                color = Color(0xFF97BC62)
                            )
                        }
                    }

                    // Bulk Edit button
                    Surface(
                        modifier = Modifier
                            .clip(RoundedCornerShape(12.dp))
                            .clickable { /* Handle bulk metadata edit */ },
                        color = Color(0xFF1565C0).copy(alpha = 0.4f)
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
                                tint = Color(0xFF42A5F5)
                            )
                            Text(
                                text = "Edit Metadata",
                                style = MaterialTheme.typography.labelMedium,
                                color = Color(0xFF42A5F5)
                            )
                        }
                    }
                }

                Spacer(modifier = Modifier.height(24.dp))

                uiState.scanSettings?.let { settings ->
                    LibraryScanSettingsCard(
                        settings = settings,
                        onSave = viewModel::updateScanSettings
                    )
                    Spacer(modifier = Modifier.height(16.dp))
                }

                HistoryInsightsCard(
                    topItems = uiState.topHistory,
                    dailyCounts = uiState.dailyCounts
                )

                Spacer(modifier = Modifier.height(16.dp))

                // Error handling
                uiState.error?.let { error ->
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(
                            containerColor = Color(0xFF4A1A1A)
                        )
                    ) {
                        Text(
                            text = "Error: $error",
                            modifier = Modifier.padding(16.dp),
                            color = Color(0xFFFF6B6B)
                        )
                    }
                    Spacer(modifier = Modifier.height(16.dp))
                }

                // Loading state
                if (uiState.isLoading) {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(16.dp)
                        ) {
                            CircularProgressIndicator(color = primaryColor)
                            Text(
                                text = "Loading media items...",
                                color = Color(0xFFB3B3B3)
                            )
                        }
                    }
                } else if (uiState.mediaItems.isEmpty()) {
                    // Empty state
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(16.dp)
                        ) {
                            Icon(
                                PhosphorIcons.FolderOpen,
                                contentDescription = null,
                                modifier = Modifier.size(64.dp),
                                tint = Color(0xFF666666)
                            )
                            Text(
                                text = "No media items found",
                                style = MaterialTheme.typography.headlineSmall,
                                color = Color(0xFF666666)
                            )
                            Text(
                                text = "Add some files to this library to get started",
                                style = MaterialTheme.typography.bodyMedium,
                                color = Color(0xFF999999)
                            )
                        }
                    }
                } else {
                    val selectionEnabled = selectionMode || selectionState.totalCount > 0

                    // Media items grid
                    LazyVerticalGrid(
                        columns = GridCells.Adaptive(minSize = 250.dp),
                        horizontalArrangement = Arrangement.spacedBy(16.dp),
                        verticalArrangement = Arrangement.spacedBy(16.dp),
                        modifier = Modifier.fillMaxSize()
                    ) {
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
}

@Composable
private fun LibraryScanSettingsCard(
    settings: LibraryScanSettings,
    onSave: (LibraryScanSettings) -> Unit
) {
    var includePaths by remember(settings) { mutableStateOf(settings.includePaths) }
    var excludePaths by remember(settings) { mutableStateOf(settings.excludePaths) }
    var includeSubdirectories by remember(settings) { mutableStateOf(settings.includeSubdirectories) }
    var minFileSizeMb by remember(settings) {
        mutableStateOf(
            if (settings.minFileSizeBytes <= 0) "" else (settings.minFileSizeBytes / (1024 * 1024)).toString()
        )
    }
    var minAudioDurationSec by remember(settings) {
        mutableStateOf(
            if (settings.minAudioDurationMs <= 0) "" else (settings.minAudioDurationMs / 1000).toString()
        )
    }
    var preventDuplicates by remember(settings) { mutableStateOf(settings.preventDuplicates) }
    var dedupeStrategy by remember(settings) { mutableStateOf(settings.deduplicationStrategy) }
    var minListenSeconds by remember(settings) { mutableStateOf(settings.minListenSeconds) }
    var minListenPercent by remember(settings) { mutableStateOf(settings.minListenPercent.toFloat()) }
    var showIncludeDialog by remember { mutableStateOf(false) }
    var showExcludeDialog by remember { mutableStateOf(false) }
    var strategyExpanded by remember { mutableStateOf(false) }

    if (showIncludeDialog) {
        PathInputDialog(
            title = "Add Include Folder",
            onDismiss = { showIncludeDialog = false },
            onConfirm = { newPath ->
                includePaths = includePaths + newPath
                showIncludeDialog = false
            }
        )
    }

    if (showExcludeDialog) {
        PathInputDialog(
            title = "Add Excluded Folder",
            onDismiss = { showExcludeDialog = false },
            onConfirm = { newPath ->
                excludePaths = excludePaths + newPath
                showExcludeDialog = false
            }
        )
    }

    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(containerColor = Color(0xFF1F1F1F))
    ) {
        Column(
            verticalArrangement = Arrangement.spacedBy(12.dp),
            modifier = Modifier.padding(16.dp)
        ) {
            Text("Library Scan Preferences", style = MaterialTheme.typography.titleMedium, color = Color.White)

            PreferencePathList(
                title = "Include folders",
                paths = includePaths,
                onRemove = { includePaths = includePaths - it },
                onAddClick = { showIncludeDialog = true }
            )

            PreferencePathList(
                title = "Exclude folders",
                paths = excludePaths,
                onRemove = { excludePaths = excludePaths - it },
                onAddClick = { showExcludeDialog = true }
            )

            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text("Include subdirectories", color = Color.White)
                Switch(checked = includeSubdirectories, onCheckedChange = { includeSubdirectories = it })
            }

            OutlinedTextField(
                value = minFileSizeMb,
                onValueChange = { minFileSizeMb = it },
                label = { Text("Minimum file size (MB)") },
                modifier = Modifier.fillMaxWidth()
            )

            OutlinedTextField(
                value = minAudioDurationSec,
                onValueChange = { minAudioDurationSec = it },
                label = { Text("Minimum audio duration (seconds)") },
                modifier = Modifier.fillMaxWidth()
            )

            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text("Prevent duplicates", color = Color.White)
                Switch(checked = preventDuplicates, onCheckedChange = { preventDuplicates = it })
            }

            Box(modifier = Modifier.fillMaxWidth()) {
                OutlinedTextField(
                    value = dedupeStrategy,
                    onValueChange = {},
                    readOnly = true,
                    label = { Text("Duplicate strategy") },
                    trailingIcon = {
                        Icon(
                            imageVector = Icons.Default.ArrowDropDown,
                            contentDescription = null,
                            modifier = Modifier.clickable { strategyExpanded = !strategyExpanded }
                        )
                    },
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { strategyExpanded = true }
                )
                DropdownMenu(
                    expanded = strategyExpanded,
                    onDismissRequest = { strategyExpanded = false }
                ) {
                    strategies.forEach { strategy ->
                        DropdownMenuItem(
                            text = { Text(strategy) },
                            onClick = {
                                dedupeStrategy = strategy
                                strategyExpanded = false
                            }
                        )
                    }
                }
            }

            Column {
                Text("Minimum listen seconds: $minListenSeconds", color = Color.White)
                Slider(
                    value = minListenSeconds.toFloat(),
                    onValueChange = { minListenSeconds = it.toInt() },
                    valueRange = 5f..120f
                )
            }

            Column {
                Text("Minimum listen percent: ${minListenPercent.toInt()}%", color = Color.White)
                Slider(
                    value = minListenPercent,
                    onValueChange = { minListenPercent = it },
                    valueRange = 5f..100f
                )
            }

            Button(
                onClick = {
                    val minSizeBytes = minFileSizeMb.toLongOrNull()?.coerceAtLeast(0)?.times(1024 * 1024) ?: 0L
                    val minDurationMs = minAudioDurationSec.toLongOrNull()?.coerceAtLeast(0)?.times(1000) ?: 0L
                    onSave(
                        settings.copy(
                            includePaths = includePaths.filter { it.isNotBlank() },
                            excludePaths = excludePaths.filter { it.isNotBlank() },
                            includeSubdirectories = includeSubdirectories,
                            minFileSizeBytes = minSizeBytes,
                            minAudioDurationMs = minDurationMs,
                            preventDuplicates = preventDuplicates,
                            deduplicationStrategy = dedupeStrategy,
                            minListenSeconds = minListenSeconds,
                            minListenPercent = minListenPercent.toInt()
                        )
                    )
                },
                modifier = Modifier.align(Alignment.End)
            ) {
                Text("Save Preferences")
            }
        }
    }
}

@Composable
private fun PreferencePathList(
    title: String,
    paths: List<String>,
    onRemove: (String) -> Unit,
    onAddClick: () -> Unit
) {
    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        Text(title, color = Color.White, fontWeight = FontWeight.SemiBold)
        if (paths.isEmpty()) {
            Text("None", color = Color(0xFFB3B3B3), style = MaterialTheme.typography.bodySmall)
        } else {
            paths.forEach { path ->
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceBetween,
                    modifier = Modifier
                        .fillMaxWidth()
                        .clip(RoundedCornerShape(8.dp))
                        .background(Color(0xFF2A2A2A))
                        .padding(8.dp)
                ) {
                    Text(path, color = Color.White, modifier = Modifier.weight(1f))
                    IconButton(onClick = { onRemove(path) }) {
                        Icon(Icons.Default.Delete, contentDescription = "Remove", tint = Color(0xFFFF6B6B))
                    }
                }
            }
        }
        OutlinedButton(onClick = onAddClick) {
            Icon(Icons.Default.Add, contentDescription = null)
            Spacer(modifier = Modifier.width(8.dp))
            Text("Add path")
        }
    }
}

@Composable
private fun HistoryInsightsCard(
    topItems: List<ListenHistoryTopItem>,
    dailyCounts: List<ListenHistoryDailyCount>
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(containerColor = Color(0xFF1F1F1F))
    ) {
        Column(modifier = Modifier.padding(16.dp), verticalArrangement = Arrangement.spacedBy(12.dp)) {
            Text("Listening Insights", style = MaterialTheme.typography.titleMedium, color = Color.White)
            Text("Most Played", color = Color(0xFFB3B3B3), style = MaterialTheme.typography.labelMedium)
            if (topItems.isEmpty()) {
                Text("No listening history yet.", color = Color(0xFF7A7A7A))
            } else {
                topItems.forEach { item ->
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column {
                            Text(item.title, color = Color.White)
                            item.artist?.let { Text(it, color = Color(0xFFB3B3B3), style = MaterialTheme.typography.bodySmall) }
                        }
                        Text("${item.playCount}×", color = Color(0xFFE5A00D), fontWeight = FontWeight.Bold)
                    }
                }
            }

            if (dailyCounts.isNotEmpty()) {
                Text("Recent activity", color = Color(0xFFB3B3B3), style = MaterialTheme.typography.labelMedium)
                dailyCounts.take(7).forEach { count ->
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text(count.day, color = Color.White)
                        Text("${count.playCount} plays", color = Color(0xFFE5A00D))
                    }
                }
            }
        }
    }
}

@Composable
private fun GlobalSelectionBar(
    selectionState: com.universalmedialibrary.ui.selection.GlobalSelectionState,
    onClear: () -> Unit,
    modifier: Modifier = Modifier
) {
    Surface(
        tonalElevation = 8.dp,
        shadowElevation = 16.dp,
        color = Color(0xFF1F1F1F),
        modifier = modifier
            .fillMaxWidth()
            .padding(16.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text("${selectionState.totalCount} selected", color = Color.White, fontWeight = FontWeight.SemiBold)
            OutlinedButton(onClick = onClear) {
                Text("Clear")
            }
        }
    }
}

@Composable
private fun PathInputDialog(
    title: String,
    onDismiss: () -> Unit,
    onConfirm: (String) -> Unit
) {
    var text by remember { mutableStateOf("") }
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text(title) },
        text = {
            OutlinedTextField(
                value = text,
                onValueChange = { text = it },
                label = { Text("Path or URI") },
                modifier = Modifier.fillMaxWidth()
            )
        },
        confirmButton = {
            TextButton(
                onClick = {
                    if (text.isNotBlank()) {
                        onConfirm(text.trim())
                    }
                }
            ) {
                Text("Add")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
