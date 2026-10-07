package com.universalmedialibrary.ui.integration

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
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.theme.MetallicButton
import com.universalmedialibrary.ui.components.AccessibleOutlinedTextField

enum class ServerType {
    PLEX, JELLYFIN, EMBY
}

/**
 * Unified Server Integration Screen
 * Supports Plex, Jellyfin, and Emby servers
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ServerIntegrationScreen(
    onBack: () -> Unit,
    viewModel: ServerIntegrationViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()

    var showAddDialog by remember { mutableStateOf(false) }
    var selectedServerType by remember { mutableStateOf(ServerType.PLEX) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Server Integration") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                }
            )
        },
        floatingActionButton = {
            FloatingActionButton(
                onClick = { showAddDialog = true },
                modifier = Modifier.padding(16.dp)
            ) {
                Icon(Icons.Default.Add, "Add Server")
            }
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            // Server type cards
            item {
                Text(
                    "Supported Servers",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Bold
                )
                Spacer(Modifier.height(8.dp))
            }

            item {
                ServerTypeCard(
                    serverType = ServerType.PLEX,
                    connectedCount = uiState.plexServers.size,
                    onClick = {
                        selectedServerType = ServerType.PLEX
                        showAddDialog = true
                    }
                )
            }

            item {
                ServerTypeCard(
                    serverType = ServerType.JELLYFIN,
                    connectedCount = uiState.jellyfinServers.size,
                    onClick = {
                        selectedServerType = ServerType.JELLYFIN
                        showAddDialog = true
                    }
                )
            }

            item {
                ServerTypeCard(
                    serverType = ServerType.EMBY,
                    connectedCount = uiState.embyServers.size,
                    onClick = {
                        selectedServerType = ServerType.EMBY
                        showAddDialog = true
                    }
                )
            }

            // Connected servers section
            if (uiState.hasConnectedServers) {
                item {
                    Spacer(Modifier.height(16.dp))
                    Text(
                        "Connected Servers",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    )
                    Spacer(Modifier.height(8.dp))
                }

                items(uiState.plexServers) { server ->
                    ConnectedServerCard(
                        serverName = server.name,
                        serverType = "Plex",
                        serverUrl = server.url,
                        onSync = { viewModel.syncPlexServer(server.serverId) },
                        onDisconnect = { viewModel.disconnectPlexServer(server.serverId) }
                    )
                }

                items(uiState.jellyfinServers) { server ->
                    ConnectedServerCard(
                        serverName = server.name,
                        serverType = "Jellyfin",
                        serverUrl = server.url,
                        onSync = { viewModel.syncJellyfinServer(server.serverId) },
                        onDisconnect = { viewModel.disconnectJellyfinServer(server.serverId) }
                    )
                }

                items(uiState.embyServers) { server ->
                    ConnectedServerCard(
                        serverName = server.name,
                        serverType = "Emby",
                        serverUrl = server.url,
                        onSync = { viewModel.syncEmbyServer(server.serverId) },
                        onDisconnect = { viewModel.disconnectEmbyServer(server.serverId) }
                    )
                }
            }
        }
    }

    // Add server dialog
    if (showAddDialog) {
        AddServerDialog(
            serverType = selectedServerType,
            onDismiss = { showAddDialog = false },
            onAdd = { url, username, password ->
                when (selectedServerType) {
                    ServerType.PLEX -> viewModel.authenticatePlex(url, username, password)
                    ServerType.JELLYFIN -> viewModel.authenticateJellyfin(url, username, password)
                    ServerType.EMBY -> viewModel.authenticateEmby(url, username, password)
                }
                showAddDialog = false
            }
        )
    }
}

@Composable
fun ServerTypeCard(
    serverType: ServerType,
    connectedCount: Int,
    onClick: () -> Unit
) {
    val (icon, name, description, color) = when (serverType) {
        ServerType.PLEX -> Tuple4(
            Icons.Default.CloudQueue,
            "Plex Media Server",
            "Connect to your Plex server for seamless media integration",
            MaterialTheme.colorScheme.primary
        )
        ServerType.JELLYFIN -> Tuple4(
            Icons.Default.Cloud,
            "Jellyfin",
            "Open-source media system with full API support",
            MaterialTheme.colorScheme.tertiary
        )
        ServerType.EMBY -> Tuple4(
            Icons.Default.CloudCircle,
            "Emby",
            "Personal media server with extensive features",
            MaterialTheme.colorScheme.secondary
        )
    }

    Card(
        onClick = onClick,
        modifier = Modifier.fillMaxWidth()
    ) {
        Row(
            modifier = Modifier.padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                icon,
                contentDescription = "Media image",
                modifier = Modifier.size(48.dp),
                tint = color
            )
            Spacer(Modifier.width(16.dp))
            Column(modifier = Modifier.weight(1f)) {
                Text(name, style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
                Text(description, style = MaterialTheme.typography.bodySmall)
                if (connectedCount > 0) {
                    Spacer(Modifier.height(4.dp))
                    Text(
                        "$connectedCount server${if (connectedCount == 1) "" else "s"} connected",
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.primary
                    )
                }
            }
            Icon(Icons.Default.ChevronRight, "Connect")
        }
    }
}

@Composable
fun ConnectedServerCard(
    serverName: String,
    serverType: String,
    serverUrl: String,
    onSync: () -> Unit,
    onDisconnect: () -> Unit
) {
    var showMenu by remember { mutableStateOf(false) }

    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Row(
            modifier = Modifier.padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                Icons.Default.CheckCircle,
                contentDescription = "Media image",
                tint = MaterialTheme.colorScheme.primary
            )
            Spacer(Modifier.width(16.dp))
            Column(modifier = Modifier.weight(1f)) {
                Text(serverName, style = MaterialTheme.typography.titleMedium)
                Text(serverType, style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.primary)
                Text(serverUrl, style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.outline)
            }
            IconButton(onClick = { showMenu = true }) {
                Icon(Icons.Default.MoreVert, "Options")
            }
        }

        DropdownMenu(
            expanded = showMenu,
            onDismissRequest = { showMenu = false }
        ) {
            DropdownMenuItem(
                text = { Text("Sync Now") },
                onClick = {
                    onSync()
                    showMenu = false
                },
                leadingIcon = { Icon(Icons.Default.Sync, null) }
            )
            DropdownMenuItem(
                text = { Text("Disconnect") },
                onClick = {
                    onDisconnect()
                    showMenu = false
                },
                leadingIcon = { Icon(Icons.Default.LinkOff, null) }
            )
        }
    }
}

@Composable
fun AddServerDialog(
    serverType: ServerType,
    onDismiss: () -> Unit,
    onAdd: (url: String, username: String, password: String) -> Unit
) {
    var serverUrl by remember { mutableStateOf("") }
    var username by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var hasSubmitted by remember { mutableStateOf(false) }

    val urlError = when {
        serverUrl.isNotBlank() && !serverUrl.startsWith("http://", ignoreCase = true) && !serverUrl.startsWith("https://", ignoreCase = true) ->
            "Server URL must start with http or https"
        hasSubmitted && serverUrl.isBlank() -> "Server URL cannot be empty"
        else -> null
    }

    val usernameError = when {
        hasSubmitted && username.isBlank() -> "Username cannot be empty"
        else -> null
    }

    val passwordError = when {
        hasSubmitted && password.isBlank() -> "Password cannot be empty"
        else -> null
    }

    val isValid = urlError == null && usernameError == null && passwordError == null &&
            serverUrl.isNotBlank() && username.isNotBlank() && password.isNotBlank()

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Connect to ${serverType.name}") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                AccessibleOutlinedTextField(
                    value = serverUrl,
                    onValueChange = { serverUrl = it },
                    label = { Text("Server URL") },
                    placeholder = { Text("https://server.example.com:8096") },
                    errorMessage = urlError,
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
                AccessibleOutlinedTextField(
                    value = username,
                    onValueChange = { username = it },
                    label = { Text("Username") },
                    errorMessage = usernameError,
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
                AccessibleOutlinedTextField(
                    value = password,
                    onValueChange = { password = it },
                    label = { Text("Password") },
                    errorMessage = passwordError,
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
            }
        },
        confirmButton = {
            Button(
                onClick = {
                    hasSubmitted = true
                    if (isValid) {
                        onAdd(serverUrl, username, password)
                    }
                }
            ) {
                Text("Connect")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

// Helper data class
private data class Tuple4<A, B, C, D>(val a: A, val b: B, val c: C, val d: D)
