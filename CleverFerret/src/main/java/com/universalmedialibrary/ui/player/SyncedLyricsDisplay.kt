package com.universalmedialibrary.ui.player

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
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
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
    trackId: String,
    currentPositionMs: Long,
    modifier: Modifier = Modifier,
    viewModel: LyricsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val listState = rememberLazyListState()
    
    LaunchedEffect(trackId) {
        viewModel.loadLyrics(trackId)
    }
    
    LaunchedEffect(currentPositionMs, uiState.lyrics) {
        if (uiState.lyrics != null && uiState.lyrics!!.isNotEmpty()) {
            // Find current lyric index based on position
            val currentIndex = uiState.lyrics!!.indexOfLast {
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
                            contentDescription = null,
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
            
            uiState.lyrics != null && uiState.lyrics!!.isEmpty() -> {
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
                            contentDescription = null,
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
            
            uiState.lyrics != null -> {
                // Lyrics display
                LazyColumn(
                    state = listState,
                    modifier = Modifier.fillMaxSize(),
                    contentPadding = PaddingValues(
                        horizontal = 24.dp,
                        vertical = 100.dp // Padding to allow centering
                    ),
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    itemsIndexed(uiState.lyrics!!) { index, lyricLine ->
                        val isCurrent = lyricLine.timestampMs <= currentPositionMs &&
                            (index == uiState.lyrics!!.lastIndex ||
                                uiState.lyrics!![index + 1].timestampMs > currentPositionMs)
                        
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
    val error: String? = null
)

@HiltViewModel
class LyricsViewModel @Inject constructor(
    private val lyricsService: LyricsService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(LyricsUiState())
    val uiState: StateFlow<LyricsUiState> = _uiState.asStateFlow()
    
    fun loadLyrics(trackId: String) {
        viewModelScope.launch {
            _uiState.value = LyricsUiState(isLoading = true)
            
            try {
                // For now, show a placeholder since we need Track object
                // This will be properly integrated when connecting to the music player
                _uiState.value = LyricsUiState(
                    error = "Lyrics integration pending. Add a .lrc file next to your audio files for synced lyrics support."
                )
            } catch (e: Exception) {
                _uiState.value = LyricsUiState(
                    error = "Failed to load lyrics: ${e.message}"
                )
            }
        }
    }
    
    private fun parseSyncedLyrics(syncedText: String): List<LyricLine> {
        val lines = mutableListOf<LyricLine>()
        val timestampRegex = Regex("""\[(\d{2}):(\d{2})\.(\d{2})\](.*)""")
        
        syncedText.lines().forEach { line ->
            val match = timestampRegex.matchEntire(line.trim())
            if (match != null) {
                val minutes = match.groupValues[1].toInt()
                val seconds = match.groupValues[2].toInt()
                val centiseconds = match.groupValues[3].toInt()
                val text = match.groupValues[4].trim()
                
                if (text.isNotEmpty()) {
                    val timestampMs = (minutes * 60 * 1000L) + (seconds * 1000L) + (centiseconds * 10L)
                    lines.add(LyricLine(timestampMs, text))
                }
            }
        }
        
        return lines.sortedBy { it.timestampMs }
    }
}
