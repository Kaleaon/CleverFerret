# On-Device AI Comic Translator Module

## Overview

This module provides on-demand, AI-powered translations of comic book pages using Gemini 2.5 Pro for visual analysis and on-device ML Kit for translation. The entire process runs within the app, with users providing only their Gemini API key for secure, private operation.

## Architecture

### Core Components

1. **ComicProcessorRepository**: Main orchestrator that handles the translation workflow
2. **ComicTranslationCache**: Room database entity for offline caching
3. **ComicTranslationCacheDao**: Data access object for cache operations
4. **ComicTranslationApiKeyManager**: Secure storage for user-provided API keys
5. **ComicTranslationModule**: Hilt dependency injection configuration

### Data Models

- **ComicPageResponse**: Root response containing all panels
- **Panel**: Individual panel with corners and text elements
- **TextElement**: Speech bubble/text with translation and metadata

## Features

✅ **Fully On-Device Logic**: No backend server required  
✅ **User-Provided API Key**: Only Gemini key needed, securely encrypted  
✅ **AI-Powered Analysis**: Gemini 2.5 Pro for visual analysis  
✅ **On-Device Translation**: ML Kit for completely offline translation  
✅ **Offline Caching**: Room database for instant offline access  
✅ **Language Selection**: Choose from 12 supported languages  
✅ **Reader Integration**: Built-in UI controls and overlay rendering  

## Setup Instructions

### 1. Dependencies (Already Added)

The following dependencies are included in `build.gradle.kts`:

```kotlin
// Gemini API - handles OCR, translation, and all AI tasks
implementation("com.google.ai.client.generativeai:generativeai:0.9.0")

// Room Database (already configured)
implementation("androidx.room:room-runtime:2.8.2")
implementation("androidx.room:room-ktx:2.8.2")
ksp("androidx.room:room-compiler:2.8.2")

// Kotlinx Serialization (already configured)
implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.7.3")
```

### 2. Permissions (Already Added)

Internet permission is already in `AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.INTERNET" />
```

### 3. Database Migration

The database has been updated to version 25 with the `comic_translation_cache` table. The migration is automatic.

## Usage Guide

### Step 1: Configure API Keys

First, users need to provide their API keys:

```kotlin
@Inject lateinit var apiKeyManager: ComicTranslationApiKeyManager

// In your settings screen
fun saveApiKeys(geminiKey: String, translateKey: String) {
    apiKeyManager.setGeminiApiKey(geminiKey)
    apiKeyManager.setTranslateApiKey(translateKey)
}

// Check if keys are configured
fun areKeysReady(): Boolean {
    return apiKeyManager.areKeysConfigured()
}
```

### Step 2: Inject the Repository

```kotlin
@AndroidEntryPoint
class ComicReaderActivity : ComponentActivity() {
    
    @Inject lateinit var comicRepository: ComicProcessorRepository?
    @Inject lateinit var apiKeyManager: ComicTranslationApiKeyManager
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Check if API keys are configured
        if (!apiKeyManager.areKeysConfigured()) {
            // Show setup screen to collect API keys
            showApiKeySetupScreen()
            return
        }
        
        // Repository is now available
        setupComicReader()
    }
}
```

### Step 3: Process a Comic Page

```kotlin
// In your ViewModel
@HiltViewModel
class ComicReaderViewModel @Inject constructor(
    private val comicRepository: ComicProcessorRepository?
) : ViewModel() {
    
    fun translatePage(
        pageBitmap: Bitmap,
        comicId: String,
        pageNumber: Int,
        targetLanguage: String = "en"
    ) {
        viewModelScope.launch {
            // Show loading indicator
            _isLoading.value = true
            
            val result = comicRepository?.processPage(
                imageBitmap = pageBitmap,
                comicId = comicId,
                pageNumber = pageNumber,
                userLanguage = targetLanguage
            )
            
            result?.onSuccess { response ->
                // Draw translation overlay
                drawTranslationOverlay(response)
            }?.onFailure { error ->
                // Show error message
                _errorMessage.value = error.message
            }
            
            _isLoading.value = false
        }
    }
}
```

### Step 4: Render Translation Overlay

```kotlin
fun drawTranslationOverlay(response: ComicPageResponse) {
    // Create a Canvas overlay on top of the comic image
    val overlay = createOverlayCanvas()
    
    // Loop through each panel
    response.panels.forEach { panel ->
        // Draw panel outline (optional, for debugging)
        drawPanelOutline(overlay, panel.panelCorners)
        
        // Draw each text element
        panel.textElements.forEach { textElement ->
            // Determine the shape and style
            val shape = when (textElement.shapeType) {
                "spherical" -> SpeechBubbleShape.Spherical
                "square" -> SpeechBubbleShape.Square
                "textbox" -> SpeechBubbleShape.Textbox
                "no_bubble" -> SpeechBubbleShape.None
                else -> SpeechBubbleShape.Square
            }
            
            // Apply rotation if needed
            val rotation = textElement.rotationAngle
            
            // Draw the translated text
            drawTextElement(
                overlay = overlay,
                corners = textElement.elementCorners,
                text = textElement.translatedText,
                shape = shape,
                rotation = rotation
            )
        }
    }
    
    // Show/hide overlay based on toggle
    overlay.visibility = if (translationEnabled) View.VISIBLE else View.GONE
}
```

### Step 5: Toggle Translation On/Off

```kotlin
// Add a toggle button to your UI
@Composable
fun TranslationToggle(
    enabled: Boolean,
    onToggle: (Boolean) -> Unit
) {
    Switch(
        checked = enabled,
        onCheckedChange = onToggle,
        modifier = Modifier.padding(8.dp)
    )
}

// In your UI
var translationEnabled by remember { mutableStateOf(false) }

TranslationToggle(
    enabled = translationEnabled,
    onToggle = { enabled ->
        translationEnabled = enabled
        // Show/hide translation overlay
        updateOverlayVisibility(enabled)
    }
)
```

## Cache Management

The module automatically caches translations for offline use:

```kotlin
// Check if a page is cached
suspend fun isPageCached(comicId: String, pageNumber: Int): Boolean {
    return comicRepository?.isPageCached(comicId, pageNumber) ?: false
}

// Get cached page count
suspend fun getCachedPageCount(comicId: String): Int {
    return comicRepository?.getCachedPageCount(comicId) ?: 0
}

// Clear cache for a specific comic
suspend fun clearComicCache(comicId: String) {
    comicRepository?.clearCache(comicId)
}

// Clear all cached translations
suspend fun clearAllCache() {
    comicRepository?.clearAllCache()
}
```

## API Keys Setup

### Getting API Keys

1. **Gemini API Key**:
   - Visit https://makersuite.google.com/app/apikey
   - Create a new API key
   - Copy the key

2. **Google Cloud Translation API Key**:
   - Visit https://console.cloud.google.com/
   - Create a new project
   - Enable the Cloud Translation API
   - Create credentials (API key)
   - Copy the key

### Security Notes

- Keys are stored using Android's `EncryptedSharedPreferences`
- Keys are encrypted using the Android Keystore
- Keys are never logged or transmitted
- Users can clear keys at any time

## Error Handling

The module handles various error scenarios:

```kotlin
result.onFailure { error ->
    when (error) {
        is NetworkException -> {
            // No internet connection
            showMessage("No internet connection. Showing cached translations.")
        }
        is ApiKeyException -> {
            // Invalid API key
            showMessage("Invalid API key. Please check your settings.")
        }
        is QuotaExceededException -> {
            // API quota exceeded
            showMessage("API quota exceeded. Using cached translations.")
        }
        else -> {
            // Generic error
            showMessage("Translation failed: ${error.message}")
        }
    }
}
```

## Performance Considerations

- **First Load**: 5-15 seconds (API calls + processing)
- **Cached Load**: < 1 second (database read)
- **Cache Size**: ~100KB per page average
- **Offline Support**: Full functionality with cached pages

## Language Support

The module supports all languages supported by Google Cloud Translation API:

```kotlin
// Common language codes
val languages = mapOf(
    "en" to "English",
    "es" to "Spanish",
    "ja" to "Japanese",
    "ko" to "Korean",
    "zh" to "Chinese",
    "fr" to "French",
    "de" to "German",
    "it" to "Italian",
    "pt" to "Portuguese",
    "ru" to "Russian"
)

// Use language code when processing
comicRepository?.processPage(
    imageBitmap = pageBitmap,
    comicId = comicId,
    pageNumber = pageNumber,
    userLanguage = "ja" // Japanese
)
```

## Testing

### Unit Tests Example

```kotlin
@Test
fun `test page caching`() = runTest {
    // Mock data
    val bitmap = createTestBitmap()
    val comicId = "test-comic-001"
    val pageNumber = 1
    
    // Process page
    val result = repository.processPage(bitmap, comicId, pageNumber, "en")
    assertTrue(result.isSuccess)
    
    // Verify cached
    val isCached = repository.isPageCached(comicId, pageNumber)
    assertTrue(isCached)
}
```

## Troubleshooting

### Common Issues

1. **"API key not configured" error**
   - Ensure user has entered both API keys in settings
   - Check `apiKeyManager.areKeysConfigured()`

2. **Translation not working**
   - Verify internet connection
   - Check API key validity
   - Verify API quotas not exceeded

3. **Slow performance**
   - First translation requires API calls (5-15s normal)
   - Subsequent views use cache (instant)
   - Consider background pre-processing for multi-page comics

4. **Poor translation quality**
   - Gemini AI depends on image quality
   - Ensure high-resolution comic images
   - Some artistic fonts may be difficult to OCR

## Future Enhancements

- [ ] Batch processing for multiple pages
- [ ] Pre-download translations for entire comic
- [ ] Custom translation editing
- [ ] Alternative OCR engines
- [ ] UI templates for different bubble styles
- [ ] Reading direction detection (manga vs western)

## Support

For issues or questions about this module, refer to:
- Gemini API docs: https://ai.google.dev/docs
- Google Cloud Translation: https://cloud.google.com/translate/docs
- Room Database: https://developer.android.com/training/data-storage/room

## License

This module is part of the CleverFerret Media Library app.
