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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun FileSystemTopBar(
    currentPath: String,
    isMultiSelectMode: Boolean,
    selectedCount: Int,
    onBack: () -> Unit,
    onSelectAll: () -> Unit,
    onClearSelection: () -> Unit,
    onSearch: (String) -> Unit
) {
    var showSearch by remember { mutableStateOf(false) }
    var searchQuery by remember { mutableStateOf("") }
    
    TopAppBar(
        title = {
            if (showSearch) {
                OutlinedTextField(
                    value = searchQuery,
                    onValueChange = {
                        searchQuery = it
                        onSearch(it)
                    },
                    placeholder = { 
                        Text("Search in folder...", color = MediaColors.TextTertiary) 
                    },
                    singleLine = true,
                    colors = OutlinedTextFieldDefaults.colors(
                        focusedBorderColor = MediaColors.AccentPrimary,
                        unfocusedBorderColor = Color.Transparent,
                        focusedContainerColor = MediaColors.BackgroundSurface,
                        unfocusedContainerColor = MediaColors.BackgroundSurface
                    ),
                    modifier = Modifier.fillMaxWidth()
                )
            } else if (isMultiSelectMode) {
                Text(
                    "$selectedCount selected",
                    style = MediaTypography.TitleMedium,
                    color = MediaColors.TextPrimary
                )
            } else {
                Column {
                    Text(
                        "Browse Files",
                        style = MediaTypography.TitleMedium,
                        color = MediaColors.TextPrimary
                    )
                    Text(
                        currentPath.split("/").lastOrNull() ?: "Storage",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }
        },
        navigationIcon = {
            IconButton(onClick = {
                if (showSearch) {
                    showSearch = false
                    searchQuery = ""
                    onSearch("")
                } else {
                    onBack()
                }
            }) {
                Icon(
                    if (showSearch) Icons.Default.Close else Icons.Default.ArrowBack,
                    "Back",
                    tint = MediaColors.TextPrimary
                )
            }
        },
        actions = {
            if (isMultiSelectMode) {
                IconButton(onClick = onSelectAll) {
                    Icon(Icons.Default.SelectAll, "Select All", tint = MediaColors.TextSecondary)
                }
                IconButton(onClick = onClearSelection) {
                    Icon(Icons.Default.Clear, "Clear Selection", tint = MediaColors.TextSecondary)
                }
            } else {
                IconButton(onClick = { showSearch = !showSearch }) {
                    Icon(Icons.Default.Search, "Search", tint = MediaColors.TextSecondary)
                }
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = MediaColors.BackgroundElevated
        )
    )
}

// =============================================================================
// BREADCRUMB NAVIGATION
// =============================================================================

@Composable
private fun BreadcrumbNavigation(
    path: String,
    onNavigate: (String) -> Unit
) {
    val pathParts = path.split("/").filter { it.isNotEmpty() }
    
    LazyRow(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.XS)
    ) {
        // Root
        item {
            BreadcrumbChip(
                text = "Storage",
                isLast = pathParts.isEmpty(),
                onClick = { onNavigate("/storage") }
            )
        }
        
        // Path parts
        pathParts.forEachIndexed { index, part ->
            item {
                Icon(
                    Icons.Default.ChevronRight,
                    null,
                    tint = MediaColors.TextTertiary,
                    modifier = Modifier.size(16.dp)
                )
            }
            item {
                val partPath = "/" + pathParts.take(index + 1).joinToString("/")
                BreadcrumbChip(
                    text = part,
                    isLast = index == pathParts.lastIndex,
                    onClick = { onNavigate(partPath) }
                )
            }
        }
    }
}

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

@Composable
private fun QuickAccessCard(
    item: FileQuickAccessItem,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .width(100.dp)
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(MediaCorners.MD),
        color = MediaColors.BackgroundElevated
    ) {
        Column(
            modifier = Modifier.padding(MediaSpacing.MD),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                item.icon,
                null,
                tint = item.color,
                modifier = Modifier.size(32.dp)
            )
            Spacer(Modifier.height(MediaSpacing.SM))
            Text(
                item.name,
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}

// =============================================================================
// STORAGE INFO
// =============================================================================

@Composable
private fun StorageInfoBar(
    totalSpace: Long,
    usedSpace: Long,
    freeSpace: Long
) {
    val usedPercent = if (totalSpace > 0) usedSpace.toFloat() / totalSpace else 0f
    
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM)
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text(
                "${formatSize(usedSpace)} used",
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextSecondary
            )
            Text(
                "${formatSize(freeSpace)} free",
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextTertiary
            )
        }
        
        Spacer(Modifier.height(MediaSpacing.XS))
        
        LinearProgressIndicator(
            progress = { usedPercent },
            modifier = Modifier
                .fillMaxWidth()
                .height(4.dp)
                .clip(RoundedCornerShape(MediaCorners.Full)),
            color = when {
                usedPercent > 0.9f -> MediaColors.Error
                usedPercent > 0.75f -> MediaColors.Warning
                else -> MediaColors.AccentPrimary
            },
            trackColor = MediaColors.BackgroundSurface
        )
    }
}

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

@OptIn(ExperimentalFoundationApi::class)
@Composable
private fun FileListItem(
    item: FileItem,
    isSelected: Boolean,
    showCheckbox: Boolean,
    onClick: () -> Unit,
    onLongClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(MediaCorners.SM))
            .combinedClickable(
                onClick = onClick,
                onLongClick = onLongClick
            ),
        color = if (isSelected)
            MediaColors.AccentPrimary.copy(alpha = 0.2f)
        else
            Color.Transparent
    ) {
        Row(
            modifier = Modifier.padding(MediaSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Checkbox (multi-select mode)
            if (showCheckbox) {
                Checkbox(
                    checked = isSelected,
                    onCheckedChange = { onClick() },
                    colors = CheckboxDefaults.colors(
                        checkedColor = MediaColors.AccentPrimary
                    )
                )
                Spacer(Modifier.width(MediaSpacing.SM))
            }
            
            // Icon
            Surface(
                shape = RoundedCornerShape(MediaCorners.SM),
                color = item.fileType.color.copy(alpha = 0.15f),
                modifier = Modifier.size(44.dp)
            ) {
                Icon(
                    item.fileType.icon,
                    null,
                    tint = item.fileType.color,
                    modifier = Modifier.padding(MediaSpacing.SM)
                )
            }
            
            Spacer(Modifier.width(MediaSpacing.MD))
            
            // File info
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    item.name,
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextPrimary,
                    fontWeight = FontWeight.Medium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                
                Row(
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
                ) {
                    if (!item.isDirectory) {
                        Text(
                            formatSize(item.size),
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                    } else {
                        Text(
                            "${item.childCount} items",
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                    }
                    Text(
                        item.modifiedDate,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
            }
            
            // Navigate icon for folders
            if (item.isDirectory) {
                Icon(
                    Icons.Default.ChevronRight,
                    "Open",
                    tint = MediaColors.TextTertiary
                )
            }
        }
    }
}

// =============================================================================
// BOTTOM BARS
// =============================================================================

@Composable
private fun SelectFolderBottomBar(
    currentPath: String,
    onSelect: () -> Unit,
    onAddAsLibrary: () -> Unit
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.LG
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(MediaSpacing.MD),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            OutlinedButton(
                onClick = onAddAsLibrary,
                modifier = Modifier.weight(1f)
            ) {
                Icon(Icons.Default.LibraryAdd, null, modifier = Modifier.size(18.dp))
                Spacer(Modifier.width(MediaSpacing.SM))
                Text("Add as Library")
            }
            
            Button(
                onClick = onSelect,
                modifier = Modifier.weight(1f),
                colors = ButtonDefaults.buttonColors(
                    containerColor = MediaColors.AccentPrimary
                )
            ) {
                Icon(Icons.Default.Check, null, modifier = Modifier.size(18.dp))
                Spacer(Modifier.width(MediaSpacing.SM))
                Text("Select Folder")
            }
        }
    }
}

@Composable
private fun MultiSelectBottomBar(
    selectedCount: Int,
    onConfirm: () -> Unit,
    onAddToLibrary: () -> Unit
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.LG
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(MediaSpacing.MD),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            OutlinedButton(
                onClick = onAddToLibrary,
                modifier = Modifier.weight(1f)
            ) {
                Icon(Icons.Default.LibraryAdd, null, modifier = Modifier.size(18.dp))
                Spacer(Modifier.width(MediaSpacing.SM))
                Text("Add to Library")
            }
            
            Button(
                onClick = onConfirm,
                modifier = Modifier.weight(1f),
                colors = ButtonDefaults.buttonColors(
                    containerColor = MediaColors.AccentPrimary
                )
            ) {
                Text("Select $selectedCount")
            }
        }
    }
}

// =============================================================================
// DIALOGS
// =============================================================================

@Composable
private fun AddLibraryDialog(
    folderPath: String,
    onConfirm: (LibraryType) -> Unit,
    onDismiss: () -> Unit
) {
    var selectedType by remember { mutableStateOf(LibraryType.BOOKS) }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Add Library", color = MediaColors.TextPrimary)
        },
        text = {
            Column {
                Text(
                    "Add folder as library:",
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextSecondary
                )
                Text(
                    folderPath.split("/").lastOrNull() ?: folderPath,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextTertiary
                )
                
                Spacer(Modifier.height(MediaSpacing.MD))
                
                Text(
                    "Library Type:",
                    style = MediaTypography.LabelMedium,
                    color = MediaColors.TextPrimary
                )
                
                Spacer(Modifier.height(MediaSpacing.SM))
                
                LibraryType.entries.forEach { type ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { selectedType = type }
                            .padding(vertical = MediaSpacing.SM),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        RadioButton(
                            selected = selectedType == type,
                            onClick = { selectedType = type },
                            colors = RadioButtonDefaults.colors(
                                selectedColor = MediaColors.AccentPrimary
                            )
                        )
                        Spacer(Modifier.width(MediaSpacing.SM))
                        Icon(
                            type.icon,
                            null,
                            tint = type.color,
                            modifier = Modifier.size(20.dp)
                        )
                        Spacer(Modifier.width(MediaSpacing.SM))
                        Text(
                            type.displayName,
                            style = MediaTypography.BodyMedium,
                            color = MediaColors.TextPrimary
                        )
                    }
                }
            }
        },
        confirmButton = {
            Button(
                onClick = { onConfirm(selectedType) },
                colors = ButtonDefaults.buttonColors(
                    containerColor = MediaColors.AccentPrimary
                )
            ) {
                Text("Add Library")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        },
        containerColor = MediaColors.BackgroundElevated
    )
}

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

@Composable
private fun FileSystemError(
    message: String,
    onRetry: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            Icons.Outlined.ErrorOutline,
            null,
            tint = MediaColors.Error,
            modifier = Modifier.size(64.dp)
        )
        Spacer(Modifier.height(MediaSpacing.MD))
        Text(
            "Error accessing files",
            style = MediaTypography.TitleSmall,
            color = MediaColors.TextPrimary
        )
        Text(
            message,
            style = MediaTypography.BodySmall,
            color = MediaColors.TextSecondary
        )
        Spacer(Modifier.height(MediaSpacing.MD))
        Button(
            onClick = onRetry,
            colors = ButtonDefaults.buttonColors(
                containerColor = MediaColors.AccentPrimary
            )
        ) {
            Text("Retry")
        }
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
