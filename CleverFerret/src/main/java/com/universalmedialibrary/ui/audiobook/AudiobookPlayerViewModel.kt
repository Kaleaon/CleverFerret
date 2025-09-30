package com.universalmedialibrary.ui.audiobook

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.services.audiobook.AudiobookBookmark
import com.universalmedialibrary.services.audiobook.AudiobookService
import com.universalmedialibrary.services.audiobook.AudiobookState
import com.universalmedialibrary.services.audiobook.HighlightedText
import com.universalmedialibrary.services.audiobook.SynchronizationState
import com.universalmedialibrary.services.audiobook.SynchronizedReadingService
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for the audiobook player screen
 *
 * Manages:
 * - Audiobook playback state and controls
 * - Synchronized reading functionality
 * - Chapter navigation and bookmarks
 * - Advanced playback features (speed, sleep timer, etc.)
 */
@HiltViewModel
class AudiobookPlayerViewModel @Inject constructor(
    private val audiobookService: AudiobookService,
    private val synchronizedReadingService: SynchronizedReadingService,
    private val exoPlayerService: ExoPlayerService,
    private val mediaRepository: MediaRepository
) : ViewModel() {

    // Audiobook state
    val audiobookState: StateFlow<AudiobookState> = audiobookService.audiobookState

    // Synchronization state
    val synchronizationState: StateFlow<SynchronizationState> = audiobookService.synchronizationState

    // Current highlighted text for read-along
    private val _highlightedText = MutableStateFlow<HighlightedText?>(null)
    val highlightedText: StateFlow<HighlightedText?> = _highlightedText.asStateFlow()

    // Playback state from ExoPlayer
    val isPlaying: StateFlow<Boolean> = exoPlayerService.playerState.map { it.isPlaying }.stateIn(
        scope = viewModelScope,
        started = SharingStarted.WhileSubscribed(5000),
        initialValue = false
    )

    private var currentAudiobookId: Long? = null
    private var matchingEbookId: Long? = null

    init {
        // Monitor playback position for synchronized reading
        viewModelScope.launch {
            combine(
                exoPlayerService.playerState.map { it.currentPosition },
                audiobookState,
                synchronizationState
            ) { position: Long, audioState: AudiobookState, syncState: SynchronizationState ->
                if (syncState.enabled && audioState.isLoaded) {
                    updateHighlightedText(position, audioState.currentChapterIndex)
                }
            }.collect { }
        }
    }

    /**
     * Load an audiobook for playback
     */
    fun loadAudiobook(audiobookId: Long) {
        viewModelScope.launch {
            try {
                currentAudiobookId = audiobookId

                // Get the audiobook media item
                val mediaItem = mediaRepository.getMediaItemById(audiobookId)
                if (mediaItem != null) {
                    val success = audiobookService.loadAudiobook(mediaItem)

                    if (success) {
                        // Try to find matching e-book for synchronized reading
                        findMatchingEbook(mediaItem.fileName, null)
                    }
                }
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    /**
     * Toggle synchronized reading on/off
     */
    fun toggleSynchronizedReading() {
        val currentState = synchronizationState.value
        audiobookService.setSynchronizedReading(!currentState.enabled)

        // If enabling and we have a matching e-book, create synchronization
        if (!currentState.enabled && matchingEbookId != null) {
            createSynchronization()
        }
    }

    /**
     * Navigate to a specific chapter
     */
    fun goToChapter(chapterIndex: Int) {
        viewModelScope.launch {
            audiobookService.goToChapter(chapterIndex)
        }
    }

    /**
     * Go to next chapter
     */
    fun nextChapter() {
        val currentIndex = audiobookState.value.currentChapterIndex
        val totalChapters = audiobookState.value.chapters.size

        if (currentIndex < totalChapters - 1) {
            goToChapter(currentIndex + 1)
        }
    }

    /**
     * Go to previous chapter
     */
    fun previousChapter() {
        val currentIndex = audiobookState.value.currentChapterIndex

        if (currentIndex > 0) {
            goToChapter(currentIndex - 1)
        }
    }

    /**
     * Toggle playback (play/pause)
     */
    fun togglePlayback() {
        if (isPlaying.value) {
            audiobookService.pause()
        } else {
            audiobookService.play()
        }
    }

    /**
     * Seek to a specific position
     */
    fun seekTo(positionMs: Long) {
        exoPlayerService.seekTo(positionMs)
    }

    /**
     * Skip forward (default 30 seconds)
     */
    fun seekForward(seconds: Int = 30) {
        audiobookService.seekForward(seconds)
    }

    /**
     * Skip backward (default 30 seconds)
     */
    fun seekBackward(seconds: Int = 30) {
        audiobookService.seekBackward(seconds)
    }

    /**
     * Set playback speed
     */
    fun setPlaybackSpeed(speed: Float) {
        audiobookService.setPlaybackSpeed(speed)
    }

    /**
     * Toggle skip silence feature
     */
    fun toggleSkipSilence() {
        val currentState = audiobookState.value.skipSilenceEnabled
        audiobookService.setSkipSilence(!currentState)
    }

    /**
     * Set sleep timer
     */
    fun setSleepTimer(minutes: Int) {
        audiobookService.setSleepTimer(minutes)
    }

    /**
     * Cancel sleep timer
     */
    fun cancelSleepTimer() {
        audiobookService.cancelSleepTimer()
    }

    /**
     * Create a bookmark at the current position
     */
    fun createBookmark(title: String, notes: String? = null) {
        viewModelScope.launch {
            audiobookService.createBookmark(notes)
        }
    }

    /**
     * Jump to a bookmark
     */
    fun jumpToBookmark(bookmark: AudiobookBookmark) {
        viewModelScope.launch {
            audiobookService.jumpToBookmark(bookmark)
        }
    }

    /**
     * Calibrate synchronization timing
     */
    fun calibrateSynchronization(textPosition: Int) {
        viewModelScope.launch {
            val currentPosition = exoPlayerService.getCurrentPosition()
            val currentChapter = audiobookState.value.currentChapterIndex

            synchronizedReadingService.calibrateSynchronization(
                audioPositionMs = currentPosition,
                textPosition = textPosition,
                chapterIndex = currentChapter
            )
        }
    }

    // Private helper methods

    private suspend fun findMatchingEbook(title: String, author: String?) {
        try {
            // Search for matching e-book in the library
            val allMedia = mediaRepository.searchMediaItems("epub", limit = 100)

            val matchingEbook = allMedia.find { media: MediaItem ->
                media.fileExtension.lowercase() == "epub" &&
                media.fileName.contains(title, ignoreCase = true)
            }

            matchingEbookId = matchingEbook?.itemId
        } catch (e: Exception) {
            // Handle error silently
        }
    }

    private fun createSynchronization() {
        viewModelScope.launch {
            val audiobookId = currentAudiobookId
            val ebookId = matchingEbookId

            if (audiobookId != null && ebookId != null) {
                try {
                    val audiobookItem = mediaRepository.getMediaItemById(audiobookId)
                    val ebookItem = mediaRepository.getMediaItemById(ebookId)

                    if (audiobookItem != null && ebookItem != null) {
                        synchronizedReadingService.createSynchronization(
                            audiobookItem = audiobookItem,
                            ebookItem = ebookItem
                        )
                    }
                } catch (e: Exception) {
                    // Handle error
                }
            }
        }
    }

    private fun updateHighlightedText(positionMs: Long, chapterIndex: Int) {
        val highlightedText = synchronizedReadingService.getHighlightedText(
            audioPositionMs = positionMs,
            chapterIndex = chapterIndex
        )

        _highlightedText.value = highlightedText
    }

    override fun onCleared() {
        super.onCleared()
        // Clean up resources
        audiobookService.stop()
    }
}
