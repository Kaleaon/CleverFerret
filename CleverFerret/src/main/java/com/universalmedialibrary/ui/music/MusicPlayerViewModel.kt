package com.universalmedialibrary.ui.music

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.music.PlaylistMode
import com.universalmedialibrary.services.music.MusicMetadataService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for the advanced music player screen
 */
@HiltViewModel
class MusicPlayerViewModel @Inject constructor(
    private val musicPlayerService: AdvancedMusicPlayerService,
    private val musicMetadataService: MusicMetadataService
) : ViewModel() {

    val playbackState: StateFlow<com.universalmedialibrary.services.music.AdvancedPlaybackState> =
        musicPlayerService.playbackState

    val currentTrack: StateFlow<com.universalmedialibrary.services.music.TrackInfo?> =
        musicPlayerService.currentTrack

    val queue: StateFlow<List<com.universalmedialibrary.services.music.TrackInfo>> =
        musicPlayerService.queue

    val playlistMode: StateFlow<PlaylistMode> =
        musicPlayerService.playlistMode

    /**
     * Toggle play/pause
     */
    fun togglePlayPause() {
        musicPlayerService.togglePlayPause()
    }

    /**
     * Skip to previous track
     */
    fun skipToPrevious() {
        musicPlayerService.skipToPrevious()
    }

    /**
     * Skip to next track
     */
    fun skipToNext() {
        musicPlayerService.skipToNext()
    }

    /**
     * Seek to specific position
     */
    fun seekTo(positionMs: Long) {
        musicPlayerService.seekTo(positionMs)
    }

    /**
     * Get current playback position
     */
    fun getCurrentPosition(): Long {
        return musicPlayerService.getCurrentPosition()
    }

    /**
     * Toggle playlist mode (normal -> repeat all -> repeat one -> shuffle -> normal)
     */
    fun togglePlaylistMode() {
        val currentMode = playlistMode.value
        val nextMode = when (currentMode) {
            PlaylistMode.NORMAL -> PlaylistMode.REPEAT_ALL
            PlaylistMode.REPEAT_ALL -> PlaylistMode.REPEAT_ONE
            PlaylistMode.REPEAT_ONE -> PlaylistMode.SHUFFLE
            PlaylistMode.SHUFFLE -> PlaylistMode.NORMAL
        }
        musicPlayerService.setPlaylistMode(nextMode)
    }

    /**
     * Add track to queue
     */
    fun addToQueue(mediaItem: com.universalmedialibrary.data.local.entity.MediaItem) {
        musicPlayerService.addToQueue(mediaItem)
    }

    /**
     * Remove track from queue
     */
    fun removeFromQueue(trackId: String) {
        musicPlayerService.removeFromQueue(trackId)
    }

    /**
     * Clear the entire queue
     */
    fun clearQueue() {
        musicPlayerService.clearQueue()
    }

    /**
     * Set crossfade duration
     */
    fun setCrossfadeDuration(durationMs: Int) {
        musicPlayerService.setCrossfadeDuration(durationMs)
    }

    /**
     * Enable/disable gapless playback
     */
    fun setGaplessPlayback(enabled: Boolean) {
        musicPlayerService.setGaplessPlayback(enabled)
    }

    /**
     * Enhance current track metadata
     */
    fun enhanceCurrentTrackMetadata() {
        val track = currentTrack.value
        if (track?.artist != null && track.title.isNotEmpty()) {
            viewModelScope.launch {
                try {
                    val enhancedMetadata = musicMetadataService.enhanceTrackMetadata(
                        artist = track.artist,
                        title = track.title,
                        album = track.album
                    )

                    if (enhancedMetadata.success) {
                        // TODO: Update track metadata in database using MusicMetadataDao
                        // Example: musicMetadataDao.updateTrack(enhancedMetadata.toEntity())
                        // TODO: Update UI state to reflect new metadata
                        // Example: _currentTrackMetadata.value = enhancedMetadata
                    }
                } catch (e: Exception) {
                    // Handle metadata enhancement error
                }
            }
        }
    }

    /**
     * Get similar artists for current track
     */
    fun getSimilarArtists() {
        val track = currentTrack.value
        if (track?.artist != null) {
            viewModelScope.launch {
                try {
                    val similarArtists = musicMetadataService.getSimilarArtists(track.artist)
                    // TODO: Implement similar artists UI feature:
                    // - Add _similarArtists MutableStateFlow<List<Artist>> 
                    // - Update: _similarArtists.value = similarArtists
                    // - Add UI section in MusicPlayerScreen to display artists
                    // - Add click navigation to artist detail screen
                } catch (e: Exception) {
                    // Handle error
                }
            }
        }
    }

    /**
     * Get top tracks for current artist
     */
    fun getArtistTopTracks() {
        val track = currentTrack.value
        if (track?.artist != null) {
            viewModelScope.launch {
                try {
                    val topTracks = musicMetadataService.getArtistTopTracks(track.artist)
                    // TODO: Implement top tracks UI feature:
                    // - Add _topTracks MutableStateFlow<List<Track>>
                    // - Update: _topTracks.value = topTracks
                    // - Add "Top Tracks" section in UI with "Add to Queue" buttons
                    // - Call musicPlayerService.addToQueue(track) on button click
                } catch (e: Exception) {
                    // Handle error
                }
            }
        }
    }

    override fun onCleared() {
        super.onCleared()
        // Don't release the service here as it should continue playing in background
        // musicPlayerService.release()
    }
}
