package com.universalmedialibrary.ui.visualizer

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.services.cast.ChromecastManager
import com.universalmedialibrary.services.visualizer.AudioVisualizerService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class VisualizerViewModel @Inject constructor(
    private val audioVisualizerService: AudioVisualizerService,
    private val chromecastManager: ChromecastManager,
    private val audioPlaybackManager: AudioPlaybackManager,
    private val exoPlayerService: com.universalmedialibrary.services.exoplayer.ExoPlayerService,
    private val advancedMusicPlayerService: com.universalmedialibrary.services.music.AdvancedMusicPlayerService
) : ViewModel() {

    companion object {
        private const val PLAYER_CHECK_INTERVAL_MS = 100L
    }

    val visualizerState = audioVisualizerService.visualizerState
    val castState = chromecastManager.castState
    val isVisualizerEnabled = audioVisualizerService.isEnabled
    val beatDetected = audioVisualizerService.beatDetected

    private val _currentPreset = MutableStateFlow<com.universalmedialibrary.services.visualizer.VisualizerPreset?>(null)
    val currentPreset: StateFlow<com.universalmedialibrary.services.visualizer.VisualizerPreset?> = _currentPreset.asStateFlow()

    fun setPreset(preset: com.universalmedialibrary.services.visualizer.VisualizerPreset) {
        _currentPreset.value = preset
    }

    fun initialize() {
        // Initialize Chromecast
        chromecastManager.initialize()

        // Attach visualizer to the active player
        // Try AdvancedMusicPlayerService first (used for music AND radio), then ExoPlayerService, then AudioPlaybackManager
        val activePlayer = advancedMusicPlayerService.getExoPlayer()
            ?: exoPlayerService.getPlayer()
            ?: audioPlaybackManager.exoPlayer
        audioVisualizerService.attachToPlayer(activePlayer)
        audioVisualizerService.setEnabled(true)

        // Monitor all players and reattach when active player changes
        viewModelScope.launch {
            while (isActive) {
                // Check if we need to switch players
                val advancedPlayer = advancedMusicPlayerService.getExoPlayer()  // Music + Radio
                val musicPlayer = exoPlayerService.getPlayer()
                val audioPlayer = audioPlaybackManager.exoPlayer
                val currentPlayer = audioVisualizerService.getCurrentPlayer()

                delay(500L) // Prevent busy-loop CPU/battery drain

                // Prefer the player that's actually playing
                val targetPlayer = when {
                    advancedPlayer?.isPlaying == true -> advancedPlayer  // Highest priority - music/radio
                    musicPlayer?.isPlaying == true -> musicPlayer
                    audioPlayer.isPlaying -> audioPlayer
                    advancedPlayer != null -> advancedPlayer
                    musicPlayer != null -> musicPlayer
                    else -> audioPlayer
                }

                // Reattach if player changed (with null-safety check)
                if (currentPlayer != targetPlayer && targetPlayer != null) {
                    audioVisualizerService.attachToPlayer(targetPlayer)
                    if (isVisualizerEnabled.value) {
                        audioVisualizerService.setEnabled(true)
                    }
                }

                // Update cast with visualizer data
                val state = visualizerState.value
                chromecastManager.updateVisualizerData(
                    bass = state.frequencyBands.bass,
                    mid = state.frequencyBands.mid,
                    treble = state.frequencyBands.treble,
                    spectrum = state.frequencyBands.spectrum
                )
                delay(PLAYER_CHECK_INTERVAL_MS)
            }
        }
    }

    fun toggleVisualizer() {
        audioVisualizerService.setEnabled(!isVisualizerEnabled.value)
    }

    fun startCasting() {
        chromecastManager.enableVisualizerCasting(true)
    }

    fun stopCasting() {
        chromecastManager.stopCasting()
    }

    fun cleanup() {
        audioVisualizerService.setEnabled(false)
        chromecastManager.stopCasting()
        chromecastManager.release()
    }

    override fun onCleared() {
        super.onCleared()
        chromecastManager.release()
        audioVisualizerService.release()
    }
}
