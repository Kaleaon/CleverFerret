package com.universalmedialibrary.ui.comic

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Visibility
import androidx.compose.material.icons.filled.VisibilityOff
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.comic.ComicTranslationApiKeyManager
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Comic Translation Settings
 */
@HiltViewModel
class ComicTranslationSettingsViewModel @Inject constructor(
    private val apiKeyManager: ComicTranslationApiKeyManager
) : ViewModel() {

    var geminiApiKey by mutableStateOf("")
        private set
    
    var translateApiKey by mutableStateOf("")
        private set
    
    var isGeminiKeyVisible by mutableStateOf(false)
        private set
    
    var isTranslateKeyVisible by mutableStateOf(false)
        private set
    
    var saveStatus by mutableStateOf<SaveStatus>(SaveStatus.None)
        private set
    
    var areKeysConfigured by mutableStateOf(false)
        private set

    sealed class SaveStatus {
        object None : SaveStatus()
        object Saving : SaveStatus()
        object Success : SaveStatus()
        data class Error(val message: String) : SaveStatus()
    }

    init {
        loadKeys()
    }

    private fun loadKeys() {
        geminiApiKey = apiKeyManager.getGeminiApiKey() ?: ""
        translateApiKey = apiKeyManager.getTranslateApiKey() ?: ""
        areKeysConfigured = apiKeyManager.areKeysConfigured()
    }

    fun updateGeminiKey(key: String) {
        geminiApiKey = key
    }

    fun updateTranslateKey(key: String) {
        translateApiKey = key
    }

    fun toggleGeminiKeyVisibility() {
        isGeminiKeyVisible = !isGeminiKeyVisible
    }

    fun toggleTranslateKeyVisibility() {
        isTranslateKeyVisible = !isTranslateKeyVisible
    }

    fun saveKeys() {
        viewModelScope.launch {
            try {
                saveStatus = SaveStatus.Saving
                
                if (!apiKeyManager.validateKeyFormat(geminiApiKey)) {
                    saveStatus = SaveStatus.Error("Invalid Gemini API key format")
                    return@launch
                }
                
                if (!apiKeyManager.validateKeyFormat(translateApiKey)) {
                    saveStatus = SaveStatus.Error("Invalid Translation API key format")
                    return@launch
                }
                
                apiKeyManager.setGeminiApiKey(geminiApiKey)
                apiKeyManager.setTranslateApiKey(translateApiKey)
                
                areKeysConfigured = true
                saveStatus = SaveStatus.Success
            } catch (e: Exception) {
                saveStatus = SaveStatus.Error(e.message ?: "Failed to save keys")
            }
        }
    }

    fun clearKeys() {
        viewModelScope.launch {
            apiKeyManager.clearKeys()
            geminiApiKey = ""
            translateApiKey = ""
            areKeysConfigured = false
            saveStatus = SaveStatus.None
        }
    }
}

/**
 * Comic Translation Settings Screen
 * 
 * This screen allows users to configure their API keys for comic translation.
 * The keys are stored securely using EncryptedSharedPreferences.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ComicTranslationSettingsScreen(
    viewModel: ComicTranslationSettingsViewModel = hiltViewModel(),
    onNavigateBack: () -> Unit = {}
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Comic Translation Settings") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.Close, contentDescription = "Close")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Status Card
            if (viewModel.areKeysConfigured) {
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
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Default.Check,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Text(
                            "API keys configured. Comic translation is ready!",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                }
            }

            // Instructions
            Text(
                "Configure your API keys to enable AI-powered comic translation",
                style = MaterialTheme.typography.bodyLarge,
                color = MaterialTheme.colorScheme.onSurface
            )

            // Gemini API Key
            ApiKeyTextField(
                label = "Gemini API Key",
                value = viewModel.geminiApiKey,
                onValueChange = { viewModel.updateGeminiKey(it) },
                isVisible = viewModel.isGeminiKeyVisible,
                onVisibilityToggle = { viewModel.toggleGeminiKeyVisibility() },
                helpText = "Get your key at: https://makersuite.google.com/app/apikey"
            )

            // Google Cloud Translation API Key
            ApiKeyTextField(
                label = "Google Cloud Translation API Key",
                value = viewModel.translateApiKey,
                onValueChange = { viewModel.updateTranslateKey(it) },
                isVisible = viewModel.isTranslateKeyVisible,
                onVisibilityToggle = { viewModel.toggleTranslateKeyVisibility() },
                helpText = "Get your key at: https://console.cloud.google.com/"
            )

            // Save Status
            when (val status = viewModel.saveStatus) {
                is ComicTranslationSettingsViewModel.SaveStatus.Saving -> {
                    CircularProgressIndicator(modifier = Modifier.align(Alignment.CenterHorizontally))
                }
                is ComicTranslationSettingsViewModel.SaveStatus.Success -> {
                    Text(
                        "✓ Keys saved successfully!",
                        color = MaterialTheme.colorScheme.primary,
                        style = MaterialTheme.typography.bodyMedium,
                        modifier = Modifier.align(Alignment.CenterHorizontally)
                    )
                }
                is ComicTranslationSettingsViewModel.SaveStatus.Error -> {
                    Text(
                        "✗ ${status.message}",
                        color = MaterialTheme.colorScheme.error,
                        style = MaterialTheme.typography.bodyMedium,
                        modifier = Modifier.align(Alignment.CenterHorizontally)
                    )
                }
                else -> {}
            }

            Spacer(modifier = Modifier.weight(1f))

            // Action Buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                if (viewModel.areKeysConfigured) {
                    OutlinedButton(
                        onClick = { viewModel.clearKeys() },
                        modifier = Modifier.weight(1f)
                    ) {
                        Text("Clear Keys")
                    }
                }
                
                Button(
                    onClick = { viewModel.saveKeys() },
                    modifier = Modifier.weight(1f),
                    enabled = viewModel.geminiApiKey.isNotBlank() && 
                             viewModel.translateApiKey.isNotBlank()
                ) {
                    Text("Save Keys")
                }
            }

            // Privacy Notice
            Text(
                "🔒 Your API keys are encrypted and stored locally on your device. " +
                "They are never sent to any server except Google's APIs.",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun ApiKeyTextField(
    label: String,
    value: String,
    onValueChange: (String) -> Unit,
    isVisible: Boolean,
    onVisibilityToggle: () -> Unit,
    helpText: String
) {
    Column(
        verticalArrangement = Arrangement.spacedBy(4.dp)
    ) {
        OutlinedTextField(
            value = value,
            onValueChange = onValueChange,
            label = { Text(label) },
            modifier = Modifier.fillMaxWidth(),
            visualTransformation = if (isVisible) {
                VisualTransformation.None
            } else {
                PasswordVisualTransformation()
            },
            trailingIcon = {
                IconButton(onClick = onVisibilityToggle) {
                    Icon(
                        if (isVisible) Icons.Default.Visibility else Icons.Default.VisibilityOff,
                        contentDescription = if (isVisible) "Hide" else "Show"
                    )
                }
            },
            singleLine = true
        )
        Text(
            helpText,
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}
