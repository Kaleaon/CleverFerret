package com.universalmedialibrary.ui.reader

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Log
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
/* remove spurious code-fence line */
// Remove unused/invalid import
/**
 * Enhanced Comic Reader ViewModel
 * 
 * Features:
 * - Page-by-page and panel-by-panel reading modes
 * - Automatic panel detection using Gemini Vision
 * - Speech bubble OCR and translation via Gemini
 * - Gemini-powered TTS for comic narration
 * - Export/import panel data
 * 
 * All powered by a single Gemini API - no ML Kit, no OpenCV!
 */
@HiltViewModel
class ComicReaderViewModel @Inject constructor(
    private val geminiComicService: GeminiComicService,
    private val comicDataService: ComicDataService,
    private val geminiTTSService: GeminiTTSService,
    private val comicPanelDao: ComicPanelDao
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(ComicReaderUiState())
    val uiState: StateFlow<ComicReaderUiState> = _uiState.asStateFlow()
    
    private var comicPages = mutableListOf<String>()
    private var currentComicId = 0L
    private val tempDirectories = mutableSetOf<File>()
    
    /**
     * Load comic file (CBZ, CBR, or directory of images)
     */
    fun loadComic(context: Context, comicPath: String, comicId: Long, geminiApiKey: String? = null) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)
            
            try {
                currentComicId = comicId
                
                // Initialize Gemini services
                if (!geminiApiKey.isNullOrBlank()) {
                    geminiTTSService.initialize(geminiApiKey)
                    geminiComicService.initialize(geminiApiKey)
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
                
                // Ensure session exists in database before updates
                comicPanelDao.insertReadingSession(session)
                
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
     * Detect panels in current page using Gemini Vision
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
                
                // Detect panels using Gemini Vision
                val detectionResult = geminiComicService.detectPanels(pagePath, pageNumber)
                
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
     * Analyze and translate current page using Gemini Vision (one-shot)
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
                
                // Use Gemini to analyze complete page (panels + OCR + translation all at once!)
                val analysis = geminiComicService.analyzeCompletePage(
                    pagePath,
                    pageNumber,
                    targetLanguage,
                    _uiState.value.comicTitle
                )
                
                // Save panels to database
                val panelEntities = analysis.panels.map { panel ->
                    ComicPanelData(
                        comicId = currentComicId,
                        comicFilePath = _uiState.value.readingSession?.comicFilePath ?: "",
                        pageNumber = pageNumber,
                        totalPages = _uiState.value.totalPages,
                        panelIndex = panel.panelIndex,
                        x = panel.bounds.x,
                        y = panel.bounds.y,
                        width = panel.bounds.width,
                        height = panel.bounds.height,
                        confidence = analysis.confidence,
                        readingOrder = panel.readingOrder
                    )
                }
                
                // Delete old and insert new
                comicPanelDao.deletePanelsForPage(currentComicId, pageNumber)
                comicPanelDao.insertPanels(panelEntities)
                
                // Save translations
                val translationEntities = mutableListOf<ComicTranslation>()
                val savedPanels = comicPanelDao.getPanelsForPage(currentComicId, pageNumber)
                
                for (panel in analysis.panels) {
                    val panelEntity = savedPanels.find { it.panelIndex == panel.panelIndex }
                    if (panelEntity != null) {
                        for (bubble in panel.bubbles) {
                            translationEntities.add(
                                ComicTranslation(
                                    panelId = panelEntity.id,
                                    comicId = currentComicId,
                                    pageNumber = pageNumber,
                                    bubbleX = bubble.bounds.x,
                                    bubbleY = bubble.bounds.y,
                                    bubbleWidth = bubble.bounds.width,
                                    bubbleHeight = bubble.bounds.height,
                                    originalText = bubble.originalText,
                                    detectedLanguage = bubble.detectedLanguage,
                                    ocrConfidence = 0.9f,
                                    translatedText = bubble.translatedText,
                                    targetLanguage = targetLanguage
                                )
                            )
                        }
                    }
                }
                
                if (translationEntities.isNotEmpty()) {
                    comicPanelDao.insertTranslations(translationEntities)
                }
                
                // Reload from database
                val panels = comicDataService.getPanelDataForPage(currentComicId, pageNumber)
                val translations = comicDataService.getTranslationsForPage(currentComicId, pageNumber)
                
                _uiState.value = _uiState.value.copy(
                    isTranslating = false,
                    panels = panels,
                    translations = translations,
                    translationLanguage = targetLanguage,
                    detectionConfidence = analysis.confidence
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
                    tempDirectories.add(tempDir)
                    
                    entries.forEach { entry ->
                        val dest = File(tempDir, entry.name)
                        val destCanonical = dest.canonicalFile
                        val basePath = tempDir.canonicalPath + File.separator
                        if (!destCanonical.path.startsWith(basePath)) {
                            throw SecurityException("Zip entry path traversal: ${entry.name}")
                        }
                        destCanonical.parentFile?.mkdirs()
                        zipFile.getInputStream(entry).use { input ->
                            destCanonical.outputStream().use { output -> input.copyTo(output) }
                        }
                        pages.add(destCanonical.absolutePath)
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
                    tempDirectories.add(tempDir)
                    
                    archive.fileHeaders
                        .filter { !it.isDirectory && it.fileName.matches(Regex(".*\\.(jpg|jpeg|png|gif|bmp|webp)", RegexOption.IGNORE_CASE)) }
                        .sortedBy { it.fileName }
                        .forEach { header ->
val dest = File(tempDir, header.fileName)
val destCanonical = dest.canonicalFile
val basePath = tempDir.canonicalPath + File.separator
if (!destCanonical.path.startsWith(basePath)) {
    throw SecurityException("RAR entry path traversal: ${header.fileName}")
}
archive.extractFile(header, destCanonical.absolutePath)
pages.add(destCanonical.absolutePath)
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
        
        // Clean up temp directories to prevent storage accumulation
        viewModelScope.launch(Dispatchers.IO) {
            tempDirectories.forEach { dir ->
                try {
                    if (dir.exists()) {
                        dir.deleteRecursively()
                        Log.d("ComicReaderViewModel", "Cleaned up temp directory: ${dir.absolutePath}")
                    }
                } catch (e: Exception) {
                    Log.w("ComicReaderViewModel", "Failed to delete temp directory: ${dir.absolutePath}", e)
                }
            }
            tempDirectories.clear()
        }
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
