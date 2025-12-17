package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.selection.selectable
import androidx.compose.foundation.verticalScroll
import androidx.compose.foundation.BorderStroke
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.APIKey
import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.preferences.AISettingsPreferencesStore
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class AISettingsViewModel @Inject constructor(
    private val aiSettings: AISettingsPreferencesStore,
    private val apiKeyDao: APIKeyDao
) : ViewModel() {

    private val _selectedProvider = MutableStateFlow("GEMINI")
    val selectedProvider: StateFlow<String> = _selectedProvider.asStateFlow()

    private val _apiKeys = MutableStateFlow<Map<String, String>>(emptyMap())
    val apiKeys: StateFlow<Map<String, String>> = _apiKeys.asStateFlow()

    init {
        viewModelScope.launch {
            aiSettings.selectedProvider.collectLatest {
                _selectedProvider.value = it
            }
        }
        refreshKeys()
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
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AISettingsScreen(
    onNavigateBack: () -> Unit,
    viewModel: AISettingsViewModel = hiltViewModel()
) {
    val selectedProvider by viewModel.selectedProvider.collectAsState()
    val apiKeys by viewModel.apiKeys.collectAsState()

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
            Text(
                "Select AI Provider",
                style = MaterialTheme.typography.titleMedium
            )

            Column {
                ProviderOption(
                    id = "GEMINI",
                    name = "Google Gemini",
                    description = "Fast and efficient. Good for summaries.",
                    isSelected = selectedProvider == "GEMINI",
                    currentKey = apiKeys["gemini"] ?: "",
                    onSelect = { viewModel.setProvider("GEMINI") },
                    onKeySave = { viewModel.saveKey("gemini", it) }
                )

                Spacer(modifier = Modifier.height(16.dp))

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
        }
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
