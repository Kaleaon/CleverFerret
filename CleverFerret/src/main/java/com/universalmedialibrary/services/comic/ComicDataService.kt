package com.universalmedialibrary.services.comic

import android.content.Context
import android.util.Log
import com.universalmedialibrary.data.local.dao.ComicPanelDao
import com.universalmedialibrary.data.local.entity.ComicPanelData
import com.universalmedialibrary.data.local.entity.ComicPanelDataExport
import com.universalmedialibrary.data.local.entity.ComicTranslation
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Comic Data Service
 * 
 * Manages saving and loading comic panel data and translations
 * Exports data as JSON files that can be distributed with comics
 */
@Singleton
class ComicDataService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val comicPanelDao: ComicPanelDao
) {
    
    companion object {
        private const val TAG = "ComicDataService"
        private const val PANEL_DATA_SUFFIX = ".panels.json"
        private const val TRANSLATION_DATA_SUFFIX = ".translations.json"
    }
    
    private val json = Json {
        prettyPrint = true
        ignoreUnknownKeys = true
    }
    
    /**
     * Save panel data to database
     */
    suspend fun savePanelData(
        comicId: Long,
        comicFilePath: String,
        detectionResult: PanelDetectionResult
    ) {
        withContext(Dispatchers.IO) {
            try {
                // Convert detected panels to database entities
                val panelEntities = detectionResult.panels.map { panel ->
                    ComicPanelData(
                        comicId = comicId,
                        comicFilePath = comicFilePath,
                        pageNumber = panel.pageNumber,
                        totalPages = 1, // Will be updated later
                        panelIndex = panel.panelIndex,
                        x = panel.bounds.x,
                        y = panel.bounds.y,
                        width = panel.bounds.width,
                        height = panel.bounds.height,
                        confidence = panel.confidence,
                        readingOrder = panel.readingOrder
                    )
                }
                
                // Delete existing panels for this page
                comicPanelDao.deletePanelsForPage(comicId, detectionResult.pageNumber)
                
                // Insert new panels
                comicPanelDao.insertPanels(panelEntities)
                
                Log.d(TAG, "Saved ${panelEntities.size} panels for page ${detectionResult.pageNumber}")
            } catch (e: Exception) {
                Log.e(TAG, "Error saving panel data: ${e.message}", e)
            }
        }
    }
    
    /**
     * Save translation data to database
     */
    suspend fun saveTranslationData(
        comicId: Long,
        pageTranslation: PageTranslationResult
    ) {
        withContext(Dispatchers.IO) {
            try {
                val translationEntities = mutableListOf<ComicTranslation>()
                
                for (panelTranslation in pageTranslation.panels) {
                    // Get panel ID from database
                    val panels = comicPanelDao.getPanelsForPage(comicId, pageTranslation.pageNumber)
                    val panelEntity = panels.find { it.panelIndex == panelTranslation.panelIndex }
                    
                    if (panelEntity != null) {
                        for (bubbleTranslation in panelTranslation.bubbles) {
                            // Skip bubbles without translation
                            if (bubbleTranslation.translatedText == null || bubbleTranslation.translatedText.isBlank()) {
                                continue
                            }
                            
                            val entity = ComicTranslation(
                                panelId = panelEntity.id,
                                comicId = comicId,
                                pageNumber = pageTranslation.pageNumber,
                                bubbleX = bubbleTranslation.bounds.x,
                                bubbleY = bubbleTranslation.bounds.y,
                                bubbleWidth = bubbleTranslation.bounds.width,
                                bubbleHeight = bubbleTranslation.bounds.height,
                                originalText = bubbleTranslation.originalText ?: "",
                                detectedLanguage = pageTranslation.sourceLanguage,
                                ocrConfidence = bubbleTranslation.confidence,
                                translatedText = bubbleTranslation.translatedText,
                                targetLanguage = pageTranslation.targetLanguage
                            )
                            translationEntities.add(entity)
                        }
                    }
                }
                
                // Insert translations
                if (translationEntities.isNotEmpty()) {
                    comicPanelDao.insertTranslations(translationEntities)
                    Log.d(TAG, "Saved ${translationEntities.size} translations for page ${pageTranslation.pageNumber}")
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error saving translation data: ${e.message}", e)
            }
        }
    }
    
    /**
     * Export panel data to JSON file
     * Saved alongside the comic file for portability
     */
    suspend fun exportPanelDataToFile(
        comicId: Long,
        comicFilePath: String,
        comicTitle: String,
        totalPages: Int
    ): File? {
        return withContext(Dispatchers.IO) {
            try {
                // Load all panels from database
                val panels = comicPanelDao.getAllPanelsForComic(comicId)
                val translations = comicPanelDao.getAllTranslationsForComic(comicId)
                
                // Group by page
                val pageData = panels.groupBy { it.pageNumber }.map { (pageNumber, pagePanels) ->
                    val pageTranslations = translations.filter { it.pageNumber == pageNumber }
                    
                    ComicPanelDataExport.PageData(
                        pageNumber = pageNumber,
                        panels = pagePanels.map { panel ->
                            ComicPanelDataExport.PanelData(
                                panelIndex = panel.panelIndex,
                                x = panel.x,
                                y = panel.y,
                                width = panel.width,
                                height = panel.height,
                                readingOrder = panel.readingOrder,
                                confidence = panel.confidence
                            )
                        },
                        translations = pageTranslations.map { translation ->
                            ComicPanelDataExport.TranslationData(
                                panelIndex = panels.find { it.id == translation.panelId }?.panelIndex ?: 0,
                                bubbleX = translation.bubbleX,
                                bubbleY = translation.bubbleY,
                                bubbleWidth = translation.bubbleWidth,
                                bubbleHeight = translation.bubbleHeight,
                                originalText = translation.originalText,
                                detectedLanguage = translation.detectedLanguage,
                                translatedText = translation.translatedText,
                                targetLanguage = translation.targetLanguage,
                                fontSize = translation.fontSize,
                                fontColor = translation.fontColor,
                                backgroundColor = translation.backgroundColor
                            )
                        }
                    )
                }.sortedBy { it.pageNumber }
                
                // Create export object
                val export = ComicPanelDataExport(
                    comicFilePath = comicFilePath,
                    comicTitle = comicTitle,
                    totalPages = totalPages,
                    pages = pageData
                )
                
                // Serialize to JSON
                val jsonString = json.encodeToString(export)
                
                // Save to file
                val exportFile = File(comicFilePath + PANEL_DATA_SUFFIX)
                exportFile.writeText(jsonString)
                
                Log.d(TAG, "Exported panel data to ${exportFile.absolutePath}")
                exportFile
            } catch (e: Exception) {
                Log.e(TAG, "Error exporting panel data: ${e.message}", e)
                null
            }
        }
    }
    
    /**
     * Import panel data from JSON file
     */
    suspend fun importPanelDataFromFile(
        comicId: Long,
        comicFilePath: String
    ): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                val importFile = File(comicFilePath + PANEL_DATA_SUFFIX)
                
                if (!importFile.exists()) {
                    Log.d(TAG, "No panel data file found at ${importFile.absolutePath}")
                    return@withContext false
                }
                
                // Read and parse JSON
                val jsonString = importFile.readText()
                val export = json.decodeFromString<ComicPanelDataExport>(jsonString)
                
                // Clear existing data
                comicPanelDao.deleteAllPanelsForComic(comicId)
                comicPanelDao.deleteAllTranslationsForComic(comicId)
                
                // Import panels
                val panelEntities = mutableListOf<ComicPanelData>()
                val translationEntities = mutableListOf<ComicTranslation>()
                
                for (pageData in export.pages) {
                    for (panelData in pageData.panels) {
                        val panelEntity = ComicPanelData(
                            comicId = comicId,
                            comicFilePath = comicFilePath,
                            pageNumber = pageData.pageNumber,
                            totalPages = export.totalPages,
                            panelIndex = panelData.panelIndex,
                            x = panelData.x,
                            y = panelData.y,
                            width = panelData.width,
                            height = panelData.height,
                            confidence = panelData.confidence,
                            readingOrder = panelData.readingOrder
                        )
                        panelEntities.add(panelEntity)
                    }
                }
                
                // Insert panels first
                comicPanelDao.insertPanels(panelEntities)
                
                // Get inserted panel IDs and create translations
                for (pageData in export.pages) {
                    val pagePanels = comicPanelDao.getPanelsForPage(comicId, pageData.pageNumber)
                    
                    for (translationData in pageData.translations) {
                        val panelEntity = pagePanels.find { it.panelIndex == translationData.panelIndex }
                        
                        if (panelEntity != null) {
                            val translationEntity = ComicTranslation(
                                panelId = panelEntity.id,
                                comicId = comicId,
                                pageNumber = pageData.pageNumber,
                                bubbleX = translationData.bubbleX,
                                bubbleY = translationData.bubbleY,
                                bubbleWidth = translationData.bubbleWidth,
                                bubbleHeight = translationData.bubbleHeight,
                                originalText = translationData.originalText,
                                detectedLanguage = translationData.detectedLanguage,
                                translatedText = translationData.translatedText,
                                targetLanguage = translationData.targetLanguage,
                                fontSize = translationData.fontSize,
                                fontColor = translationData.fontColor,
                                backgroundColor = translationData.backgroundColor
                            )
                            translationEntities.add(translationEntity)
                        }
                    }
                }
                
                // Insert translations
                if (translationEntities.isNotEmpty()) {
                    comicPanelDao.insertTranslations(translationEntities)
                }
                
                Log.d(TAG, "Imported ${panelEntities.size} panels and ${translationEntities.size} translations")
                true
            } catch (e: Exception) {
                Log.e(TAG, "Error importing panel data: ${e.message}", e)
                false
            }
        }
    }
    
    /**
     * Check if panel data exists for a comic
     */
    suspend fun hasPanelData(comicId: Long): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                val panels = comicPanelDao.getAllPanelsForComic(comicId)
                panels.isNotEmpty()
            } catch (e: Exception) {
                false
            }
        }
    }
    
    /**
     * Get panel data for a specific page
     */
    suspend fun getPanelDataForPage(comicId: Long, pageNumber: Int): List<ComicPanelData> {
        return withContext(Dispatchers.IO) {
            comicPanelDao.getPanelsForPage(comicId, pageNumber)
        }
    }
    
    /**
     * Get translations for a specific page
     */
    suspend fun getTranslationsForPage(comicId: Long, pageNumber: Int): List<ComicTranslation> {
        return withContext(Dispatchers.IO) {
            comicPanelDao.getTranslationsForPage(comicId, pageNumber)
        }
    }
}
