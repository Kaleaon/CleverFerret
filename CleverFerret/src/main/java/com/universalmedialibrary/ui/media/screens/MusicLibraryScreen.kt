package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.pager.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.launch

/**
 * Clean Media-Centric Music Library Screen
 * 
 * A tabbed music library with views for:
 * - Albums
 * - Artists
 * - Tracks
 * - Playlists
 * - Genres
 * 
 * Features:
 * - Artist detail view with discography
 * - Album grid and list views
 * - Shuffle and queue controls
 * - Now playing mini bar
 */

@OptIn(ExperimentalMaterial3Api::class, ExperimentalFoundationApi::class)
@Composable
fun MusicLibraryScreen(
    state: MusicLibraryState,
    onArtistClick: (MusicArtist) -> Unit,
    onAlbumClick: (MusicAlbum) -> Unit,
    onTrackClick: (MusicTrack) -> Unit,
    onPlaylistClick: (MusicPlaylist) -> Unit,
    onShuffleAll: () -> Unit,
    onBackClick: () -> Unit,
    onSearchClick: () -> Unit,
    onPlayPause: () -> Unit = {},
    onSkipPrevious: () -> Unit = {},
    onSkipNext: () -> Unit = {},
    onOpenNowPlaying: () -> Unit = {},
    modifier: Modifier = Modifier
) {
    val tabs = listOf("Albums", "Artists", "Tracks", "Playlists", "Genres")
    val pagerState = rememberPagerState(pageCount = { tabs.size })
    val coroutineScope = rememberCoroutineScope()
    
    Scaffold(
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
        topBar = {
            MusicLibraryTopBar(
                onBackClick = onBackClick,
                onSearchClick = onSearchClick,
                onShuffleAll = onShuffleAll
            )
        },
        bottomBar = {
            if (state.nowPlaying != null) {
                NowPlayingMiniBar(
                    track = state.nowPlaying,
                    onTap = onOpenNowPlaying,
                    onPlayPauseClick = onPlayPause,
                    onPreviousClick = onSkipPrevious,
                    onNextClick = onSkipNext
                )
            }
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Tab row
            ScrollableTabRow(
                selectedTabIndex = pagerState.currentPage,
                containerColor = Color.Transparent,
                contentColor = MediaColors.TextPrimary,
                edgePadding = MediaSpacing.MD,
                indicator = { tabPositions ->
                    if (tabPositions.isNotEmpty() && pagerState.currentPage < tabPositions.size) {
                        TabRowDefaults.SecondaryIndicator(
                            modifier = Modifier
                                .fillMaxWidth()
                                .wrapContentSize(Alignment.BottomStart)
                                .offset(x = tabPositions[pagerState.currentPage].left)
                                .width(tabPositions[pagerState.currentPage].width),
                            color = MediaColors.AccentPrimary
                        )
                    }
                },
                divider = {}
            ) {
                tabs.forEachIndexed { index, title ->
                    Tab(
                        selected = pagerState.currentPage == index,
                        onClick = {
                            coroutineScope.launch {
                                pagerState.animateScrollToPage(index)
                            }
                        },
                        text = {
                            Text(
                                text = title,
                                style = MediaTypography.LabelLarge,
                                color = if (pagerState.currentPage == index)
                                    MediaColors.AccentPrimary
                                else
                                    MediaColors.TextSecondary
                            )
                        }
                    )
                }
            }
            
            // Content pager - show loading state if needed
            if (state.isLoading) {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    CircularProgressIndicator(color = MediaColors.AccentPrimary)
                }
            } else {
                HorizontalPager(
                    state = pagerState,
                    modifier = Modifier.fillMaxSize()
                ) { page ->
                    when (page) {
                        0 -> AlbumsPage(
                            albums = state.albums,
                            onAlbumClick = onAlbumClick
                        )
                        1 -> ArtistsPage(
                            artists = state.artists,
                            onArtistClick = onArtistClick
                        )
                        2 -> TracksPage(
                            tracks = state.tracks,
                            onTrackClick = onTrackClick,
                            currentTrack = state.nowPlaying
                        )
                        3 -> PlaylistsPage(
                            playlists = state.playlists,
                            onPlaylistClick = onPlaylistClick
                        )
                        4 -> GenresPage(
                            genres = state.genres,
                            onGenreClick = { /* Navigate to genre */ }
                        )
                    }
                }
            }
        }
    }
}

// =============================================================================
// TOP BAR
// =============================================================================


// =============================================================================
// ALBUMS PAGE
// =============================================================================

@Composable
private fun AlbumsPage(
    albums: List<MusicAlbum>,
    onAlbumClick: (MusicAlbum) -> Unit
) {
    if (albums.isEmpty()) {
        EmptyMusicState(message = "No albums in your library")
        return
    }
    
    LazyVerticalGrid(
        columns = GridCells.Adaptive(minSize = 150.dp),
        contentPadding = PaddingValues(MediaSpacing.MD),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(MediaSpacing.LG),
        modifier = Modifier.fillMaxSize()
    ) {
        items(items = albums, key = { it.id }) { album ->
            AlbumCard(
                album = album,
                onClick = { onAlbumClick(album) }
            )
        }
    }
}


// =============================================================================
// ARTISTS PAGE
// =============================================================================

@Composable
private fun ArtistsPage(
    artists: List<MusicArtist>,
    onArtistClick: (MusicArtist) -> Unit
) {
    if (artists.isEmpty()) {
        EmptyMusicState(message = "No artists in your library")
        return
    }
    
    LazyVerticalGrid(
        columns = GridCells.Adaptive(minSize = 140.dp),
        contentPadding = PaddingValues(MediaSpacing.MD),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(MediaSpacing.LG),
        modifier = Modifier.fillMaxSize()
    ) {
        items(items = artists, key = { it.id }) { artist ->
            ArtistCard(
                artist = artist,
                onClick = { onArtistClick(artist) }
            )
        }
    }
}


// =============================================================================
// TRACKS PAGE
// =============================================================================

@Composable
private fun TracksPage(
    tracks: List<MusicTrack>,
    onTrackClick: (MusicTrack) -> Unit,
    currentTrack: MusicTrack?
) {
    if (tracks.isEmpty()) {
        EmptyMusicState(message = "No tracks in your library")
        return
    }
    
    LazyColumn(
        contentPadding = PaddingValues(vertical = MediaSpacing.SM),
        modifier = Modifier.fillMaxSize()
    ) {
        itemsIndexed(tracks) { index, track ->
            TrackListItem(
                track = track,
                trackNumber = index + 1,
                isPlaying = currentTrack?.id == track.id,
                onClick = { onTrackClick(track) }
            )
        }
    }
}


// =============================================================================
// PLAYLISTS PAGE
// =============================================================================

@Composable
private fun PlaylistsPage(
    playlists: List<MusicPlaylist>,
    onPlaylistClick: (MusicPlaylist) -> Unit
) {
    if (playlists.isEmpty()) {
        Column(
            modifier = Modifier.fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Icon(
                imageVector = Icons.Outlined.QueueMusic,
                contentDescription = "Media image",
                tint = MediaColors.TextTertiary,
                modifier = Modifier.size(64.dp)
            )
            Spacer(modifier = Modifier.height(MediaSpacing.MD))
            Text(
                text = "No playlists yet",
                style = MediaTypography.TitleSmall,
                color = MediaColors.TextSecondary
            )
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
            Button(
                onClick = { /* Create playlist */ },
                colors = ButtonDefaults.buttonColors(
                    containerColor = MediaColors.AccentPrimary
                )
            ) {
                Icon(Icons.Default.Add, null)
                Spacer(modifier = Modifier.width(MediaSpacing.SM))
                Text("Create Playlist")
            }
        }
        return
    }
    
    LazyVerticalGrid(
        columns = GridCells.Adaptive(minSize = 160.dp),
        contentPadding = PaddingValues(MediaSpacing.MD),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(MediaSpacing.LG),
        modifier = Modifier.fillMaxSize()
    ) {
        items(playlists) { playlist ->
            PlaylistCard(
                playlist = playlist,
                onClick = { onPlaylistClick(playlist) }
            )
        }
    }
}


// =============================================================================
// GENRES PAGE
// =============================================================================

@Composable
private fun GenresPage(
    genres: List<MusicGenre>,
    onGenreClick: (MusicGenre) -> Unit
) {
    if (genres.isEmpty()) {
        EmptyMusicState(message = "No genres found")
        return
    }
    
    LazyVerticalGrid(
        columns = GridCells.Fixed(2),
        contentPadding = PaddingValues(MediaSpacing.MD),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
        modifier = Modifier.fillMaxSize()
    ) {
        items(genres) { genre ->
            GenreCard(
                genre = genre,
                onClick = { onGenreClick(genre) }
            )
        }
    }
}

@Composable
private fun GenreCard(
    genre: MusicGenre,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .height(80.dp)
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick),
        color = genre.color.copy(alpha = 0.2f)
    ) {
        Box(
            contentAlignment = Alignment.Center,
            modifier = Modifier.fillMaxSize()
        ) {
            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Text(
                    text = genre.name,
                    style = MediaTypography.TitleSmall,
                    color = MediaColors.TextPrimary,
                    fontWeight = FontWeight.SemiBold
                )
                Text(
                    text = "${genre.trackCount} tracks",
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextSecondary
                )
            }
        }
    }
}

// =============================================================================
// NOW PLAYING BAR
// =============================================================================


// =============================================================================
// EMPTY STATE
// =============================================================================

@Composable
private fun EmptyMusicState(message: String) {
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Outlined.MusicNote,
            contentDescription = "Media image",
            tint = MediaColors.TextTertiary,
            modifier = Modifier.size(64.dp)
        )
        Spacer(modifier = Modifier.height(MediaSpacing.MD))
        Text(
            text = message,
            style = MediaTypography.TitleSmall,
            color = MediaColors.TextSecondary
        )
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class MusicLibraryState(
    val albums: List<MusicAlbum> = emptyList(),
    val artists: List<MusicArtist> = emptyList(),
    val tracks: List<MusicTrack> = emptyList(),
    val playlists: List<MusicPlaylist> = emptyList(),
    val genres: List<MusicGenre> = emptyList(),
    val nowPlaying: MusicTrack? = null,
    val isLoading: Boolean = false
)

data class MusicAlbum(
    val id: String,
    val title: String,
    val artist: String,
    val artworkUrl: String?,
    val year: Int?,
    val trackCount: Int,
    val duration: String?
)

data class MusicArtist(
    val id: String,
    val name: String,
    val imageUrl: String?,
    val albumCount: Int,
    val trackCount: Int
)

data class MusicTrack(
    val id: String,
    val title: String,
    val artist: String,
    val album: String,
    val albumArtUrl: String?,
    val duration: String,
    val trackNumber: Int,
    val playbackProgress: Float = 0f,
    val isPlaying: Boolean = false
)

data class MusicPlaylist(
    val id: String,
    val name: String,
    val trackCount: Int,
    val artworkUrls: List<String>,
    val isUserCreated: Boolean
)

data class MusicGenre(
    val name: String,
    val trackCount: Int,
    val color: Color
)
