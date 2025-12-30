package com.universalmedialibrary.ui.cloud

import androidx.compose.animation.*
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
import com.universalmedialibrary.services.cloud.*

/**
 * Cloud Storage Screen for CleverFerret
 * 
 * Provides UI for managing cloud storage providers:
 * - Google Drive integration
 * - Dropbox integration
 * - OneDrive integration
 * - WebDAV configuration
 * - Sync management
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CloudStorageScreen(
    onNavigateBack: () -> Unit,
    viewModel: CloudStorageViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    
    LaunchedEffect(Unit) {
        viewModel.initialize()
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Cloud Storage") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.refreshAll() }) {
                        Icon(Icons.Default.Refresh, contentDescription = "Refresh")
                    }
                }
            )
        },
        floatingActionButton = {
            FloatingActionButton(
                onClick = { viewModel.syncAllProviders() }
            ) {
                Icon(Icons.Default.CloudSync, contentDescription = "Sync All")
            }
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp)
        ) {
            // Sync Status
            SyncStatusCard(
                status = uiState.syncStatus,
                progress = uiState.syncProgress,
                results = uiState.lastSyncResults
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Cloud Providers
            Text(
                text = "Cloud Providers",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            LazyColumn(
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(getCloudProviders()) { provider ->
                    CloudProviderCard(
                        provider = provider,
                        isEnabled = uiState.activeProviders.contains(provider),
                        isAuthenticated = uiState.authenticatedProviders.contains(provider),
                        storageUsage = uiState.storageUsage[provider],
                        onToggle = { enabled -> viewModel.toggleProvider(provider, enabled) },
                        onAuthenticate = { viewModel.authenticateProvider(provider) },
                        onManage = { viewModel.manageProvider(provider) }
                    )
                }
            }
        }
    }
}

@Composable
private fun SyncStatusCard(
    status: SyncStatus,
    progress: Float,
    results: Map<CloudProvider, SyncResult>
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
                Text(
                    text = when (status) {
                        SyncStatus.IDLE -> "Ready to Sync"
                        SyncStatus.SYNCING -> "Syncing..."
                        SyncStatus.COMPLETED -> "Sync Complete"
                        SyncStatus.ERROR -> "Sync Error"
                    },
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                
                Icon(
                    imageVector = when (status) {
                        SyncStatus.IDLE -> Icons.Default.Cloud
                        SyncStatus.SYNCING -> Icons.Default.Sync
                        SyncStatus.COMPLETED -> Icons.Default.CheckCircle
                        SyncStatus.ERROR -> Icons.Default.Error
                    },
                    contentDescription = null,
                    tint = when (status) {
                        SyncStatus.ERROR -> MaterialTheme.colorScheme.error
                        SyncStatus.COMPLETED -> Color.Green
                        else -> MaterialTheme.colorScheme.primary
                    }
                )
            }
            
            if (status == SyncStatus.SYNCING) {
                Spacer(modifier = Modifier.height(8.dp))
                LinearProgressIndicator(
                    progress = progress,
                    modifier = Modifier.fillMaxWidth()
                )
            }
            
            if (results.isNotEmpty()) {
                Spacer(modifier = Modifier.height(8.dp))
                results.forEach { (provider, result) ->
                    SyncResultRow(provider = provider, result = result)
                }
            }
        }
    }
}

@Composable
private fun SyncResultRow(
    provider: CloudProvider,
    result: SyncResult
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(
            text = getProviderName(provider),
            style = MaterialTheme.typography.bodySmall
        )
        
        if (result.success) {
            Text(
                text = "↑${result.uploadedCount} ↓${result.downloadedCount}",
                style = MaterialTheme.typography.bodySmall,
                color = Color.Green
            )
        } else {
            Text(
                text = "Error: ${result.error}",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.error
            )
        }
    }
}

@Composable
private fun CloudProviderCard(
    provider: CloudProvider,
    isEnabled: Boolean,
    isAuthenticated: Boolean,
    storageUsage: StorageUsage?,
    onToggle: (Boolean) -> Unit,
    onAuthenticate: () -> Unit,
    onManage: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        enabled = isEnabled,
        elevation = CardDefaults.cardElevation(
            defaultElevation = if (isEnabled) 4.dp else 2.dp
        )
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
                        imageVector = getProviderIcon(provider),
                        contentDescription = null,
                        modifier = Modifier.size(24.dp)
                    )
                    
                    Spacer(modifier = Modifier.width(12.dp))
                    
                    Column {
                        Text(
                            text = getProviderName(provider),
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        
                        Text(
                            text = if (isAuthenticated) "Connected" else "Not connected",
                            style = MaterialTheme.typography.bodySmall,
                            color = if (isAuthenticated) Color.Green else MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
                
                Switch(
                    checked = isEnabled,
                    onCheckedChange = onToggle
                )
            }
            
            if (isAuthenticated && storageUsage != null) {
                Spacer(modifier = Modifier.height(8.dp))
                
                LinearProgressIndicator(
                    progress = storageUsage.usagePercentage / 100f,
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(4.dp)
                        .clip(RoundedCornerShape(2.dp))
                )
                
                Spacer(modifier = Modifier.height(4.dp))
                
                Text(
                    text = "${formatFileSize(storageUsage.used)} used of ${formatFileSize(storageUsage.limit)}",
                    style = MaterialTheme.typography.bodySmall
                )
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                if (!isAuthenticated) {
                    OutlinedButton(
                        onClick = onAuthenticate,
                        modifier = Modifier.weight(1f)
                    ) {
                        Text("Connect")
                    }
                } else {
                    OutlinedButton(
                        onClick = onManage,
                        modifier = Modifier.weight(1f)
                    ) {
                        Text("Manage")
                    }
                }
                
                Button(
                    onClick = { /* Sync individual provider */ },
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Sync")
                }
            }
        }
    }
}

private fun getCloudProviders(): List<CloudProvider> {
    return listOf(
        CloudProvider.GOOGLE_DRIVE,
        CloudProvider.DROPBOX,
        CloudProvider.ONEDRIVE,
        CloudProvider.WEBDAV
    )
}

private fun getProviderName(provider: CloudProvider): String {
    return when (provider) {
        CloudProvider.GOOGLE_DRIVE -> "Google Drive"
        CloudProvider.DROPBOX -> "Dropbox"
        CloudProvider.ONEDRIVE -> "OneDrive"
        CloudProvider.WEBDAV -> "WebDAV"
    }
}

private fun getProviderIcon(provider: CloudProvider): ImageVector {
    return when (provider) {
        CloudProvider.GOOGLE_DRIVE -> Icons.Default.Cloud
        CloudProvider.DROPBOX -> Icons.Default.Cloud
        CloudProvider.ONEDRIVE -> Icons.Default.Cloud
        CloudProvider.WEBDAV -> Icons.Default.Storage
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