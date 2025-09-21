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
import com.universalmedialibrary.data.settings.SecureSettingsRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * API Keys Manager Screen - WORKING IMPLEMENTATION
 * 
 * This screen actually manages real API keys for the services we integrate with.
 * Each API has clear instructions on where to get keys and what they're used for.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ApiKeysManagerScreen(
    onNavigateBack: () -> Unit,
    viewModel: ApiKeysManagerViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val uriHandler = LocalUriHandler.current
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        "API Keys Manager",
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
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Text(
                            "API Key Management",
                            style = MaterialTheme.typography.titleLarge,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            "Configure API keys for enhanced metadata and AI features. All keys are stored securely on your device.",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                }
            }
            
            // Gemini AI API Key
            item {
                ApiKeyCard(
                    title = "Google Gemini AI",
                    description = "For OCR and Text-to-Speech features",
                    currentKey = uiState.geminiApiKey,
                    onKeyChange = viewModel::updateGeminiKey,
                    onSave = viewModel::saveGeminiKey,
                    onTest = viewModel::testGeminiKey,
                    onGetKey = { uriHandler.openUri("https://aistudio.google.com/apikey") },
                    getKeyText = "Get Free Gemini API Key",
                    isEnabled = uiState.geminiTtsEnabled || uiState.geminiOcrEnabled,
                    isTesting = uiState.isTestingGemini,
                    testResult = uiState.geminiTestResult,
                    freeUsage = "15 requests/minute, 1,500/day free",
                    features = listOf("OCR text extraction", "Natural TTS voices", "Document analysis")
                )
            }
            
            // TMDB API Key
            item {
                ApiKeyCard(
                    title = "TMDB (Movies & TV)",
                    description = "For movie and TV show metadata",
                    currentKey = uiState.tmdbApiKey,
                    onKeyChange = viewModel::updateTmdbKey,
                    onSave = viewModel::saveTmdbKey,
                    onTest = viewModel::testTmdbKey,
                    onGetKey = { uriHandler.openUri("https://www.themoviedb.org/settings/api") },
                    getKeyText = "Get Free TMDB API Key",
                    isEnabled = true,
                    isTesting = uiState.isTestingTmdb,
                    testResult = uiState.tmdbTestResult,
                    freeUsage = "1,000 requests/day free",
                    features = listOf("Movie metadata", "TV show info", "Cast & crew", "Posters & backdrops")
                )
            }
            
            // Last.fm API Key
            item {
                ApiKeyCard(
                    title = "Last.fm",
                    description = "For music metadata and album art",
                    currentKey = uiState.lastFmApiKey,
                    onKeyChange = viewModel::updateLastFmKey,
                    onSave = viewModel::saveLastFmKey,
                    onTest = viewModel::testLastFmKey,
                    onGetKey = { uriHandler.openUri("https://www.last.fm/api/account/create") },
                    getKeyText = "Get Free Last.fm API Key",
                    isEnabled = uiState.musicBrainzEnabled,
                    isTesting = uiState.isTestingLastFm,
                    testResult = uiState.lastFmTestResult,
                    freeUsage = "5,000 requests/hour free",
                    features = listOf("Album metadata", "Artist info", "Album artwork", "Music recommendations")
                )
            }
            
            // Google Books API Key  
            item {
                ApiKeyCard(
                    title = "Google Books",
                    description = "For book metadata and covers",
                    currentKey = uiState.googleBooksApiKey,
                    onKeyChange = viewModel::updateGoogleBooksKey,
                    onSave = viewModel::saveGoogleBooksKey,
                    onTest = viewModel::testGoogleBooksKey,
                    onGetKey = { uriHandler.openUri("https://console.developers.google.com/apis/credentials") },
                    getKeyText = "Get Google Books API Key",
                    isEnabled = true,
                    isTesting = uiState.isTestingGoogleBooks,
                    testResult = uiState.googleBooksTestResult,
                    freeUsage = "1,000 requests/day free",
                    features = listOf("Book metadata", "Cover images", "Author information", "Publication details")
                )
            }
            
            // MusicBrainz (No API key needed)
            item {
                Card {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Icon(
                                Icons.Default.MusicNote,
                                contentDescription = null,
                                tint = MaterialTheme.colorScheme.primary
                            )
                            Spacer(modifier = Modifier.width(12.dp))
                            Column(modifier = Modifier.weight(1f)) {
                                Text(
                                    "MusicBrainz",
                                    style = MaterialTheme.typography.titleMedium,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    "Free music database (no API key required)",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            Switch(
                                checked = uiState.musicBrainzEnabled,
                                onCheckedChange = viewModel::toggleMusicBrainz
                            )
                        }
                        
                        Spacer(modifier = Modifier.height(8.dp))
                        
                        Text(
                            "Features: Music metadata, artist info, release data",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Text(
                            "Rate limit: 1 request/second (respectful usage)",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
            
            // Usage Statistics
            item {
                UsageStatisticsCard(
                    geminiCalls = uiState.geminiCallsThisMonth,
                    tmdbCalls = uiState.tmdbCallsThisMonth,
                    estimatedCost = uiState.estimatedCost
                )
            }
        }
    }
}

@Composable
private fun ApiKeyCard(
    title: String,
    description: String,
    currentKey: String,
    onKeyChange: (String) -> Unit,
    onSave: () -> Unit,
    onTest: () -> Unit,
    onGetKey: () -> Unit,
    getKeyText: String,
    isEnabled: Boolean,
    isTesting: Boolean,
    testResult: String?,
    freeUsage: String,
    features: List<String>
) {
    var showKey by remember { mutableStateOf(false) }
    var isExpanded by remember { mutableStateOf(false) }
    
    Card {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(
                    Icons.Default.Key,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary
                )
                Spacer(modifier = Modifier.width(12.dp))
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        description,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                IconButton(
                    onClick = { isExpanded = !isExpanded }
                ) {
                    Icon(
                        if (isExpanded) Icons.Default.ExpandLess else Icons.Default.ExpandMore,
                        contentDescription = if (isExpanded) "Collapse" else "Expand"
                    )
                }
            }
            
            if (isExpanded) {
                Spacer(modifier = Modifier.height(12.dp))
                
                // API Key Input
                OutlinedTextField(
                    value = currentKey,
                    onValueChange = onKeyChange,
                    label = { Text("$title API Key") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true,
                    visualTransformation = if (showKey) VisualTransformation.None else PasswordVisualTransformation(),
                    keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password),
                    trailingIcon = {
                        IconButton(onClick = { showKey = !showKey }) {
                            Icon(
                                if (showKey) Icons.Default.VisibilityOff else Icons.Default.Visibility,
                                contentDescription = if (showKey) "Hide key" else "Show key"
                            )
                        }
                    }
                )
                
                Spacer(modifier = Modifier.height(12.dp))
                
                // Action Buttons
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    modifier = Modifier.fillMaxWidth()
                ) {
                    OutlinedButton(
                        onClick = onGetKey,
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(Icons.Default.OpenInNew, contentDescription = null)
                        Spacer(modifier = Modifier.width(4.dp))
                        Text(getKeyText)
                    }
                    
                    OutlinedButton(
                        onClick = onTest,
                        enabled = currentKey.isNotBlank() && !isTesting,
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
                        Text("Test")
                    }
                    
                    Button(
                        onClick = onSave,
                        enabled = currentKey.isNotBlank(),
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(Icons.Default.Save, contentDescription = null)
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Save")
                    }
                }
                
                // Test Result
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
                
                Spacer(modifier = Modifier.height(12.dp))
                
                // Features and Usage Info
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.surfaceVariant
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(12.dp)
                    ) {
                        Text(
                            "Features:",
                            style = MaterialTheme.typography.labelMedium,
                            fontWeight = FontWeight.Medium
                        )
                        features.forEach { feature ->
                            Text(
                                "• $feature",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                        
                        Spacer(modifier = Modifier.height(8.dp))
                        
                        Text(
                            "Free usage: $freeUsage",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.primary,
                            fontWeight = FontWeight.Medium
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun UsageStatisticsCard(
    geminiCalls: Int,
    tmdbCalls: Int,
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
                    "This Month's Usage",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium
                )
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                UsageItem("Gemini AI", geminiCalls.toString(), "calls")
                UsageItem("TMDB", tmdbCalls.toString(), "calls")
                UsageItem("Est. Cost", "$${String.format("%.2f", estimatedCost)}", "USD")
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Text(
                "Most usage stays within free limits. Costs are estimated and may vary.",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                textAlign = TextAlign.Center,
                modifier = Modifier.fillMaxWidth()
            )
        }
    }
}

@Composable
private fun UsageItem(
    label: String,
    value: String,
    unit: String
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
            unit,
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@HiltViewModel
class ApiKeysManagerViewModel @Inject constructor(
    private val settingsRepository: SecureSettingsRepository
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(ApiKeysManagerUIState())
    val uiState: StateFlow<ApiKeysManagerUIState> = _uiState.asStateFlow()
    
    init {
        loadCurrentState()
    }
    
    private fun loadCurrentState() {
        _uiState.value = _uiState.value.copy(
            geminiApiKey = settingsRepository.getGeminiApiKey(),
            tmdbApiKey = settingsRepository.getTmdbApiKey(),
            lastFmApiKey = settingsRepository.getLastFmApiKey(),
            googleBooksApiKey = settingsRepository.getGoogleBooksApiKey(),
            geminiTtsEnabled = settingsRepository.isGeminiTtsEnabled(),
            geminiOcrEnabled = settingsRepository.isGeminiOcrEnabled(),
            musicBrainzEnabled = settingsRepository.isMusicBrainzEnabled(),
            geminiCallsThisMonth = settingsRepository.getGeminiCallsThisMonth(),
            tmdbCallsThisMonth = settingsRepository.getTmdbCallsThisMonth(),
            estimatedCost = settingsRepository.getEstimatedMonthlyCost()
        )
    }
    
    // Gemini API Key Management
    fun updateGeminiKey(key: String) {
        _uiState.value = _uiState.value.copy(geminiApiKey = key, geminiTestResult = null)
    }
    
    fun saveGeminiKey() {
        settingsRepository.saveGeminiApiKey(_uiState.value.geminiApiKey)
        _uiState.value = _uiState.value.copy(geminiTestResult = "✅ API key saved securely")
    }
    
    fun testGeminiKey() {
        val key = _uiState.value.geminiApiKey
        if (key.isBlank()) return
        
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isTestingGemini = true, geminiTestResult = null)
            
            try {
                // Simple validation - check if key format looks correct
                if (key.startsWith("AIza") && key.length > 30) {
                    _uiState.value = _uiState.value.copy(
                        isTestingGemini = false,
                        geminiTestResult = "✅ API key format is valid. Save to use with Gemini features."
                    )
                } else {
                    _uiState.value = _uiState.value.copy(
                        isTestingGemini = false,
                        geminiTestResult = "❌ Invalid API key format. Should start with 'AIza'"
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isTestingGemini = false,
                    geminiTestResult = "❌ Error testing key: ${e.message}"
                )
            }
        }
    }
    
    // TMDB API Key Management
    fun updateTmdbKey(key: String) {
        _uiState.value = _uiState.value.copy(tmdbApiKey = key, tmdbTestResult = null)
    }
    
    fun saveTmdbKey() {
        settingsRepository.saveTmdbApiKey(_uiState.value.tmdbApiKey)
        _uiState.value = _uiState.value.copy(tmdbTestResult = "✅ API key saved securely")
    }
    
    fun testTmdbKey() {
        val key = _uiState.value.tmdbApiKey
        if (key.isBlank()) return
        
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isTestingTmdb = true, tmdbTestResult = null)
            
            try {
                // Simple validation - TMDB keys are typically 32 character hex strings
                if (key.matches(Regex("[a-f0-9]{32}"))) {
                    _uiState.value = _uiState.value.copy(
                        isTestingTmdb = false,
                        tmdbTestResult = "✅ API key format is valid. Save to use with movie metadata."
                    )
                } else {
                    _uiState.value = _uiState.value.copy(
                        isTestingTmdb = false,
                        tmdbTestResult = "❌ Invalid API key format. Should be 32 character hex string."
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isTestingTmdb = false,
                    tmdbTestResult = "❌ Error testing key: ${e.message}"
                )
            }
        }
    }
    
    // Last.fm API Key Management
    fun updateLastFmKey(key: String) {
        _uiState.value = _uiState.value.copy(lastFmApiKey = key, lastFmTestResult = null)
    }
    
    fun saveLastFmKey() {
        settingsRepository.saveLastFmApiKey(_uiState.value.lastFmApiKey)
        _uiState.value = _uiState.value.copy(lastFmTestResult = "✅ API key saved securely")
    }
    
    fun testLastFmKey() {
        val key = _uiState.value.lastFmApiKey
        if (key.isBlank()) return
        
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isTestingLastFm = true, lastFmTestResult = null)
            
            try {
                // Last.fm keys are typically 32 character hex strings
                if (key.matches(Regex("[a-f0-9]{32}"))) {
                    _uiState.value = _uiState.value.copy(
                        isTestingLastFm = false,
                        lastFmTestResult = "✅ API key format is valid. Save to use with music metadata."
                    )
                } else {
                    _uiState.value = _uiState.value.copy(
                        isTestingLastFm = false,
                        lastFmTestResult = "❌ Invalid API key format. Should be 32 character hex string."
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isTestingLastFm = false,
                    lastFmTestResult = "❌ Error testing key: ${e.message}"
                )
            }
        }
    }
    
    // Google Books API Key Management
    fun updateGoogleBooksKey(key: String) {
        _uiState.value = _uiState.value.copy(googleBooksApiKey = key, googleBooksTestResult = null)
    }
    
    fun saveGoogleBooksKey() {
        settingsRepository.saveGoogleBooksApiKey(_uiState.value.googleBooksApiKey)
        _uiState.value = _uiState.value.copy(googleBooksTestResult = "✅ API key saved securely")
    }
    
    fun testGoogleBooksKey() {
        val key = _uiState.value.googleBooksApiKey
        if (key.isBlank()) return
        
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isTestingGoogleBooks = true, googleBooksTestResult = null)
            
            try {
                // Google API keys start with AIza
                if (key.startsWith("AIza") && key.length > 30) {
                    _uiState.value = _uiState.value.copy(
                        isTestingGoogleBooks = false,
                        googleBooksTestResult = "✅ API key format is valid. Save to use with book metadata."
                    )
                } else {
                    _uiState.value = _uiState.value.copy(
                        isTestingGoogleBooks = false,
                        googleBooksTestResult = "❌ Invalid API key format. Should start with 'AIza'"
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isTestingGoogleBooks = false,
                    googleBooksTestResult = "❌ Error testing key: ${e.message}"
                )
            }
        }
    }
    
    // MusicBrainz Toggle
    fun toggleMusicBrainz(enabled: Boolean) {
        settingsRepository.setMusicBrainzEnabled(enabled)
        _uiState.value = _uiState.value.copy(musicBrainzEnabled = enabled)
    }
}

data class ApiKeysManagerUIState(
    val geminiApiKey: String = "",
    val tmdbApiKey: String = "",
    val lastFmApiKey: String = "",
    val googleBooksApiKey: String = "",
    val geminiTtsEnabled: Boolean = true,
    val geminiOcrEnabled: Boolean = true,
    val musicBrainzEnabled: Boolean = true,
    val isTestingGemini: Boolean = false,
    val isTestingTmdb: Boolean = false,
    val isTestingLastFm: Boolean = false,
    val isTestingGoogleBooks: Boolean = false,
    val geminiTestResult: String? = null,
    val tmdbTestResult: String? = null,
    val lastFmTestResult: String? = null,
    val googleBooksTestResult: String? = null,
    val geminiCallsThisMonth: Int = 0,
    val tmdbCallsThisMonth: Int = 0,
    val estimatedCost: Double = 0.0
)