// ModernArtistDetailScreen — artist hero, biography, top tracks, albums grid.

package com.universalmedialibrary.ui.modern.music

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class ModernArtistDetailUiState(
    val artist: UiArtist,
    val biography: String,
    val topTracks: List<UiTrack>,
    val albums: List<UiAlbum>,
)

@Composable
fun ModernArtistDetailScreen(
    state: ModernArtistDetailUiState,
    onBack: () -> Unit,
    onShuffle: () -> Unit,
    onPlayTrack: (UiTrack) -> Unit,
    onOpenAlbum: (UiAlbum) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = { CFTopBar(title = "Artist", onBack = onBack) },
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
                        .background(Brush.verticalGradient(listOf(state.artist.hue.copy(alpha = 0.45f), cs.background)))
                        .padding(CFSpacing.lg),
                    horizontalAlignment = Alignment.CenterHorizontally,
                ) {
                    Box(
                        Modifier
                            .size(160.dp)
                            .clip(CircleShape)
                            .background(Brush.linearGradient(listOf(state.artist.hue, state.artist.hue.copy(alpha = 0.5f)))),
                    )
                    Spacer(Modifier.height(CFSpacing.md))
                    Text(
                        state.artist.name,
                        style = MaterialTheme.typography.headlineMedium.copy(
                            brush = tokens.metal.brush(),
                            fontWeight = FontWeight.Black,
                        ),
                    )
                    Text(
                        "${state.artist.albumCount} albums",
                        style = MaterialTheme.typography.labelMedium,
                        color = cs.onSurfaceVariant,
                    )
                    Spacer(Modifier.height(CFSpacing.md))
                    CFMetalButton(text = "Shuffle", onClick = onShuffle, leadingIcon = Icons.Default.Shuffle)
                }
            }

            if (state.biography.isNotBlank()) {
                item {
                    Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                        CFSectionHeader("About")
                        Spacer(Modifier.height(CFSpacing.sm))
                        Text(
                            state.biography,
                            style = MaterialTheme.typography.bodyMedium,
                            color = cs.onBackground,
                            maxLines = 6,
                            overflow = TextOverflow.Ellipsis,
                        )
                    }
                }
            }

            if (state.topTracks.isNotEmpty()) {
                item { CFSectionHeader("Top tracks", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
                items(state.topTracks) { t ->
                    Row(
                        Modifier
                            .fillMaxWidth()
                            .clickable { onPlayTrack(t) }
                            .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                    ) {
                        Text(
                            "%02d".format(t.index),
                            style = MaterialTheme.typography.titleMedium,
                            color = cs.onSurfaceVariant,
                            fontWeight = FontWeight.Black,
                        )
                        Text(
                            t.title,
                            modifier = Modifier.weight(1f),
                            style = MaterialTheme.typography.bodyLarge,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis,
                        )
                        Text(
                            t.durationLabel,
                            style = MaterialTheme.typography.labelSmall,
                            color = cs.onSurfaceVariant,
                        )
                    }
                }
            }

            if (state.albums.isNotEmpty()) {
                item {
                    CFSectionHeader(
                        "Albums",
                        "${state.albums.size}",
                        modifier = Modifier.padding(horizontal = CFSpacing.lg),
                    )
                    Spacer(Modifier.height(CFSpacing.sm))
                    LazyRow(
                        contentPadding = PaddingValues(horizontal = CFSpacing.lg),
                        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                    ) {
                        items(state.albums) { a ->
                            Column(Modifier.width(140.dp).clickable { onOpenAlbum(a) }) {
                                Box(
                                    Modifier
                                        .fillMaxWidth()
                                        .aspectRatio(1f)
                                        .clip(RoundedCornerShape(10.dp))
                                        .background(Brush.linearGradient(listOf(a.hue, a.hue.copy(alpha = 0.4f)))),
                                )
                                Spacer(Modifier.height(CFSpacing.xs))
                                Text(
                                    a.title,
                                    style = MaterialTheme.typography.titleSmall,
                                    maxLines = 1,
                                    overflow = TextOverflow.Ellipsis,
                                )
                                Text(
                                    "${a.trackCount} tracks",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = cs.onSurfaceVariant,
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}
