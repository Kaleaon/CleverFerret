package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.ReaderSettingsDao
import com.universalmedialibrary.data.local.entity.ReaderSettingsEntity
import com.universalmedialibrary.data.local.entity.BookReaderSettingsEntity
import com.universalmedialibrary.data.local.entity.ReaderSettings
import com.universalmedialibrary.data.local.dao.ReadingProgressData
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for managing reader settings
 */
@Singleton
class ReaderSettingsRepository @Inject constructor(
    private val readerSettingsDao: ReaderSettingsDao
) {
    
    /**
     * Get combined reader settings for a book (global + book overrides)
     */
    suspend fun getReaderSettings(mediaId: Long): ReaderSettings {
        val global = getGlobalSettings()
        val book = readerSettingsDao.getBookSettings(mediaId)
        return ReaderSettings.merge(global, book)
    }
    
    /**
     * Get combined reader settings as Flow for reactive updates
     */
    fun getReaderSettingsFlow(mediaId: Long): Flow<ReaderSettings> {
        return combine(
            getGlobalSettingsFlow(),
            readerSettingsDao.getBookSettingsFlow(mediaId)
        ) { global, book ->
            ReaderSettings.merge(global, book)
        }
    }
    
    /**
     * Get global reader settings
     */
    suspend fun getGlobalSettings(): ReaderSettingsEntity {
        return readerSettingsDao.getGlobalSettings() ?: ReaderSettings.default()
    }
    
    /**
     * Get global reader settings as Flow
     */
    fun getGlobalSettingsFlow(): Flow<ReaderSettingsEntity> {
        return readerSettingsDao.getGlobalSettingsFlow().let { flow ->
            combine(flow) { array ->
                array[0] ?: ReaderSettings.default()
            }
        }
    }
    
    /**
     * Update global reader settings
     */
    suspend fun updateGlobalSettings(settings: ReaderSettingsEntity) {
        readerSettingsDao.insertOrUpdateGlobalSettings(
            settings.copy(lastModified = System.currentTimeMillis())
        )
    }
    
    /**
     * Update specific global setting
     */
    suspend fun updateGlobalSetting(update: (ReaderSettingsEntity) -> ReaderSettingsEntity) {
        val current = getGlobalSettings()
        val updated = update(current).copy(lastModified = System.currentTimeMillis())
        readerSettingsDao.insertOrUpdateGlobalSettings(updated)
    }
    
    /**
     * Get book-specific settings (without global merge)
     */
    suspend fun getBookSettings(mediaId: Long): BookReaderSettingsEntity? {
        return readerSettingsDao.getBookSettings(mediaId)
    }
    
    /**
     * Update book-specific settings
     */
    suspend fun updateBookSettings(mediaId: Long, settings: BookReaderSettingsEntity) {
        readerSettingsDao.insertOrUpdateBookSettings(
            settings.copy(
                mediaId = mediaId,
                lastModified = System.currentTimeMillis()
            )
        )
    }
    
    /**
     * Update specific book setting
     */
    suspend fun updateBookSetting(
        mediaId: Long,
        update: (BookReaderSettingsEntity?) -> BookReaderSettingsEntity
    ) {
        val current = readerSettingsDao.getBookSettings(mediaId)
        val updated = update(current).copy(
            mediaId = mediaId,
            lastModified = System.currentTimeMillis()
        )
        readerSettingsDao.insertOrUpdateBookSettings(updated)
    }
    
    /**
     * Remove book-specific settings (will fall back to global)
     */
    suspend fun removeBookSettings(mediaId: Long) {
        readerSettingsDao.deleteBookSettingsById(mediaId)
    }
    
    /**
     * Update reading progress for a book
     */
    suspend fun updateReadingProgress(
        mediaId: Long,
        chapter: Int,
        position: Long,
        progress: Float
    ) {
        // First ensure book settings exist
        if (readerSettingsDao.getBookSettings(mediaId) == null) {
            readerSettingsDao.insertOrUpdateBookSettings(
                BookReaderSettingsEntity(
                    mediaId = mediaId,
                    currentChapter = chapter,
                    currentPosition = position,
                    totalProgress = progress
                )
            )
        } else {
            readerSettingsDao.updateReadingProgress(mediaId, chapter, position, progress)
        }
    }
    
    /**
     * Get reading progress for a book
     */
    suspend fun getReadingProgress(mediaId: Long): ReadingProgressData? {
        return readerSettingsDao.getReadingProgress(mediaId)
    }
    
    /**
     * Get all books with custom settings
     */
    suspend fun getAllBooksWithCustomSettings(): List<BookReaderSettingsEntity> {
        return readerSettingsDao.getAllBookSettings()
    }
    
    /**
     * Reset all settings to defaults
     */
    suspend fun resetToDefaults() {
        readerSettingsDao.insertOrUpdateGlobalSettings(ReaderSettings.default())
    }
    
    /**
     * Clean up orphaned book settings
     */
    suspend fun cleanupOrphanedSettings() {
        readerSettingsDao.cleanupOrphanedBookSettings()
    }
    
    /**
     * Get statistics
     */
    suspend fun getSettingsStatistics(): SettingsStatistics {
        return SettingsStatistics(
            totalBooksWithCustomSettings = readerSettingsDao.getBookSettingsCount(),
            averageReadingProgress = readerSettingsDao.getAverageReadingProgress() ?: 0f
        )
    }
    
    // Convenience methods for common setting updates
    
    suspend fun updateTheme(mediaId: Long?, theme: String) {
        if (mediaId != null) {
            updateBookSetting(mediaId) { current ->
                (current ?: BookReaderSettingsEntity(mediaId = mediaId)).copy(theme = theme)
            }
        } else {
            updateGlobalSetting { it.copy(theme = theme) }
        }
    }
    
    suspend fun updateFontSize(mediaId: Long?, fontSize: Int) {
        if (mediaId != null) {
            updateBookSetting(mediaId) { current ->
                (current ?: BookReaderSettingsEntity(mediaId = mediaId)).copy(fontSize = fontSize)
            }
        } else {
            updateGlobalSetting { it.copy(fontSize = fontSize) }
        }
    }
    
    suspend fun updateLineSpacing(mediaId: Long?, lineSpacing: Float) {
        if (mediaId != null) {
            updateBookSetting(mediaId) { current ->
                (current ?: BookReaderSettingsEntity(mediaId = mediaId)).copy(lineSpacing = lineSpacing)
            }
        } else {
            updateGlobalSetting { it.copy(lineSpacing = lineSpacing) }
        }
    }
    
    suspend fun updateTextAlignment(mediaId: Long?, alignment: String) {
        if (mediaId != null) {
            updateBookSetting(mediaId) { current ->
                (current ?: BookReaderSettingsEntity(mediaId = mediaId)).copy(textAlignment = alignment)
            }
        } else {
            updateGlobalSetting { it.copy(textAlignment = alignment) }
        }
    }
}

/**
 * Statistics about reader settings usage
 */
data class SettingsStatistics(
    val totalBooksWithCustomSettings: Int,
    val averageReadingProgress: Float
)