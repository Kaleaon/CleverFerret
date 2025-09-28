package com.universalmedialibrary.widgets

import android.content.Context
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.glance.appwidget.GlanceAppWidgetManager
import androidx.glance.appwidget.state.updateAppWidgetState
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.services.media.UniversalMediaPlayerService
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.launch
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service to manage Media Playback Widget state synchronization
 * 
 * Connects the widget to the MediaPlayerService and updates widget state
 * when playback state changes.
 */
@Singleton
class MediaPlaybackWidgetService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaPlayerService: UniversalMediaPlayerService
) {
    
    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
    
    init {
        // Start observing media player state
        observeMediaPlayerState()
    }
    
    /**
     * Start observing media player state and update widget accordingly
     */
    private fun observeMediaPlayerState() {
        serviceScope.launch {
            combine(
                mediaPlayerService.currentMedia,
                mediaPlayerService.playbackState
            ) { currentMedia, playbackState ->
                updateWidgetState(currentMedia, playbackState.isPlaying)
            }.collect { }
        }
    }
    
    /**
     * Update all widget instances with current media state
     */
    private suspend fun updateWidgetState(currentMedia: MediaItem?, isPlaying: Boolean) {
        try {
            val glanceIds = GlanceAppWidgetManager(context)
                .getGlanceIds(MediaPlaybackWidget::class.java)
            
            if (glanceIds.isEmpty()) return
            
            val title = currentMedia?.let { 
                when (it.mediaType) {
                    "BOOK", "EBOOK" -> it.fileName.substringBeforeLast('.')
                    "MUSIC", "MUSIC_TRACK", "MUSIC_ALBUM" -> it.fileName.substringBeforeLast('.')
                    "MOVIE", "TV_SHOW" -> it.fileName.substringBeforeLast('.')
                    else -> it.fileName.substringBeforeLast('.')
                }
            } ?: "No Media Playing"
            
            val subtitle = currentMedia?.let {
                when (it.mediaType) {
                    "BOOK", "EBOOK" -> "Book"
                    "MUSIC", "MUSIC_TRACK", "MUSIC_ALBUM" -> "Music"
                    "MOVIE" -> "Movie"
                    "TV_SHOW" -> "TV Show"
                    else -> it.mediaType.lowercase().replaceFirstChar { c -> c.uppercase() }
                }
            } ?: ""
            
            val mediaType = currentMedia?.mediaType ?: ""
            
            glanceIds.forEach { glanceId ->
                updateAppWidgetState(context, glanceId) { prefs ->
                    prefs.toMutablePreferences().apply {
                        this[MediaPlaybackWidget.CURRENT_TITLE] = title
                        this[MediaPlaybackWidget.CURRENT_SUBTITLE] = subtitle
                        this[MediaPlaybackWidget.IS_PLAYING] = isPlaying
                        this[MediaPlaybackWidget.MEDIA_TYPE] = mediaType
                        this[MediaPlaybackWidget.ARTWORK_URI] = currentMedia?.thumbnailPath ?: ""
                    }
                }
                MediaPlaybackWidget.update(context, glanceId)
            }
        } catch (e: Exception) {
            // Log error but don't crash the app
            android.util.Log.e("MediaPlaybackWidgetService", "Error updating widget state", e)
        }
    }
    
    /**
     * Force update all widget instances
     */
    suspend fun forceUpdate() {
        val currentMedia = mediaPlayerService.currentMedia.value
        val isPlaying = mediaPlayerService.playbackState.value.isPlaying
        updateWidgetState(currentMedia, isPlaying)
    }
    
    /**
     * Handle play/pause toggle from widget
     */
    suspend fun togglePlayback() {
        val currentState = mediaPlayerService.playbackState.value
        if (currentState.isPlaying) {
            mediaPlayerService.pause()
        } else {
            mediaPlayerService.play()
        }
    }
    
    /**
     * Handle previous track/chapter from widget
     */
    suspend fun previous() {
        // This would implement previous functionality
        // For now, it's a placeholder for future implementation
    }
    
    /**
     * Handle next track/chapter from widget
     */
    suspend fun next() {
        // This would implement next functionality
        // For now, it's a placeholder for future implementation
    }
}