# CleverFerret Developer Guide

## Quick Start

### Prerequisites
- Android Studio Arctic Fox or later
- JDK 11 or higher
- Android SDK API 26-36
- Gradle 8.13 (auto-downloaded)
- Node.js 18+ (for PWA development)

### Building the Android App

```bash
# Clean build
./gradlew clean

# Debug build
./gradlew assembleDebug

# Release build
./gradlew assembleRelease

# Run tests
./gradlew test

# Run linter
./gradlew lint
```

### Building the PWA

```bash
cd pwa-demo

# Install dependencies
npm install

# Development server
npm run dev

# Production build
npm run build

# Preview production build
npm run preview
```

---

## New Utilities Guide

### ValidationUtils

Located at: `CleverFerret/src/main/java/com/universalmedialibrary/utils/ValidationUtils.kt`

#### Usage Examples

```kotlin
import com.universalmedialibrary.utils.ValidationUtils

// Validate library name
val error = ValidationUtils.validateLibraryName(libraryName)
if (error != null) {
    showError(error)
    return
}

// Validate directory
val pathError = ValidationUtils.validateDirectory(path)
if (pathError != null) {
    showError(pathError)
    return
}

// Validate email
val emailError = ValidationUtils.validateEmail(email)
if (emailError != null) {
    showError(emailError)
    return
}

// Sanitize user input
val cleanQuery = ValidationUtils.sanitizeInput(userQuery)
```

#### Available Validators
- `validateLibraryName(name: String): String?`
- `validatePath(path: String): String?`
- `validateDirectory(path: String): String?`
- `validateEmail(email: String): String?`
- `validateUrl(url: String): String?`
- `validateApiKey(key: String): String?`
- `validateIsbn(isbn: String): String?`
- `validateFileSize(sizeBytes: Long, maxSizeMB: Int): String?`
- `validatePassword(password: String): String?`
- `validatePort(port: Int): String?`
- `sanitizeInput(input: String): String`
- `validateSearchQuery(query: String): String?`

### ErrorHandler

Located at: `CleverFerret/src/main/java/com/universalmedialibrary/utils/ErrorHandler.kt`

#### Usage Examples

```kotlin
import com.universalmedialibrary.utils.ErrorHandler

// Convert exception to user-friendly message
try {
    riskyOperation()
} catch (e: Exception) {
    val message = ErrorHandler.getUserFriendlyMessage(e)
    showToast(message)
}

// Log error with context
try {
    processFile(file)
} catch (e: Exception) {
    ErrorHandler.logError(
        tag = "FileProcessor",
        message = "Failed to process file",
        error = e,
        context = mapOf(
            "fileName" to file.name,
            "fileSize" to file.length()
        )
    )
}

// Retry with exponential backoff
viewModelScope.launch {
    val result = ErrorHandler.withRetry(maxAttempts = 3) {
        fetchDataFromApi()
    }
    
    result.onSuccess { data ->
        updateUI(data)
    }.onFailure { error ->
        showError(error.message)
    }
}

// Create detailed error report
try {
    complexOperation()
} catch (e: Exception) {
    val report = ErrorHandler.createErrorReport(
        error = e,
        context = mapOf(
            "userId" to userId,
            "operation" to "complexOperation",
            "timestamp" to System.currentTimeMillis()
        )
    )
    saveErrorReport(report)
}
```

---

## Service Integration Guide

### MediaScannerService

Use for scanning libraries for media files.

```kotlin
// Scan a specific library
val intent = Intent(context, MediaScannerService::class.java).apply {
    action = MediaScannerService.ACTION_SCAN_LIBRARY
    putExtra(MediaScannerService.EXTRA_LIBRARY_ID, libraryId)
    putExtra(MediaScannerService.EXTRA_SCAN_PATH, libraryPath)
}
context.startService(intent)

// Scan all media
val intent = Intent(context, MediaScannerService::class.java).apply {
    action = MediaScannerService.ACTION_SCAN_ALL
}
context.startService(intent)
```

### CalibreImportService

Use for importing Calibre libraries.

```kotlin
val intent = Intent(context, CalibreImportService::class.java).apply {
    action = CalibreImportService.ACTION_IMPORT_CALIBRE
    putExtra(CalibreImportService.EXTRA_LIBRARY_ID, libraryId)
    putExtra(CalibreImportService.EXTRA_CALIBRE_PATH, calibrePath)
}
context.startService(intent)
```

### GeminiTtsService

Use for text-to-speech with Google's Gemini voices.

```kotlin
@Inject lateinit var ttsService: GeminiTtsService

// Set API key (from settings)
ttsService.setApiKey(geminiApiKey)

// Initialize
lifecycleScope.launch {
    val success = ttsService.initialize()
    if (success) {
        // Start speaking
        ttsService.speak("Hello, this is a test.")
    }
}

// Control playback
ttsService.pause()
ttsService.resume()
ttsService.stop()

// Adjust settings
ttsService.setSpeechRate(1.5f)
ttsService.setPitch(1.0f)
ttsService.setLanguage("en-US")
```

---

## Architecture Overview

### Android App

```
CleverFerret/
├── src/main/java/com/universalmedialibrary/
│   ├── data/           # Data layer
│   │   ├── local/      # Room database entities and DAOs
│   │   └── repository/ # Repository pattern implementations
│   ├── di/             # Dependency injection modules
│   ├── services/       # Background services
│   │   ├── tts/        # Text-to-speech services
│   │   ├── media/      # Media playback services
│   │   └── ...
│   ├── ui/             # UI layer (Compose)
│   │   ├── reader/     # E-reader screens
│   │   ├── player/     # Media player screens
│   │   ├── library/    # Library management
│   │   └── ...
│   └── utils/          # Utility classes (NEW!)
```

### PWA

```
pwa-demo/
├── src/
│   ├── components/     # React components
│   ├── contexts/       # React contexts
│   ├── data/           # Data layer
│   │   ├── local/      # IndexedDB entities
│   │   └── repository/ # Repository implementations
│   ├── services/       # Service layer
│   ├── ui/             # UI screens
│   └── utils/          # Utility functions
```

---

## Best Practices

### Input Validation

Always validate user input before processing:

```kotlin
fun createLibrary(name: String, path: String) {
    // Validate inputs
    ValidationUtils.validateLibraryName(name)?.let { error ->
        showError(error)
        return
    }
    
    ValidationUtils.validateDirectory(path)?.let { error ->
        showError(error)
        return
    }
    
    // Sanitize if needed
    val cleanName = ValidationUtils.sanitizeInput(name)
    
    // Proceed with creation
    doCreateLibrary(cleanName, path)
}
```

### Error Handling

Always handle errors gracefully:

```kotlin
viewModelScope.launch {
    try {
        _uiState.value = UiState.Loading
        val result = repository.fetchData()
        _uiState.value = UiState.Success(result)
    } catch (e: Exception) {
        ErrorHandler.logError(
            message = "Failed to fetch data",
            error = e,
            context = mapOf("operation" to "fetchData")
        )
        _uiState.value = UiState.Error(
            ErrorHandler.getUserFriendlyMessage(e)
        )
    }
}
```

### Resource Management

Always clean up resources:

```kotlin
class MyService : Service() {
    private var mediaPlayer: MediaPlayer? = null
    
    override fun onDestroy() {
        super.onDestroy()
        mediaPlayer?.release()
        mediaPlayer = null
    }
}
```

### Dependency Injection

Use Hilt for dependency injection:

```kotlin
@HiltViewModel
class MyViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val repository: MyRepository
) : ViewModel() {
    // Implementation
}
```

---

## Testing

### Unit Tests

```kotlin
class ValidationUtilsTest {
    @Test
    fun `validateLibraryName returns error for empty name`() {
        val error = ValidationUtils.validateLibraryName("")
        assertNotNull(error)
        assertEquals("Library name cannot be empty", error)
    }
    
    @Test
    fun `validateLibraryName returns null for valid name`() {
        val error = ValidationUtils.validateLibraryName("My Library")
        assertNull(error)
    }
}
```

### Integration Tests

```kotlin
@HiltAndroidTest
class LibraryManagementViewModelTest {
    @get:Rule
    val hiltRule = HiltAndroidRule(this)
    
    @Inject
    lateinit var repository: LibraryRepository
    
    @Test
    fun createLibrary_insertsLibraryToDatabase() {
        // Test implementation
    }
}
```

---

## Debugging

### Logging

Use ErrorHandler for consistent logging:

```kotlin
ErrorHandler.logInfo(
    tag = "MyFeature",
    message = "Operation started",
    context = mapOf("param" to value)
)

ErrorHandler.logWarning(
    tag = "MyFeature",
    message = "Potential issue detected"
)

ErrorHandler.logError(
    tag = "MyFeature",
    message = "Operation failed",
    error = exception
)
```

### Common Issues

#### Issue: MediaPlayer not playing audio
**Solution**: Check audio file format, ensure MediaPlayer is properly initialized

#### Issue: Library scan not finding files
**Solution**: Check storage permissions, verify file extensions

#### Issue: TTS not speaking
**Solution**: Verify API key is set, check network connection

---

## Performance Tips

1. **Use background services** for long-running operations
2. **Implement pagination** for large lists
3. **Cache frequently accessed data**
4. **Use Flow for reactive updates**
5. **Profile before optimizing**

---

## Security Checklist

- ✅ Validate all user inputs
- ✅ Sanitize database queries
- ✅ Check file permissions
- ✅ Validate file paths (prevent traversal)
- ✅ Use HTTPS for network requests
- ✅ Encrypt sensitive data
- ✅ Validate API keys before use

---

## Deployment

### Android

1. Update version in `build.gradle.kts`
2. Generate signed APK: `./gradlew assembleRelease`
3. Test on multiple devices
4. Upload to Play Store

### PWA

1. Update version in `package.json`
2. Build: `npm run build`
3. Test production build: `npm run preview`
4. Deploy to hosting service

---

## Contributing

1. Create feature branch
2. Write tests
3. Implement feature
4. Update documentation
5. Submit pull request

---

## Resources

- [Android Documentation](https://developer.android.com)
- [Jetpack Compose](https://developer.android.com/jetpack/compose)
- [Hilt](https://dagger.dev/hilt/)
- [Room](https://developer.android.com/training/data-storage/room)
- [Material Design 3](https://m3.material.io/)

---

**Last Updated**: 2025-10-20  
**Version**: 1.0
