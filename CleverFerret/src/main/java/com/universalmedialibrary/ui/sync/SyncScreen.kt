package com.universalmedialibrary.ui.sync

import androidx.compose.animation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.services.sync.*
import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import java.text.SimpleDateFormat
import java.util.*

@Suppress("LongMethod", "FunctionNaming")
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SyncScreen(
    navController: NavController,
    viewModel: SyncViewModel = hiltViewModel(),
    onNavigateToAuth: (() -> Unit)? = null
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val syncState by viewModel.syncState.collectAsStateWithLifecycle()
    val syncOptions by viewModel.syncOptions.collectAsStateWithLifecycle()

    var showOptions by remember { mutableStateOf(false) }

    val handleReauthenticate: () -> Unit = onNavigateToAuth ?: {
        try {
            navController.navigate(MediaRoutes.SETTINGS_ACCOUNTS)
        } catch (_: Exception) {
            navController.navigate(MediaRoutes.SETTINGS)
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Sync") },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
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
                        uiState = uiState,
                        onStartSync = { viewModel.startSync() },
                        onRetry = { viewModel.startSync() },
                        onReauthenticate = handleReauthenticate
                    )
                }

                // Error Card
                if (uiState.error != null) {
                    item {
                        ErrorCard(
                            error = uiState.error!!,
                            errorType = uiState.errorType ?: classifySyncError(uiState.error),
                            isSyncing = uiState.isSyncing,
                            onRetry = { viewModel.startSync() },
                            onReauthenticate = handleReauthenticate,
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

@Suppress("FunctionNaming")
@Composable
private fun SyncStatusCard(
    syncState: EnhancedSyncState,
    uiState: SyncUiState,
    onStartSync: () -> Unit,
    onRetry: () -> Unit = onStartSync,
    onReauthenticate: () -> Unit = {}
) {
    val hasError = syncState.error != null || syncState.syncStatus == SyncStatus.ERROR || uiState.error != null
    val effectiveError = uiState.error ?: syncState.error ?: syncState.errorMessage
    val effectiveErrorType = uiState.errorType ?: classifySyncError(effectiveError)

    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier.padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            SyncStatusIcon(hasError = hasError, isLoading = syncState.isLoading)
            Spacer(modifier = Modifier.height(16.dp))
            SyncStatusHeadline(hasError = hasError, syncState = syncState)
            SyncStatusBody(
                hasError = hasError,
                effectiveError = effectiveError,
                effectiveErrorType = effectiveErrorType,
                uiState = uiState
            )
            Spacer(modifier = Modifier.height(16.dp))
            if (hasError) {
                SyncErrorActionButtons(
                    errorType = effectiveErrorType,
                    isSyncing = uiState.isSyncing,
                    onRetry = onRetry,
                    onReauthenticate = onReauthenticate
                )
            } else {
                NormalSyncButton(isSyncing = uiState.isSyncing, onStartSync = onStartSync)
            }
        }
    }
}

@Suppress("FunctionNaming")
@Composable
private fun SyncStatusIcon(hasError: Boolean, isLoading: Boolean) {
    val icon = if (hasError) {
        Icons.Default.SyncProblem
    } else if (isLoading) {
        Icons.Default.Sync
    } else {
        Icons.Default.CloudSync
    }
    val tint = if (hasError) {
        MaterialTheme.colorScheme.error
    } else if (isLoading) {
        MaterialTheme.colorScheme.primary
    } else {
        MaterialTheme.colorScheme.onSurfaceVariant
    }
    Icon(
        imageVector = icon,
        contentDescription = "Sync status",
        modifier = Modifier.size(64.dp),
        tint = tint
    )
}

@Suppress("FunctionNaming")
@Composable
private fun SyncStatusHeadline(hasError: Boolean, syncState: EnhancedSyncState) {
    val headline = if (syncState.isLoading) {
        syncState.status.ifEmpty { "Syncing..." }
    } else if (hasError) {
        "Sync Failed"
    } else if (syncState.lastSyncTime > 0L) {
        "Up to Date"
    } else {
        "Ready to Sync"
    }
    Text(
        text = headline,
        style = MaterialTheme.typography.titleLarge
    )
}

@Suppress("FunctionNaming")
@Composable
private fun SyncStatusBody(
    hasError: Boolean,
    effectiveError: String?,
    effectiveErrorType: SyncErrorType,
    uiState: SyncUiState
) {
    if (hasError) {
        Spacer(modifier = Modifier.height(8.dp))
        Text(
            text = effectiveError?.ifBlank { "Synchronization failed due to an error." }
                ?: "Synchronization failed due to an error.",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.error,
            textAlign = TextAlign.Center
        )
        Spacer(modifier = Modifier.height(4.dp))
        Text(
            text = getSyncErrorDiagnosticTip(effectiveErrorType, effectiveError),
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            textAlign = TextAlign.Center
        )
    } else {
        if (uiState.lastSyncTime != null) {
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = "Last sync: ${formatSyncTime(uiState.lastSyncTime)}",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
        if (uiState.lastSyncResult != null && !uiState.isSyncing) {
            Spacer(modifier = Modifier.height(8.dp))
            Row(horizontalArrangement = Arrangement.spacedBy(16.dp)) {
                SyncStat("↕", uiState.lastSyncResult.itemsSynced, "Synced")
                if (uiState.lastSyncResult.conflictsDetected > 0) {
                    SyncStat("⚠", uiState.lastSyncResult.conflictsDetected, "Conflicts")
                }
            }
        }
    }
}

@Suppress("FunctionNaming")
@Composable
private fun NormalSyncButton(isSyncing: Boolean, onStartSync: () -> Unit) {
    Button(
        onClick = onStartSync,
        enabled = !isSyncing,
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

@Suppress("FunctionNaming")
@Composable
private fun SyncErrorActionButtons(
    errorType: SyncErrorType,
    isSyncing: Boolean,
    onRetry: () -> Unit,
    onReauthenticate: () -> Unit
) {
    if (errorType == SyncErrorType.AUTH_EXPIRED) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Button(
                onClick = onReauthenticate,
                enabled = !isSyncing,
                modifier = Modifier.weight(1f)
            ) {
                Icon(Icons.Default.Lock, contentDescription = null, modifier = Modifier.size(18.dp))
                Spacer(modifier = Modifier.width(6.dp))
                Text("Re-authenticate")
            }
            OutlinedButton(
                onClick = onRetry,
                enabled = !isSyncing,
                modifier = Modifier.weight(1f)
            ) {
                if (isSyncing) {
                    CircularProgressIndicator(modifier = Modifier.size(18.dp), strokeWidth = 2.dp)
                    Spacer(modifier = Modifier.width(6.dp))
                } else {
                    Icon(Icons.Default.Refresh, contentDescription = null, modifier = Modifier.size(18.dp))
                    Spacer(modifier = Modifier.width(6.dp))
                }
                Text(if (isSyncing) "Syncing..." else "Retry")
            }
        }
    } else {
        Button(
            onClick = onRetry,
            enabled = !isSyncing,
            modifier = Modifier.fillMaxWidth()
        ) {
            if (isSyncing) {
                CircularProgressIndicator(
                    modifier = Modifier.size(24.dp),
                    color = MaterialTheme.colorScheme.onPrimary
                )
                Spacer(modifier = Modifier.width(8.dp))
            } else {
                Icon(Icons.Default.Refresh, contentDescription = null, modifier = Modifier.size(18.dp))
                Spacer(modifier = Modifier.width(6.dp))
            }
            Text(if (isSyncing) "Syncing..." else "Retry")
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

@Suppress("FunctionNaming", "LongParameterList")
@Composable
fun ErrorCard(
    error: String,
    errorType: SyncErrorType = SyncErrorType.UNKNOWN,
    isSyncing: Boolean = false,
    onRetry: () -> Unit = {},
    onReauthenticate: () -> Unit = {},
    onDismiss: () -> Unit = {}
) {
    val displayError = error.ifBlank { "Synchronization failed due to an error." }
    val diagnosticTip = getSyncErrorDiagnosticTip(errorType, displayError)

    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.errorContainer
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            ErrorCardHeader(onDismiss = onDismiss)

            Spacer(modifier = Modifier.height(8.dp))

            Text(
                text = displayError,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onErrorContainer
            )

            Spacer(modifier = Modifier.height(4.dp))

            Text(
                text = diagnosticTip,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onErrorContainer.copy(alpha = 0.85f)
            )

            Spacer(modifier = Modifier.height(12.dp))

            ErrorCardActions(
                errorType = errorType,
                isSyncing = isSyncing,
                onRetry = onRetry,
                onReauthenticate = onReauthenticate
            )
        }
    }
}

@Suppress("FunctionNaming")
@Composable
private fun ErrorCardHeader(onDismiss: () -> Unit) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Row(
            modifier = Modifier.weight(1f),
            horizontalArrangement = Arrangement.spacedBy(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                Icons.Default.ErrorOutline,
                contentDescription = "Sync error",
                tint = MaterialTheme.colorScheme.onErrorContainer
            )
            Text(
                text = "Sync Error",
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.onErrorContainer
            )
        }
        IconButton(onClick = onDismiss) {
            Icon(
                Icons.Default.Close,
                contentDescription = "Dismiss",
                tint = MaterialTheme.colorScheme.onErrorContainer
            )
        }
    }
}

@Suppress("FunctionNaming")
@Composable
private fun ErrorCardActions(
    errorType: SyncErrorType,
    isSyncing: Boolean,
    onRetry: () -> Unit,
    onReauthenticate: () -> Unit
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        Button(
            onClick = onRetry,
            enabled = !isSyncing,
            colors = ButtonDefaults.buttonColors(
                containerColor = MaterialTheme.colorScheme.error,
                contentColor = MaterialTheme.colorScheme.onError
            ),
            modifier = if (errorType == SyncErrorType.AUTH_EXPIRED) Modifier.weight(1f) else Modifier.fillMaxWidth()
        ) {
            if (isSyncing) {
                CircularProgressIndicator(
                    modifier = Modifier.size(16.dp),
                    color = MaterialTheme.colorScheme.onError,
                    strokeWidth = 2.dp
                )
                Spacer(modifier = Modifier.width(6.dp))
            } else {
                Icon(Icons.Default.Refresh, contentDescription = null, modifier = Modifier.size(16.dp))
                Spacer(modifier = Modifier.width(6.dp))
            }
            Text(if (isSyncing) "Syncing..." else "Retry")
        }

        if (errorType == SyncErrorType.AUTH_EXPIRED) {
            FilledTonalButton(
                onClick = onReauthenticate,
                enabled = !isSyncing,
                modifier = Modifier.weight(1f)
            ) {
                Icon(Icons.Default.Lock, contentDescription = null, modifier = Modifier.size(16.dp))
                Spacer(modifier = Modifier.width(6.dp))
                Text("Re-authenticate")
            }
        }
    }
}

@Composable
private fun ConflictCard(
    conflict: EnhancedSyncConflict,
    remainingConflicts: Int,
    onResolve: (EnhancedConflictResolution) -> Unit,
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
                formatConflictDescription(conflict.itemType),
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
                    onClick = { onResolve(EnhancedConflictResolution.USE_LOCAL) },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text("Use Local Version")
                }
                Button(
                    onClick = { onResolve(EnhancedConflictResolution.USE_REMOTE) },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text("Use Cloud Version")
                }
                Button(
                    onClick = { onResolve(EnhancedConflictResolution.USE_NEWER) },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text("Use Newest")
                }
                if (conflict.conflictType == ConflictType.MODIFY_MODIFY) {
                    Button(
                        onClick = { onResolve(EnhancedConflictResolution.MERGE) },
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
                    checked = syncOptions.syncOnlyOnWifi,
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

            DetailRow("Synced", "${result.itemsSynced} items")
            DetailRow("Conflicts Detected", "${result.conflictsDetected} items")
            DetailRow("Conflicts Resolved", "${result.conflictsResolved} items")
            if (!result.success) {
                DetailRow("Error", result.error ?: "Unknown error")
            }
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

            items(EnhancedConflictResolution.values().toList()) { resolution ->
                ListItem(
                    headlineContent = { Text(resolution.name.replace("_", " ")) },
                    leadingContent = {
                        RadioButton(
                            selected = tempOptions.conflictResolution == resolution,
                            onClick = {
                                tempOptions = tempOptions.copy(conflictResolution = resolution)
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
                        checked = tempOptions.syncOnlyOnWifi,
                        onCheckedChange = { tempOptions = tempOptions.copy(syncOnlyOnWifi = it) }
                    )
                }
            }

            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Sync Media Files")
                    Switch(
                        checked = tempOptions.syncMediaFiles,
                        onCheckedChange = { tempOptions = tempOptions.copy(syncMediaFiles = it) }
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

/**
 * Format conflict type for user-friendly display
 */
private fun formatConflictDescription(itemType: String): String {
    return when (itemType.uppercase()) {
        "READING_PROGRESS" -> "Reading position sync conflict"
        "BOOKMARKS" -> "Bookmark sync conflict"
        "MEDIA_ITEM" -> "Media item metadata conflict"
        "ANNOTATION" -> "Annotation sync conflict"
        "SETTINGS" -> "Settings sync conflict"
        else -> "Sync conflict in $itemType"
    }
}
