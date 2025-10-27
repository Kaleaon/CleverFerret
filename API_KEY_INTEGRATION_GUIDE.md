# API Key Integration Guide for Calibre Plugin Features

**Purpose**: Add new API keys to CleverFerret's existing API settings system  
**Status**: Ready to implement  
**Timeline**: 1-2 days

---

## 🎯 Overview

CleverFerret already has a robust API key management system. We'll extend it to support the new Calibre plugin features.

**Existing System**:
- ✅ Secure storage (EncryptedSharedPreferences)
- ✅ UI for key management
- ✅ Backup/restore functionality
- ✅ Visual indicators (gear icons)
- ✅ Test/validate keys

**New API Keys Needed**:
1. Comicvine API (comics)
2. Google Books API (metadata + covers)
3. xAI Grok API (optional - AI features)
4. OpenAI API (optional - alternative for AI)

---

## 📋 Implementation Steps

### Step 1: Add Keys to APIKeyRepository

**File**: `CleverFerret/src/main/java/com/universalmedialibrary/data/repository/APIKeyRepository.kt`

```kotlin
class APIKeyRepository @Inject constructor(
    private val encryptedPrefs: SharedPreferences
) {
    // ... existing methods ...
    
    companion object {
        // Existing keys
        private const val KEY_GEMINI_API = "gemini_api_key"
        private const val KEY_IMAGE_GENERATOR_TYPE = "image_generator_type"
        
        // NEW: Calibre plugin API keys
        private const val KEY_COMICVINE_API = "comicvine_api_key"
        private const val KEY_GOOGLE_BOOKS_API = "google_books_api_key"
        private const val KEY_GROK_API = "grok_api_key"
        private const val KEY_OPENAI_API = "openai_api_key"
    }
    
    // NEW: Comicvine API Key
    suspend fun getComicvineApiKey(): String? = withContext(Dispatchers.IO) {
        encryptedPrefs.getString(KEY_COMICVINE_API, null)
    }
    
    suspend fun setComicvineApiKey(apiKey: String) = withContext(Dispatchers.IO) {
        encryptedPrefs.edit {
            putString(KEY_COMICVINE_API, apiKey)
        }
    }
    
    suspend fun hasComicvineApiKey(): Boolean {
        return !getComicvineApiKey().isNullOrBlank()
    }
    
    // NEW: Google Books API Key
    suspend fun getGoogleBooksApiKey(): String? = withContext(Dispatchers.IO) {
        encryptedPrefs.getString(KEY_GOOGLE_BOOKS_API, null)
    }
    
    suspend fun setGoogleBooksApiKey(apiKey: String) = withContext(Dispatchers.IO) {
        encryptedPrefs.edit {
            putString(KEY_GOOGLE_BOOKS_API, apiKey)
        }
    }
    
    suspend fun hasGoogleBooksApiKey(): Boolean {
        return !getGoogleBooksApiKey().isNullOrBlank()
    }
    
    // NEW: Grok API Key (optional)
    suspend fun getGrokApiKey(): String? = withContext(Dispatchers.IO) {
        encryptedPrefs.getString(KEY_GROK_API, null)
    }
    
    suspend fun setGrokApiKey(apiKey: String) = withContext(Dispatchers.IO) {
        encryptedPrefs.edit {
            putString(KEY_GROK_API, apiKey)
        }
    }
    
    suspend fun hasGrokApiKey(): Boolean {
        return !getGrokApiKey().isNullOrBlank()
    }
    
    // NEW: OpenAI API Key (optional - alternative)
    suspend fun getOpenAIApiKey(): String? = withContext(Dispatchers.IO) {
        encryptedPrefs.getString(KEY_OPENAI_API, null)
    }
    
    suspend fun setOpenAIApiKey(apiKey: String) = withContext(Dispatchers.IO) {
        encryptedPrefs.edit {
            putString(KEY_OPENAI_API, apiKey)
        }
    }
    
    suspend fun hasOpenAIApiKey(): Boolean {
        return !getOpenAIApiKey().isNullOrBlank()
    }
    
    // NEW: Batch check method
    suspend fun getMissingApiKeys(): List<String> {
        val missing = mutableListOf<String>()
        
        // Check critical keys
        if (!hasComicvineApiKey()) missing.add("Comicvine")
        if (!hasGoogleBooksApiKey()) missing.add("Google Books")
        
        // Check optional keys
        if (!hasGrokApiKey() && !hasOpenAIApiKey() && !hasGeminiApiKey()) {
            missing.add("AI Service (Grok/OpenAI/Gemini)")
        }
        
        return missing
    }
}
```

---

### Step 2: Update APISettingsViewModel

**File**: `CleverFerret/src/main/java/com/universalmedialibrary/ui/settings/APISettingsViewModel.kt`

```kotlin
@HiltViewModel
class APISettingsViewModel @Inject constructor(
    private val apiKeyRepository: APIKeyRepository,
    private val geminiService: GeminiService,
    private val comicvineService: ComicvineService, // NEW
    private val googleBooksService: GoogleBooksService // NEW
) : ViewModel() {

    private val _uiState = MutableStateFlow(APISettingsUiState())
    val uiState: StateFlow<APISettingsUiState> = _uiState.asStateFlow()

    /**
     * Load current settings
     */
    fun loadSettings() {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)

                val geminiKey = apiKeyRepository.getGeminiApiKey()
                val comicvineKey = apiKeyRepository.getComicvineApiKey() // NEW
                val googleBooksKey = apiKeyRepository.getGoogleBooksApiKey() // NEW
                val grokKey = apiKeyRepository.getGrokApiKey() // NEW
                val openaiKey = apiKeyRepository.getOpenAIApiKey() // NEW
                val imageGeneratorType = apiKeyRepository.getImageGeneratorType()

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    geminiApiKey = geminiKey,
                    comicvineApiKey = comicvineKey, // NEW
                    googleBooksApiKey = googleBooksKey, // NEW
                    grokApiKey = grokKey, // NEW
                    openaiApiKey = openaiKey, // NEW
                    imageGeneratorType = imageGeneratorType,
                    // ... existing flags
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error loading settings: ${e.message}",
                    hasError = true
                )
            }
        }
    }

    // NEW: Save Comicvine API key
    fun saveComicvineApiKey(apiKey: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)
                apiKeyRepository.setComicvineApiKey(apiKey)
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    comicvineApiKey = apiKey,
                    statusMessage = "Comicvine API key saved successfully",
                    hasError = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error saving Comicvine API key: ${e.message}",
                    hasError = true
                )
            }
        }
    }
    
    // NEW: Test Comicvine API key
    fun testComicvineApiKey(apiKey: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)
                
                val testResult = comicvineService.testApiKey(apiKey)
                
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    comicvineTestResult = if (testResult.isSuccess) {
                        "✅ Comicvine API key is valid!"
                    } else {
                        "❌ Invalid API key: ${testResult.exceptionOrNull()?.message}"
                    },
                    hasError = !testResult.isSuccess
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    comicvineTestResult = "❌ Test failed: ${e.message}",
                    hasError = true
                )
            }
        }
    }
    
    // NEW: Save Google Books API key
    fun saveGoogleBooksApiKey(apiKey: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)
                apiKeyRepository.setGoogleBooksApiKey(apiKey)
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    googleBooksApiKey = apiKey,
                    statusMessage = "Google Books API key saved successfully",
                    hasError = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error saving Google Books API key: ${e.message}",
                    hasError = true
                )
            }
        }
    }
    
    // NEW: Test Google Books API key
    fun testGoogleBooksApiKey(apiKey: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)
                
                val testResult = googleBooksService.testApiKey(apiKey)
                
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    googleBooksTestResult = if (testResult.isSuccess) {
                        "✅ Google Books API key is valid!"
                    } else {
                        "❌ Invalid API key: ${testResult.exceptionOrNull()?.message}"
                    },
                    hasError = !testResult.isSuccess
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    googleBooksTestResult = "❌ Test failed: ${e.message}",
                    hasError = true
                )
            }
        }
    }
    
    // NEW: Save Grok API key
    fun saveGrokApiKey(apiKey: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)
                apiKeyRepository.setGrokApiKey(apiKey)
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    grokApiKey = apiKey,
                    statusMessage = "Grok API key saved successfully",
                    hasError = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error saving Grok API key: ${e.message}",
                    hasError = true
                )
            }
        }
    }
    
    // NEW: Save OpenAI API key
    fun saveOpenAIApiKey(apiKey: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true)
                apiKeyRepository.setOpenAIApiKey(apiKey)
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    openaiApiKey = apiKey,
                    statusMessage = "OpenAI API key saved successfully",
                    hasError = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error saving OpenAI API key: ${e.message}",
                    hasError = true
                )
            }
        }
    }
}

// NEW: Update UIState
data class APISettingsUiState(
    val isLoading: Boolean = false,
    val hasError: Boolean = false,
    val statusMessage: String? = null,
    
    // Existing
    val geminiApiKey: String? = null,
    val geminiEnabled: Boolean = false,
    val geminiTestResult: String? = null,
    val imageGeneratorType: ImageGeneratorType = ImageGeneratorType.DISABLED,
    
    // NEW: Calibre plugin API keys
    val comicvineApiKey: String? = null,
    val comicvineTestResult: String? = null,
    val googleBooksApiKey: String? = null,
    val googleBooksTestResult: String? = null,
    val grokApiKey: String? = null,
    val grokTestResult: String? = null,
    val openaiApiKey: String? = null,
    val openaiTestResult: String? = null,
    
    // ... existing fields
)
```

---

### Step 3: Update APISettingsScreen UI

**File**: `CleverFerret/src/main/java/com/universalmedialibrary/ui/settings/APISettingsScreen.kt`

Add new sections to the settings screen:

```kotlin
@Composable
fun APISettingsScreen(
    onNavigateBack: () -> Unit,
    modifier: Modifier = Modifier,
    viewModel: APISettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()

    var showGeminiKey by remember { mutableStateOf(false) }
    var showComicvineKey by remember { mutableStateOf(false) } // NEW
    var showGoogleBooksKey by remember { mutableStateOf(false) } // NEW
    var showGrokKey by remember { mutableStateOf(false) } // NEW
    var showOpenAIKey by remember { mutableStateOf(false) } // NEW
    
    var geminiKey by remember { mutableStateOf("") }
    var comicvineKey by remember { mutableStateOf("") } // NEW
    var googleBooksKey by remember { mutableStateOf("") } // NEW
    var grokKey by remember { mutableStateOf("") } // NEW
    var openaiKey by remember { mutableStateOf("") } // NEW

    LaunchedEffect(Unit) {
        viewModel.loadSettings()
        geminiKey = uiState.geminiApiKey ?: ""
        comicvineKey = uiState.comicvineApiKey ?: "" // NEW
        googleBooksKey = uiState.googleBooksApiKey ?: "" // NEW
        grokKey = uiState.grokApiKey ?: "" // NEW
        openaiKey = uiState.openaiApiKey ?: "" // NEW
    }

    Column(modifier = modifier.fillMaxSize()) {
        TopAppBar(
            title = { Text("API Settings") },
            navigationIcon = {
                IconButton(onClick = onNavigateBack) {
                    Icon(PhosphorIcons.ArrowLeft, contentDescription = "Back")
                }
            },
            actions = {
                // Backup button (already exists)
                IconButton(onClick = { /* backup */ }) {
                    Icon(PhosphorIcons.FloppyDisk, contentDescription = "Backup")
                }
            }
        )

        Column(
            modifier = Modifier
                .fillMaxSize()
                .verticalScroll(rememberScrollState())
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(24.dp)
        ) {
            // Security Notice
            SecurityNoticeCard()

            // === SECTION 1: METADATA & COVER APIs ===
            SectionHeader(
                title = "📚 METADATA & COVERS",
                subtitle = "Book, comic, and cover image APIs"
            )
            
            // NEW: Google Books API
            GoogleBooksAPISection(
                apiKey = googleBooksKey,
                showKey = showGoogleBooksKey,
                onKeyChanged = { googleBooksKey = it },
                onShowKeyToggle = { showGoogleBooksKey = !showGoogleBooksKey },
                onSaveKey = { viewModel.saveGoogleBooksApiKey(googleBooksKey) },
                onTestKey = { viewModel.testGoogleBooksApiKey(googleBooksKey) },
                isLoading = uiState.isLoading,
                testResult = uiState.googleBooksTestResult
            )
            
            // NEW: Comicvine API
            ComicvineAPISection(
                apiKey = comicvineKey,
                showKey = showComicvineKey,
                onKeyChanged = { comicvineKey = it },
                onShowKeyToggle = { showComicvineKey = !showComicvineKey },
                onSaveKey = { viewModel.saveComicvineApiKey(comicvineKey) },
                onTestKey = { viewModel.testComicvineApiKey(comicvineKey) },
                isLoading = uiState.isLoading,
                testResult = uiState.comicvineTestResult
            )

            Divider()

            // === SECTION 2: AI SERVICES ===
            SectionHeader(
                title = "🤖 AI SERVICES",
                subtitle = "AI for OCR, translation, and analysis"
            )
            
            // Existing: Gemini AI
            GeminiAPISection(
                apiKey = geminiKey,
                showKey = showGeminiKey,
                onKeyChanged = { geminiKey = it },
                onShowKeyToggle = { showGeminiKey = !showGeminiKey },
                onSaveKey = { viewModel.saveGeminiApiKey(geminiKey) },
                onTestKey = { viewModel.testGeminiApiKey(geminiKey) },
                isLoading = uiState.isLoading,
                testResult = uiState.geminiTestResult
            )
            
            // NEW: Grok API (Optional)
            GrokAPISection(
                apiKey = grokKey,
                showKey = showGrokKey,
                onKeyChanged = { grokKey = it },
                onShowKeyToggle = { showGrokKey = !showGrokKey },
                onSaveKey = { viewModel.saveGrokApiKey(grokKey) },
                isLoading = uiState.isLoading,
                isOptional = true
            )
            
            // NEW: OpenAI API (Optional - alternative)
            OpenAIAPISection(
                apiKey = openaiKey,
                showKey = showOpenAIKey,
                onKeyChanged = { openaiKey = it },
                onShowKeyToggle = { showOpenAIKey = !showOpenAIKey },
                onSaveKey = { viewModel.saveOpenAIApiKey(openaiKey) },
                isLoading = uiState.isLoading,
                isOptional = true
            )

            Divider()

            // Existing sections...
            ImageGeneratorSection(...)
            ArtworkAPISection(...)
            LyricsAPISection(...)
        }
    }
}

// NEW: Google Books API Section
@Composable
fun GoogleBooksAPISection(
    apiKey: String,
    showKey: Boolean,
    onKeyChanged: (String) -> Unit,
    onShowKeyToggle: () -> Unit,
    onSaveKey: () -> Unit,
    onTestKey: () -> Unit,
    isLoading: Boolean,
    testResult: String?
) {
    APIKeyCard(
        title = "Google Books API",
        description = "Access to millions of books with metadata and high-quality covers. Free tier: 1000 requests/day.",
        keyUrl = "https://console.cloud.google.com/apis/credentials",
        docsUrl = "https://developers.google.com/books/docs/v1/using",
        apiKey = apiKey,
        showKey = showKey,
        onKeyChanged = onKeyChanged,
        onShowKeyToggle = onShowKeyToggle,
        onSaveKey = onSaveKey,
        onTestKey = onTestKey,
        isLoading = isLoading,
        testResult = testResult,
        isConfigured = apiKey.isNotBlank()
    )
}

// NEW: Comicvine API Section
@Composable
fun ComicvineAPISection(
    apiKey: String,
    showKey: Boolean,
    onKeyChanged: (String) -> Unit,
    onShowKeyToggle: () -> Unit,
    onSaveKey: () -> Unit,
    onTestKey: () -> Unit,
    isLoading: Boolean,
    testResult: String?
) {
    APIKeyCard(
        title = "Comicvine API",
        description = "The IMDB of comics. Get metadata, characters, creators, and story arcs. Free tier: 200 requests/hour.",
        keyUrl = "https://comicvine.gamespot.com/api/",
        docsUrl = "https://comicvine.gamespot.com/api/documentation",
        apiKey = apiKey,
        showKey = showKey,
        onKeyChanged = onKeyChanged,
        onShowKeyToggle = onShowKeyToggle,
        onSaveKey = onSaveKey,
        onTestKey = onTestKey,
        isLoading = isLoading,
        testResult = testResult,
        isConfigured = apiKey.isNotBlank()
    )
}

// NEW: Grok API Section
@Composable
fun GrokAPISection(
    apiKey: String,
    showKey: Boolean,
    onKeyChanged: (String) -> Unit,
    onShowKeyToggle: () -> Unit,
    onSaveKey: () -> Unit,
    isLoading: Boolean,
    isOptional: Boolean = true
) {
    APIKeyCard(
        title = "xAI Grok API" + if (isOptional) " (Optional)" else "",
        description = "AI-powered book analysis and Q&A. Note: Paid API. Alternative: Use Gemini API above.",
        keyUrl = "https://x.ai/",
        docsUrl = "https://docs.x.ai/",
        apiKey = apiKey,
        showKey = showKey,
        onKeyChanged = onKeyChanged,
        onShowKeyToggle = onShowKeyToggle,
        onSaveKey = onSaveKey,
        onTestKey = null, // No test for optional
        isLoading = isLoading,
        testResult = null,
        isConfigured = apiKey.isNotBlank(),
        badge = if (isOptional) "OPTIONAL" else null
    )
}

// NEW: OpenAI API Section
@Composable
fun OpenAIAPISection(
    apiKey: String,
    showKey: Boolean,
    onKeyChanged: (String) -> Unit,
    onShowKeyToggle: () -> Unit,
    onSaveKey: () -> Unit,
    isLoading: Boolean,
    isOptional: Boolean = true
) {
    APIKeyCard(
        title = "OpenAI API" + if (isOptional) " (Optional)" else "",
        description = "Alternative AI service for translation and analysis. Alternative: Use Gemini API above.",
        keyUrl = "https://platform.openai.com/api-keys",
        docsUrl = "https://platform.openai.com/docs",
        apiKey = apiKey,
        showKey = showKey,
        onKeyChanged = onKeyChanged,
        onShowKeyToggle = onShowKeyToggle,
        onSaveKey = onSaveKey,
        onTestKey = null,
        isLoading = isLoading,
        testResult = null,
        isConfigured = apiKey.isNotBlank(),
        badge = if (isOptional) "OPTIONAL" else null
    )
}

// Reusable API Key Card Component
@Composable
fun APIKeyCard(
    title: String,
    description: String,
    keyUrl: String,
    docsUrl: String,
    apiKey: String,
    showKey: Boolean,
    onKeyChanged: (String) -> Unit,
    onShowKeyToggle: () -> Unit,
    onSaveKey: () -> Unit,
    onTestKey: (() -> Unit)?,
    isLoading: Boolean,
    testResult: String?,
    isConfigured: Boolean,
    badge: String? = null
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = if (isConfigured) 
                MaterialTheme.colorScheme.surfaceVariant 
            else 
                MaterialTheme.colorScheme.errorContainer.copy(alpha = 0.1f)
        )
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Text(
                        text = title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    
                    // Gear icon if not configured
                    if (!isConfigured) {
                        Spacer(modifier = Modifier.width(8.dp))
                        Icon(
                            PhosphorIcons.Gear,
                            contentDescription = "Needs configuration",
                            tint = MaterialTheme.colorScheme.error,
                            modifier = Modifier.size(20.dp)
                        )
                    }
                }
                
                // Status badge
                if (isConfigured) {
                    Badge(
                        containerColor = MaterialTheme.colorScheme.primary
                    ) {
                        Text("✓ Configured")
                    }
                } else if (badge != null) {
                    Badge(
                        containerColor = MaterialTheme.colorScheme.tertiary
                    ) {
                        Text(badge)
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Text(
                text = description,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // API Key Input
            OutlinedTextField(
                value = apiKey,
                onValueChange = onKeyChanged,
                label = { Text("API Key") },
                modifier = Modifier.fillMaxWidth(),
                visualTransformation = if (showKey) 
                    VisualTransformation.None 
                else 
                    PasswordVisualTransformation(),
                trailingIcon = {
                    IconButton(onClick = onShowKeyToggle) {
                        Icon(
                            if (showKey) PhosphorIcons.EyeSlash else PhosphorIcons.Eye,
                            contentDescription = if (showKey) "Hide" else "Show"
                        )
                    }
                },
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password)
            )
            
            // Test result
            if (testResult != null) {
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = testResult,
                    style = MaterialTheme.typography.bodySmall,
                    color = if (testResult.startsWith("✅")) 
                        MaterialTheme.colorScheme.primary 
                    else 
                        MaterialTheme.colorScheme.error
                )
            }
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Action buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Button(
                    onClick = onSaveKey,
                    modifier = Modifier.weight(1f),
                    enabled = !isLoading && apiKey.isNotBlank()
                ) {
                    if (isLoading) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(16.dp),
                            color = MaterialTheme.colorScheme.onPrimary
                        )
                    } else {
                        Text("Save")
                    }
                }
                
                if (onTestKey != null) {
                    OutlinedButton(
                        onClick = onTestKey,
                        modifier = Modifier.weight(1f),
                        enabled = !isLoading && apiKey.isNotBlank()
                    ) {
                        Text("Test")
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            // Links
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                val context = LocalContext.current
                
                TextButton(
                    onClick = {
                        context.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(keyUrl)))
                    }
                ) {
                    Text("Get API Key →")
                }
                
                TextButton(
                    onClick = {
                        context.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(docsUrl)))
                    }
                ) {
                    Text("Documentation")
                }
            }
        }
    }
}

@Composable
fun SectionHeader(
    title: String,
    subtitle: String
) {
    Column {
        Text(
            text = title,
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = subtitle,
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}
```

---

### Step 4: Update Services to Use API Keys

Each service should fetch the API key from the repository:

```kotlin
// Example: ComicvineService
@Singleton
class ComicvineMetadataSource @Inject constructor(
    private val httpClient: OkHttpClient,
    private val apiKeyRepository: APIKeyRepository // Inject repository
) : ComicMetadataSource {
    
    override suspend fun searchSeries(seriesName: String): List<ComicSeries> {
        // Get API key from settings
        val apiKey = apiKeyRepository.getComicvineApiKey()
            ?: throw IllegalStateException("Comicvine API key not configured")
        
        val url = "https://comicvine.gamespot.com/api/search/" +
                  "?api_key=$apiKey" +
                  "&format=json&resources=volume" +
                  "&query=${URLEncoder.encode(seriesName, "UTF-8")}"
        
        // ... rest of implementation
    }
    
    suspend fun testApiKey(apiKey: String): Result<Boolean> {
        return try {
            val url = "https://comicvine.gamespot.com/api/volumes/" +
                      "?api_key=$apiKey&format=json&limit=1"
            
            val response = httpClient.newCall(
                Request.Builder().url(url).build()
            ).await()
            
            if (response.isSuccessful) {
                Result.success(true)
            } else {
                Result.failure(Exception("Invalid API key: ${response.code}"))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}

// Example: GoogleBooksService
@Singleton
class GoogleBooksMetadataSource @Inject constructor(
    private val httpClient: OkHttpClient,
    private val apiKeyRepository: APIKeyRepository
) : MetadataSource {
    
    override suspend fun search(
        query: String?,
        isbn: String?,
        title: String?,
        author: String?
    ): List<MetadataResult> {
        val apiKey = apiKeyRepository.getGoogleBooksApiKey()
        
        // API key is optional for Google Books, but increases rate limit
        val url = buildString {
            append("https://www.googleapis.com/books/v1/volumes?q=")
            append(buildQuery(query, isbn, title, author))
            if (apiKey != null) {
                append("&key=$apiKey")
            }
        }
        
        // ... rest of implementation
    }
    
    suspend fun testApiKey(apiKey: String): Result<Boolean> {
        return try {
            val url = "https://www.googleapis.com/books/v1/volumes" +
                      "?q=test&key=$apiKey&maxResults=1"
            
            val response = httpClient.newCall(
                Request.Builder().url(url).build()
            ).await()
            
            if (response.isSuccessful) {
                Result.success(true)
            } else {
                Result.failure(Exception("Invalid API key: ${response.code}"))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}
```

---

## ✅ Integration Checklist

### APIKeyRepository
- [ ] Add `KEY_COMICVINE_API` constant
- [ ] Add `getComicvineApiKey()` method
- [ ] Add `setComicvineApiKey()` method
- [ ] Add `hasComicvineApiKey()` method
- [ ] Add `KEY_GOOGLE_BOOKS_API` constant
- [ ] Add `getGoogleBooksApiKey()` method
- [ ] Add `setGoogleBooksApiKey()` method
- [ ] Add `hasGoogleBooksApiKey()` method
- [ ] Add `KEY_GROK_API` constant (optional)
- [ ] Add Grok API methods (optional)
- [ ] Add `KEY_OPENAI_API` constant (optional)
- [ ] Add OpenAI API methods (optional)
- [ ] Add `getMissingApiKeys()` helper method

### APISettingsViewModel
- [ ] Add `comicvineApiKey` to UIState
- [ ] Add `googleBooksApiKey` to UIState
- [ ] Add `grokApiKey` to UIState (optional)
- [ ] Add `openaiApiKey` to UIState (optional)
- [ ] Add test result fields to UIState
- [ ] Load keys in `loadSettings()`
- [ ] Add `saveComicvineApiKey()` method
- [ ] Add `testComicvineApiKey()` method
- [ ] Add `saveGoogleBooksApiKey()` method
- [ ] Add `testGoogleBooksApiKey()` method
- [ ] Add `saveGrokApiKey()` method (optional)
- [ ] Add `saveOpenAIApiKey()` method (optional)

### APISettingsScreen
- [ ] Add state variables for new keys
- [ ] Add show/hide toggles for new keys
- [ ] Load keys in LaunchedEffect
- [ ] Add "METADATA & COVERS" section header
- [ ] Add GoogleBooksAPISection
- [ ] Add ComicvineAPISection
- [ ] Add "AI SERVICES" section header (reorganize)
- [ ] Add GrokAPISection (optional)
- [ ] Add OpenAIAPISection (optional)
- [ ] Create reusable APIKeyCard component
- [ ] Add gear icons for unconfigured keys
- [ ] Add status badges

### Services
- [ ] Inject APIKeyRepository into ComicvineService
- [ ] Fetch Comicvine key from repository
- [ ] Add `testApiKey()` to ComicvineService
- [ ] Inject APIKeyRepository into GoogleBooksService
- [ ] Fetch Google Books key from repository
- [ ] Add `testApiKey()` to GoogleBooksService
- [ ] Handle missing API key errors gracefully

---

## 🎯 Usage Examples

### In Your Services

```kotlin
// Check if key is configured before using
class MyFeatureViewModel @Inject constructor(
    private val apiKeyRepository: APIKeyRepository,
    private val comicvineService: ComicvineService
) : ViewModel() {
    
    fun enrichComic() {
        viewModelScope.launch {
            // Check if API key is configured
            if (!apiKeyRepository.hasComicvineApiKey()) {
                _uiState.value = UiState.Error(
                    "Comicvine API key not configured. " +
                    "Go to Settings → API Settings to add your key."
                )
                return@launch
            }
            
            // Use service
            val result = comicvineService.searchSeries("Batman")
            // ...
        }
    }
}
```

### Prompt User to Configure

```kotlin
// Show setup prompt on first use
@Composable
fun FeatureScreen() {
    val apiKeyRepository = remember { /* inject */ }
    var showSetupPrompt by remember { mutableStateOf(false) }
    
    LaunchedEffect(Unit) {
        val missingKeys = apiKeyRepository.getMissingApiKeys()
        if (missingKeys.isNotEmpty()) {
            showSetupPrompt = true
        }
    }
    
    if (showSetupPrompt) {
        AlertDialog(
            onDismissRequest = { showSetupPrompt = false },
            title = { Text("API Keys Required") },
            text = {
                Text("The following API keys need to be configured:\n\n" +
                     missingKeys.joinToString("\n") { "• $it" })
            },
            confirmButton = {
                Button(onClick = { navigateToSettings() }) {
                    Text("Go to Settings")
                }
            },
            dismissButton = {
                TextButton(onClick = { showSetupPrompt = false }) {
                    Text("Later")
                }
            }
        )
    }
}
```

---

## 🔒 Security Notes

- ✅ All API keys stored in `EncryptedSharedPreferences` (AES256_GCM)
- ✅ Keys backed up with double encryption via `SettingsBackupService`
- ✅ Keys never logged or exposed in plain text
- ✅ Password visual transformation in UI
- ✅ Android Keystore for master key
- ✅ Atomic backup/restore operations

---

## 📊 Summary

**What's Being Added**:
- 4 new API keys (2 required, 2 optional)
- Integrated into existing settings system
- Reusable UI components
- Test/validate functionality
- Gear icons for unconfigured keys
- Status badges for configured keys

**What Already Exists**:
- ✅ APIKeyRepository
- ✅ Encrypted storage
- ✅ Backup/restore
- ✅ Settings UI
- ✅ Visual indicators

**Timeline**: 1-2 days to integrate all keys

---

**Status**: ✅ Ready to implement  
**Next**: Start with Step 1 (APIKeyRepository)
