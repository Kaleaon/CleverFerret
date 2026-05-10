package com.universalmedialibrary.services.music

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Owns Last.fm scrobbling lifecycle (initialize, now-playing, deferred scrobble).
 * Extracted from AdvancedMusicPlayerService so the player service no longer
 * manages a per-track coroutine job or scrobble-timing flag.
 */
@Singleton
class LastFmScrobbleManager @Inject constructor(
    private val lastFmScrobbler: LastFmScrobblerService,
) {
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private var scrobbleJob: Job? = null
    private var trackStartTime: Long = 0
    private var hasScrobbled: Boolean = false

    fun initialize() {
        scope.launch { lastFmScrobbler.initialize() }
    }

    fun updateNowPlayingAsync(track: TrackInfo) {
        scope.launch {
            lastFmScrobbler.updateNowPlaying(
                artist = track.artist ?: "Unknown Artist",
                track = track.title,
                album = track.album,
                duration = track.duration,
            )
        }
    }

    fun startScrobbling(track: TrackInfo) {
        scrobbleJob?.cancel()
        hasScrobbled = false
        trackStartTime = System.currentTimeMillis()

        scope.launch {
            lastFmScrobbler.updateNowPlaying(
                artist = track.artist ?: "Unknown Artist",
                track = track.title,
                album = track.album,
                duration = track.duration,
            )
        }

        val scrobbleDelay = minOf(track.duration / 2, 4 * 60 * 1000L)
        scrobbleJob = scope.launch {
            delay(scrobbleDelay)
            if (!hasScrobbled) {
                lastFmScrobbler.scrobble(
                    artist = track.artist ?: "Unknown Artist",
                    track = track.title,
                    album = track.album,
                    duration = track.duration,
                )
                hasScrobbled = true
            }
        }
    }

    fun release() {
        scrobbleJob?.cancel()
        scope.cancel()
    }

    fun underlying(): LastFmScrobblerService = lastFmScrobbler
}
