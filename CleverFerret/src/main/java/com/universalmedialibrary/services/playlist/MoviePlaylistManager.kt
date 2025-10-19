package com.universalmedialibrary.services.playlist

import android.content.Context
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.PlaylistDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.Playlist
import com.universalmedialibrary.data.local.entity.PlaylistItem
import com.universalmedialibrary.services.playback.UnifiedPlaybackQueueManager
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.map
import java.util.UUID
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Movie Playlist Manager
 *
 * Specialized playlist manager for movies with features:
 * - Watchlist management (to-watch, watched, favorites)
 * - Movie collections (franchises, directors, genres)
 * - Watch party playlists (marathon viewing)
 * - Rating and review integration
 * - Continue watching support
 */
@Singleton
class MoviePlaylistManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val playlistDao: PlaylistDao,
    private val mediaItemDao: MediaItemDao,
    private val queueManager: UnifiedPlaybackQueueManager
) {

    /**
     * Create a new movie playlist/collection
     */
    suspend fun createPlaylist(
        name: String,
        description: String? = null,
        isWatchlist: Boolean = false,
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
     * Add a movie to a playlist
     */
    suspend fun addMovieToPlaylist(playlistId: Long, movieId: Long) {
        val movie = mediaItemDao.getMediaItemById(movieId)
        require(movie != null) { "Movie $movieId not found" }
        require(movie.mediaType == "MOVIE") { "Media item is not a movie" }

        val nextPosition = playlistDao.getMaxPosition(playlistId) + 1
        playlistDao.insertPlaylistItem(
            PlaylistItem(
                playlistId = playlistId,
                mediaItemId = movieId,
                position = nextPosition
            )
        )
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Add multiple movies to a playlist
     */
    suspend fun addMoviesToPlaylist(playlistId: Long, movieIds: List<Long>) {
        var position = playlistDao.getMaxPosition(playlistId) + 1
        movieIds.forEach { movieId ->
            val movie = mediaItemDao.getMediaItemById(movieId)
            if (movie != null && movie.mediaType == "MOVIE") {
                playlistDao.insertPlaylistItem(
                    PlaylistItem(
                        playlistId = playlistId,
                        mediaItemId = movieId,
                        position = position++
                    )
                )
            }
        }
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Remove a movie from a playlist
     */
    suspend fun removeMovieFromPlaylist(playlistId: Long, movieId: Long) {
        playlistDao.removeFromPlaylist(playlistId, movieId)
        reorderPlaylistItems(playlistId)
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Create a watchlist
     */
    suspend fun createWatchlist(name: String = "My Watchlist"): Long {
        return createPlaylist(
            name = name,
            description = "Movies to watch",
            isWatchlist = true
        )
    }

    /**
     * Add movie to watchlist
     */
    suspend fun addToWatchlist(movieId: Long) {
        val watchlist = getOrCreateDefaultWatchlist()
        addMovieToPlaylist(watchlist, movieId)
    }

    /**
     * Remove movie from watchlist
     */
    suspend fun removeFromWatchlist(movieId: Long) {
        val watchlist = getOrCreateDefaultWatchlist()
        removeMovieFromPlaylist(watchlist, movieId)
    }

    /**
     * Create a movie collection (e.g., franchise, series)
     */
    suspend fun createCollection(
        name: String,
        description: String? = null,
        movieIds: List<Long> = emptyList()
    ): Long {
        val collectionId = createPlaylist(
            name = name,
            description = description ?: "Movie collection"
        )
        
        if (movieIds.isNotEmpty()) {
            addMoviesToPlaylist(collectionId, movieIds)
        }
        
        return collectionId
    }

    /**
     * Create genre-based collection
     */
    suspend fun createGenreCollection(genre: String): Long {
        val collectionId = createPlaylist(
            name = "$genre Movies",
            description = "Movies in the $genre genre"
        )

        val movies = mediaItemDao.getMediaItemsByType("MOVIE").first()
        // Filter by genre in fileName (fallback until metadata integration)
        // Note: Proper implementation would join with MetadataCommon table for genre field
        val filteredMovies = movies.filter { movie ->
            movie.fileName.contains(genre, ignoreCase = true)
        }
        
        addMoviesToPlaylist(collectionId, filteredMovies.map { it.itemId })
        
        return collectionId
    }

    /**
     * Create director-based collection
     */
    suspend fun createDirectorCollection(director: String): Long {
        val collectionId = createPlaylist(
            name = "$director Films",
            description = "Movies directed by $director"
        )

        val movies = mediaItemDao.getMediaItemsByType("MOVIE").first()
        // Filter by director in fileName (fallback until metadata integration)
        // Note: Proper implementation would join with MetadataCommon table for creator field
        val filteredMovies = movies.filter { movie ->
            movie.fileName.contains(director, ignoreCase = true)
        }
        
        addMoviesToPlaylist(collectionId, filteredMovies.map { it.itemId })
        
        return collectionId
    }

    /**
     * Create a watch party/marathon playlist
     */
    suspend fun createWatchParty(
        name: String,
        movieIds: List<Long>,
        description: String? = null
    ): Long {
        val partyId = createPlaylist(
            name = name,
            description = description ?: "Movie marathon playlist"
        )
        
        addMoviesToPlaylist(partyId, movieIds)
        
        return partyId
    }

    /**
     * Reorder movies in a collection
     */
    suspend fun reorderCollection(playlistId: Long, fromPosition: Int, toPosition: Int) {
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
     * Sort collection by various criteria
     */
    suspend fun sortCollection(
        playlistId: Long,
        sortBy: MovieSortOption
    ) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
        val movies = items.mapNotNull { item ->
            mediaItemDao.getMediaItemById(item.mediaItemId)?.let { it to item }
        }

        val sorted = when (sortBy) {
            MovieSortOption.TITLE_ASC -> movies.sortedBy { it.first.fileName }
            MovieSortOption.TITLE_DESC -> movies.sortedByDescending { it.first.fileName }
            MovieSortOption.DATE_ADDED_ASC -> movies.sortedBy { it.first.dateAdded }
            MovieSortOption.DATE_ADDED_DESC -> movies.sortedByDescending { it.first.dateAdded }
            MovieSortOption.FILE_SIZE_ASC -> movies.sortedBy { it.first.fileSize }
            MovieSortOption.FILE_SIZE_DESC -> movies.sortedByDescending { it.first.fileSize }
            MovieSortOption.CUSTOM -> movies // Keep current order
        }

        sorted.forEachIndexed { index, (_, item) ->
            playlistDao.insertPlaylistItem(item.copy(position = index))
        }
        
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Play movie from collection
     */
    suspend fun playFromCollection(playlistId: Long, startPosition: Int = 0) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
            .sortedBy { it.position }
            .drop(startPosition)
        
        val movies = items.mapNotNull { 
            mediaItemDao.getMediaItemById(it.mediaItemId) 
        }

        if (movies.isEmpty()) return

        // Create or switch to video queue
        queueManager.createOrSwitchToQueue("VIDEO_QUEUE", "VIDEO", "Movies")

        // Enqueue movies
        queueManager.enqueueItems(movies, insertAtCurrent = false)

        // Start playback
        queueManager.play()
    }

    /**
     * Add collection to queue
     */
    suspend fun addCollectionToQueue(playlistId: Long, playNext: Boolean = false) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
        val movies = items.mapNotNull { 
            mediaItemDao.getMediaItemById(it.mediaItemId) 
        }

        if (movies.isEmpty()) return

        queueManager.enqueueItems(movies, insertAtCurrent = playNext)
    }

    /**
     * Get all movie playlists/collections
     */
    fun getAllCollections(): Flow<List<Playlist>> = playlistDao.getAllPlaylistsFlow()

    /**
     * Get collection with full movie information
     */
    fun getCollectionWithMovies(playlistId: Long): Flow<MovieCollection> {
        return playlistDao.getPlaylistItemsFlow(playlistId).map { items ->
            val movies = items.mapNotNull { item ->
                mediaItemDao.getMediaItemById(item.mediaItemId)?.let { mediaItem ->
                    CollectionMovie(
                        playlistItem = item,
                        mediaItem = mediaItem,
                        // Note: Integrate with ViewingHistoryRepository for watch status
                        watched = false,
                        // Note: Integrate with RatingRepository for user ratings
                        rating = 0f
                    )
                }
            }
            
            MovieCollection(
                playlistId = playlistId,
                movies = movies,
                // Note: Calculate from MetadataVideo durations when available
                totalDuration = 0L,
                totalSize = movies.sumOf { it.mediaItem.fileSize }
            )
        }
    }

    /**
     * Get recently added movies collection
     */
    suspend fun getRecentlyAdded(limit: Int = 20): Long {
        val collectionId = createPlaylist(
            name = "Recently Added Movies",
            description = "Your most recently added movies"
        )

        val movies = mediaItemDao.getMediaItemsByType("MOVIE").first()
            .sortedByDescending { it.dateAdded }
            .take(limit)
        
        addMoviesToPlaylist(collectionId, movies.map { it.itemId })
        
        return collectionId
    }

    /**
     * Delete a collection
     */
    suspend fun deleteCollection(playlistId: Long) {
        val playlist = playlistDao.getAllPlaylistsFlow().first()
            .find { it.playlistId == playlistId } ?: return
        
        playlistDao.deletePlaylist(playlist)
    }

    /**
     * Duplicate a collection
     */
    suspend fun duplicateCollection(playlistId: Long, newName: String): Long {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
        val newPlaylistId = createPlaylist(
            name = newName,
            description = "Copy of collection"
        )
        
        items.forEach { item ->
            playlistDao.insertPlaylistItem(
                item.copy(id = 0, playlistId = newPlaylistId)
            )
        }
        
        return newPlaylistId
    }

    /**
     * Get total runtime of a collection
     */
    suspend fun getCollectionRuntime(playlistId: Long): Long {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
        // Note: Calculate when duration metadata is available from MetadataVideo
        // Would sum up durations from joined MetadataVideo records
        return 0L
    }

    // Private helper methods

    private suspend fun getOrCreateDefaultWatchlist(): Long {
        val playlists = playlistDao.getAllPlaylistsFlow().first()
        val watchlist = playlists.find { it.name == "My Watchlist" }
        
        return watchlist?.playlistId ?: createWatchlist()
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
 * Sort options for movie collections
 */
enum class MovieSortOption {
    TITLE_ASC,
    TITLE_DESC,
    DATE_ADDED_ASC,
    DATE_ADDED_DESC,
    FILE_SIZE_ASC,
    FILE_SIZE_DESC,
    CUSTOM
}

/**
 * Data class for movie collection with full information
 */
data class MovieCollection(
    val playlistId: Long,
    val movies: List<CollectionMovie>,
    val totalDuration: Long,
    val totalSize: Long
)

/**
 * Data class combining playlist item, media item, and watch status
 */
data class CollectionMovie(
    val playlistItem: PlaylistItem,
    val mediaItem: MediaItem,
    val watched: Boolean,
    val rating: Float
)
