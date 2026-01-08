package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.services.music.LastFmScrobblerService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Last.fm Settings Screen
 * 
 * Provides UI for:
 * - Last.fm authentication
 * - Enable/disable scrobbling
 * - "Now Playing" notifications toggle
 * - Session status display
 * - Manual scrobble trigger
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LastFmSettingsScreen(
    onNavigateBack: () -> Unit,
    viewModel: LastFmSettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    var showApiKeyDialog by remember { mutableStateOf(false) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Last.fm Settings") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .verticalScroll(rememberScrollState())
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Info Card
            ElevatedCard(
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Icon(
                            Icons.Filled.Info,
                            contentDescription = "Media image",
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Text(
                            "About Last.fm Scrobbling",
                            style = MaterialTheme.typography.titleMedium
                        )
                    }
                    Text(
                        "Last.fm tracks your listening history and provides music recommendations. " +
                        "Tracks are automatically 'scrobbled' when you've listened to 50% or 4 minutes.",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
            
            // Authentication Status Card
            ElevatedCard(
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Text(
                        "Authentication Status",
                        style = MaterialTheme.typography.titleMedium
                    )
                    
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Icon(
                            if (uiState.isAuthenticated) Icons.Filled.CheckCircle else Icons.Filled.Warning,
                            contentDescription = "Media image",
                            tint = if (uiState.isAuthenticated) 
                                MaterialTheme.colorScheme.primary 
                            else 
                                MaterialTheme.colorScheme.error
                        )
                        Text(
                            if (uiState.isAuthenticated) 
                                "Authenticated" 
                            else 
                                "Not Authenticated",
                            style = MaterialTheme.typography.bodyLarge
                        )
                    }
                    
                    uiState.sessionKey?.let { key ->
                        Text(
                            "Session Key: ${key.take(16)}...",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                    
                    Button(
                        onClick = { showApiKeyDialog = true },
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Icon(Icons.Filled.Settings, contentDescription = "Settings")
                        Spacer(Modifier.width(8.dp))
                        Text("Configure API Keys")
                    }
                }
            }
            
            // Scrobbling Settings Card
            ElevatedCard(
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Text(
                        "Scrobbling Options",
                        style = MaterialTheme.typography.titleMedium
                    )
                    
                    // Enable Scrobbling
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column(modifier = Modifier.weight(1f)) {
                            Text(
                                "Enable Scrobbling",
                                style = MaterialTheme.typography.bodyLarge
                            )
                            Text(
                                "Automatically track listening history",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                        Switch(
                            checked = uiState.scrobblingEnabled,
                            onCheckedChange = { viewModel.setScrobblingEnabled(it) },
                            enabled = uiState.isAuthenticated
                        )
                    }
                    
                    HorizontalDivider()
                    
                    // Now Playing Updates
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column(modifier = Modifier.weight(1f)) {
                            Text(
                                "Now Playing Updates",
                                style = MaterialTheme.typography.bodyLarge
                            )
                            Text(
                                "Send real-time 'Now Playing' notifications",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                        Switch(
                            checked = uiState.nowPlayingEnabled,
                            onCheckedChange = { viewModel.setNowPlayingEnabled(it) },
                            enabled = uiState.isAuthenticated
                        )
                    }
                }
            }
            
            // Statistics Card
            if (uiState.isAuthenticated) {
                ElevatedCard(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        verticalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        Text(
                            "Session Statistics",
                            style = MaterialTheme.typography.titleMedium
                        )
                        
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Column {
                                Text(
                                    "Scrobbled",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                                Text(
                                    "${uiState.scrobbledCount} tracks",
                                    style = MaterialTheme.typography.titleMedium
                                )
                            }
                            Column {
                                Text(
                                    "Queue",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                                Text(
                                    "${uiState.queuedCount} pending",
                                    style = MaterialTheme.typography.titleMedium
                                )
                            }
                        }
                        
                        if (uiState.queuedCount > 0) {
                            OutlinedButton(
                                onClick = { viewModel.retryQueuedScrobbles() },
                                modifier = Modifier.fillMaxWidth()
                            ) {
                                Icon(Icons.Filled.Refresh, contentDescription = "Refresh")
                                Spacer(Modifier.width(8.dp))
                                Text("Retry Queued Scrobbles")
                            }
                        }
                    }
                }
            }
            
            // API Keys Dialog
            if (showApiKeyDialog) {
                LastFmApiKeyDialog(
                    apiKey = uiState.apiKey,
                    apiSecret = uiState.apiSecret,
                    sessionKey = uiState.sessionKey,
                    onDismiss = { showApiKeyDialog = false },
                    onSave = { key, secret, session ->
                        viewModel.saveApiKeys(key, secret, session)
                        showApiKeyDialog = false
                    }
                )
            }
        }
    }
}

@Composable
fun LastFmApiKeyDialog(
    apiKey: String,
    apiSecret: String,
    sessionKey: String?,
    onDismiss: () -> Unit,
    onSave: (String, String, String?) -> Unit
) {
    var keyText by remember { mutableStateOf(apiKey) }
    var secretText by remember { mutableStateOf(apiSecret) }
    var sessionText by remember { mutableStateOf(sessionKey ?: "") }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Last.fm API Configuration") },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                Text(
                    "Get your API keys from: https://www.last.fm/api/account/create",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                
                OutlinedTextField(
                    value = keyText,
                    onValueChange = { keyText = it },
                    label = { Text("API Key") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
                
                OutlinedTextField(
                    value = secretText,
                    onValueChange = { secretText = it },
                    label = { Text("API Secret") },
                    visualTransformation = PasswordVisualTransformation(),
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
                
                OutlinedTextField(
                    value = sessionText,
                    onValueChange = { sessionText = it },
                    label = { Text("Session Key (optional)") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    onSave(
                        keyText.trim(),
                        secretText.trim(),
                        sessionText.trim().takeIf { it.isNotEmpty() }
                    )
                },
                enabled = keyText.isNotBlank() && secretText.isNotBlank()
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

data class LastFmUiState(
    val isAuthenticated: Boolean = false,
    val scrobblingEnabled: Boolean = false,
    val nowPlayingEnabled: Boolean = true,
    val apiKey: String = "",
    val apiSecret: String = "",
    val sessionKey: String? = null,
    val scrobbledCount: Int = 0,
    val queuedCount: Int = 0
)

@HiltViewModel
class LastFmSettingsViewModel @Inject constructor(
    private val apiKeyRepository: APIKeyRepository,
    private val lastFmService: LastFmScrobblerService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(LastFmUiState())
    val uiState: StateFlow<LastFmUiState> = _uiState.asStateFlow()
    
    init {
        loadSettings()
    }
    
    private fun loadSettings() {
        viewModelScope.launch {
            val apiKey = apiKeyRepository.getLastFmApiKey() ?: ""
            val apiSecret = apiKeyRepository.getLastFmSecret() ?: ""
            val sessionKey = apiKeyRepository.getLastFmSessionKey()
            
            _uiState.value = _uiState.value.copy(
                apiKey = apiKey,
                apiSecret = apiSecret,
                sessionKey = sessionKey,
                isAuthenticated = apiKey.isNotEmpty() && sessionKey != null,
                scrobblingEnabled = lastFmService.isScrobblingEnabled(),
                nowPlayingEnabled = lastFmService.isNowPlayingEnabled()
            )
        }
    }
    
    fun setScrobblingEnabled(enabled: Boolean) {
        lastFmService.setScrobblingEnabled(enabled)
        _uiState.value = _uiState.value.copy(scrobblingEnabled = enabled)
    }
    
    fun setNowPlayingEnabled(enabled: Boolean) {
        lastFmService.setNowPlayingEnabled(enabled)
        _uiState.value = _uiState.value.copy(nowPlayingEnabled = enabled)
    }
    
    fun saveApiKeys(apiKey: String, apiSecret: String, sessionKey: String?) {
        viewModelScope.launch {
            if (apiKey.isNotEmpty()) {
                apiKeyRepository.saveLastFmApiKey(apiKey)
            }
            if (apiSecret.isNotEmpty()) {
                apiKeyRepository.saveLastFmSecret(apiSecret)
            }
            if (sessionKey != null) {
                apiKeyRepository.saveLastFmSessionKey(sessionKey)
            }
            loadSettings()
        }
    }
    
    fun retryQueuedScrobbles() {
        viewModelScope.launch {
            // Trigger retry of queued scrobbles
            lastFmService.retryFailedScrobbles()
            // Refresh stats after retry
            loadSettings()
        }
    }
}
