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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.services.integration.plex.PlexResource

/**
 * Plex Integration Screen
 * 
 * Main UI for Plex Media Server integration
 * Provides authentication, server management, and library operations
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlexIntegrationScreen(
    onNavigateBack: () -> Unit = {},
    viewModel: PlexIntegrationViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        // Header
        Text(
            text = "Plex Integration",
            style = MaterialTheme.typography.headlineMedium,
            fontWeight = FontWeight.Bold,
            modifier = Modifier.padding(bottom = 16.dp)
        )
        
        // Connection Status Card
        ConnectionStatusCard(
            isConnected = uiState.isAuthenticated,
            status = uiState.connectionStatus,
            onConnect = { viewModel.startAuthentication() },
            onDisconnect = { viewModel.logout() }
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        // Authentication Section
        if (!uiState.isAuthenticated) {
            AuthenticationSection(
                authPin = uiState.authPin,
                onStartAuth = { viewModel.startAuthentication() },
                onCheckAuth = { viewModel.checkAuthenticationStatus() }
            )
        } else {
            // Server Management Section
            ServerManagementSection(
                availableServers = uiState.availableServers,
                connectedServers = uiState.connectedServers,
                libraries = uiState.libraries,
                onConnectServer = { server -> viewModel.connectToServer(server) },
                onSyncLibraries = { viewModel.syncAllLibraries() },
                onEnhanceMetadata = { viewModel.enhanceLibraryMetadata() },
                onFindDuplicates = { viewModel.findDuplicateContent() },
                onCreateCollections = { viewModel.createSmartCollections() },
                onCheckConnections = { viewModel.checkAllConnections() },
                onGetAnalytics = { viewModel.getLibraryAnalytics() }
            )
        }
        
        Spacer(modifier = Modifier.height(16.dp))
        
        // Loading Indicator
        if (uiState.isLoading) {
            Box(
                modifier = Modifier.fillMaxWidth(),
                contentAlignment = Alignment.Center
            ) {
                CircularProgressIndicator()
            }
        }
        
        // Error Display
        uiState.error?.let { error ->
            ErrorCard(
                error = error,
                onDismiss = { viewModel.clearError() }
            )
        }
        
        // Operation Result
        uiState.operationResult?.let { result ->
            ResultCard(
                result = result,
                onDismiss = { viewModel.clearOperationResult() }
            )
        }
    }
}

@Composable
fun ConnectionStatusCard(
    isConnected: Boolean,
    status: String,
    onConnect: () -> Unit,
    onDisconnect: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = if (isConnected) Color(0xFF4CAF50) else Color(0xFFE57373)
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column {
                Text(
                    text = "Plex Connection",
                    style = MaterialTheme.typography.titleMedium,
                    color = Color.White,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = status,
                    style = MaterialTheme.typography.bodyMedium,
                    color = Color.White
                )
            }
            
            if (isConnected) {
                IconButton(onClick = onDisconnect) {
                    Icon(
                        Icons.Default.Close,
                        contentDescription = "Disconnect",
                        tint = Color.White
                    )
                }
            } else {
                IconButton(onClick = onConnect) {
                    Icon(
                        Icons.Default.PlayArrow,
                        contentDescription = "Connect",
                        tint = Color.White
                    )
                }
            }
        }
    }
}

@Composable
fun AuthenticationSection(
    authPin: String?,
    onStartAuth: () -> Unit,
    onCheckAuth: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Authentication",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(bottom = 8.dp)
            )
            
            if (authPin == null) {
                Text(
                    text = "Start Plex authentication to connect to your servers",
                    style = MaterialTheme.typography.bodyMedium,
                    modifier = Modifier.padding(bottom = 16.dp)
                )
                
                Button(
                    onClick = onStartAuth,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(Icons.Default.PlayArrow, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Start Authentication")
                }
            } else {
                Text(
                    text = "Authentication PIN:",
                    style = MaterialTheme.typography.bodyMedium,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
                
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer
                    )
                ) {
                    Text(
                        text = authPin,
                        style = MaterialTheme.typography.headlineMedium,
                        fontWeight = FontWeight.Bold,
                        textAlign = TextAlign.Center,
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp)
                    )
                }
                
                Spacer(modifier = Modifier.height(16.dp))
                
                Text(
                    text = "Enter this PIN in your Plex app or web interface, then check status",
                    style = MaterialTheme.typography.bodySmall,
                    modifier = Modifier.padding(bottom = 16.dp)
                )
                
                Button(
                    onClick = onCheckAuth,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(Icons.Default.Refresh, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Check Authentication Status")
                }
            }
        }
    }
}

@Composable
fun ServerManagementSection(
    availableServers: List<PlexResource>,
    connectedServers: List<String>,
    libraries: List<String>,
    onConnectServer: (PlexResource) -> Unit,
    onSyncLibraries: () -> Unit,
    onEnhanceMetadata: () -> Unit,
    onFindDuplicates: () -> Unit,
    onCreateCollections: () -> Unit,
    onCheckConnections: () -> Unit,
    onGetAnalytics: () -> Unit
) {
    LazyColumn(
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        // Available Servers
        item {
            Card(modifier = Modifier.fillMaxWidth()) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text(
                        text = "Available Servers (${availableServers.size})",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        modifier = Modifier.padding(bottom = 8.dp)
                    )
                    
                    if (availableServers.isEmpty()) {
                        Text(
                            text = "No servers found. Make sure your Plex servers are running and accessible.",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    } else {
                        availableServers.forEach { server ->
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(vertical = 4.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Column(modifier = Modifier.weight(1f)) {
                                    Text(
                                        text = server.name,
                                        style = MaterialTheme.typography.bodyMedium,
                                        fontWeight = FontWeight.Medium
                                    )
                                    Text(
                                        text = "${server.product} ${server.productVersion}",
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                                
                                OutlinedButton(
                                    onClick = { onConnectServer(server) }
                                ) {
                                    Text("Connect")
                                }
                            }
                        }
                    }
                }
            }
        }
        
        // Connected Servers
        item {
            Card(modifier = Modifier.fillMaxWidth()) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text(
                        text = "Connected Servers (${connectedServers.size})",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        modifier = Modifier.padding(bottom = 8.dp)
                    )
                    
                    if (connectedServers.isEmpty()) {
                        Text(
                            text = "No servers connected yet.",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    } else {
                        connectedServers.forEach { serverName ->
                            Row(
                                modifier = Modifier.padding(vertical = 2.dp),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Icon(
                                    Icons.Default.CheckCircle,
                                    contentDescription = null,
                                    tint = Color(0xFF4CAF50),
                                    modifier = Modifier.size(16.dp)
                                )
                                Spacer(modifier = Modifier.width(8.dp))
                                Text(
                                    text = serverName,
                                    style = MaterialTheme.typography.bodyMedium
                                )
                            }
                        }
                    }
                }
            }
        }
        
        // Libraries
        item {
            Card(modifier = Modifier.fillMaxWidth()) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text(
                        text = "Libraries (${libraries.size})",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        modifier = Modifier.padding(bottom = 8.dp)
                    )
                    
                    if (libraries.isEmpty()) {
                        Text(
                            text = "No libraries synced yet. Click 'Sync Libraries' to load them.",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    } else {
                        libraries.forEach { library ->
                            Text(
                                text = "• $library",
                                style = MaterialTheme.typography.bodyMedium,
                                modifier = Modifier.padding(vertical = 2.dp)
                            )
                        }
                    }
                }
            }
        }
        
        // Action Buttons
        item {
            Card(modifier = Modifier.fillMaxWidth()) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text(
                        text = "Actions",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        modifier = Modifier.padding(bottom = 16.dp)
                    )
                    
                    val actions = listOf(
                        "Sync Libraries" to onSyncLibraries,
                        "Enhance Metadata" to onEnhanceMetadata,
                        "Find Duplicates" to onFindDuplicates,
                        "Create Collections" to onCreateCollections,
                        "Check Connections" to onCheckConnections,
                        "Get Analytics" to onGetAnalytics
                    )
                    
                    actions.forEach { (label, action) ->
                        OutlinedButton(
                            onClick = action,
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(vertical = 4.dp)
                        ) {
                            Text(label)
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun ErrorCard(
    error: String,
    onDismiss: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = Color(0xFFFFEBEE)
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = "Error",
                    style = MaterialTheme.typography.titleSmall,
                    color = Color(0xFFD32F2F),
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = error,
                    style = MaterialTheme.typography.bodySmall,
                    color = Color(0xFFD32F2F)
                )
            }
            
            IconButton(onClick = onDismiss) {
                Icon(
                    Icons.Default.Close,
                    contentDescription = "Dismiss",
                    tint = Color(0xFFD32F2F)
                )
            }
        }
    }
}

@Composable
fun ResultCard(
    result: String,
    onDismiss: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = Color(0xFFE8F5E8)
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.Top
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = "Result",
                    style = MaterialTheme.typography.titleSmall,
                    color = Color(0xFF2E7D32),
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = result,
                    style = MaterialTheme.typography.bodySmall,
                    color = Color(0xFF2E7D32)
                )
            }
            
            IconButton(onClick = onDismiss) {
                Icon(
                    Icons.Default.Close,
                    contentDescription = "Dismiss",
                    tint = Color(0xFF2E7D32)
                )
            }
        }
    }
}

@Composable
fun AddPlexServerDialog(
    onDismiss: () -> Unit,
    onAdd: (String, Int) -> Unit
) {
    var serverUrl by remember { mutableStateOf("") }
    var port by remember { mutableStateOf("32400") }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add Plex Server") },
        text = {
            Column {
                OutlinedTextField(
                    value = serverUrl,
                    onValueChange = { serverUrl = it },
                    label = { Text("Server URL") },
                    placeholder = { Text("192.168.1.100") },
                    modifier = Modifier.fillMaxWidth()
                )
                
                Spacer(modifier = Modifier.height(8.dp))
                
                OutlinedTextField(
                    value = port,
                    onValueChange = { port = it },
                    label = { Text("Port") },
                    placeholder = { Text("32400") },
                    modifier = Modifier.fillMaxWidth()
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    val portInt = port.toIntOrNull() ?: 32400
                    onAdd(serverUrl, portInt)
                    onDismiss()
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