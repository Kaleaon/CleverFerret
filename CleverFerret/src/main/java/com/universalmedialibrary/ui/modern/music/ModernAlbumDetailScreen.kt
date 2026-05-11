// ModernAlbumDetailScreen — album hero + tracklist with play / shuffle CTAs.

package com.universalmedialibrary.ui.modern.music

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.PlaylistAdd
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class UiTrack(
    val id: String,
    val index: Int,
    val title: String,
    val durationLabel: String,
    val playing: Boolean = false,
)

data class ModernAlbumDetailUiState(
    val album: UiAlbum,
    val year: String? = null,
    val totalDurationLabel: String,
    val tracks: List<UiTrack>,
)

@Composable
fun ModernAlbumDetailScreen(
    state: ModernAlbumDetailUiState,
    onBack: () -> Unit,
    onPlayAll: () -> Unit,
    onShuffle: () -> Unit,
    onAddToPlaylist: () -> Unit,
    onCast: () -> Unit,
    onPlayTrack: (UiTrack) -> Unit,
    onOpenArtist: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current

    Scaffold(
        topBar = {
            CFTopBar(
                title = "Album",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onAddToPlaylist) { Icon(Icons.AutoMirrored.Filled.PlaylistAdd, contentDescription = "Add to playlist") }
                    IconButton(onClick = onCast) { Icon(Icons.Default.Cast, contentDescription = "Cast") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            item {
                Column(
                    Modifier
                        .fillMaxWidth()
                        .background(Brush.verticalGradient(listOf(state.album.hue.copy(alpha = 0.45f), cs.background)))
                        .padding(CFSpacing.lg),
                    horizontalAlignment = Alignment.CenterHorizontally,
                ) {
                    Box(
                        Modifier
                            .size(220.dp)
                            .clip(RoundedCornerShape(14.dp))
                            .background(Brush.linearGradient(listOf(state.album.hue, state.album.hue.copy(alpha = 0.4f)))),
                    )
                    Spacer(Modifier.height(CFSpacing.md))
                    Text(
                        state.album.title,
                        style = MaterialTheme.typography.headlineMedium.copy(
                            brush = tokens.metal.brush(),
                            fontWeight = FontWeight.Black,
                        ),
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis,
                    )
                    TextButton(onClick = onOpenArtist) {
                        Text(
                            state.album.artist,
                            style = MaterialTheme.typography.titleSmall,
                            color = cs.primary,
                        )
                    }
                    Text(
                        listOfNotNull(state.year, "${state.album.trackCount} tracks", state.totalDurationLabel)
                            .joinToString(" · "),
                        style = MaterialTheme.typography.labelMedium,
                        color = cs.onSurfaceVariant,
                    )
                    Spacer(Modifier.height(CFSpacing.md))
                    Row(horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
                        CFMetalButton(text = "Play", onClick = onPlayAll, leadingIcon = Icons.Default.PlayArrow)
                        OutlinedButton(onClick = onShuffle) {
                            Icon(Icons.Default.Shuffle, contentDescription = null)
                            Spacer(Modifier.width(4.dp))
                            Text("Shuffle")
                        }
                    }
                }
            }

            items(state.tracks) { t -> TrackRow(t, onPlay = { onPlayTrack(t) }) }
        }
    }
}

@Composable
private fun TrackRow(track: UiTrack, onPlay: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(10.dp))
            .clickable(onClick = onPlay)
            .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Text(
            "%02d".format(track.index),
            style = MaterialTheme.typography.titleMedium,
            color = if (track.playing) cs.primary else cs.onSurfaceVariant,
            fontWeight = FontWeight.Black,
        )
        Text(
            track.title,
            style = MaterialTheme.typography.bodyLarge,
            color = if (track.playing) cs.primary else cs.onSurface,
            fontWeight = if (track.playing) FontWeight.Black else FontWeight.Normal,
            modifier = Modifier.weight(1f),
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
        )
        Text(
            track.durationLabel,
            style = MaterialTheme.typography.labelSmall,
            color = cs.onSurfaceVariant,
        )
    }
}
