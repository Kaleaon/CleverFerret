package com.universalmedialibrary.services.playlist

import android.content.Context
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.PlaylistDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.Playlist
import com.universalmedialibrary.data.local.entity.PlaylistItem
import com.universalmedialibrary.data.repository.HistoryRepository
import com.universalmedialibrary.services.playback.UnifiedPlaybackQueueManager
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.firstOrNull
import java.util.UUID
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Audiobook Playlist Manager
 *
 * Specialized playlist manager for audiobooks with features:
 * - Series management (reading order, related books)
 * - Reading lists (to-read, currently reading, finished)
 * - Author collections
 * - Genre-based recommendations
 * - Multi-book listening queues
 * - Bookmark and chapter support integration
 */
@Singleton
class AudiobookPlaylistManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val playlistDao: PlaylistDao,
    private val mediaItemDao: MediaItemDao,
    private val queueManager: UnifiedPlaybackQueueManager,
    private val historyRepository: HistoryRepository
) {

    /**
     * Create a new audiobook playlist
     */
    suspend fun createPlaylist(
        name: String,
        description: String? = null,
        isSeries: Boolean = false,
        isPublic: Boolean = false
    ): Long {
        val playlist = Playlist(
            name = name,
            description = description,
            isPublic = isPublic,
            shareCode = if (isPublic) generateShareCode() else null
        )
        return playlistDao.insertPlaylist(playlist)
    }

    /**
     * Add an audiobook to a playlist
     */
    suspend fun addAudiobookToPlaylist(playlistId: Long, audiobookId: Long) {
        val audiobook = mediaItemDao.getMediaItemById(audiobookId)
        require(audiobook != null) { "Audiobook $audiobookId not found" }
        require(audiobook.mediaType in listOf("BOOK", "AUDIOBOOK")) { 
            "Media item is not an audiobook" 
        }

        val nextPosition = playlistDao.getMaxPosition(playlistId) + 1
        playlistDao.insertPlaylistItem(
            PlaylistItem(
                playlistId = playlistId,
                mediaItemId = audiobookId,
                position = nextPosition
            )
        )
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Add multiple audiobooks to a playlist
     */
    suspend fun addAudiobooksToPlaylist(playlistId: Long, audiobookIds: List<Long>) {
        var position = playlistDao.getMaxPosition(playlistId) + 1
        audiobookIds.forEach { audiobookId ->
            val audiobook = mediaItemDao.getMediaItemById(audiobookId)
            if (audiobook != null && audiobook.mediaType in listOf("BOOK", "AUDIOBOOK")) {
                playlistDao.insertPlaylistItem(
                    PlaylistItem(
                        playlistId = playlistId,
                        mediaItemId = audiobookId,
                        position = position++
                    )
                )
            }
        }
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Remove an audiobook from a playlist
     */
    suspend fun removeAudiobookFromPlaylist(playlistId: Long, audiobookId: Long) {
        playlistDao.removeFromPlaylist(playlistId, audiobookId)
        reorderPlaylistItems(playlistId)
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Create a book series playlist
     */
    suspend fun createSeriesPlaylist(
        seriesName: String,
        bookIds: List<Long>,
        description: String? = null
    ): Long {
        val seriesId = createPlaylist(
            name = seriesName,
            description = description ?: "Book series in reading order",
            isSeries = true
        )
        
        addAudiobooksToPlaylist(seriesId, bookIds)
        
        return seriesId
    }

    /**
     * Reorder books in a series (important for reading order)
     */
    suspend fun reorderSeries(playlistId: Long, fromPosition: Int, toPosition: Int) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
        val itemToMove = items.find { it.position == fromPosition } ?: return

        playlistDao.removeFromPlaylist(playlistId, itemToMove.mediaItemId)

        items.filter { it.position > fromPosition }.forEach { item ->
            playlistDao.insertPlaylistItem(item.copy(position = item.position - 1))
        }

        items.filter { it.position >= toPosition && it.position < fromPosition }.forEach { item ->
            playlistDao.insertPlaylistItem(item.copy(position = item.position + 1))
        }

        playlistDao.insertPlaylistItem(itemToMove.copy(position = toPosition))
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Create a "To Read" list
     */
    suspend fun createToReadList(name: String = "To Read"): Long {
        return createPlaylist(
            name = name,
            description = "Books I want to read"
        )
    }

    /**
     * Add book to "To Read" list
     */
    suspend fun addToReadingList(audiobookId: Long) {
        val readingList = getOrCreateDefaultReadingList()
        addAudiobookToPlaylist(readingList, audiobookId)
    }

    /**
     * Create a "Currently Reading" list
     */
    suspend fun createCurrentlyReadingList(name: String = "Currently Reading"): Long {
        return createPlaylist(
            name = name,
            description = "Books I'm currently reading"
        )
    }

    /**
     * Mark book as currently reading
     */
    suspend fun markAsCurrentlyReading(audiobookId: Long) {
        val currentList = getOrCreateCurrentlyReadingList()
        addAudiobookToPlaylist(currentList, audiobookId)
    }

    /**
     * Create a "Finished" list
     */
    suspend fun createFinishedList(name: String = "Finished Books"): Long {
        return createPlaylist(
            name = name,
            description = "Books I've finished reading"
        )
    }

    /**
     * Mark book as finished
     */
    suspend fun markAsFinished(audiobookId: Long) {
        val finishedList = getOrCreateFinishedList()
        addAudiobookToPlaylist(finishedList, audiobookId)
        
        // Remove from currently reading
        val currentList = getOrCreateCurrentlyReadingList()
        removeAudiobookFromPlaylist(currentList, audiobookId)
    }

    /**
     * Create an author collection
     */
    suspend fun createAuthorCollection(authorName: String): Long {
        val collectionId = createPlaylist(
            name = "$authorName Books",
            description = "Books by $authorName"
        )

        val books = mediaItemDao.getMediaItemsByType("BOOK").first()
        // TODO: Filter by author when metadata is available
        
        addAudiobooksToPlaylist(collectionId, books.map { it.itemId })
        
        return collectionId
    }

    /**
     * Create a genre collection
     */
    suspend fun createGenreCollection(genre: String): Long {
        val collectionId = createPlaylist(
            name = "$genre Audiobooks",
            description = "Audiobooks in the $genre genre"
        )

        val books = mediaItemDao.getMediaItemsByType("BOOK").first()
        // TODO: Filter by genre when metadata is available
        
        addAudiobooksToPlaylist(collectionId, books.map { it.itemId })
        
        return collectionId
    }

    /**
     * Sort playlist by various criteria
     */
    suspend fun sortPlaylist(
        playlistId: Long,
        sortBy: AudiobookSortOption
    ) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
        val books = items.mapNotNull { item ->
            mediaItemDao.getMediaItemById(item.mediaItemId)?.let { it to item }
        }

        val sorted = when (sortBy) {
            AudiobookSortOption.TITLE_ASC -> books.sortedBy { it.first.fileName }
            AudiobookSortOption.TITLE_DESC -> books.sortedByDescending { it.first.fileName }
            AudiobookSortOption.DATE_ADDED_ASC -> books.sortedBy { it.first.dateAdded }
            AudiobookSortOption.DATE_ADDED_DESC -> books.sortedByDescending { it.first.dateAdded }
            AudiobookSortOption.READING_ORDER -> books // Keep series order
        }

        sorted.forEachIndexed { index, (_, item) ->
            playlistDao.insertPlaylistItem(item.copy(position = index))
        }
        
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Start listening to a playlist from the beginning
     */
    suspend fun startPlaylist(playlistId: Long, startPosition: Int = 0) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
            .sortedBy { it.position }
            .drop(startPosition)
        
        val books = items.mapNotNull { 
            mediaItemDao.getMediaItemById(it.mediaItemId) 
        }

        if (books.isEmpty()) return

        // Create or switch to audiobook queue
        queueManager.createOrSwitchToQueue("AUDIOBOOK_QUEUE", "AUDIOBOOK", "Audiobooks")

        // Enqueue books
        queueManager.enqueueItems(books, insertAtCurrent = false)

        // Start playback
        queueManager.play()
    }

    /**
     * Continue series from where left off
     */
    suspend fun continueSeries(playlistId: Long) {
        // Get playlist items
        val playlistItems = playlistDao.getPlaylistItemsFlow(playlistId).first()
        
        // Find last read book from progress
        var startIndex = 0
        for ((index, item) in playlistItems.withIndex()) {
            val progress = historyRepository.getReadingProgress(item.mediaItemId).firstOrNull()
            if (progress != null && progress.percentage < 95.0f) {
                startIndex = index
                break
            }
        }
        
        startPlaylist(playlistId, startIndex)
    }

    /**
     * Add playlist to queue
     */
    suspend fun addPlaylistToQueue(playlistId: Long, playNext: Boolean = false) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
        val books = items.mapNotNull { 
            mediaItemDao.getMediaItemById(it.mediaItemId) 
        }

        if (books.isEmpty()) return

        queueManager.enqueueItems(books, insertAtCurrent = playNext)
    }

    /**
     * Get all audiobook playlists
     */
    fun getAllPlaylists(): Flow<List<Playlist>> = playlistDao.getAllPlaylistsFlow()

    /**
     * Get playlist with full audiobook information
     */
    fun getPlaylistWithBooks(playlistId: Long): Flow<AudiobookPlaylist> {
        return playlistDao.getPlaylistItemsFlow(playlistId).map { items ->
            val books = items.mapNotNull { item ->
                mediaItemDao.getMediaItemById(item.mediaItemId)?.let { mediaItem ->
                    val progressData = historyRepository.getReadingProgress(item.mediaItemId).firstOrNull()
                    val bookmarksList = historyRepository.getBookmarks(item.mediaItemId)
                    
                    PlaylistAudiobook(
                        playlistItem = item,
                        mediaItem = mediaItem,
                        progress = progressData?.percentage ?: 0f,
                        isFinished = historyRepository.isFinished(item.mediaItemId),
                        bookmarks = bookmarksList
                    )
                }
            }
            
            AudiobookPlaylist(
                playlistId = playlistId,
                books = books,
                totalDuration = 0L, // Calculate from book durations when metadata available
                totalBooks = books.size,
                completedBooks = books.count { it.isFinished }
            )
        }
    }

    /**
     * Get next book in series
     */
    suspend fun getNextInSeries(playlistId: Long, currentBookId: Long): Long? {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
            .sortedBy { it.position }
        
        val currentIndex = items.indexOfFirst { it.mediaItemId == currentBookId }
        if (currentIndex < 0 || currentIndex >= items.size - 1) {
            return null
        }
        
        return items[currentIndex + 1].mediaItemId
    }

    /**
     * Get previous book in series
     */
    suspend fun getPreviousInSeries(playlistId: Long, currentBookId: Long): Long? {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
            .sortedBy { it.position }
        
        val currentIndex = items.indexOfFirst { it.mediaItemId == currentBookId }
        if (currentIndex <= 0) {
            return null
        }
        
        return items[currentIndex - 1].mediaItemId
    }

    /**
     * Delete a playlist
     */
    suspend fun deletePlaylist(playlistId: Long) {
        val playlist = playlistDao.getAllPlaylistsFlow().first()
            .find { it.playlistId == playlistId } ?: return
        
        playlistDao.deletePlaylist(playlist)
    }

    /**
     * Duplicate a playlist
     */
    suspend fun duplicatePlaylist(playlistId: Long, newName: String): Long {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
        val newPlaylistId = createPlaylist(
            name = newName,
            description = "Copy of playlist"
        )
        
        items.forEach { item ->
            playlistDao.insertPlaylistItem(
                item.copy(id = 0, playlistId = newPlaylistId)
            )
        }
        
        return newPlaylistId
    }

    /**
     * Get series completion percentage
     */
    suspend fun getSeriesCompletionPercentage(playlistId: Long): Float {
        val playlist = getPlaylistWithBooks(playlistId).first()
        if (playlist.totalBooks == 0) return 0f
        
        return (playlist.completedBooks.toFloat() / playlist.totalBooks.toFloat()) * 100f
    }

    // Private helper methods

    private suspend fun getOrCreateDefaultReadingList(): Long {
        val playlists = playlistDao.getAllPlaylistsFlow().first()
        val readingList = playlists.find { it.name == "To Read" }
        
        return readingList?.playlistId ?: createToReadList()
    }

    private suspend fun getOrCreateCurrentlyReadingList(): Long {
        val playlists = playlistDao.getAllPlaylistsFlow().first()
        val currentList = playlists.find { it.name == "Currently Reading" }
        
        return currentList?.playlistId ?: createCurrentlyReadingList()
    }

    private suspend fun getOrCreateFinishedList(): Long {
        val playlists = playlistDao.getAllPlaylistsFlow().first()
        val finishedList = playlists.find { it.name == "Finished Books" }
        
        return finishedList?.playlistId ?: createFinishedList()
    }

    private suspend fun updatePlaylistTimestamp(playlistId: Long) {
        val playlists = playlistDao.getAllPlaylistsFlow().first()
        val playlist = playlists.find { it.playlistId == playlistId } ?: return
        playlistDao.updatePlaylist(playlist.copy(updatedAt = System.currentTimeMillis()))
    }

    private suspend fun reorderPlaylistItems(playlistId: Long) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
            .sortedBy { it.position }
        
        items.forEachIndexed { index, item ->
            playlistDao.insertPlaylistItem(item.copy(position = index))
        }
    }

    private fun generateShareCode(): String = UUID.randomUUID().toString().substring(0, 8)
}

/**
 * Sort options for audiobook playlists
 */
enum class AudiobookSortOption {
    TITLE_ASC,
    TITLE_DESC,
    DATE_ADDED_ASC,
    DATE_ADDED_DESC,
    READING_ORDER
}

/**
 * Data class for audiobook playlist with full information
 */
data class AudiobookPlaylist(
    val playlistId: Long,
    val books: List<PlaylistAudiobook>,
    val totalDuration: Long,
    val totalBooks: Int,
    val completedBooks: Int
)

/**
 * Data class combining playlist item, media item, and reading status
 */
data class PlaylistAudiobook(
    val playlistItem: PlaylistItem,
    val mediaItem: MediaItem,
    val progress: Float,
    val isFinished: Boolean,
    val bookmarks: List<Bookmark>
)

/**
 * Data class for audiobook bookmarks
 */
data class Bookmark(
    val bookmarkId: Long,
    val timestamp: Long,
    val note: String?,
    val createdAt: Long
)
