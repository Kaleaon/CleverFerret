package com.universalmedialibrary.ui.integration

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.services.integration.plex.PlexConnectionResult

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaIntegrationScreen(
    viewModel: MediaIntegrationViewModel = hiltViewModel()
) {
    val plexState by viewModel.plexState.collectAsState()
    var showAddServerDialog by remember { mutableStateOf(false) }

    Surface(
        modifier = Modifier.fillMaxSize(),
        color = MaterialTheme.colorScheme.background
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp)
        ) {
                // Header
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(bottom = 24.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column {
                        Text(
                            text = "Plex Integration",
                            style = MaterialTheme.typography.headlineMedium,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.onBackground
                        )
                        Text(
                            text = "Manage your Plex server connections",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onBackground.copy(alpha = 0.7f)
                        )
                    }

                    Button(
                        onClick = { showAddServerDialog = true },
                        modifier = Modifier.padding(start = 16.dp)
                    ) {
                        Icon(Icons.Default.Add, contentDescription = null)
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Add Server")
                    }
                }

                // Connection Status
                ConnectionStatusCard(
                    isConnecting = plexState.isConnecting,
                    connectedServers = plexState.connectedServers,
                    totalLibraries = plexState.totalLibraries,
                    error = plexState.error
                )

                Spacer(modifier = Modifier.height(16.dp))

                // Server Management
                if (plexState.connectedServers.isNotEmpty()) {
                    ServerManagementSection(
                        connectedServers = plexState.connectedServers,
                        onSyncLibraries = { viewModel.syncAllLibraries() },
                        onEnhanceMetadata = { serverName -> viewModel.enhanceLibraryMetadata(serverName) },
                        onFindDuplicates = { serverName -> viewModel.findDuplicateContent(serverName) },
                        onCreateCollections = { serverName -> viewModel.createSmartCollections(serverName) },
                        isSyncing = plexState.isSyncing,
                        isEnhancingMetadata = plexState.isEnhancingMetadata,
                        isAnalyzingDuplicates = plexState.isAnalyzingDuplicates,
                        isCreatingCollections = plexState.isCreatingCollections
                    )
                }

                // Results Display
                if (plexState.lastConnectionResult.isNotEmpty()) {
                    ResultCard(
                        title = "Last Connection",
                        message = plexState.lastConnectionResult,
                        isError = false
                    )
                }

                if (plexState.lastEnhancementResult.isNotEmpty()) {
                    ResultCard(
                        title = "Metadata Enhancement",
                        message = plexState.lastEnhancementResult,
                        isError = false
                    )
                }

                if (plexState.duplicatesFound > 0) {
                    ResultCard(
                        title = "Duplicates Found",
                        message = "${plexState.duplicatesFound} duplicate groups detected",
                        isError = true
                    )
                }

                if (plexState.collectionsCreated > 0) {
                    ResultCard(
                        title = "Collections Created",
                        message = "${plexState.collectionsCreated} smart collections created",
                        isError = false
                    )
                }
            }
        }

    // Add Server Dialog
    if (showAddServerDialog) {
        AddPlexServerDialog(
            onDismiss = { showAddServerDialog = false },
            onAddServer = { serverName, serverUrl, token ->
                viewModel.connectToServer(serverName, serverUrl, token)
                showAddServerDialog = false
            }
        )
    }
}

@Composable
private fun ConnectionStatusCard(
    isConnecting: Boolean,
    connectedServers: List<String>,
    totalLibraries: Int,
    error: String?
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    Icons.Default.Cloud,
                    contentDescription = null,
                    tint = when {
                        isConnecting -> MaterialTheme.colorScheme.primary
                        connectedServers.isNotEmpty() -> MaterialTheme.colorScheme.primary
                        else -> MaterialTheme.colorScheme.onSurfaceVariant
                    }
                )
                Spacer(modifier = Modifier.width(12.dp))
                Column {
                    Text(
                        text = when {
                            isConnecting -> "Connecting..."
                            connectedServers.isNotEmpty() -> "Connected to ${connectedServers.size} server(s)"
                            else -> "No servers connected"
                        },
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium
                    )
                    if (totalLibraries > 0) {
                        Text(
                            text = "$totalLibraries libraries available",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }

            if (error != null) {
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = error,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.error
                )
            }

            if (isConnecting) {
                Spacer(modifier = Modifier.height(8.dp))
                LinearProgressIndicator(
                    modifier = Modifier.fillMaxWidth()
                )
            }
        }
    }
}

@Composable
private fun ServerManagementSection(
    connectedServers: List<String>,
    onSyncLibraries: () -> Unit,
    onEnhanceMetadata: (String) -> Unit,
    onFindDuplicates: (String) -> Unit,
    onCreateCollections: (String) -> Unit,
    isSyncing: Boolean,
    isEnhancingMetadata: Boolean,
    isAnalyzingDuplicates: Boolean,
    isCreatingCollections: Boolean
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Server Management",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(bottom = 16.dp)
            )

            // Quick Actions
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                OutlinedButton(
                    onClick = onSyncLibraries,
                    enabled = !isSyncing,
                    modifier = Modifier.weight(1f)
                ) {
                    if (isSyncing) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(16.dp),
                            strokeWidth = 2.dp
                        )
                    } else {
                        Icon(Icons.Default.Sync, contentDescription = null)
                    }
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Sync All")
                }
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Per-Server Actions
            LazyColumn(
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(connectedServers) { serverName ->
                    ServerActionCard(
                        serverName = serverName,
                        onEnhanceMetadata = { onEnhanceMetadata(serverName) },
                        onFindDuplicates = { onFindDuplicates(serverName) },
                        onCreateCollections = { onCreateCollections(serverName) },
                        isEnhancingMetadata = isEnhancingMetadata,
                        isAnalyzingDuplicates = isAnalyzingDuplicates,
                        isCreatingCollections = isCreatingCollections
                    )
                }
            }
        }
    }
}

@Composable
private fun ServerActionCard(
    serverName: String,
    onEnhanceMetadata: () -> Unit,
    onFindDuplicates: () -> Unit,
    onCreateCollections: () -> Unit,
    isEnhancingMetadata: Boolean,
    isAnalyzingDuplicates: Boolean,
    isCreatingCollections: Boolean
) {
    OutlinedCard {
        Column(
            modifier = Modifier.padding(12.dp)
        ) {
            Text(
                text = serverName,
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Medium
            )

            Spacer(modifier = Modifier.height(8.dp))

            Row(
                horizontalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                // Enhance Metadata
                OutlinedButton(
                    onClick = onEnhanceMetadata,
                    enabled = !isEnhancingMetadata,
                    modifier = Modifier.weight(1f)
                ) {
                    if (isEnhancingMetadata) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(12.dp),
                            strokeWidth = 1.5.dp
                        )
                    } else {
                        Icon(Icons.Default.AutoAwesome, contentDescription = "AI", modifier = Modifier.size(14.dp))
                    }
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Enhance", style = MaterialTheme.typography.labelSmall)
                }

                // Find Duplicates
                OutlinedButton(
                    onClick = onFindDuplicates,
                    enabled = !isAnalyzingDuplicates,
                    modifier = Modifier.weight(1f)
                ) {
                    if (isAnalyzingDuplicates) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(12.dp),
                            strokeWidth = 1.5.dp
                        )
                    } else {
                        Icon(Icons.Default.FindInPage, contentDescription = null, modifier = Modifier.size(14.dp))
                    }
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Duplicates", style = MaterialTheme.typography.labelSmall)
                }

                // Create Collections
                OutlinedButton(
                    onClick = onCreateCollections,
                    enabled = !isCreatingCollections,
                    modifier = Modifier.weight(1f)
                ) {
                    if (isCreatingCollections) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(12.dp),
                            strokeWidth = 1.5.dp
                        )
                    } else {
                        Icon(Icons.Default.Collections, contentDescription = null, modifier = Modifier.size(14.dp))
                    }
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Collections", style = MaterialTheme.typography.labelSmall)
                }
            }
        }
    }
}

@Composable
private fun ResultCard(
    title: String,
    message: String,
    isError: Boolean
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        colors = CardDefaults.cardColors(
            containerColor = if (isError) {
                MaterialTheme.colorScheme.errorContainer
            } else {
                MaterialTheme.colorScheme.primaryContainer
            }
        )
    ) {
        Column(
            modifier = Modifier.padding(12.dp)
        ) {
            Text(
                text = title,
                style = MaterialTheme.typography.titleSmall,
                fontWeight = FontWeight.Medium,
                color = if (isError) {
                    MaterialTheme.colorScheme.onErrorContainer
                } else {
                    MaterialTheme.colorScheme.onPrimaryContainer
                }
            )
            Text(
                text = message,
                style = MaterialTheme.typography.bodySmall,
                color = if (isError) {
                    MaterialTheme.colorScheme.onErrorContainer
                } else {
                    MaterialTheme.colorScheme.onPrimaryContainer
                }
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun AddPlexServerDialog(
    onDismiss: () -> Unit,
    onAddServer: (String, String, String) -> Unit
) {
    var serverName by remember { mutableStateOf("") }
    var serverUrl by remember { mutableStateOf("") }
    var token by remember { mutableStateOf("") }
    var showToken by remember { mutableStateOf(false) }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Add Plex Server")
        },
        text = {
            Column {
                OutlinedTextField(
                    value = serverName,
                    onValueChange = { serverName = it },
                    label = { Text("Server Name") },
                    modifier = Modifier.fillMaxWidth()
                )
                Spacer(modifier = Modifier.height(8.dp))
                OutlinedTextField(
                    value = serverUrl,
                    onValueChange = { serverUrl = it },
                    label = { Text("Server URL") },
                    placeholder = { Text("http://192.168.1.100:32400") },
                    modifier = Modifier.fillMaxWidth()
                )
                Spacer(modifier = Modifier.height(8.dp))
                OutlinedTextField(
                    value = token,
                    onValueChange = { token = it },
                    label = { Text("Plex Token") },
                    visualTransformation = if (showToken) VisualTransformation.None else PasswordVisualTransformation(),
                    trailingIcon = {
                        IconButton(onClick = { showToken = !showToken }) {
                            Icon(
                                if (showToken) Icons.Default.VisibilityOff else Icons.Default.Visibility,
                                contentDescription = if (showToken) "Hide token" else "Show token"
                            )
                        }
                    },
                    modifier = Modifier.fillMaxWidth()
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    if (serverName.isNotBlank() && serverUrl.isNotBlank() && token.isNotBlank()) {
                        onAddServer(serverName, serverUrl, token)
                    }
                },
                enabled = serverName.isNotBlank() && serverUrl.isNotBlank() && token.isNotBlank()
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
