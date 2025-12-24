package com.universalmedialibrary.ui.settings

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
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.theme.*

/**
 * Media Server Settings Screen
 * Configure Plex, Jellyfin, and Emby servers
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaServerSettingsScreen(
    onBack: () -> Unit,
    viewModel: MediaServerSettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    var showAddServerDialog by remember { mutableStateOf(false) }
    var selectedServerType by remember { mutableStateOf(ServerType.JELLYFIN) }

    Scaffold(
        topBar = {
            MetallicTopAppBar(
                title = {
                    Text(
                        "Media Servers",
                        fontWeight = FontWeight.Bold
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                }
            )
        },
        floatingActionButton = {
            FloatingActionButton(
                onClick = { showAddServerDialog = true },
                containerColor = MaterialTheme.colorScheme.primary
            ) {
                Icon(Icons.Default.Add, "Add Server")
            }
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            // Jellyfin Servers
            item {
                MetallicText(
                    text = "Jellyfin Servers",
                    style = MaterialTheme.typography.titleMedium,
                    modifier = Modifier.padding(vertical = 8.dp)
                )
            }

            items(uiState.jellyfinServers) { server ->
                ServerCard(
                    serverName = server.name,
                    serverUrl = server.url,
                    isConnected = server.isConnected,
                    onTest = { viewModel.testConnection(server) },
                    onDelete = { viewModel.deleteServer(server) }
                )
            }

            if (uiState.jellyfinServers.isEmpty()) {
                item {
                    EmptyServerCard("No Jellyfin servers configured")
                }
            }

            // Plex Servers
            item {
                MetallicText(
                    text = "Plex Servers",
                    style = MaterialTheme.typography.titleMedium,
                    modifier = Modifier.padding(vertical = 8.dp)
                )
            }

            items(uiState.plexServers) { server ->
                ServerCard(
                    serverName = server.name,
                    serverUrl = server.url,
                    isConnected = server.isConnected,
                    onTest = { viewModel.testConnection(server) },
                    onDelete = { viewModel.deleteServer(server) }
                )
            }

            if (uiState.plexServers.isEmpty()) {
                item {
                    EmptyServerCard("No Plex servers configured")
                }
            }

            // Emby Servers
            item {
                MetallicText(
                    text = "Emby Servers",
                    style = MaterialTheme.typography.titleMedium,
                    modifier = Modifier.padding(vertical = 8.dp)
                )
            }

            items(uiState.embyServers) { server ->
                ServerCard(
                    serverName = server.name,
                    serverUrl = server.url,
                    isConnected = server.isConnected,
                    onTest = { viewModel.testConnection(server) },
                    onDelete = { viewModel.deleteServer(server) }
                )
            }

            if (uiState.embyServers.isEmpty()) {
                item {
                    EmptyServerCard("No Emby servers configured")
                }
            }

            // YAACC (DLNA/UPnP) Servers
            item {
                MetallicText(
                    text = "YAACC (DLNA/UPnP) Servers",
                    style = MaterialTheme.typography.titleMedium,
                    modifier = Modifier.padding(vertical = 8.dp)
                )
            }

            items(uiState.yaaccServers) { server ->
                ServerCard(
                    serverName = server.name,
                    serverUrl = server.url,
                    isConnected = server.isConnected,
                    onTest = { viewModel.testConnection(server) },
                    onDelete = { viewModel.deleteServer(server) }
                )
            }

            if (uiState.yaaccServers.isEmpty()) {
                item {
                    EmptyServerCard("No YAACC/DLNA servers configured")
                }
            }
        }
    }

    if (showAddServerDialog) {
        AddServerDialog(
            serverType = selectedServerType,
            onServerTypeChange = { selectedServerType = it },
            onDismiss = { showAddServerDialog = false },
            onAdd = { name, url, username, password, apiKey ->
                viewModel.addServer(selectedServerType, name, url, username, password, apiKey)
                showAddServerDialog = false
            }
        )
    }
}

@Composable
private fun ServerCard(
    serverName: String,
    serverUrl: String,
    isConnected: Boolean,
    onTest: () -> Unit,
    onDelete: () -> Unit
) {
    MetallicCard {
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
                        text = serverName,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = serverUrl,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }

                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Icon(
                        imageVector = if (isConnected) Icons.Default.CheckCircle else Icons.Default.Error,
                        contentDescription = if (isConnected) "Connected" else "Disconnected",
                        tint = if (isConnected) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.error
                    )
                }
            }

            Spacer(modifier = Modifier.height(12.dp))

            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                MetallicButton(
                    text = "Test",
                    onClick = onTest,
                    modifier = Modifier.weight(1f)
                )
                MetallicButton(
                    text = "Delete",
                    onClick = onDelete,
                    modifier = Modifier.weight(1f)
                )
            }
        }
    }
}

@Composable
private fun EmptyServerCard(message: String) {
    MetallicCard {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .padding(32.dp),
            contentAlignment = Alignment.Center
        ) {
            Text(
                text = message,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun AddServerDialog(
    serverType: ServerType,
    onServerTypeChange: (ServerType) -> Unit,
    onDismiss: () -> Unit,
    onAdd: (name: String, url: String, username: String, password: String, apiKey: String) -> Unit
) {
    var name by remember { mutableStateOf("") }
    var url by remember { mutableStateOf("") }
    var username by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var apiKey by remember { mutableStateOf("") }
    var showPassword by remember { mutableStateOf(false) }
    var expanded by remember { mutableStateOf(false) }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add Media Server") },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                // Server Type Dropdown
                ExposedDropdownMenuBox(
                    expanded = expanded,
                    onExpandedChange = { expanded = !expanded }
                ) {
                    OutlinedTextField(
                        value = serverType.displayName,
                        onValueChange = {},
                        readOnly = true,
                        label = { Text("Server Type") },
                        trailingIcon = {
                            ExposedDropdownMenuDefaults.TrailingIcon(expanded = expanded)
                        },
                        modifier = Modifier
                            .fillMaxWidth()
                            .menuAnchor()
                    )

                    ExposedDropdownMenu(
                        expanded = expanded,
                        onDismissRequest = { expanded = false }
                    ) {
                        ServerType.values().forEach { type ->
                            DropdownMenuItem(
                                text = { Text(type.displayName) },
                                onClick = {
                                    onServerTypeChange(type)
                                    expanded = false
                                }
                            )
                        }
                    }
                }

                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Server Name") },
                    modifier = Modifier.fillMaxWidth()
                )

                OutlinedTextField(
                    value = url,
                    onValueChange = { url = it },
                    label = { Text("Server URL") },
                    placeholder = { Text("http://192.168.1.100:8096") },
                    modifier = Modifier.fillMaxWidth()
                )

                when (serverType) {
                    ServerType.JELLYFIN, ServerType.EMBY -> {
                        OutlinedTextField(
                            value = username,
                            onValueChange = { username = it },
                            label = { Text("Username") },
                            modifier = Modifier.fillMaxWidth()
                        )

                        OutlinedTextField(
                            value = password,
                            onValueChange = { password = it },
                            label = { Text("Password") },
                            visualTransformation = if (showPassword) VisualTransformation.None else PasswordVisualTransformation(),
                            trailingIcon = {
                                IconButton(onClick = { showPassword = !showPassword }) {
                                    Icon(
                                        imageVector = if (showPassword) Icons.Default.Visibility else Icons.Default.VisibilityOff,
                                        contentDescription = if (showPassword) "Hide password" else "Show password"
                                    )
                                }
                            },
                            modifier = Modifier.fillMaxWidth()
                        )
                    }
                    ServerType.PLEX -> {
                        OutlinedTextField(
                            value = apiKey,
                            onValueChange = { apiKey = it },
                            label = { Text("X-Plex-Token") },
                            modifier = Modifier.fillMaxWidth()
                        )
                    }
                    ServerType.YAACC -> {
                        // YAACC/DLNA servers typically don't require authentication
                        // Just show a helpful message
                        Text(
                            text = "DLNA/UPnP servers typically don't require authentication. Enter the server address and port.",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            modifier = Modifier.fillMaxWidth()
                        )
                    }
                }
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    if (name.isNotBlank() && url.isNotBlank()) {
                        onAdd(name, url, username, password, apiKey)
                    }
                }
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

enum class ServerType(val displayName: String) {
    JELLYFIN("Jellyfin"),
    PLEX("Plex"),
    EMBY("Emby"),
    YAACC("YAACC (DLNA/UPnP)")
}