package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.selection.selectable
import androidx.compose.foundation.verticalScroll
import androidx.compose.foundation.BorderStroke
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.Cloud
import androidx.compose.material.icons.filled.Delete
import androidx.compose.material.icons.filled.Download
import androidx.compose.material.icons.filled.Folder
import androidx.compose.material.icons.filled.History
import androidx.compose.material.icons.filled.LibraryBooks
import androidx.compose.material.icons.filled.SaveAlt
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.SdStorage
import androidx.compose.material.icons.filled.Storage
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.APIKey
import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.preferences.AISettingsPreferencesStore
import com.universalmedialibrary.services.ai.AIContentCacheService
import com.universalmedialibrary.services.ai.AILogStorageService
import com.universalmedialibrary.services.ai.CacheStats
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class AISettingsViewModel @Inject constructor(
    private val aiSettings: AISettingsPreferencesStore,
    private val apiKeyDao: APIKeyDao,
    private val aiLogStorageService: AILogStorageService,
    private val aiContentCacheService: AIContentCacheService
) : ViewModel() {

    private val _selectedProvider = MutableStateFlow("GEMINI")
    val selectedProvider: StateFlow<String> = _selectedProvider.asStateFlow()

    private val _apiKeys = MutableStateFlow<Map<String, String>>(emptyMap())
    val apiKeys: StateFlow<Map<String, String>> = _apiKeys.asStateFlow()
    
    // Log settings
    private val _logEnabled = MutableStateFlow(true)
    val logEnabled: StateFlow<Boolean> = _logEnabled.asStateFlow()
    
    private val _logStorageLocation = MutableStateFlow("internal")
    val logStorageLocation: StateFlow<String> = _logStorageLocation.asStateFlow()
    
    private val _logRetentionDays = MutableStateFlow(30)
    val logRetentionDays: StateFlow<Int> = _logRetentionDays.asStateFlow()
    
    private val _logStorageSize = MutableStateFlow(0L)
    val logStorageSize: StateFlow<Long> = _logStorageSize.asStateFlow()
    
    // Tools settings
    private val _toolsEnabled = MutableStateFlow(true)
    val toolsEnabled: StateFlow<Boolean> = _toolsEnabled.asStateFlow()
    
    private val _webSearchEnabled = MutableStateFlow(true)
    val webSearchEnabled: StateFlow<Boolean> = _webSearchEnabled.asStateFlow()
    
    private val _libraryBrowseEnabled = MutableStateFlow(true)
    val libraryBrowseEnabled: StateFlow<Boolean> = _libraryBrowseEnabled.asStateFlow()
    
    private val _downloadEnabled = MutableStateFlow(true)
    val downloadEnabled: StateFlow<Boolean> = _downloadEnabled.asStateFlow()
    
    private val _autoExecuteTools = MutableStateFlow(false)
    val autoExecuteTools: StateFlow<Boolean> = _autoExecuteTools.asStateFlow()
    
    // Cache settings
    private val _cacheEnabled = MutableStateFlow(true)
    val cacheEnabled: StateFlow<Boolean> = _cacheEnabled.asStateFlow()
    
    private val _cacheSizeMb = MutableStateFlow(500L)
    val cacheSizeMb: StateFlow<Long> = _cacheSizeMb.asStateFlow()
    
    private val _cacheLocation = MutableStateFlow("internal")
    val cacheLocation: StateFlow<String> = _cacheLocation.asStateFlow()
    
    private val _cacheStats = MutableStateFlow<CacheStats?>(null)
    val cacheStats: StateFlow<CacheStats?> = _cacheStats.asStateFlow()
    
    // Library access settings
    private val _libraryAccessEnabled = MutableStateFlow(true)
    val libraryAccessEnabled: StateFlow<Boolean> = _libraryAccessEnabled.asStateFlow()
    
    private val _booksAccessEnabled = MutableStateFlow(true)
    val booksAccessEnabled: StateFlow<Boolean> = _booksAccessEnabled.asStateFlow()
    
    private val _moviesAccessEnabled = MutableStateFlow(true)
    val moviesAccessEnabled: StateFlow<Boolean> = _moviesAccessEnabled.asStateFlow()
    
    private val _musicAccessEnabled = MutableStateFlow(true)
    val musicAccessEnabled: StateFlow<Boolean> = _musicAccessEnabled.asStateFlow()
    
    private val _comicsAccessEnabled = MutableStateFlow(true)
    val comicsAccessEnabled: StateFlow<Boolean> = _comicsAccessEnabled.asStateFlow()
    
    private val _sdCardAvailable = MutableStateFlow(false)
    val sdCardAvailable: StateFlow<Boolean> = _sdCardAvailable.asStateFlow()

    init {
        viewModelScope.launch {
            aiSettings.selectedProvider.collectLatest { _selectedProvider.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiLogEnabled.collectLatest { _logEnabled.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiLogStorageLocation.collectLatest { _logStorageLocation.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiLogRetentionDays.collectLatest { _logRetentionDays.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiToolsEnabled.collectLatest { _toolsEnabled.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiToolsWebSearchEnabled.collectLatest { _webSearchEnabled.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiToolsBrowseLibraryEnabled.collectLatest { _libraryBrowseEnabled.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiToolsDownloadEnabled.collectLatest { _downloadEnabled.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiToolsAutoExecute.collectLatest { _autoExecuteTools.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiContentCacheEnabled.collectLatest { _cacheEnabled.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiContentCacheSizeMb.collectLatest { _cacheSizeMb.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiContentCacheLocation.collectLatest { _cacheLocation.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiLibraryAccessEnabled.collectLatest { _libraryAccessEnabled.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiLibraryAccessBooks.collectLatest { _booksAccessEnabled.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiLibraryAccessMovies.collectLatest { _moviesAccessEnabled.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiLibraryAccessMusic.collectLatest { _musicAccessEnabled.value = it }
        }
        viewModelScope.launch {
            aiSettings.aiLibraryAccessComics.collectLatest { _comicsAccessEnabled.value = it }
        }
        refreshKeys()
        refreshStats()
        checkSdCard()
    }
    
    private fun checkSdCard() {
        _sdCardAvailable.value = aiLogStorageService.isSdCardAvailable()
    }

    private fun refreshKeys() {
        viewModelScope.launch {
            val geminiKey = apiKeyDao.getAPIKeyByProvider("gemini")?.keyValue ?: ""
            val openaiKey = apiKeyDao.getAPIKeyByProvider("openai")?.keyValue ?: ""
            _apiKeys.value = mapOf(
                "gemini" to geminiKey,
                "openai" to openaiKey
            )
        }
    }
    
    private fun refreshStats() {
        viewModelScope.launch {
            _logStorageSize.value = aiLogStorageService.getLogStorageSize()
            _cacheStats.value = aiContentCacheService.getCacheStats()
        }
    }

    fun setProvider(providerId: String) {
        viewModelScope.launch {
            aiSettings.setSelectedProvider(providerId)
        }
    }

    fun saveKey(provider: String, key: String) {
        viewModelScope.launch {
            val entity = APIKey(
                provider = provider,
                keyValue = key,
                displayName = provider.uppercase(),
                category = "AI"
            )
            apiKeyDao.insertAPIKey(entity)
            refreshKeys()
        }
    }
    
    // Log settings
    fun setLogEnabled(enabled: Boolean) {
        viewModelScope.launch { aiSettings.setAiLogEnabled(enabled) }
    }
    
    fun setLogStorageLocation(location: String) {
        viewModelScope.launch { aiSettings.setAiLogStorageLocation(location) }
    }
    
    fun setLogRetentionDays(days: Int) {
        viewModelScope.launch { aiSettings.setAiLogRetentionDays(days) }
    }
    
    fun clearLogs() {
        viewModelScope.launch {
            aiLogStorageService.clearAllLogs()
            refreshStats()
        }
    }
    
    // Tools settings
    fun setToolsEnabled(enabled: Boolean) {
        viewModelScope.launch { aiSettings.setAiToolsEnabled(enabled) }
    }
    
    fun setWebSearchEnabled(enabled: Boolean) {
        viewModelScope.launch { aiSettings.setAiToolsWebSearchEnabled(enabled) }
    }
    
    fun setLibraryBrowseEnabled(enabled: Boolean) {
        viewModelScope.launch { aiSettings.setAiToolsBrowseLibraryEnabled(enabled) }
    }
    
    fun setDownloadEnabled(enabled: Boolean) {
        viewModelScope.launch { aiSettings.setAiToolsDownloadEnabled(enabled) }
    }
    
    fun setAutoExecuteTools(enabled: Boolean) {
        viewModelScope.launch { aiSettings.setAiToolsAutoExecute(enabled) }
    }
    
    // Cache settings
    fun setCacheEnabled(enabled: Boolean) {
        viewModelScope.launch { aiSettings.setAiContentCacheEnabled(enabled) }
    }
    
    fun setCacheSizeMb(sizeMb: Long) {
        viewModelScope.launch { aiSettings.setAiContentCacheSizeMb(sizeMb) }
    }
    
    fun setCacheLocation(location: String) {
        viewModelScope.launch { aiSettings.setAiContentCacheLocation(location) }
    }
    
    fun clearCache() {
        viewModelScope.launch {
            aiContentCacheService.clearCache()
            refreshStats()
        }
    }
    
    // Library access settings
    fun setLibraryAccessEnabled(enabled: Boolean) {
        viewModelScope.launch { aiSettings.setAiLibraryAccessEnabled(enabled) }
    }
    
    fun setBooksAccessEnabled(enabled: Boolean) {
        viewModelScope.launch { aiSettings.setAiLibraryAccessBooks(enabled) }
    }
    
    fun setMoviesAccessEnabled(enabled: Boolean) {
        viewModelScope.launch { aiSettings.setAiLibraryAccessMovies(enabled) }
    }
    
    fun setMusicAccessEnabled(enabled: Boolean) {
        viewModelScope.launch { aiSettings.setAiLibraryAccessMusic(enabled) }
    }
    
    fun setComicsAccessEnabled(enabled: Boolean) {
        viewModelScope.launch { aiSettings.setAiLibraryAccessComics(enabled) }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AISettingsScreen(
    onNavigateBack: () -> Unit,
    viewModel: AISettingsViewModel = hiltViewModel()
) {
    val selectedProvider by viewModel.selectedProvider.collectAsState()
    val apiKeys by viewModel.apiKeys.collectAsState()
    
    // Log settings
    val logEnabled by viewModel.logEnabled.collectAsState()
    val logStorageLocation by viewModel.logStorageLocation.collectAsState()
    val logRetentionDays by viewModel.logRetentionDays.collectAsState()
    val logStorageSize by viewModel.logStorageSize.collectAsState()
    
    // Tools settings
    val toolsEnabled by viewModel.toolsEnabled.collectAsState()
    val webSearchEnabled by viewModel.webSearchEnabled.collectAsState()
    val libraryBrowseEnabled by viewModel.libraryBrowseEnabled.collectAsState()
    val downloadEnabled by viewModel.downloadEnabled.collectAsState()
    val autoExecuteTools by viewModel.autoExecuteTools.collectAsState()
    
    // Cache settings
    val cacheEnabled by viewModel.cacheEnabled.collectAsState()
    val cacheSizeMb by viewModel.cacheSizeMb.collectAsState()
    val cacheLocation by viewModel.cacheLocation.collectAsState()
    val cacheStats by viewModel.cacheStats.collectAsState()
    
    // Library access
    val libraryAccessEnabled by viewModel.libraryAccessEnabled.collectAsState()
    val booksAccessEnabled by viewModel.booksAccessEnabled.collectAsState()
    val moviesAccessEnabled by viewModel.moviesAccessEnabled.collectAsState()
    val musicAccessEnabled by viewModel.musicAccessEnabled.collectAsState()
    val comicsAccessEnabled by viewModel.comicsAccessEnabled.collectAsState()
    
    val sdCardAvailable by viewModel.sdCardAvailable.collectAsState()
    
    var showClearLogsDialog by remember { mutableStateOf(false) }
    var showClearCacheDialog by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("AI Settings") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .verticalScroll(rememberScrollState())
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(24.dp)
        ) {
            // ==================== AI Provider Section ====================
            SettingsSection(
                title = "AI Provider",
                icon = Icons.Default.Cloud
            ) {
                ProviderOption(
                    id = "GEMINI",
                    name = "Google Gemini",
                    description = "Fast and efficient. Good for summaries.",
                    isSelected = selectedProvider == "GEMINI",
                    currentKey = apiKeys["gemini"] ?: "",
                    onSelect = { viewModel.setProvider("GEMINI") },
                    onKeySave = { viewModel.saveKey("gemini", it) }
                )

                Spacer(modifier = Modifier.height(12.dp))

                ProviderOption(
                    id = "OPENAI",
                    name = "OpenAI GPT",
                    description = "High quality reasoning. Good for analysis.",
                    isSelected = selectedProvider == "OPENAI",
                    currentKey = apiKeys["openai"] ?: "",
                    onSelect = { viewModel.setProvider("OPENAI") },
                    onKeySave = { viewModel.saveKey("openai", it) }
                )
            }
            
            HorizontalDivider()
            
            // ==================== AI Logs Section ====================
            SettingsSection(
                title = "AI Conversation Logs",
                icon = Icons.Default.History
            ) {
                SettingsSwitch(
                    title = "Save Conversation Logs",
                    description = "Automatically save AI chat conversations",
                    checked = logEnabled,
                    onCheckedChange = { viewModel.setLogEnabled(it) }
                )
                
                if (logEnabled) {
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    StorageLocationSelector(
                        label = "Log Storage Location",
                        currentLocation = logStorageLocation,
                        sdCardAvailable = sdCardAvailable,
                        onLocationSelected = { viewModel.setLogStorageLocation(it) }
                    )
                    
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    RetentionDaysSelector(
                        currentDays = logRetentionDays,
                        onDaysSelected = { viewModel.setLogRetentionDays(it) }
                    )
                    
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column {
                            Text("Storage Used", style = MaterialTheme.typography.bodyMedium)
                            Text(
                                formatFileSize(logStorageSize),
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                        OutlinedButton(
                            onClick = { showClearLogsDialog = true }
                        ) {
                            Icon(Icons.Default.Delete, contentDescription = "Delete", modifier = Modifier.size(18.dp))
                            Spacer(modifier = Modifier.width(4.dp))
                            Text("Clear Logs")
                        }
                    }
                }
            }
            
            HorizontalDivider()
            
            // ==================== AI Tools Section ====================
            SettingsSection(
                title = "AI Tools",
                icon = Icons.Default.Search
            ) {
                SettingsSwitch(
                    title = "Enable AI Tools",
                    description = "Allow AI to use tools like search, browse, and download",
                    checked = toolsEnabled,
                    onCheckedChange = { viewModel.setToolsEnabled(it) }
                )
                
                if (toolsEnabled) {
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    SettingsSwitch(
                        title = "Web Search",
                        description = "Allow AI to search the web for information",
                        checked = webSearchEnabled,
                        onCheckedChange = { viewModel.setWebSearchEnabled(it) }
                    )
                    
                    SettingsSwitch(
                        title = "Browse Library",
                        description = "Allow AI to browse your media library",
                        checked = libraryBrowseEnabled,
                        onCheckedChange = { viewModel.setLibraryBrowseEnabled(it) }
                    )
                    
                    SettingsSwitch(
                        title = "Download Content",
                        description = "Allow AI to download PDFs and articles",
                        checked = downloadEnabled,
                        onCheckedChange = { viewModel.setDownloadEnabled(it) }
                    )
                    
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    SettingsSwitch(
                        title = "Auto-Execute Tools",
                        description = "Automatically execute tools when AI requests them",
                        checked = autoExecuteTools,
                        onCheckedChange = { viewModel.setAutoExecuteTools(it) }
                    )
                }
            }
            
            HorizontalDivider()
            
            // ==================== Content Cache Section ====================
            SettingsSection(
                title = "AI Content Cache",
                icon = Icons.Default.Download
            ) {
                SettingsSwitch(
                    title = "Enable Content Cache",
                    description = "Cache downloaded PDFs and articles for AI access",
                    checked = cacheEnabled,
                    onCheckedChange = { viewModel.setCacheEnabled(it) }
                )
                
                if (cacheEnabled) {
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    CacheSizeSelector(
                        currentSizeMb = cacheSizeMb,
                        onSizeSelected = { viewModel.setCacheSizeMb(it) }
                    )
                    
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    StorageLocationSelector(
                        label = "Cache Location",
                        currentLocation = cacheLocation,
                        sdCardAvailable = sdCardAvailable,
                        onLocationSelected = { viewModel.setCacheLocation(it) }
                    )
                    
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    cacheStats?.let { stats ->
                        Card(
                            colors = CardDefaults.cardColors(
                                containerColor = MaterialTheme.colorScheme.surfaceVariant
                            )
                        ) {
                            Column(
                                modifier = Modifier.padding(12.dp)
                            ) {
                                Text("Cache Statistics", style = MaterialTheme.typography.labelMedium)
                                Spacer(modifier = Modifier.height(8.dp))
                                Row(
                                    modifier = Modifier.fillMaxWidth(),
                                    horizontalArrangement = Arrangement.SpaceBetween
                                ) {
                                    Text("Items: ${stats.totalItems}")
                                    Text("PDFs: ${stats.pdfCount}")
                                    Text("Articles: ${stats.articleCount}")
                                }
                                Spacer(modifier = Modifier.height(4.dp))
                                LinearProgressIndicator(
                                    progress = { stats.usagePercent / 100f },
                                    modifier = Modifier.fillMaxWidth(),
                                )
                                Text(
                                    "${stats.currentSizeMb} MB / ${stats.maxSizeMb} MB (${stats.usagePercent}%)",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }
                    }
                    
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    OutlinedButton(
                        onClick = { showClearCacheDialog = true },
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Icon(Icons.Default.Delete, contentDescription = "Delete", modifier = Modifier.size(18.dp))
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Clear Cache")
                    }
                }
            }
            
            HorizontalDivider()
            
            // ==================== Library Access Section ====================
            SettingsSection(
                title = "AI Library Access",
                icon = Icons.Default.LibraryBooks
            ) {
                SettingsSwitch(
                    title = "Allow Library Browsing",
                    description = "Let AI browse and recommend from your library",
                    checked = libraryAccessEnabled,
                    onCheckedChange = { viewModel.setLibraryAccessEnabled(it) }
                )
                
                if (libraryAccessEnabled) {
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    Text(
                        "Media Types AI Can Access:",
                        style = MaterialTheme.typography.labelMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    SettingsSwitch(
                        title = "Books",
                        description = "eBooks, PDFs, documents",
                        checked = booksAccessEnabled,
                        onCheckedChange = { viewModel.setBooksAccessEnabled(it) }
                    )
                    
                    SettingsSwitch(
                        title = "Movies & Videos",
                        description = "Movies, TV shows, video files",
                        checked = moviesAccessEnabled,
                        onCheckedChange = { viewModel.setMoviesAccessEnabled(it) }
                    )
                    
                    SettingsSwitch(
                        title = "Music",
                        description = "Songs, albums, audio files",
                        checked = musicAccessEnabled,
                        onCheckedChange = { viewModel.setMusicAccessEnabled(it) }
                    )
                    
                    SettingsSwitch(
                        title = "Comics",
                        description = "Comic books, manga, graphic novels",
                        checked = comicsAccessEnabled,
                        onCheckedChange = { viewModel.setComicsAccessEnabled(it) }
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(32.dp))
        }
    }
    
    // Clear Logs Confirmation Dialog
    if (showClearLogsDialog) {
        AlertDialog(
            onDismissRequest = { showClearLogsDialog = false },
            title = { Text("Clear AI Logs?") },
            text = { Text("This will permanently delete all saved AI conversation logs. This action cannot be undone.") },
            confirmButton = {
                TextButton(
                    onClick = {
                        viewModel.clearLogs()
                        showClearLogsDialog = false
                    }
                ) {
                    Text("Clear", color = MaterialTheme.colorScheme.error)
                }
            },
            dismissButton = {
                TextButton(onClick = { showClearLogsDialog = false }) {
                    Text("Cancel")
                }
            }
        )
    }
    
    // Clear Cache Confirmation Dialog
    if (showClearCacheDialog) {
        AlertDialog(
            onDismissRequest = { showClearCacheDialog = false },
            title = { Text("Clear AI Cache?") },
            text = { Text("This will permanently delete all cached PDFs, articles, and downloaded content. This action cannot be undone.") },
            confirmButton = {
                TextButton(
                    onClick = {
                        viewModel.clearCache()
                        showClearCacheDialog = false
                    }
                ) {
                    Text("Clear", color = MaterialTheme.colorScheme.error)
                }
            },
            dismissButton = {
                TextButton(onClick = { showClearCacheDialog = false }) {
                    Text("Cancel")
                }
            }
        )
    }
}

@Composable
private fun SettingsSection(
    title: String,
    icon: ImageVector,
    content: @Composable ColumnScope.() -> Unit
) {
    Column {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier.padding(bottom = 12.dp)
        ) {
            Icon(
                icon,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.primary,
                modifier = Modifier.size(24.dp)
            )
            Spacer(modifier = Modifier.width(8.dp))
            Text(
                title,
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.primary
            )
        }
        content()
    }
}

@Composable
private fun SettingsSwitch(
    title: String,
    description: String,
    checked: Boolean,
    onCheckedChange: (Boolean) -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Column(modifier = Modifier.weight(1f)) {
            Text(title, style = MaterialTheme.typography.bodyMedium)
            Text(
                description,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
        Switch(
            checked = checked,
            onCheckedChange = onCheckedChange
        )
    }
}

@Composable
private fun StorageLocationSelector(
    label: String,
    currentLocation: String,
    sdCardAvailable: Boolean,
    onLocationSelected: (String) -> Unit
) {
    var expanded by remember { mutableStateOf(false) }
    
    Column {
        Text(label, style = MaterialTheme.typography.bodyMedium)
        Spacer(modifier = Modifier.height(4.dp))
        
        ExposedDropdownMenuBox(
            expanded = expanded,
            onExpandedChange = { expanded = it }
        ) {
            OutlinedTextField(
                value = when (currentLocation) {
                    "internal" -> "Internal Storage"
                    "external" -> "External Storage"
                    "sd_card" -> "SD Card"
                    else -> "Internal Storage"
                },
                onValueChange = {},
                readOnly = true,
                trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded = expanded) },
                modifier = Modifier
                    .fillMaxWidth()
                    .menuAnchor(),
                leadingIcon = {
                    Icon(
                        when (currentLocation) {
                            "sd_card" -> Icons.Default.SdStorage
                            "external" -> Icons.Default.Folder
                            else -> Icons.Default.Storage
                        },
                        contentDescription = null
                    )
                }
            )
            
            ExposedDropdownMenu(
                expanded = expanded,
                onDismissRequest = { expanded = false }
            ) {
                DropdownMenuItem(
                    text = { Text("Internal Storage") },
                    onClick = {
                        onLocationSelected("internal")
                        expanded = false
                    },
                    leadingIcon = { Icon(Icons.Default.Storage, contentDescription = "Storage") }
                )
                DropdownMenuItem(
                    text = { Text("External Storage") },
                    onClick = {
                        onLocationSelected("external")
                        expanded = false
                    },
                    leadingIcon = { Icon(Icons.Default.Folder, contentDescription = null) }
                )
                if (sdCardAvailable) {
                    DropdownMenuItem(
                        text = { Text("SD Card") },
                        onClick = {
                            onLocationSelected("sd_card")
                            expanded = false
                        },
                        leadingIcon = { Icon(Icons.Default.SdStorage, contentDescription = null) }
                    )
                }
            }
        }
    }
}

@Composable
private fun RetentionDaysSelector(
    currentDays: Int,
    onDaysSelected: (Int) -> Unit
) {
    var expanded by remember { mutableStateOf(false) }
    val options = listOf(7, 14, 30, 60, 90, 365)
    
    Column {
        Text("Log Retention", style = MaterialTheme.typography.bodyMedium)
        Spacer(modifier = Modifier.height(4.dp))
        
        ExposedDropdownMenuBox(
            expanded = expanded,
            onExpandedChange = { expanded = it }
        ) {
            OutlinedTextField(
                value = if (currentDays >= 365) "1 year" else "$currentDays days",
                onValueChange = {},
                readOnly = true,
                trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded = expanded) },
                modifier = Modifier
                    .fillMaxWidth()
                    .menuAnchor()
            )
            
            ExposedDropdownMenu(
                expanded = expanded,
                onDismissRequest = { expanded = false }
            ) {
                options.forEach { days ->
                    DropdownMenuItem(
                        text = { Text(if (days >= 365) "1 year" else "$days days") },
                        onClick = {
                            onDaysSelected(days)
                            expanded = false
                        }
                    )
                }
            }
        }
    }
}

@Composable
private fun CacheSizeSelector(
    currentSizeMb: Long,
    onSizeSelected: (Long) -> Unit
) {
    var sliderValue by remember(currentSizeMb) { mutableStateOf(currentSizeMb.toFloat()) }
    
    Column {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text("Maximum Cache Size", style = MaterialTheme.typography.bodyMedium)
            Text(
                "${sliderValue.toLong()} MB",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.primary
            )
        }
        
        Slider(
            value = sliderValue,
            onValueChange = { sliderValue = it },
            onValueChangeFinished = { onSizeSelected(sliderValue.toLong()) },
            valueRange = 50f..5000f,
            steps = 49,
            modifier = Modifier.fillMaxWidth()
        )
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text("50 MB", style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
            Text("5 GB", style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
        }
    }
}

private fun formatFileSize(bytes: Long): String {
    return when {
        bytes < 1024 -> "$bytes B"
        bytes < 1024 * 1024 -> "${bytes / 1024} KB"
        bytes < 1024 * 1024 * 1024 -> "${bytes / (1024 * 1024)} MB"
        else -> "%.2f GB".format(bytes / (1024.0 * 1024 * 1024))
    }
}

@Composable
private fun ProviderOption(
    id: String,
    name: String,
    description: String,
    isSelected: Boolean,
    currentKey: String,
    onSelect: () -> Unit,
    onKeySave: (String) -> Unit
) {
    var editingKey by remember { mutableStateOf(false) }
    var keyInput by remember(currentKey) { mutableStateOf(currentKey) }

    Card(
        colors = CardDefaults.cardColors(
            containerColor = if (isSelected) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surface
        ),
        border = if (isSelected) BorderStroke(2.dp, MaterialTheme.colorScheme.primary) else null,
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier
                    .fillMaxWidth()
                    .selectable(selected = isSelected, onClick = onSelect)
            ) {
                RadioButton(
                    selected = isSelected,
                    onClick = onSelect
                )
                Column(modifier = Modifier.padding(start = 8.dp)) {
                    Text(text = name, style = MaterialTheme.typography.titleMedium)
                    Text(text = description, style = MaterialTheme.typography.bodySmall)
                }
            }

            Spacer(modifier = Modifier.height(12.dp))

            if (editingKey) {
                OutlinedTextField(
                    value = keyInput,
                    onValueChange = { keyInput = it },
                    label = { Text("API Key") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.End) {
                    TextButton(onClick = { editingKey = false; keyInput = currentKey }) {
                        Text("Cancel")
                    }
                    TextButton(onClick = { onKeySave(keyInput); editingKey = false }) {
                        Text("Save")
                    }
                }
            } else {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = if (currentKey.isNotBlank()) "••••••••${currentKey.takeLast(4)}" else "No API Key Set",
                        style = MaterialTheme.typography.bodyMedium,
                        color = if (currentKey.isNotBlank()) MaterialTheme.colorScheme.onSurface else MaterialTheme.colorScheme.error
                    )
                    TextButton(onClick = { editingKey = true }) {
                        Text("Edit Key")
                    }
                }
            }
        }
    }
}
