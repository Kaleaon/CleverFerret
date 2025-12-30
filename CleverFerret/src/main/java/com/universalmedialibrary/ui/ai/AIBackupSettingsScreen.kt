package com.universalmedialibrary.ui.ai

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.selection.selectable
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.services.ai.*

/**
 * AI Backup Settings Screen
 * 
 * Provides UI controls for managing AI backup automation:
 * - Enable/disable automated backups
 * - Configure backup schedules
 * - Choose backup locations
 * - Encryption settings
 * - Manual backup/restore operations
 * - Backup history and statistics
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AIBackupSettingsScreen(
    onNavigateBack: () -> Unit,
    viewModel: AIBackupSettingsViewModel = hiltViewModel()
) {
    val backupConfig by viewModel.backupConfig.collectAsStateWithLifecycle()
    val backupHistory by viewModel.backupHistory.collectAsStateWithLifecycle()
    val isLoading by viewModel.isLoading.collectAsStateWithLifecycle()
    
    var showManualBackupDialog by remember { mutableStateOf(false) }
    var showRestoreDialog by remember { mutableStateOf(false) }
    var showScheduleDialog by remember { mutableStateOf(false) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, null)
                    }
                },
                title = {
                    Text("AI Backup Settings")
                }
            )
        }
    ) { padding ->
        if (isLoading) {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding),
                contentAlignment = Alignment.Center
            ) {
                CircularProgressIndicator()
            }
        } else {
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding)
                    .padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Status Card
                item {
                    BackupStatusCard(
                        config = backupConfig,
                        lastBackup = backupHistory.firstOrNull(),
                        onToggleBackup = { enabled -> 
                            viewModel.toggleBackup(enabled)
                        }
                    )
                }
                
                // Schedule Configuration
                item {
                    ScheduleConfigurationCard(
                        config = backupConfig,
                        onEditSchedule = { showScheduleDialog = true }
                    )
                }
                
                // Backup Location
                item {
                    BackupLocationCard(
                        config = backupConfig,
                        onLocationChange = { location ->
                            viewModel.updateBackupLocation(location)
                        }
                    )
                }
                
                // Encryption Settings
                item {
                    EncryptionSettingsCard(
                        config = backupConfig,
                        onEncryptionChange = { enabled ->
                            viewModel.updateEncryption(enabled)
                        }
                    )
                }
                
                // Manual Operations
                item {
                    ManualOperationsCard(
                        onManualBackup = { showManualBackupDialog = true },
                        onManualRestore = { showRestoreDialog = true },
                        onExportBackup = { viewModel.exportBackup() },
                        onImportBackup = { viewModel.importBackup() }
                    )
                }
                
                // Backup History
                item {
                    BackupHistoryCard(
                        history = backupHistory.take(10),
                        onRestoreBackup = { backup ->
                            viewModel.restoreFromBackup(backup)
                        },
                        onDeleteBackup = { backup ->
                            viewModel.deleteBackup(backup)
                        }
                    )
                }
            }
        }
    }
    
    // Schedule Dialog
    if (showScheduleDialog) {
        ScheduleDialog(
            currentSchedule = backupConfig.scheduleHours,
            onDismiss = { showScheduleDialog = false },
            onSave = { hours ->
                viewModel.updateSchedule(hours)
                showScheduleDialog = false
            }
        )
    }
    
    // Manual Backup Dialog
    if (showManualBackupDialog) {
        ManualBackupDialog(
            onDismiss = { showManualBackupDialog = false },
            onConfirm = {
                viewModel.performManualBackup()
                showManualBackupDialog = false
            }
        )
    }
    
    // Restore Dialog
    if (showRestoreDialog) {
        RestoreDialog(
            onDismiss = { showRestoreDialog = false },
            onConfirm = {
                viewModel.performRestore()
                showRestoreDialog = false
            }
        )
    }
}

@Composable
private fun BackupStatusCard(
    config: AIBackupConfig,
    lastBackup: LocalBackupResult?,
    onToggleBackup: (Boolean) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    Text(
                        text = "Automated Backup",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    
                    if (config.enabled) {
                        Text(
                            text = "Every ${config.scheduleHours} hours",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        
                        lastBackup?.let { backup ->
                            Text(
                                text = "Last backup: ${formatTimestamp(backup.timestamp)}",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    } else {
                        Text(
                            text = "Disabled",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.error
                        )
                    }
                }
                
                Switch(
                    checked = config.enabled,
                    onCheckedChange = onToggleBackup
                )
            }
        }
    }
}

@Composable
private fun ScheduleConfigurationCard(
    config: AIBackupConfig,
    onEditSchedule: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
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
                    text = "Backup Schedule",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Every ${config.scheduleHours} hours",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            IconButton(onClick = onEditSchedule) {
                Icon(Icons.Filled.Edit, contentDescription = "Edit Schedule")
            }
        }
    }
}

@Composable
private fun BackupLocationCard(
    config: AIBackupConfig,
    onLocationChange: (LocalBackupLocation) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Backup Location",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            LocalBackupLocation.values().forEach { location ->
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .selectable(
                            selected = config.location == location,
                            onClick = { onLocationChange(location) },
                            role = Role.RadioButton
                        )
                        .padding(vertical = 8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    RadioButton(
                        selected = config.location == location,
                        onClick = null
                    )
                    
                    Spacer(modifier = Modifier.width(12.dp))
                    
                    Column {
                        Text(
                            text = location.displayName,
                            style = MaterialTheme.typography.bodyMedium
                        )
                        Text(
                            text = location.description,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun EncryptionSettingsCard(
    config: AIBackupConfig,
    onEncryptionChange: (Boolean) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
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
                    text = "Encryption",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Protect backups with AES-256 encryption",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            Switch(
                checked = config.encryptionEnabled,
                onCheckedChange = onEncryptionChange
            )
        }
    }
}

@Composable
private fun ManualOperationsCard(
    onManualBackup: () -> Unit,
    onManualRestore: () -> Unit,
    onExportBackup: () -> Unit,
    onImportBackup: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Manual Operations",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Button(
                    onClick = onManualBackup,
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Backup Now")
                }
                
                OutlinedButton(
                    onClick = onManualRestore,
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Restore")
                }
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                OutlinedButton(
                    onClick = onExportBackup,
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Export")
                }
                
                OutlinedButton(
                    onClick = onImportBackup,
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Import")
                }
            }
        }
    }
}

@Composable
private fun BackupHistoryCard(
    history: List<LocalBackupResult>,
    onRestoreBackup: (LocalBackupResult) -> Unit,
    onDeleteBackup: (LocalBackupResult) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Backup History",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            if (history.isEmpty()) {
                Text(
                    text = "No backups available",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    modifier = Modifier.fillMaxWidth(),
                    textAlign = androidx.compose.ui.text.style.TextAlign.Center
                )
            } else {
                history.forEach { backup ->
                    BackupHistoryItem(
                        backup = backup,
                        onRestore = { onRestoreBackup(backup) },
                        onDelete = { onDeleteBackup(backup) }
                    )
                }
            }
        }
    }
}

@Composable
private fun BackupHistoryItem(
    backup: LocalBackupResult,
    onRestore: () -> Unit,
    onDelete: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = formatTimestamp(backup.timestamp),
                style = MaterialTheme.typography.bodyMedium
            )
            Text(
                text = if (backup.success) "Success" else "Failed: ${backup.error}",
                style = MaterialTheme.typography.bodySmall,
                color = if (backup.success) 
                    Color(0xFF4CAF50) else Color.Red
            )
        }
        
        Row {
            IconButton(
                onClick = onRestore,
                enabled = backup.success
            ) {
                Icon(
                    Icons.Filled.Restore,
                    contentDescription = "Restore",
                    modifier = Modifier.size(20.dp)
                )
            }
            
            IconButton(
                onClick = onDelete
            ) {
                Icon(
                    Icons.Filled.Delete,
                    contentDescription = "Delete",
                    modifier = Modifier.size(20.dp)
                )
            }
        }
    }
}

@Composable
private fun ScheduleDialog(
    currentSchedule: Int,
    onDismiss: () -> Unit,
    onSave: (Int) -> Unit
) {
    var selectedHours by remember { mutableStateOf(currentSchedule.toString()) }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Backup Schedule")
        },
        text = {
            Column {
                Text(
                    text = "Set backup interval in hours:",
                    style = MaterialTheme.typography.bodyMedium
                )
                Spacer(modifier = Modifier.height(16.dp))
                OutlinedTextField(
                    value = selectedHours,
                    onValueChange = { selectedHours = it },
                    label = { Text("Hours") },
                    singleLine = true
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    val hours = selectedHours.toIntOrNull()
                    if (hours != null && hours > 0) {
                        onSave(hours)
                    }
                }
            ) {
                Text("Save")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

@Composable
private fun ManualBackupDialog(
    onDismiss: () -> Unit,
    onConfirm: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Manual Backup")
        },
        text = {
            Text(
                text = "Create a backup of all AI data now? This includes characters, memories, and settings.",
                style = MaterialTheme.typography.bodyMedium
            )
        },
        confirmButton = {
            TextButton(onClick = onConfirm) {
                Text("Backup")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

@Composable
private fun RestoreDialog(
    onDismiss: () -> Unit,
    onConfirm: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Restore Backup")
        },
        text = {
            Text(
                text = "Restore AI data from the most recent backup? This will overwrite current data.",
                style = MaterialTheme.typography.bodyMedium
            )
        },
        confirmButton = {
            TextButton(onClick = onConfirm) {
                Text("Restore")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

// Helper functions and extensions
private fun formatTimestamp(timestamp: Long): String {
    val date = java.util.Date(timestamp)
    val format = java.text.SimpleDateFormat("MMM dd, yyyy HH:mm", java.util.Locale.getDefault())
    return format.format(date)
}

private val LocalBackupLocation.displayName: String
    get() = when (this) {
        LocalBackupLocation.INTERNAL -> "Internal Storage"
        LocalBackupLocation.SD_CARD -> "SD Card"
        LocalBackupLocation.EXTERNAL -> "External Storage"
    }

private val LocalBackupLocation.description: String
    get() = when (this) {
        LocalBackupLocation.INTERNAL -> "Device internal storage"
        LocalBackupLocation.SD_CARD -> "Removable SD card (recommended)"
        LocalBackupLocation.EXTERNAL -> "External USB storage"
    }