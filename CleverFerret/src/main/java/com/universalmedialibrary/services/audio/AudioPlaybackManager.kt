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
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.ListenHistoryRepository
import com.universalmedialibrary.data.repository.MediaRepository
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
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
        private val libraryRepository: LibraryRepository
    ) {
    companion object {
        const val NOTIFICATION_CHANNEL_ID = "cf_music_playback"
        const val NOTIFICATION_ID = 1001
        private const val DEFAULT_MIN_LISTEN_SECONDS = 30
        private const val DEFAULT_MIN_LISTEN_PERCENT = 35
    }

    private val _state = MutableStateFlow(AudioState())
    val state: StateFlow<AudioState> = _state.asStateFlow()

    private val queue: MutableList<MediaItem> = mutableListOf()
    private val scrobblerScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val historyLock = Any()
    private var currentHistoryCandidate: HistoryCandidate? = null

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
    }

    private fun ensureChannel() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        val nm = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val channel = NotificationChannel(
            NOTIFICATION_CHANNEL_ID,
            "Music Playback",
            NotificationManager.IMPORTANCE_LOW
        )
        nm.createNotificationChannel(channel)
    }

    fun loadSingle(uri: Uri, metadata: MediaMetadata? = null, playWhenReady: Boolean = true) {
        finalizeHistoryCandidate(exoPlayer.currentPosition)
        val item = (metadata?.let { MediaItem.Builder().setUri(uri).setMediaMetadata(it).build() }
            ?: MediaItem.fromUri(uri))
        queue.clear()
        queue.add(item)
        exoPlayer.setMediaItem(item)
        exoPlayer.prepare()
        exoPlayer.playWhenReady = playWhenReady
        MediaNotificationService.start(context)
        publishQueue()
        scheduleHistoryCandidate(exoPlayer.currentMediaItem)
    }

    fun setQueue(uris: List<Uri>, startIndex: Int = 0, playWhenReady: Boolean = true) {
        finalizeHistoryCandidate(exoPlayer.currentPosition)
        val items = uris.map { MediaItem.fromUri(it) }
        queue.clear(); queue.addAll(items)
        exoPlayer.setMediaItems(items, startIndex, C.TIME_UNSET)
        exoPlayer.prepare(); exoPlayer.playWhenReady = playWhenReady
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
        if (getCurrentPosition() > 3000) {
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

    fun setVolume(volume: Float) { exoPlayer.volume = volume.coerceIn(0f, 1f); updateState(volume = exoPlayer.volume) }

    private fun publishQueue() { _state.value = _state.value.copy(queue = queue.map { it.mediaMetadata.title?.toString() ?: it.localConfiguration?.uri?.lastPathSegment ?: "Track" }) }

    private fun updateState(
        isLoading: Boolean? = null,
        isPlaying: Boolean? = null,
        duration: Long? = null,
        title: String? = null,
        artist: String? = null,
        album: String? = null,
        isShuffleEnabled: Boolean? = null,
        repeatMode: RepeatMode? = null,
        volume: Float? = null
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
            volume = volume ?: s.volume
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
            setQueue(uris, 0, playWhenReady)
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
        val metadataDuration = mediaItem.mediaMetadata.extras?.getLong(MediaMetadata.METADATA_KEY_DURATION)
            ?: mediaItem.mediaMetadata.durationMs
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
    val queue: List<String> = emptyList()
)
