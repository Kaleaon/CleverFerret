package com.universalmedialibrary.ui.reader

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.github.junrar.Archive
import com.universalmedialibrary.data.local.dao.ComicPanelDao
import com.universalmedialibrary.data.local.entity.ComicPanelData
import com.universalmedialibrary.data.local.entity.ComicReadingSession
import com.universalmedialibrary.data.local.entity.ComicTranslation
import com.universalmedialibrary.services.ai.GeminiTTSService
import com.universalmedialibrary.services.comic.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import java.util.zip.ZipFile
import javax.inject.Inject

/**
 * Enhanced Comic Reader ViewModel
 * 
 * Features:
 * - Page-by-page and panel-by-panel reading modes
 * - Automatic panel detection using edge detection
 * - Speech bubble OCR and translation
 * - Gemini-powered TTS for comic narration
 * - Export/import panel data
 */
@HiltViewModel
class ComicReaderViewModel @Inject constructor(
    private val comicPanelDetector: ComicPanelDetector,
    private val comicTranslationService: ComicTranslationService,
    private val comicDataService: ComicDataService,
    private val geminiTTSService: GeminiTTSService,
    private val comicPanelDao: ComicPanelDao
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(ComicReaderUiState())
    val uiState: StateFlow<ComicReaderUiState> = _uiState.asStateFlow()
    
    private var comicPages = mutableListOf<String>()
    private var currentComicId = 0L
    
    /**
     * Load comic file (CBZ, CBR, or directory of images)
     */
    fun loadComic(context: Context, comicPath: String, comicId: Long, geminiApiKey: String? = null) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)
            
            try {
                currentComicId = comicId
                
                // Initialize services
                if (!geminiApiKey.isNullOrBlank()) {
                    geminiTTSService.initialize(geminiApiKey)
                    comicTranslationService.initialize(geminiApiKey)
                }
                
                // Extract pages
                comicPages = extractPages(comicPath)
                
                // Load or create reading session
                val session = comicPanelDao.getReadingSession(comicId) ?: ComicReadingSession(
                    comicId = comicId,
                    comicFilePath = comicPath,
                    comicTitle = File(comicPath).nameWithoutExtension,
                    totalPages = comicPages.size
                )
                
                // Try to import existing panel data
                comicDataService.importPanelDataFromFile(comicId, comicPath)
                
                // Load first page
                val currentPage = session.currentPage.coerceIn(0, comicPages.size - 1)
                loadPage(currentPage)
                
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    comicTitle = session.comicTitle,
                    totalPages = comicPages.size,
                    currentPage = currentPage,
                    readingSession = session
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to load comic: ${e.message}"
                )
            }
        }
    }
    
    /**
     * Load a specific page
     */
    fun loadPage(pageNumber: Int) {
        viewModelScope.launch {
            if (pageNumber < 0 || pageNumber >= comicPages.size) return@launch
            
            _uiState.value = _uiState.value.copy(isLoading = true)
            
            try {
                val pagePath = comicPages[pageNumber]
                
                // Load existing panel data or detect new
                val panels = comicDataService.getPanelDataForPage(currentComicId, pageNumber)
                val translations = comicDataService.getTranslationsForPage(currentComicId, pageNumber)
                
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    currentPage = pageNumber,
                    currentPagePath = pagePath,
                    panels = panels,
                    translations = translations,
                    currentPanel = 0
                )
                
                // Update reading session
                updateReadingProgress(pageNumber, 0)
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to load page: ${e.message}"
                )
            }
        }
    }
    
    /**
     * Detect panels in current page
     */
    fun detectPanelsInCurrentPage() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isDetectingPanels = true)
            
            try {
                val pagePath = _uiState.value.currentPagePath
                val pageNumber = _uiState.value.currentPage
                
                if (pagePath.isNullOrBlank()) {
                    _uiState.value = _uiState.value.copy(
                        isDetectingPanels = false,
                        error = "No page loaded"
                    )
                    return@launch
                }
                
                // Detect panels
                val detectionResult = comicPanelDetector.detectPanels(pagePath, pageNumber)
                
                // Save to database
                comicDataService.savePanelData(
                    currentComicId,
                    _uiState.value.readingSession?.comicFilePath ?: "",
                    detectionResult
                )
                
                // Load saved panels
                val panels = comicDataService.getPanelDataForPage(currentComicId, pageNumber)
                
                _uiState.value = _uiState.value.copy(
                    isDetectingPanels = false,
                    panels = panels,
                    detectionConfidence = detectionResult.confidence
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isDetectingPanels = false,
                    error = "Panel detection failed: ${e.message}"
                )
            }
        }
    }
    
    /**
     * Translate current page
     */
    fun translateCurrentPage(targetLanguage: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isTranslating = true)
            
            try {
                val pagePath = _uiState.value.currentPagePath
                val pageNumber = _uiState.value.currentPage
                
                if (pagePath.isNullOrBlank()) {
                    _uiState.value = _uiState.value.copy(
                        isTranslating = false,
                        error = "No page loaded"
                    )
                    return@launch
                }
                
                // Get or detect panels
                var panels = _uiState.value.panels
                if (panels.isEmpty()) {
                    detectPanelsInCurrentPage()
                    panels = _uiState.value.panels
                }
                
                // Convert to DetectedPanel format
                val detectedPanels = panels.map { panel ->
                    DetectedPanel(
                        panelIndex = panel.panelIndex,
                        pageNumber = panel.pageNumber,
                        bounds = NormalizedRect(panel.x, panel.y, panel.width, panel.height),
                        confidence = panel.confidence,
                        area = panel.width * panel.height,
                        readingOrder = panel.readingOrder
                    )
                }
                
                // Translate
                val translationResult = comicTranslationService.translateComicPage(
                    pagePath,
                    detectedPanels,
                    targetLanguage,
                    _uiState.value.comicTitle
                )
                
                // Save translations
                comicDataService.saveTranslationData(currentComicId, translationResult)
                
                // Reload translations
                val translations = comicDataService.getTranslationsForPage(currentComicId, pageNumber)
                
                _uiState.value = _uiState.value.copy(
                    isTranslating = false,
                    translations = translations,
                    translationLanguage = targetLanguage
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isTranslating = false,
                    error = "Translation failed: ${e.message}"
                )
            }
        }
    }
    
    /**
     * Read current panel/page with TTS
     */
    fun readWithTTS(speed: Float = 1.0f) {
        viewModelScope.launch {
            try {
                val translations = _uiState.value.translations
                
                if (translations.isEmpty()) {
                    _uiState.value = _uiState.value.copy(
                        error = "No text to read. Please translate the page first."
                    )
                    return@launch
                }
                
                // Combine all text from current panel or page
                val textToRead = translations.joinToString(" ") { 
                    it.translatedText ?: it.originalText 
                }
                
                // Read with Gemini-enhanced TTS
                val success = geminiTTSService.speak(
                    text = textToRead,
                    context = "Comic: ${_uiState.value.comicTitle}, Page: ${_uiState.value.currentPage}",
                    speed = speed
                )
                
                if (!success) {
                    _uiState.value = _uiState.value.copy(
                        error = "TTS not available. Please initialize with Gemini API key."
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "TTS failed: ${e.message}"
                )
            }
        }
    }
    
    /**
     * Export panel data to file
     */
    fun exportPanelData() {
        viewModelScope.launch {
            try {
                val session = _uiState.value.readingSession ?: return@launch
                
                val exportFile = comicDataService.exportPanelDataToFile(
                    currentComicId,
                    session.comicFilePath,
                    session.comicTitle,
                    session.totalPages
                )
                
                if (exportFile != null) {
                    _uiState.value = _uiState.value.copy(
                        exportedFilePath = exportFile.absolutePath
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "Export failed: ${e.message}"
                )
            }
        }
    }
    
    /**
     * Navigate to next page
     */
    fun nextPage() {
        val nextPage = _uiState.value.currentPage + 1
        if (nextPage < _uiState.value.totalPages) {
            loadPage(nextPage)
        }
    }
    
    /**
     * Navigate to previous page
     */
    fun previousPage() {
        val prevPage = _uiState.value.currentPage - 1
        if (prevPage >= 0) {
            loadPage(prevPage)
        }
    }
    
    /**
     * Navigate to next panel
     */
    fun nextPanel() {
        val currentPanel = _uiState.value.currentPanel
        val totalPanels = _uiState.value.panels.size
        
        if (currentPanel < totalPanels - 1) {
            _uiState.value = _uiState.value.copy(currentPanel = currentPanel + 1)
            updateReadingProgress(_uiState.value.currentPage, currentPanel + 1)
        } else {
            // Move to next page
            nextPage()
        }
    }
    
    /**
     * Navigate to previous panel
     */
    fun previousPanel() {
        val currentPanel = _uiState.value.currentPanel
        
        if (currentPanel > 0) {
            _uiState.value = _uiState.value.copy(currentPanel = currentPanel - 1)
            updateReadingProgress(_uiState.value.currentPage, currentPanel - 1)
        } else {
            // Move to previous page
            previousPage()
        }
    }
    
    /**
     * Toggle reading mode (PAGE vs PANEL)
     */
    fun setReadingMode(mode: String) {
        viewModelScope.launch {
            comicPanelDao.updateReadingMode(currentComicId, mode)
            _uiState.value = _uiState.value.copy(
                readingSession = _uiState.value.readingSession?.copy(readingMode = mode)
            )
        }
    }
    
    /**
     * Toggle translation overlay
     */
    fun toggleTranslation(enabled: Boolean) {
        viewModelScope.launch {
            comicPanelDao.updateTranslationEnabled(currentComicId, enabled)
            _uiState.value = _uiState.value.copy(
                readingSession = _uiState.value.readingSession?.copy(enableTranslation = enabled)
            )
        }
    }
    
    // Helper methods
    
    private suspend fun extractPages(comicPath: String): MutableList<String> {
        return withContext(Dispatchers.IO) {
            val file = File(comicPath)
            val pages = mutableListOf<String>()
            
            when (file.extension.lowercase()) {
                "cbz", "zip" -> {
                    // Extract ZIP/CBZ
                    val zipFile = ZipFile(file)
                    val entries = zipFile.entries().toList()
                        .filter { it.name.matches(Regex(".*\\.(jpg|jpeg|png|gif|bmp|webp)", RegexOption.IGNORE_CASE)) }
                        .sortedBy { it.name }
                    
                    val tempDir = File(file.parent, ".temp_${file.nameWithoutExtension}")
                    tempDir.mkdirs()
                    
                    entries.forEach { entry ->
                        val outputFile = File(tempDir, entry.name)
                        outputFile.parentFile?.mkdirs()
                        zipFile.getInputStream(entry).use { input ->
                            outputFile.outputStream().use { output ->
                                input.copyTo(output)
                            }
                        }
                        pages.add(outputFile.absolutePath)
                    }
                    zipFile.close()
                }
                "cbr", "rar" -> {
                    // Extract RAR/CBR
                    val archive = Archive(file)
                    val tempDir = File(file.parent, ".temp_${file.nameWithoutExtension}")
                    tempDir.mkdirs()
                    
                    archive.fileHeaders
                        .filter { !it.isDirectory && it.fileName.matches(Regex(".*\\.(jpg|jpeg|png|gif|bmp|webp)", RegexOption.IGNORE_CASE)) }
                        .sortedBy { it.fileName }
                        .forEach { header ->
                            val outputFile = File(tempDir, header.fileName)
                            outputFile.parentFile?.mkdirs()
                            archive.extractFile(header, outputFile.absolutePath)
                            pages.add(outputFile.absolutePath)
                        }
                    archive.close()
                }
                else -> {
                    // Directory of images
                    if (file.isDirectory) {
                        file.listFiles()
                            ?.filter { it.extension.lowercase() in listOf("jpg", "jpeg", "png", "gif", "bmp", "webp") }
                            ?.sortedBy { it.name }
                            ?.forEach { pages.add(it.absolutePath) }
                    }
                }
            }
            
            pages
        }
    }
    
    private fun updateReadingProgress(page: Int, panel: Int) {
        viewModelScope.launch {
            comicPanelDao.updateReadingProgress(currentComicId, page, panel)
        }
    }
    
    override fun onCleared() {
        super.onCleared()
        geminiTTSService.shutdown()
        comicTranslationService.shutdown()
    }
}

// UI State

data class ComicReaderUiState(
    val isLoading: Boolean = false,
    val comicTitle: String = "",
    val currentPage: Int = 0,
    val totalPages: Int = 0,
    val currentPagePath: String? = null,
    val currentPanel: Int = 0,
    
    // Panel data
    val panels: List<ComicPanelData> = emptyList(),
    val isDetectingPanels: Boolean = false,
    val detectionConfidence: Float = 0.0f,
    
    // Translation data
    val translations: List<ComicTranslation> = emptyList(),
    val isTranslating: Boolean = false,
    val translationLanguage: String? = null,
    
    // Session
    val readingSession: ComicReadingSession? = null,
    
    // Export
    val exportedFilePath: String? = null,
    
    // Error
    val error: String? = null
)
