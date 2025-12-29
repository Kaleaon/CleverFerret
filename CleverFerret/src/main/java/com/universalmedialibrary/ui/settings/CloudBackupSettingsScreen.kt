package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.Cloud
import androidx.compose.material.icons.filled.CloudOff
import androidx.compose.material.icons.filled.Delete
import androidx.compose.material.icons.filled.Folder
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material.icons.filled.SdCard
import androidx.compose.material.icons.filled.Storage
import androidx.compose.material.icons.outlined.Backup
import androidx.compose.material.icons.outlined.CloudUpload
import androidx.compose.material.icons.outlined.Description
import androidx.compose.material.icons.outlined.FolderOpen
import androidx.compose.material.icons.outlined.PhoneAndroid
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FilledTonalButton
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.RadioButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.SnackbarHost
import androidx.compose.material3.SnackbarHostState
import androidx.compose.material3.Surface
import androidx.compose.material3.Switch
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import coil.compose.AsyncImage
import com.universalmedialibrary.services.backup.BackupFile
import com.universalmedialibrary.services.backup.BackupStatus
import com.universalmedialibrary.services.backup.LocalBackupService
import com.universalmedialibrary.services.backup.StorageLocation
import com.universalmedialibrary.services.backup.StorageStats
import com.universalmedialibrary.services.backup.StorageType
import com.universalmedialibrary.services.cloud.GoogleDriveOAuthService
import com.universalmedialibrary.services.cloud.GoogleSignInState
import com.universalmedialibrary.services.cloud.SyncStatus
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Cloud & Backup Settings ViewModel
 */
@HiltViewModel
class CloudBackupSettingsViewModel @Inject constructor(
    private val googleDriveService: GoogleDriveOAuthService,
    private val localBackupService: LocalBackupService
) : ViewModel() {
    
    val googleSignInState = googleDriveService.signInState
    val syncStatus = googleDriveService.syncStatus
    val backupStatus = localBackupService.backupStatus
    
    private val _uiState = MutableStateFlow(CloudBackupUiState())
    val uiState: StateFlow<CloudBackupUiState> = _uiState.asStateFlow()
    
    init {
        loadStorageLocations()
        loadBackupFiles()
    }
    
    private fun loadStorageLocations() {
        val locations = localBackupService.getAvailableStorageLocations()
        _uiState.value = _uiState.value.copy(storageLocations = locations)
    }
    
    fun loadBackupFiles() {
        viewModelScope.launch {
            val currentLocation = _uiState.value.selectedStorageId
            val aiLogs = localBackupService.listAILogs(currentLocation)
            val documents = localBackupService.listDocuments(currentLocation)
            val stats = localBackupService.getStorageStats(currentLocation)
            
            _uiState.value = _uiState.value.copy(
                aiLogs = aiLogs,
                documents = documents,
                storageStats = stats
            )
        }
    }
    
    fun selectStorageLocation(locationId: String) {
        _uiState.value = _uiState.value.copy(selectedStorageId = locationId)
        loadBackupFiles()
    }
    
    fun setAutoBackupEnabled(enabled: Boolean) {
        _uiState.value = _uiState.value.copy(autoBackupEnabled = enabled)
    }
    
    fun setBackupToCloud(enabled: Boolean) {
        _uiState.value = _uiState.value.copy(backupToCloud = enabled)
    }
    
    fun createFullBackup() {
        viewModelScope.launch {
            val result = localBackupService.createFullBackup(_uiState.value.selectedStorageId)
            result.onSuccess {
                _uiState.value = _uiState.value.copy(lastBackupMessage = "Backup created: ${it.name}")
                loadBackupFiles()
            }.onFailure {
                _uiState.value = _uiState.value.copy(lastBackupMessage = "Backup failed: ${it.message}")
            }
        }
    }
    
    fun deleteFile(path: String) {
        viewModelScope.launch {
            localBackupService.deleteFile(path)
            loadBackupFiles()
        }
    }
    
    fun initializeGoogleDrive() {
        googleDriveService.initialize()
    }
    
    fun getGoogleSignInIntent() = googleDriveService.getSignInIntent()
    
    fun signOutGoogle() {
        viewModelScope.launch {
            googleDriveService.signOut()
        }
    }
}

data class CloudBackupUiState(
    val storageLocations: List<StorageLocation> = emptyList(),
    val selectedStorageId: String = "internal",
    val aiLogs: List<BackupFile> = emptyList(),
    val documents: List<BackupFile> = emptyList(),
    val storageStats: StorageStats? = null,
    val autoBackupEnabled: Boolean = false,
    val backupToCloud: Boolean = false,
    val lastBackupMessage: String? = null
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CloudBackupSettingsScreen(
    onNavigateBack: () -> Unit,
    viewModel: CloudBackupSettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val googleSignInState by viewModel.googleSignInState.collectAsState()
    val syncStatus by viewModel.syncStatus.collectAsState()
    val backupStatus by viewModel.backupStatus.collectAsState()
    
    val snackbarHostState = remember { SnackbarHostState() }
    var showDeleteDialog by remember { mutableStateOf<BackupFile?>(null) }
    
    LaunchedEffect(Unit) {
        viewModel.initializeGoogleDrive()
    }
    
    LaunchedEffect(uiState.lastBackupMessage) {
        uiState.lastBackupMessage?.let {
            snackbarHostState.showSnackbar(it)
        }
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Cloud & Backup") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        },
        snackbarHost = { SnackbarHost(snackbarHostState) }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(horizontal = 16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Google Drive Section
            item {
                GoogleDriveSection(
                    signInState = googleSignInState,
                    syncStatus = syncStatus,
                    onSignIn = { /* Launch sign-in intent */ },
                    onSignOut = { viewModel.signOutGoogle() }
                )
            }
            
            item { HorizontalDivider() }
            
            // Local Storage Section
            item {
                Text(
                    text = "Local Backup Storage",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = "Choose where to save AI chat logs and documents",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            items(uiState.storageLocations) { location ->
                StorageLocationCard(
                    location = location,
                    isSelected = location.id == uiState.selectedStorageId,
                    onClick = { viewModel.selectStorageLocation(location.id) }
                )
            }
            
            item { HorizontalDivider() }
            
            // Storage Stats
            uiState.storageStats?.let { stats ->
                item {
                    StorageStatsCard(stats = stats)
                }
            }
            
            // Backup Options
            item {
                Text(
                    text = "Backup Options",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
            }
            
            item {
                BackupOptionRow(
                    title = "Auto-backup AI Conversations",
                    description = "Automatically save AI chat logs after each session",
                    checked = uiState.autoBackupEnabled,
                    onCheckedChange = { viewModel.setAutoBackupEnabled(it) }
                )
            }
            
            item {
                BackupOptionRow(
                    title = "Sync to Google Drive",
                    description = "Upload backups to your Google Drive",
                    checked = uiState.backupToCloud,
                    enabled = googleSignInState is GoogleSignInState.SignedIn,
                    onCheckedChange = { viewModel.setBackupToCloud(it) }
                )
            }
            
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    FilledTonalButton(
                        onClick = { viewModel.createFullBackup() },
                        modifier = Modifier.weight(1f),
                        enabled = backupStatus is BackupStatus.Idle
                    ) {
                        Icon(Icons.Outlined.Backup, contentDescription = null)
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Create Backup")
                    }
                    
                    OutlinedButton(
                        onClick = { viewModel.loadBackupFiles() },
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(Icons.Filled.Refresh, contentDescription = null)
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Refresh")
                    }
                }
            }
            
            // Backup Status
            if (backupStatus !is BackupStatus.Idle) {
                item {
                    BackupStatusIndicator(status = backupStatus)
                }
            }
            
            item { HorizontalDivider() }
            
            // Saved Files Section
            item {
                Text(
                    text = "AI Chat Logs (${uiState.aiLogs.size})",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
            }
            
            if (uiState.aiLogs.isEmpty()) {
                item {
                    Text(
                        text = "No AI chat logs saved yet",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            } else {
                items(uiState.aiLogs.take(5)) { file ->
                    BackupFileItem(
                        file = file,
                        onDelete = { showDeleteDialog = file }
                    )
                }
            }
            
            item {
                Text(
                    text = "Documents (${uiState.documents.size})",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
            }
            
            if (uiState.documents.isEmpty()) {
                item {
                    Text(
                        text = "No documents saved yet",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            } else {
                items(uiState.documents.take(5)) { file ->
                    BackupFileItem(
                        file = file,
                        onDelete = { showDeleteDialog = file }
                    )
                }
            }
            
            item { Spacer(modifier = Modifier.height(32.dp)) }
        }
    }
    
    // Delete confirmation dialog
    showDeleteDialog?.let { file ->
        AlertDialog(
            onDismissRequest = { showDeleteDialog = null },
            title = { Text("Delete File") },
            text = { Text("Are you sure you want to delete ${file.name}?") },
            confirmButton = {
                TextButton(
                    onClick = {
                        viewModel.deleteFile(file.path)
                        showDeleteDialog = null
                    }
                ) {
                    Text("Delete", color = MaterialTheme.colorScheme.error)
                }
            },
            dismissButton = {
                TextButton(onClick = { showDeleteDialog = null }) {
                    Text("Cancel")
                }
            }
        )
    }
}

@Composable
private fun GoogleDriveSection(
    signInState: GoogleSignInState,
    syncStatus: SyncStatus,
    onSignIn: () -> Unit,
    onSignOut: () -> Unit
) {
    Column {
        Row(
            modifier = Modifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = if (signInState is GoogleSignInState.SignedIn) Icons.Filled.Cloud else Icons.Filled.CloudOff,
                contentDescription = null,
                tint = if (signInState is GoogleSignInState.SignedIn) 
                    MaterialTheme.colorScheme.primary 
                else 
                    MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.width(12.dp))
            Text(
                text = "Google Drive",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
        }
        
        Spacer(modifier = Modifier.height(12.dp))
        
        when (signInState) {
            is GoogleSignInState.SignedOut -> {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.surfaceVariant
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Sign in with your Google account to backup AI logs to Drive",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Spacer(modifier = Modifier.height(12.dp))
                        Button(onClick = onSignIn) {
                            Text("Sign in with Google")
                        }
                    }
                }
            }
            
            is GoogleSignInState.SignedIn -> {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.3f)
                    )
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        if (signInState.photoUrl != null) {
                            AsyncImage(
                                model = signInState.photoUrl,
                                contentDescription = "Profile photo",
                                modifier = Modifier
                                    .size(48.dp)
                                    .clip(CircleShape),
                                contentScale = ContentScale.Crop
                            )
                        } else {
                            Box(
                                modifier = Modifier
                                    .size(48.dp)
                                    .clip(CircleShape)
                                    .background(MaterialTheme.colorScheme.primary),
                                contentAlignment = Alignment.Center
                            ) {
                                Text(
                                    text = signInState.displayName.take(1).uppercase(),
                                    style = MaterialTheme.typography.titleLarge,
                                    color = MaterialTheme.colorScheme.onPrimary
                                )
                            }
                        }
                        
                        Spacer(modifier = Modifier.width(12.dp))
                        
                        Column(modifier = Modifier.weight(1f)) {
                            Text(
                                text = signInState.displayName,
                                style = MaterialTheme.typography.titleSmall,
                                fontWeight = FontWeight.Medium
                            )
                            Text(
                                text = signInState.email,
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                        
                        Icon(
                            imageVector = Icons.Filled.Check,
                            contentDescription = "Connected",
                            tint = MaterialTheme.colorScheme.primary
                        )
                    }
                    
                    // Sync status
                    if (syncStatus !is SyncStatus.Idle) {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(horizontal = 16.dp)
                                .padding(bottom = 16.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(16.dp),
                                strokeWidth = 2.dp
                            )
                            Spacer(modifier = Modifier.width(8.dp))
                            Text(
                                text = when (syncStatus) {
                                    is SyncStatus.Uploading -> "Uploading ${syncStatus.fileName}..."
                                    is SyncStatus.Downloading -> "Downloading ${syncStatus.fileName}..."
                                    is SyncStatus.Error -> "Error: ${syncStatus.message}"
                                    else -> ""
                                },
                                style = MaterialTheme.typography.bodySmall
                            )
                        }
                    }
                    
                    OutlinedButton(
                        onClick = onSignOut,
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 16.dp)
                            .padding(bottom = 16.dp)
                    ) {
                        Text("Sign Out")
                    }
                }
            }
            
            is GoogleSignInState.Error -> {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.errorContainer
                    )
                ) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Text(
                            text = "Sign-in Error",
                            style = MaterialTheme.typography.titleSmall,
                            color = MaterialTheme.colorScheme.onErrorContainer
                        )
                        Text(
                            text = signInState.message,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onErrorContainer
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Button(onClick = onSignIn) {
                            Text("Try Again")
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun StorageLocationCard(
    location: StorageLocation,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = if (isSelected) 
                MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.3f) 
            else 
                MaterialTheme.colorScheme.surface
        ),
        shape = RoundedCornerShape(12.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            RadioButton(
                selected = isSelected,
                onClick = onClick
            )
            
            Spacer(modifier = Modifier.width(12.dp))
            
            Icon(
                imageVector = when (location.type) {
                    StorageType.INTERNAL -> Icons.Outlined.PhoneAndroid
                    StorageType.SD_CARD -> Icons.Filled.SdCard
                    StorageType.EXTERNAL -> Icons.Filled.Storage
                    StorageType.APP_INTERNAL -> Icons.Outlined.FolderOpen
                },
                contentDescription = null,
                tint = if (isSelected) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(modifier = Modifier.width(12.dp))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = location.name,
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    text = "${location.freeSpaceFormatted} free of ${location.totalSpaceFormatted}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                
                Spacer(modifier = Modifier.height(4.dp))
                
                LinearProgressIndicator(
                    progress = { location.usedPercentage },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(4.dp)
                        .clip(RoundedCornerShape(2.dp)),
                )
            }
        }
    }
}

@Composable
private fun StorageStatsCard(stats: StorageStats) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f)
        )
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text(
                text = "Storage Usage",
                style = MaterialTheme.typography.titleSmall,
                fontWeight = FontWeight.Bold
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                StatItem(
                    icon = Icons.Outlined.Description,
                    label = "AI Logs",
                    value = "${stats.aiLogsCount} files"
                )
                StatItem(
                    icon = Icons.Filled.Folder,
                    label = "Documents",
                    value = "${stats.documentsCount} files"
                )
                StatItem(
                    icon = Icons.Outlined.Backup,
                    label = "Backups",
                    value = "${stats.backupsCount} files"
                )
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Text(
                text = "Total: ${stats.totalSizeFormatted}",
                style = MaterialTheme.typography.labelMedium,
                color = MaterialTheme.colorScheme.primary
            )
        }
    }
}

@Composable
private fun StatItem(
    icon: ImageVector,
    label: String,
    value: String
) {
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Icon(
            imageVector = icon,
            contentDescription = null,
            modifier = Modifier.size(24.dp),
            tint = MaterialTheme.colorScheme.primary
        )
        Spacer(modifier = Modifier.height(4.dp))
        Text(
            text = value,
            style = MaterialTheme.typography.labelMedium,
            fontWeight = FontWeight.Medium
        )
        Text(
            text = label,
            style = MaterialTheme.typography.labelSmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@Composable
private fun BackupOptionRow(
    title: String,
    description: String,
    checked: Boolean,
    enabled: Boolean = true,
    onCheckedChange: (Boolean) -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 8.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = title,
                style = MaterialTheme.typography.bodyLarge,
                color = if (enabled) MaterialTheme.colorScheme.onSurface else MaterialTheme.colorScheme.onSurface.copy(alpha = 0.5f)
            )
            Text(
                text = description,
                style = MaterialTheme.typography.bodySmall,
                color = if (enabled) MaterialTheme.colorScheme.onSurfaceVariant else MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.5f)
            )
        }
        Switch(
            checked = checked,
            onCheckedChange = onCheckedChange,
            enabled = enabled
        )
    }
}

@Composable
private fun BackupStatusIndicator(status: BackupStatus) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.3f)
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            CircularProgressIndicator(
                modifier = Modifier.size(24.dp),
                strokeWidth = 2.dp
            )
            Spacer(modifier = Modifier.width(12.dp))
            Text(
                text = when (status) {
                    is BackupStatus.Saving -> "Saving ${status.item}..."
                    is BackupStatus.CreatingBackup -> "Creating backup..."
                    is BackupStatus.Restoring -> "Restoring backup..."
                    is BackupStatus.Error -> "Error: ${status.message}"
                    else -> ""
                },
                style = MaterialTheme.typography.bodyMedium
            )
        }
    }
}

@Composable
private fun BackupFileItem(
    file: BackupFile,
    onDelete: () -> Unit
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(8.dp),
        color = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.3f)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = Icons.Outlined.Description,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.primary
            )
            
            Spacer(modifier = Modifier.width(12.dp))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = file.name,
                    style = MaterialTheme.typography.bodyMedium,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    text = "${file.sizeFormatted} • ${file.lastModifiedFormatted}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            IconButton(onClick = onDelete) {
                Icon(
                    imageVector = Icons.Filled.Delete,
                    contentDescription = "Delete",
                    tint = MaterialTheme.colorScheme.error
                )
            }
        }
    }
}
