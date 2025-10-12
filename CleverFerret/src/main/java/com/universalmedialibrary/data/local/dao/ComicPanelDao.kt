package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.ComicPanelData
import com.universalmedialibrary.data.local.entity.ComicTranslation
import com.universalmedialibrary.data.local.entity.ComicReadingSession
import kotlinx.coroutines.flow.Flow

@Dao
interface ComicPanelDao {
    
    // Comic Panel Data operations
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertPanel(panel: ComicPanelData): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertPanels(panels: List<ComicPanelData>)
    
    @Update
    suspend fun updatePanel(panel: ComicPanelData)
    
    @Delete
    suspend fun deletePanel(panel: ComicPanelData)
    
    @Query("SELECT * FROM comic_panels WHERE comicId = :comicId AND pageNumber = :pageNumber ORDER BY readingOrder ASC")
    suspend fun getPanelsForPage(comicId: Long, pageNumber: Int): List<ComicPanelData>
    
    @Query("SELECT * FROM comic_panels WHERE comicId = :comicId ORDER BY pageNumber ASC, readingOrder ASC")
    suspend fun getAllPanelsForComic(comicId: Long): List<ComicPanelData>
    
    @Query("DELETE FROM comic_panels WHERE comicId = :comicId")
    suspend fun deleteAllPanelsForComic(comicId: Long)
    
    @Query("DELETE FROM comic_panels WHERE comicId = :comicId AND pageNumber = :pageNumber")
    suspend fun deletePanelsForPage(comicId: Long, pageNumber: Int)
    
    @Query("SELECT COUNT(*) FROM comic_panels WHERE comicId = :comicId AND pageNumber = :pageNumber")
    suspend fun getPanelCountForPage(comicId: Long, pageNumber: Int): Int
    
    // Comic Translation operations
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertTranslation(translation: ComicTranslation): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertTranslations(translations: List<ComicTranslation>)
    
    @Update
    suspend fun updateTranslation(translation: ComicTranslation)
    
    @Delete
    suspend fun deleteTranslation(translation: ComicTranslation)
    
    @Query("SELECT * FROM comic_translations WHERE panelId = :panelId")
    suspend fun getTranslationsForPanel(panelId: Long): List<ComicTranslation>
    
    @Query("SELECT * FROM comic_translations WHERE comicId = :comicId AND pageNumber = :pageNumber")
    suspend fun getTranslationsForPage(comicId: Long, pageNumber: Int): List<ComicTranslation>
    
    @Query("SELECT * FROM comic_translations WHERE comicId = :comicId")
    suspend fun getAllTranslationsForComic(comicId: Long): List<ComicTranslation>
    
    @Query("DELETE FROM comic_translations WHERE comicId = :comicId")
    suspend fun deleteAllTranslationsForComic(comicId: Long)
    
    @Query("DELETE FROM comic_translations WHERE panelId = :panelId")
    suspend fun deleteTranslationsForPanel(panelId: Long)
    
    // Comic Reading Session operations
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertReadingSession(session: ComicReadingSession)
    
    @Update
    suspend fun updateReadingSession(session: ComicReadingSession)
    
    @Delete
    suspend fun deleteReadingSession(session: ComicReadingSession)
    
    @Query("SELECT * FROM comic_reading_sessions WHERE comicId = :comicId")
    suspend fun getReadingSession(comicId: Long): ComicReadingSession?
    
    @Query("SELECT * FROM comic_reading_sessions WHERE comicId = :comicId")
    fun getReadingSessionFlow(comicId: Long): Flow<ComicReadingSession?>
    
    @Query("SELECT * FROM comic_reading_sessions ORDER BY lastReadAt DESC")
    fun getAllReadingSessions(): Flow<List<ComicReadingSession>>
    
    @Query("SELECT * FROM comic_reading_sessions ORDER BY lastReadAt DESC LIMIT :limit")
    suspend fun getRecentReadingSessions(limit: Int = 10): List<ComicReadingSession>
    
    @Query("UPDATE comic_reading_sessions SET currentPage = :page, currentPanel = :panel, lastReadAt = :timestamp WHERE comicId = :comicId")
    suspend fun updateReadingProgress(comicId: Long, page: Int, panel: Int, timestamp: Long = System.currentTimeMillis())
    
    @Query("UPDATE comic_reading_sessions SET enableTranslation = :enabled WHERE comicId = :comicId")
    suspend fun updateTranslationEnabled(comicId: Long, enabled: Boolean)
    
    @Query("UPDATE comic_reading_sessions SET targetLanguage = :language WHERE comicId = :comicId")
    suspend fun updateTargetLanguage(comicId: Long, language: String)
    
    @Query("UPDATE comic_reading_sessions SET readingMode = :mode WHERE comicId = :comicId")
    suspend fun updateReadingMode(comicId: Long, mode: String)
}
