package com.universalmedialibrary.ui.sync

import androidx.compose.animation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.services.sync.*
import java.text.SimpleDateFormat
import java.util.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SyncScreen(
    navController: NavController,
    viewModel: SyncViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val syncState by viewModel.syncState.collectAsState()
    val syncOptions by viewModel.syncOptions.collectAsState()

    var showOptions by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Sync") },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { showOptions = true }) {
                        Icon(Icons.Default.Settings, "Sync Settings")
                    }
                }
            )
        }
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Sync Status Card
                item {
                    SyncStatusCard(
                        syncState = syncState,
                        lastSyncTime = uiState.lastSyncTime,
                        lastSyncResult = uiState.lastSyncResult,
                        isSyncing = uiState.isSyncing,
                        onStartSync = { viewModel.startSync() }
                    )
                }

                // Error Card
                if (uiState.error != null) {
                    item {
                        ErrorCard(
                            error = uiState.error!!,
                            onDismiss = viewModel::clearError
                        )
                    }
                }

                // Conflict Resolution
                if (uiState.currentConflict != null) {
                    item {
                        ConflictCard(
                            conflict = uiState.currentConflict!!,
                            remainingConflicts = uiState.pendingConflicts.size - 1,
                            onResolve = { resolution ->
                                viewModel.handleConflict(uiState.currentConflict!!, resolution)
                            },
                            onSkip = viewModel::skipConflict
                        )
                    }
                }

                // Sync Options
                item {
                    SyncOptionsCard(
                        syncOptions = syncOptions,
                        onToggleAutoSync = viewModel::toggleAutoSync,
                        onShowFullOptions = { showOptions = true }
                    )
                }

                // Last Sync Details
                if (uiState.lastSyncResult != null) {
                    item {
                        LastSyncDetailsCard(result = uiState.lastSyncResult!!)
                    }
                }
            }

            // Sync Complete Snackbar
            if (uiState.showSyncComplete) {
                Snackbar(
                    modifier = Modifier
                        .align(Alignment.BottomCenter)
                        .padding(16.dp),
                    action = {
                        TextButton(onClick = viewModel::dismissSyncComplete) {
                            Text("OK")
                        }
                    }
                ) {
                    Text("Sync completed successfully")
                }
            }

            // Options Bottom Sheet
            if (showOptions) {
                SyncOptionsBottomSheet(
                    options = syncOptions,
                    onDismiss = { showOptions = false },
                    onOptionsChange = viewModel::updateSyncOptions
                )
            }
        }
    }
}

@Composable
private fun SyncStatusCard(
    syncState: SyncState,
    lastSyncTime: Long?,
    lastSyncResult: SyncResult?,
    isSyncing: Boolean,
    onStartSync: () -> Unit
) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier.padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            // Status Icon
            Icon(
                when (syncState) {
                    SyncState.SYNCING -> Icons.Default.Sync
                    SyncState.CONFLICT -> Icons.Default.Warning
                    SyncState.ERROR -> Icons.Default.Error
                    SyncState.SUCCESS -> Icons.Default.CheckCircle
                    else -> Icons.Default.CloudSync
                },
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = when (syncState) {
                    SyncState.ERROR -> MaterialTheme.colorScheme.error
                    SyncState.SUCCESS -> MaterialTheme.colorScheme.primary
                    SyncState.CONFLICT -> MaterialTheme.colorScheme.tertiary
                    else -> MaterialTheme.colorScheme.onSurfaceVariant
                }
            )

            Spacer(modifier = Modifier.height(16.dp))

            // Status Text
            Text(
                text = when (syncState) {
                    SyncState.IDLE -> "Ready to Sync"
                    SyncState.SYNCING -> "Syncing..."
                    SyncState.CONFLICT -> "Conflicts Detected"
                    SyncState.ERROR -> "Sync Failed"
                    SyncState.SUCCESS -> "Up to Date"
                },
                style = MaterialTheme.typography.titleLarge
            )

            // Last Sync Time
            if (lastSyncTime != null) {
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    "Last sync: ${formatSyncTime(lastSyncTime)}",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            // Last Sync Summary
            if (lastSyncResult != null && !isSyncing) {
                Spacer(modifier = Modifier.height(8.dp))
                Row(
                    horizontalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    SyncStat("↑", lastSyncResult.uploadedCount, "Uploaded")
                    SyncStat("↓", lastSyncResult.downloadedCount, "Downloaded")
                    if (lastSyncResult.conflictCount > 0) {
                        SyncStat("⚠", lastSyncResult.conflictCount, "Conflicts")
                    }
                }
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Sync Button
            Button(
                onClick = onStartSync,
                enabled = !isSyncing && syncState != SyncState.CONFLICT,
                modifier = Modifier.fillMaxWidth()
            ) {
                if (isSyncing) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(24.dp),
                        color = MaterialTheme.colorScheme.onPrimary
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                }
                Text(if (isSyncing) "Syncing..." else "Start Sync")
            }
        }
    }
}

@Composable
private fun SyncStat(icon: String, count: Int, label: String) {
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Text(
            "$icon $count",
            style = MaterialTheme.typography.titleMedium
        )
        Text(
            label,
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@Composable
private fun ErrorCard(error: String, onDismiss: () -> Unit) {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.errorContainer
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row(
                modifier = Modifier.weight(1f),
                horizontalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                Icon(
                    Icons.Default.Error,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.onErrorContainer
                )
                Text(
                    error,
                    color = MaterialTheme.colorScheme.onErrorContainer
                )
            }
            IconButton(onClick = onDismiss) {
                Icon(
                    Icons.Default.Close,
                    "Dismiss",
                    tint = MaterialTheme.colorScheme.onErrorContainer
                )
            }
        }
    }
}

@Composable
private fun ConflictCard(
    conflict: SyncConflict,
    remainingConflicts: Int,
    onResolve: (ConflictResolution) -> Unit,
    onSkip: () -> Unit
) {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.tertiaryContainer
        )
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text(
                    "Sync Conflict",
                    style = MaterialTheme.typography.titleMedium
                )
                if (remainingConflicts > 0) {
                    Text(
                        "+$remainingConflicts more",
                        style = MaterialTheme.typography.bodySmall
                    )
                }
            }

            Spacer(modifier = Modifier.height(8.dp))

            Text(
                conflict.description,
                style = MaterialTheme.typography.bodyMedium
            )

            Spacer(modifier = Modifier.height(16.dp))

            Text(
                "Choose resolution:",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Spacer(modifier = Modifier.height(8.dp))

            // Resolution Buttons
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Button(
                    onClick = { onResolve(ConflictResolution.USE_LOCAL) },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text("Use Local Version")
                }
                Button(
                    onClick = { onResolve(ConflictResolution.USE_REMOTE) },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text("Use Cloud Version")
                }
                Button(
                    onClick = { onResolve(ConflictResolution.USE_NEWER) },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text("Use Newest")
                }
                if (conflict.type == ConflictType.MODIFY_MODIFY) {
                    Button(
                        onClick = { onResolve(ConflictResolution.MERGE) },
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text("Merge Changes")
                    }
                }
                TextButton(
                    onClick = onSkip,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text("Skip for Now")
                }
            }
        }
    }
}

@Composable
private fun SyncOptionsCard(
    syncOptions: SyncOptions,
    onToggleAutoSync: (Boolean) -> Unit,
    onShowFullOptions: () -> Unit
) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text(
                "Sync Settings",
                style = MaterialTheme.typography.titleMedium
            )

            Spacer(modifier = Modifier.height(16.dp))

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text("Auto Sync")
                    Text(
                        "Sync automatically in background",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(
                    checked = syncOptions.enableAutoSync,
                    onCheckedChange = onToggleAutoSync
                )
            }

            Spacer(modifier = Modifier.height(8.dp))

            TextButton(
                onClick = onShowFullOptions,
                modifier = Modifier.align(Alignment.End)
            ) {
                Text("More Options")
            }
        }
    }
}

@Composable
private fun LastSyncDetailsCard(result: SyncResult) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text(
                "Last Sync Details",
                style = MaterialTheme.typography.titleMedium
            )

            Spacer(modifier = Modifier.height(16.dp))

            DetailRow("Uploaded", "${result.uploadedCount} items")
            DetailRow("Downloaded", "${result.downloadedCount} items")
            DetailRow("Conflicts", "${result.conflictCount} items")
            DetailRow("Errors", "${result.errorCount} items")
            DetailRow("Duration", "${result.duration}ms")
        }
    }
}

@Composable
private fun DetailRow(label: String, value: String) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(
            label,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Text(value)
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun SyncOptionsBottomSheet(
    options: SyncOptions,
    onDismiss: () -> Unit,
    onOptionsChange: (SyncOptions) -> Unit
) {
    var tempOptions by remember { mutableStateOf(options) }

    ModalBottomSheet(onDismissRequest = onDismiss) {
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            item {
                Text(
                    "Sync Options",
                    style = MaterialTheme.typography.titleLarge
                )
                Spacer(modifier = Modifier.height(16.dp))
            }

            item {
                Text("Conflict Resolution", style = MaterialTheme.typography.titleSmall)
                Spacer(modifier = Modifier.height(8.dp))
            }

            items(ConflictResolution.values().toList()) { resolution ->
                ListItem(
                    headlineContent = { Text(resolution.name.replace("_", " ")) },
                    leadingContent = {
                        RadioButton(
                            selected = tempOptions.defaultConflictResolution == resolution,
                            onClick = {
                                tempOptions = tempOptions.copy(defaultConflictResolution = resolution)
                            }
                        )
                    }
                )
            }

            item {
                Spacer(modifier = Modifier.height(16.dp))
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("WiFi Only")
                    Switch(
                        checked = tempOptions.wifiOnly,
                        onCheckedChange = { tempOptions = tempOptions.copy(wifiOnly = it) }
                    )
                }
            }

            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Compress Uploads")
                    Switch(
                        checked = tempOptions.compressUploads,
                        onCheckedChange = { tempOptions = tempOptions.copy(compressUploads = it) }
                    )
                }
            }

            item {
                Spacer(modifier = Modifier.height(24.dp))
                Button(
                    onClick = {
                        onOptionsChange(tempOptions)
                        onDismiss()
                    },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text("Save Options")
                }
                Spacer(modifier = Modifier.height(32.dp))
            }
        }
    }
}

private fun formatSyncTime(timestamp: Long): String {
    val now = System.currentTimeMillis()
    val diff = now - timestamp
    
    return when {
        diff < 60_000 -> "Just now"
        diff < 3600_000 -> "${diff / 60_000}m ago"
        diff < 86400_000 -> "${diff / 3600_000}h ago"
        else -> {
            val sdf = SimpleDateFormat("MMM dd, HH:mm", Locale.getDefault())
            sdf.format(Date(timestamp))
        }
    }
}
