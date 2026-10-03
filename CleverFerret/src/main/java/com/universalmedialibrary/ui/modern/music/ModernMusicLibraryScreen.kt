// ModernMusicLibraryScreen — tabbed music browser (Songs / Albums / Artists / Playlists / Genres).
// Songs render as a compact list with album-art thumbs.
// Albums / Artists / Playlists / Genres render as grid cells.

package com.universalmedialibrary.ui.modern.music

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

enum class MusicTab(val label: String) {
    Songs("Songs"), Albums("Albums"), Artists("Artists"),
    Playlists("Playlists"), Genres("Genres")
}

data class UiSong(
    val id: String,
    val title: String,
    val artist: String,
    val durationLabel: String,
    val albumHue: Color,
)

data class UiAlbum(
    val id: String,
    val title: String,
    val artist: String,
    val trackCount: Int,
    val hue: Color,
)

data class UiArtist(
    val id: String,
    val name: String,
    val albumCount: Int,
    val hue: Color,
)

data class UiPlaylist(
    val id: String,
    val title: String,
    val trackCount: Int,
    val hue: Color,
    val smart: Boolean = false,
)

data class UiGenre(val id: String, val name: String, val trackCount: Int, val hue: Color)

data class ModernMusicLibraryUiState(
    val songs: List<UiSong> = emptyList(),
    val albums: List<UiAlbum> = emptyList(),
    val artists: List<UiArtist> = emptyList(),
    val playlists: List<UiPlaylist> = emptyList(),
    val genres: List<UiGenre> = emptyList(),
)

@Composable
fun ModernMusicLibraryScreen(
    state: ModernMusicLibraryUiState,
    onBack: () -> Unit,
    onSearch: () -> Unit,
    onCast: () -> Unit,
    onPlaySong: (UiSong) -> Unit,
    onOpenAlbum: (UiAlbum) -> Unit,
    onOpenArtist: (UiArtist) -> Unit,
    onOpenPlaylist: (UiPlaylist) -> Unit,
    onOpenGenre: (UiGenre) -> Unit,
) {
    var tab by remember { mutableStateOf(MusicTab.Songs) }
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Music",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onSearch) { Icon(Icons.Default.Search, contentDescription = "Search") }
                    IconButton(onClick = onCast) { Icon(Icons.Default.Cast, contentDescription = "Cast") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        Column(Modifier.fillMaxSize().padding(padding)) {
            ScrollableTabRow(
                selectedTabIndex = tab.ordinal,
                containerColor = cs.background,
                edgePadding = CFSpacing.lg,
            ) {
                MusicTab.entries.forEach { t ->
                    Tab(
                        selected = t == tab,
                        onClick = { tab = t },
                        text = { Text(t.label) },
                    )
                }
            }
            when (tab) {
                MusicTab.Songs     -> SongList(state.songs, onPlaySong)
                MusicTab.Albums    -> AlbumGrid(state.albums, onOpenAlbum)
                MusicTab.Artists   -> ArtistGrid(state.artists, onOpenArtist)
                MusicTab.Playlists -> PlaylistGrid(state.playlists, onOpenPlaylist)
                MusicTab.Genres    -> GenreGrid(state.genres, onOpenGenre)
            }
        }
    }
}

@Composable
private fun SongList(songs: List<UiSong>, onPlaySong: (UiSong) -> Unit) {
    val cs = MaterialTheme.colorScheme
    LazyColumn(
        contentPadding = PaddingValues(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
        verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
    ) {
        items(songs) { s ->
            Row(
                Modifier
                    .fillMaxWidth()
                    .clip(RoundedCornerShape(10.dp))
                    .clickable { onPlaySong(s) }
                    .padding(CFSpacing.sm),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
            ) {
                Box(
                    Modifier
                        .size(44.dp)
                        .clip(RoundedCornerShape(6.dp))
                        .background(Brush.linearGradient(listOf(s.albumHue, s.albumHue.copy(alpha = 0.5f)))),
                )
                Column(Modifier.weight(1f)) {
                    Text(
                        s.title,
                        style = MaterialTheme.typography.titleSmall,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                    )
                    Text(
                        s.artist,
                        style = MaterialTheme.typography.bodySmall,
                        color = cs.onSurfaceVariant,
                        maxLines = 1,
                    )
                }
                Text(
                    s.durationLabel,
                    style = MaterialTheme.typography.labelSmall,
                    color = cs.onSurfaceVariant,
                )
            }
        }
    }
}

@Composable
private fun AlbumGrid(albums: List<UiAlbum>, onOpen: (UiAlbum) -> Unit) {
    val cs = MaterialTheme.colorScheme
    LazyVerticalGrid(
        columns = GridCells.Adaptive(minSize = 140.dp),
        contentPadding = PaddingValues(CFSpacing.lg),
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
        verticalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        items(albums) { a ->
            Column(Modifier.clickable { onOpen(a) }) {
                Box(
                    Modifier
                        .fillMaxWidth()
                        .aspectRatio(1f)
                        .clip(RoundedCornerShape(10.dp))
                        .background(Brush.linearGradient(listOf(a.hue, a.hue.copy(alpha = 0.5f)))),
                )
                Spacer(Modifier.height(CFSpacing.xs))
                Text(
                    a.title,
                    style = MaterialTheme.typography.titleSmall,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                )
                Text(
                    a.artist,
                    style = MaterialTheme.typography.bodySmall,
                    color = cs.onSurfaceVariant,
                    maxLines = 1,
                )
            }
        }
    }
}

@Composable
private fun ArtistGrid(artists: List<UiArtist>, onOpen: (UiArtist) -> Unit) {
    val cs = MaterialTheme.colorScheme
    LazyVerticalGrid(
        columns = GridCells.Adaptive(minSize = 110.dp),
        contentPadding = PaddingValues(CFSpacing.lg),
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
        verticalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        items(artists) { a ->
            Column(
                Modifier.clickable { onOpen(a) },
                horizontalAlignment = Alignment.CenterHorizontally,
            ) {
                Box(
                    Modifier
                        .size(96.dp)
                        .clip(CircleShape)
                        .background(Brush.linearGradient(listOf(a.hue, a.hue.copy(alpha = 0.5f)))),
                )
                Spacer(Modifier.height(CFSpacing.xs))
                Text(
                    a.name,
                    style = MaterialTheme.typography.titleSmall,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                )
                Text(
                    "${a.albumCount} albums",
                    style = MaterialTheme.typography.bodySmall,
                    color = cs.onSurfaceVariant,
                )
            }
        }
    }
}

@Composable
private fun PlaylistGrid(playlists: List<UiPlaylist>, onOpen: (UiPlaylist) -> Unit) {
    val cs = MaterialTheme.colorScheme
    LazyVerticalGrid(
        columns = GridCells.Adaptive(minSize = 160.dp),
        contentPadding = PaddingValues(CFSpacing.lg),
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
        verticalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        items(playlists) { p ->
            Column(
                Modifier
                    .clip(RoundedCornerShape(12.dp))
                    .background(cs.surface)
                    .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(12.dp))
                    .clickable { onOpen(p) }
                    .padding(CFSpacing.sm),
            ) {
                Box(
                    Modifier
                        .fillMaxWidth()
                        .aspectRatio(1.6f)
                        .clip(RoundedCornerShape(8.dp))
                        .background(Brush.linearGradient(listOf(p.hue, p.hue.copy(alpha = 0.4f)))),
                )
                Spacer(Modifier.height(CFSpacing.xs))
                Row(verticalAlignment = Alignment.CenterVertically) {
                    if (p.smart) {
                        Icon(
                            Icons.Default.AutoAwesome,
                            contentDescription = "Smart playlist",
                            tint = cs.primary,
                            modifier = Modifier.size(14.dp),
                        )
                        Spacer(Modifier.width(4.dp))
                    }
                    Text(p.title, style = MaterialTheme.typography.titleSmall, maxLines = 1)
                }
                Text(
                    "${p.trackCount} tracks",
                    style = MaterialTheme.typography.bodySmall,
                    color = cs.onSurfaceVariant,
                )
            }
        }
    }
}

@Composable
private fun GenreGrid(genres: List<UiGenre>, onOpen: (UiGenre) -> Unit) {
    val cs = MaterialTheme.colorScheme
    LazyVerticalGrid(
        columns = GridCells.Adaptive(minSize = 140.dp),
        contentPadding = PaddingValues(CFSpacing.lg),
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
        verticalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        items(genres) { g ->
            Box(
                Modifier
                    .fillMaxWidth()
                    .height(80.dp)
                    .clip(RoundedCornerShape(12.dp))
                    .background(Brush.linearGradient(listOf(g.hue, g.hue.copy(alpha = 0.4f))))
                    .clickable { onOpen(g) }
                    .padding(CFSpacing.md),
            ) {
                Column(verticalArrangement = Arrangement.SpaceBetween, modifier = Modifier.fillMaxSize()) {
                    Text(g.name, style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.Black, color = Color.White)
                    Text("${g.trackCount} tracks", style = MaterialTheme.typography.labelSmall, color = Color.White.copy(alpha = 0.85f))
                }
            }
        }
    }
}
