package com.universalmedialibrary.ui.network

import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.services.network.*

/**
 * Network Explorer Screen for CleverFerret
 * 
 * Provides UI for discovering and accessing network storage:
 * - SMB/CIFS share browsing
 * - LAN device discovery
 * - FTP/SFTP server access
 * - Network media streaming
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NetworkExplorerScreen(
    onNavigateBack: () -> Unit,
    onOpenMedia: (NetworkFile) -> Unit,
    viewModel: NetworkExplorerViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    
    LaunchedEffect(Unit) {
        viewModel.scanNetwork()
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Network Explorer") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(
                        onClick = { viewModel.scanNetwork() },
                        enabled = !uiState.isScanning
                    ) {
                        if (uiState.isScanning) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(24.dp),
                                strokeWidth = 2.dp
                            )
                        } else {
                            Icon(Icons.Default.Refresh, contentDescription = "Scan")
                        }
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp)
        ) {
            // Connection Status
            ConnectionStatusCard(
                isConnected = uiState.connectedDevice != null,
                connectedDevice = uiState.connectedDevice
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            if (uiState.connectedDevice != null) {
                // File Browser
                NetworkFileBrowser(
                    files = uiState.browsePath,
                    currentPath = uiState.currentPath,
                    onNavigateUp = { viewModel.navigateUp() },
                    onFileClick = { file ->
                        if (file.isDirectory) {
                            viewModel.enterDirectory(file)
                        } else {
                            onOpenMedia(file)
                        }
                    },
                    onDownloadFile = { file -> viewModel.downloadFile(file) }
                )
            } else {
                // Device List
                Text(
                    text = "Discovered Devices",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Bold
                )
                
                Spacer(modifier = Modifier.height(8.dp))
                
                LazyColumn(
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(uiState.discoveredDevices) { device ->
                        NetworkDeviceCard(
                            device = device,
                            onConnect = { viewModel.connectToDevice(device) }
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun ConnectionStatusCard(
    isConnected: Boolean,
    connectedDevice: NetworkDevice?
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    imageVector = if (isConnected) Icons.Default.Wifi else Icons.Default.WifiOff,
                    contentDescription = null,
                    tint = if (isConnected) Color.Green else MaterialTheme.colorScheme.onSurfaceVariant
                )
                
                Spacer(modifier = Modifier.width(12.dp))
                
                Column {
                    Text(
                        text = if (isConnected) "Connected" else "Not Connected",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    
                    if (connectedDevice != null) {
                        Text(
                            text = "${connectedDevice.name} (${connectedDevice.address})",
                            style = MaterialTheme.typography.bodySmall
                        )
                    }
                }
            }
            
            if (isConnected) {
                OutlinedButton(onClick = { /* Disconnect */ }) {
                    Text("Disconnect")
                }
            }
        }
    }
}

@Composable
private fun NetworkFileBrowser(
    files: List<NetworkFile>,
    currentPath: String,
    onNavigateUp: () -> Unit,
    onFileClick: (NetworkFile) -> Unit,
    onDownloadFile: (NetworkFile) -> Unit
) {
    Column {
        // Current Path
        Row(
            modifier = Modifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(
                onClick = onNavigateUp,
                enabled = currentPath != ""
            ) {
                Icon(Icons.Default.ArrowUpward, contentDescription = "Up")
            }
            
            Text(
                text = currentPath,
                style = MaterialTheme.typography.bodyMedium,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.weight(1f)
            )
        }
        
        Spacer(modifier = Modifier.height(8.dp))
        
        // Files List
        LazyColumn(
            verticalArrangement = Arrangement.spacedBy(4.dp)
        ) {
            items(files) { file ->
                NetworkFileRow(
                    file = file,
                    onClick = { onFileClick(file) },
                    onDownload = { onDownloadFile(file) }
                )
            }
        }
    }
}

@Composable
private fun NetworkFileRow(
    file: NetworkFile,
    onClick: () -> Unit,
    onDownload: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        onClick = onClick
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = if (file.isDirectory) Icons.Default.Folder else getFileIcon(file.mimeType),
                contentDescription = null,
                modifier = Modifier.size(24.dp)
            )
            
            Spacer(modifier = Modifier.width(12.dp))
            
            Column(
                modifier = Modifier.weight(1f)
            ) {
                Text(
                    text = file.name,
                    style = MaterialTheme.typography.bodyMedium,
                    fontWeight = FontWeight.Bold
                )
                
                if (!file.isDirectory) {
                    Text(
                        text = formatFileSize(file.size),
                        style = MaterialTheme.typography.bodySmall
                    )
                }
            }
            
            if (!file.isDirectory) {
                IconButton(onClick = onDownload) {
                    Icon(Icons.Default.Download, contentDescription = "Download")
                }
            }
        }
    }
}

@Composable
private fun NetworkDeviceCard(
    device: NetworkDevice,
    onConnect: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = getDeviceIcon(device.type),
                        contentDescription = null,
                        modifier = Modifier.size(24.dp)
                    )
                    
                    Spacer(modifier = Modifier.width(12.dp))
                    
                    Column {
                        Text(
                            text = device.name,
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        
                        Text(
                            text = "${device.address}:${device.port}",
                            style = MaterialTheme.typography.bodySmall
                        )
                        
                        if (device.requiresAuth) {
                            Text(
                                text = "Authentication required",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.error
                            )
                        }
                    }
                }
                
                Button(onClick = onConnect) {
                    Text("Connect")
                }
            }
            
            if (device.capabilities != null) {
                Spacer(modifier = Modifier.height(8.dp))
                
                DeviceCapabilitiesRow(capabilities = device.capabilities)
            }
        }
    }
}

@Composable
private fun DeviceCapabilitiesRow(
    capabilities: DeviceCapabilities
) {
    Column {
        Text(
            text = "Capabilities",
            style = MaterialTheme.typography.bodySmall,
            fontWeight = FontWeight.Bold
        )
        
        Row(
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            if (capabilities.supportsStreaming) {
                SuggestionChip(
                    onClick = {},
                    label = { Text("Streaming") }
                )
            }
            
            if (capabilities.supportsSeeking) {
                SuggestionChip(
                    onClick = {},
                    label = { Text("Seeking") }
                )
            }
            
            if (capabilities.requiresAuth) {
                SuggestionChip(
                    onClick = {},
                    label = { Text("Auth Required") }
                )
            }
        }
    }
}

private fun getDeviceIcon(type: DeviceType): ImageVector {
    return when (type) {
        DeviceType.SMB_SERVER -> Icons.Default.Storage
        DeviceType.FTP_SERVER -> Icons.Default.Cloud
        DeviceType.DLNA_SERVER -> Icons.Default.Cast
        DeviceType.UPNP_SERVER -> Icons.Default.Devices
        DeviceType.NAS -> Icons.Default.Storage
        DeviceType.COMPUTER -> Icons.Default.Computer
        DeviceType.MOBILE -> Icons.Default.PhoneAndroid
        DeviceType.UNKNOWN -> Icons.Default.Help
    }
}

private fun getFileIcon(mimeType: String): ImageVector {
    return when {
        mimeType.startsWith("audio/") -> Icons.Default.AudioFile
        mimeType.startsWith("video/") -> Icons.Default.VideoFile
        mimeType.startsWith("image/") -> Icons.Default.Image
        mimeType == "application/pdf" -> Icons.Default.PictureAsPdf
        else -> Icons.Default.InsertDriveFile
    }
}

private fun formatFileSize(bytes: Long): String {
    return when {
        bytes < 1024 -> "${bytes}B"
        bytes < 1024 * 1024 -> "${bytes / 1024}KB"
        bytes < 1024 * 1024 * 1024 -> "${bytes / (1024 * 1024)}MB"
        else -> "${bytes / (1024 * 1024 * 1024)}GB"
    }
}