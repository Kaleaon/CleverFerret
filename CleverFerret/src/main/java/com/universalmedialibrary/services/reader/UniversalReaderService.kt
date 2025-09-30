package com.universalmedialibrary.services.reader

import android.content.Context
import android.net.Uri
import com.universalmedialibrary.data.local.entity.ReadingProgress
import com.universalmedialibrary.data.local.dao.BookmarkDao
import com.universalmedialibrary.services.reader.core.BookSource
import com.universalmedialibrary.services.reader.core.Locator
import com.universalmedialibrary.services.reader.core.ReaderEngine
import com.universalmedialibrary.services.reader.model.BookFormat
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.withContext
import com.google.gson.Gson
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Enhanced Universal Reader Service that manages reading sessions across all supported formats.
 *
 * Features:
 * - Format-agnostic reading interface
 * - Persistent reading progress
 * - Session management
 * - Cross-format navigation consistency
 * - Automatic progress saving
 */
@Singleton
class EnhancedUniversalReaderService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val readerEngineFactory: ReaderEngineFactory,
    private val bookmarkDao: BookmarkDao
) {

    private val gson = Gson()

    private val _readerState = MutableStateFlow(UniversalReaderState())
    val readerState: Flow<UniversalReaderState> = _readerState.asStateFlow()

    private var currentEngine: ReaderEngine? = null
    private var currentBookId: Long = 0
    private var currentFormat: BookFormat = BookFormat.UNKNOWN

    /**
     * Open a book for reading
     */
    suspend fun openBook(
        bookId: Long,
        uri: Uri,
        format: BookFormat
    ): Result<Unit> {
        return withContext(Dispatchers.IO) {
            try {
                // Close current book if any
                closeCurrentBook()

                if (!readerEngineFactory.isFormatSupported(format)) {
                    return@withContext Result.failure(
                        UnsupportedOperationException("Format not supported: $format")
                    )
                }

                // Create appropriate reader engine
                val engine = readerEngineFactory.createReaderEngine(format)

                // Open the book
                val source = BookSource.File(uri)
                val result = engine.open(context, source)

                if (result.isSuccess) {
                    currentEngine = engine
                    currentBookId = bookId
                    currentFormat = format

                    // Load saved reading progress
                    loadReadingProgress(bookId)

                    _readerState.value = _readerState.value.copy(
                        isBookOpen = true,
                        bookId = bookId,
                        format = format,
                        error = null
                    )
                }

                result

            } catch (e: Exception) {
                _readerState.value = _readerState.value.copy(
                    error = "Failed to open book: ${e.message}"
                )
                Result.failure(e)
            }
        }
    }

    /**
     * Navigate to a specific location in the book
     */
    suspend fun goToLocation(locator: Locator): Result<Unit> {
        val engine = currentEngine ?: return Result.failure(
            IllegalStateException("No book is currently open")
        )

        val result = engine.goTo(locator)
        if (result.isSuccess) {
            saveReadingProgress(locator)
        }
        return result
    }

    /**
     * Go to next page/chapter
     */
    suspend fun goNext(): Boolean {
        val engine = currentEngine ?: return false

        val success = engine.next()
        if (success) {
            val currentLocator = engine.currentLocator.first()
            saveReadingProgress(currentLocator)
        }
        return success
    }

    /**
     * Go to previous page/chapter
     */
    suspend fun goPrevious(): Boolean {
        val engine = currentEngine ?: return false

        val success = engine.previous()
        if (success) {
            val currentLocator = engine.currentLocator.first()
            saveReadingProgress(currentLocator)
        }
        return success
    }

    /**
     * Search within the current book
     */
    suspend fun searchInBook(query: String): List<Locator> {
        val engine = currentEngine ?: return emptyList()
        return engine.search(query)
    }

    /**
     * Get current reading position
     */
    fun getCurrentLocator(): Flow<Locator>? {
        return currentEngine?.currentLocator
    }

    /**
     * Close current book
     */
    suspend fun closeCurrentBook() {
        currentEngine?.let { engine ->
            // Save final reading progress
            val currentLocator = engine.currentLocator.first()
            saveReadingProgress(currentLocator)

            // Close the engine
            engine.close()
        }

        currentEngine = null
        currentBookId = 0
        currentFormat = BookFormat.UNKNOWN

        _readerState.value = _readerState.value.copy(
            isBookOpen = false,
            bookId = 0,
            format = BookFormat.UNKNOWN
        )
    }

    /**
     * Get current reader engine (for format-specific operations)
     */
    fun getCurrentEngine(): ReaderEngine? = currentEngine

    /**
     * Get current book format
     */
    fun getCurrentFormat(): BookFormat = currentFormat

    /**
     * Check if a book is currently open
     */
    fun isBookOpen(): Boolean = currentEngine != null

    private suspend fun loadReadingProgress(bookId: Long) {
        try {
            val progress = bookmarkDao.getReadingProgress(bookId)
            progress?.let {
                // Parse the saved locator and navigate to it
                val locator = gson.fromJson(it.notes ?: "{}", Locator::class.java)
                currentEngine?.goTo(locator)
            }
        } catch (e: Exception) {
            // Failed to load progress, start from beginning
        }
    }

    private suspend fun saveReadingProgress(locator: Locator) {
        if (currentBookId <= 0) return

        try {
            val locatorJson = gson.toJson(locator)
            val totalPages = locator.locations["totalPages"] as? Int ?: 0
            val currentPage = (locator.locations["pageNumber"] as? Int)
                ?: (locator.locations["chapterIndex"] as? Int ?: 0) + 1

            val progressPercentage = if (totalPages > 0) {
                (currentPage.toFloat() / totalPages.toFloat())
            } else 0f

            // Check if progress exists
            val existingProgress = bookmarkDao.getReadingProgress(currentBookId)

            if (existingProgress != null) {
                // Update existing progress
                bookmarkDao.updateReadingProgress(
                    existingProgress.copy(
                        currentPage = currentPage,
                        percentage = progressPercentage,
                        notes = locatorJson,
                        lastUpdate = System.currentTimeMillis()
                    )
                )
            } else {
                // Create new progress
                val progress = ReadingProgress(
                    itemId = currentBookId,
                    currentPage = currentPage,
                    percentage = progressPercentage,
                    notes = locatorJson,
                    lastUpdate = System.currentTimeMillis(),
                    startedDate = System.currentTimeMillis()
                )

                bookmarkDao.insertReadingProgress(progress)
            }

        } catch (e: Exception) {
            // Failed to save progress, continue reading
        }
    }
}

/**
 * State of the universal reader
 */
data class UniversalReaderState(
    val isBookOpen: Boolean = false,
    val bookId: Long = 0,
    val format: BookFormat = BookFormat.UNKNOWN,
    val error: String? = null
)
