package com.universalmedialibrary.ui.comic

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDropDown
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
    
    var isGeminiKeyVisible by mutableStateOf(false)
        private set
    
    var selectedLanguage by mutableStateOf("en")
        private set
    
    var saveStatus by mutableStateOf<SaveStatus>(SaveStatus.None)
        private set
    
    var areKeysConfigured by mutableStateOf(false)
        private set
    
    val availableLanguages = listOf(
        Language("en", "English"),
        Language("es", "Spanish"),
        Language("fr", "French"),
        Language("de", "German"),
        Language("it", "Italian"),
        Language("pt", "Portuguese"),
        Language("ja", "Japanese"),
        Language("ko", "Korean"),
        Language("zh", "Chinese"),
        Language("ru", "Russian"),
        Language("ar", "Arabic"),
        Language("hi", "Hindi")
    )
    
    data class Language(val code: String, val name: String)

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
        areKeysConfigured = apiKeyManager.areKeysConfigured()
    }

    fun updateGeminiKey(key: String) {
        geminiApiKey = key
    }

    fun toggleGeminiKeyVisibility() {
        isGeminiKeyVisible = !isGeminiKeyVisible
    }
    
    fun updateSelectedLanguage(languageCode: String) {
        selectedLanguage = languageCode
    }

    fun saveKeys() {
        viewModelScope.launch {
            try {
                saveStatus = SaveStatus.Saving
                
                if (!apiKeyManager.validateKeyFormat(geminiApiKey)) {
                    saveStatus = SaveStatus.Error("Invalid Gemini API key format")
                    return@launch
                }
                
                apiKeyManager.setGeminiApiKey(geminiApiKey)
                
                areKeysConfigured = true
                saveStatus = SaveStatus.Success
            } catch (e: Exception) {
                saveStatus = SaveStatus.Error(e.message ?: "Failed to save key")
            }
        }
    }

    fun clearKeys() {
        viewModelScope.launch {
            apiKeyManager.clearKeys()
            geminiApiKey = ""
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
                .padding(16.dp)
                .verticalScroll(rememberScrollState()),
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
                            contentDescription = "Media image",
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
                "Configure your Gemini API key to enable AI-powered comic translation. Translation runs on-device using Google ML Kit - no additional API key needed!",
                style = MaterialTheme.typography.bodyLarge,
                color = MaterialTheme.colorScheme.onSurface
            )

            // Gemini API Key
            ApiKeyTextField(
                label = "Gemini 2.5 API Key",
                value = viewModel.geminiApiKey,
                onValueChange = { viewModel.updateGeminiKey(it) },
                isVisible = viewModel.isGeminiKeyVisible,
                onVisibilityToggle = { viewModel.toggleGeminiKeyVisibility() },
                helpText = "Get your key at: https://makersuite.google.com/app/apikey"
            )
            
            // Language Selection
            LanguageSelector(
                selectedLanguage = viewModel.selectedLanguage,
                availableLanguages = viewModel.availableLanguages,
                onLanguageSelected = { viewModel.updateSelectedLanguage(it) }
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
                    enabled = viewModel.geminiApiKey.isNotBlank()
                ) {
                    Text("Save Key")
                }
            }

            // Privacy Notice
            Text(
                "🔒 Your API key is encrypted and stored locally on your device. " +
                "Translation runs entirely on-device using ML Kit - your comic pages never leave your phone!",
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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun LanguageSelector(
    selectedLanguage: String,
    availableLanguages: List<ComicTranslationSettingsViewModel.Language>,
    onLanguageSelected: (String) -> Unit
) {
    var expanded by remember { mutableStateOf(false) }
    val selectedLang = availableLanguages.find { it.code == selectedLanguage }
    
    Column(
        verticalArrangement = Arrangement.spacedBy(4.dp)
    ) {
        Text(
            "Target Translation Language",
            style = MaterialTheme.typography.labelMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        ExposedDropdownMenuBox(
            expanded = expanded,
            onExpandedChange = { expanded = !expanded }
        ) {
            OutlinedTextField(
                value = selectedLang?.name ?: "English",
                onValueChange = {},
                readOnly = true,
                modifier = Modifier
                    .fillMaxWidth()
                    .menuAnchor(),
                trailingIcon = {
                    Icon(
                        Icons.Default.ArrowDropDown,
                        contentDescription = "Select language"
                    )
                },
                colors = OutlinedTextFieldDefaults.colors()
            )
            
            ExposedDropdownMenu(
                expanded = expanded,
                onDismissRequest = { expanded = false }
            ) {
                availableLanguages.forEach { language ->
                    DropdownMenuItem(
                        text = { Text(language.name) },
                        onClick = {
                            onLanguageSelected(language.code)
                            expanded = false
                        },
                        leadingIcon = if (language.code == selectedLanguage) {
                            { Icon(Icons.Default.Check, contentDescription = "Confirm") }
                        } else null
                    )
                }
            }
        }
        
        Text(
            "Select the language you want to translate comics into",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}
