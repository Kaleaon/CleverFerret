package com.universalmedialibrary.ui.filepicker

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
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.ui.components.UserFeedbackMessage
import com.universalmedialibrary.ui.components.UserFeedbackSeverity
import com.universalmedialibrary.ui.components.UserFeedbackSnackbarHost
import com.universalmedialibrary.ui.components.showUserFeedback
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
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val snackbarHostState = remember { SnackbarHostState() }

    LaunchedEffect(uiState.error) {
        val error = uiState.error ?: return@LaunchedEffect
        val result = snackbarHostState.showUserFeedback(
            UserFeedbackMessage(
                title = "Unable to open folder",
                body = error,
                severity = UserFeedbackSeverity.ERROR,
                actionLabel = "Retry"
            )
        )
        if (result == SnackbarResult.ActionPerformed) {
            viewModel.refresh()
        }
        viewModel.clearError()
    }

    Scaffold(
        snackbarHost = {
            UserFeedbackSnackbarHost(hostState = snackbarHostState)
        },
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
                    contentDescription = "Media image",
                    tint = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
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



// ViewMode enum is defined in EnhancedFileBrowser.kt to avoid duplication
