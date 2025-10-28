package com.universalmedialibrary.ui.music

import android.content.Context
import android.content.Intent
import androidx.core.content.FileProvider
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.PlaylistDao
import com.universalmedialibrary.data.local.entity.Playlist
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.music.PlaylistMode
import com.universalmedialibrary.services.music.MusicMetadataService
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import com.universalmedialibrary.services.media.SleepTimerManager
import com.universalmedialibrary.services.metadata.EnhancedMetadataService
import com.universalmedialibrary.services.metadata.EnhancedTrackMetadata
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import java.io.File
import javax.inject.Inject

/**
 * ViewModel for the advanced music player screen
 */
@HiltViewModel
class MusicPlayerViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val musicPlayerService: AdvancedMusicPlayerService,
    private val musicMetadataService: MusicMetadataService,
    private val enhancedMetadataService: EnhancedMetadataService,
    private val exoPlayerService: ExoPlayerService,
    private val sleepTimerManager: SleepTimerManager,
    private val playlistDao: PlaylistDao
) : ViewModel() {

    val playbackState: StateFlow<com.universalmedialibrary.services.music.AdvancedPlaybackState> =
        musicPlayerService.playbackState

    val currentTrack: StateFlow<com.universalmedialibrary.services.music.TrackInfo?> =
        musicPlayerService.currentTrack

    val queue: StateFlow<List<com.universalmedialibrary.services.music.TrackInfo>> =
        musicPlayerService.queue

    val playlistMode: StateFlow<PlaylistMode> =
        musicPlayerService.playlistMode
    
    val sleepTimerState = sleepTimerManager.state
    
    private val _playbackSpeed = MutableStateFlow(1.0f)
    val playbackSpeed: StateFlow<Float> = _playbackSpeed.asStateFlow()
    
    private val _volume = MutableStateFlow(1.0f)
    val volume: StateFlow<Float> = _volume.asStateFlow()
    
    private val _equalizerPreset = MutableStateFlow("Normal")
    val equalizerPreset: StateFlow<String> = _equalizerPreset.asStateFlow()
    
    private val _isFavorite = MutableStateFlow(false)
    val isFavorite: StateFlow<Boolean> = _isFavorite.asStateFlow()
    
    // Playlists for "Add to Playlist" feature
    val playlists: StateFlow<List<Playlist>> = playlistDao.getAllPlaylistsFlow()
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyList()
        )
    
    // Enhanced metadata for current track
    private val _currentTrackMetadata = MutableStateFlow<EnhancedTrackMetadata?>(null)
    val currentTrackMetadata: StateFlow<EnhancedTrackMetadata?> = _currentTrackMetadata.asStateFlow()
    
    // Seek amounts (configurable)
    private val seekBackwardMs = 10000L // 10 seconds
    private val seekForwardMs = 30000L // 30 seconds

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
                        // Metadata enhancement successful - in production this would update
                        // the database with enhanced information (lyrics, bio, etc.)
                        // Example implementation:
                        // musicMetadataDao.updateTrack(enhancedMetadata.toEntity())
                        // _currentTrackMetadata.value = enhancedMetadata
                    }
                } catch (e: Exception) {
                    // Handle metadata enhancement error
                }
            }
        }
    }

    /**
     * Set playback speed
     */
    fun setPlaybackSpeed(speed: Float) {
        _playbackSpeed.value = speed
        exoPlayerService.setPlaybackSpeed(speed)
    }
    
    /**
     * Set volume
     */
    fun setVolume(volume: Float) {
        _volume.value = volume
        exoPlayerService.setVolume(volume)
    }
    
    /**
     * Set equalizer preset
     */
    fun setEqualizerPreset(preset: String) {
        _equalizerPreset.value = preset
        // Equalizer settings would be applied here in production
        // Example: equalizerService.applyPreset(preset)
    }
    
    /**
     * Toggle favorite status
     */
    fun toggleFavorite() {
        _isFavorite.value = !_isFavorite.value
        // Favorites would be persisted to database in production
        // Example: favoritesDao.toggleFavorite(currentTrack.value?.id)
    }
    
    /**
     * Seek backward (default -10s)
     */
    fun seekBackward(amountMs: Long = seekBackwardMs) {
        val currentPos = getCurrentPosition()
        val newPos = (currentPos - amountMs).coerceAtLeast(0)
        seekTo(newPos)
    }
    
    /**
     * Seek forward (default +30s)
     */
    fun seekForward(amountMs: Long = seekForwardMs) {
        val currentPos = getCurrentPosition()
        val duration = currentTrack.value?.duration ?: 0L
        val newPos = (currentPos + amountMs).coerceAtMost(duration)
        seekTo(newPos)
    }
    
    /**
     * Toggle shuffle mode
     */
    fun toggleShuffle() {
        musicPlayerService.toggleShuffle()
    }
    
    /**
     * Toggle repeat mode
     */
    fun toggleRepeat() {
        musicPlayerService.toggleRepeat()
    }
    
    /**
     * Jump to specific track in queue
     */
    fun jumpToQueuePosition(index: Int) {
        musicPlayerService.skipToQueuePosition(index)
    }
    
    /**
     * Move track in queue
     */
    fun moveTrackInQueue(fromIndex: Int, toIndex: Int) {
        musicPlayerService.moveInQueue(fromIndex, toIndex)
    }
    
    /**
     * Remove track from queue by index
     */
    fun removeFromQueueByIndex(index: Int) {
        val id = queue.value.getOrNull(index)?.id ?: return
        musicPlayerService.removeFromQueue(id)
    }
    
    /**
     * Shuffle queue
     */
    fun shuffleQueue() {
        // TODO: shuffleQueue is private in AdvancedMusicPlayerService
        // Need to expose this functionality or implement here
        // musicPlayerService.shuffleQueue()
    }
    
    /**
     * Load enhanced metadata for current track
     */
    fun loadEnhancedMetadata() {
        val track = currentTrack.value ?: return
        
        viewModelScope.launch {
            try {
                val metadata = enhancedMetadataService.extractMetadata(track.filePath)
                _currentTrackMetadata.value = metadata
            } catch (e: Exception) {
                // Handle error silently or log
                _currentTrackMetadata.value = null
            }
        }
    }
    
    /**
     * Get current queue index
     */
    fun getCurrentQueueIndex(): Int {
        val track = currentTrack.value ?: return -1
        return queue.value.indexOfFirst { it.id == track.id }
    }
    
    /**
     * Start sleep timer
     */
    fun startSleepTimer(minutes: Int) {
        sleepTimerManager.startTimer(
            durationMinutes = minutes,
            fadeOut = true,
            onComplete = {
                musicPlayerService.pause()
            }
        )
    }
    
    /**
     * Stop sleep timer
     */
    fun stopSleepTimer() {
        sleepTimerManager.stopTimer()
    }
    
    /**
     * Share current track
     */
    fun shareTrack() {
        val track = currentTrack.value ?: return
        
        try {
            val shareText = buildString {
                append("Now listening to:\n")
                append("${track.title}")
                if (track.artist != null) {
                    append(" by ${track.artist}")
                }
                if (track.album != null) {
                    append("\nAlbum: ${track.album}")
                }
            }
            
            val shareIntent = Intent(Intent.ACTION_SEND).apply {
                type = "text/plain"
                putExtra(Intent.EXTRA_TEXT, shareText)
                putExtra(Intent.EXTRA_SUBJECT, "Check out this song!")
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }
            
            val chooser = Intent.createChooser(shareIntent, "Share via")
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            context.startActivity(chooser)
        } catch (e: Exception) {
            // Handle error
        }
    }

    /**
     * Get similar artists for current track
     * Feature placeholder - would show similar artists for discovery
     */
    fun getSimilarArtists() {
        val track = currentTrack.value
        if (track?.artist != null) {
            viewModelScope.launch {
                try {
                    val similarArtists = musicMetadataService.getSimilarArtists(track.artist)
                    // In production: show similar artists in a bottom sheet or dialog
                    // _similarArtists.value = similarArtists
                } catch (e: Exception) {
                    // Handle error
                }
            }
        }
    }

    /**
     * Get top tracks for current artist
     * Feature placeholder - would show artist's popular tracks
     */
    fun getArtistTopTracks() {
        val track = currentTrack.value
        if (track?.artist != null) {
            viewModelScope.launch {
                try {
                    val topTracks = musicMetadataService.getArtistTopTracks(track.artist)
                    // In production: show top tracks in a bottom sheet or dialog
                    // _topTracks.value = topTracks
                } catch (e: Exception) {
                    // Handle error
                }
            }
        }
    }

    /**
     * Add current track to playlist
     */
    fun addToPlaylist(playlistId: Long) {
        val track = currentTrack.value ?: return
        
        viewModelScope.launch {
            try {
                // Get the next position in the playlist
                val nextPosition = playlistDao.getMaxPosition(playlistId) + 1
                val playlistItem = com.universalmedialibrary.data.local.entity.PlaylistItem(
                    playlistId = playlistId,
                    mediaItemId = track.id.toLongOrNull() ?: 0L, // Convert String ID to Long
                    position = nextPosition
                )
                playlistDao.insertPlaylistItem(playlistItem)
            } catch (e: Exception) {
                // Handle error - could emit error event
            }
        }
    }
    
    /**
     * Create new playlist with current track
     */
    fun createPlaylistWithCurrentTrack(name: String) {
        val track = currentTrack.value ?: return
        
        viewModelScope.launch {
            try {
                val playlist = Playlist(
                    name = name,
                    description = "Created from Now Playing"
                )
                val playlistId = playlistDao.insertPlaylist(playlist)
                
                // Add current track to new playlist
                val playlistItem = com.universalmedialibrary.data.local.entity.PlaylistItem(
                    playlistId = playlistId,
                    mediaItemId = track.id.toLongOrNull() ?: 0L, // Convert String ID to Long
                    position = 0
                )
                playlistDao.insertPlaylistItem(playlistItem)
            } catch (e: Exception) {
                // Handle error - could emit error event
            }
        }
    }
    
    override fun onCleared() {
        super.onCleared()
        // Don't release the service here as it should continue playing in background
        // musicPlayerService.release()
    }
}
