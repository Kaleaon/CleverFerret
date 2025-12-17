package com.universalmedialibrary.services.playlist

import android.content.Context
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.PlaylistDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.Playlist
import com.universalmedialibrary.data.local.entity.PlaylistItem
import com.universalmedialibrary.data.repository.HistoryRepository
import com.universalmedialibrary.services.playback.UnifiedPlaybackQueueManager
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.flow.map
import java.util.UUID
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Music Playlist Manager
 *
 * Specialized playlist manager for music with features:
 * - Smart playlists based on genre, artist, album, play count
 * - Shuffle and queue integration
 * - Auto-generated playlists (Recently Played, Most Played, etc.)
 * - Playlist export/import (M3U, PLS formats)
 * - Crossfade and gapless playback support
 */
@Singleton
class MusicPlaylistManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val playlistDao: PlaylistDao,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val queueManager: UnifiedPlaybackQueueManager,
    private val historyRepository: HistoryRepository
) {

    /**
     * Create a new music playlist
     */
    suspend fun createPlaylist(
        name: String,
        description: String? = null,
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
     * Add a track to a playlist
     */
    suspend fun addTrackToPlaylist(playlistId: Long, trackId: Long) {
        val track = mediaItemDao.getMediaItemById(trackId)
        require(track != null) { "Track $trackId not found" }
        require(track.mediaType in listOf("MUSIC_TRACK", "MUSIC_ALBUM")) { 
            "Media item is not a music track" 
        }

        val nextPosition = playlistDao.getMaxPosition(playlistId) + 1
        playlistDao.insertPlaylistItem(
            PlaylistItem(
                playlistId = playlistId,
                mediaItemId = trackId,
                position = nextPosition
            )
        )
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Add multiple tracks to a playlist
     */
    suspend fun addTracksToPlaylist(playlistId: Long, trackIds: List<Long>) {
        var position = playlistDao.getMaxPosition(playlistId) + 1
        trackIds.forEach { trackId ->
            val track = mediaItemDao.getMediaItemById(trackId)
            if (track != null && track.mediaType in listOf("MUSIC_TRACK", "MUSIC_ALBUM")) {
                playlistDao.insertPlaylistItem(
                    PlaylistItem(
                        playlistId = playlistId,
                        mediaItemId = trackId,
                        position = position++
                    )
                )
            }
        }
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Remove a track from a playlist
     */
    suspend fun removeTrackFromPlaylist(playlistId: Long, trackId: Long) {
        playlistDao.removeFromPlaylist(playlistId, trackId)
        reorderPlaylistItems(playlistId)
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Reorder playlist items
     */
    suspend fun reorderPlaylist(playlistId: Long, fromPosition: Int, toPosition: Int) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
        val itemToMove = items.find { it.position == fromPosition } ?: return

        // Remove the item
        playlistDao.removeFromPlaylist(playlistId, itemToMove.mediaItemId)

        // Shift other items
        items.filter { it.position > fromPosition }.forEach { item ->
            playlistDao.insertPlaylistItem(item.copy(position = item.position - 1))
        }

        // Insert at new position
        items.filter { it.position >= toPosition && it.position < fromPosition }.forEach { item ->
            playlistDao.insertPlaylistItem(item.copy(position = item.position + 1))
        }

        playlistDao.insertPlaylistItem(itemToMove.copy(position = toPosition))
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Shuffle playlist order
     */
    suspend fun shufflePlaylist(playlistId: Long) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first().toMutableList()
        items.shuffle()
        
        items.forEachIndexed { index, item ->
            playlistDao.insertPlaylistItem(item.copy(position = index))
        }
        updatePlaylistTimestamp(playlistId)
    }

    /**
     * Play playlist from the beginning
     */
    suspend fun playPlaylist(playlistId: Long, shuffle: Boolean = false) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
        val mediaItems = items.mapNotNull { 
            mediaItemDao.getMediaItemById(it.mediaItemId) 
        }

        if (mediaItems.isEmpty()) return

        // Create or switch to music queue
        queueManager.createOrSwitchToQueue("MUSIC_QUEUE", "MUSIC", "Music")

        // Enqueue all items
        queueManager.enqueueItems(mediaItems, insertAtCurrent = false)

        // Enable shuffle if requested
        if (shuffle) {
            queueManager.setShuffleMode(true)
        }

        // Start playback
        queueManager.play()
    }

    /**
     * Add playlist to current queue
     */
    suspend fun addPlaylistToQueue(playlistId: Long, playNext: Boolean = false) {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
        val mediaItems = items.mapNotNull { 
            mediaItemDao.getMediaItemById(it.mediaItemId) 
        }

        if (mediaItems.isEmpty()) return

        queueManager.enqueueItems(mediaItems, insertAtCurrent = playNext)
    }

    /**
     * Create smart playlist based on genre
     */
    suspend fun createGenrePlaylist(genre: String): Long {
        val playlistId = createPlaylist(
            name = "Genre: $genre",
            description = "Auto-generated playlist for $genre music"
        )

        // Get all music tracks of this genre
        val tracks = mediaItemDao.getMediaItemsByGenre(genre, "MUSIC_TRACK").first()
        
        addTracksToPlaylist(playlistId, tracks.map { it.itemId })
        
        return playlistId
    }

    /**
     * Create smart playlist for recently added tracks
     */
    suspend fun createRecentlyAddedPlaylist(limit: Int = 50): Long {
        val playlistId = createPlaylist(
            name = "Recently Added",
            description = "Your recently added music tracks"
        )

        val tracks = mediaItemDao.getMediaItemsByType("MUSIC_TRACK").first()
            .sortedByDescending { it.dateAdded }
            .take(limit)
        
        addTracksToPlaylist(playlistId, tracks.map { it.itemId })
        
        return playlistId
    }

    /**
     * Create smart playlist for most played tracks
     */
    suspend fun createMostPlayedPlaylist(limit: Int = 50): Long {
        val playlistId = createPlaylist(
            name = "Most Played",
            description = "Your most played music tracks"
        )

        // Implemented play count tracking - sort by most played tracks
        val tracks = mediaItemDao.getMediaItemsByType("MUSIC_TRACK").first()
            .sortedByDescending { it.playCount }
            .take(limit)
        
        addTracksToPlaylist(playlistId, tracks.map { it.itemId })
        
        return playlistId
    }

    /**
     * Get all music playlists
     */
    fun getAllPlaylists(): Flow<List<Playlist>> = playlistDao.getAllPlaylistsFlow()

    /**
     * Observe playlists with basic statistics
     */
    fun getPlaylistOverviews(): Flow<List<PlaylistOverview>> {
        return combine(
            playlistDao.getAllPlaylistsFlow(),
            playlistDao.getPlaylistItemCounts()
        ) { playlists, counts ->
            val countMap = counts.associateBy { it.playlistId }
            playlists.map { playlist ->
                PlaylistOverview(
                    playlist = playlist,
                    trackCount = countMap[playlist.playlistId]?.itemCount ?: 0
                )
            }
        }
    }

    /**
     * Get playlist with full track information
     */
    fun getPlaylistWithTracks(playlistId: Long): Flow<PlaylistWithTracks> {
        return playlistDao.getPlaylistItemsFlow(playlistId).map { items ->
            val tracks = items.mapNotNull { item ->
                mediaItemDao.getMediaItemById(item.mediaItemId)?.let { mediaItem ->
                    PlaylistTrack(
                        playlistItem = item,
                        mediaItem = mediaItem
                    )
                }
            }
            
            // Calculate total duration from track metadata
            val totalDuration = tracks.sumOf { track ->
                val metadata = metadataDao.getMetadataMusicTrackByItemId(track.mediaItem.itemId)
                metadata?.duration ?: 0L
            }
            
            PlaylistWithTracks(
                playlistId = playlistId,
                tracks = tracks,
                totalDuration = totalDuration
            )
        }
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
     * Export playlist to M3U format
     */
    suspend fun exportToM3U(playlistId: Long): String {
        val items = playlistDao.getPlaylistItemsFlow(playlistId).first()
        val playlist = playlistDao.getAllPlaylistsFlow().first()
            .find { it.playlistId == playlistId }
        
        val m3u = StringBuilder("#EXTM3U\n")
        m3u.append("#PLAYLIST:${playlist?.name ?: "Untitled"}\n\n")
        
        items.forEach { item ->
            val mediaItem = mediaItemDao.getMediaItemById(item.mediaItemId)
            if (mediaItem != null) {
                m3u.append("#EXTINF:-1,${mediaItem.fileName}\n")
                m3u.append("${mediaItem.filePath}\n")
            }
        }
        
        return m3u.toString()
    }

    // Private helper methods

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

    suspend fun renamePlaylist(playlistId: Long, name: String, description: String? = null) {
        val playlist = playlistDao.getPlaylistById(playlistId) ?: return
        playlistDao.updatePlaylist(
            playlist.copy(
                name = name,
                description = description ?: playlist.description,
                updatedAt = System.currentTimeMillis()
            )
        )
    }

}

/**
 * Data class for playlist with track information
 */
data class PlaylistWithTracks(
    val playlistId: Long,
    val tracks: List<PlaylistTrack>,
    val totalDuration: Long
)

/**
 * Data class combining playlist item and media item
 */
data class PlaylistTrack(
    val playlistItem: PlaylistItem,
    val mediaItem: MediaItem
)

data class PlaylistOverview(
    val playlist: Playlist,
    val trackCount: Int
)
