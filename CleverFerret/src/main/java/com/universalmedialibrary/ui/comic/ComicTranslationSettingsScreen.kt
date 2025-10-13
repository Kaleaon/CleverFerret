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

    /**
     * Loads persisted API keys from the manager and updates the view model's state.
     *
     * Sets `geminiApiKey` and `translateApiKey` to the stored values (or to an empty string if none are stored)
     * and updates `areKeysConfigured` to reflect whether keys are configured.
     */
    private fun loadKeys() {
        geminiApiKey = apiKeyManager.getGeminiApiKey() ?: ""
        translateApiKey = apiKeyManager.getTranslateApiKey() ?: ""
        areKeysConfigured = apiKeyManager.areKeysConfigured()
    }

    /**
     * Sets the stored Gemini API key to the provided value.
     *
     * @param key The Gemini API key string to save in the view model state.
     */
    fun updateGeminiKey(key: String) {
        geminiApiKey = key
    }

    /**
     * Updates the Google Cloud Translation API key stored in the ViewModel.
     *
     * @param key The new Google Cloud Translation API key value.
     */
    fun updateTranslateKey(key: String) {
        translateApiKey = key
    }

    /**
     * Toggles whether the Gemini API key is visible in the UI.
     */
    fun toggleGeminiKeyVisibility() {
        isGeminiKeyVisible = !isGeminiKeyVisible
    }

    /**
     * Toggles whether the Google Cloud Translation API key is displayed or masked.
     */
    fun toggleTranslateKeyVisibility() {
        isTranslateKeyVisible = !isTranslateKeyVisible
    }

    /**
     * Saves the current Gemini and Google Cloud Translation API keys after validating their formats, persists them, and updates the configured state.
     *
     * Validation failures or persistence errors set `saveStatus` to `SaveStatus.Error` with an explanatory message. On success `saveStatus` becomes `SaveStatus.Success` and `areKeysConfigured` is set to `true`. The `saveStatus` is set to `SaveStatus.Saving` while the operation is in progress.
     */
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

    /**
     * Clears persisted API keys and resets ViewModel state related to keys and save status.
     *
     * Removes stored Gemini and Google Cloud Translation keys from persistent storage, sets the in-memory
     * `geminiApiKey` and `translateApiKey` to empty strings, sets `areKeysConfigured` to `false`, and
     * resets `saveStatus` to `SaveStatus.None`.
     */
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
/**
 * Screen for configuring Gemini and Google Cloud Translation API keys used by comic translation.
 *
 * Shows current key configuration status, editable API key fields with visibility toggles, save/clear actions,
 * and inline save status feedback (saving, success, error). Keys are validated and persisted via the provided ViewModel.
 *
 * @param onNavigateBack Callback invoked when the user requests to close or navigate back from this screen.
 */
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

/**
 * Labeled single-line text field for entering an API key with a visibility toggle and helper text.
 *
 * Displays the provided label, the current text value, a trailing visibility toggle that switches
 * between masked and plain text based on `isVisible`, and a help line below the field.
 *
 * @param label The field label shown inside the text field.
 * @param value The current text value of the field.
 * @param onValueChange Callback invoked when the text value changes.
 * @param isVisible If `true`, the field shows the text plainly; if `false`, the text is masked.
 * @param onVisibilityToggle Callback invoked when the visibility toggle is pressed.
 * @param helpText A short helper/instruction line displayed below the text field.
 */
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