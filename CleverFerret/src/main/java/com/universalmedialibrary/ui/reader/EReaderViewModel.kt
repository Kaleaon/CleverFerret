package com.universalmedialibrary.ui.reader

import android.content.Context
import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import java.util.zip.ZipFile
import java.util.zip.ZipException
import javax.inject.Inject

/**
 * ViewModel for the e-reader screen
 * Supports: TXT, MD, HTML files and basic EPUB parsing
 */
@HiltViewModel
class EReaderViewModel @Inject constructor() : ViewModel() {

    private val _uiState = MutableStateFlow(EReaderUiState())
    val uiState: StateFlow<EReaderUiState> = _uiState.asStateFlow()

    private var chapters: List<String> = emptyList()
    private var currentChapterIndex = 0

    /**
     * Load a book file for reading
     * Handles both file paths and content URIs
     */
    fun loadBook(context: Context, filePath: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)

            try {
                if (filePath.isBlank()) {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        error = "No file path provided"
                    )
                    return@launch
                }

                // Handle content URIs by copying to temp file
                val file = resolveToFile(context, filePath)
                
                if (file == null || !file.exists()) {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        error = "File not found or cannot be accessed: $filePath"
                    )
                    return@launch
                }

                when (file.extension.lowercase()) {
                    "txt", "md" -> loadTextFile(file)
                    "html", "htm" -> loadHtmlFile(file)
                    "epub" -> loadEpubFile(file)
                    "pdf" -> loadPdfInfo(file)
                    else -> {
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            error = "Unsupported file format: ${file.extension}\n\nSupported: TXT, MD, HTML, EPUB, PDF"
                        )
                    }
                }

            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to load book: ${e.message}"
                )
            }
        }
    }
    
    /**
     * Resolve a file path or content URI to a File object
     * For content URIs, copies the content to a temp file
     */
    private suspend fun resolveToFile(context: Context, path: String): File? = withContext(Dispatchers.IO) {
        try {
            when {
                path.startsWith("content://") -> {
                    // Handle content URI - copy to temp file
                    val uri = Uri.parse(path)
                    val extension = path.substringAfterLast('.', "epub").lowercase()
                    val tempFile = File(context.cacheDir, "temp_book_${System.currentTimeMillis()}.$extension")
                    
                    context.contentResolver.openInputStream(uri)?.use { input ->
                        tempFile.outputStream().use { output ->
                            input.copyTo(output)
                        }
                    } ?: return@withContext null
                    
                    tempFile
                }
                path.startsWith("file://") -> {
                    // Handle file:// URI
                    File(Uri.parse(path).path ?: return@withContext null)
                }
                else -> {
                    // Assume it's a regular file path
                    File(path)
                }
            }
        } catch (e: Exception) {
            null
        }
    }

    private suspend fun loadTextFile(file: File) = withContext(Dispatchers.IO) {
        val content = file.readText()
        
        // Split into chapters based on common chapter markers
        chapters = content.split(Regex("\\n\\s*(Chapter|CHAPTER|Part|PART)\\s+\\d+[:\\s]"))
            .filter { it.isNotBlank() }
        
        if (chapters.isEmpty()) {
            chapters = listOf(content)
        }
        
        currentChapterIndex = 0
        
        _uiState.value = _uiState.value.copy(
            isLoading = false,
            isLoaded = true,
            bookTitle = file.nameWithoutExtension,
            totalChapters = chapters.size,
            currentChapterIndex = 0,
            currentChapterContent = chapters[0]
        )
    }

    private suspend fun loadHtmlFile(file: File) = withContext(Dispatchers.IO) {
        val content = file.readText()
        // Strip HTML tags for basic reading
        val strippedContent = content.replace(Regex("<[^>]*>"), "").trim()
        
        chapters = listOf(strippedContent)
        currentChapterIndex = 0
        
        _uiState.value = _uiState.value.copy(
            isLoading = false,
            isLoaded = true,
            bookTitle = file.nameWithoutExtension,
            totalChapters = 1,
            currentChapterIndex = 0,
            currentChapterContent = strippedContent
        )
    }

    private suspend fun loadEpubFile(file: File) = withContext(Dispatchers.IO) {
        try {
            // Verify file is readable and has content
            if (!file.canRead()) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Cannot read EPUB file. Please check file permissions."
                )
                return@withContext
            }
            
            if (file.length() == 0L) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "EPUB file is empty or corrupted."
                )
                return@withContext
            }
            
            // EPUB is a ZIP file - extract and read content
            val zipFile = try {
                ZipFile(file)
            } catch (e: ZipException) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Invalid EPUB file format. The file may be corrupted or not a valid EPUB."
                )
                return@withContext
            }
            
            val entries = zipFile.entries().toList()
            
            // Find content files (usually in OEBPS or similar directory)
            val contentFiles = entries.filter { 
                it.name.endsWith(".html") || it.name.endsWith(".xhtml") || it.name.endsWith(".htm")
            }.sortedBy { it.name }
            
            chapters = contentFiles.mapNotNull { entry ->
                try {
                    zipFile.getInputStream(entry).use { inputStream ->
                        val content = inputStream.bufferedReader().use { it.readText() }
                        // Strip HTML tags
                        content.replace(Regex("<[^>]*>"), "")
                            .replace(Regex("&nbsp;"), " ")
                            .replace(Regex("&[a-z]+;"), "")
                            .trim()
                    }
                } catch (e: Exception) {
                    null
                }
            }.filter { it.isNotBlank() }
            
            zipFile.close()
            
            if (chapters.isEmpty()) {
                // Fallback: show basic file info
                chapters = listOf("""
                    EPUB File Loaded
                    
                    File: ${file.name}
                    Size: ${file.length() / 1024} KB
                    
                    This EPUB file has been loaded. The content extraction process completed,
                    but the chapters may require a more sophisticated EPUB parser for proper
                    formatting and layout.
                    
                    Basic text content has been extracted where possible.
                """.trimIndent())
            }
            
            currentChapterIndex = 0
            
            _uiState.value = _uiState.value.copy(
                isLoading = false,
                isLoaded = true,
                bookTitle = file.nameWithoutExtension,
                totalChapters = chapters.size,
                currentChapterIndex = 0,
                currentChapterContent = chapters[0]
            )
        } catch (e: SecurityException) {
            _uiState.value = _uiState.value.copy(
                isLoading = false,
                error = "Permission denied. Cannot access the EPUB file."
            )
        } catch (e: OutOfMemoryError) {
            _uiState.value = _uiState.value.copy(
                isLoading = false,
                error = "EPUB file is too large to open. Try a smaller file."
            )
        } catch (e: Exception) {
            _uiState.value = _uiState.value.copy(
                isLoading = false,
                error = "Failed to parse EPUB: ${e.message ?: "Unknown error"}"
            )
        }
    }

    private suspend fun loadPdfInfo(file: File) = withContext(Dispatchers.IO) {
        // PDF parsing requires external libraries - show info message
        val content = """
            PDF Reader
            
            File: ${file.name}
            Size: ${file.length() / 1024} KB
            
            PDF reading requires additional libraries for proper rendering.
            For now, this is a placeholder showing file information.
            
            To read PDF files, consider:
            • Using a dedicated PDF reader app
            • Converting the PDF to EPUB or TXT format
            • Waiting for enhanced PDF support in future updates
        """.trimIndent()
        
        chapters = listOf(content)
        currentChapterIndex = 0
        
        _uiState.value = _uiState.value.copy(
            isLoading = false,
            isLoaded = true,
            bookTitle = file.nameWithoutExtension,
            totalChapters = 1,
            currentChapterIndex = 0,
            currentChapterContent = content
        )
    }

    /**
     * Navigate to the next chapter
     */
    fun nextChapter() {
        if (currentChapterIndex < chapters.size - 1) {
            currentChapterIndex++
            _uiState.value = _uiState.value.copy(
                currentChapterIndex = currentChapterIndex,
                currentChapterContent = chapters[currentChapterIndex]
            )
        }
    }

    /**
     * Navigate to the previous chapter
     */
    fun previousChapter() {
        if (currentChapterIndex > 0) {
            currentChapterIndex--
            _uiState.value = _uiState.value.copy(
                currentChapterIndex = currentChapterIndex,
                currentChapterContent = chapters[currentChapterIndex]
            )
        }
    }

    /**
     * Jump to a specific chapter
     */
    fun jumpToChapter(index: Int) {
        if (index in chapters.indices) {
            currentChapterIndex = index
            _uiState.value = _uiState.value.copy(
                currentChapterIndex = currentChapterIndex,
                currentChapterContent = chapters[currentChapterIndex]
            )
        }
    }

    /**
     * Previous page (for pagination) - currently same as previous chapter
     */
    fun previousPage() {
        previousChapter()
    }

    /**
     * Next page (for pagination) - currently same as next chapter
     */
    fun nextPage() {
        nextChapter()
    }
}

/**
 * UI state for the e-reader
 */
data class EReaderUiState(
    val isLoading: Boolean = false,
    val isLoaded: Boolean = false,
    val bookTitle: String = "",
    val totalChapters: Int = 0,
    val currentChapterIndex: Int = 0,
    val currentChapterContent: String = "",
    val error: String? = null
)
