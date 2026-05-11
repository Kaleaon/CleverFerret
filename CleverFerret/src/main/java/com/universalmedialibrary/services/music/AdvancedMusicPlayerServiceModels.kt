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
 * Enhanced playback state for advanced music player
 */
data class AdvancedPlaybackState(
    val isPlaying: Boolean = false,
    val isLoading: Boolean = false,
    val error: String? = null,
    val currentPositionMs: Long = 0L,
    val isShuffling: Boolean = false,
    val repeatMode: Int = 0  // 0 = off, 1 = one, 2 = all
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
/**
 * Playlist modes for music playback
 */
enum class PlaylistMode {
    NORMAL,      // Play through queue once
    REPEAT_ALL,  // Repeat entire queue
    REPEAT_ONE,  // Repeat current track
    SHUFFLE      // Random playback order
}