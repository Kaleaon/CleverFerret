# OCR (Optical Character Recognition) Usage Guide

CleverFerret includes on-device OCR capabilities powered by Google ML Kit Text Recognition. This feature allows you to extract text from images in your media library without requiring an internet connection.

## Overview

The OCR feature enables:
- **On-device text recognition** - Works completely offline
- **Text extraction from images** - Comics, book covers, PDFs, and more
- **Smart caching** - OCR results are cached to improve performance
- **Copy to clipboard** - Easily copy recognized text
- **Multi-language support** - Latin script languages (English, Spanish, French, German, etc.)

## Key Features

### 1. On-Device Processing
- All OCR processing happens locally on your device
- No internet connection required
- Privacy-focused - your content never leaves your device

### 2. Intelligent Caching
- OCR results are automatically cached in the local database
- Subsequent views of the same page retrieve results instantly
- Cache management to prevent excessive storage use

### 3. Integration Points
- **Comic Reader**: Extract text from comic panels and pages
- **PDF Reader**: Recognize text in scanned PDFs
- **Book Reader**: OCR for image-based books
- **Image Viewer**: Extract text from any image

## Architecture

### Core Components

#### OcrService Interface
```kotlin
interface OcrService {
    suspend fun recognizeText(bitmap: Bitmap): Result<OcrResult>
    suspend fun recognizeTextInRegion(bitmap: Bitmap, region: Rect): Result<OcrResult>
    fun isAvailable(): Boolean
}
```

#### MLKitOcrService Implementation
- Uses Google ML Kit Text Recognition API
- Provides offline text recognition
- Supports Latin script languages
- Returns structured results with bounding boxes

#### OcrRepository
- Manages caching of OCR results
- Provides high-level API for text recognition
- Handles cache invalidation and cleanup

#### Database Schema
```sql
CREATE TABLE ocr_cache (
    id TEXT PRIMARY KEY NOT NULL,
    mediaItemId TEXT NOT NULL,
    pageNumber INTEGER NOT NULL DEFAULT 0,
    text TEXT NOT NULL,
    blocksJson TEXT NOT NULL,
    confidence REAL NOT NULL DEFAULT 0.0,
    timestamp INTEGER NOT NULL,
    language TEXT NOT NULL DEFAULT 'en'
)
```

## Usage Examples

### Basic OCR Usage

```kotlin
// Inject the OCR repository
@Inject lateinit var ocrRepository: OcrRepository

// Perform OCR on a bitmap
suspend fun extractText(bitmap: Bitmap, mediaId: String, page: Int) {
    val result = ocrRepository.recognizeText(
        bitmap = bitmap,
        mediaItemId = mediaId,
        pageNumber = page,
        useCache = true
    )
    
    result.onSuccess { ocrResult ->
        println("Extracted text: ${ocrResult.text}")
        println("Confidence: ${ocrResult.confidence}")
        
        // Process text blocks with bounding boxes
        ocrResult.blocks.forEach { block ->
            println("Block: ${block.text} at ${block.boundingBox}")
        }
    }.onFailure { error ->
        println("OCR failed: ${error.message}")
    }
}
```

### Using with ViewModel

```kotlin
@HiltViewModel
class ReaderViewModel @Inject constructor(
    private val ocrRepository: OcrRepository
) : ViewModel() {
    
    private val _ocrResult = MutableStateFlow<String?>(null)
    val ocrResult: StateFlow<String?> = _ocrResult.asStateFlow()
    
    fun performOcr(bitmap: Bitmap, mediaId: String, page: Int) {
        viewModelScope.launch {
            val result = ocrRepository.recognizeText(bitmap, mediaId, page)
            result.onSuccess { _ocrResult.value = it.text }
        }
    }
}
```

### UI Integration (Compose)

```kotlin
@Composable
fun ComicReaderWithOcr(
    viewModel: OcrViewModel = hiltViewModel()
) {
    val ocrState by viewModel.ocrState.collectAsState()
    var showOcrOverlay by remember { mutableStateOf(false) }
    
    Box {
        // Your comic/image display
        ComicPage(...)
        
        // OCR FAB
        OcrFab(
            onClick = { showOcrOverlay = true },
            modifier = Modifier.align(Alignment.BottomEnd)
        )
        
        // OCR overlay
        if (showOcrOverlay) {
            OcrOverlay(
                bitmap = currentPageBitmap,
                onRecognizeText = {
                    viewModel.recognizeText(
                        bitmap = currentPageBitmap,
                        mediaItemId = mediaId,
                        pageNumber = currentPage
                    )
                },
                ocrResult = when (val state = ocrState) {
                    is OcrState.Success -> state.result.text
                    else -> null
                },
                isProcessing = ocrState is OcrState.Processing,
                onDismiss = { showOcrOverlay = false }
            )
        }
    }
}
```

## Performance Considerations

### OCR Processing Time
- **Small images** (< 1 MB): 1-2 seconds
- **Medium images** (1-3 MB): 2-4 seconds
- **Large images** (> 3 MB): 4-8 seconds

### Caching Strategy
- Results are cached by hash of (mediaItemId + pageNumber + image dimensions)
- Cache entries are retained for 30 days by default
- Manual cache clearing available via `OcrRepository.clearCacheForMediaItem()`

### Memory Usage
- ML Kit Text Recognition uses ~30-50 MB of memory during processing
- Bitmap processing is done on background threads
- Results are stored efficiently in the database

## Supported Languages

Currently supports Latin-script languages including:
- English
- Spanish
- French
- German
- Italian
- Portuguese
- And many more

## Limitations

1. **Handwritten text**: OCR works best with printed text
2. **Low quality images**: Blurry or low-resolution images may produce poor results
3. **Complex layouts**: Comic speech bubbles with unusual shapes may need manual adjustment
4. **Non-Latin scripts**: Arabic requires additional language packs. Chinese, Japanese, and Korean are supported.

## Future Enhancements

Planned features for future releases:
- [ ] Speech balloon detection using ML models
- [x] Multi-language support (Chinese, Japanese, Korean, Devanagari)
- [ ] Multi-language support (Arabic)
- [x] Text-to-Speech integration for extracted text
- [ ] Custom OCR model training for comic fonts
- [ ] Batch OCR processing for entire books
- [ ] OCR result editing and correction
## Troubleshooting

### OCR Not Working
1. Ensure ML Kit dependencies are properly installed
2. Check if the image quality is sufficient
3. Verify device has sufficient memory

### Poor Recognition Quality
1. Use higher resolution images
2. Ensure adequate lighting/contrast
3. Try manual region selection for specific areas

### Cache Issues
1. Clear app cache if OCR results seem stale
2. Use `useCache = false` parameter to force re-processing
3. Call `clearCache()` to remove all cached results

## API Reference

### OcrService
```kotlin
interface OcrService {
    // Recognize text in entire bitmap
    suspend fun recognizeText(bitmap: Bitmap): Result<OcrResult>
    
    // Recognize text in specific region
    suspend fun recognizeTextInRegion(
        bitmap: Bitmap, 
        region: Rect
    ): Result<OcrResult>
    
    // Check if OCR is available
    fun isAvailable(): Boolean
}
```

### OcrRepository
```kotlin
class OcrRepository {
    // Recognize text with caching
    suspend fun recognizeText(
        bitmap: Bitmap,
        mediaItemId: String,
        pageNumber: Int = 0,
        useCache: Boolean = true
    ): Result<OcrResult>
    
    // Get cached results for media item
    fun getOcrResultsForMediaItem(
        mediaItemId: String
    ): Flow<List<OcrResult>>
    
    // Clear cache for specific item
    suspend fun clearCacheForMediaItem(mediaItemId: String)
    
    // Clear old cache entries
    suspend fun clearOldCache(maxAgeMillis: Long = 30 * 24 * 60 * 60 * 1000)
}
```

### Data Models
```kotlin
data class OcrResult(
    val text: String,
    val blocks: List<TextBlock>,
    val confidence: Float = 0f
)

data class TextBlock(
    val text: String,
    val boundingBox: Rect,
    val confidence: Float = 0f,
    val lines: List<TextLine> = emptyList()
)

data class TextLine(
    val text: String,
    val boundingBox: Rect,
    val confidence: Float = 0f,
    val words: List<TextWord> = emptyList()
)

data class TextWord(
    val text: String,
    val boundingBox: Rect,
    val confidence: Float = 0f
)
```

## Credits

OCR functionality is powered by:
- **Google ML Kit Text Recognition** - On-device text recognition API
- Inspired by **Seeneva Comic Reader** - https://github.com/Seeneva/seeneva-reader-android

## License

The OCR integration code is part of CleverFerret and follows the same license as the project.
