package com.universalmedialibrary.ui.settings

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
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.tts.TtsProvider
import com.universalmedialibrary.services.tts.TtsProviderManager
import com.universalmedialibrary.services.tts.TtsProviderSettings
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class TtsProviderSettingsViewModel @Inject constructor(
    private val ttsProviderManager: TtsProviderManager
) : ViewModel() {

    private val _providerSettings = MutableStateFlow(TtsProviderSettings())
    val providerSettings: StateFlow<TtsProviderSettings> = _providerSettings.asStateFlow()

    private val _isConfigured = MutableStateFlow<Map<TtsProvider, Boolean>>(emptyMap())
    val isConfigured: StateFlow<Map<TtsProvider, Boolean>> = _isConfigured.asStateFlow()

    init {
        observeSettings()
        checkProviderConfiguration()
    }

    private fun observeSettings() {
        viewModelScope.launch {
            ttsProviderManager.providerSettings.collect { settings ->
                _providerSettings.value = settings
            }
        }
    }

    private fun checkProviderConfiguration() {
        viewModelScope.launch {
            val configMap = mutableMapOf<TtsProvider, Boolean>()
            TtsProvider.values().forEach { provider ->
                configMap[provider] = ttsProviderManager.isProviderConfigured(provider)
            }
            _isConfigured.value = configMap
        }
    }

    fun selectProvider(provider: TtsProvider) {
        viewModelScope.launch {
            ttsProviderManager.setProvider(provider)
            // Settings update automatically via Flow observer
        }
    }

    fun setApiKey(provider: TtsProvider, apiKey: String) {
        viewModelScope.launch {
            ttsProviderManager.setApiKey(provider, apiKey)
            checkProviderConfiguration()
        }
    }

    fun setModel(provider: TtsProvider, model: String) {
        viewModelScope.launch {
            ttsProviderManager.setModel(provider, model)
        }
    }

    fun setVoiceId(provider: TtsProvider, voiceId: String) {
        viewModelScope.launch {
            ttsProviderManager.setVoiceId(provider, voiceId)
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TtsProviderSettingsScreen(
    onBack: () -> Unit,
    viewModel: TtsProviderSettingsViewModel = hiltViewModel()
) {
    val providerSettings by viewModel.providerSettings.collectAsState()
    val isConfigured by viewModel.isConfigured.collectAsState()
    
    var showApiKeyDialog by remember { mutableStateOf(false) }
    var selectedProviderForConfig by remember { mutableStateOf<TtsProvider?>(null) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Text-to-Speech Provider") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                }
            )
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            item {
                Text(
                    text = "Choose your text-to-speech provider",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
                Text(
                    text = "Select the voice service you want to use for reading books aloud.",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    modifier = Modifier.padding(bottom = 16.dp)
                )
            }

            items(TtsProvider.values().toList()) { provider ->
                TtsProviderCard(
                    provider = provider,
                    isSelected = providerSettings.provider == provider,
                    isConfigured = isConfigured[provider] ?: false,
                    onClick = {
                        if (provider.requiresApiKey && !(isConfigured[provider] ?: false)) {
                            selectedProviderForConfig = provider
                            showApiKeyDialog = true
                        } else {
                            viewModel.selectProvider(provider)
                        }
                    },
                    onConfigure = {
                        selectedProviderForConfig = provider
                        showApiKeyDialog = true
                    }
                )
            }

            item {
                Spacer(modifier = Modifier.height(16.dp))
                
                // Info card
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer
                    )
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        Icon(
                            Icons.Default.Info,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        Column {
                            Text(
                                text = "About TTS Providers",
                                style = MaterialTheme.typography.titleSmall,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                            Spacer(modifier = Modifier.height(4.dp))
                            Text(
                                text = "• Android TTS: Free, offline, works immediately\n" +
                                       "• Cloud TTS: High-quality AI voices, requires internet\n" +
                                       "• API keys for cloud services can be obtained from their respective websites",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                        }
                    }
                }
            }
        }
    }

    // API Key Configuration Dialog
    if (showApiKeyDialog && selectedProviderForConfig != null) {
        ApiKeyConfigDialog(
            provider = selectedProviderForConfig!!,
            currentApiKey = if (selectedProviderForConfig == providerSettings.provider) {
                providerSettings.apiKey ?: ""
            } else "",
            onDismiss = {
                showApiKeyDialog = false
                selectedProviderForConfig = null
            },
            onSave = { apiKey ->
                viewModel.setApiKey(selectedProviderForConfig!!, apiKey)
                viewModel.selectProvider(selectedProviderForConfig!!)
                showApiKeyDialog = false
                selectedProviderForConfig = null
            }
        )
    }
}

@Composable
fun TtsProviderCard(
    provider: TtsProvider,
    isSelected: Boolean,
    isConfigured: Boolean,
    onClick: () -> Unit,
    onConfigure: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        onClick = onClick,
        colors = CardDefaults.cardColors(
            containerColor = if (isSelected) {
                MaterialTheme.colorScheme.primaryContainer
            } else {
                MaterialTheme.colorScheme.surface
            }
        ),
        border = if (isSelected) {
            androidx.compose.foundation.BorderStroke(
                2.dp,
                MaterialTheme.colorScheme.primary
            )
        } else null
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(
                modifier = Modifier.weight(1f)
            ) {
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = provider.displayName,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    
                    if (provider.requiresApiKey) {
                        if (isConfigured) {
                            Icon(
                                Icons.Default.CheckCircle,
                                contentDescription = "Configured",
                                tint = MaterialTheme.colorScheme.primary,
                                modifier = Modifier.size(20.dp)
                            )
                        } else {
                            Icon(
                                Icons.Default.Warning,
                                contentDescription = "Not Configured",
                                tint = MaterialTheme.colorScheme.error,
                                modifier = Modifier.size(20.dp)
                            )
                        }
                    }
                }
                
                Spacer(modifier = Modifier.height(4.dp))
                
                Text(
                    text = provider.description,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                
                if (provider.requiresApiKey && !isConfigured) {
                    Spacer(modifier = Modifier.height(4.dp))
                    Text(
                        text = "API key required",
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.error
                    )
                }
            }
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                if (provider.requiresApiKey) {
                    IconButton(onClick = onConfigure) {
                        Icon(Icons.Default.Settings, "Configure")
                    }
                }
                
                RadioButton(
                    selected = isSelected,
                    onClick = onClick
                )
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ApiKeyConfigDialog(
    provider: TtsProvider,
    currentApiKey: String,
    onDismiss: () -> Unit,
    onSave: (String) -> Unit
) {
    var apiKey by remember { mutableStateOf(currentApiKey) }
    var showApiKey by remember { mutableStateOf(false) }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Configure ${provider.displayName}") },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                Text(
                    text = "Enter your API key to use ${provider.displayName}.",
                    style = MaterialTheme.typography.bodyMedium
                )
                
                OutlinedTextField(
                    value = apiKey,
                    onValueChange = { apiKey = it },
                    label = { Text("API Key") },
                    placeholder = { Text("sk-...") },
                    visualTransformation = if (showApiKey) {
                        androidx.compose.ui.text.input.VisualTransformation.None
                    } else {
                        androidx.compose.ui.text.input.PasswordVisualTransformation()
                    },
                    trailingIcon = {
                        IconButton(onClick = { showApiKey = !showApiKey }) {
                            Icon(
                                if (showApiKey) Icons.Default.Visibility else Icons.Default.VisibilityOff,
                                contentDescription = if (showApiKey) "Hide" else "Show"
                            )
                        }
                    },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                
                Text(
                    text = when (provider) {
                        TtsProvider.GEMINI -> "Get your API key from: https://makersuite.google.com/app/apikey"
                        TtsProvider.GOOGLE_CLOUD -> "Get your API key from: https://console.cloud.google.com/"
                        TtsProvider.ELEVEN_LABS -> "Get your API key from: https://elevenlabs.io/"
                        TtsProvider.OPENAI -> "Get your API key from: https://platform.openai.com/api-keys"
                        else -> ""
                    },
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = { onSave(apiKey) },
                enabled = apiKey.isNotBlank()
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
