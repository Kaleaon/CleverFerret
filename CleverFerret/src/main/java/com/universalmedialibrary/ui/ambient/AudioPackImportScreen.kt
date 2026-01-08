package com.universalmedialibrary.ui.ambient

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
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
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.AudioPack
import com.universalmedialibrary.services.ambient.AudioPackImporter
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Screen for importing custom audio packs from zip files
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AudioPackImportScreen(
    onBack: () -> Unit,
    viewModel: AudioPackImportViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val packs by viewModel.audioPacks.collectAsState()
    val storageInfo by viewModel.storageInfo.collectAsState()
    
    var showImportDialog by remember { mutableStateOf(false) }
    var selectedPackForDelete by remember { mutableStateOf<AudioPack?>(null) }
    
    val zipPickerLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.GetContent()
    ) { uri: Uri? ->
        uri?.let { 
            showImportDialog = true
            viewModel.setSelectedZip(it)
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Import Audio Packs") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { zipPickerLauncher.launch("application/zip") }) {
                        Icon(Icons.Default.Add, contentDescription = "Import Zip")
                    }
                }
            )
        },
        floatingActionButton = {
            if (uiState !is AudioPackImportUiState.Importing) {
                FloatingActionButton(
                    onClick = { zipPickerLauncher.launch("application/zip") }
                ) {
                    Icon(Icons.Default.FileUpload, contentDescription = "Import")
                }
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
            // Storage info card
            item {
                StorageInfoCard(storageInfo)
            }
            
            // Import status
            item {
                when (val state = uiState) {
                    is AudioPackImportUiState.Importing -> {
                        ImportProgressCard(
                            progress = state.progress,
                            message = state.message
                        )
                    }
                    is AudioPackImportUiState.Success -> {
                        SuccessCard(
                            message = state.message,
                            soundsImported = state.soundsImported,
                            onDismiss = { viewModel.clearState() }
                        )
                    }
                    is AudioPackImportUiState.Error -> {
                        ErrorCard(
                            message = state.message,
                            errors = state.errors,
                            onDismiss = { viewModel.clearState() }
                        )
                    }
                    else -> {}
                }
            }
            
            // Instructions card
            if (packs.isEmpty() && uiState is AudioPackImportUiState.Idle) {
                item {
                    InstructionsCard()
                }
            }
            
            // Imported packs list
            item {
                Text(
                    text = "Imported Packs (${packs.size})",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
            }
            
            items(packs) { pack ->
                AudioPackCard(
                    pack = pack,
                    onDelete = { selectedPackForDelete = pack },
                    onToggleEnabled = { viewModel.togglePackEnabled(pack.id, !pack.isEnabled) }
                )
            }
        }
    }
    
    // Import dialog
    if (showImportDialog) {
        ImportDialog(
            onDismiss = { showImportDialog = false },
            onConfirm = { packName ->
                showImportDialog = false
                viewModel.importPack(packName)
            }
        )
    }
    
    // Delete confirmation dialog
    selectedPackForDelete?.let { pack ->
        AlertDialog(
            onDismissRequest = { selectedPackForDelete = null },
            icon = { Icon(Icons.Default.Warning, contentDescription = null) },
            title = { Text("Delete Audio Pack?") },
            text = {
                Text("This will delete ${pack.name} and all ${pack.soundCount} sounds. This action cannot be undone.")
            },
            confirmButton = {
                Button(
                    onClick = {
                        viewModel.deletePack(pack.id)
                        selectedPackForDelete = null
                    },
                    colors = ButtonDefaults.buttonColors(
                        containerColor = MaterialTheme.colorScheme.error
                    )
                ) {
                    Text("Delete")
                }
            },
            dismissButton = {
                TextButton(onClick = { selectedPackForDelete = null }) {
                    Text("Cancel")
                }
            }
        )
    }
}

@Composable
private fun StorageInfoCard(storageInfo: AudioPackImporter.StorageInfo?) {
    storageInfo?.let { info ->
        Card {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp)
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = if (info.isSDCard) Icons.Default.SdCard else Icons.Default.Storage,
                        contentDescription = null,
                        tint = MaterialTheme.colorScheme.primary
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = if (info.isSDCard) "SD Card Storage" else "Internal Storage",
                        style = MaterialTheme.typography.titleSmall,
                        fontWeight = FontWeight.Bold
                    )
                }
                
                Spacer(modifier = Modifier.height(8.dp))
                
                Text(
                    text = info.location,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                
                Spacer(modifier = Modifier.height(12.dp))
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Column {
                        Text(
                            text = "${info.freeSpaceGB} GB",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.primary
                        )
                        Text(
                            text = "Available",
                            style = MaterialTheme.typography.bodySmall
                        )
                    }
                    Column {
                        Text(
                            text = "${info.totalSpaceGB} GB",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Total",
                            style = MaterialTheme.typography.bodySmall
                        )
                    }
                }
                
                Spacer(modifier = Modifier.height(8.dp))
                
                LinearProgressIndicator(
                    progress = info.usedSpaceGB.toFloat() / info.totalSpaceGB.toFloat(),
                    modifier = Modifier.fillMaxWidth()
                )
            }
        }
    }
}

@Composable
private fun ImportProgressCard(progress: Int, message: String) {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                CircularProgressIndicator(
                    modifier = Modifier.size(24.dp),
                    strokeWidth = 3.dp
                )
                Spacer(modifier = Modifier.width(12.dp))
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = "Importing...",
                        style = MaterialTheme.typography.titleSmall,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = message,
                        style = MaterialTheme.typography.bodySmall
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            LinearProgressIndicator(
                progress = progress / 100f,
                modifier = Modifier.fillMaxWidth()
            )
            
            Text(
                text = "$progress%",
                style = MaterialTheme.typography.bodySmall,
                modifier = Modifier.align(Alignment.End)
            )
        }
    }
}

@Composable
private fun SuccessCard(message: String, soundsImported: Int, onDismiss: () -> Unit) {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
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
                        imageVector = Icons.Default.CheckCircle,
                        contentDescription = null,
                        tint = MaterialTheme.colorScheme.primary
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Column {
                        Text(
                            text = "Import Successful!",
                            style = MaterialTheme.typography.titleSmall,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "$soundsImported sounds imported",
                            style = MaterialTheme.typography.bodySmall
                        )
                    }
                }
                IconButton(onClick = onDismiss) {
                    Icon(Icons.Default.Close, contentDescription = "Dismiss")
                }
            }
        }
    }
}

@Composable
private fun ErrorCard(message: String, errors: List<String>, onDismiss: () -> Unit) {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.errorContainer
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
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
                        imageVector = Icons.Default.Error,
                        contentDescription = null,
                        tint = MaterialTheme.colorScheme.error
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Column {
                        Text(
                            text = "Import Failed",
                            style = MaterialTheme.typography.titleSmall,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = message,
                            style = MaterialTheme.typography.bodySmall
                        )
                    }
                }
                IconButton(onClick = onDismiss) {
                    Icon(Icons.Default.Close, contentDescription = "Dismiss")
                }
            }
        }
    }
}

@Composable
private fun InstructionsCard() {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    imageVector = Icons.Default.Info,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary
                )
                Spacer(modifier = Modifier.width(8.dp))
                Text(
                    text = "How to Import Audio Packs",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold
                )
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            Text(
                text = "1. Prepare a ZIP file with your ambient sounds (MP3, WAV, OGG, FLAC, M4A, AAC)",
                style = MaterialTheme.typography.bodySmall
            )
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = "2. Tap the + button or FAB to select your ZIP file",
                style = MaterialTheme.typography.bodySmall
            )
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = "3. The system will extract to SD card (if available) or internal storage",
                style = MaterialTheme.typography.bodySmall
            )
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = "4. Sounds are automatically categorized by filename and metadata",
                style = MaterialTheme.typography.bodySmall
            )
        }
    }
}

@Composable
private fun AudioPackCard(
    pack: AudioPack,
    onDelete: () -> Unit,
    onToggleEnabled: () -> Unit
) {
    Card {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = pack.name,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "${pack.soundCount} sounds · ${pack.totalSizeMB} MB",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                Row {
                    Switch(
                        checked = pack.isEnabled,
                        onCheckedChange = { onToggleEnabled() }
                    )
                    IconButton(onClick = onDelete) {
                        Icon(
                            Icons.Default.Delete,
                            contentDescription = "Delete",
                            tint = MaterialTheme.colorScheme.error
                        )
                    }
                }
            }
            
            if (pack.metadata.tags.isNotEmpty()) {
                Spacer(modifier = Modifier.height(8.dp))
                Row(
                    horizontalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    pack.metadata.tags.take(5).forEach { tag ->
                        AssistChip(
                            onClick = { },
                            label = { Text(tag, style = MaterialTheme.typography.labelSmall) }
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun ImportDialog(
    onDismiss: () -> Unit,
    onConfirm: (String) -> Unit
) {
    var packName by remember { mutableStateOf("") }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        icon = { Icon(Icons.Default.FileUpload, contentDescription = "Upload file") },
        title = { Text("Import Audio Pack") },
        text = {
            Column {
                Text("Enter a name for this audio pack:")
                Spacer(modifier = Modifier.height(8.dp))
                OutlinedTextField(
                    value = packName,
                    onValueChange = { packName = it },
                    label = { Text("Pack Name") },
                    placeholder = { Text("My Ambient Sounds") },
                    singleLine = true
                )
            }
        },
        confirmButton = {
            Button(
                onClick = { onConfirm(packName.ifBlank { "Imported Pack" }) },
                enabled = true
            ) {
                Text("Import")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

/**
 * ViewModel for audio pack import screen
 */
@HiltViewModel
class AudioPackImportViewModel @Inject constructor(
    private val audioPackImporter: AudioPackImporter,
    private val audioPackDao: com.universalmedialibrary.data.local.dao.AudioPackDao
) : ViewModel() {
    
    private val _uiState = MutableStateFlow<AudioPackImportUiState>(AudioPackImportUiState.Idle)
    val uiState: StateFlow<AudioPackImportUiState> = _uiState.asStateFlow()
    
    private val _audioPacks = MutableStateFlow<List<AudioPack>>(emptyList())
    val audioPacks: StateFlow<List<AudioPack>> = _audioPacks.asStateFlow()
    
    private val _storageInfo = MutableStateFlow<AudioPackImporter.StorageInfo?>(null)
    val storageInfo: StateFlow<AudioPackImporter.StorageInfo?> = _storageInfo.asStateFlow()
    
    private var selectedZipUri: Uri? = null
    
    init {
        loadPacks()
        loadStorageInfo()
    }
    
    private fun loadPacks() {
        viewModelScope.launch {
            audioPackDao.getAllPacks().collect { packs ->
                _audioPacks.value = packs
            }
        }
    }
    
    private fun loadStorageInfo() {
        viewModelScope.launch {
            _storageInfo.value = audioPackImporter.getStorageInfo()
        }
    }
    
    fun setSelectedZip(uri: Uri) {
        selectedZipUri = uri
    }
    
    fun importPack(packName: String) {
        val uri = selectedZipUri ?: return
        
        viewModelScope.launch {
            _uiState.value = AudioPackImportUiState.Importing(0, "Starting import...")
            
            val result = audioPackImporter.importAudioPack(uri, packName) { progress, message ->
                _uiState.value = AudioPackImportUiState.Importing(progress, message)
            }
            
            _uiState.value = if (result.success) {
                AudioPackImportUiState.Success(result.message, result.soundsImported)
            } else {
                AudioPackImportUiState.Error(result.message, result.errors)
            }
            
            loadStorageInfo()
        }
    }
    
    fun deletePack(packId: Long) {
        viewModelScope.launch {
            audioPackImporter.deleteAudioPack(packId)
            loadStorageInfo()
        }
    }
    
    fun togglePackEnabled(packId: Long, enabled: Boolean) {
        viewModelScope.launch {
            audioPackDao.setPackEnabled(packId, enabled)
        }
    }
    
    fun clearState() {
        _uiState.value = AudioPackImportUiState.Idle
    }
}

sealed class AudioPackImportUiState {
    object Idle : AudioPackImportUiState()
    data class Importing(val progress: Int, val message: String) : AudioPackImportUiState()
    data class Success(val message: String, val soundsImported: Int) : AudioPackImportUiState()
    data class Error(val message: String, val errors: List<String>) : AudioPackImportUiState()
}
