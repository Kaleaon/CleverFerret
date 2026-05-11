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
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.List
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
import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import java.text.SimpleDateFormat
import java.util.*


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

private enum class FileConflictChoice { REPLACE, KEEP_BOTH, SKIP }
private enum class MoveResult { SUCCESS, SKIPPED, NO_OP, PARTIAL_COPY_LEFT_SOURCE, FAILED }

private data class FileConflictRequest(
    val file: File,
    val response: CompletableDeferred<FileConflictChoice>
)

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
    val scope = rememberCoroutineScope()
    
    var currentPath by remember {
        mutableStateOf(
            initialPath ?: context.getExternalFilesDir(null)?.absolutePath 
                ?: context.filesDir.absolutePath
        )
    }
    var settings by remember { mutableStateOf(FileBrowserSettings()) }
    var selectedFiles by remember { mutableStateOf<Set<File>>(emptySet()) }
    var showSettings by remember { mutableStateOf(false) }
    var showFavoriteFolders by remember { mutableStateOf(false) }
    var favoriteFolders by remember { mutableStateOf<List<String>>(emptyList()) }
    var showFileOpsSheet by remember { mutableStateOf(false) }
    var showCopyDialog by remember { mutableStateOf(false) }
    var showMoveDialog by remember { mutableStateOf(false) }
    var showDeleteConfirmation by remember { mutableStateOf(false) }
    var conflictRequest by remember { mutableStateOf<FileConflictRequest?>(null) }
    var fileItems by remember { mutableStateOf<List<FileItem>>(emptyList()) }
    var loadingError by remember { mutableStateOf<String?>(null) }

    suspend fun awaitConflictChoice(file: File): FileConflictChoice {
        val response = CompletableDeferred<FileConflictChoice>()
        withContext(Dispatchers.Main.immediate) {
            conflictRequest = FileConflictRequest(file = file, response = response)
        }
        return response.await()
    }
    
    val currentDirectory = remember(currentPath) {
        File(currentPath)
    }
    
    // Load file items asynchronously
    LaunchedEffect(currentDirectory, settings) {
        loadingError = null
        try {
            fileItems = withContext(Dispatchers.IO) {
                loadFileItems(currentDirectory, settings)
            }
        } catch (e: SecurityException) {
            loadingError = "Permission denied: ${e.message}"
            fileItems = emptyList()
        } catch (e: Exception) {
            loadingError = "Error loading files: ${e.message}"
            fileItems = emptyList()
        }
    }
    
    Column(modifier = modifier.fillMaxSize()) {
        // Top App Bar
        TopAppBar(
            title = { Text("File Browser") },
            navigationIcon = {
                IconButton(onClick = { 
                    val parent = File(currentPath).parent
                    if (parent != null && parent != currentPath) {
                        currentPath = parent
                    }
                }) {
                    Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
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
                        if (settings.viewMode == ViewMode.LIST) Icons.Default.GridView else Icons.AutoMirrored.Filled.List,
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
                onCopy = { 
                    showFileOpsSheet = true
                },
                onMove = { 
                    showFileOpsSheet = true
                },
                onDelete = { 
                    showDeleteConfirmation = true
                },
                onCancel = { selectedFiles = emptySet() }
            )
        }
        
        if (showFileOpsSheet) {
            BottomSheetDialog(
                onDismissRequest = {
                    showFileOpsSheet = false
                },
                title = "File operations"
            ) {
                ListItem(
                    headlineContent = { Text("Copy ${selectedFiles.size} file(s)") },
                    leadingContent = { Icon(Icons.Default.ContentCopy, contentDescription = null) },
                    modifier = Modifier.clickable {
                        showCopyDialog = true
                        showFileOpsSheet = false
                    }
                )
                ListItem(
                    headlineContent = { Text("Move ${selectedFiles.size} file(s)") },
                    leadingContent = { Icon(Icons.Default.DriveFileMove, contentDescription = null) },
                    modifier = Modifier.clickable {
                        showMoveDialog = true
                        showFileOpsSheet = false
                    }
                )
            }
        }

        // Copy dialog
        if (showCopyDialog) {
            FormDialog(
                onDismissRequest = { showCopyDialog = false },
                title = { Text("Copy ${selectedFiles.size} file(s)") },
                text = { 
                    Column {
                        Text("Files will be copied to the current directory:")
                        Text(
                            text = currentPath,
                            style = MaterialTheme.typography.bodySmall,
                            modifier = Modifier.padding(top = 8.dp)
                        )
                    }
                },
                confirmButton = {
                    TextButton(
                        onClick = {
                            val filesToProcess = selectedFiles.toList()
                            scope.launch {
                                val errors = withContext(Dispatchers.IO) {
                                    val operationErrors = mutableListOf<String>()
                                    filesToProcess.forEach { file ->
                                        try {
                                            val destFile = File(currentDirectory, file.name)
                                            if (destFile.exists()) {
                                                when (awaitConflictChoice(file)) {
                                                    FileConflictChoice.REPLACE -> {
                                                        file.copyTo(destFile, overwrite = true)
                                                    }
                                                    FileConflictChoice.KEEP_BOTH -> {
                                                        val target = generateNonConflictingFile(currentDirectory, file)
                                                        file.copyTo(target, overwrite = false)
                                                    }
                                                    FileConflictChoice.SKIP -> Unit
                                                }
                                            } else {
                                                file.copyTo(destFile, overwrite = false)
                                            }
                                        } catch (e: Exception) {
                                            operationErrors += "Failed to copy ${file.name}: ${e.message}"
                                            android.util.Log.e("FileBrowser", "Failed to copy ${file.name}: ${e.message}")
                                        }
                                    }
                                    operationErrors
                                }
                                selectedFiles = emptySet()
                                showCopyDialog = false
                                conflictRequest = null
                                if (errors.isNotEmpty()) {
                                    loadingError = "Some files failed to copy. Check logs for details."
                                }
                                // Reload file list
                                fileItems = withContext(Dispatchers.IO) {
                                    loadFileItems(currentDirectory, settings)
                                }
                            }
                        }
                    ) {
                        Text("Copy")
                    }
                },
                dismissButton = {
                    TextButton(onClick = { showCopyDialog = false }) {
                        Text("Cancel")
                    }
                }
            )
        }
        
        // Move dialog
        if (showMoveDialog) {
            FormDialog(
                onDismissRequest = { showMoveDialog = false },
                title = { Text("Move ${selectedFiles.size} file(s)") },
                text = { 
                    Column {
                        Text("Files will be moved to the current directory:")
                        Text(
                            text = currentPath,
                            style = MaterialTheme.typography.bodySmall,
                            modifier = Modifier.padding(top = 8.dp)
                        )
                    }
                },
                confirmButton = {
                    TextButton(
                        onClick = {
                            val filesToProcess = selectedFiles.toList()
                            scope.launch {
                                val errors = withContext(Dispatchers.IO) {
                                    val operationErrors = mutableListOf<String>()
                                    filesToProcess.forEach { file ->
                                        try {
                                            val destFile = File(currentDirectory, file.name)
                                            val moveResult = if (destFile.exists()) {
                                                when (awaitConflictChoice(file)) {
                                                    FileConflictChoice.REPLACE -> moveFileSafely(file, destFile, overwrite = true)
                                                    FileConflictChoice.KEEP_BOTH -> {
                                                        val target = generateNonConflictingFile(currentDirectory, file)
                                                        moveFileSafely(file, target, overwrite = false)
                                                    }
                                                    FileConflictChoice.SKIP -> MoveResult.SKIPPED
                                                }
                                            } else {
                                                moveFileSafely(file, destFile, overwrite = false)
                                            }
                                            if (moveResult == MoveResult.PARTIAL_COPY_LEFT_SOURCE || moveResult == MoveResult.FAILED) {
                                                val errorMessage = when (moveResult) {
                                                    MoveResult.PARTIAL_COPY_LEFT_SOURCE ->
                                                        "Copied ${file.name}, but couldn't remove the source file."
                                                    MoveResult.FAILED -> "Failed to move ${file.name}"
                                                    MoveResult.SUCCESS, MoveResult.SKIPPED, MoveResult.NO_OP -> ""
                                                }
                                                if (errorMessage.isNotEmpty()) {
                                                    operationErrors += errorMessage
                                                    android.util.Log.e("FileBrowser", errorMessage)
                                                }
                                            }
                                        } catch (e: Exception) {
                                            operationErrors += "Failed to move ${file.name}: ${e.message}"
                                            android.util.Log.e("FileBrowser", "Failed to move ${file.name}: ${e.message}")
                                        }
                                    }
                                    operationErrors
                                }
                                selectedFiles = emptySet()
                                showMoveDialog = false
                                conflictRequest = null
                                if (errors.isNotEmpty()) {
                                    loadingError = "Some files failed to move. Check logs for details."
                                }
                                // Reload file list
                                fileItems = withContext(Dispatchers.IO) {
                                    loadFileItems(currentDirectory, settings)
                                }
                            }
                        }
                    ) {
                        Text("Move")
                    }
                },
                dismissButton = {
                    TextButton(onClick = { showMoveDialog = false }) {
                        Text("Cancel")
                    }
                }
            )
        }

        conflictRequest?.let { pendingConflict ->
            FormDialog(
                onDismissRequest = {
                    if (!pendingConflict.response.isCompleted) {
                        pendingConflict.response.complete(FileConflictChoice.SKIP)
                    }
                    conflictRequest = null
                },
                title = { Text("File name conflict") },
                text = {
                    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                        Text("A file named ${pendingConflict.file.name} already exists.")
                        Text("Choose how to continue.")
                    }
                },
                confirmButton = {
                    TextButton(
                        onClick = {
                            if (!pendingConflict.response.isCompleted) {
                                pendingConflict.response.complete(FileConflictChoice.REPLACE)
                            }
                            conflictRequest = null
                        }
                    ) {
                        Text("Replace", color = MaterialTheme.colorScheme.error)
                    }
                },
                dismissButton = {
                    Row {
                        TextButton(
                            onClick = {
                                if (!pendingConflict.response.isCompleted) {
                                    pendingConflict.response.complete(FileConflictChoice.KEEP_BOTH)
                                }
                                conflictRequest = null
                            }
                        ) {
                            Text("Keep both")
                        }
                        TextButton(
                            onClick = {
                                if (!pendingConflict.response.isCompleted) {
                                    pendingConflict.response.complete(FileConflictChoice.SKIP)
                                }
                                conflictRequest = null
                            }
                        ) {
                            Text("Skip")
                        }
                    }
                }
            )
        }
        
        // Delete confirmation dialog
        if (showDeleteConfirmation) {
            AlertDialog(
                onDismissRequest = { showDeleteConfirmation = false },
                title = { Text("Delete ${selectedFiles.size} file(s)?") },
                text = { Text("This action cannot be undone.") },
                confirmButton = {
                    TextButton(
                        onClick = {
                            scope.launch(Dispatchers.IO) {
                                selectedFiles.forEach { file ->
                                    try {
                                        file.delete()
                                    } catch (e: Exception) {
                                        // Log error but continue with other files
                                        android.util.Log.e("FileBrowser", "Failed to delete ${file.name}: ${e.message}")
                                    }
                                }
                                withContext(Dispatchers.Main) {
                                    selectedFiles = emptySet()
                                    showDeleteConfirmation = false
                                    // Reload file list
                                    fileItems = withContext(Dispatchers.IO) {
                                        loadFileItems(currentDirectory, settings)
                                    }
                                }
                            }
                        }
                    ) {
                        Text("Delete", color = MaterialTheme.colorScheme.error)
                    }
                },
                dismissButton = {
                    TextButton(onClick = { showDeleteConfirmation = false }) {
                        Text("Cancel")
                    }
                }
            )
        }
        
        // Error display
        loadingError?.let { error ->
            Surface(
                modifier = Modifier.fillMaxWidth(),
                color = MaterialTheme.colorScheme.errorContainer
            ) {
                Text(
                    text = error,
                    modifier = Modifier.padding(16.dp),
                    color = MaterialTheme.colorScheme.onErrorContainer
                )
            }
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
            currentPath = currentPath,
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








@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun BottomSheetDialog(
    onDismissRequest: () -> Unit,
    title: String,
    content: @Composable ColumnScope.() -> Unit
) {
    ModalBottomSheet(onDismissRequest = onDismissRequest) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 24.dp)
        ) {
            Text(
                text = title,
                style = MaterialTheme.typography.titleMedium,
                modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp)
            )
            content()
        }
    }
}

@Composable
private fun FormDialog(
    onDismissRequest: () -> Unit,
    title: @Composable () -> Unit,
    text: @Composable () -> Unit,
    confirmButton: @Composable () -> Unit,
    dismissButton: @Composable (() -> Unit)? = null
) {
    AlertDialog(
        onDismissRequest = onDismissRequest,
        title = title,
        text = text,
        confirmButton = confirmButton,
        dismissButton = dismissButton
    )
}


private fun generateNonConflictingFile(directory: File, sourceFile: File): File {
    val extension = sourceFile.extension
    val baseName = if (extension.isBlank()) sourceFile.name else sourceFile.nameWithoutExtension
    val suffix = if (extension.isBlank()) "" else ".$extension"
    var counter = 1
    var candidate = File(directory, "${baseName}_$counter$suffix")
    while (candidate.exists()) {
        counter++
        candidate = File(directory, "${baseName}_$counter$suffix")
    }
    return candidate
}

private fun moveFileSafely(source: File, destination: File, overwrite: Boolean): MoveResult {
    val isSameFile = runCatching { source.canonicalPath == destination.canonicalPath }
        .getOrElse { source.absolutePath == destination.absolutePath }
    if (isSameFile) {
        return MoveResult.NO_OP
    }

    return try {
        if (source.renameTo(destination)) {
            MoveResult.SUCCESS
        } else {
            source.copyTo(destination, overwrite = overwrite)
            if (source.delete()) {
                MoveResult.SUCCESS
            } else {
                android.util.Log.w("FileBrowser", "Copied ${source.name}, but failed to delete source file.")
                MoveResult.PARTIAL_COPY_LEFT_SOURCE
            }
        }
    } catch (e: Exception) {
        android.util.Log.e("FileBrowser", "Failed to move ${source.name}: ${e.message}")
        MoveResult.FAILED
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
