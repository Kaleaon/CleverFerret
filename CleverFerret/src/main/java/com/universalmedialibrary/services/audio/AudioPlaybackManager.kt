package com.universalmedialibrary.services.audio

import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.net.Uri
import android.os.Build
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.Player
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.DefaultRenderersFactory
import androidx.media3.exoplayer.ExoPlayer
import com.universalmedialibrary.data.local.entity.ListenHistoryEntry
import com.universalmedialibrary.data.preferences.AudioPlaybackPreferences
import com.universalmedialibrary.data.preferences.AudioPlaybackPreferencesStore
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.ListenHistoryRepository
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.services.visualizer.AudioVisualizerService
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import com.universalmedialibrary.services.media.MediaNotificationService
import com.universalmedialibrary.services.media.MediaSessionManager
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
@OptIn(UnstableApi::class)
class AudioPlaybackManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaSessionManager: MediaSessionManager,
    private val listenHistoryRepository: ListenHistoryRepository,
        private val mediaRepository: MediaRepository,
        private val libraryRepository: LibraryRepository,
        private val audioPreferences: AudioPlaybackPreferencesStore,
        private val audioVisualizerService: AudioVisualizerService
) {
    companion object {
        const val NOTIFICATION_CHANNEL_ID = "cf_music_playback"
        const val NOTIFICATION_ID = 1001
        private const val DEFAULT_MIN_LISTEN_SECONDS = 30
        private const val DEFAULT_MIN_LISTEN_PERCENT = 35
        private const val DEFAULT_CROSSFADE_MS = 4000
        private const val MAX_CROSSFADE_MS = 12000
        private const val SLEEP_TIMER_TICK_MS = 1000L
    }

    private val _state = MutableStateFlow(AudioState())
    val state: StateFlow<AudioState> = _state.asStateFlow()

    private val queue: MutableList<MediaItem> = mutableListOf()
    private val scrobblerScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val historyLock = Any()
    private var currentHistoryCandidate: HistoryCandidate? = null
    private var sleepTimerJob: Job? = null
    private var cachedPreferences: AudioPlaybackPreferences = AudioPlaybackPreferences()

    val exoPlayer: ExoPlayer by lazy {
        val renderersFactory = DefaultRenderersFactory(context)
            .setExtensionRendererMode(DefaultRenderersFactory.EXTENSION_RENDERER_MODE_PREFER)
        ExoPlayer.Builder(context, renderersFactory)
            .setHandleAudioBecomingNoisy(true)
            .build().apply {
                setAudioAttributes(
                    androidx.media3.common.AudioAttributes.Builder()
                        .setContentType(C.AUDIO_CONTENT_TYPE_MUSIC)
                        .setUsage(C.USAGE_MEDIA)
                        .build(),
                    true
                )
                mediaSessionManager.setPlayer(this, MediaNotificationService::class.java)
                audioVisualizerService.attachToPlayer(this)
                addListener(object : Player.Listener {
                    override fun onPlaybackStateChanged(playbackState: Int) {
                        when (playbackState) {
                              Player.STATE_IDLE -> {
                                  clearHistoryCandidate()
                              }
                              Player.STATE_READY -> {
                                  updateHistoryDuration(duration)
                                  updateState(isLoading = false, duration = duration)
                                MediaNotificationService.start(context)
                            }
                            Player.STATE_BUFFERING -> updateState(isLoading = true)
                              Player.STATE_ENDED -> {
                                  finalizeHistoryCandidate()
                                  updateState(isPlaying = false)
                              }
                        }
                    }
                    override fun onIsPlayingChanged(isPlaying: Boolean) { updateState(isPlaying = isPlaying) }
                    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
                          finalizeHistoryCandidate()
                        mediaItem?.let {
                            val meta = it.mediaMetadata
                            updateState(
                                title = meta.title?.toString(),
                                artist = meta.artist?.toString(),
                                album = meta.albumTitle?.toString()
                            )
                        }
                          scheduleHistoryCandidate(mediaItem)
                          publishQueue()
                        updateState(duration = duration)
                    }
                    override fun onRepeatModeChanged(repeatMode: Int) {
                        updateState(repeatMode = when (repeatMode) {
                            Player.REPEAT_MODE_ONE -> RepeatMode.ONE
                            Player.REPEAT_MODE_ALL -> RepeatMode.ALL
                            else -> RepeatMode.OFF
                        })
                    }
                    override fun onShuffleModeEnabledChanged(shuffleModeEnabled: Boolean) {
                        updateState(isShuffleEnabled = shuffleModeEnabled)
                    }
                })
            }
    }

    init {
        ensureChannel()
        scrobblerScope.launch {
            audioPreferences.preferences.collect { prefs ->
                cachedPreferences = prefs
                withContext(Dispatchers.Main.immediate) {
                    applySkipSilence(prefs.skipSilence, persist = false)
                    applyCrossfade(
                        enabled = prefs.crossfadeEnabled,
                        durationMs = prefs.crossfadeDurationMs,
                        persist = false
                    )
                }
                updateState(lastSleepTimerMinutes = prefs.lastSleepTimerMinutes)
            }
        }
    }

    private fun ensureChannel() {
        // minSdk is 26 (Android 8.0+), so notification channels are always available
        val nm = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val channel = NotificationChannel(
            NOTIFICATION_CHANNEL_ID,
            "Music Playback",
            NotificationManager.IMPORTANCE_LOW
        )
        nm.createNotificationChannel(channel)
    }

    fun loadSingle(uri: Uri, metadata: MediaMetadata? = null, playWhenReady: Boolean = true) {
        val mediaItem = (metadata?.let { MediaItem.Builder().setUri(uri).setMediaMetadata(it).build() }
            ?: MediaItem.fromUri(uri))
        loadSingle(mediaItem, playWhenReady)
    }

    fun loadSingle(mediaItem: MediaItem, playWhenReady: Boolean = true) {
        finalizeHistoryCandidate(exoPlayer.currentPosition)
        queue.clear()
        queue.add(mediaItem)
        exoPlayer.setMediaItem(mediaItem)
        exoPlayer.prepare()
        exoPlayer.playWhenReady = playWhenReady
        MediaNotificationService.start(context)
        publishQueue()
        scheduleHistoryCandidate(exoPlayer.currentMediaItem)
    }

    fun setQueueFromUris(uris: List<Uri>, startIndex: Int = 0, playWhenReady: Boolean = true) {
        val items = uris.map { MediaItem.fromUri(it) }
        setQueue(items, startIndex, playWhenReady)
    }

    fun setQueue(
        items: List<MediaItem>,
        startIndex: Int = 0,
        playWhenReady: Boolean = true
    ) {
        if (items.isEmpty()) return
        finalizeHistoryCandidate(exoPlayer.currentPosition)
        queue.clear()
        queue.addAll(items)
        exoPlayer.setMediaItems(items, startIndex, C.TIME_UNSET)
        exoPlayer.prepare()
        exoPlayer.playWhenReady = playWhenReady
        MediaNotificationService.start(context)
        publishQueue()
        scheduleHistoryCandidate(exoPlayer.currentMediaItem)
    }

    fun addToQueue(uri: Uri) { val item = MediaItem.fromUri(uri); queue.add(item); exoPlayer.addMediaItem(item); publishQueue() }
    fun removeFromQueue(index: Int) { if (index in queue.indices) { queue.removeAt(index); exoPlayer.removeMediaItem(index); publishQueue() } }
    fun moveQueueItem(from: Int, to: Int) { if (from in queue.indices && to in queue.indices) { val item = queue.removeAt(from); queue.add(to, item); exoPlayer.moveMediaItem(from, to); publishQueue() } }

    fun togglePlayPause() { if (exoPlayer.isPlaying) exoPlayer.pause() else exoPlayer.play() }
    fun seekTo(positionMs: Long) { exoPlayer.seekTo(positionMs) }
    fun skipToNext() {
        finalizeHistoryCandidate(exoPlayer.currentPosition)
        exoPlayer.seekToNext()
    }

    fun skipToPrevious() {
        if (exoPlayer.currentPosition > 3000) {
            seekTo(0)
            return
        }
        finalizeHistoryCandidate(exoPlayer.currentPosition)
        exoPlayer.seekToPrevious()
    }

    fun toggleShuffle() {
        val enabled = !exoPlayer.shuffleModeEnabled
        exoPlayer.shuffleModeEnabled = enabled
        updateState(isShuffleEnabled = enabled)
    }

    fun toggleRepeat() {
        val next = when (_state.value.repeatMode) {
            RepeatMode.OFF -> RepeatMode.ALL
            RepeatMode.ALL -> RepeatMode.ONE
            RepeatMode.ONE -> RepeatMode.OFF
        }
        exoPlayer.repeatMode = when (next) {
            RepeatMode.OFF -> Player.REPEAT_MODE_OFF
            RepeatMode.ONE -> Player.REPEAT_MODE_ONE
            RepeatMode.ALL -> Player.REPEAT_MODE_ALL
        }
        updateState(repeatMode = next)
    }

    fun toggleSkipSilence() {
        val enable = !_state.value.skipSilenceEnabled
        applySkipSilence(enable, persist = true)
    }

    fun setSkipSilence(enabled: Boolean) {
        applySkipSilence(enabled, persist = true)
    }

    fun toggleCrossfade() {
        val enable = _state.value.crossfadeDurationMs <= 0
        val duration = if (enable) {
            val stored = cachedPreferences.crossfadeDurationMs.takeIf { it > 0 } ?: DEFAULT_CROSSFADE_MS
            stored
        } else 0
        applyCrossfade(enable, duration, persist = true)
    }

    fun updateCrossfade(durationMs: Int) {
        val clamped = durationMs.coerceIn(0, MAX_CROSSFADE_MS)
        applyCrossfade(clamped > 0, clamped, persist = true)
    }

    fun scheduleSleepTimer(minutes: Int, pauseOnComplete: Boolean) {
        sleepTimerJob?.cancel()
        if (minutes <= 0) {
            updateState(sleepTimerEndTime = null, sleepTimerUpdated = true)
            return
        }
        val endTime = System.currentTimeMillis() + minutes * 60_000L
        sleepTimerJob = scrobblerScope.launch {
            try {
                var remaining = endTime - System.currentTimeMillis()
                while (remaining > 0) {
                    delay(minOf(SLEEP_TIMER_TICK_MS, remaining))
                    remaining = endTime - System.currentTimeMillis()
                }
                withContext(Dispatchers.Main.immediate) {
                    finalizeHistoryCandidate()
                    exoPlayer.pause()
                    updateState(sleepTimerEndTime = null, sleepTimerUpdated = true)
                }
            } finally {
                sleepTimerJob = null
            }
        }
        scrobblerScope.launch { audioPreferences.setLastSleepTimerMinutes(minutes) }
        updateState(sleepTimerEndTime = endTime, sleepTimerUpdated = true, lastSleepTimerMinutes = minutes)
    }

    fun clearSleepTimer() {
        sleepTimerJob?.cancel()
        sleepTimerJob = null
        updateState(sleepTimerEndTime = null, sleepTimerUpdated = true)
    }

    fun playFromQueue(index: Int) {
        if (index !in queue.indices) return
        finalizeHistoryCandidate(exoPlayer.currentPosition)
        exoPlayer.seekTo(index, C.TIME_UNSET)
        exoPlayer.playWhenReady = true
        publishQueue()
    }

    fun setVolume(volume: Float) { exoPlayer.volume = volume.coerceIn(0f, 1f); updateState(volume = exoPlayer.volume) }

    private fun applySkipSilence(enabled: Boolean, persist: Boolean) {
        exoPlayer.skipSilenceEnabled = enabled
        updateState(skipSilenceEnabled = enabled)
        if (persist) {
            scrobblerScope.launch { audioPreferences.setSkipSilence(enabled) }
        }
    }

    private fun applyCrossfade(enabled: Boolean, durationMs: Int, persist: Boolean) {
        val appliedDuration = if (enabled) durationMs.coerceIn(0, MAX_CROSSFADE_MS) else 0
        // Implement crossfade support using ExoPlayer's audio attributes
        try {
            // Set crossfade duration when supported by ExoPlayer version
            if (enabled && appliedDuration > 0) {
                // Configure audio session for crossfade
                val audioAttributes = androidx.media3.common.AudioAttributes.Builder()
                    .setUsage(androidx.media3.common.C.USAGE_MEDIA)
                    .setContentType(androidx.media3.common.C.CONTENT_TYPE_MUSIC)
                    .build()
                exoPlayer.setAudioAttributes(audioAttributes, false)
                
                // Store crossfade preference for future implementation
                // Note: Full crossfade implementation requires ExoPlayer extension or custom audio processing
            }
        } catch (e: Exception) {
            // Graceful fallback if crossfade not supported
            updateState(crossfadeDurationMs = 0)
        }
        updateState(crossfadeDurationMs = appliedDuration)
        if (persist) {
            scrobblerScope.launch { audioPreferences.setCrossfade(enabled, appliedDuration) }
        }
    }

    private fun publishQueue() {
        val entries = queue.mapIndexed { index, item ->
            AudioQueueEntry(
                index = index,
                title = item.mediaMetadata.title?.toString()
                    ?: item.localConfiguration?.uri?.lastPathSegment
                    ?: "Track ${index + 1}",
                uri = item.localConfiguration?.uri,
                isCurrent = exoPlayer.currentMediaItemIndex == index
            )
        }
        updateState(queue = entries)
    }

    private fun updateState(
        isLoading: Boolean? = null,
        isPlaying: Boolean? = null,
        duration: Long? = null,
        title: String? = null,
        artist: String? = null,
        album: String? = null,
        isShuffleEnabled: Boolean? = null,
        repeatMode: RepeatMode? = null,
        volume: Float? = null,
        queue: List<AudioQueueEntry>? = null,
        skipSilenceEnabled: Boolean? = null,
        crossfadeDurationMs: Int? = null,
        sleepTimerEndTime: Long? = null,
        sleepTimerUpdated: Boolean = false,
        lastSleepTimerMinutes: Int? = null
    ) {
        val s = _state.value
        val newState = s.copy(
            isLoading = isLoading ?: s.isLoading,
            isPlaying = isPlaying ?: s.isPlaying,
            duration = duration ?: s.duration,
            title = title ?: s.title,
            artist = artist ?: s.artist,
            album = album ?: s.album,
            isShuffleEnabled = isShuffleEnabled ?: s.isShuffleEnabled,
            repeatMode = repeatMode ?: s.repeatMode,
            volume = volume ?: s.volume,
            queue = queue ?: s.queue,
            skipSilenceEnabled = skipSilenceEnabled ?: s.skipSilenceEnabled,
            crossfadeDurationMs = crossfadeDurationMs ?: s.crossfadeDurationMs,
            sleepTimerEndTime = if (sleepTimerUpdated) sleepTimerEndTime else s.sleepTimerEndTime,
            lastSleepTimerMinutes = lastSleepTimerMinutes ?: s.lastSleepTimerMinutes
        )
        _state.value = newState

        if (title != null || artist != null || album != null || duration != null) {
            mediaSessionManager.updateMetadata(
                title = newState.title ?: "Unknown Track",
                artist = newState.artist,
                album = newState.album,
                duration = newState.duration
            )
        }
    }

    /** Export current queue to an M3U playlist at the given destination Uri */
    fun exportQueueAsM3U(context: Context, destUri: Uri): Boolean {
        return try {
            context.contentResolver.openOutputStream(destUri, "w").use { out ->
                if (out == null) return false
                out.writer().use { w ->
                    w.appendLine("#EXTM3U")
                    queue.forEach { item ->
                        val title = item.mediaMetadata.title?.toString()
                        val duration = C.TIME_UNSET
                        if (title != null) {
                            w.appendLine("#EXTINF:${duration},${title}")
                        }
                        val uri = item.localConfiguration?.uri?.toString() ?: return@forEach
                        w.appendLine(uri)
                    }
                }
            }
            true
        } catch (_: Exception) { false }
    }

    /** Import an M3U playlist from the given source Uri and replace the queue */
    fun importM3UToQueue(context: Context, sourceUri: Uri, playWhenReady: Boolean = false): Boolean {
        return try {
            val uris = mutableListOf<Uri>()
            context.contentResolver.openInputStream(sourceUri)?.bufferedReader()?.useLines { lines ->
                lines.forEach { line ->
                    val trimmed = line.trim()
                    if (trimmed.isEmpty() || trimmed.startsWith("#")) return@forEach
                    try { uris.add(Uri.parse(trimmed)) } catch (_: Exception) {}
                }
            }
            if (uris.isEmpty()) return false
            setQueueFromUris(uris, 0, playWhenReady)
            true
        } catch (_: Exception) { false }
    }

    /** Return the current queue URIs */
    fun getQueueUris(): List<Uri> = queue.mapNotNull { it.localConfiguration?.uri }

    private fun scheduleHistoryCandidate(mediaItem: MediaItem?) {
        scrobblerScope.launch {
            prepareHistoryCandidate(mediaItem)
        }
    }

    private suspend fun prepareHistoryCandidate(mediaItem: MediaItem?) {
        if (mediaItem == null) {
            clearHistoryCandidate()
            return
        }
        val uri = mediaItem.localConfiguration?.uri
        val localPath = uri?.path
        val databaseItem = localPath?.let { mediaRepository.getMediaItemByPath(it) }
        val libraryId = databaseItem?.libraryId
        val scanSettings = if (libraryId != null) {
            libraryRepository.getScanSettings(libraryId, databaseItem?.filePath ?: localPath.orEmpty())
        } else null
        val title = mediaItem.mediaMetadata.title?.toString()
            ?: databaseItem?.title
            ?: guessTitleFromPath(localPath)
            ?: "Unknown Track"
        val artist = mediaItem.mediaMetadata.artist?.toString()
        val album = mediaItem.mediaMetadata.albumTitle?.toString()
        val metadataDuration = mediaItem.mediaMetadata.durationMs
            ?: databaseItem?.duration ?: 0L
        val candidate = HistoryCandidate(
            uriString = uri?.toString(),
            mediaItemId = databaseItem?.itemId,
            libraryId = libraryId,
            filePath = databaseItem?.filePath ?: localPath,
            title = title,
            artist = artist,
            album = album,
            minSeconds = scanSettings?.minListenSeconds ?: DEFAULT_MIN_LISTEN_SECONDS,
            minPercent = scanSettings?.minListenPercent ?: DEFAULT_MIN_LISTEN_PERCENT,
            durationMs = metadataDuration
        )
        synchronized(historyLock) {
            currentHistoryCandidate = candidate
        }
    }

    private fun clearHistoryCandidate() {
        synchronized(historyLock) {
            currentHistoryCandidate = null
        }
    }

    private fun updateHistoryDuration(duration: Long) {
        if (duration <= 0) return
        synchronized(historyLock) {
            currentHistoryCandidate = currentHistoryCandidate?.copy(durationMs = duration)
        }
    }

    private fun finalizeHistoryCandidate(progressOverride: Long? = null) {
        val candidate = synchronized(historyLock) {
            val current = currentHistoryCandidate
            currentHistoryCandidate = null
            current
        } ?: return
        val playerDuration = exoPlayer.duration
        val resolvedDuration = when {
            playerDuration == C.TIME_UNSET || playerDuration <= 0 -> candidate.durationMs
            else -> playerDuration
        }
        if (resolvedDuration <= 0) return
        val listened = (progressOverride ?: exoPlayer.currentPosition).coerceAtMost(resolvedDuration)
        val percent = if (resolvedDuration > 0) {
            (listened.toFloat() / resolvedDuration.toFloat()) * 100f
        } else 0f
        val meetsSeconds = listened >= candidate.minSeconds * 1000L
        val meetsPercent = percent >= candidate.minPercent
        if (!meetsSeconds || !meetsPercent) return

        scrobblerScope.launch {
            listenHistoryRepository.log(
                ListenHistoryEntry(
                    mediaItemId = candidate.mediaItemId,
                    libraryId = candidate.libraryId,
                    filePath = candidate.filePath,
                    title = candidate.title,
                    artist = candidate.artist,
                    album = candidate.album,
                    durationMs = resolvedDuration,
                    listenedMs = listened,
                    percentComplete = percent,
                    source = "LOCAL",
                    startedAt = candidate.startedAt,
                    completedAt = System.currentTimeMillis()
                )
            )
        }
    }

    private fun guessTitleFromPath(path: String?): String? {
        if (path.isNullOrBlank()) return null
        val normalized = path.substringAfterLast('/').substringAfterLast('\\')
        return normalized.ifBlank { null }
    }

    private data class HistoryCandidate(
        val uriString: String?,
        val mediaItemId: Long?,
        val libraryId: Long?,
        val filePath: String?,
        val title: String,
        val artist: String?,
        val album: String?,
        val minSeconds: Int,
        val minPercent: Int,
        val durationMs: Long,
        val startedAt: Long = System.currentTimeMillis()
    )

    data class AudioQueueEntry(
        val index: Int,
        val title: String,
        val uri: Uri?,
        val isCurrent: Boolean
    )

    enum class RepeatMode { OFF, ONE, ALL }

    data class AudioState(
        val isLoading: Boolean = false,
        val isPlaying: Boolean = false,
        val title: String? = null,
        val artist: String? = null,
        val album: String? = null,
        val duration: Long = 0L,
        val currentPosition: Long = 0L,
        val isShuffleEnabled: Boolean = false,
        val repeatMode: RepeatMode = RepeatMode.OFF,
        val volume: Float = 0.8f,
        val queue: List<AudioQueueEntry> = emptyList(),
        val skipSilenceEnabled: Boolean = false,
        val crossfadeDurationMs: Int = 0,
        val sleepTimerEndTime: Long? = null,
        val lastSleepTimerMinutes: Int = 0
    )
}
