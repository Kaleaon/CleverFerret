package com.universalmedialibrary.ui.gallery

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.services.gallery.*

/**
 * Gallery Settings Screen
 * 
 * Configures gallery behavior including:
 * - View preferences (grid size, sorting)
 * - Feature toggles (AI features, face detection)
 * - Display options
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun GallerySettingsScreen(
    onNavigateBack: () -> Unit,
    viewModel: GallerySettingsViewModel = hiltViewModel()
) {
    val settings by viewModel.settings.collectAsState()
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Gallery Settings") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            // View Section
            item {
                SettingsSection(title = "View")
            }
            
            item {
                SettingsListItem(
                    title = "Default View Mode",
                    subtitle = settings.viewMode.toDisplayName(),
                    icon = Icons.Default.GridView,
                    onClick = { viewModel.showViewModePicker() }
                )
            }
            
            item {
                SettingsListItem(
                    title = "Grid Columns",
                    subtitle = "${settings.gridColumns} columns",
                    icon = Icons.Default.ViewModule,
                    onClick = { viewModel.showGridColumnsPicker() }
                )
            }
            
            item {
                SettingsListItem(
                    title = "Default Sort Order",
                    subtitle = settings.sortOrder.toDisplayName(),
                    icon = Icons.Default.Sort,
                    onClick = { viewModel.showSortOrderPicker() }
                )
            }
            
            // Display Section
            item {
                SettingsSection(title = "Display")
            }
            
            item {
                SettingsSwitchItem(
                    title = "Show Hidden Items",
                    subtitle = "Display hidden photos and videos",
                    icon = Icons.Default.VisibilityOff,
                    checked = settings.showHidden,
                    onCheckedChange = { viewModel.setShowHidden(it) }
                )
            }
            
            item {
                SettingsSwitchItem(
                    title = "Show File Info",
                    subtitle = "Display file name and size in grid",
                    icon = Icons.Default.Info,
                    checked = settings.showFileInfo,
                    onCheckedChange = { viewModel.setShowFileInfo(it) }
                )
            }
            
            item {
                SettingsSwitchItem(
                    title = "Show EXIF Data",
                    subtitle = "Display camera info in details view",
                    icon = Icons.Default.CameraAlt,
                    checked = settings.showExifData,
                    onCheckedChange = { viewModel.setShowExifData(it) }
                )
            }
            
            // Video Section
            item {
                SettingsSection(title = "Video")
            }
            
            item {
                SettingsSwitchItem(
                    title = "Auto-play Videos",
                    subtitle = "Start playing when opened",
                    icon = Icons.Default.PlayArrow,
                    checked = settings.autoPlayVideos,
                    onCheckedChange = { viewModel.setAutoPlayVideos(it) }
                )
            }
            
            item {
                SettingsSwitchItem(
                    title = "Loop Videos",
                    subtitle = "Repeat videos automatically",
                    icon = Icons.Default.Loop,
                    checked = settings.loopVideos,
                    onCheckedChange = { viewModel.setLoopVideos(it) }
                )
            }
            
            // AI Features Section
            item {
                SettingsSection(title = "AI Features (Beta)")
            }
            
            item {
                SettingsSwitchItem(
                    title = "Face Detection",
                    subtitle = "Group photos by people (uses on-device ML)",
                    icon = Icons.Default.Face,
                    checked = settings.enableFaceDetection,
                    onCheckedChange = { viewModel.setEnableFaceDetection(it) }
                )
            }
            
            item {
                SettingsSwitchItem(
                    title = "AI Tags",
                    subtitle = "Auto-detect objects and scenes",
                    icon = Icons.Default.AutoAwesome,
                    checked = settings.enableAiTags,
                    onCheckedChange = { viewModel.setEnableAiTags(it) }
                )
            }
            
            item {
                SettingsSwitchItem(
                    title = "Location Grouping",
                    subtitle = "Group photos by location",
                    icon = Icons.Default.Place,
                    checked = settings.enableLocationGrouping,
                    onCheckedChange = { viewModel.setEnableLocationGrouping(it) }
                )
            }
            
            item {
                SettingsSwitchItem(
                    title = "Memories",
                    subtitle = "Show \"On This Day\" and highlights",
                    icon = Icons.Default.PhotoAlbum,
                    checked = settings.enableMemories,
                    onCheckedChange = { viewModel.setEnableMemories(it) }
                )
            }
            
            // Privacy Note
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.secondaryContainer
                    )
                ) {
                    Row(
                        modifier = Modifier.padding(16.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Default.Security,
                            contentDescription = "Media image",
                            tint = MaterialTheme.colorScheme.onSecondaryContainer
                        )
                        Spacer(modifier = Modifier.width(16.dp))
                        Text(
                            text = "AI features process data on your device. No photos are uploaded to external servers.",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSecondaryContainer
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun SettingsSection(title: String) {
    Text(
        text = title,
        style = MaterialTheme.typography.titleSmall,
        color = MaterialTheme.colorScheme.primary,
        modifier = Modifier.padding(vertical = 8.dp)
    )
}

@Composable
private fun SettingsListItem(
    title: String,
    subtitle: String,
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    onClick: () -> Unit
) {
    Surface(
        onClick = onClick,
        shape = MaterialTheme.shapes.medium
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = icon,
                contentDescription = "Media image",
                tint = MaterialTheme.colorScheme.primary
            )
            Spacer(modifier = Modifier.width(16.dp))
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = title,
                    style = MaterialTheme.typography.bodyLarge
                )
                Text(
                    text = subtitle,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            Icon(
                Icons.Default.ChevronRight,
                contentDescription = "Media image",
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun SettingsSwitchItem(
    title: String,
    subtitle: String,
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    checked: Boolean,
    onCheckedChange: (Boolean) -> Unit
) {
    Surface(
        onClick = { onCheckedChange(!checked) },
        shape = MaterialTheme.shapes.medium
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = icon,
                contentDescription = "Media image",
                tint = MaterialTheme.colorScheme.primary
            )
            Spacer(modifier = Modifier.width(16.dp))
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = title,
                    style = MaterialTheme.typography.bodyLarge
                )
                Text(
                    text = subtitle,
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
}

private fun GalleryViewMode.toDisplayName(): String = when (this) {
    GalleryViewMode.GRID_SMALL -> "Small Grid (4 columns)"
    GalleryViewMode.GRID_MEDIUM -> "Medium Grid (3 columns)"
    GalleryViewMode.GRID_LARGE -> "Large Grid (2 columns)"
    GalleryViewMode.LIST -> "List View"
    GalleryViewMode.TIMELINE -> "Timeline View"
    GalleryViewMode.MAP -> "Map View"
}

private fun GallerySortOrder.toDisplayName(): String = when (this) {
    GallerySortOrder.DATE_TAKEN_DESC -> "Date Taken (Newest)"
    GallerySortOrder.DATE_TAKEN_ASC -> "Date Taken (Oldest)"
    GallerySortOrder.DATE_ADDED_DESC -> "Date Added (Newest)"
    GallerySortOrder.DATE_ADDED_ASC -> "Date Added (Oldest)"
    GallerySortOrder.DATE_MODIFIED_DESC -> "Date Modified (Newest)"
    GallerySortOrder.DATE_MODIFIED_ASC -> "Date Modified (Oldest)"
    GallerySortOrder.NAME_ASC -> "Name (A-Z)"
    GallerySortOrder.NAME_DESC -> "Name (Z-A)"
    GallerySortOrder.SIZE_DESC -> "Size (Largest)"
    GallerySortOrder.SIZE_ASC -> "Size (Smallest)"
    GallerySortOrder.DURATION_DESC -> "Duration (Longest)"
    GallerySortOrder.DURATION_ASC -> "Duration (Shortest)"
    GallerySortOrder.RATING_DESC -> "Rating (Highest)"
    GallerySortOrder.RATING_ASC -> "Rating (Lowest)"
    GallerySortOrder.RANDOM -> "Random"
}
