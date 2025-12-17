package com.universalmedialibrary.ui.media

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

/**
 * Main screen for Plex integration
 * Handles authentication, server discovery, and connection
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaIntegrationScreen(
    onBack: () -> Unit,
    viewModel: MediaIntegrationViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val plexState by viewModel.plexState.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Plex Integration") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    if (uiState.isAuthenticated) {
                        IconButton(onClick = { viewModel.signOut() }) {
                            Icon(Icons.Default.Logout, "Sign Out")
                        }
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
            when {
                uiState.isLoading -> {
                    CircularProgressIndicator(
                        modifier = Modifier.align(Alignment.Center)
                    )
                }

                !uiState.isAuthenticated -> {
                    AuthenticationView(
                        onStartAuth = { viewModel.startAuthentication() },
                        modifier = Modifier.align(Alignment.Center)
                    )
                }

                uiState.discoveredServers.isEmpty() && !uiState.isDiscovering -> {
                    ServerDiscoveryView(
                        onDiscover = { viewModel.discoverServers() },
                        modifier = Modifier.align(Alignment.Center)
                    )
                }

                else -> {
                    ServerListView(
                        servers = uiState.discoveredServers,
                        isConnecting = uiState.isConnecting,
                        onConnectServer = { viewModel.connectToServer(it) },
                        onSyncLibraries = { viewModel.syncLibraries() },
                        isSyncing = plexState.isSyncing,
                        connectedServers = plexState.connectedServers,
                        modifier = Modifier.fillMaxSize()
                    )
                }
            }

            // Error snackbar
            uiState.error?.let { error ->
                Snackbar(
                    modifier = Modifier
                        .align(Alignment.BottomCenter)
                        .padding(16.dp),
                    action = {
                        TextButton(onClick = { viewModel.clearError() }) {
                            Text("Dismiss")
                        }
                    }
                ) {
                    Text(error)
                }
            }

            // PIN dialog
            if (uiState.showPinDialog && uiState.pinCode != null) {
                PlexPinDialog(
                    pinCode = uiState.pinCode!!,
                    onDismiss = { viewModel.dismissPinDialog() }
                )
            }
        }
    }
}

@Composable
fun AuthenticationView(
    onStartAuth: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier.padding(32.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Icon(
            Icons.Default.Cloud,
            contentDescription = null,
            modifier = Modifier.size(64.dp),
            tint = MaterialTheme.colorScheme.primary
        )

        Text(
            "Connect to Plex",
            style = MaterialTheme.typography.headlineMedium,
            fontWeight = FontWeight.Bold
        )

        Text(
            "Access your Plex Media Server libraries and sync your content",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        Spacer(modifier = Modifier.height(16.dp))

        Button(
            onClick = onStartAuth,
            modifier = Modifier.fillMaxWidth()
        ) {
            Icon(Icons.Default.Login, contentDescription = null)
            Spacer(modifier = Modifier.width(8.dp))
            Text("Sign in with Plex")
        }
    }
}

@Composable
fun ServerDiscoveryView(
    onDiscover: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier.padding(32.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Icon(
            Icons.Default.Search,
            contentDescription = null,
            modifier = Modifier.size(64.dp),
            tint = MaterialTheme.colorScheme.primary
        )

        Text(
            "Discover Servers",
            style = MaterialTheme.typography.headlineMedium,
            fontWeight = FontWeight.Bold
        )

        Text(
            "Find available Plex servers on your network",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        Spacer(modifier = Modifier.height(16.dp))

        Button(
            onClick = onDiscover,
            modifier = Modifier.fillMaxWidth()
        ) {
            Icon(Icons.Default.Refresh, contentDescription = null)
            Spacer(modifier = Modifier.width(8.dp))
            Text("Discover Servers")
        }
    }
}

@Composable
fun ServerListView(
    servers: List<com.universalmedialibrary.services.plex.PlexDiscoveredServer>,
    isConnecting: Boolean,
    onConnectServer: (com.universalmedialibrary.services.plex.PlexDiscoveredServer) -> Unit,
    onSyncLibraries: () -> Unit,
    isSyncing: Boolean,
    connectedServers: List<String>,
    modifier: Modifier = Modifier
) {
    Column(modifier = modifier) {
        // Sync button at top
        if (connectedServers.isNotEmpty()) {
            Surface(
                tonalElevation = 2.dp,
                modifier = Modifier.fillMaxWidth()
            ) {
                Row(
                    modifier = Modifier
                        .padding(16.dp)
                        .fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column {
                        Text(
                            "${connectedServers.size} Server(s) Connected",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            connectedServers.joinToString(", "),
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }

                    Button(
                        onClick = onSyncLibraries,
                        enabled = !isSyncing
                    ) {
                        if (isSyncing) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(16.dp),
                                strokeWidth = 2.dp
                            )
                        } else {
                            Icon(Icons.Default.Sync, contentDescription = null)
                        }
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Sync")
                    }
                }
            }
        }

        // Server list
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            items(servers) { server ->
                ServerCard(
                    server = server,
                    isConnected = connectedServers.contains(server.name),
                    isConnecting = isConnecting,
                    onConnect = { onConnectServer(server) }
                )
            }
        }
    }
}

@Composable
fun ServerCard(
    server: com.universalmedialibrary.services.plex.PlexDiscoveredServer,
    isConnected: Boolean,
    isConnecting: Boolean,
    onConnect: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        server.name,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )

                    Text(
                        if (server.owned) "Owned" else "Shared",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )

                    if (server.connections.isNotEmpty()) {
                        Text(
                            "${server.connections.size} connection(s)",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }

                if (isConnected) {
                    Icon(
                        Icons.Default.CheckCircle,
                        contentDescription = "Connected",
                        tint = MaterialTheme.colorScheme.primary
                    )
                } else {
                    Button(
                        onClick = onConnect,
                        enabled = !isConnecting
                    ) {
                        if (isConnecting) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(16.dp),
                                strokeWidth = 2.dp,
                                color = MaterialTheme.colorScheme.onPrimary
                            )
                        } else {
                            Text("Connect")
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun PlexPinDialog(
    pinCode: String,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        icon = {
            Icon(Icons.Default.Key, contentDescription = null)
        },
        title = {
            Text("Authenticate with Plex")
        },
        text = {
            Column(
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Text("Go to plex.tv/link and enter this PIN:")

                Surface(
                    color = MaterialTheme.colorScheme.primaryContainer,
                    shape = MaterialTheme.shapes.medium
                ) {
                    Text(
                        pinCode,
                        modifier = Modifier.padding(24.dp),
                        style = MaterialTheme.typography.displaySmall,
                        fontWeight = FontWeight.Bold,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                }

                Text(
                    "Waiting for authentication...",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )

                CircularProgressIndicator(
                    modifier = Modifier.size(24.dp),
                    strokeWidth = 2.dp
                )
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
