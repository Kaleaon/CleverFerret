package com.universalmedialibrary.ui.media

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.LiveRegionMode
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.cleverferret.core.designsystem.theme.LocalLiveRegionManager
import com.universalmedialibrary.data.local.entity.PlexServer
import com.universalmedialibrary.services.plex.PlexSyncStatus
import com.universalmedialibrary.ui.components.AccessibleOutlinedTextField
import com.universalmedialibrary.ui.components.dynamicStateDescription
import com.universalmedialibrary.ui.components.media.*
import com.universalmedialibrary.ui.icons.PhosphorIcons
import com.universalmedialibrary.ui.sync.SyncErrorType
import com.universalmedialibrary.ui.sync.classifySyncError
import com.universalmedialibrary.ui.sync.getSyncErrorDiagnosticTip
import java.text.SimpleDateFormat
import java.util.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaSyncScreen(
    modifier: Modifier = Modifier,
    viewModel: MediaSyncViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val servers by viewModel.servers.collectAsStateWithLifecycle()
    val syncStatus by viewModel.syncStatus.collectAsStateWithLifecycle()
    val liveRegionManager = LocalLiveRegionManager.current

    // Show add server dialog
    if (uiState.showAddServerDialog) {
        AddPlexServerDialog(
            onDismiss = { viewModel.hideAddServerDialog() },
            onAddServer = { name, host, port, token ->
                viewModel.addServer(name, host, port, token)
            }
        )
    }

    // Announce sync status transitions to screen readers
    LaunchedEffect(syncStatus) {
        when (val status = syncStatus) {
            is PlexSyncStatus.Idle -> Unit
            is PlexSyncStatus.Syncing -> liveRegionManager.announcePolite(status.message)
            is PlexSyncStatus.Success -> liveRegionManager.announcePolite(status.message)
            is PlexSyncStatus.Error -> liveRegionManager.announceAssertive("Sync error: ${status.message}")
        }
    }

    // Show messages
    LaunchedEffect(uiState.errorMessage) {
        uiState.errorMessage?.let { errorMsg ->
            liveRegionManager.announceAssertive("Error: $errorMsg")
            viewModel.clearMessages()
        }
    }

    LaunchedEffect(uiState.successMessage) {
        uiState.successMessage?.let { successMsg ->
            liveRegionManager.announcePolite(successMsg)
            viewModel.clearMessages()
        }
    }

    Column(
        modifier = modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        // Header
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "Plex Sync",
                style = MaterialTheme.typography.headlineMedium,
                fontWeight = FontWeight.Bold
            )

            Row {
                IconButton(onClick = { viewModel.syncAllServers() }) {
                    Icon(
                        imageVector = PhosphorIcons.Sync,
                        contentDescription = "Sync All"
                    )
                }
                IconButton(onClick = { viewModel.showAddServerDialog() }) {
                    Icon(
                        imageVector = Icons.Default.Add,
                        contentDescription = "Add Server"
                    )
                }
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        // Sync Status Card
        SyncStatusCard(
            syncStatus = syncStatus,
            errorType = uiState.errorType ?: (syncStatus as? PlexSyncStatus.Error)?.let { classifySyncError(it.message) },
            onRetry = { viewModel.syncAllServers() },
            onReauthenticate = { viewModel.showAddServerDialog() },
            modifier = Modifier.fillMaxWidth()
        )

        Spacer(modifier = Modifier.height(16.dp))

        // Server List
        if (servers.isEmpty()) {
            MediaCard(
                data = MediaCardData(
                    icon = PhosphorIcons.CloudSync,
                    title = "No Plex Servers",
                    description = "Add a Plex server to enable sync across devices",
                    actionLabel = "Add Plex Server"
                ),
                style = MediaCardStyle.STATE_EMPTY,
                onActionClick = { viewModel.showAddServerDialog() }
            )
        } else {
            LazyColumn(
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(servers) { server ->
                    PlexServerCard(
                        server = server,
                        onSync = { viewModel.syncServer(server) },
                        modifier = Modifier.fillMaxWidth()
                    )
                }
            }
        }
    }
}

@Suppress("FunctionNaming")
@Composable
private fun SyncStatusCard(
    syncStatus: PlexSyncStatus,
    errorType: SyncErrorType? = null,
    onRetry: () -> Unit = {},
    onReauthenticate: () -> Unit = {},
    modifier: Modifier = Modifier
) {
    val statusDescription = when (syncStatus) {
        is PlexSyncStatus.Idle -> "Ready to sync"
        is PlexSyncStatus.Syncing -> syncStatus.message
        is PlexSyncStatus.Success -> "Sync successful: ${syncStatus.message}"
        is PlexSyncStatus.Error -> "Sync error: ${syncStatus.message}"
    }
    val liveRegionMode = if (syncStatus is PlexSyncStatus.Error) {
        LiveRegionMode.Assertive
    } else {
        LiveRegionMode.Polite
    }

    val resolvedErrorType = errorType
        ?: (syncStatus as? PlexSyncStatus.Error)?.let { classifySyncError(it.message) }
        ?: SyncErrorType.UNKNOWN

    Card(
        modifier = modifier.dynamicStateDescription(
            stateDescription = statusDescription,
            mode = liveRegionMode
        )
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            PlexSyncStatusContent(
                syncStatus = syncStatus,
                errorType = resolvedErrorType,
                onRetry = onRetry,
                onReauthenticate = onReauthenticate
            )
        }
    }
}

@Suppress("FunctionNaming")
@Composable
private fun PlexSyncStatusContent(
    syncStatus: PlexSyncStatus,
    errorType: SyncErrorType,
    onRetry: () -> Unit,
    onReauthenticate: () -> Unit
) {
    when (syncStatus) {
        is PlexSyncStatus.Idle -> {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    imageVector = Icons.Default.CheckCircle,
                    contentDescription = "Sync ready",
                    tint = MaterialTheme.colorScheme.onSurface
                )
                Spacer(modifier = Modifier.width(8.dp))
                Text("Ready to sync")
            }
        }
        is PlexSyncStatus.Syncing -> {
            Row(verticalAlignment = Alignment.CenterVertically) {
                CircularProgressIndicator(
                    modifier = Modifier.size(20.dp),
                    strokeWidth = 2.dp
                )
                Spacer(modifier = Modifier.width(8.dp))
                Text(syncStatus.message)
            }
        }
        is PlexSyncStatus.Success -> {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    imageVector = Icons.Default.CheckCircle,
                    contentDescription = "Sync successful",
                    tint = MaterialTheme.colorScheme.primary
                )
                Spacer(modifier = Modifier.width(8.dp))
                Text(syncStatus.message)
            }
        }
        is PlexSyncStatus.Error -> {
            PlexSyncErrorContent(
                message = syncStatus.message,
                errorType = errorType,
                onRetry = onRetry,
                onReauthenticate = onReauthenticate
            )
        }
    }
}

@Suppress("FunctionNaming")
@Composable
private fun PlexSyncErrorContent(
    message: String,
    errorType: SyncErrorType,
    onRetry: () -> Unit,
    onReauthenticate: () -> Unit
) {
    val displayError = message.ifBlank { "Synchronization failed due to an error." }
    val diagnosticTip = getSyncErrorDiagnosticTip(errorType, displayError)

    Column(modifier = Modifier.fillMaxWidth()) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Icon(
                imageVector = PhosphorIcons.ErrorOutline,
                contentDescription = "Sync error",
                tint = MaterialTheme.colorScheme.error
            )
            Spacer(modifier = Modifier.width(8.dp))
            Text(
                text = displayError,
                color = MaterialTheme.colorScheme.error,
                style = MaterialTheme.typography.bodyMedium
            )
        }

        Spacer(modifier = Modifier.height(4.dp))

        Text(
            text = diagnosticTip,
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        Spacer(modifier = Modifier.height(12.dp))

        PlexSyncErrorActions(
            errorType = errorType,
            onRetry = onRetry,
            onReauthenticate = onReauthenticate
        )
    }
}

@Suppress("FunctionNaming")
@Composable
private fun PlexSyncErrorActions(
    errorType: SyncErrorType,
    onRetry: () -> Unit,
    onReauthenticate: () -> Unit
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        Button(
            onClick = onRetry,
            colors = ButtonDefaults.buttonColors(
                containerColor = MaterialTheme.colorScheme.error,
                contentColor = MaterialTheme.colorScheme.onError
            ),
            modifier = if (errorType == SyncErrorType.AUTH_EXPIRED) Modifier.weight(1f) else Modifier.fillMaxWidth()
        ) {
            Icon(
                imageVector = Icons.Default.Refresh,
                contentDescription = null,
                modifier = Modifier.size(16.dp)
            )
            Spacer(modifier = Modifier.width(4.dp))
            Text("Retry")
        }

        if (errorType == SyncErrorType.AUTH_EXPIRED) {
            OutlinedButton(
                onClick = onReauthenticate,
                modifier = Modifier.weight(1f)
            ) {
                Icon(
                    imageVector = Icons.Default.Lock,
                    contentDescription = null,
                    modifier = Modifier.size(16.dp)
                )
                Spacer(modifier = Modifier.width(4.dp))
                Text("Re-authenticate")
            }
        }
    }
}

@Composable
private fun PlexServerCard(
    server: PlexServer,
    onSync: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(modifier = modifier) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = server.name,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = "${server.host}:${server.port}",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    if (server.lastSynced > 0) {
                        Text(
                            text = "Last synced: ${formatTimestamp(server.lastSynced)}",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }

                IconButton(onClick = onSync) {
                    Icon(
                        imageVector = PhosphorIcons.Sync,
                        contentDescription = "Sync Server"
                    )
                }
            }

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                AssistChip(
                    onClick = { },
                    label = { Text("Version: ${server.version ?: "Unknown"}") }
                )
                AssistChip(
                    onClick = { },
                    label = {
                        Text(
                            text = if (server.isActive) "Active" else "Inactive",
                            color = if (server.isActive) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.error
                        )
                    }
                )
            }
        }
    }
}



@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun AddPlexServerDialog(
    onDismiss: () -> Unit,
    onAddServer: (String, String, Int, String) -> Unit
) {
    var name by remember { mutableStateOf("") }
    var host by remember { mutableStateOf("") }
    var port by remember { mutableStateOf("32400") }
    var token by remember { mutableStateOf("") }

    val portNumber = port.toIntOrNull()
    val portError = if (port.isNotBlank() && (portNumber == null || portNumber !in 1..65535)) {
        "Port must be between 1 and 65535"
    } else null

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add Plex Server") },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                AccessibleOutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Server Name") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
                AccessibleOutlinedTextField(
                    value = host,
                    onValueChange = { host = it },
                    label = { Text("Host") },
                    placeholder = { Text("192.168.1.100") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
                AccessibleOutlinedTextField(
                    value = port,
                    onValueChange = { port = it },
                    label = { Text("Port") },
                    errorMessage = portError,
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
                AccessibleOutlinedTextField(
                    value = token,
                    onValueChange = { token = it },
                    label = { Text("Access Token") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    onAddServer(name, host, portNumber ?: 32400, token)
                },
                enabled = name.isNotBlank() && host.isNotBlank() && token.isNotBlank() && portError == null
            ) {
                Text("Add")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

private fun formatTimestamp(timestamp: Long): String {
    val formatter = SimpleDateFormat("MMM dd, HH:mm", Locale.getDefault())
    return formatter.format(Date(timestamp))
}
