package com.universalmedialibrary.ui.filepicker

import android.os.Environment
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.selection.selectable
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.InsertDriveFile
import androidx.compose.material.icons.automirrored.filled.ViewList
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import kotlinx.coroutines.launch
import java.io.File
import java.text.SimpleDateFormat
import java.util.*
import kotlin.math.log10
import kotlin.math.pow

/**
 * Enhanced Storage Browser Screen with folder selection and batch import
 * 
 * Features:
 * - Multiple folder selection with checkboxes
 * - Recursive folder scanning
 * - Batch import with progress tracking
 * - File type filtering and validation
 * - Import history and statistics
 */
@OptIn(ExperimentalMaterial3Api::class, ExperimentalFoundationApi::class)
@Composable
fun EnhancedStorageBrowserScreen(
    onNavigateBack: () -> Unit,
    onFilesSelected: (List<File>) -> Unit = {},
    onFoldersSelected: (List<File>) -> Unit = {},
    allowMultipleSelection: Boolean = true,
    allowFolderSelection: Boolean = true,
    filterMediaTypes: List<String> = listOf(
        "epub", "pdf", "mp3", "mp4", "mkv", "cbz", "cbr", "txt", "mobi", "azw", "azw3", 
        "fb2", "djvu", "doc", "docx", "rtf", "html", "htm", "jpg", "jpeg", "png", "gif"
    ),
    viewModel: StorageBrowserViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val scope = rememberCoroutineScope()
    
    // Selection state
    var selectedFiles by remember { mutableStateOf<Set<File>>(emptySet()) }
    var selectedFolders by remember { mutableStateOf<Set<File>>(emptySet()) }
    var showImportDialog by remember { mutableStateOf(false) }
    var importProgress by remember { mutableStateOf(0f) }
    var isImporting by remember { mutableStateOf(false) }
    

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Column {
                        Text("File Browser", style = MaterialTheme.typography.titleMedium)
                        Text(
                            text = uiState.currentPath,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                },
                navigationIcon = {
                    IconButton(onClick = {
                        if (viewModel.canNavigateUp()) {
                            viewModel.navigateUp()
                        } else {
                            onNavigateBack()
                        }
                    }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    // Select all button
                    if (allowMultipleSelection && uiState.files.isNotEmpty()) {
                        IconButton(
                            onClick = {
                                val allFiles = uiState.files.filter { !it.isDirectory }
                                val allFolders = uiState.files.filter { it.isDirectory }
                                selectedFiles = allFiles.toSet()
                                if (allowFolderSelection) {
                                    selectedFolders = allFolders.toSet()
                                }
                            }
                        ) {
                            Icon(Icons.Default.SelectAll, contentDescription = "Select All")
                        }
                    }
                    
                    // Clear selection button
                    if (selectedFiles.isNotEmpty() || selectedFolders.isNotEmpty()) {
                        IconButton(
                            onClick = {
                                selectedFiles = emptySet()
                                selectedFolders = emptySet()
                            }
                        ) {
                            Icon(Icons.Default.Clear, contentDescription = "Clear Selection")
                        }
                    }
                    
                    // Import button
                    if ((selectedFiles.isNotEmpty() || selectedFolders.isNotEmpty()) && !isImporting) {
                        IconButton(
                            onClick = { showImportDialog = true }
                        ) {
                            Icon(Icons.Default.ImportExport, contentDescription = "Import Selected")
                        }
                    }
                    
                    // View mode toggle
                    var showMenu by remember { mutableStateOf(false) }
                    IconButton(onClick = { showMenu = true }) {
                        Icon(Icons.Default.MoreVert, contentDescription = "Options")
                    }
                    DropdownMenu(
                        expanded = showMenu,
                        onDismissRequest = { showMenu = false }
                    ) {
                        DropdownMenuItem(
                            text = { Text("Grid View") },
                            onClick = {
                                viewModel.setViewMode(ViewMode.GRID)
                                showMenu = false
                            },
                            leadingIcon = {
                                Icon(Icons.Default.GridView, contentDescription = "Grid view")
                            }
                        )
                        DropdownMenuItem(
                            text = { Text("List View") },
                            onClick = {
                                viewModel.setViewMode(ViewMode.LIST)
                                showMenu = false
                            },
                            leadingIcon = {
                                Icon(Icons.AutoMirrored.Filled.ViewList, contentDescription = "List view")
                            }
                        )
                        HorizontalDivider()
                        DropdownMenuItem(
                            text = { Text("Show Hidden Files") },
                            onClick = {
                                viewModel.toggleShowHidden()
                                showMenu = false
                            },
                            leadingIcon = {
                                Icon(
                                    if (uiState.showHidden) Icons.Default.CheckBox else Icons.Default.CheckBoxOutlineBlank,
                                    contentDescription = "Media image"
                                )
                            }
                        )
                    }
                }
            )
        },
        bottomBar = {
            // Selection summary bar
            if (selectedFiles.isNotEmpty() || selectedFolders.isNotEmpty()) {
                Surface(
                    modifier = Modifier.fillMaxWidth(),
                    color = MaterialTheme.colorScheme.surfaceVariant,
                    tonalElevation = 8.dp
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column {
                            Text(
                                text = "Selected: ${selectedFiles.size} files, ${selectedFolders.size} folders",
                                style = MaterialTheme.typography.titleSmall,
                                fontWeight = FontWeight.Bold
                            )
                            
                            val totalSize = selectedFiles.sumOf { it.length() }
                            if (totalSize > 0) {
                                Text(
                                    text = "Total size: ${formatFileSize(totalSize)}",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }
                        
                        Row(
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            if (!isImporting) {
                                OutlinedButton(
                                    onClick = {
                                        selectedFiles = emptySet()
                                        selectedFolders = emptySet()
                                    }
                                ) {
                                    Text("Clear")
                                }
                                
                                Button(
                                    onClick = { showImportDialog = true }
                                ) {
                                    Icon(Icons.Default.ImportExport, contentDescription = "Import or export")
                                    Spacer(modifier = Modifier.width(8.dp))
                                    Text("Import")
                                }
                            } else {
                                // Import progress indicator
                                LinearProgressIndicator(
                                    progress = importProgress,
                                    modifier = Modifier.width(120.dp)
                                )
                            }
                        }
                    }
                }
            }
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Quick access shortcuts
            QuickAccessBar(
                onPathSelected = { path -> viewModel.navigateTo(path) },
                modifier = Modifier.fillMaxWidth()
            )

            HorizontalDivider()

            // File list
            when {
                uiState.isLoading -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CircularProgressIndicator()
                    }
                }
                uiState.error != null -> {
                    ErrorView(
                        message = uiState.error!!,
                        onRetry = { viewModel.refresh() }
                    )
                }
                uiState.files.isEmpty() -> {
                    EmptyFolderView()
                }
                else -> {
                    LazyColumn(
                        modifier = Modifier.fillMaxSize(),
                        contentPadding = PaddingValues(8.dp),
                        verticalArrangement = Arrangement.spacedBy(4.dp)
                    ) {
                            items(
                                items = uiState.files,
                                key = { it.absolutePath }
                            ) { file ->
                                EnhancedFileItem(
                                    file = file,
                                    viewMode = uiState.viewMode,
                                    isSelected = if (file.isDirectory) {
                                        selectedFolders.contains(file)
                                    } else {
                                        selectedFiles.contains(file)
                                    },
                                    isSelectable = if (file.isDirectory) allowFolderSelection else allowMultipleSelection,
                                    onClick = {
                                        if (file.isDirectory) {
                                            if (allowFolderSelection && allowMultipleSelection) {
                                                // Toggle folder selection
                                                selectedFolders = if (selectedFolders.contains(file)) {
                                                    selectedFolders - file
                                                } else {
                                                    selectedFolders + file
                                                }
                                            } else {
                                                // Navigate into folder
                                                viewModel.navigateInto(file)
                                                onFoldersSelected(listOf(file))
                                            }
                                        } else {
                                            if (allowMultipleSelection) {
                                                // Toggle file selection
                                                selectedFiles = if (selectedFiles.contains(file)) {
                                                    selectedFiles - file
                                                } else {
                                                    selectedFiles + file
                                                }
                                            } else {
                                                // Single file selection
                                                onFilesSelected(listOf(file))
                                            }
                                        }
                                    },
                                    onLongClick = {
                                        // Long click for multi-selection
                                        if (file.isDirectory && allowFolderSelection) {
                                            selectedFolders = if (selectedFolders.contains(file)) {
                                                selectedFolders - file
                                            } else {
                                                selectedFolders + file
                                            }
                                        } else if (allowMultipleSelection) {
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
                }
            }
        }
    }
    
    // Import confirmation dialog
    if (showImportDialog) {
        ImportConfirmationDialog(
            selectedFiles = selectedFiles.toList(),
            selectedFolders = selectedFolders.toList(),
            onConfirm = { includeSubfolders, validateFiles ->
                scope.launch {
                    isImporting = true
                    importProgress = 0f
                    
                    try {
                        val allFiles = mutableListOf<File>()
                        
                        // Add selected files
                        allFiles.addAll(selectedFiles)
                        
                        // Add files from selected folders (optionally recursive)
                        selectedFolders.forEach { folder ->
                            if (includeSubfolders) {
                                allFiles.addAll(getAllFilesRecursively(folder, filterMediaTypes))
                            } else {
                                allFiles.addAll(getFilesInFolder(folder, filterMediaTypes))
                            }
                        }
                        
                        // Filter by media types if validation is enabled
                        val finalFiles = if (validateFiles) {
                            allFiles.filter { file ->
                                filterMediaTypes.contains(file.extension.lowercase())
                            }
                        } else {
                            allFiles
                        }
                        
                        // Simulate progress updates
                        val chunkSize = maxOf(1, finalFiles.size / 20)
                        finalFiles.chunked(chunkSize).forEachIndexed { index, chunk ->
                            importProgress = (index + 1).toFloat() / (finalFiles.size / chunkSize + 1)
                            kotlinx.coroutines.delay(100) // Small delay for visual feedback
                        }
                        
                        // Complete import
                        onFilesSelected(finalFiles)
                        onFoldersSelected(selectedFolders.toList())
                        
                        // Clear selection after successful import
                        selectedFiles = emptySet()
                        selectedFolders = emptySet()
                        showImportDialog = false
                        
                    } catch (e: Exception) {
                        // Handle error
                        android.util.Log.e("EnhancedFileBrowser", "Import failed", e)
                    } finally {
                        isImporting = false
                        importProgress = 0f
                    }
                }
            },
            onDismiss = { showImportDialog = false }
        )
    }
}



private fun getAllFilesRecursively(
    folder: File, 
    allowedExtensions: List<String>
): List<File> {
    val files = mutableListOf<File>()
    
    try {
        folder.walkTopDown().forEach { file ->
            if (file.isFile && allowedExtensions.contains(file.extension.lowercase())) {
                files.add(file)
            }
        }
    } catch (e: SecurityException) {
        android.util.Log.w("EnhancedFileBrowser", "Cannot access ${folder.path}: ${e.message}")
    }
    
    return files
}

private fun getFilesInFolder(
    folder: File, 
    allowedExtensions: List<String>
): List<File> {
    return try {
        folder.listFiles()?.filter { file ->
            file.isFile && allowedExtensions.contains(file.extension.lowercase())
        } ?: emptyList()
    } catch (e: SecurityException) {
        android.util.Log.w("EnhancedFileBrowser", "Cannot access ${folder.path}: ${e.message}")
        emptyList()
    }
}

// Reuse existing components from original StorageBrowserScreen

@Composable
private fun QuickAccessChip(
    label: String,
    icon: ImageVector,
    onClick: () -> Unit
) {
    AssistChip(
        onClick = onClick,
        label = { Text(label) },
        leadingIcon = {
            Icon(
                icon,
                contentDescription = "Media image",
                modifier = Modifier.size(18.dp)
            )
        }
    )
}


@Composable
private fun EmptyFolderView() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Icon(
                Icons.Default.FolderOpen,
                contentDescription = "Media image",
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Text(
                text = "Empty Folder",
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun ErrorView(
    message: String, 
    onRetry: () -> Unit,
    showPermissionHint: Boolean = false,
    onRequestPermission: () -> Unit = {}
) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp),
            modifier = Modifier.padding(32.dp)
        ) {
            Icon(
                Icons.Default.Error,
                contentDescription = "Media image",
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.error
            )
            Text(
                text = message,
                style = MaterialTheme.typography.bodyLarge,
                color = MaterialTheme.colorScheme.error,
                textAlign = TextAlign.Center
            )
            
            if (showPermissionHint) {
                Text(
                    text = "This may be due to missing storage permissions. Grant 'All Files Access' permission to browse documents and ebooks.",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    textAlign = TextAlign.Center
                )
                
                OutlinedButton(onClick = onRequestPermission) {
                    Icon(Icons.Default.Security, contentDescription = "Security")
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Grant Permission")
                }
            }
            
            Button(onClick = onRetry) {
                Icon(Icons.Default.Refresh, contentDescription = "Refresh")
                Spacer(modifier = Modifier.width(8.dp))
                Text("Retry")
            }
        }
    }
}


private fun formatFileSize(bytes: Long): String {
    if (bytes <= 0) return "0 B"
    val units = arrayOf("B", "KB", "MB", "GB", "TB")
    val digitGroups = (log10(bytes.toDouble()) / log10(1024.0)).toInt().coerceIn(0, units.lastIndex)
    return String.format(
        java.util.Locale.US,
        "%.1f %s",
        bytes / 1024.0.pow(digitGroups.toDouble()),
        units[digitGroups]
    )
}

private fun formatDate(timestamp: Long): String {
    val sdf = SimpleDateFormat("MMM dd, yyyy", Locale.getDefault())
    return sdf.format(Date(timestamp))
}
