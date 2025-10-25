package com.universalmedialibrary.ui.music

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.music.Lyrics
import com.universalmedialibrary.services.music.LyricsService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for managing lyrics display and refresh
 */
@HiltViewModel
class LyricsViewModel @Inject constructor(
    private val lyricsService: LyricsService
) : ViewModel() {

    private val _lyrics = MutableStateFlow<Lyrics?>(null)
    val lyrics: StateFlow<Lyrics?> = _lyrics.asStateFlow()

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    private val _error = MutableStateFlow<String?>(null)
    val error: StateFlow<String?> = _error.asStateFlow()

    private val _fromCache = MutableStateFlow(false)
    val fromCache: StateFlow<Boolean> = _fromCache.asStateFlow()

    private var currentTrack: Track? = null

    init {
        viewModelScope.launch {
            lyricsService.initialize()
        }
    }

    /**
     * Load lyrics for a track
     */
    fun loadLyrics(track: Track) {
        currentTrack = track
        viewModelScope.launch {
            _isLoading.value = true
            _error.value = null
            
            try {
                val result = lyricsService.getLyrics(track, forceRefresh = false)
                if (result.success) {
                    _lyrics.value = result.lyrics
                    _fromCache.value = result.fromCache
                } else {
                    _error.value = result.error
                }
            } catch (e: Exception) {
                _error.value = "Error loading lyrics: ${e.message}"
            } finally {
                _isLoading.value = false
            }
        }
    }

    /**
     * Refresh lyrics from AI (bypass cache)
     */
    fun refreshLyrics() {
        val track = currentTrack ?: return
        
        viewModelScope.launch {
            _isLoading.value = true
            _error.value = null
            
            try {
                // Clear cache first
                lyricsService.clearCache(track.id)
                
                // Fetch fresh lyrics
                val result = lyricsService.getLyrics(track, forceRefresh = true)
                if (result.success) {
                    _lyrics.value = result.lyrics
                    _fromCache.value = false
                } else {
                    _error.value = result.error
                }
            } catch (e: Exception) {
                _error.value = "Error refreshing lyrics: ${e.message}"
            } finally {
                _isLoading.value = false
            }
        }
    }

    /**
     * Clear current lyrics
     */
    fun clearLyrics() {
        _lyrics.value = null
        _error.value = null
        _fromCache.value = false
    }
}
