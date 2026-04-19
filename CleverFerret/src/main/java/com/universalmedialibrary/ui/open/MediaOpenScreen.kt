package com.universalmedialibrary.ui.open

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.MusicNote
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.isAudioType
import com.universalmedialibrary.data.isVideoType
import com.universalmedialibrary.data.toMediaTypeOrUnknown
import com.universalmedialibrary.ui.reader.EReaderScreen
import com.universalmedialibrary.ui.reader.DocumentReaderScreen
import com.universalmedialibrary.ui.reader.ComicReaderScreen

private val AUDIO_EXTENSIONS = setOf(
    "mp3", "flac", "m4a", "aac", "ogg", "opus", "wav", "wma", "aiff", "alac"
)

private val VIDEO_EXTENSIONS = setOf(
    "mp4", "mkv", "avi", "mov", "wmv", "flv", "webm", "m4v", "3gp"
)

internal enum class OpenViewerTarget {
    EBOOK,
    DOCUMENT,
    COMIC,
    AUDIO,
    VIDEO,
    NONE
}

internal fun resolveViewerTarget(
    fileExtension: String,
    fileName: String,
    mediaTypeRaw: String
): OpenViewerTarget {
    val ext = fileExtension.lowercase().ifBlank {
        fileName.substringAfterLast('.', "").lowercase()
    }
    val mediaType = mediaTypeRaw.toMediaTypeOrUnknown()

    return when {
        ext == "epub" -> OpenViewerTarget.EBOOK
        ext in setOf("pdf", "txt", "html", "htm", "docx") -> OpenViewerTarget.DOCUMENT
        ext in setOf("cbz", "cbr") -> OpenViewerTarget.COMIC
        ext in AUDIO_EXTENSIONS || mediaType.isAudioType() -> OpenViewerTarget.AUDIO
        ext in VIDEO_EXTENSIONS || mediaType.isVideoType() -> OpenViewerTarget.VIDEO
        else -> OpenViewerTarget.NONE
    }
}

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
            val viewerTarget = resolveViewerTarget(
                fileExtension = item.fileExtension,
                fileName = name,
                mediaTypeRaw = item.mediaType
            )

            when (viewerTarget) {
                OpenViewerTarget.EBOOK -> EReaderScreen(bookFilePath = path, onBack = onBack)
                OpenViewerTarget.DOCUMENT -> DocumentReaderScreen(uriString = path, fileName = name, onBack = onBack)
                OpenViewerTarget.COMIC -> ComicReaderScreen(uriString = path, fileName = name, onBack = onBack)
                OpenViewerTarget.AUDIO -> {
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
                OpenViewerTarget.VIDEO -> {
                    // Video files - start video playback
                    LaunchedEffect(item) {
                        viewModel.playVideoFile(item)
                    }
                    Column(
                        modifier = Modifier.fillMaxSize(),
                        verticalArrangement = Arrangement.Center,
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text("Opening video: $name")
                        Text("Starting playback...")
                    }
                }
                OpenViewerTarget.NONE -> {
                    val ext = item.fileExtension.lowercase().ifBlank {
                        name.substringAfterLast('.', "").lowercase()
                    }
                    // Show more helpful message with mediaType info
                    Column(
                        modifier = Modifier.fillMaxSize().padding(16.dp),
                        verticalArrangement = Arrangement.Center,
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "No viewer for this file",
                            style = MaterialTheme.typography.titleMedium
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = "File: $name",
                            style = MaterialTheme.typography.bodyMedium
                        )
                        if (ext.isNotBlank()) {
                            Text(
                                text = "Extension: .$ext",
                                style = MaterialTheme.typography.bodySmall
                            )
                        }
                        Text(
                            text = "Type: ${item.mediaType}",
                            style = MaterialTheme.typography.bodySmall
                        )
                        Spacer(modifier = Modifier.height(24.dp))
                        OutlinedButton(onClick = onBack) {
                            Text("Back")
                        }
                    }
                }
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
            contentDescription = "Media image",
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
