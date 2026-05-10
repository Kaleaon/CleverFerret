package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric File System Browser
 * 
 * Full file system browsing for:
 * - Adding library folders
 * - Browsing local storage
 * - Importing files
 * - Managing downloads location
 * 
 * Features:
 * - Navigate file system hierarchy
 * - Multi-select for batch operations
 * - Quick access to common locations
 * - Storage usage display
 * - File type filtering
 * - Search within current directory
 * - Sort options
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaFileSystemBrowser(
    state: FileSystemBrowserState,
    onNavigateToPath: (String) -> Unit,
    onSelectFolder: (String) -> Unit,
    onSelectFile: (FileItem) -> Unit,
    onMultiSelect: (List<FileItem>) -> Unit,
    onBack: () -> Unit,
    onAddAsLibrary: (String, LibraryType) -> Unit,
    onSearchQuery: (String) -> Unit,
    onSortChange: (FileSortOption) -> Unit,
    onFilterChange: (FileTypeFilter) -> Unit,
    modifier: Modifier = Modifier
) {
    var showAddLibraryDialog by remember { mutableStateOf(false) }
    var selectedFolderForLibrary by remember { mutableStateOf<String?>(null) }
    var isMultiSelectMode by remember { mutableStateOf(false) }
    var selectedItems by remember { mutableStateOf<Set<String>>(emptySet()) }
    var showSortMenu by remember { mutableStateOf(false) }
    var showFilterMenu by remember { mutableStateOf(false) }
    
    Scaffold(
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
        topBar = {
            FileSystemTopBar(
                currentPath = state.currentPath,
                isMultiSelectMode = isMultiSelectMode,
                selectedCount = selectedItems.size,
                onBack = {
                    if (isMultiSelectMode) {
                        isMultiSelectMode = false
                        selectedItems = emptySet()
                    } else {
                        onBack()
                    }
                },
                onSelectAll = {
                    selectedItems = state.items.map { it.path }.toSet()
                },
                onClearSelection = {
                    selectedItems = emptySet()
                    isMultiSelectMode = false
                },
                onSearch = { query -> onSearchQuery(query) }
            )
        },
        bottomBar = {
            if (state.selectionMode == SelectionMode.FOLDER_ONLY) {
                SelectFolderBottomBar(
                    currentPath = state.currentPath,
                    onSelect = {
                        onSelectFolder(state.currentPath)
                    },
                    onAddAsLibrary = {
                        selectedFolderForLibrary = state.currentPath
                        showAddLibraryDialog = true
                    }
                )
            } else if (isMultiSelectMode && selectedItems.isNotEmpty()) {
                MultiSelectBottomBar(
                    selectedCount = selectedItems.size,
                    onConfirm = {
                        val items = state.items.filter { it.path in selectedItems }
                        onMultiSelect(items)
                    },
                    onAddToLibrary = {
                        // For folders in selection
                        val folders = state.items.filter { 
                            it.path in selectedItems && it.isDirectory 
                        }
                        if (folders.isNotEmpty()) {
                            selectedFolderForLibrary = folders.first().path
                            showAddLibraryDialog = true
                        }
                    }
                )
            }
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Breadcrumb navigation
            BreadcrumbNavigation(
                path = state.currentPath,
                onNavigate = onNavigateToPath
            )
            
            // Quick access shortcuts
            if (state.showQuickAccess) {
                QuickAccessSection(
                    quickAccessItems = state.quickAccessItems,
                    onItemClick = { onNavigateToPath(it.path) }
                )
            }
            
            // Storage info
            StorageInfoBar(
                totalSpace = state.totalSpace,
                usedSpace = state.usedSpace,
                freeSpace = state.freeSpace
            )
            
            // Sort and filter controls
            SortFilterRow(
                currentSort = state.sortOption,
                currentFilter = state.typeFilter,
                onSortClick = { showSortMenu = true },
                onFilterClick = { showFilterMenu = true }
            )
            
            // File list
            when {
                state.isLoading -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CircularProgressIndicator(color = MediaColors.AccentPrimary)
                    }
                }
                state.error != null -> {
                    FileSystemError(
                        message = state.error,
                        onRetry = { onNavigateToPath(state.currentPath) }
                    )
                }
                state.items.isEmpty() -> {
                    EmptyDirectoryState(
                        filter = state.typeFilter
                    )
                }
                else -> {
                    FileList(
                        items = state.items,
                        isMultiSelectMode = isMultiSelectMode,
                        selectedItems = selectedItems,
                        onItemClick = { item ->
                            if (isMultiSelectMode) {
                                selectedItems = if (item.path in selectedItems) {
                                    selectedItems - item.path
                                } else {
                                    selectedItems + item.path
                                }
                            } else if (item.isDirectory) {
                                onNavigateToPath(item.path)
                            } else {
                                onSelectFile(item)
                            }
                        },
                        onItemLongClick = { item ->
                            if (!isMultiSelectMode) {
                                isMultiSelectMode = true
                                selectedItems = setOf(item.path)
                            }
                        }
                    )
                }
            }
        }
        
        // Sort menu
        DropdownMenu(
            expanded = showSortMenu,
            onDismissRequest = { showSortMenu = false }
        ) {
            FileSortOption.entries.forEach { option ->
                DropdownMenuItem(
                    text = {
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            if (state.sortOption == option) {
                                Icon(
                                    Icons.Default.Check,
                                    null,
                                    tint = MediaColors.AccentPrimary,
                                    modifier = Modifier.size(18.dp)
                                )
                                Spacer(Modifier.width(MediaSpacing.SM))
                            }
                            Text(option.displayName, color = MediaColors.TextPrimary)
                        }
                    },
                    onClick = {
                        onSortChange(option)
                        showSortMenu = false
                    }
                )
            }
        }
        
        // Filter menu
        DropdownMenu(
            expanded = showFilterMenu,
            onDismissRequest = { showFilterMenu = false }
        ) {
            FileTypeFilter.entries.forEach { filter ->
                DropdownMenuItem(
                    text = {
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Icon(
                                filter.icon,
                                null,
                                tint = if (state.typeFilter == filter)
                                    MediaColors.AccentPrimary
                                else
                                    MediaColors.TextSecondary,
                                modifier = Modifier.size(18.dp)
                            )
                            Spacer(Modifier.width(MediaSpacing.SM))
                            Text(filter.displayName, color = MediaColors.TextPrimary)
                        }
                    },
                    onClick = {
                        onFilterChange(filter)
                        showFilterMenu = false
                    }
                )
            }
        }
        
        // Add library dialog
        if (showAddLibraryDialog && selectedFolderForLibrary != null) {
            AddLibraryDialog(
                folderPath = selectedFolderForLibrary!!,
                onConfirm = { libraryType ->
                    onAddAsLibrary(selectedFolderForLibrary!!, libraryType)
                    showAddLibraryDialog = false
                    selectedFolderForLibrary = null
                },
                onDismiss = {
                    showAddLibraryDialog = false
                    selectedFolderForLibrary = null
                }
            )
        }
    }
}

// =============================================================================
// TOP BAR
// =============================================================================


// =============================================================================
// BREADCRUMB NAVIGATION
// =============================================================================


@Composable
private fun BreadcrumbChip(
    text: String,
    isLast: Boolean,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier.clickable(onClick = onClick),
        shape = RoundedCornerShape(MediaCorners.SM),
        color = if (isLast) 
            MediaColors.AccentPrimary.copy(alpha = 0.2f) 
        else 
            Color.Transparent
    ) {
        Text(
            text = text,
            style = MediaTypography.LabelMedium,
            color = if (isLast) MediaColors.AccentPrimary else MediaColors.TextSecondary,
            modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.XS)
        )
    }
}

// =============================================================================
// QUICK ACCESS
// =============================================================================

@Composable
private fun QuickAccessSection(
    quickAccessItems: List<FileQuickAccessItem>,
    onItemClick: (FileQuickAccessItem) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(MediaSpacing.MD)
    ) {
        Text(
            "Quick Access",
            style = MediaTypography.LabelMedium,
            color = MediaColors.TextSecondary,
            modifier = Modifier.padding(bottom = MediaSpacing.SM)
        )
        
        LazyRow(
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            items(quickAccessItems) { item ->
                QuickAccessCard(
                    item = item,
                    onClick = { onItemClick(item) }
                )
            }
        }
    }
}


// =============================================================================
// STORAGE INFO
// =============================================================================


// =============================================================================
// SORT & FILTER
// =============================================================================

@Composable
private fun SortFilterRow(
    currentSort: FileSortOption,
    currentFilter: FileTypeFilter,
    onSortClick: () -> Unit,
    onFilterClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        TextButton(onClick = onSortClick) {
            Icon(Icons.Default.Sort, null, modifier = Modifier.size(18.dp))
            Spacer(Modifier.width(MediaSpacing.XS))
            Text(currentSort.displayName, style = MediaTypography.LabelMedium)
            Icon(Icons.Default.ArrowDropDown, null, modifier = Modifier.size(18.dp))
        }
        
        TextButton(onClick = onFilterClick) {
            Icon(currentFilter.icon, null, modifier = Modifier.size(18.dp))
            Spacer(Modifier.width(MediaSpacing.XS))
            Text(currentFilter.displayName, style = MediaTypography.LabelMedium)
            Icon(Icons.Default.ArrowDropDown, null, modifier = Modifier.size(18.dp))
        }
    }
}

// =============================================================================
// FILE LIST
// =============================================================================

@OptIn(ExperimentalFoundationApi::class)
@Composable
private fun FileList(
    items: List<FileItem>,
    isMultiSelectMode: Boolean,
    selectedItems: Set<String>,
    onItemClick: (FileItem) -> Unit,
    onItemLongClick: (FileItem) -> Unit
) {
    LazyColumn(
        contentPadding = PaddingValues(MediaSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(MediaSpacing.XS)
    ) {
        items(items = items, key = { it.path }) { item ->
            FileListItem(
                item = item,
                isSelected = item.path in selectedItems,
                showCheckbox = isMultiSelectMode,
                onClick = { onItemClick(item) },
                onLongClick = { onItemLongClick(item) }
            )
        }
    }
}


// =============================================================================
// BOTTOM BARS
// =============================================================================



// =============================================================================
// DIALOGS
// =============================================================================


// =============================================================================
// EMPTY & ERROR STATES
// =============================================================================

@Composable
private fun EmptyDirectoryState(filter: FileTypeFilter) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            Icons.Outlined.FolderOpen,
            null,
            tint = MediaColors.TextTertiary,
            modifier = Modifier.size(64.dp)
        )
        Spacer(Modifier.height(MediaSpacing.MD))
        Text(
            if (filter == FileTypeFilter.ALL) 
                "Empty folder" 
            else 
                "No ${filter.displayName.lowercase()} found",
            style = MediaTypography.TitleSmall,
            color = MediaColors.TextSecondary
        )
    }
}


// =============================================================================
// HELPER FUNCTIONS
// =============================================================================

private fun formatSize(bytes: Long): String {
    return when {
        bytes >= 1_000_000_000 -> "%.1f GB".format(bytes / 1_000_000_000.0)
        bytes >= 1_000_000 -> "%.1f MB".format(bytes / 1_000_000.0)
        bytes >= 1_000 -> "%.1f KB".format(bytes / 1_000.0)
        else -> "$bytes B"
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class FileSystemBrowserState(
    val currentPath: String = "/storage/emulated/0",
    val items: List<FileItem> = emptyList(),
    val quickAccessItems: List<FileQuickAccessItem> = defaultQuickAccessItems(),
    val sortOption: FileSortOption = FileSortOption.NAME,
    val typeFilter: FileTypeFilter = FileTypeFilter.ALL,
    val selectionMode: SelectionMode = SelectionMode.FILES_AND_FOLDERS,
    val showQuickAccess: Boolean = true,
    val totalSpace: Long = 0L,
    val usedSpace: Long = 0L,
    val freeSpace: Long = 0L,
    val isLoading: Boolean = false,
    val error: String? = null
)

data class FileItem(
    val name: String,
    val path: String,
    val size: Long,
    val modifiedDate: String,
    val isDirectory: Boolean,
    val childCount: Int = 0,
    val fileType: FileType
)

data class FileQuickAccessItem(
    val name: String,
    val path: String,
    val icon: ImageVector,
    val color: Color
)

enum class SelectionMode {
    FILES_ONLY,
    FOLDER_ONLY,
    FILES_AND_FOLDERS
}

enum class FileSortOption(val displayName: String) {
    NAME("Name"),
    SIZE("Size"),
    DATE("Date Modified"),
    TYPE("Type")
}

enum class FileTypeFilter(val displayName: String, val icon: ImageVector) {
    ALL("All Files", Icons.Default.Folder),
    BOOKS("Books", Icons.Default.Book),
    AUDIO("Audio", Icons.Default.MusicNote),
    VIDEO("Video", Icons.Default.Movie),
    IMAGES("Images", Icons.Default.Image),
    DOCUMENTS("Documents", Icons.Default.Description)
}

enum class FileType(val icon: ImageVector, val color: Color) {
    FOLDER(Icons.Default.Folder, Color(0xFFFFB74D)),
    BOOK(Icons.Default.Book, MediaColors.MediaTypes.Book),
    AUDIO(Icons.Default.MusicNote, MediaColors.MediaTypes.Music),
    VIDEO(Icons.Default.Movie, MediaColors.MediaTypes.Movie),
    IMAGE(Icons.Default.Image, Color(0xFF7986CB)),
    DOCUMENT(Icons.Default.Description, Color(0xFF4FC3F7)),
    ARCHIVE(Icons.Default.Archive, Color(0xFF81C784)),
    UNKNOWN(Icons.Default.InsertDriveFile, MediaColors.TextTertiary)
}

enum class LibraryType(
    val displayName: String,
    val icon: ImageVector,
    val color: Color
) {
    BOOKS("Books", Icons.Default.Book, MediaColors.MediaTypes.Book),
    AUDIOBOOKS("Audiobooks", Icons.Default.Headphones, MediaColors.MediaTypes.Audiobook),
    COMICS("Comics", Icons.Default.CollectionsBookmark, MediaColors.MediaTypes.Comic),
    MUSIC("Music", Icons.Default.MusicNote, MediaColors.MediaTypes.Music),
    MOVIES("Movies", Icons.Default.Movie, MediaColors.MediaTypes.Movie),
    TV_SHOWS("TV Shows", Icons.Default.Tv, MediaColors.MediaTypes.TvShow),
    PODCASTS("Podcasts", Icons.Default.Podcasts, MediaColors.MediaTypes.Podcast),
    DOCUMENTS("Documents", Icons.Default.Description, MediaColors.MediaTypes.Document)
}

private fun defaultQuickAccessItems() = listOf(
    FileQuickAccessItem(
        name = "Internal",
        path = "/storage/emulated/0",
        icon = Icons.Default.PhoneAndroid,
        color = MediaColors.AccentPrimary
    ),
    FileQuickAccessItem(
        name = "Downloads",
        path = "/storage/emulated/0/Download",
        icon = Icons.Default.Download,
        color = Color(0xFF66BB6A)
    ),
    FileQuickAccessItem(
        name = "Documents",
        path = "/storage/emulated/0/Documents",
        icon = Icons.Default.Description,
        color = Color(0xFF42A5F5)
    ),
    FileQuickAccessItem(
        name = "Music",
        path = "/storage/emulated/0/Music",
        icon = Icons.Default.MusicNote,
        color = MediaColors.MediaTypes.Music
    ),
    FileQuickAccessItem(
        name = "Movies",
        path = "/storage/emulated/0/Movies",
        icon = Icons.Default.Movie,
        color = MediaColors.MediaTypes.Movie
    )
)
