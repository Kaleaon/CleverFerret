# Parser Integration Guide

This guide explains how to integrate the new document parsers with CleverFerret's existing UnifiedReaderService.

## Overview

The new parser system provides a unified interface for parsing various document formats. This guide shows how to integrate these parsers with the existing reader infrastructure.

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    UnifiedReaderService                      │
│  (Orchestrates reading across all formats)                  │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ├─────────────────────────────────────────┐
                     │                                         │
         ┌───────────▼──────────┐              ┌──────────────▼─────────┐
         │   ParserFactory      │              │  Existing Readers      │
         │  (Format Detection)  │              │  (EPUB, PDF, etc.)     │
         └───────────┬──────────┘              └────────────────────────┘
                     │
         ┌───────────▼──────────────────────────────────────┐
         │              DocumentParser                      │
         │         (Base Interface)                         │
         └───────────┬──────────────────────────────────────┘
                     │
         ┌───────────┴──────────────────────────────────────┐
         │                                                   │
    ┌────▼─────┐  ┌────────┐  ┌────────┐  ┌──────────┐    │
    │  DOCX    │  │  DOC   │  │  RTF   │  │   CHM    │    │
    │  Parser  │  │ Parser │  │ Parser │  │  Parser  │    │
    └──────────┘  └────────┘  └────────┘  └──────────┘    │
                                                            │
    ┌──────────┐  ┌────────┐  ┌────────┐  ┌──────────┐   │
    │   ODT    │  │  MOBI  │  │  DJVU  │  │  Legacy  │   │
    │  Parser  │  │ Parser │  │ Parser │  │  Parsers │   │
    └──────────┘  └────────┘  └────────┘  └──────────┘   │
                                                           │
                     (JNI-based parsers)                   │
                                                           │
         └─────────────────────────────────────────────────┘
```

## Integration Steps

### Step 1: Update UnifiedReaderService

Modify `UnifiedReaderService.kt` to use the new parser system:

```kotlin
package com.universalmedialibrary.services.reader

import com.universalmedialibrary.parsers.ParserFactory
import com.universalmedialibrary.parsers.UnsupportedFormatException
import com.universalmedialibrary.parsers.ParserException
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File

class UnifiedReaderService {
    
    /**
     * Load and parse a document using the appropriate parser
     */
    suspend fun loadDocument(filePath: String): DocumentContent = withContext(Dispatchers.IO) {
        val file = File(filePath)
        
        // Check if format is supported by new parser system
        if (ParserFactory.isSupported(file.name)) {
            return@withContext loadWithParser(filePath)
        }
        
        // Fall back to existing readers for EPUB, PDF, etc.
        return@withContext loadWithExistingReader(filePath)
    }
    
    /**
     * Load document using new parser system
     */
    private suspend fun loadWithParser(filePath: String): DocumentContent {
        try {
            val parser = ParserFactory.getParser(filePath)
            val parsedDocument = parser.parse(filePath)
            
            return DocumentContent(
                text = parsedDocument.content,
                metadata = convertMetadata(parsedDocument.metadata),
                structure = convertStructure(parsedDocument.structure),
                format = parsedDocument.metadata.format ?: "UNKNOWN"
            )
        } catch (e: UnsupportedFormatException) {
            throw ReaderException("Unsupported format: ${File(filePath).name}", e)
        } catch (e: ParserException) {
            throw ReaderException("Failed to parse document: ${e.message}", e)
        }
    }
    
    /**
     * Load document using existing reader infrastructure
     */
    private suspend fun loadWithExistingReader(filePath: String): DocumentContent {
        // Use existing EPUB, PDF readers, etc.
        // This maintains backward compatibility
        return when (File(filePath).extension.lowercase()) {
            "epub" -> loadEpub(filePath)
            "pdf" -> loadPdf(filePath)
            else -> throw ReaderException("Unsupported format")
        }
    }
    
    /**
     * Convert parser metadata to reader metadata
     */
    private fun convertMetadata(
        parserMetadata: com.universalmedialibrary.parsers.DocumentMetadata
    ): ReaderMetadata {
        return ReaderMetadata(
            title = parserMetadata.title,
            author = parserMetadata.author,
            subject = parserMetadata.subject,
            keywords = parserMetadata.keywords,
            creationDate = parserMetadata.creationDate,
            modificationDate = parserMetadata.modificationDate,
            pageCount = parserMetadata.pageCount,
            wordCount = parserMetadata.wordCount,
            language = parserMetadata.language,
            format = parserMetadata.format,
            customProperties = parserMetadata.customProperties
        )
    }
    
    /**
     * Convert parser structure to reader structure
     */
    private fun convertStructure(
        parserStructure: com.universalmedialibrary.parsers.DocumentStructure?
    ): ReaderStructure? {
        if (parserStructure == null) return null
        
        return ReaderStructure(
            chapters = parserStructure.chapters.map { chapter ->
                ReaderChapter(
                    title = chapter.title,
                    startPosition = chapter.startPosition,
                    endPosition = chapter.endPosition,
                    level = chapter.level
                )
            },
            headings = parserStructure.headings.map { heading ->
                ReaderHeading(
                    text = heading.text,
                    level = heading.level,
                    position = heading.position
                )
            }
        )
    }
    
    // Existing methods for EPUB, PDF, etc.
    private suspend fun loadEpub(filePath: String): DocumentContent {
        // Existing EPUB loading logic
        TODO("Use existing Readium integration")
    }
    
    private suspend fun loadPdf(filePath: String): DocumentContent {
        // Existing PDF loading logic
        TODO("Use existing PDF reader")
    }
}

/**
 * Data classes for reader service
 */
data class DocumentContent(
    val text: String,
    val metadata: ReaderMetadata,
    val structure: ReaderStructure?,
    val format: String
)

data class ReaderMetadata(
    val title: String?,
    val author: String?,
    val subject: String?,
    val keywords: List<String>,
    val creationDate: String?,
    val modificationDate: String?,
    val pageCount: Int?,
    val wordCount: Int?,
    val language: String?,
    val format: String?,
    val customProperties: Map<String, String>
)

data class ReaderStructure(
    val chapters: List<ReaderChapter>,
    val headings: List<ReaderHeading>
)

data class ReaderChapter(
    val title: String,
    val startPosition: Int,
    val endPosition: Int,
    val level: Int
)

data class ReaderHeading(
    val text: String,
    val level: Int,
    val position: Int
)

class ReaderException(message: String, cause: Throwable? = null) : Exception(message, cause)
```

### Step 2: Update File Type Detection

Add new formats to the file type detection system:

```kotlin
object FileTypeDetector {
    
    fun getFileType(fileName: String): FileType {
        val extension = File(fileName).extension.lowercase()
        
        return when {
            // New parser-supported formats
            ParserFactory.isSupported(fileName) -> FileType.DOCUMENT
            
            // Existing formats
            extension in listOf("epub") -> FileType.EPUB
            extension in listOf("pdf") -> FileType.PDF
            extension in listOf("mp3", "m4a", "wav") -> FileType.AUDIO
            
            else -> FileType.UNKNOWN
        }
    }
    
    fun getSupportedFormats(): List<String> {
        return ParserFactory.getSupportedExtensions() + 
               listOf("epub", "pdf", "mp3", "m4a", "wav")
    }
}

enum class FileType {
    DOCUMENT,
    EPUB,
    PDF,
    AUDIO,
    UNKNOWN
}
```

### Step 3: Update UI Components

Modify the reader UI to handle new formats:

```kotlin
@Composable
fun DocumentReaderScreen(
    filePath: String,
    viewModel: DocumentReaderViewModel = hiltViewModel()
) {
    val documentState by viewModel.documentState.collectAsState()
    
    LaunchedEffect(filePath) {
        viewModel.loadDocument(filePath)
    }
    
    when (documentState) {
        is DocumentState.Loading -> {
            LoadingIndicator()
        }
        is DocumentState.Success -> {
            val content = (documentState as DocumentState.Success).content
            DocumentContentView(content)
        }
        is DocumentState.Error -> {
            ErrorView((documentState as DocumentState.Error).message)
        }
    }
}

@Composable
fun DocumentContentView(content: DocumentContent) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState())
            .padding(16.dp)
    ) {
        // Display metadata
        content.metadata.title?.let { title ->
            Text(
                text = title,
                style = MaterialTheme.typography.headlineMedium,
                modifier = Modifier.padding(bottom = 8.dp)
            )
        }
        
        content.metadata.author?.let { author ->
            Text(
                text = "By $author",
                style = MaterialTheme.typography.bodyMedium,
                modifier = Modifier.padding(bottom = 16.dp)
            )
        }
        
        // Display content
        Text(
            text = content.text,
            style = MaterialTheme.typography.bodyLarge,
            lineHeight = 24.sp
        )
    }
}
```

### Step 4: Update ViewModel

Create or update the ViewModel to handle document loading:

```kotlin
@HiltViewModel
class DocumentReaderViewModel @Inject constructor(
    private val readerService: UnifiedReaderService
) : ViewModel() {
    
    private val _documentState = MutableStateFlow<DocumentState>(DocumentState.Loading)
    val documentState: StateFlow<DocumentState> = _documentState.asStateFlow()
    
    fun loadDocument(filePath: String) {
        viewModelScope.launch {
            _documentState.value = DocumentState.Loading
            
            try {
                val content = readerService.loadDocument(filePath)
                _documentState.value = DocumentState.Success(content)
            } catch (e: Exception) {
                _documentState.value = DocumentState.Error(
                    e.message ?: "Failed to load document"
                )
            }
        }
    }
}

sealed class DocumentState {
    object Loading : DocumentState()
    data class Success(val content: DocumentContent) : DocumentState()
    data class Error(val message: String) : DocumentState()
}
```

### Step 5: Add Dependency Injection

Configure Hilt to provide parser dependencies:

```kotlin
@Module
@InstallIn(SingletonComponent::class)
object ParserModule {
    
    @Provides
    @Singleton
    fun provideUnifiedReaderService(): UnifiedReaderService {
        return UnifiedReaderService()
    }
}
```

### Step 6: Update File Browser

Modify the file browser to show new supported formats:

```kotlin
@Composable
fun FileBrowserScreen(
    viewModel: FileBrowserViewModel = hiltViewModel()
) {
    val files by viewModel.files.collectAsState()
    
    LazyColumn {
        items(files) { file ->
            FileItem(
                file = file,
                onClick = { viewModel.openFile(file) }
            )
        }
    }
}

@Composable
fun FileItem(file: File, onClick: () -> Unit) {
    val icon = when {
        ParserFactory.isSupported(file.name) -> Icons.Default.Description
        file.extension == "epub" -> Icons.Default.MenuBook
        file.extension == "pdf" -> Icons.Default.PictureAsPdf
        else -> Icons.Default.InsertDriveFile
    }
    
    ListItem(
        headlineContent = { Text(file.name) },
        leadingContent = { Icon(icon, contentDescription = null) },
        modifier = Modifier.clickable(onClick = onClick)
    )
}
```

## Testing Integration

### Unit Tests

```kotlin
@Test
fun testDocxIntegration() = runTest {
    val service = UnifiedReaderService()
    val testFile = "test_files/sample.docx"
    
    val content = service.loadDocument(testFile)
    
    assertNotNull(content)
    assertTrue(content.text.isNotEmpty())
    assertEquals("DOCX", content.format)
}

@Test
fun testUnsupportedFormat() = runTest {
    val service = UnifiedReaderService()
    val testFile = "test_files/sample.xyz"
    
    assertThrows<ReaderException> {
        service.loadDocument(testFile)
    }
}
```

### Integration Tests

```kotlin
@Test
fun testEndToEndDocumentLoading() = runTest {
    val viewModel = DocumentReaderViewModel(UnifiedReaderService())
    
    viewModel.loadDocument("test_files/sample.docx")
    
    advanceUntilIdle()
    
    val state = viewModel.documentState.value
    assertTrue(state is DocumentState.Success)
}
```

## Performance Considerations

### Caching

Implement caching for parsed documents:

```kotlin
class CachedReaderService(
    private val readerService: UnifiedReaderService,
    private val cacheSize: Int = 10
) {
    private val cache = LruCache<String, DocumentContent>(cacheSize)
    
    suspend fun loadDocument(filePath: String): DocumentContent {
        cache.get(filePath)?.let { return it }
        
        val content = readerService.loadDocument(filePath)
        cache.put(filePath, content)
        
        return content
    }
}
```

### Background Loading

Use coroutines for non-blocking document loading:

```kotlin
fun loadDocumentInBackground(filePath: String) {
    viewModelScope.launch(Dispatchers.IO) {
        val content = readerService.loadDocument(filePath)
        withContext(Dispatchers.Main) {
            updateUI(content)
        }
    }
}
```

## Error Handling

Implement comprehensive error handling:

```kotlin
suspend fun loadDocumentSafely(filePath: String): Result<DocumentContent> {
    return try {
        Result.success(readerService.loadDocument(filePath))
    } catch (e: UnsupportedFormatException) {
        Result.failure(e)
    } catch (e: ParserException) {
        Result.failure(e)
    } catch (e: Exception) {
        Result.failure(ReaderException("Unexpected error", e))
    }
}
```

## Migration Guide

### Replacing Old Extraction Methods

Replace old placeholder extraction methods with parser calls:

**Before:**
```kotlin
private fun extractDocxContent(filePath: String): String {
    return "Placeholder DOCX content"
}
```

**After:**
```kotlin
private suspend fun extractDocxContent(filePath: String): String {
    val parser = DocxParser()
    val document = parser.parse(filePath)
    return document.content
}
```

### Updating Database Models

Update database models to store parser metadata:

```kotlin
@Entity(tableName = "documents")
data class DocumentEntity(
    @PrimaryKey val id: String,
    val filePath: String,
    val title: String?,
    val author: String?,
    val format: String,
    val pageCount: Int?,
    val wordCount: Int?,
    val lastOpened: Long
)
```

## Troubleshooting

### Common Issues

1. **Parser not found**: Ensure ParserFactory includes the parser
2. **Native library errors**: Check JNI implementation for MOBI/DJVU
3. **Memory issues**: Implement streaming for large documents
4. **Performance**: Use caching and background loading

## Next Steps

1. Implement JNI wrappers for MOBI, DJVU, and legacy formats
2. Add streaming support for large documents
3. Implement advanced features (search, annotations)
4. Optimize performance and memory usage
5. Add comprehensive error handling and logging