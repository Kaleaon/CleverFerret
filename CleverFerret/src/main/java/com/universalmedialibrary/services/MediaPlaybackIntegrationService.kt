package com.universalmedialibrary.services

import android.content.Context
import android.net.Uri
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.model.MediaItem
import com.universalmedialibrary.services.media.UniversalMediaPlayerService
import com.universalmedialibrary.services.reader.UniversalReaderService
import com.universalmedialibrary.services.epub.EPUBReaderService
import com.universalmedialibrary.services.video.ComprehensiveVideoService
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Media Playback Integration Service
 * 
 * Central coordination service that ensures all media playback components work together:
 * - Routes media to appropriate players/readers
 * - Manages playback state across different media types
 * - Handles format detection and fallback strategies
 * - Tracks user progress and bookmarks
 * - Provides unified interface for all media consumption
 * 
 * This service acts as the orchestrator for the entire media playback ecosystem.
 */
@Singleton
class MediaPlaybackIntegrationService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaPlayerService: UniversalMediaPlayerService,
    private val readerService: UniversalReaderService,
    private val epubReaderService: EPUBReaderService,
    private val videoService: ComprehensiveVideoService,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) {
    
    private val _integrationState = MutableStateFlow(MediaIntegrationState())
    val integrationState: StateFlow<MediaIntegrationState> = _integrationState.asStateFlow()
    
    /**
     * Launch media item with automatic format detection and appropriate player selection
     */
    suspend fun launchMedia(mediaItem: MediaItem): MediaLaunchResult {
        try {
            _integrationState.value = _integrationState.value.copy(
                isInitializing = true,
                currentMediaItem = mediaItem,
                error = null
            )
            
            val uri = Uri.parse(mediaItem.filePath)
            val mediaType = detectMediaType(mediaItem)
            
            val result = when (mediaType) {
                MediaType.BOOK -> launchBook(uri, mediaItem)
                MediaType.AUDIOBOOK -> launchAudiobook(uri, mediaItem)
                MediaType.MOVIE, MediaType.TV_SHOW -> launchVideo(uri, mediaItem)
                MediaType.MUSIC, MediaType.PODCAST -> launchAudio(uri, mediaItem)
                MediaType.COMIC -> launchComic(uri, mediaItem)
                MediaType.DOCUMENT, MediaType.ACADEMIC_PAPER, MediaType.MAGAZINE -> launchDocument(uri, mediaItem)
                MediaType.WEB_FICTION -> launchWebFiction(uri, mediaItem)
                MediaType.UNKNOWN -> launchUnknownFormat(uri, mediaItem)
            }
            
            if (result.success) {
                // Update last accessed timestamp
                updateMediaAccess(mediaItem)
                
                _integrationState.value = _integrationState.value.copy(
                    isInitializing = false,
                    activePlayer = result.playerType,
                    playbackState = PlaybackState.READY
                )
            } else {
                _integrationState.value = _integrationState.value.copy(
                    isInitializing = false,
                    error = result.error,
                    playbackState = PlaybackState.ERROR
                )
            }
            
            return result
            
        } catch (e: Exception) {
            val errorResult = MediaLaunchResult(
                success = false,
                playerType = PlayerType.NONE,
                error = "Failed to launch media: ${e.message}"
            )
            
            _integrationState.value = _integrationState.value.copy(
                isInitializing = false,
                error = errorResult.error,
                playbackState = PlaybackState.ERROR
            )
            
            return errorResult
        }
    }
    
    /**
     * Launch book with appropriate reader
     */
    private suspend fun launchBook(uri: Uri, mediaItem: MediaItem): MediaLaunchResult {
        val extension = getFileExtension(mediaItem.fileName)?.lowercase()
        
        return when (extension) {
            "epub" -> {
                val success = epubReaderService.loadEPUB(uri)
                MediaLaunchResult(
                    success = success,
                    playerType = PlayerType.EPUB_READER,
                    error = if (!success) "Failed to load EPUB" else null
                )
            }
            "pdf" -> {
                val success = readerService.loadDocument(uri, MediaType.BOOK)
                MediaLaunchResult(
                    success = success,
                    playerType = PlayerType.PDF_READER,
                    error = if (!success) "Failed to load PDF" else null
                )
            }
            "txt", "html", "htm" -> {
                val success = readerService.loadDocument(uri, MediaType.BOOK)
                MediaLaunchResult(
                    success = success,
                    playerType = PlayerType.TEXT_READER,
                    error = if (!success) "Failed to load text document" else null
                )
            }
            else -> {
                // Try universal reader as fallback
                val success = readerService.loadDocument(uri, MediaType.BOOK)
                MediaLaunchResult(
                    success = success,
                    playerType = PlayerType.UNIVERSAL_READER,
                    error = if (!success) "Unsupported book format" else null
                )
            }
        }
    }
    
    /**
     * Launch audiobook with audio player
     */
    private suspend fun launchAudiobook(uri: Uri, mediaItem: MediaItem): MediaLaunchResult {
        return try {
            mediaPlayerService.playMedia(uri, MediaType.AUDIOBOOK)
            MediaLaunchResult(
                success = true,
                playerType = PlayerType.AUDIO_PLAYER,
                error = null
            )
        } catch (e: Exception) {
            MediaLaunchResult(
                success = false,
                playerType = PlayerType.NONE,
                error = "Failed to play audiobook: ${e.message}"
            )
        }
    }
    
    /**
     * Launch video with video player
     */
    private suspend fun launchVideo(uri: Uri, mediaItem: MediaItem): MediaLaunchResult {
        return try {
            // Get recommended video player
            val recommendedPlayer = videoService.getRecommendedPlayer(uri)
            
            mediaPlayerService.playMedia(uri, MediaType.MOVIE)
            
            MediaLaunchResult(
                success = true,
                playerType = when (recommendedPlayer) {
                    com.universalmedialibrary.services.video.VideoPlayerType.EXOPLAYER -> PlayerType.EXOPLAYER
                    com.universalmedialibrary.services.video.VideoPlayerType.VLC -> PlayerType.VLC_PLAYER
                    com.universalmedialibrary.services.video.VideoPlayerType.SYSTEM_PLAYER -> PlayerType.SYSTEM_PLAYER
                },
                error = null
            )
        } catch (e: Exception) {
            MediaLaunchResult(
                success = false,
                playerType = PlayerType.NONE,
                error = "Failed to play video: ${e.message}"
            )
        }
    }
    
    /**
     * Launch audio with audio player
     */
    private suspend fun launchAudio(uri: Uri, mediaItem: MediaItem): MediaLaunchResult {
        return try {
            mediaPlayerService.playMedia(uri, MediaType.MUSIC)
            MediaLaunchResult(
                success = true,
                playerType = PlayerType.AUDIO_PLAYER,
                error = null
            )
        } catch (e: Exception) {
            MediaLaunchResult(
                success = false,
                playerType = PlayerType.NONE,
                error = "Failed to play audio: ${e.message}"
            )
        }
    }
    
    /**
     * Launch comic with comic reader
     */
    private suspend fun launchComic(uri: Uri, mediaItem: MediaItem): MediaLaunchResult {
        return try {
            val success = readerService.loadDocument(uri, MediaType.COMIC)
            MediaLaunchResult(
                success = success,
                playerType = PlayerType.COMIC_READER,
                error = if (!success) "Failed to load comic" else null
            )
        } catch (e: Exception) {
            MediaLaunchResult(
                success = false,
                playerType = PlayerType.NONE,
                error = "Failed to load comic: ${e.message}"
            )
        }
    }
    
    /**
     * Launch document with document reader
     */
    private suspend fun launchDocument(uri: Uri, mediaItem: MediaItem): MediaLaunchResult {
        return try {
            val success = readerService.loadDocument(uri, mediaItem.mediaType)
            MediaLaunchResult(
                success = success,
                playerType = PlayerType.DOCUMENT_READER,
                error = if (!success) "Failed to load document" else null
            )
        } catch (e: Exception) {
            MediaLaunchResult(
                success = false,
                playerType = PlayerType.NONE,
                error = "Failed to load document: ${e.message}"
            )
        }
    }
    
    /**
     * Launch web fiction with text reader
     */
    private suspend fun launchWebFiction(uri: Uri, mediaItem: MediaItem): MediaLaunchResult {
        return try {
            val success = readerService.loadDocument(uri, MediaType.WEB_FICTION)
            MediaLaunchResult(
                success = success,
                playerType = PlayerType.TEXT_READER,
                error = if (!success) "Failed to load web fiction" else null
            )
        } catch (e: Exception) {
            MediaLaunchResult(
                success = false,
                playerType = PlayerType.NONE,
                error = "Failed to load web fiction: ${e.message}"
            )
        }
    }
    
    /**
     * Launch unknown format with format detection
     */
    private suspend fun launchUnknownFormat(uri: Uri, mediaItem: MediaItem): MediaLaunchResult {
        val extension = getFileExtension(mediaItem.fileName)?.lowercase()
        
        return when {
            // Video formats
            extension in videoFormats -> launchVideo(uri, mediaItem.copy(mediaType = MediaType.MOVIE))
            
            // Audio formats
            extension in audioFormats -> launchAudio(uri, mediaItem.copy(mediaType = MediaType.MUSIC))
            
            // Text formats
            extension in textFormats -> launchDocument(uri, mediaItem.copy(mediaType = MediaType.DOCUMENT))
            
            // Comic formats
            extension in comicFormats -> launchComic(uri, mediaItem.copy(mediaType = MediaType.COMIC))
            
            // Try as document fallback
            else -> launchDocument(uri, mediaItem.copy(mediaType = MediaType.DOCUMENT))
        }
    }
    
    /**
     * Detect media type based on file and metadata
     */
    private fun detectMediaType(mediaItem: MediaItem): MediaType {
        if (mediaItem.mediaType != MediaType.UNKNOWN) {
            return mediaItem.mediaType
        }
        
        val extension = getFileExtension(mediaItem.fileName)?.lowercase()
        
        return when {
            extension in videoFormats -> MediaType.MOVIE
            extension in audioFormats -> MediaType.MUSIC
            extension in ebookFormats -> MediaType.BOOK
            extension in comicFormats -> MediaType.COMIC
            extension in documentFormats -> MediaType.DOCUMENT
            else -> MediaType.UNKNOWN
        }
    }
    
    /**
     * Update media access tracking
     */
    private suspend fun updateMediaAccess(mediaItem: MediaItem) {
        try {
            val updatedItem = mediaItem.copy(
                lastAccessed = java.util.Date(),
                playCount = mediaItem.playCount + 1
            )
            mediaItemDao.updateMediaItem(updatedItem)
        } catch (e: Exception) {
            // Log error but don't fail the operation
        }
    }
    
    /**
     * Get current playback progress
     */
    fun getCurrentProgress(): PlaybackProgress? {
        val state = _integrationState.value
        val mediaItem = state.currentMediaItem ?: return null
        
        return when (state.activePlayer) {
            PlayerType.AUDIO_PLAYER, PlayerType.EXOPLAYER, PlayerType.VLC_PLAYER -> {
                val playerState = mediaPlayerService.playerState.value
                PlaybackProgress(
                    mediaItem = mediaItem,
                    currentPosition = playerState.currentPosition,
                    duration = playerState.duration,
                    progress = playerState.progress
                )
            }
            PlayerType.EPUB_READER -> {
                val readerState = epubReaderService.readerState.value
                PlaybackProgress(
                    mediaItem = mediaItem,
                    currentPosition = readerState.currentChapter.toLong(),
                    duration = readerState.totalChapters.toLong(),
                    progress = if (readerState.totalChapters > 0) 
                        (readerState.currentChapter + 1f) / readerState.totalChapters else 0f
                )
            }
            PlayerType.UNIVERSAL_READER, PlayerType.PDF_READER, PlayerType.TEXT_READER, 
            PlayerType.DOCUMENT_READER, PlayerType.COMIC_READER -> {
                val readerState = readerService.readerState.value
                PlaybackProgress(
                    mediaItem = mediaItem,
                    currentPosition = readerState.currentPage.toLong(),
                    duration = readerState.totalPages.toLong(),
                    progress = if (readerState.totalPages > 0) 
                        (readerState.currentPage + 1f) / readerState.totalPages else 0f
                )
            }
            else -> null
        }
    }
    
    /**
     * Pause/resume current media
     */
    fun pauseResumeMedia() {
        val state = _integrationState.value
        when (state.activePlayer) {
            PlayerType.AUDIO_PLAYER, PlayerType.EXOPLAYER, PlayerType.VLC_PLAYER -> {
                mediaPlayerService.togglePlayPause()
            }
            // Text-based media doesn't have play/pause
            else -> { /* No action for text-based media */ }
        }
    }
    
    /**
     * Stop current media and cleanup
     */
    fun stopMedia() {
        val state = _integrationState.value
        when (state.activePlayer) {
            PlayerType.AUDIO_PLAYER, PlayerType.EXOPLAYER, PlayerType.VLC_PLAYER -> {
                mediaPlayerService.pause()
            }
            PlayerType.EPUB_READER -> {
                epubReaderService.clearBook()
            }
            PlayerType.UNIVERSAL_READER, PlayerType.PDF_READER, PlayerType.TEXT_READER,
            PlayerType.DOCUMENT_READER, PlayerType.COMIC_READER -> {
                readerService.release()
            }
            else -> { /* No cleanup needed */ }
        }
        
        _integrationState.value = _integrationState.value.copy(
            currentMediaItem = null,
            activePlayer = PlayerType.NONE,
            playbackState = PlaybackState.STOPPED
        )
    }
    
    /**
     * Release all resources
     */
    fun releaseAll() {
        mediaPlayerService.release()
        readerService.release()
        epubReaderService.clearBook()
        
        _integrationState.value = MediaIntegrationState()
    }
    
    /**
     * Utility methods
     */
    private fun getFileExtension(filename: String): String? {
        return filename.substringAfterLast('.', "").takeIf { it.isNotEmpty() }
    }
    
    companion object {
        private val videoFormats = setOf(
            "mp4", "mkv", "avi", "mov", "wmv", "flv", "webm", "m4v", "3gp",
            "mts", "m2ts", "ts", "vob", "ogv", "rmvb", "rm", "asf", "divx", "xvid"
        )
        
        private val audioFormats = setOf(
            "mp3", "flac", "wav", "ogg", "m4a", "aac", "wma", "opus", "ape", "ac3", "dts"
        )
        
        private val ebookFormats = setOf(
            "epub", "mobi", "azw", "azw3", "fb2", "lit", "pdb", "prc"
        )
        
        private val comicFormats = setOf(
            "cbz", "cbr", "cb7", "cbt", "cba"
        )
        
        private val documentFormats = setOf(
            "pdf", "txt", "rtf", "doc", "docx", "odt", "html", "htm", "md"
        )
        
        private val textFormats = setOf(
            "txt", "rtf", "html", "htm", "md", "xml", "json"
        )
    }
}

/**
 * Data classes for integration service
 */
data class MediaIntegrationState(
    val isInitializing: Boolean = false,
    val currentMediaItem: MediaItem? = null,
    val activePlayer: PlayerType = PlayerType.NONE,
    val playbackState: PlaybackState = PlaybackState.STOPPED,
    val error: String? = null
)

data class MediaLaunchResult(
    val success: Boolean,
    val playerType: PlayerType,
    val error: String?
)

data class PlaybackProgress(
    val mediaItem: MediaItem,
    val currentPosition: Long,
    val duration: Long,
    val progress: Float
)

enum class PlayerType {
    NONE,
    AUDIO_PLAYER,
    EXOPLAYER,
    VLC_PLAYER,
    SYSTEM_PLAYER,
    EPUB_READER,
    PDF_READER,
    TEXT_READER,
    UNIVERSAL_READER,
    DOCUMENT_READER,
    COMIC_READER
}

enum class PlaybackState {
    STOPPED,
    READY,
    PLAYING,
    PAUSED,
    BUFFERING,
    ERROR
}