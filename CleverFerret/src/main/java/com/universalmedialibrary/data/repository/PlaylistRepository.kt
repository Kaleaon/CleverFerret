package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.PlaylistDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.Playlist
import com.universalmedialibrary.data.local.entity.PlaylistItem
import kotlinx.coroutines.flow.Flow
import java.util.UUID
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class PlaylistRepository @Inject constructor(
    private val database: AppDatabase
) {
    private val playlistDao: PlaylistDao = database.playlistDao()
    private val mediaItemDao: MediaItemDao = database.mediaItemDao()

    fun getAllPlaylists(): Flow<List<Playlist>> = playlistDao.getAllPlaylistsFlow()

    suspend fun addToLiked(mediaItemId: Long) {
        ensureMediaExists(mediaItemId)
        val liked = playlistDao.getLikedPlaylist() ?: run {
            val id = playlistDao.insertPlaylist(
                Playlist(name = "Liked", isLiked = true, isPublic = false, shareCode = generateShareCode())
            )
            playlistDao.getPlaylistByName("Liked") ?: Playlist(playlistId = id, name = "Liked", isLiked = true)
        }
        appendToPlaylist(liked.playlistId, mediaItemId)
    }

    suspend fun addToPlaylistByName(name: String, mediaItemId: Long, makePublic: Boolean = false): Long {
        ensureMediaExists(mediaItemId)
        val existing = playlistDao.getPlaylistByName(name)
        val playlistId = existing?.playlistId ?: playlistDao.insertPlaylist(
            Playlist(name = name, isPublic = makePublic, shareCode = generateShareCode())
        )
        appendToPlaylist(playlistId, mediaItemId)
        return playlistId
    }

    suspend fun createPlaylist(name: String, description: String? = null, isPublic: Boolean = false): Long {
        val playlist = Playlist(name = name, description = description, isPublic = isPublic, shareCode = generateShareCode())
        return playlistDao.insertPlaylist(playlist)
    }

    private suspend fun appendToPlaylist(playlistId: Long, mediaItemId: Long) {
        val nextPos = playlistDao.getMaxPosition(playlistId) + 1
        playlistDao.insertPlaylistItem(
            PlaylistItem(playlistId = playlistId, mediaItemId = mediaItemId, position = nextPos)
        )
    }

    private suspend fun ensureMediaExists(mediaItemId: Long) {
        requireNotNull(mediaItemDao.getMediaItemById(mediaItemId)) { "Media item $mediaItemId not found" }
    }

    private fun generateShareCode(): String = UUID.randomUUID().toString()
}
