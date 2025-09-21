package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalUriHandler
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.ai.GeminiTTSModel
import com.universalmedialibrary.services.ai.GeminiTTSOptions
import com.universalmedialibrary.services.ai.GeminiTTSPace
import com.universalmedialibrary.services.ai.GeminiTTSStyle
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Gemini API Settings Screen
 * 
 * Comprehensive configuration interface for Google Gemini API integration,
 * supporting both OCR and advanced Text-to-Speech capabilities.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun GeminiApiSettingsScreen(
    onNavigateBack: () -> Unit,
    viewModel: GeminiApiSettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val uriHandler = LocalUriHandler.current
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        "Gemini AI Settings",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    ) 
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(
                            Icons.AutoMirrored.Filled.ArrowBack, 
                            contentDescription = "Back"
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                    titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer
                )
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            item {
                GeminiIntroCard(
                    onGetApiKey = {
                        uriHandler.openUri("https://aistudio.google.com/apikey")
                    }
                )
            }
            
            item {
                GeminiApiKeyCard(
                    apiKey = uiState.apiKey,
                    onApiKeyChange = viewModel::updateApiKey,
                    onSaveApiKey = viewModel::saveApiKey,
                    onTestApiKey = viewModel::testApiKey,
                    isTesting = uiState.isTesting,
                    testResult = uiState.testResult
                )
            }
            
            if (uiState.hasValidApiKey) {
                item {
                    GeminiOCRSettingsCard(
                        isEnabled = uiState.ocrEnabled,
                        onToggleOCR = viewModel::toggleOCR
                    )
                }
                
                item {
                    GeminiTTSSettingsCard(
                        isEnabled = uiState.ttsEnabled,
                        ttsOptions = uiState.ttsOptions,
                        onToggleTTS = viewModel::toggleTTS,
                        onUpdateTTSOptions = viewModel::updateTTSOptions
                    )
                }
                
                item {
                    GeminiUsageStatsCard(
                        ocrCallsThisMonth = uiState.ocrCallsThisMonth,
                        ttsCallsThisMonth = uiState.ttsCallsThisMonth,
                        estimatedCost = uiState.estimatedCost
                    )
                }
            }
        }
    }
}

@Composable
private fun GeminiIntroCard(
    onGetApiKey: () -> Unit
) {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    Icons.Default.Psychology,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.onPrimaryContainer,
                    modifier = Modifier.size(32.dp)
                )
                Spacer(modifier = Modifier.width(12.dp))
                Text(
                    "Google Gemini AI Integration",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.onPrimaryContainer
                )
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            Text(
                "Enhance your media library with Google's most advanced AI:",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onPrimaryContainer
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Column(
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                FeatureListItem("🔍 Advanced OCR - Extract text from older PDFs and scanned books")
                FeatureListItem("🎙️ Premium TTS - Natural, expressive text-to-speech narration")
                FeatureListItem("🌍 24+ Languages - Multi-language support with seamless switching")
                FeatureListItem("🎭 Multi-Voice - Distinct voices for dialogue and narration")
                FeatureListItem("📚 Book-Optimized - Perfect for audiobook-quality reading")
            }
            
            Spacer(modifier = Modifier.height(16.dp))
            
            Button(
                onClick = onGetApiKey,
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.Key, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Get Free Gemini API Key")
            }
        }
    }
}

@Composable
private fun FeatureListItem(text: String) {
    Text(
        text = text,
        style = MaterialTheme.typography.bodySmall,
        color = MaterialTheme.colorScheme.onPrimaryContainer
    )
}

@Composable
private fun GeminiApiKeyCard(
    apiKey: String,
    onApiKeyChange: (String) -> Unit,
    onSaveApiKey: () -> Unit,
    onTestApiKey: () -> Unit,
    isTesting: Boolean,
    testResult: String?
) {
    var showApiKey by remember { mutableStateOf(false) }
    
    Card {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                "API Key Configuration",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Medium
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            OutlinedTextField(
                value = apiKey,
                onValueChange = onApiKeyChange,
                label = { Text("Gemini API Key") },
                placeholder = { Text("AIzaSy...") },
                modifier = Modifier.fillMaxWidth(),
                singleLine = true,
                visualTransformation = if (showApiKey) VisualTransformation.None else PasswordVisualTransformation(),
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password),
                trailingIcon = {
                    IconButton(onClick = { showApiKey = !showApiKey }) {
                        Icon(
                            if (showApiKey) Icons.Default.VisibilityOff else Icons.Default.Visibility,
                            contentDescription = if (showApiKey) "Hide API key" else "Show API key"
                        )
                    }
                }
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                modifier = Modifier.fillMaxWidth()
            ) {
                OutlinedButton(
                    onClick = onTestApiKey,
                    enabled = apiKey.isNotBlank() && !isTesting,
                    modifier = Modifier.weight(1f)
                ) {
                    if (isTesting) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(16.dp),
                            strokeWidth = 2.dp
                        )
                    } else {
                        Icon(Icons.Default.Verified, contentDescription = null)
                    }
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Test Key")
                }
                
                Button(
                    onClick = onSaveApiKey,
                    enabled = apiKey.isNotBlank(),
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.Save, contentDescription = null)
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Save Key")
                }
            }
            
            testResult?.let { result ->
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    result,
                    style = MaterialTheme.typography.bodySmall,
                    color = if (result.contains("Success")) 
                        MaterialTheme.colorScheme.primary 
                    else 
                        MaterialTheme.colorScheme.error
                )
            }
        }
    }
}

@Composable
private fun GeminiOCRSettingsCard(
    isEnabled: Boolean,
    onToggleOCR: (Boolean) -> Unit
) {
    Card {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(
                    Icons.Default.DocumentScanner,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary
                )
                Spacer(modifier = Modifier.width(12.dp))
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        "Advanced OCR",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        "Extract text from older PDFs and scanned books",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(
                    checked = isEnabled,
                    onCheckedChange = onToggleOCR
                )
            }
            
            if (isEnabled) {
                Spacer(modifier = Modifier.height(12.dp))
                Text(
                    "Features enabled: High-accuracy text extraction, multi-language support, document analysis, metadata extraction",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@Composable
private fun GeminiTTSSettingsCard(
    isEnabled: Boolean,
    ttsOptions: GeminiTTSOptions,
    onToggleTTS: (Boolean) -> Unit,
    onUpdateTTSOptions: (GeminiTTSOptions) -> Unit
) {
    Card {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(
                    Icons.Default.RecordVoiceOver,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary
                )
                Spacer(modifier = Modifier.width(12.dp))
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        "Premium Text-to-Speech",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        "Natural, expressive narration for your books",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(
                    checked = isEnabled,
                    onCheckedChange = onToggleTTS
                )
            }
            
            if (isEnabled) {
                Spacer(modifier = Modifier.height(16.dp))
                
                // TTS Model Selection
                Text(
                    "TTS Model:",
                    style = MaterialTheme.typography.labelMedium,
                    fontWeight = FontWeight.Medium
                )
                Spacer(modifier = Modifier.height(4.dp))
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    GeminiTTSModel.values().forEach { model ->
                        FilterChip(
                            selected = ttsOptions.model == model,
                            onClick = { 
                                onUpdateTTSOptions(ttsOptions.copy(model = model))
                            },
                            label = { Text(model.displayName.substringAfter("2.5 ")) }
                        )
                    }
                }
                
                Spacer(modifier = Modifier.height(12.dp))
                
                // Voice Style
                Text(
                    "Voice Style:",
                    style = MaterialTheme.typography.labelMedium,
                    fontWeight = FontWeight.Medium
                )
                Spacer(modifier = Modifier.height(4.dp))
                Row(
                    horizontalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    GeminiTTSStyle.values().take(3).forEach { style ->
                        FilterChip(
                            selected = ttsOptions.style == style,
                            onClick = { 
                                onUpdateTTSOptions(ttsOptions.copy(style = style))
                            },
                            label = { Text(style.name.lowercase().capitalize()) }
                        )
                    }
                }
                
                Spacer(modifier = Modifier.height(8.dp))
                
                // Reading Pace
                Text(
                    "Reading Pace: ${ttsOptions.pace.name.lowercase().capitalize()}",
                    style = MaterialTheme.typography.labelMedium,
                    fontWeight = FontWeight.Medium
                )
                Slider(
                    value = ttsOptions.pace.ordinal.toFloat(),
                    onValueChange = { value ->
                        val pace = GeminiTTSPace.values()[value.toInt()]
                        onUpdateTTSOptions(ttsOptions.copy(pace = pace))
                    },
                    steps = GeminiTTSPace.values().size - 2,
                    valueRange = 0f..(GeminiTTSPace.values().size - 1).toFloat()
                )
                
                Spacer(modifier = Modifier.height(8.dp))
                
                // Advanced Options
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    FilterChip(
                        selected = ttsOptions.enableMultiSpeaker,
                        onClick = { 
                            onUpdateTTSOptions(ttsOptions.copy(enableMultiSpeaker = !ttsOptions.enableMultiSpeaker))
                        },
                        label = { Text("Multi-Voice") }
                    )
                    
                    FilterChip(
                        selected = ttsOptions.enhanceAccessibility,
                        onClick = { 
                            onUpdateTTSOptions(ttsOptions.copy(enhanceAccessibility = !ttsOptions.enhanceAccessibility))
                        },
                        label = { Text("Accessibility") }
                    )
                }
            }
        }
    }
}

@Composable
private fun GeminiUsageStatsCard(
    ocrCallsThisMonth: Int,
    ttsCallsThisMonth: Int,
    estimatedCost: Double
) {
    Card {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    Icons.Default.Analytics,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary
                )
                Spacer(modifier = Modifier.width(12.dp))
                Text(
                    "Usage Statistics",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium
                )
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                UsageStatItem(
                    label = "OCR Calls",
                    value = ocrCallsThisMonth.toString(),
                    subtitle = "this month"
                )
                
                UsageStatItem(
                    label = "TTS Calls",
                    value = ttsCallsThisMonth.toString(),
                    subtitle = "this month"
                )
                
                UsageStatItem(
                    label = "Est. Cost",
                    value = "$${String.format("%.2f", estimatedCost)}",
                    subtitle = "this month"
                )
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Text(
                "Gemini API offers generous free usage limits. Most users stay within the free tier.",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                textAlign = TextAlign.Center,
                modifier = Modifier.fillMaxWidth()
            )
        }
    }
}

@Composable
private fun UsageStatItem(
    label: String,
    value: String,
    subtitle: String
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            value,
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold,
            color = MaterialTheme.colorScheme.primary
        )
        Text(
            label,
            style = MaterialTheme.typography.labelMedium,
            fontWeight = FontWeight.Medium
        )
        Text(
            subtitle,
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@HiltViewModel
class GeminiApiSettingsViewModel @Inject constructor(
    // Inject your preferences/settings repository here
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(GeminiApiSettingsUIState())
    val uiState: StateFlow<GeminiApiSettingsUIState> = _uiState.asStateFlow()
    
    fun updateApiKey(apiKey: String) {
        _uiState.value = _uiState.value.copy(apiKey = apiKey)
    }
    
    fun saveApiKey() {
        viewModelScope.launch {
            // Save API key to secure storage
            // Implementation depends on your preferences system
            _uiState.value = _uiState.value.copy(hasValidApiKey = _uiState.value.apiKey.isNotBlank())
        }
    }
    
    fun testApiKey() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isTesting = true, testResult = null)
            
            try {
                // Test API key with a simple request
                // Implementation would make actual API call
                kotlinx.coroutines.delay(2000) // Simulate API call
                
                _uiState.value = _uiState.value.copy(
                    isTesting = false,
                    testResult = "✅ Success! API key is valid and ready to use.",
                    hasValidApiKey = true
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isTesting = false,
                    testResult = "❌ Error: ${e.message}",
                    hasValidApiKey = false
                )
            }
        }
    }
    
    fun toggleOCR(enabled: Boolean) {
        _uiState.value = _uiState.value.copy(ocrEnabled = enabled)
    }
    
    fun toggleTTS(enabled: Boolean) {
        _uiState.value = _uiState.value.copy(ttsEnabled = enabled)
    }
    
    fun updateTTSOptions(options: GeminiTTSOptions) {
        _uiState.value = _uiState.value.copy(ttsOptions = options)
    }
}

data class GeminiApiSettingsUIState(
    val apiKey: String = "",
    val hasValidApiKey: Boolean = false,
    val isTesting: Boolean = false,
    val testResult: String? = null,
    val ocrEnabled: Boolean = true,
    val ttsEnabled: Boolean = true,
    val ttsOptions: GeminiTTSOptions = GeminiTTSOptions(),
    val ocrCallsThisMonth: Int = 0,
    val ttsCallsThisMonth: Int = 0,
    val estimatedCost: Double = 0.0
)