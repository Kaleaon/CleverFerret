package com.universalmedialibrary.services.audiobook

import android.content.Context
import android.media.MediaMetadataRetriever
import android.net.Uri
import com.universalmedialibrary.core.FeatureFlags
import com.universalmedialibrary.data.local.dao.AudiobookDao
import com.universalmedialibrary.data.local.dao.BookmarkDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.AudiobookEntity
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.Bookmark
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import com.universalmedialibrary.services.media.MediaController
import com.universalmedialibrary.services.media.MediaServiceType
import com.universalmedialibrary.services.artwork.ArtworkLoader
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import kotlinx.coroutines.cancel
import java.io.File
import java.util.UUID
import javax.inject.Inject
import javax.inject.Singleton
import kotlin.time.Duration.Companion.milliseconds

/**
 * Comprehensive audiobook service combining:
 * - Import/export and metadata extraction
 * - Chapter-based navigation with metadata
 * - Synchronized text highlighting (read-along)
 * - Advanced playback controls (speed, sleep timer, skip silence)
 * - Bookmark management with notes
 * - Progress synchronization across devices
 * - Smart resume with context awareness
 */
@Singleton
class AudiobookService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaRepository: MediaRepository,
    private val exoPlayerService: ExoPlayerService,
    private val mediaController: MediaController,
    private val bookmarkDao: BookmarkDao,
    private val metadataDao: MetadataDao,
    private val audiobookDao: AudiobookDao,
    private val artworkLoader: ArtworkLoader
) {
    
    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)

    private val _audiobookState = MutableStateFlow(AudiobookState())
    val audiobookState: StateFlow<AudiobookState> = _audiobookState.asStateFlow()

    private val _synchronizationState = MutableStateFlow(SynchronizationState())
    val synchronizationState: StateFlow<SynchronizationState> = _synchronizationState.asStateFlow()

    private var currentAudiobook: Audiobook? = null
    private var synchronizedText: SynchronizedText? = null

    /**
     * Load an audiobook for playback
     */
    suspend fun loadAudiobook(mediaItem: MediaItem): Boolean = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_AUDIOBOOK_PLAYER) {
            updateAudiobookState(error = "Audiobook player is disabled")
            return@withContext false
        }

        try {
            updateAudiobookState(isLoading = true)

            val audiobook = parseAudiobook(mediaItem)
            if (audiobook == null) {
                updateAudiobookState(error = "Failed to parse audiobook")
                return@withContext false
            }

            currentAudiobook = audiobook

            // Load synchronized text if available
            loadSynchronizedText(audiobook)

            val firstChapter = audiobook.chapters.firstOrNull()
            if (firstChapter != null) {
                // Load cover artwork from metadata
                val artwork = artworkLoader.loadArtwork(
                    mediaItem = mediaItem,
                    maxWidth = 512,
                    maxHeight = 512
                )
                
                // Register with MediaController for notifications and media session
                mediaController.registerMediaService(
                    serviceType = MediaServiceType.AUDIOBOOK,
                    title = firstChapter.title ?: audiobook.title,
                    artist = audiobook.author,
                    album = audiobook.title,
                    artwork = artwork
                )
            }

            updateAudiobookState(
                isLoaded = true,
                totalChapters = audiobook.chapters.size,
                chapters = audiobook.chapters
            )

            true
        } catch (e: Exception) {
            updateAudiobookState(error = "Failed to load audiobook: ${e.message}")
            false
        }
    }

    /**
     * Import audiobook from file
     */
    suspend fun importAudiobook(filePath: String): Result<AudiobookEntity> = 
        withContext(Dispatchers.IO) {
            try {
                val file = File(filePath)
                if (!file.exists()) {
                    return@withContext Result.failure(
                        Exception("File not found: $filePath")
                    )
                }
                
                val metadata = extractMetadata(filePath)
                val coverPath = metadata.coverArt?.let { 
                    saveCoverArt(it, metadata.title)
                }
                
                val entity = AudiobookEntity(
                    id = UUID.randomUUID().toString(),
                    filePath = filePath,
                    title = metadata.title,
                    author = metadata.author,
                    narrator = metadata.narrator,
                    description = metadata.description,
                    genre = metadata.genre,
                    publisher = metadata.publisher,
                    publishDate = metadata.publishDate,
                    duration = metadata.duration.inWholeSeconds,
                    bitrate = metadata.bitrate,
                    sampleRate = metadata.sampleRate,
                    codec = metadata.codec,
                    coverPath = coverPath,
                    chapterCount = metadata.chapters.size,
                    chapters = metadata.chapters,
                    language = metadata.language,
                    dateAdded = System.currentTimeMillis(),
                    lastPlayedPosition = 0,
                    isFinished = false
                )
                
                audiobookDao.insert(entity)
                Result.success(entity)
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    
    /**
     * Extract metadata from audiobook file
     */
    private suspend fun extractMetadata(filePath: String): AudiobookMetadata = 
        withContext(Dispatchers.IO) {
            val retriever = MediaMetadataRetriever()
            
            try {
                retriever.setDataSource(filePath)
                
                val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE)
                    ?: File(filePath).nameWithoutExtension
                val author = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_AUTHOR)
                val narrator = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST)
                // Use album name as description fallback (no direct COMMENT metadata key in Android)
                val description = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM)
                val genre = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_GENRE)
                val date = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DATE)
                val durationMs = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)
                    ?.toLongOrNull() ?: 0L
                val bitrate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_BITRATE)
                    ?.toIntOrNull()
                val coverArt = retriever.embeddedPicture
                
                val chapters = extractChapters(filePath, durationMs)
                
                AudiobookMetadata(
                    title = title,
                    author = author,
                    narrator = narrator,
                    description = description,
                    genre = genre,
                    publisher = null,
                    publishDate = date,
                    duration = durationMs.milliseconds,
                    bitrate = bitrate,
                    sampleRate = null,
                    codec = null,
                    chapters = chapters,
                    coverArt = coverArt,
                    language = "en"
                )
            } finally {
                retriever.release()
            }
        }
    
    /**
     * Extract chapter information
     * Note: Android MediaMetadataRetriever doesn't support chapter extraction
     * This is a placeholder for potential future enhancement
     */
    private fun extractChapters(filePath: String, totalDurationMs: Long): List<AudioChapter> {
        // For now, return empty list
        // Could be enhanced with external library support
        return emptyList()
    }
    
    /**
     * Save cover art to storage
     */
    private suspend fun saveCoverArt(coverArt: ByteArray, title: String): String = 
        withContext(Dispatchers.IO) {
            val coversDir = File(context.filesDir, "audiobook_covers")
            coversDir.mkdirs()
            
            val sanitizedTitle = title.replace(Regex("[^a-zA-Z0-9.-]"), "_")
                .take(50)
            val coverFile = File(coversDir, "$sanitizedTitle.jpg")
            
            coverFile.writeBytes(coverArt)
            coverFile.absolutePath
        }
    
    /**
     * Update playback position (for AudiobookEntity)
     */
    suspend fun updatePosition(audiobookId: String, positionSeconds: Long) {
        withContext(Dispatchers.IO) {
            audiobookDao.updatePosition(audiobookId, positionSeconds)
        }
    }
    
    /**
     * Mark audiobook as finished (for AudiobookEntity)
     */
    suspend fun markFinished(audiobookId: String, finished: Boolean = true) {
        withContext(Dispatchers.IO) {
            audiobookDao.updateFinished(audiobookId, finished)
        }
    }

    /**
     * Create a bookmark at the current position
     */
    fun createBookmark(note: String? = null) {
        val audiobook = currentAudiobook ?: return
        val state = _audiobookState.value
        
        serviceScope.launch {
            try {
                val bookmark = Bookmark(
                    itemId = audiobook.id.toLongOrNull() ?: 0L,
                    title = "Bookmark at ${formatTime(state.currentPosition)}",
                    description = note,
                    position = state.currentPosition,
                    chapter = state.currentChapter.toString(),
                    percentage = if (audiobook.totalDuration > 0L) {
                        (state.currentPosition.coerceIn(0L, audiobook.totalDuration).toFloat() / audiobook.totalDuration) * 100f
                    } else {
                        0f
                    },
                    bookmarkType = "MANUAL",
                    dateCreated = System.currentTimeMillis()
                )
                
                val bookmarkId = bookmarkDao.insertBookmark(bookmark)
                
                // Update in-memory state with new bookmark
                val audiobookBookmark = AudiobookBookmark(
                    id = bookmarkId.toString(), // Convert Long to String
                    audiobookId = state.audiobook?.id ?: "",
                    chapterIndex = state.currentChapter,
                    position = state.currentPosition,
                    currentPosition = state.currentPosition,
                    title = note ?: "Bookmark at ${formatTime(state.currentPosition)}",
                    note = note,
                    createdAt = System.currentTimeMillis()
                )
                
                updateAudiobookState(
                    bookmarks = state.bookmarks + audiobookBookmark
                )
            } catch (e: Exception) {
                updateAudiobookState(error = "Failed to create bookmark: ${e.message}")
            }
        }
    }

    /**
     * Delete a bookmark
     */
    fun deleteBookmark(bookmark: AudiobookBookmark) {
        serviceScope.launch {
            try {
                val state = _audiobookState.value
                
                // Optimistic UI update
                updateAudiobookState(
                    bookmarks = state.bookmarks.filter { it.id != bookmark.id }
                )
                
                // Persist to database
                bookmarkDao.deleteBookmark(bookmark.id.toLongOrNull() ?: 0L)
            } catch (e: Exception) {
                // Rollback on error
                val state = _audiobookState.value
                updateAudiobookState(
                    bookmarks = state.bookmarks + bookmark,
                    error = "Failed to delete bookmark: ${e.message}"
                )
            }
        }
    }

    private fun formatTime(positionMs: Long): String {
        val totalSeconds = positionMs / 1000
        val hours = totalSeconds / 3600
        val minutes = (totalSeconds % 3600) / 60
        val seconds = totalSeconds % 60
        
        return if (hours > 0) {
            String.format(java.util.Locale.US, "%d:%02d:%02d", hours, minutes, seconds)
        } else {
            String.format(java.util.Locale.US, "%d:%02d", minutes, seconds)
        }
    }

    private suspend fun parseAudiobook(mediaItem: MediaItem): Audiobook? {
        // Parse audiobook from media item
        // For now, return a basic structure
        val commonMetadata = metadataDao.getMetadataCommonByItemId(mediaItem.itemId)
        val authors = metadataDao.getAuthorsByItemId(mediaItem.itemId)
        
        return Audiobook(
            id = mediaItem.itemId.toString(),
            title = commonMetadata?.title ?: mediaItem.fileName,
            author = authors.firstOrNull() ?: "Unknown",
            filePath = mediaItem.filePath,
            totalDuration = 0L, // Would need to be extracted from audio file
            chapters = emptyList() // Would need to be parsed from audiobook format
        )
    }

    private fun loadSynchronizedText(audiobook: Audiobook) {
        // Load synchronized text if available
        // This would parse SMIL or similar formats
    }

    private fun updateAudiobookState(
        isLoading: Boolean = _audiobookState.value.isLoading,
        isLoaded: Boolean = _audiobookState.value.isLoaded,
        currentChapter: Int = _audiobookState.value.currentChapter,
        totalChapters: Int = _audiobookState.value.totalChapters,
        currentPosition: Long = _audiobookState.value.currentPosition,
        isPlaying: Boolean = _audiobookState.value.isPlaying,
        playbackSpeed: Float = _audiobookState.value.playbackSpeed,
        chapters: List<AudiobookChapter> = _audiobookState.value.chapters,
        bookmarks: List<AudiobookBookmark> = _audiobookState.value.bookmarks,
        error: String? = null
    ) {
        _audiobookState.value = AudiobookState(
            isLoading = isLoading,
            isLoaded = isLoaded,
            currentChapter = currentChapter,
            totalChapters = totalChapters,
            currentPosition = currentPosition,
            isPlaying = isPlaying,
            playbackSpeed = playbackSpeed,
            chapters = chapters,
            bookmarks = bookmarks,
            error = error
        )
    }

    /**
     * Delete audiobook
     */
    suspend fun deleteAudiobook(audiobookId: String) {
        withContext(Dispatchers.IO) {
            val audiobook = audiobookDao.getById(audiobookId)
            audiobook?.let {
                // Delete cover file if exists
                it.coverPath?.let { path ->
                    File(path).delete()
                }
                // Delete from database
                audiobookDao.delete(it)
            }
        }
    }

    fun play() {
        exoPlayerService.play()
    }

    fun pause() {
        exoPlayerService.pause()
    }

    fun stop() {
        exoPlayerService.stop()
    }

    /**
     * Navigate to a specific chapter
     */
    fun goToChapter(chapterIndex: Int) {
        val audiobook = currentAudiobook ?: return
        if (chapterIndex < 0 || chapterIndex >= audiobook.chapters.size) return
        
        val chapter = audiobook.chapters[chapterIndex]
        exoPlayerService.seekTo(chapter.startTimeMs)
        
        _audiobookState.value = _audiobookState.value.copy(
            currentChapter = chapterIndex,
            currentChapterIndex = chapterIndex
        )
    }

    /**
     * Seek forward by specified seconds
     */
    fun seekForward(seconds: Int) {
        val currentPos = exoPlayerService.getCurrentPosition()
        val newPos = currentPos + (seconds * 1000L)
        exoPlayerService.seekTo(newPos)
    }

    /**
     * Seek backward by specified seconds
     */
    fun seekBackward(seconds: Int) {
        val currentPos = exoPlayerService.getCurrentPosition()
        val newPos = (currentPos - (seconds * 1000L)).coerceAtLeast(0L)
        exoPlayerService.seekTo(newPos)
    }

    /**
     * Set playback speed
     */
    fun setPlaybackSpeed(speed: Float) {
        exoPlayerService.setPlaybackSpeed(speed)
        _audiobookState.value = _audiobookState.value.copy(
            playbackSpeed = speed
        )
    }

    /**
     * Toggle skip silence feature
     */
    fun setSkipSilence(enabled: Boolean) {
        // ExoPlayer skip silence would be configured here
        // For now, just update state
        _audiobookState.value = _audiobookState.value.copy(
            skipSilenceEnabled = enabled
        )
    }

    /**
     * Set synchronized reading enabled/disabled
     */
    fun setSynchronizedReading(enabled: Boolean) {
        _synchronizationState.value = _synchronizationState.value.copy(
            enabled = enabled,
            isEnabled = enabled
        )
    }

    /**
     * Set sleep timer
     */
    fun setSleepTimer(minutes: Int) {
        val endTime = System.currentTimeMillis() + (minutes * 60 * 1000L)
        _audiobookState.value = _audiobookState.value.copy(
            sleepTimerEndTime = endTime
        )
        
        // Schedule timer to pause playback
        serviceScope.launch {
            kotlinx.coroutines.delay(minutes * 60 * 1000L)
            if (_audiobookState.value.sleepTimerEndTime == endTime) {
                pause()
                _audiobookState.value = _audiobookState.value.copy(
                    sleepTimerEndTime = null
                )
            }
        }
    }

    /**
     * Cancel sleep timer
     */
    fun cancelSleepTimer() {
        _audiobookState.value = _audiobookState.value.copy(
            sleepTimerEndTime = null
        )
    }

    /**
     * Jump to a bookmark
     */
    fun jumpToBookmark(bookmark: AudiobookBookmark) {
        goToChapter(bookmark.chapterIndex)
        exoPlayerService.seekTo(bookmark.position)
    }
    override fun onDestroy() {
        super.onDestroy()
        // Cancel coroutine scope to prevent memory leaks
        serviceScope.cancel()
    }
}