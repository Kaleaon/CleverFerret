package com.universalmedialibrary.ui.open

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.MusicNote
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.reader.EReaderScreen
import com.universalmedialibrary.ui.reader.DocumentReaderScreen
import com.universalmedialibrary.ui.reader.ComicReaderScreen

private val AUDIO_EXTENSIONS = setOf(
    "mp3", "flac", "m4a", "aac", "ogg", "opus", "wav", "wma", "aiff", "alac"
)

private val VIDEO_EXTENSIONS = setOf(
    "mp4", "mkv", "avi", "mov", "wmv", "flv", "webm", "m4v", "3gp"
)

@Composable
fun MediaOpenScreen(
    itemId: Long,
    onBack: () -> Unit,
    viewModel: MediaOpenViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    LaunchedEffect(itemId) { viewModel.load(itemId) }

    when {
        uiState.isLoading -> CircularProgressIndicator()
        uiState.error != null -> Text(uiState.error ?: "Error")
        uiState.mediaItem != null -> {
            val item = uiState.mediaItem!!
            val path = item.filePath
            val name = item.fileName
            val ext = name.substringAfterLast('.', "").lowercase()
            when {
                ext == "epub" -> EReaderScreen(bookFilePath = path, onBack = onBack)
                ext in setOf("pdf", "txt", "html", "htm", "docx") -> DocumentReaderScreen(uriString = path, fileName = name, onBack = onBack)
                ext in setOf("cbz", "cbr") -> ComicReaderScreen(uriString = path, fileName = name, onBack = onBack)
                ext in AUDIO_EXTENSIONS -> {
                    // Start audio playback and show a simple player UI
                    LaunchedEffect(item) {
                        viewModel.playAudioFile(item)
                    }
                    AudioPlaybackScreen(
                        fileName = name,
                        isPlaying = uiState.audioPlaybackStarted,
                        onBack = onBack
                    )
                }
                ext in VIDEO_EXTENSIONS -> {
                    // Video files - show a message that video player should be opened
                    Column(
                        modifier = Modifier.fillMaxSize(),
                        verticalArrangement = Arrangement.Center,
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text("Opening video: $name")
                        Text("Navigate to video player for playback")
                    }
                }
                else -> Text("No viewer for .$ext")
            }
        }
    }
}

@Composable
private fun AudioPlaybackScreen(
    fileName: String,
    isPlaying: Boolean,
    onBack: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Icon(
            imageVector = Icons.Default.MusicNote,
            contentDescription = null,
            modifier = Modifier.size(64.dp),
            tint = MaterialTheme.colorScheme.primary
        )
        Spacer(modifier = Modifier.height(16.dp))
        Text(
            text = fileName,
            style = MaterialTheme.typography.titleMedium
        )
        Spacer(modifier = Modifier.height(8.dp))
        Text(
            text = if (isPlaying) "Now Playing" else "Starting playback...",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Spacer(modifier = Modifier.height(24.dp))
        OutlinedButton(onClick = onBack) {
            Text("Back")
        }
    }
}
