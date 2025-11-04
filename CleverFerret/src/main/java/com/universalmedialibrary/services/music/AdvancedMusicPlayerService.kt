package com.universalmedialibrary.services.music

import android.content.Context
import android.content.SharedPreferences
import android.util.Log
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import com.universalmedialibrary.api.MediaCommandAPI
import com.universalmedialibrary.core.FeatureFlags
import com.universalmedialibrary.data.local.entity.MediaItem as LocalMediaItem
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import com.universalmedialibrary.services.media.MediaController
import com.universalmedialibrary.services.media.MediaServiceType
import com.universalmedialibrary.services.artwork.ArtworkLoader
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlin.math.roundToInt
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Advanced Music Player Service with ExoPlayer integration
 *
 * Features:
 * - High-quality audio playback with ExoPlayer
 * - Queue management and shuffle/repeat modes
 * - Crossfade and gapless playback support
 * - Equalizer and audio effects integration
 * - Smart playlist generation
 * - Background playback with media session
 */
@Singleton
class AdvancedMusicPlayerService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val exoPlayerService: ExoPlayerService,
    private val musicMetadataService: MusicMetadataService,
    private val mediaController: MediaController,
    private val artworkLoader: ArtworkLoader,
    private val audioEffectsService: AudioEffectsService,
    private val replayGainService: ReplayGainService,
    private val lastFmScrobbler: LastFmScrobblerService,
    private val audioProfileService: AudioProfileService,
    private val mediaRepository: com.universalmedialibrary.data.repository.MediaRepository
) : MediaCommandAPI {

    private val audioPrefs = context.getSharedPreferences(AUDIO_EFFECTS_PREFS, Context.MODE_PRIVATE)

    private val _playbackState = MutableStateFlow(AdvancedPlaybackState())
    val playbackState: StateFlow<AdvancedPlaybackState> = _playbackState.asStateFlow()

    private val _currentTrack = MutableStateFlow<TrackInfo?>(null)
    val currentTrack: StateFlow<TrackInfo?> = _currentTrack.asStateFlow()

    private val _queue = MutableStateFlow<List<TrackInfo>>(emptyList())
    val queue: StateFlow<List<TrackInfo>> = _queue.asStateFlow()

    private val _playlistMode = MutableStateFlow(PlaylistMode.NORMAL)
    val playlistMode: StateFlow<PlaylistMode> = _playlistMode.asStateFlow()

    private var currentQueueIndex = 0
    private var originalQueue: List<TrackInfo> = emptyList()

    private var currentEqPreset: EqualizerPreset = EqualizerPreset.FLAT
    private var currentBassBoostStrength: Int = 0
    private var currentReverbEnabled: Boolean = false
    private var currentReverbPreset: ReverbPreset = ReverbPreset.SMALL_ROOM
    
    // Last.fm scrobbling
    private val scrobblerScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private var scrobbleJob: Job? = null
    private var trackStartTime: Long = 0
    private var hasScrobbled: Boolean = false
    
    init {
        loadAudioEffectPreferences()
        // Initialize Last.fm scrobbler
        scrobblerScope.launch {
            lastFmScrobbler.initialize()
        }
        
        // Initialize audio profile service
        audioProfileService.initialize()
    }

    /**
     * Load and play a single track
     */
    suspend fun playTrack(mediaItem: LocalMediaItem) {
        if (!FeatureFlags.ENABLE_EXOPLAYER) {
            updatePlaybackState(error = "Advanced music player is disabled")
            return
        }

        try {
            // Ensure ExoPlayer is initialized
            exoPlayerService.initialize()
            
            updatePlaybackState(isLoading = true)

            // Create track info with metadata enhancement
            val trackInfo = createTrackInfo(mediaItem)

            // Set single track queue
            _queue.value = listOf(trackInfo)
            _currentTrack.value = trackInfo
            currentQueueIndex = 0

            // Load artwork from media file
            val artwork = artworkLoader.loadArtwork(
                mediaItem = mediaItem,
                maxWidth = 512,
                maxHeight = 512
            )
            
            // Use the MediaSession-integrated method
            exoPlayerService.loadMediaWithSession(
                mediaPath = mediaItem.filePath,
                title = trackInfo.title,
                artist = trackInfo.artist,
                album = trackInfo.album,
                artwork = artwork,
                serviceType = MediaServiceType.MUSIC
            )

            exoPlayerService.play()
            initializeAudioEffects()
            updatePlaybackState(isPlaying = true, isLoading = false)
        } catch (e: Exception) {
            updatePlaybackState(error = "Error playing track: ${e.message}")
        }
    }

    /**
     * Load and play a single track from URI with metadata
     */
    suspend fun playTrackFromUri(
        uri: String,
        title: String,
        artist: String? = null,
        album: String? = null,
        duration: Long = 0L,
        albumArtUrl: String? = null
    ) {
        if (!FeatureFlags.ENABLE_EXOPLAYER) {
            updatePlaybackState(error = "Advanced music player is disabled")
            return
        }

        try {
            // Ensure ExoPlayer is initialized
            exoPlayerService.initialize()
            
            updatePlaybackState(isLoading = true)

            // Create track info
            val trackInfo = TrackInfo(
                id = uri.hashCode().toString(),
                title = title,
                artist = artist,
                album = album,
                duration = duration,
                filePath = uri,
                albumArtUrl = albumArtUrl,
                queuePosition = 0
            )

            // Set single track queue
            _queue.value = listOf(trackInfo)
            _currentTrack.value = trackInfo
            currentQueueIndex = 0

            // Use the MediaSession-integrated method
            exoPlayerService.loadMediaWithSession(
                mediaPath = uri,
                title = title,
                artist = artist,
                album = album,
                artwork = null,
                serviceType = MediaServiceType.MUSIC
            )

            exoPlayerService.play()
            initializeAudioEffects()
            updatePlaybackState(isPlaying = true, isLoading = false)
        } catch (e: Exception) {
            updatePlaybackState(error = "Error playing track: ${e.message}")
        }
    }

    /**
     * Load and play a queue of tracks
     */
    suspend fun playQueue(mediaItems: List<LocalMediaItem>, startIndex: Int = 0) {
        if (!FeatureFlags.ENABLE_EXOPLAYER) {
            updatePlaybackState(error = "Advanced music player is disabled")
            return
        }

        try {
            // Ensure ExoPlayer is initialized
            exoPlayerService.initialize()
            
            updatePlaybackState(isLoading = true)

            // Create track infos with metadata enhancement
            val trackInfos = mediaItems.mapIndexed { index, item ->
                createTrackInfo(item, index)
            }

            _queue.value = trackInfos
            originalQueue = trackInfos
            currentQueueIndex = startIndex.coerceIn(0, trackInfos.size - 1)
            _currentTrack.value = trackInfos.getOrNull(currentQueueIndex)

            // Prepare ExoPlayer with queue
            val exoMediaItems = trackInfos.map { MediaItem.fromUri(it.filePath) }
            if (exoPlayerService.preparePlaylist(exoMediaItems, currentQueueIndex)) {
                exoPlayerService.play()
                updatePlaybackState(isPlaying = true, isLoading = false)
            } else {
                updatePlaybackState(error = "Failed to load queue")
            }
        } catch (e: Exception) {
            updatePlaybackState(error = "Error playing queue: ${e.message}")
        }
    }

    /**
     * Play/pause toggle
     */
    override fun togglePlayPause() {
        if (_playbackState.value.isPlaying) {
            pause()
        } else {
            play()
        }
    }

    /**
     * Start playback
     */
    override fun play() {
        exoPlayerService.play()
        updatePlaybackState(isPlaying = true)
    }

    /**
     * Pause playback
     */
    override fun pause() {
        exoPlayerService.pause()
        updatePlaybackState(isPlaying = false)
    }

    /**
     * Stop playback and clear queue
     */
    override fun stop() {
        exoPlayerService.stop() // This will also stop MediaController
        _queue.value = emptyList()
        _currentTrack.value = null
        currentQueueIndex = 0
        updatePlaybackState(isPlaying = false)
    }

    /**
     * Add track to queue
     */
    override fun addToQueue(mediaId: String) {
        // Convert mediaId to Long and add to queue
        val mediaIdLong = mediaId.toLongOrNull() ?: return
        
        // Fetch MediaItem from repository and add to queue
        scrobblerScope.launch {
            try {
                val mediaItem = mediaRepository.getMediaItemById(mediaIdLong)
                if (mediaItem != null) {
                    // Convert to TrackInfo and add to queue
                    val trackInfo = TrackInfo(
                        id = mediaItem.id.toString(),
                        title = mediaItem.title,
                        artist = null,  // Would need metadata lookup
                        album = null,
                        duration = 0,
                        filePath = mediaItem.filePath,
                        albumArtUrl = null
                    )
                    val currentQueue = _queue.value.toMutableList()
                    currentQueue.add(trackInfo)
                    _queue.value = currentQueue
                    Log.d("AdvancedMusicPlayer", "Added item ${mediaItem.id} to queue. Queue size: ${currentQueue.size}")
                } else {
                    Log.w("AdvancedMusicPlayer", "Media item not found: $mediaIdLong")
                }
            } catch (e: Exception) {
                Log.e("AdvancedMusicPlayer", "Failed to add to queue: $mediaIdLong", e)
            }
        }
    }

    /**
     * Remove track from queue
     */
    override fun removeFromQueue(index: Int) {
        val currentQueue = _queue.value
        if (index < 0 || index >= currentQueue.size) return
        
        _queue.value = currentQueue.filterIndexed { i, _ -> i != index }
    }

    /**
     * Move track in queue
     */
    override fun moveInQueue(from: Int, to: Int) {
        val currentQueue = _queue.value.toMutableList()
        if (from < 0 || from >= currentQueue.size || to < 0 || to >= currentQueue.size) return
        
        val item = currentQueue.removeAt(from)
        currentQueue.add(to, item)
        _queue.value = currentQueue
    }

    /**
     * Skip to specific position in queue
     */
    override fun skipToQueuePosition(index: Int) {
        val currentQueue = _queue.value
        if (index < 0 || index >= currentQueue.size) return
        
        currentQueueIndex = index
        playCurrentTrack()
    }

    /**
     * Seek relative to current position
     */
    override fun seekRelative(deltaMs: Long) {
        val currentPosition = getCurrentPosition()
        seekTo(currentPosition + deltaMs)
    }

    /**
     * Skip to next track
     */
    override fun skipNext() {
        val queue = _queue.value
        if (queue.isEmpty()) return

        when (_playlistMode.value) {
            PlaylistMode.REPEAT_ONE -> {
                // Restart current track
                seekTo(0)
                return
            }
            PlaylistMode.SHUFFLE -> {
                // Find next unplayed track or shuffle if all played
                skipToNextShuffled()
                return
            }
            else -> {
                // Normal or repeat all
                currentQueueIndex++
                if (currentQueueIndex >= queue.size) {
                    if (_playlistMode.value == PlaylistMode.REPEAT_ALL) {
                        currentQueueIndex = 0
                    } else {
                        // End of queue
                        stop()
                        return
                    }
                }
            }
        }

        playCurrentTrack()
    }

    /**
     * Skip to previous track
     */
    override fun skipPrevious() {
        val queue = _queue.value
        if (queue.isEmpty()) return

        // If more than 3 seconds played, restart current track
        if (getCurrentPosition() > 3000) {
            seekTo(0)
            return
        }

        when (_playlistMode.value) {
            PlaylistMode.SHUFFLE -> {
                skipToPreviousShuffled()
                return
            }
            else -> {
                currentQueueIndex--
                if (currentQueueIndex < 0) {
                    if (_playlistMode.value == PlaylistMode.REPEAT_ALL) {
                        currentQueueIndex = queue.size - 1
                    } else {
                        currentQueueIndex = 0
                        seekTo(0)
                        return
                    }
                }
            }
        }

        playCurrentTrack()
    }

    /**
     * Seek to position in milliseconds
     */
    override fun seekTo(positionMs: Long) {
        exoPlayerService.seekTo(positionMs)
    }

    /**
     * Get current playback position
     */
    fun getCurrentPosition(): Long {
        return exoPlayerService.getCurrentPosition()
    }

    /**
     * Get current track duration
     */
    fun getDuration(): Long {
        return exoPlayerService.getDuration()
    }

    /**
     * Set playlist mode (normal, repeat all, repeat one, shuffle)
     */
    fun setPlaylistMode(mode: PlaylistMode) {
        _playlistMode.value = mode

        when (mode) {
            PlaylistMode.SHUFFLE -> {
                if (_queue.value != originalQueue) {
                    shuffleQueue()
                }
            }
            else -> {
                if (_queue.value != originalQueue) {
                    // Restore original order
                    val currentTrack = _currentTrack.value
                    _queue.value = originalQueue
                    currentQueueIndex = originalQueue.indexOfFirst { it.id == currentTrack?.id }
                        .coerceAtLeast(0)
                }
            }
        }
    }

    /**
     * Add track to current queue
     */
    fun addToQueue(mediaItem: LocalMediaItem) {
        val trackInfo = createTrackInfo(mediaItem, _queue.value.size)
        val currentQueue = _queue.value.toMutableList()
        currentQueue.add(trackInfo)
        _queue.value = currentQueue

        if (originalQueue.isNotEmpty()) {
            originalQueue = originalQueue + trackInfo
        }
    }

    /**
     * Remove track from queue
     */
    fun removeFromQueue(trackId: String) {
        val currentQueue = _queue.value.toMutableList()
        val removedIndex = currentQueue.indexOfFirst { it.id == trackId }

        if (removedIndex >= 0) {
            currentQueue.removeAt(removedIndex)
            _queue.value = currentQueue

            // Adjust current index if needed
            if (removedIndex < currentQueueIndex) {
                currentQueueIndex--
            } else if (removedIndex == currentQueueIndex) {
                // Current track was removed, play next or stop
                if (currentQueue.isEmpty()) {
                    stop()
                } else {
                    if (currentQueueIndex >= currentQueue.size) {
                        currentQueueIndex = 0
                    }
                    playCurrentTrack()
                }
            }
        }
    }

    /**
     * Clear the entire queue
     */
    override fun clearQueue() {
        stop()
    }

    private var crossfadeDurationMs: Int = 0
    private var gaplessEnabled: Boolean = true
    
    /**
     * Set crossfade duration
     * @param durationMs Duration in milliseconds (0 to disable, typically 1000-5000ms)
     */
    fun setCrossfadeDuration(durationMs: Int) {
        crossfadeDurationMs = durationMs.coerceIn(0, 10000)
        // Configure ExoPlayer for crossfade
        // Note: Full crossfade requires custom audio processing
        // This is a simplified approach using playback parameters
        if (crossfadeDurationMs > 0) {
            // Crossfade is typically handled by adjusting volume during transitions
            // For full implementation, would need AudioProcessor
        }
    }

    /**
     * Enable/disable gapless playback
     * Gapless playback removes silence between tracks for seamless album listening
     */
    fun setGaplessPlayback(enabled: Boolean) {
        gaplessEnabled = enabled
        // ExoPlayer supports gapless by default for most formats
        // We can enhance it by skipping silence at track boundaries
        exoPlayerService.setSkipSilence(enabled)
    }

    private fun createTrackInfo(mediaItem: LocalMediaItem, queuePosition: Int = 0): TrackInfo {
        return TrackInfo(
            id = mediaItem.itemId.toString(),
            title = mediaItem.fileName.substringBeforeLast('.'),
            artist = extractArtistFromMetadata(mediaItem),
            album = extractAlbumFromMetadata(mediaItem),
            duration = 0L, // Duration will be updated when media is loaded
            filePath = mediaItem.filePath,
            albumArtUrl = null, // Will be enhanced later
            queuePosition = queuePosition
        )
    }

    private fun extractArtistFromMetadata(mediaItem: LocalMediaItem): String? {
        // Extract artist from metadata or filename
        // This is a simplified version - would use actual metadata extraction
        return "Unknown Artist"
    }

    private fun extractAlbumFromMetadata(mediaItem: LocalMediaItem): String? {
        // Extract album from metadata or filename
        // This is a simplified version - would use actual metadata extraction
        return "Unknown Album"
    }

    private fun playCurrentTrack() {
        val queue = _queue.value
        val currentTrack = queue.getOrNull(currentQueueIndex)

        if (currentTrack != null) {
            _currentTrack.value = currentTrack
            applyReplayGain(currentTrack)
            startScrobbling(currentTrack)
            exoPlayerService.seekToMediaItem(currentQueueIndex)
            if (!_playbackState.value.isPlaying) {
                play()
            }
        }
    }
    
    /**
     * Apply ReplayGain volume adjustment for a track
     */
    private fun applyReplayGain(track: TrackInfo) {
        try {
            val currentVolume = exoPlayerService.getVolume()
            val adjustedVolume = replayGainService.applyReplayGain(
                currentVolume = currentVolume,
                trackGain = track.replayGainTrack,
                albumGain = track.replayGainAlbum
            )
            
            // Only adjust if different from current volume
            if (adjustedVolume != currentVolume) {
                exoPlayerService.setVolume(adjustedVolume)
            }
        } catch (e: Exception) {
            // ReplayGain application is non-critical, continue playback
            Log.w("AdvancedMusicPlayer", "Failed to apply ReplayGain", e)
        }
    }

    override fun shuffleQueue() {
        val currentTrack = _currentTrack.value
        val shuffledQueue = originalQueue.shuffled()

        // Ensure current track is first in shuffled queue
        if (currentTrack != null) {
            val mutableQueue = shuffledQueue.toMutableList()
            mutableQueue.removeIf { it.id == currentTrack.id }
            mutableQueue.add(0, currentTrack)
            _queue.value = mutableQueue
            currentQueueIndex = 0
        } else {
            _queue.value = shuffledQueue
        }
    }

    private fun skipToNextShuffled() {
        // Simple shuffle implementation - could be made more sophisticated
        val queue = _queue.value
        if (queue.size <= 1) return

        val remainingTracks = queue.drop(currentQueueIndex + 1)
        if (remainingTracks.isNotEmpty()) {
            currentQueueIndex++
        } else {
            // Reshuffle for repeat
            if (_playlistMode.value == PlaylistMode.REPEAT_ALL) {
                shuffleQueue()
                currentQueueIndex = 0
            } else {
                stop()
                return
            }
        }

        playCurrentTrack()
    }

    private fun skipToPreviousShuffled() {
        if (currentQueueIndex > 0) {
            currentQueueIndex--
            playCurrentTrack()
        }
    }

    private fun updatePlaybackState(
        isPlaying: Boolean = _playbackState.value.isPlaying,
        isLoading: Boolean = false,
        error: String? = null
    ) {
        _playbackState.value = AdvancedPlaybackState(
            isPlaying = isPlaying,
            isLoading = isLoading,
            error = error
        )
    }

    /**
     * Get the underlying ExoPlayer instance for advanced features (visualizer, effects, etc.)
     */
    fun getExoPlayer(): ExoPlayer? {
        return exoPlayerService.getPlayer()
    }

    /**
     * Release all resources
     */
    fun release() {
        exoPlayerService.release()
        _queue.value = emptyList()
        _currentTrack.value = null
        updatePlaybackState(isPlaying = false)
    }

    // ===== PLAYBACK MODES =====

    /**
     * Set shuffle mode
     */
    override fun setShuffleMode(mode: com.universalmedialibrary.api.ShuffleMode) {
        when (mode) {
            com.universalmedialibrary.api.ShuffleMode.OFF -> _playlistMode.value = PlaylistMode.NORMAL
            com.universalmedialibrary.api.ShuffleMode.ALL,
            com.universalmedialibrary.api.ShuffleMode.CATEGORIES -> _playlistMode.value = PlaylistMode.SHUFFLE
        }
    }

    /**
     * Set repeat mode
     */
    override fun setRepeatMode(mode: com.universalmedialibrary.api.RepeatMode) {
        _playlistMode.value = when (mode) {
            com.universalmedialibrary.api.RepeatMode.OFF -> PlaylistMode.NORMAL
            com.universalmedialibrary.api.RepeatMode.ALL,
            com.universalmedialibrary.api.RepeatMode.ADVANCE_LIST -> PlaylistMode.REPEAT_ALL
            com.universalmedialibrary.api.RepeatMode.ONE -> PlaylistMode.REPEAT_ONE
        }
    }

    /**
     * Toggle shuffle mode
     */
    override fun toggleShuffle() {
        _playlistMode.value = if (_playlistMode.value == PlaylistMode.SHUFFLE) {
            PlaylistMode.NORMAL
        } else {
            PlaylistMode.SHUFFLE
        }
    }

    /**
     * Toggle repeat mode
     */
    override fun toggleRepeat() {
        _playlistMode.value = when (_playlistMode.value) {
            PlaylistMode.NORMAL -> PlaylistMode.REPEAT_ALL
            PlaylistMode.REPEAT_ALL -> PlaylistMode.REPEAT_ONE
            PlaylistMode.REPEAT_ONE -> PlaylistMode.NORMAL
            PlaylistMode.SHUFFLE -> PlaylistMode.REPEAT_ALL
        }
    }

    // ===== VOLUME & SPEED =====

    /**
     * Set volume level
     */
    override fun setVolume(volume: Float) {
        exoPlayerService.setVolume(volume.coerceIn(0f, 1f))
    }

    /**
     * Adjust volume by delta
     */
    override fun adjustVolume(delta: Float) {
        // Get current volume from ExoPlayer and adjust
        val currentVolume = exoPlayerService.getVolume()
        setVolume((currentVolume + delta).coerceIn(0f, 1f))
    }

    /**
     * Set playback speed
     */
    override fun setPlaybackSpeed(speed: Float) {
        exoPlayerService.setPlaybackSpeed(speed.coerceIn(0.5f, 3.0f))
    }

    // ===== AUDIO EFFECTS =====

    /**
     * Initialize audio effects for current playback
     */
    private fun initializeAudioEffects() {
        val audioSessionId = exoPlayerService.getAudioSessionId()
        if (audioSessionId != 0) {
            audioEffectsService.initialize(audioSessionId)
            applyStoredAudioEffects()
        }
    }

    private fun loadAudioEffectPreferences() {
        val eqOrdinal = audioPrefs.getInt(KEY_EQ_PRESET, EqualizerPreset.FLAT.ordinal)
        currentEqPreset = EqualizerPreset.values().getOrElse(eqOrdinal) { EqualizerPreset.FLAT }

        currentBassBoostStrength = audioPrefs.getInt(KEY_BASS_BOOST, 0).coerceIn(0, 1000)
        currentReverbEnabled = audioPrefs.getBoolean(KEY_REVERB_ENABLED, false)

        val reverbOrdinal = audioPrefs.getInt(KEY_REVERB_PRESET, ReverbPreset.SMALL_ROOM.ordinal)
        currentReverbPreset = ReverbPreset.values().getOrElse(reverbOrdinal) { ReverbPreset.SMALL_ROOM }

        val replayGainEnabled = audioPrefs.getBoolean(KEY_REPLAY_GAIN_ENABLED, true)
        val replayGainPreamp = audioPrefs.getInt(KEY_REPLAY_GAIN_PREAMP, 0)

        replayGainService.setEnabled(replayGainEnabled)
        replayGainService.setPreampGain(replayGainPreamp.toFloat())
    }

    private fun persistAudioEffects(block: SharedPreferences.Editor.() -> Unit) {
        audioPrefs.edit().apply {
            block()
            apply()
        }
    }

    private fun applyStoredAudioEffects() {
        try {
            audioEffectsService.applyEqualizerPreset(currentEqPreset)
        } catch (ignored: Exception) {
            Log.w("AdvancedMusicPlayer", "Equalizer not available on this device")
        }

        try {
            audioEffectsService.setBassBoost(
                currentBassBoostStrength.coerceIn(0, 1000),
                enabled = currentBassBoostStrength > 0
            )
        } catch (ignored: Exception) {
            Log.w("AdvancedMusicPlayer", "Bass boost not available on this device")
        }

        try {
            audioEffectsService.setReverb(currentReverbPreset, currentReverbEnabled)
        } catch (ignored: Exception) {
            Log.w("AdvancedMusicPlayer", "Reverb not available on this device")
        }
    }

    /**
     * Set equalizer preset
     */
    override fun setEqualizerPreset(presetId: Int) {
        try {
            // Map presetId to EqualizerPreset enum
            val preset = when (presetId) {
                0 -> EqualizerPreset.FLAT
                1 -> EqualizerPreset.BASS_BOOST
                2 -> EqualizerPreset.TREBLE_BOOST
                3 -> EqualizerPreset.VOCAL
                4 -> EqualizerPreset.DEEP
                5 -> EqualizerPreset.ELECTRONIC
                6 -> EqualizerPreset.ROCK
                7 -> EqualizerPreset.JAZZ
                else -> EqualizerPreset.FLAT
            }
            currentEqPreset = preset
            audioEffectsService.applyEqualizerPreset(preset)
            persistAudioEffects {
                putInt(KEY_EQ_PRESET, preset.ordinal)
            }
        } catch (e: Exception) {
            // Audio effects not available on this device
        }
    }

    /**
     * Enable/disable reverb effect
     */
    override fun enableReverb(enabled: Boolean) {
        try {
            currentReverbEnabled = enabled
            audioEffectsService.setReverb(currentReverbPreset, enabled)
            persistAudioEffects {
                putBoolean(KEY_REVERB_ENABLED, enabled)
            }
        } catch (e: Exception) {
            // Audio effects not available on this device
        }
    }

    fun setReverbPreset(preset: ReverbPreset) {
        currentReverbPreset = preset
        try {
            audioEffectsService.setReverb(currentReverbPreset, currentReverbEnabled)
            persistAudioEffects {
                putInt(KEY_REVERB_PRESET, preset.ordinal)
            }
        } catch (e: Exception) {
            // Audio effects not available on this device
        }
    }

    /**
     * Set bass boost strength (0-1000)
     */
    override fun setBassBoost(strength: Int) {
        try {
            currentBassBoostStrength = strength.coerceIn(0, 1000)
            audioEffectsService.setBassBoost(currentBassBoostStrength, enabled = currentBassBoostStrength > 0)
            persistAudioEffects {
                putInt(KEY_BASS_BOOST, currentBassBoostStrength)
            }
        } catch (e: Exception) {
            // Audio effects not available on this device
        }
    }
    
    fun setReplayGainEnabled(enabled: Boolean) {
        replayGainService.setEnabled(enabled)
        currentTrack.value?.let { applyReplayGain(it) }
        persistAudioEffects {
            putBoolean(KEY_REPLAY_GAIN_ENABLED, enabled)
        }
    }

    fun setReplayGainPreamp(preampDb: Int) {
        replayGainService.setPreampGain(preampDb.toFloat())
        currentTrack.value?.let { applyReplayGain(it) }
        persistAudioEffects {
            putInt(KEY_REPLAY_GAIN_PREAMP, preampDb)
        }
    }

    fun getAudioEffectsSnapshot(): AudioEffectsSnapshot {
        val replayGainSettings = replayGainService.getSettings()
        return AudioEffectsSnapshot(
            eqPreset = currentEqPreset,
            bassBoostStrength = currentBassBoostStrength,
            reverbEnabled = currentReverbEnabled,
            reverbPreset = currentReverbPreset,
            replayGainEnabled = replayGainSettings.enabled,
            replayGainPreamp = replayGainSettings.preampGain.roundToInt()
        )
    }

    /**
     * Get ExoPlayerService instance for visualizer attachment
     */
    fun getExoPlayerService(): ExoPlayerService = exoPlayerService
    
    // ===== LAST.FM SCROBBLING =====
    
    /**
     * Start Last.fm scrobbling for current track
     */
    private fun startScrobbling(track: TrackInfo) {
        // Cancel any existing scrobble job
        scrobbleJob?.cancel()
        hasScrobbled = false
        trackStartTime = System.currentTimeMillis()
        
        // Update "Now Playing" on Last.fm
        scrobblerScope.launch {
            lastFmScrobbler.updateNowPlaying(
                artist = track.artist ?: "Unknown Artist",
                track = track.title,
                album = track.album,
                duration = track.duration
            )
        }
        
        // Schedule scrobble for 50% of track or 4 minutes (whichever comes first)
        val scrobbleDelay = minOf(
            track.duration / 2, // 50% of track
            4 * 60 * 1000 // 4 minutes
        )
        
        scrobbleJob = scrobblerScope.launch {
            delay(scrobbleDelay)
            if (!hasScrobbled) {
                lastFmScrobbler.scrobble(
                    artist = track.artist ?: "Unknown Artist",
                    track = track.title,
                    album = track.album,
                    duration = track.duration
                )
                hasScrobbled = true
            }
        }
    }
    
    /**
     * Get Last.fm scrobbler service
     */
    fun getLastFmScrobbler(): LastFmScrobblerService = lastFmScrobbler
    
    /**
     * Get audio profile service
     */
    fun getAudioProfileService(): AudioProfileService = audioProfileService
}

/**
 * Enhanced playback state for advanced music player
 */
data class AdvancedPlaybackState(
    val isPlaying: Boolean = false,
    val isLoading: Boolean = false,
    val error: String? = null
) {
    val hasError: Boolean get() = error != null
    val canPlay: Boolean get() = !isLoading && !hasError
}

/**
 * Track information for music player
 */
data class TrackInfo(
    val id: String,
    val title: String,
    val artist: String?,
    val album: String?,
    val duration: Long,
    val filePath: String,
    val albumArtUrl: String?,
    val queuePosition: Int = 0,
    val replayGainTrack: Float? = null, // Track gain in dB
    val replayGainAlbum: Float? = null  // Album gain in dB
)

data class AudioEffectsSnapshot(
    val eqPreset: EqualizerPreset,
    val bassBoostStrength: Int,
    val reverbEnabled: Boolean,
    val reverbPreset: ReverbPreset,
    val replayGainEnabled: Boolean,
    val replayGainPreamp: Int
)

private const val AUDIO_EFFECTS_PREFS = "audio_effects_settings"
private const val KEY_EQ_PRESET = "eq_preset"
private const val KEY_BASS_BOOST = "bass_boost_strength"
private const val KEY_REVERB_ENABLED = "reverb_enabled"
private const val KEY_REVERB_PRESET = "reverb_preset"
private const val KEY_REPLAY_GAIN_ENABLED = "replay_gain_enabled"
private const val KEY_REPLAY_GAIN_PREAMP = "replay_gain_preamp"

/**
 * Playlist modes for music playback
 */
enum class PlaylistMode {
    NORMAL,      // Play through queue once
    REPEAT_ALL,  // Repeat entire queue
    REPEAT_ONE,  // Repeat current track
    SHUFFLE      // Random playback order
}
