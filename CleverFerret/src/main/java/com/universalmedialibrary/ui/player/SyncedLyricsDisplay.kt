package com.universalmedialibrary.ui.player

import android.net.Uri
import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.MusicNote
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.music.LyricsService
import com.universalmedialibrary.services.music.TrackInfo
import com.universalmedialibrary.ui.music.Track
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import java.io.File
import javax.inject.Inject

/**
 * Synced Lyrics Display Component
 * 
 * Displays time-synced lyrics with karaoke-style highlighting
 * Features:
 * - Auto-scrolling to current line
 * - Highlight current lyric
 * - Smooth animations
 * - Fallback to plain text lyrics
 * - Empty state handling
 */
@Composable
fun SyncedLyricsDisplay(
    track: TrackInfo?,
    currentPositionMs: Long,
    modifier: Modifier = Modifier,
    viewModel: SyncedLyricsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val listState = rememberLazyListState()
    
    LaunchedEffect(track?.id) {
        if (track != null) {
            viewModel.loadLyrics(track)
        } else {
            viewModel.clearLyrics()
        }
    }
    
    LaunchedEffect(currentPositionMs, uiState.lyrics, uiState.isSynced) {
        val lyrics = uiState.lyrics
        if (uiState.isSynced && !lyrics.isNullOrEmpty()) {
            // Find current lyric index based on position
            val currentIndex = lyrics.indexOfLast {
                it.timestampMs <= currentPositionMs
            }.coerceAtLeast(0)
            
            // Auto-scroll to current line (keep it centered)
            if (currentIndex >= 0) {
                listState.animateScrollToItem(
                    index = currentIndex,
                    scrollOffset = -200 // Offset to center the line
                )
            }
        }
    }
    
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(MaterialTheme.colorScheme.surface)
    ) {
        when {
            uiState.isLoading -> {
                // Loading state
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    Column(
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.spacedBy(16.dp)
                    ) {
                        CircularProgressIndicator()
                        Text(
                            "Loading lyrics...",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
            
            uiState.error != null -> {
                // Error state
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    Column(
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.spacedBy(8.dp),
                        modifier = Modifier.padding(32.dp)
                    ) {
                        Icon(
                            Icons.Filled.MusicNote,
                            contentDescription = "Media image",
                            modifier = Modifier.size(48.dp),
                            tint = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Text(
                            "Lyrics Not Available",
                            style = MaterialTheme.typography.titleMedium
                        )
                        Text(
                            uiState.error!!,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            textAlign = TextAlign.Center
                        )
                    }
                }
            }

            uiState.lyrics.isNullOrEmpty() -> {
                // Empty state
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    Column(
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.spacedBy(8.dp),
                        modifier = Modifier.padding(32.dp)
                    ) {
                        Icon(
                            Icons.Filled.MusicNote,
                            contentDescription = "Media image",
                            modifier = Modifier.size(48.dp),
                            tint = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Text(
                            "No Lyrics Available",
                            style = MaterialTheme.typography.titleMedium
                        )
                        Text(
                            "Add a .lrc file next to the audio file to see synced lyrics",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            textAlign = TextAlign.Center
                        )
                    }
                }
            }
            
            else -> {
                // Lyrics display
                val lyrics = uiState.lyrics ?: emptyList()
                LazyColumn(
                    state = listState,
                    modifier = Modifier.fillMaxSize(),
                    contentPadding = PaddingValues(
                        horizontal = 24.dp,
                        vertical = 100.dp // Padding to allow centering
                    ),
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    if (!uiState.isSynced) {
                        item {
                            Text(
                                text = "Lyrics may not be time-synced",
                                style = MaterialTheme.typography.labelMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant,
                                modifier = Modifier.fillMaxWidth(),
                                textAlign = TextAlign.Center
                            )
                            Spacer(modifier = Modifier.height(12.dp))
                        }
                    }

                    itemsIndexed(lyrics) { index, lyricLine: LyricLine ->
                        val nextTimestamp = lyrics.getOrNull(index + 1)?.timestampMs ?: Long.MAX_VALUE
                        val isCurrent = uiState.isSynced && lyricLine.timestampMs <= currentPositionMs &&
                            (index == lyrics.lastIndex || nextTimestamp > currentPositionMs)

                        LyricLineItem(
                            text = lyricLine.text,
                            isCurrent = isCurrent,
                            isPast = lyricLine.timestampMs < currentPositionMs && !isCurrent
                        )
                    }
                }
            }
        }
    }
}

@OptIn(ExperimentalAnimationApi::class)
@Composable
fun LyricLineItem(
    text: String,
    isCurrent: Boolean,
    isPast: Boolean
) {
    AnimatedContent(
        targetState = isCurrent,
        transitionSpec = {
            fadeIn() + scaleIn() with fadeOut() + scaleOut()
        },
        label = "lyric_highlight"
    ) { isCurrentLine ->
        Text(
            text = text,
            style = if (isCurrentLine) {
                MaterialTheme.typography.headlineSmall
            } else {
                MaterialTheme.typography.bodyLarge
            },
            fontWeight = if (isCurrentLine) FontWeight.Bold else FontWeight.Normal,
            color = when {
                isCurrentLine -> MaterialTheme.colorScheme.primary
                isPast -> MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.6f)
                else -> MaterialTheme.colorScheme.onSurface.copy(alpha = 0.4f)
            },
            textAlign = TextAlign.Center,
            modifier = Modifier.fillMaxWidth()
        )
    }
}

data class LyricLine(
    val timestampMs: Long,
    val text: String
)

data class LyricsUiState(
    val isLoading: Boolean = false,
    val lyrics: List<LyricLine>? = null,
    val error: String? = null,
    val isSynced: Boolean = false,
    val fromCache: Boolean = false
)

@HiltViewModel
class SyncedLyricsViewModel @Inject constructor(
    private val lyricsService: LyricsService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(LyricsUiState())
    val uiState: StateFlow<LyricsUiState> = _uiState.asStateFlow()

    private var currentTrack: TrackInfo? = null

    init {
        viewModelScope.launch {
            lyricsService.initialize()
        }
    }

    fun loadLyrics(trackInfo: TrackInfo) {
        if (currentTrack?.id == trackInfo.id && _uiState.value.lyrics != null) {
            return
        }

        currentTrack = trackInfo
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)
            fetchLyrics(trackInfo, forceRefresh = false)
        }
    }

    fun refreshLyrics() {
        val trackInfo = currentTrack ?: return
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)
            lyricsService.clearCache(trackInfo.toLyricsTrack().id)
            fetchLyrics(trackInfo, forceRefresh = true)
        }
    }

    fun clearLyrics() {
        currentTrack = null
        _uiState.value = LyricsUiState()
    }

    private suspend fun fetchLyrics(trackInfo: TrackInfo, forceRefresh: Boolean) {
        val requestTrackId = trackInfo.id
        try {
            val lyricsTrack = trackInfo.toLyricsTrack()
            val result = lyricsService.getLyrics(lyricsTrack, forceRefresh)

            if (currentTrack?.id != requestTrackId) {
                return
            }

            if (result.success && result.lyrics != null) {
                val lines = result.lyrics.lines.map { lyric ->
                    LyricLine(timestampMs = lyric.time, text = lyric.text)
                }

                _uiState.value = LyricsUiState(
                    isLoading = false,
                    lyrics = lines,
                    error = null,
                    isSynced = result.lyrics.hasTimestamps,
                    fromCache = result.fromCache
                )
            } else {
                _uiState.value = LyricsUiState(
                    isLoading = false,
                    lyrics = emptyList(),
                    error = result.error ?: "Lyrics not available",
                    isSynced = false,
                    fromCache = false
                )
            }
        } catch (e: Exception) {
            if (currentTrack?.id == requestTrackId) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to load lyrics: ${e.message}"
                )
            }
        }
    }

    private fun TrackInfo.toLyricsTrack(): Track {
        val numericId = id.toLongOrNull() ?: id.hashCode().toLong()
        val fileUri = runCatching { Uri.fromFile(File(filePath)) }
            .getOrElse { Uri.parse(filePath) }

        return Track(
            id = numericId,
            title = title,
            artist = artist,
            album = album,
            albumArtist = artist,
            genre = null,
            year = null,
            duration = duration,
            trackNumber = null,
            discNumber = null,
            bitrate = null,
            dateAdded = 0L,
            dateModified = 0L,
            uri = fileUri,
            path = filePath,
            mimeType = null
        )
    }
}
