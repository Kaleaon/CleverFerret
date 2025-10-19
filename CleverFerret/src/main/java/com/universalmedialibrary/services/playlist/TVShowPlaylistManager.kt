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
 * TV Show Playlist Manager
 *
 * Specialized playlist manager for TV shows with features:
 * - Season/episode ordering and management
 * - Binge watch queues
 * - Continue watching support
 * - Series tracking (watched episodes, next episode)
 * - Multi-show marathons
 * - Season pass and auto-play features
 */
@Singleton
class TVShowPlaylistManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val playlistDao: PlaylistDao,
    private val mediaItemDao: MediaItemDao,
    private val queueManager: UnifiedPlaybackQueueManager
) {

    /**
     * Create a new TV show playlist
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
     * Add an episode to a playlist
     */
    suspend fun addEpisodeToPlaylist(playlistId: Long, episodeId: Long) {
        val episode = mediaItemDao.getMediaItemById(episodeId)
        require(episode != null) { "Episode $episodeId not found" }
        require(episode.mediaType == "TV_SHOW") { "Media item is not a TV episode" }

        val nextPosition = playlistDao.getMaxPosition(playlistId) + 1
        playlistDao.insertPlaylistItem(
            PlaylistItem(
                playlistId = playlistId,
                mediaItemId = episodeId,
                position = nextPosition
            )
        )
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Add multiple episodes to a playlist
     */
    suspend fun addEpisodesToPlaylist(playlistId: Long, episodeIds: List<Long>) {
        var position = playlistDao.getMaxPosition(playlistId) + 1
        episodeIds.forEach { episodeId ->
            val episode = mediaItemDao.getMediaItemById(episodeId)
            if (episode != null && episode.mediaType == "TV_SHOW") {
                playlistDao.insertPlaylistItem(
                    PlaylistItem(
                        playlistId = playlistId,
                        mediaItemId = episodeId,
                        position = position++
                    )
                )
            }
        }
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Remove an episode from a playlist
     */
    suspend fun removeEpisodeFromPlaylist(playlistId: Long, episodeId: Long) {
        playlistDao.removeFromPlaylist(playlistId, episodeId)
        reorderPlaylistItems(playlistId)
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Create a series playlist (all seasons)
     */
    suspend fun createSeriesPlaylist(
        seriesName: String,
        episodeIds: List<Long>,
        description: String? = null
    ): Long {
        val seriesId = createPlaylist(
            name = seriesName,
            description = description ?: "Complete series",
            isSeries = true
        )
        
        addEpisodesToPlaylist(seriesId, episodeIds)
        
        return seriesId
    }

    /**
     * Create a season playlist
     */
    suspend fun createSeasonPlaylist(
        showName: String,
        seasonNumber: Int,
        episodeIds: List<Long>
    ): Long {
        val seasonId = createPlaylist(
            name = "$showName - Season $seasonNumber",
            description = "Season $seasonNumber episodes",
            isSeries = true
        )
        
        addEpisodesToPlaylist(seasonId, episodeIds)
        
        return seasonId
    }

    /**
     * Create a binge watch queue
     */
    suspend fun createBingeQueue(
        name: String,
        episodeIds: List<Long>,
        description: String? = null
    ): Long {
        val queueId = createPlaylist(
            name = name,
            description = description ?: "Binge watch queue"
        )
        
        addEpisodesToPlaylist(queueId, episodeIds)
        
        return queueId
    }

    /**
     * Create a multi-show marathon
     */
    suspend fun createMarathon(
        name: String,
        episodeIds: List<Long>,
        description: String? = null
    ): Long {
        val marathonId = createPlaylist(
            name = name,
            description = description ?: "Multi-show marathon"
        )
        
        addEpisodesToPlaylist(marathonId, episodeIds)
        
        return marathonId
    }

    /**
     * Add entire season to playlist
     */
    suspend fun addSeasonToPlaylist(
        playlistId: Long,
        showName: String,
        seasonNumber: Int
    ) {
        val allEpisodes = mediaItemDao.getMediaItemsByType("TV_SHOW").first()
        
        // Note: Proper implementation would join with MetadataVideo table for series/season fields
        val seasonEpisodes = allEpisodes
            .filter { it.fileName.contains(showName, ignoreCase = true) }
            .filter { it.fileName.contains("S${seasonNumber.toString().padStart(2, '0')}", ignoreCase = true) }
            .sortedBy { extractEpisodeNumber(it.fileName) }
        
        addEpisodesToPlaylist(playlistId, seasonEpisodes.map { it.itemId })
    }

    /**
     * Reorder episodes in a playlist
     */
    suspend fun reorderEpisodes(playlistId: Long, fromPosition: Int, toPosition: Int) {
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
     * Sort playlist by various criteria
     */
    suspend fun sortPlaylist(
        playlistId: Long,
        sortBy: TVShowSortOption
    ) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
        val episodes = items.mapNotNull { item ->
            mediaItemDao.getMediaItemById(item.mediaItemId)?.let { it to item }
        }

        val sorted = when (sortBy) {
            TVShowSortOption.EPISODE_ORDER -> {
                episodes.sortedWith(compareBy(
                    { extractSeasonNumber(it.first.fileName) },
                    { extractEpisodeNumber(it.first.fileName) }
                ))
            }
            TVShowSortOption.TITLE_ASC -> episodes.sortedBy { it.first.fileName }
            TVShowSortOption.TITLE_DESC -> episodes.sortedByDescending { it.first.fileName }
            TVShowSortOption.DATE_ADDED_ASC -> episodes.sortedBy { it.first.dateAdded }
            TVShowSortOption.DATE_ADDED_DESC -> episodes.sortedByDescending { it.first.dateAdded }
            TVShowSortOption.CUSTOM -> episodes
        }

        sorted.forEachIndexed { index, (_, item) ->
            playlistDao.insertPlaylistItem(item.copy(position = index))
        }
        
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Start binge watching from the beginning
     */
    suspend fun startBingeWatch(playlistId: Long, startPosition: Int = 0) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
            .sortedBy { it.position }
            .drop(startPosition)
        
        val episodes = items.mapNotNull { 
            mediaItemDao.getMediaItemById(it.mediaItemId) 
        }

        if (episodes.isEmpty()) return

        // Create or switch to TV queue
        queueManager.createOrSwitchToQueue("TV_QUEUE", "TV_SHOW", "TV Shows")

        // Enqueue episodes
        queueManager.enqueueItems(episodes, insertAtCurrent = false)

        // Enable auto-play for continuous binge watching
        queueManager.setRepeatMode(com.universalmedialibrary.services.playback.RepeatMode.ALL)

        // Start playback
        queueManager.play()
    }

    /**
     * Continue watching from last watched episode
     */
    suspend fun continueWatching(playlistId: Long) {
        // Note: Integrate with ViewingHistoryRepository to find last watched episode
        // For now, start from beginning
        startBingeWatch(playlistId, 0)
    }

    /**
     * Play specific episode and continue from there
     */
    suspend fun playFromEpisode(playlistId: Long, episodeId: Long) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
            .sortedBy { it.position }
        
        val episodeIndex = items.indexOfFirst { it.mediaItemId == episodeId }
        if (episodeIndex >= 0) {
            startBingeWatch(playlistId, episodeIndex)
        }
    }

    /**
     * Play next episode
     */
    suspend fun playNextEpisode(playlistId: Long, currentEpisodeId: Long) {
        val nextEpisodeId = getNextEpisode(playlistId, currentEpisodeId)
        if (nextEpisodeId != null) {
            playFromEpisode(playlistId, nextEpisodeId)
        }
    }

    /**
     * Add playlist to queue
     */
    suspend fun addPlaylistToQueue(playlistId: Long, playNext: Boolean = false) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
        val episodes = items.mapNotNull { 
            mediaItemDao.getMediaItemById(it.mediaItemId) 
        }

        if (episodes.isEmpty()) return

        queueManager.enqueueItems(episodes, insertAtCurrent = playNext)
    }

    /**
     * Get all TV show playlists
     */
    fun getAllPlaylists(): Flow<List<Playlist>> = playlistDao.getAllPlaylistsFlow()

    /**
     * Get playlist with full episode information
     */
    fun getPlaylistWithEpisodes(playlistId: Long): Flow<TVShowPlaylist> {
        return playlistDao.getPlaylistItemsFlow(playlistId).map { items ->
            val episodes = items.mapNotNull { item ->
                mediaItemDao.getMediaItemById(item.mediaItemId)?.let { mediaItem ->
                    PlaylistEpisode(
                        playlistItem = item,
                        mediaItem = mediaItem,
                        seasonNumber = extractSeasonNumber(mediaItem.fileName),
                        episodeNumber = extractEpisodeNumber(mediaItem.fileName),
                        // Note: Integrate with ViewingHistoryRepository for watch status
                        watched = false,
                        // Note: Integrate with ViewingProgressRepository for progress
                        progress = 0f
                    )
                }
            }
            
            TVShowPlaylist(
                playlistId = playlistId,
                episodes = episodes,
                totalEpisodes = episodes.size,
                watchedEpisodes = episodes.count { it.watched },
                // Note: Calculate from MetadataVideo durations when available
                totalDuration = 0L,
                seasons = episodes.mapNotNull { it.seasonNumber }.distinct().sorted()
            )
        }
    }

    /**
     * Get next episode in playlist
     */
    suspend fun getNextEpisode(playlistId: Long, currentEpisodeId: Long): Long? {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
            .sortedBy { it.position }
        
        val currentIndex = items.indexOfFirst { it.mediaItemId == currentEpisodeId }
        if (currentIndex < 0 || currentIndex >= items.size - 1) {
            return null
        }
        
        return items[currentIndex + 1].mediaItemId
    }

    /**
     * Get previous episode in playlist
     */
    suspend fun getPreviousEpisode(playlistId: Long, currentEpisodeId: Long): Long? {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
            .sortedBy { it.position }
        
        val currentIndex = items.indexOfFirst { it.mediaItemId == currentEpisodeId }
        if (currentIndex <= 0) {
            return null
        }
        
        return items[currentIndex - 1].mediaItemId
    }

    /**
     * Get episodes for a specific season
     */
    suspend fun getSeasonEpisodes(playlistId: Long, seasonNumber: Int): List<Long> {
        val playlist = getPlaylistWithEpisodes(playlistId).first()
        return playlist.episodes
            .filter { it.seasonNumber == seasonNumber }
            .sortedBy { it.episodeNumber }
            .map { it.mediaItem.itemId }
    }

    /**
     * Mark episode as watched
     */
    suspend fun markEpisodeAsWatched(playlistId: Long, episodeId: Long) {
        // Note: Integrate with ViewingHistoryRepository to track watch history
        // Implementation would call viewingHistoryRepository.markAsWatched(episodeId)
    }

    /**
     * Get watch progress percentage
     */
    suspend fun getWatchProgress(playlistId: Long): Float {
        val playlist = getPlaylistWithEpisodes(playlistId).first()
        if (playlist.totalEpisodes == 0) return 0f
        
        return (playlist.watchedEpisodes.toFloat() / playlist.totalEpisodes.toFloat()) * 100f
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

    // Private helper methods

    private fun extractSeasonNumber(filename: String): Int {
        val regex = Regex("""[Ss](\d{1,2})""")
        return regex.find(filename)?.groupValues?.get(1)?.toIntOrNull() ?: 0
    }

    private fun extractEpisodeNumber(filename: String): Int {
        val regex = Regex("""[Ee](\d{1,2})""")
        return regex.find(filename)?.groupValues?.get(1)?.toIntOrNull() ?: 0
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
 * Sort options for TV show playlists
 */
enum class TVShowSortOption {
    EPISODE_ORDER,
    TITLE_ASC,
    TITLE_DESC,
    DATE_ADDED_ASC,
    DATE_ADDED_DESC,
    CUSTOM
}

/**
 * Data class for TV show playlist with full information
 */
data class TVShowPlaylist(
    val playlistId: Long,
    val episodes: List<PlaylistEpisode>,
    val totalEpisodes: Int,
    val watchedEpisodes: Int,
    val totalDuration: Long,
    val seasons: List<Int>
)

/**
 * Data class combining playlist item, media item, and episode information
 */
data class PlaylistEpisode(
    val playlistItem: PlaylistItem,
    val mediaItem: MediaItem,
    val seasonNumber: Int,
    val episodeNumber: Int,
    val watched: Boolean,
    val progress: Float
)
