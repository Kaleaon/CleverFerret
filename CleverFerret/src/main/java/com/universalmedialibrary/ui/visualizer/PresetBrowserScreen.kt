package com.universalmedialibrary.ui.visualizer

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.visualizer.VisualizerPreset
import com.universalmedialibrary.services.visualizer.VisualizerPresetManager
import com.universalmedialibrary.services.visualizer.getCategory
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Preset Browser Screen
 * 
 * Allows users to browse, download, and manage visualizer presets
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PresetBrowserScreen(
    onBack: () -> Unit,
    onPresetSelected: (VisualizerPreset) -> Unit,
    onNavigateToEditor: (String?) -> Unit = {},
    viewModel: PresetBrowserViewModel = hiltViewModel()
) {
    val presets by viewModel.presets.collectAsState()
    val searchQuery by viewModel.searchQuery.collectAsState()
    var showImportDialog by remember { mutableStateOf(false) }
    var selectedPreset by remember { mutableStateOf<VisualizerPreset?>(null) }
    var presetToShare by remember { mutableStateOf<VisualizerPreset?>(null) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        text = "Visualizer Presets",
                        style = MaterialTheme.typography.titleMedium
                    ) 
                },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    // Create new preset button
                    IconButton(onClick = { onNavigateToEditor(null) }) {
                        Icon(Icons.Default.Add, "Create New Preset")
                    }
                    // Import preset button
                    IconButton(onClick = { showImportDialog = true }) {
                        Icon(Icons.Default.Download, "Import Preset")
                    }
                    // Help button
                    IconButton(onClick = { /* Show help dialog */ }) {
                        Icon(Icons.Default.Info, "Help")
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.surface
                )
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Search bar
            OutlinedTextField(
                value = searchQuery,
                onValueChange = { viewModel.updateSearchQuery(it) },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                placeholder = { Text("Search presets...") },
                leadingIcon = { Icon(Icons.Default.Search, "Search") },
                singleLine = true,
                colors = OutlinedTextFieldDefaults.colors(
                    focusedContainerColor = MaterialTheme.colorScheme.surfaceVariant,
                    unfocusedContainerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            )
            
            // Preset count
            Text(
                text = "${presets.size} presets available",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp)
            )
            
            // Preset list
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(presets) { preset ->
                    PresetCard(
                        preset = preset,
                        onClick = { 
                            selectedPreset = preset
                            onPresetSelected(preset)
                        },
                        onShare = { presetToShare = preset },
                        onEdit = { onNavigateToEditor(preset.id) }
                    )
                }
            }
        }
    }
    
    if (showImportDialog) {
        ImportPresetDialog(
            onDismiss = { showImportDialog = false },
            onImport = { jsonString ->
                viewModel.importPreset(jsonString)
                showImportDialog = false
            }
        )
    }
    
    presetToShare?.let { preset ->
        PresetShareDialog(
            preset = preset,
            onDismiss = { presetToShare = null }
        )
    }
}

@Composable
private fun PresetCard(
    preset: VisualizerPreset,
    onClick: () -> Unit,
    onShare: () -> Unit,
    onEdit: () -> Unit
) {
    Card(
        onClick = onClick,
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
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
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = preset.name,
                        style = MaterialTheme.typography.titleMedium,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    Text(
                        text = "by ${preset.author}",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                // Category badge
                AssistChip(
                    onClick = { },
                    label = { 
                        Text(
                            preset.getCategory().name,
                            style = MaterialTheme.typography.labelSmall
                        ) 
                    },
                    colors = AssistChipDefaults.assistChipColors(
                        containerColor = MaterialTheme.colorScheme.secondaryContainer,
                        labelColor = MaterialTheme.colorScheme.onSecondaryContainer
                    )
                )
            }
            
            if (preset.description.isNotEmpty()) {
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = preset.description,
                    style = MaterialTheme.typography.bodyMedium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            // Tags
            if (preset.tags.isNotEmpty()) {
                Spacer(modifier = Modifier.height(8.dp))
                Row(
                    horizontalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    preset.tags.take(3).forEach { tag ->
                        SuggestionChip(
                            onClick = { },
                            label = { 
                                Text(
                                    tag,
                                    style = MaterialTheme.typography.labelSmall
                                ) 
                            },
                            colors = SuggestionChipDefaults.suggestionChipColors(
                                containerColor = MaterialTheme.colorScheme.tertiaryContainer,
                                labelColor = MaterialTheme.colorScheme.onTertiaryContainer
                            )
                        )
                    }
                }
            }
            
            // Actions
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(top = 8.dp),
                horizontalArrangement = Arrangement.spacedBy(6.dp)
            ) {
                // Edit button (only for custom presets)
                if (preset.tags.contains("custom") || preset.tags.contains("user-created")) {
                    OutlinedButton(
                        onClick = onEdit,
                        modifier = Modifier.weight(0.8f)
                    ) {
                        Icon(
                            Icons.Default.Edit,
                            contentDescription = null,
                            modifier = Modifier.size(16.dp)
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Edit", style = MaterialTheme.typography.labelSmall)
                    }
                }
                
                OutlinedButton(
                    onClick = onShare,
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(
                        Icons.Default.Share,
                        contentDescription = null,
                        modifier = Modifier.size(18.dp)
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Share")
                }
                
                Button(
                    onClick = onClick,
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(
                        Icons.Default.PlayArrow,
                        contentDescription = null,
                        modifier = Modifier.size(18.dp)
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Use")
                }
            }
        }
    }
}

@Composable
private fun ImportPresetDialog(
    onDismiss: () -> Unit,
    onImport: (String) -> Unit
) {
    var jsonText by remember { mutableStateOf("") }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Import Preset") },
        text = {
            Column {
                Text(
                    text = "Paste preset JSON below:",
                    style = MaterialTheme.typography.bodyMedium,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
                OutlinedTextField(
                    value = jsonText,
                    onValueChange = { jsonText = it },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(200.dp),
                    placeholder = { Text("Paste JSON here...") },
                    maxLines = 10
                )
            }
        },
        confirmButton = {
            Button(
                onClick = { onImport(jsonText) },
                enabled = jsonText.isNotBlank()
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

@HiltViewModel
class PresetBrowserViewModel @Inject constructor(
    @dagger.hilt.android.qualifiers.ApplicationContext private val context: android.content.Context
) : ViewModel() {
    
    private val presetManager = VisualizerPresetManager()
    
    private val _presets = MutableStateFlow<List<VisualizerPreset>>(emptyList())
    val presets: StateFlow<List<VisualizerPreset>> = _presets.asStateFlow()
    
    private val _searchQuery = MutableStateFlow("")
    val searchQuery: StateFlow<String> = _searchQuery.asStateFlow()
    
    private val customPresets = mutableListOf<VisualizerPreset>()
    
    init {
        loadPresets()
    }
    
    private fun loadPresets() {
        _presets.value = presetManager.getAllPresets(customPresets)
    }
    
    fun updateSearchQuery(query: String) {
        _searchQuery.value = query
        filterPresets(query)
    }
    
    private fun filterPresets(query: String) {
        val allPresets = presetManager.getAllPresets(customPresets)
        _presets.value = if (query.isBlank()) {
            allPresets
        } else {
            allPresets.filter { preset ->
                preset.name.contains(query, ignoreCase = true) ||
                preset.description.contains(query, ignoreCase = true) ||
                preset.author.contains(query, ignoreCase = true) ||
                preset.tags.any { it.contains(query, ignoreCase = true) }
            }
        }
    }
    
    fun importPreset(jsonString: String) {
        viewModelScope.launch {
            presetManager.importPreset(jsonString)?.let { preset ->
                customPresets.add(preset)
                loadPresets()
            }
        }
    }
    
    fun exportPreset(preset: VisualizerPreset) {
        viewModelScope.launch {
            val json = presetManager.exportPreset(preset)
            
            // Implemented: Share via Android share sheet
            try {
                val shareIntent = android.content.Intent(android.content.Intent.ACTION_SEND).apply {
                    type = "application/json"
                    putExtra(android.content.Intent.EXTRA_TEXT, json)
                    putExtra(android.content.Intent.EXTRA_TITLE, "Share ${preset.name}")
                    addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK)
                }
                
                val chooserIntent = android.content.Intent.createChooser(shareIntent, "Share Visualizer Preset")
                chooserIntent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(chooserIntent)
            } catch (e: Exception) {
                // Fallback: Copy to clipboard
                val clipboard = context.getSystemService(android.content.Context.CLIPBOARD_SERVICE) as android.content.ClipboardManager
                val clip = android.content.ClipData.newPlainText("Visualizer Preset", json)
                clipboard.setPrimaryClip(clip)
                android.util.Log.i("PresetBrowserViewModel", "Preset copied to clipboard as fallback")
            }
        }
    }
}
