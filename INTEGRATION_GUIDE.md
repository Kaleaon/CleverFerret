# Comic Translation Module - Integration Guide

## Quick Start

This guide shows you how to integrate the comic translation module into your comic reader.

## What's Been Added

✅ **Gemini 2.5 Pro** - Latest AI model for improved visual analysis  
✅ **ML Kit Translation** - On-device translation (no API key needed)  
✅ **Language Selection** - 12 languages available in settings  
✅ **Reader UI Components** - FAB controls and canvas overlay  
✅ **Automatic Caching** - Language-specific offline cache  

## Step 1: Add Navigation Route

Add the settings screen to your navigation graph:

```kotlin
// In your NavHost
composable("comic_translation_settings") {
    ComicTranslationSettingsScreen(
        onNavigateBack = { navController.popBackStack() }
    )
}
```

## Step 2: Add Settings Menu Item

Add a menu item to navigate to settings:

```kotlin
// In your settings/menu screen
MenuItem(
    icon = Icons.Default.Language,
    title = "Comic Translation",
    subtitle = "AI-powered comic page translation",
    onClick = { navController.navigate("comic_translation_settings") }
)
```

## Step 3: Integrate in Comic Reader

### Basic Integration

```kotlin
@Composable
fun ComicReaderScreen(
    comicId: String,
    pageNumber: Int,
    navController: NavController
) {
    val translationViewModel: ComicReaderTranslationViewModel = hiltViewModel()
    var pageBitmap by remember { mutableStateOf<Bitmap?>(null) }
    
    // Load your comic page bitmap
    LaunchedEffect(pageNumber) {
        pageBitmap = loadComicPage(comicId, pageNumber)
    }
    
    Box(modifier = Modifier.fillMaxSize()) {
        // Your comic page display
        pageBitmap?.let { bitmap ->
            Image(
                bitmap = bitmap.asImageBitmap(),
                contentDescription = "Comic page $pageNumber",
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Fit
            )
            
            // Translation overlay
            if (translationViewModel.translationEnabled &&
                translationViewModel.translationData != null) {
                ComicTranslationOverlay(
                    translationData = translationViewModel.translationData!!,
                    imageWidth = bitmap.width.toFloat(),
                    imageHeight = bitmap.height.toFloat(),
                    showPanelOutlines = false // Set true for debugging
                )
            }
        }
        
        // Translation controls (bottom-right FAB)
        ComicReaderTranslationControls(
            viewModel = translationViewModel,
            onOpenSettings = {
                navController.navigate("comic_translation_settings")
            },
            modifier = Modifier
                .align(Alignment.BottomEnd)
                .padding(16.dp)
        )
        
        // Status badge (top-right, optional)
        TranslationStatusBadge(
            isEnabled = translationViewModel.translationEnabled,
            isLoading = translationViewModel.isLoading,
            hasData = translationViewModel.translationData != null,
            modifier = Modifier
                .align(Alignment.TopEnd)
                .padding(16.dp)
        )
    }
    
    // Trigger translation when enabled
    LaunchedEffect(
        translationViewModel.translationEnabled,
        pageNumber,
        pageBitmap
    ) {
        if (translationViewModel.translationEnabled && pageBitmap != null) {
            translationViewModel.translatePage(
                pageBitmap = pageBitmap!!,
                comicId = comicId,
                pageNumber = pageNumber,
                targetLanguage = "en" // TODO: Get from user preferences
            )
        }
    }
}
```

### Advanced Integration with User Preferences

```kotlin
@Composable
fun ComicReaderScreen(
    comicId: String,
    pageNumber: Int,
    navController: NavController,
    preferencesViewModel: PreferencesViewModel = hiltViewModel()
) {
    val translationViewModel: ComicReaderTranslationViewModel = hiltViewModel()
    val selectedLanguage by preferencesViewModel.translationLanguage.collectAsState()
    var pageBitmap by remember { mutableStateOf<Bitmap?>(null) }
    
    // ... (same as basic, but pass selectedLanguage to translatePage)
    
    LaunchedEffect(
        translationViewModel.translationEnabled,
        pageNumber,
        pageBitmap,
        selectedLanguage
    ) {
        if (translationViewModel.translationEnabled && pageBitmap != null) {
            translationViewModel.translatePage(
                pageBitmap = pageBitmap!!,
                comicId = comicId,
                pageNumber = pageNumber,
                targetLanguage = selectedLanguage
            )
        }
    }
}
```

## Step 4: Save User Preferences

Store the selected language in DataStore:

```kotlin
// In your PreferencesManager or Repository
class TranslationPreferences @Inject constructor(
    private val dataStore: DataStore<Preferences>
) {
    companion object {
        val TRANSLATION_LANGUAGE = stringPreferencesKey("translation_language")
    }
    
    val translationLanguage: Flow<String> = dataStore.data
        .map { preferences ->
            preferences[TRANSLATION_LANGUAGE] ?: "en"
        }
    
    suspend fun setTranslationLanguage(languageCode: String) {
        dataStore.edit { preferences ->
            preferences[TRANSLATION_LANGUAGE] = languageCode
        }
    }
}
```

Update settings screen to save preference:

```kotlin
fun saveKeys() {
    viewModelScope.launch {
        // ... existing save logic
        
        // Save language preference
        translationPreferences.setTranslationLanguage(selectedLanguage)
        
        areKeysConfigured = true
        saveStatus = SaveStatus.Success
    }
}
```

## Step 5: Handle Reader Toolbar Integration

If you have a reader toolbar, you can add a translation button there:

```kotlin
@Composable
fun ReaderToolbar(
    onTranslationToggle: () -> Unit,
    translationEnabled: Boolean
) {
    TopAppBar(
        title = { Text("Comic Reader") },
        actions = {
            IconButton(onClick = onTranslationToggle) {
                Icon(
                    Icons.Default.Language,
                    contentDescription = "Toggle translation",
                    tint = if (translationEnabled) {
                        MaterialTheme.colorScheme.primary
                    } else {
                        LocalContentColor.current
                    }
                )
            }
        }
    )
}
```

## UI Components Overview

### 1. ComicReaderTranslationControls
Floating action button with controls:
- **Main FAB**: Toggle translation on/off
- **Settings FAB**: Opens settings (when not configured)
- **Retry FAB**: Retry translation (on error)
- **Loading Card**: Shows progress
- **Error Card**: Shows error messages

### 2. ComicTranslationOverlay
Canvas-based overlay that renders:
- Translated text in speech bubbles
- Different shapes (oval, square, textbox)
- Rotated text support
- Auto-sized fonts
- Semi-transparent backgrounds

### 3. TranslationStatusBadge
Small badge showing:
- "Translating..." with spinner
- "Translated" when done
- Translation icon

## Customization Options

### Change Overlay Appearance

```kotlin
// In ComicTranslationOverlayCanvas.kt
// Modify these values:

// Background opacity
val backgroundColor = MaterialTheme.colorScheme.surface.copy(alpha = 0.95f)

// Text color
val textColor = MaterialTheme.colorScheme.onSurface

// Outline color (for debugging)
val outlineColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.3f)
```

### Adjust Font Sizing

```kotlin
// In ComicTranslationOverlayCanvas.kt
private fun calculateFontSize(bubbleHeight: Float): TextUnit {
    val baseFontSize = (bubbleHeight * 0.4f).coerceIn(12f, 24f)
    return baseFontSize.sp
}
```

### Enable Panel Outlines (Debug Mode)

```kotlin
ComicTranslationOverlay(
    translationData = data,
    imageWidth = width,
    imageHeight = height,
    showPanelOutlines = true // Shows panel borders
)
```

## Error Handling

The module automatically handles:
- ✅ Corrupted cache (auto-deletes and retries)
- ✅ Network errors (shows error message)
- ✅ API key not configured (shows settings button)
- ✅ Translation failures (allows retry)

## Performance Tips

1. **Cache First**: Always check cache before translating
```kotlin
val isCached = repository.isPageCached(comicId, pageNumber, language)
if (isCached) {
    // Load from cache instantly
}
```

2. **Pre-download ML Kit Models**: Download translation models in advance
```kotlin
// In your app initialization
val translator = Translation.getClient(options)
translator.downloadModelIfNeeded().await()
```

3. **Batch Operations**: For multiple pages, consider background processing
```kotlin
viewModelScope.launch(Dispatchers.IO) {
    (1..totalPages).forEach { page ->
        repository.processPage(getBitmap(page), comicId, page, language)
    }
}
```

## Troubleshooting

### "Translation not configured" error
- User needs to add Gemini API key in settings
- Navigate them to settings screen

### Slow first translation
- First translation requires:
  - Gemini AI call (3-10 seconds)
  - ML Kit model download (one-time, 30-50MB)
  - Subsequent pages are instant (cache)

### Wrong language displayed
- Check that correct language code is passed
- Verify language preference is saved/loaded correctly

### Overlay not showing
- Verify `translationEnabled` is true
- Check that `translationData` is not null
- Ensure bitmap dimensions match overlay dimensions

## Testing Checklist

- [ ] Navigate to settings from menu
- [ ] Enter Gemini API key
- [ ] Select target language
- [ ] Save settings
- [ ] Open comic reader
- [ ] Toggle translation on
- [ ] Verify loading indicator shows
- [ ] Verify translation appears
- [ ] Toggle translation off
- [ ] Toggle translation on (should be instant from cache)
- [ ] Change to different language
- [ ] Verify re-translation occurs
- [ ] Test error states (invalid key, network off)
- [ ] Test retry functionality
- [ ] Test different comic formats (manga, western)
- [ ] Test different bubble shapes render correctly

## Example: Complete Comic Reader

See the full example in the module documentation or check out:
- `ComicReaderTranslationOverlay.kt` - Complete ViewModel and UI
- `ComicTranslationOverlayCanvas.kt` - Canvas rendering
- `ComicTranslationSettingsScreen.kt` - Settings UI with language selector

## Support

For issues:
1. Check error messages in UI
2. Verify API key is configured
3. Check cache with `getCachedPageCount()`
4. Clear cache with `clearCache(comicId)`
5. Retry translation

## Summary

You now have:
- ✅ Gemini 2.5 Pro integration
- ✅ On-device ML Kit translation
- ✅ Language selection (12 languages)
- ✅ Complete reader UI
- ✅ Canvas-based overlay
- ✅ Automatic caching
- ✅ Error handling
- ✅ Loading states

Just add the composables to your reader screen and you're ready to go!
