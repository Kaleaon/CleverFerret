package com.universalmedialibrary.ui.filepicker

import android.os.Build
import android.os.Environment
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
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
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleEventObserver
import androidx.lifecycle.compose.LocalLifecycleOwner
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.utils.PermissionsHandler
import java.io.File
import java.text.SimpleDateFormat
import java.util.*
import kotlin.math.log10
import kotlin.math.pow

/**
 * Storage Browser Screen - Moon+ Reader style file navigation
 * Beautiful interface for browsing device storage and selecting media files
 */
@OptIn(ExperimentalMaterial3Api::class, ExperimentalFoundationApi::class)
@Composable
fun StorageBrowserScreen(
    onNavigateBack: () -> Unit,
    onFileSelected: (File) -> Unit,
    filterMediaTypes: List<String> = listOf("epub", "pdf", "mp3", "mp4", "mkv", "cbz", "cbr"),
    viewModel: StorageBrowserViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    
    // Check for full storage access permission (needed for documents/ebooks on Android 11+)
    var permissionChecked by remember { 
        mutableStateOf(PermissionsHandler.hasFullStorageAccess(context)) 
    }
    
    // Re-check permission when screen resumes (user might have granted it in settings)
    val lifecycleOwner = LocalLifecycleOwner.current
    DisposableEffect(lifecycleOwner) {
        val observer = LifecycleEventObserver { _, event ->
            if (event == Lifecycle.Event.ON_RESUME) {
                permissionChecked = PermissionsHandler.hasFullStorageAccess(context)
            }
        }
        lifecycleOwner.lifecycle.addObserver(observer)
        onDispose {
            lifecycleOwner.lifecycle.removeObserver(observer)
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Column {
                        Text("Storage Browser", style = MaterialTheme.typography.titleMedium)
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
                                Icon(Icons.Default.GridView, contentDescription = null)
                            }
                        )
                        DropdownMenuItem(
                            text = { Text("List View") },
                            onClick = {
                                viewModel.setViewMode(ViewMode.LIST)
                                showMenu = false
                            },
                            leadingIcon = {
                                Icon(Icons.AutoMirrored.Filled.ViewList, contentDescription = null)
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
                                    contentDescription = null
                                )
                            }
                        )
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Show permission request card if needed (Android 11+)
            if (!permissionChecked && Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                StoragePermissionCard(
                    onRequestPermission = {
                        PermissionsHandler.requestFullStorageAccess(context)
                    },
                    modifier = Modifier.fillMaxSize()
                )
            } else {
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
                            onRetry = { viewModel.refresh() },
                            showPermissionHint = Build.VERSION.SDK_INT >= Build.VERSION_CODES.R,
                            onRequestPermission = {
                                PermissionsHandler.requestFullStorageAccess(context)
                            }
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
                                FileItem(
                                    file = file,
                                    viewMode = uiState.viewMode,
                                    onClick = {
                                        if (file.isDirectory) {
                                            viewModel.navigateInto(file)
                                        } else {
                                            onFileSelected(file)
                                        }
                                    },
                                    modifier = Modifier
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
private fun QuickAccessBar(
    onPathSelected: (String) -> Unit,
    modifier: Modifier = Modifier
) {
    // Retrieve standard external storage paths via Android APIs
    val externalStorage = Environment.getExternalStorageDirectory().absolutePath
    val downloadsDir = Environment
        .getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
        .absolutePath
    val documentsDir = Environment
        .getExternalStoragePublicDirectory(Environment.DIRECTORY_DOCUMENTS)
        .absolutePath
    val dcimDir = Environment
        .getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM)
        .absolutePath
    val musicDir = Environment
        .getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC)
        .absolutePath

    Row(
        modifier = modifier
            .padding(8.dp)
            .horizontalScroll(rememberScrollState()),
        horizontalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        QuickAccessChip(
            label = "Internal",
            icon = Icons.Default.PhoneAndroid,
            onClick = { onPathSelected(externalStorage) }
        )
        QuickAccessChip(
            label = "Downloads",
            icon = Icons.Default.Download,
            onClick = { onPathSelected(downloadsDir) }
        )
        QuickAccessChip(
            label = "Documents",
            icon = Icons.Default.Folder,
            onClick = { onPathSelected(documentsDir) }
        )
        QuickAccessChip(
            label = "DCIM",
            icon = Icons.Default.PhotoLibrary,
            onClick = { onPathSelected(dcimDir) }
        )
        QuickAccessChip(
            label = "Music",
            icon = Icons.Default.MusicNote,
            onClick = { onPathSelected(musicDir) }
        )
    }
}

@Composable
private fun QuickAccessChip(
    label: String,
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    onClick: () -> Unit
) {
    AssistChip(
        onClick = onClick,
        label = { Text(label) },
        leadingIcon = {
            Icon(
                icon,
                contentDescription = null,
                modifier = Modifier.size(18.dp)
            )
        }
    )
}

@Composable
private fun FileItem(
    file: File,
    viewMode: ViewMode,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(12.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Icon
            FileIcon(file = file)

            // File info
            Column(
                modifier = Modifier.weight(1f),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                Text(
                    text = file.name,
                    style = MaterialTheme.typography.bodyLarge,
                    fontWeight = FontWeight.Medium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )

                Row(
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    if (file.isFile) {
                        Text(
                            text = formatFileSize(file.length()),
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    } else {
                        val itemCount = file.listFiles()?.size ?: 0
                        Text(
                            text = "$itemCount items",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }

                    Text(
                        text = formatDate(file.lastModified()),
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            // Chevron for folders
            if (file.isDirectory) {
                Icon(
                    Icons.Default.ChevronRight,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@Composable
private fun FileIcon(file: File) {
    val (icon, gradient) = when {
        file.isDirectory -> Icons.Default.Folder to listOf(Color(0xFFFFA726), Color(0xFFFF6F00))
        file.extension.lowercase() in listOf("epub", "pdf", "txt", "mobi") -> 
            Icons.Default.Book to listOf(Color(0xFF1B5E20), Color(0xFF4CAF50))
        file.extension.lowercase() in listOf("mp3", "m4a", "flac", "wav") -> 
            Icons.Default.MusicNote to listOf(Color(0xFF4A148C), Color(0xFF9C27B0))
        file.extension.lowercase() in listOf("mp4", "mkv", "avi", "mov") -> 
            Icons.Default.Movie to listOf(Color(0xFF0D47A1), Color(0xFF2196F3))
        file.extension.lowercase() in listOf("cbz", "cbr", "cb7") -> 
            Icons.Default.AutoStories to listOf(Color(0xFFE65100), Color(0xFFFF9800))
        file.extension.lowercase() in listOf("jpg", "jpeg", "png", "gif") -> 
            Icons.Default.Image to listOf(Color(0xFF006064), Color(0xFF00BCD4))
        else -> Icons.AutoMirrored.Filled.InsertDriveFile to listOf(Color(0xFF37474F), Color(0xFF78909C))
    }

    Box(
        modifier = Modifier
            .size(48.dp)
            .clip(CircleShape)
            .background(Brush.linearGradient(gradient)),
        contentAlignment = Alignment.Center
    ) {
        Icon(
            icon,
            contentDescription = null,
            tint = Color.White,
            modifier = Modifier.size(24.dp)
        )
    }
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
                contentDescription = null,
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
                contentDescription = null,
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
                    Icon(Icons.Default.Security, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Grant Permission")
                }
            }
            
            Button(onClick = onRetry) {
                Icon(Icons.Default.Refresh, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Retry")
            }
        }
    }
}

@Composable
private fun StoragePermissionCard(
    onRequestPermission: () -> Unit,
    modifier: Modifier = Modifier
) {
    Box(
        modifier = modifier,
        contentAlignment = Alignment.Center
    ) {
        Card(
            modifier = Modifier
                .padding(24.dp)
                .fillMaxWidth(),
            colors = CardDefaults.cardColors(
                containerColor = MaterialTheme.colorScheme.surfaceVariant
            )
        ) {
            Column(
                modifier = Modifier.padding(24.dp),
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Icon(
                    Icons.Default.Folder,
                    contentDescription = null,
                    modifier = Modifier.size(72.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
                
                Text(
                    text = "Storage Access Required",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold,
                    textAlign = TextAlign.Center
                )
                
                Text(
                    text = "To browse and open ebooks, documents, and other files from your device storage, CleverFerret needs 'All Files Access' permission.",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    textAlign = TextAlign.Center
                )
                
                Text(
                    text = "This permission allows the app to read files like EPUB, PDF, MOBI, and other document formats stored on your device.",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    textAlign = TextAlign.Center
                )
                
                Spacer(modifier = Modifier.height(8.dp))
                
                Button(
                    onClick = onRequestPermission,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(Icons.Default.Security, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Grant Access")
                }
                
                Text(
                    text = "You'll be taken to system settings. Find 'CleverFerret' and enable 'Allow access to manage all files'.",
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.7f),
                    textAlign = TextAlign.Center
                )
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

// ViewMode enum is defined in EnhancedFileBrowser.kt to avoid duplication
