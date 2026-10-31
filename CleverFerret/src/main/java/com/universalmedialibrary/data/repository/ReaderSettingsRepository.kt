package com.universalmedialibrary.data.repository

import android.content.Context
import android.graphics.Typeface
import android.net.Uri
import android.provider.OpenableColumns
import com.universalmedialibrary.data.local.dao.CustomFontDao
import com.universalmedialibrary.data.local.dao.ReaderSettingsDao
import com.universalmedialibrary.data.local.dao.ReadingProgressData
import com.universalmedialibrary.data.local.entity.BookReaderSettingsEntity
import com.universalmedialibrary.data.local.entity.CustomFontEntity
import com.universalmedialibrary.data.local.entity.ReaderSettings
import com.universalmedialibrary.data.local.entity.ReaderSettingsEntity
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.util.UUID
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for managing reader settings and custom fonts
 */
@Singleton
class ReaderSettingsRepository @Inject constructor(
    @ApplicationContext private val context: Context,
    private val readerSettingsDao: ReaderSettingsDao,
    private val customFontDao: CustomFontDao
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
            settings.copy(updatedAt = System.currentTimeMillis())
        )
    }

    /**
     * Update specific global setting
     */
    suspend fun updateGlobalSetting(update: (ReaderSettingsEntity) -> ReaderSettingsEntity) {
        val current = getGlobalSettings()
        val updated = update(current).copy(updatedAt = System.currentTimeMillis())
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
                bookId = mediaId,
                updatedAt = System.currentTimeMillis()
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
            bookId = mediaId,
            updatedAt = System.currentTimeMillis()
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
                    bookId = mediaId,
                    currentChapter = chapter,
                    currentPosition = progress  // currentPosition is Float in entity
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
                (current ?: BookReaderSettingsEntity(bookId = mediaId)).copy(theme = theme)
            }
        } else {
            updateGlobalSetting { it.copy(theme = theme) }
        }
    }

    suspend fun updateFontSize(mediaId: Long?, fontSize: Int) {
        if (mediaId != null) {
            updateBookSetting(mediaId) { current ->
                (current ?: BookReaderSettingsEntity(bookId = mediaId)).copy(fontSize = fontSize)
            }
        } else {
            updateGlobalSetting { it.copy(fontSize = fontSize) }
        }
    }

    suspend fun updateLineHeight(mediaId: Long?, lineHeight: Float) {
        if (mediaId != null) {
            updateBookSetting(mediaId) { current ->
                (current ?: BookReaderSettingsEntity(bookId = mediaId)).copy(lineHeight = lineHeight)
            }
        } else {
            updateGlobalSetting { it.copy(lineHeight = lineHeight) }
        }
    }

    suspend fun updateTextAlignment(mediaId: Long?, alignment: String) {
        // textAlignment is global only, not per-book
        updateGlobalSetting { it.copy(textAlignment = alignment) }
    }

    // Custom Font Management Methods

    /**
     * Import custom font file from a SAF Uri into app's private storage (filesDir/fonts/)
     */
    suspend fun importCustomFont(uri: Uri, displayName: String? = null): CustomFontEntity {
        val fileName = displayName ?: getFileNameFromUri(uri) ?: "CustomFont_${System.currentTimeMillis()}"
        val extension = getExtensionFromNameOrUri(fileName, uri)
        if (!extension.equals("ttf", ignoreCase = true) && !extension.equals("otf", ignoreCase = true)) {
            throw IllegalArgumentException("Unsupported font file format: .$extension. Only TTF and OTF files are supported.")
        }

        val fontsDir = File(context.filesDir, "fonts").apply { if (!exists()) mkdirs() }
        val fontId = UUID.randomUUID().toString()
        val sanitizedFileName = fileName.replace(Regex("[^a-zA-Z0-9._-]"), "_")
        val destinationFile = File(fontsDir, "${fontId}_$sanitizedFileName")

        try {
            context.contentResolver.openInputStream(uri)?.use { inputStream ->
                FileOutputStream(destinationFile).use { outputStream ->
                    inputStream.copyTo(outputStream)
                }
            } ?: throw IOException("Unable to open input stream for font URI: $uri")

            // Validate font using Typeface
            val typeface = Typeface.createFromFile(destinationFile)
            if (typeface == null) {
                destinationFile.delete()
                throw IllegalArgumentException("Invalid or corrupted font file: $fileName")
            }
        } catch (e: Exception) {
            if (destinationFile.exists()) {
                destinationFile.delete()
            }
            if (e is IllegalArgumentException) throw e
            throw IllegalArgumentException("Failed to import font $fileName: ${e.message}", e)
        }

        val cleanDisplayName = fileName
            .removeSuffix(".ttf").removeSuffix(".TTF")
            .removeSuffix(".otf").removeSuffix(".OTF")

        val fontEntity = CustomFontEntity(
            id = fontId,
            displayName = cleanDisplayName,
            filePath = destinationFile.absolutePath,
            importedAt = System.currentTimeMillis()
        )

        customFontDao.insertCustomFont(fontEntity)
        return fontEntity
    }

    /**
     * Import custom font from a File directly into app's private storage (filesDir/fonts/)
     */
    suspend fun importCustomFontFile(file: File, displayName: String? = null): CustomFontEntity {
        if (!file.exists() || !file.isFile) {
            throw IllegalArgumentException("Font file does not exist: ${file.absolutePath}")
        }
        val fileName = displayName ?: file.name
        val extension = file.extension
        if (!extension.equals("ttf", ignoreCase = true) && !extension.equals("otf", ignoreCase = true)) {
            throw IllegalArgumentException("Unsupported font file format: .$extension. Only TTF and OTF files are supported.")
        }

        val fontsDir = File(context.filesDir, "fonts").apply { if (!exists()) mkdirs() }
        val fontId = UUID.randomUUID().toString()
        val sanitizedFileName = fileName.replace(Regex("[^a-zA-Z0-9._-]"), "_")
        val destinationFile = File(fontsDir, "${fontId}_$sanitizedFileName")

        try {
            file.inputStream().use { inputStream ->
                FileOutputStream(destinationFile).use { outputStream ->
                    inputStream.copyTo(outputStream)
                }
            }

            // Validate font using Typeface
            val typeface = Typeface.createFromFile(destinationFile)
            if (typeface == null) {
                destinationFile.delete()
                throw IllegalArgumentException("Invalid or corrupted font file: $fileName")
            }
        } catch (e: Exception) {
            if (destinationFile.exists()) {
                destinationFile.delete()
            }
            if (e is IllegalArgumentException) throw e
            throw IllegalArgumentException("Failed to import font $fileName: ${e.message}", e)
        }

        val cleanDisplayName = fileName
            .removeSuffix(".ttf").removeSuffix(".TTF")
            .removeSuffix(".otf").removeSuffix(".OTF")

        val fontEntity = CustomFontEntity(
            id = fontId,
            displayName = cleanDisplayName,
            filePath = destinationFile.absolutePath,
            importedAt = System.currentTimeMillis()
        )

        customFontDao.insertCustomFont(fontEntity)
        return fontEntity
    }

    /**
     * Get all custom fonts as reactive Flow
     */
    fun getCustomFontsFlow(): Flow<List<CustomFontEntity>> {
        return customFontDao.getAllCustomFontsFlow()
    }

    /**
     * Get list of all custom fonts
     */
    suspend fun getAllCustomFonts(): List<CustomFontEntity> {
        return customFontDao.getAllCustomFontsList()
    }

    /**
     * Get custom font by ID
     */
    suspend fun getCustomFontById(id: String): CustomFontEntity? {
        return customFontDao.getCustomFontById(id)
    }

    /**
     * Delete a custom font record and its physical file from disk
     */
    suspend fun deleteCustomFont(fontId: String) {
        val font = customFontDao.getCustomFontById(fontId) ?: return
        deleteCustomFont(font)
    }

    /**
     * Delete a custom font record and its physical file from disk
     */
    suspend fun deleteCustomFont(font: CustomFontEntity) {
        val file = File(font.filePath)
        if (file.exists()) {
            file.delete()
        }
        customFontDao.deleteCustomFont(font)
    }

    private fun getFileNameFromUri(uri: Uri): String? {
        var name: String? = null
        if (uri.scheme == "content") {
            try {
                context.contentResolver.query(uri, arrayOf(OpenableColumns.DISPLAY_NAME), null, null, null)?.use { cursor ->
                    if (cursor.moveToFirst()) {
                        val index = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME)
                        if (index != -1) {
                            name = cursor.getString(index)
                        }
                    }
                }
            } catch (e: Exception) {
                // Ignore query exceptions
            }
        }
        if (name == null) {
            name = uri.path?.let { File(it).name }
        }
        return name
    }

    private fun getExtensionFromNameOrUri(name: String, uri: Uri): String {
        val ext = File(name).extension
        if (ext.isNotEmpty()) return ext
        val pathExt = uri.path?.let { File(it).extension } ?: ""
        return pathExt
    }
}

/**
 * Statistics about reader settings usage
 */
data class SettingsStatistics(
    val totalBooksWithCustomSettings: Int,
    val averageReadingProgress: Float
)
