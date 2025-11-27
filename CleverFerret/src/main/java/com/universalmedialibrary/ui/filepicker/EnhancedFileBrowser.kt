package com.universalmedialibrary.ui.filepicker

import android.net.Uri
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import java.io.File
import java.text.SimpleDateFormat
import java.util.*

/**
 * Enhanced File Browser
 * Inspired by Moonreader's comprehensive file browsing features
 * 
 * Features:
 * - Folder navigation with breadcrumb trail
 * - File type filtering (EPUB, PDF, FB2, MOBI, etc.)
 * - File size filtering
 * - Sort by time, location, filename
 * - Grid/List view toggle
 * - Favorite folders
 * - Recent files
 * - File operations (copy, move, delete)
 * - Quick access to Downloads, SD card, etc.
 */

data class FileItem(
    val file: File,
    val name: String,
    val isDirectory: Boolean,
    val size: Long,
    val modifiedDate: Long,
    val fileType: FileType? = null
)

enum class FileType(val extensions: List<String>, val displayName: String) {
    EPUB(listOf("epub"), "EPUB"),
    PDF(listOf("pdf", "djvu"), "PDF/DJVU"),
    FB2(listOf("fb2", "fb2.zip"), "FB2"),
    MOBI(listOf("mobi", "azw3", "prc"), "MOBI/AZW3/PRC"),
    CHM(listOf("chm", "umd"), "CHM/UMD"),
    DOCX(listOf("docx", "odt", "rtf"), "DOCX/ODT/RTF"),
    TXT(listOf("txt", "md"), "TXT/MD"),
    HTML(listOf("html", "htm", "mhtml"), "HTML/MHTML"),
    CBZ(listOf("cbz", "cbr"), "CBZ/CBR");
    
    companion object {
        fun fromFile(file: File): FileType? {
            val extension = file.extension.lowercase()
            return values().find { it.extensions.contains(extension) }
        }
        
        fun allBookTypes(): List<FileType> = listOf(
            EPUB, PDF, FB2, MOBI, CHM, DOCX, TXT, HTML, CBZ
        )
    }
}

enum class SortMode {
    BY_TIME,
    BY_LOCATION,
    BY_FILENAME,
    BY_SIZE
}

data class FileBrowserSettings(
    val selectedFileTypes: Set<FileType> = FileType.allBookTypes().toSet(),
    val minFileSizeKB: Int = 0,
    val maxFileSizeKB: Int = Int.MAX_VALUE,
    val sortMode: SortMode = SortMode.BY_TIME,
    val showHidden: Boolean = false,
    val viewMode: ViewMode = ViewMode.LIST,
    val autoImportFolders: List<String> = emptyList()
)

enum class ViewMode {
    LIST,
    GRID
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedFileBrowser(
    initialPath: String? = null,
    onFileSelected: (File) -> Unit,
    onFolderSelected: (File) -> Unit = {},
    allowMultipleSelection: Boolean = false,
    modifier: Modifier = Modifier
) {
    val context = LocalContext.current
    var currentPath by remember {
        mutableStateOf(initialPath ?: context.getExternalFilesDir(null)?.absolutePath ?: "/")
    }
    var settings by remember { mutableStateOf(FileBrowserSettings()) }
    var selectedFiles by remember { mutableStateOf<Set<File>>(emptySet()) }
    var showSettings by remember { mutableStateOf(false) }
    var showFavoriteFolders by remember { mutableStateOf(false) }
    var favoriteFolders by remember { mutableStateOf<List<String>>(emptyList()) }
    
    val currentDirectory = remember(currentPath) {
        File(currentPath)
    }
    
    val fileItems = remember(currentDirectory, settings) {
        loadFileItems(currentDirectory, settings)
    }
    
    Column(modifier = modifier.fillMaxSize()) {
        // Top App Bar
        TopAppBar(
            title = { Text("File Browser") },
            navigationIcon = {
                IconButton(onClick = { /* Navigate back */ }) {
                    Icon(Icons.Default.ArrowBack, "Back")
                }
            },
            actions = {
                IconButton(onClick = { showFavoriteFolders = true }) {
                    Icon(Icons.Default.Star, "Favorite Folders")
                }
                IconButton(onClick = { showSettings = true }) {
                    Icon(Icons.Default.FilterList, "Filter")
                }
                IconButton(onClick = { 
                    settings = settings.copy(
                        viewMode = if (settings.viewMode == ViewMode.LIST) ViewMode.GRID else ViewMode.LIST
                    )
                }) {
                    Icon(
                        if (settings.viewMode == ViewMode.LIST) Icons.Default.GridView else Icons.Default.List,
                        "Toggle View"
                    )
                }
            }
        )
        
        // Breadcrumb navigation
        BreadcrumbNavigation(
            currentPath = currentPath,
            onPathClick = { path ->
                currentPath = path
            },
            onQuickAccessClick = { folder ->
                currentPath = folder
            }
        )
        
        // Sort bar
        SortBar(
            sortMode = settings.sortMode,
            onSortModeChange = { settings = settings.copy(sortMode = it) }
        )
        
        // File list/grid
        Box(modifier = Modifier.weight(1f)) {
            when (settings.viewMode) {
                ViewMode.LIST -> FileListView(
                    files = fileItems,
                    selectedFiles = selectedFiles,
                    onFileClick = { file ->
                        if (file.isDirectory) {
                            currentPath = file.absolutePath
                            onFolderSelected(file)
                        } else {
                            onFileSelected(file)
                        }
                    },
                    onFileLongClick = { file ->
                        if (allowMultipleSelection) {
                            selectedFiles = if (selectedFiles.contains(file)) {
                                selectedFiles - file
                            } else {
                                selectedFiles + file
                            }
                        }
                    }
                )
                ViewMode.GRID -> FileGridView(
                    files = fileItems,
                    selectedFiles = selectedFiles,
                    onFileClick = { file ->
                        if (file.isDirectory) {
                            currentPath = file.absolutePath
                            onFolderSelected(file)
                        } else {
                            onFileSelected(file)
                        }
                    },
                    onFileLongClick = { file ->
                        if (allowMultipleSelection) {
                            selectedFiles = if (selectedFiles.contains(file)) {
                                selectedFiles - file
                            } else {
                                selectedFiles + file
                            }
                        }
                    }
                )
            }
        }
        
        // Selection bar (when files are selected)
        if (selectedFiles.isNotEmpty()) {
            SelectionBar(
                selectedCount = selectedFiles.size,
                onCopy = { /* Copy files */ },
                onMove = { /* Move files */ },
                onDelete = { 
                    selectedFiles.forEach { it.delete() }
                    selectedFiles = emptySet()
                },
                onCancel = { selectedFiles = emptySet() }
            )
        }
    }
    
    // Settings dialog
    if (showSettings) {
        FileBrowserSettingsDialog(
            settings = settings,
            onSettingsChange = { settings = it },
            onDismiss = { showSettings = false }
        )
    }
    
    // Favorite folders dialog
    if (showFavoriteFolders) {
        FavoriteFoldersDialog(
            favoriteFolders = favoriteFolders,
            onAddFolder = { folder ->
                favoriteFolders = favoriteFolders + folder
            },
            onRemoveFolder = { folder ->
                favoriteFolders = favoriteFolders - folder
            },
            onFolderSelected = { folder ->
                currentPath = folder
                showFavoriteFolders = false
            },
            onDismiss = { showFavoriteFolders = false }
        )
    }
}

@Composable
private fun BreadcrumbNavigation(
    currentPath: String,
    onPathClick: (String) -> Unit,
    onQuickAccessClick: (String) -> Unit
) {
    val context = LocalContext.current
    val pathParts = currentPath.split("/").filter { it.isNotEmpty() }
    
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MaterialTheme.colorScheme.surfaceVariant
    ) {
        Column(modifier = Modifier.padding(8.dp)) {
            // Quick access buttons
            LazyRow(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                contentPadding = PaddingValues(horizontal = 8.dp)
            ) {
                item {
                    QuickAccessButton(
                        label = "Downloads",
                        icon = Icons.Default.Download,
                        onClick = {
                            val downloads = context.getExternalFilesDir(android.os.Environment.DIRECTORY_DOWNLOADS)
                            downloads?.absolutePath?.let { onQuickAccessClick(it) }
                        }
                    )
                }
                item {
                    QuickAccessButton(
                        label = "SD Card",
                        icon = Icons.Default.Storage,
                        onClick = {
                            val sdCard = context.getExternalFilesDir(null)?.parent
                            sdCard?.let { onQuickAccessClick(it) }
                        }
                    )
                }
                item {
                    QuickAccessButton(
                        label = "Documents",
                        icon = Icons.Default.Folder,
                        onClick = {
                            val documents = context.getExternalFilesDir(android.os.Environment.DIRECTORY_DOCUMENTS)
                            documents?.absolutePath?.let { onQuickAccessClick(it) }
                        }
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            // Breadcrumb trail
            LazyRow(
                horizontalArrangement = Arrangement.spacedBy(4.dp),
                contentPadding = PaddingValues(horizontal = 8.dp)
            ) {
                item {
                    TextButton(
                        onClick = { onPathClick("/") },
                        modifier = Modifier.height(32.dp)
                    ) {
                        Icon(Icons.Default.Home, null, modifier = Modifier.size(16.dp))
                    }
                }
                
                items(pathParts.size) { index ->
                    val path = "/" + pathParts.take(index + 1).joinToString("/")
                    TextButton(
                        onClick = { onPathClick(path) },
                        modifier = Modifier.height(32.dp)
                    ) {
                        Text(
                            text = pathParts[index],
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun QuickAccessButton(
    label: String,
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    onClick: () -> Unit
) {
    OutlinedButton(
        onClick = onClick,
        modifier = Modifier.height(36.dp)
    ) {
        Icon(icon, null, modifier = Modifier.size(16.dp))
        Spacer(modifier = Modifier.width(4.dp))
        Text(label, fontSize = 12.sp)
    }
}

@Composable
private fun SortBar(
    sortMode: SortMode,
    onSortModeChange: (SortMode) -> Unit
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MaterialTheme.colorScheme.surfaceVariant
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 8.dp, vertical = 4.dp),
            horizontalArrangement = Arrangement.SpaceEvenly
        ) {
            SortButton("Time", SortMode.BY_TIME, sortMode, onSortModeChange)
            Text("|", color = MaterialTheme.colorScheme.onSurfaceVariant)
            SortButton("Location", SortMode.BY_LOCATION, sortMode, onSortModeChange)
            Text("|", color = MaterialTheme.colorScheme.onSurfaceVariant)
            SortButton("Filename", SortMode.BY_FILENAME, sortMode, onSortModeChange)
            Text("|", color = MaterialTheme.colorScheme.onSurfaceVariant)
            SortButton("Size", SortMode.BY_SIZE, sortMode, onSortModeChange)
        }
    }
}

@Composable
private fun SortButton(
    label: String,
    mode: SortMode,
    currentMode: SortMode,
    onModeChange: (SortMode) -> Unit
) {
    TextButton(
        onClick = { onModeChange(mode) },
        colors = ButtonDefaults.textButtonColors(
            contentColor = if (mode == currentMode) {
                MaterialTheme.colorScheme.primary
            } else {
                MaterialTheme.colorScheme.onSurfaceVariant
            }
        )
    ) {
        Text(label, fontSize = 12.sp, fontWeight = if (mode == currentMode) FontWeight.Bold else FontWeight.Normal)
    }
}

@Composable
private fun FileListView(
    files: List<FileItem>,
    selectedFiles: Set<File>,
    onFileClick: (File) -> Unit,
    onFileLongClick: (File) -> Unit
) {
    LazyColumn(
        contentPadding = PaddingValues(8.dp),
        verticalArrangement = Arrangement.spacedBy(4.dp)
    ) {
        items(files) { item ->
            FileListItem(
                item = item,
                isSelected = selectedFiles.contains(item.file),
                onClick = { onFileClick(item.file) },
                onLongClick = { onFileLongClick(item.file) }
            )
        }
    }
}

@Composable
private fun FileListItem(
    item: FileItem,
    isSelected: Boolean,
    onClick: () -> Unit,
    onLongClick: () -> Unit
) {
    val dateFormat = SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.getDefault())
    val formattedDate = dateFormat.format(Date(item.modifiedDate))
    val formattedSize = formatFileSize(item.size)
    
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .then(
                if (isSelected) Modifier.background(MaterialTheme.colorScheme.primaryContainer)
                else Modifier
            )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = if (item.isDirectory) Icons.Default.Folder else Icons.Default.Description,
                contentDescription = null,
                modifier = Modifier.size(48.dp),
                tint = if (item.isDirectory) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.secondary
            )
            
            Spacer(modifier = Modifier.width(12.dp))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = item.name,
                    style = MaterialTheme.typography.bodyLarge,
                    fontWeight = FontWeight.Medium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Spacer(modifier = Modifier.height(4.dp))
                Row(
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Text(
                        text = formattedDate,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    if (!item.isDirectory) {
                        Text(
                            text = formattedSize,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                    item.fileType?.let {
                        Text(
                            text = it.displayName,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.primary
                        )
                    }
                }
            }
            
            if (isSelected) {
                Icon(
                    Icons.Default.CheckCircle,
                    "Selected",
                    tint = MaterialTheme.colorScheme.primary
                )
            }
        }
    }
}

@Composable
private fun FileGridView(
    files: List<FileItem>,
    selectedFiles: Set<File>,
    onFileClick: (File) -> Unit,
    onFileLongClick: (File) -> Unit
) {
    LazyColumn(
        contentPadding = PaddingValues(8.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        items(files.chunked(2)) { row ->
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                row.forEach { item ->
                    FileGridItem(
                        item = item,
                        isSelected = selectedFiles.contains(item.file),
                        onClick = { onFileClick(item.file) },
                        onLongClick = { onFileLongClick(item.file) },
                        modifier = Modifier.weight(1f)
                    )
                }
                // Fill empty space if odd number of items
                if (row.size == 1) {
                    Spacer(modifier = Modifier.weight(1f))
                }
            }
        }
    }
}

@Composable
private fun FileGridItem(
    item: FileItem,
    isSelected: Boolean,
    onClick: () -> Unit,
    onLongClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .aspectRatio(0.75f)
            .clickable(onClick = onClick)
            .then(
                if (isSelected) Modifier.background(MaterialTheme.colorScheme.primaryContainer)
                else Modifier
            )
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(8.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Icon(
                imageVector = if (item.isDirectory) Icons.Default.Folder else Icons.Default.Description,
                contentDescription = null,
                modifier = Modifier.size(48.dp),
                tint = if (item.isDirectory) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.secondary
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = item.name,
                style = MaterialTheme.typography.bodySmall,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
                textAlign = androidx.compose.ui.text.style.TextAlign.Center
            )
            if (isSelected) {
                Spacer(modifier = Modifier.height(4.dp))
                Icon(
                    Icons.Default.CheckCircle,
                    "Selected",
                    modifier = Modifier.size(20.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
            }
        }
    }
}

@Composable
private fun SelectionBar(
    selectedCount: Int,
    onCopy: () -> Unit,
    onMove: () -> Unit,
    onDelete: () -> Unit,
    onCancel: () -> Unit
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MaterialTheme.colorScheme.surfaceVariant,
        tonalElevation = 8.dp
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(8.dp),
            horizontalArrangement = Arrangement.SpaceEvenly,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text("$selectedCount selected", style = MaterialTheme.typography.bodyMedium)
            Text("|", color = MaterialTheme.colorScheme.onSurfaceVariant)
            TextButton(onClick = onCopy) { Text("Copy") }
            Text("|", color = MaterialTheme.colorScheme.onSurfaceVariant)
            TextButton(onClick = onMove) { Text("Move") }
            Text("|", color = MaterialTheme.colorScheme.onSurfaceVariant)
            TextButton(onClick = onDelete) { 
                Text("Delete", color = MaterialTheme.colorScheme.error)
            }
            Text("|", color = MaterialTheme.colorScheme.onSurfaceVariant)
            TextButton(onClick = onCancel) { Text("Cancel") }
        }
    }
}

@Composable
private fun FileBrowserSettingsDialog(
    settings: FileBrowserSettings,
    onSettingsChange: (FileBrowserSettings) -> Unit,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("File Browser Settings") },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                // File type filters
                Text("File Types", style = MaterialTheme.typography.titleSmall)
                FileTypeFilterSection(
                    selectedTypes = settings.selectedFileTypes,
                    onTypesChange = { onSettingsChange(settings.copy(selectedFileTypes = it)) }
                )
                
                Divider()
                
                // File size filter
                Text("File Size (KB)", style = MaterialTheme.typography.titleSmall)
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    OutlinedTextField(
                        value = settings.minFileSizeKB.toString(),
                        onValueChange = { 
                            onSettingsChange(settings.copy(minFileSizeKB = it.toIntOrNull() ?: 0))
                        },
                        label = { Text("Min") },
                        modifier = Modifier.weight(1f)
                    )
                    OutlinedTextField(
                        value = if (settings.maxFileSizeKB == Int.MAX_VALUE) "" else settings.maxFileSizeKB.toString(),
                        onValueChange = { 
                            onSettingsChange(settings.copy(maxFileSizeKB = it.toIntOrNull() ?: Int.MAX_VALUE))
                        },
                        label = { Text("Max") },
                        modifier = Modifier.weight(1f)
                    )
                }
                
                Divider()
                
                // Show hidden files
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Show Hidden Files")
                    Switch(
                        checked = settings.showHidden,
                        onCheckedChange = { onSettingsChange(settings.copy(showHidden = it)) }
                    )
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) { Text("Done") }
        }
    )
}

@Composable
private fun FileTypeFilterSection(
    selectedTypes: Set<FileType>,
    onTypesChange: (Set<FileType>) -> Unit
) {
    val allTypes = FileType.allBookTypes()
    
    Column(
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        allTypes.chunked(2).forEach { row ->
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                row.forEach { type ->
                    FilterChip(
                        selected = selectedTypes.contains(type),
                        onClick = {
                            val newSet = if (selectedTypes.contains(type)) {
                                selectedTypes - type
                            } else {
                                selectedTypes + type
                            }
                            onTypesChange(newSet)
                        },
                        label = { Text(type.displayName, fontSize = 12.sp) },
                        modifier = Modifier.weight(1f)
                    )
                }
            }
        }
    }
}

@Composable
private fun FavoriteFoldersDialog(
    favoriteFolders: List<String>,
    onAddFolder: (String) -> Unit,
    onRemoveFolder: (String) -> Unit,
    onFolderSelected: (String) -> Unit,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Favorite Folders") },
        text = {
            Column {
                if (favoriteFolders.isEmpty()) {
                    Text(
                        "No favorite folders",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                } else {
                    favoriteFolders.forEach { folder ->
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(vertical = 4.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            TextButton(onClick = { onFolderSelected(folder) }) {
                                Text(folder, maxLines = 1, overflow = TextOverflow.Ellipsis)
                            }
                            IconButton(onClick = { onRemoveFolder(folder) }) {
                                Icon(Icons.Default.Delete, "Remove")
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) { Text("Close") }
        }
    )
}

private fun loadFileItems(directory: File, settings: FileBrowserSettings): List<FileItem> {
    if (!directory.exists() || !directory.isDirectory) {
        return emptyList()
    }
    
    val files = directory.listFiles()?.filter { file ->
        if (!settings.showHidden && file.name.startsWith(".")) {
            return@filter false
        }
        
        if (file.isDirectory) {
            true
        } else {
            val fileType = FileType.fromFile(file)
            val sizeKB = file.length() / 1024
            
            fileType in settings.selectedFileTypes &&
            sizeKB >= settings.minFileSizeKB &&
            sizeKB <= settings.maxFileSizeKB
        }
    } ?: return emptyList()
    
    val sortedFiles = when (settings.sortMode) {
        SortMode.BY_TIME -> files.sortedByDescending { it.lastModified() }
        SortMode.BY_FILENAME -> files.sortedBy { it.name.lowercase() }
        SortMode.BY_SIZE -> files.sortedByDescending { it.length() }
        SortMode.BY_LOCATION -> files.sortedBy { it.absolutePath }
    }
    
    return sortedFiles.map { file ->
        FileItem(
            file = file,
            name = file.name,
            isDirectory = file.isDirectory,
            size = file.length(),
            modifiedDate = file.lastModified(),
            fileType = FileType.fromFile(file)
        )
    }
}

private fun formatFileSize(bytes: Long): String {
    return when {
        bytes < 1024 -> "$bytes B"
        bytes < 1024 * 1024 -> "${bytes / 1024} KB"
        bytes < 1024 * 1024 * 1024 -> "${bytes / (1024 * 1024)} MB"
        else -> "${bytes / (1024 * 1024 * 1024)} GB"
    }
}
