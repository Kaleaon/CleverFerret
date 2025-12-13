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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun MusicLibraryTopBar(
    onBackClick: () -> Unit,
    onSearchClick: () -> Unit,
    onShuffleAll: () -> Unit
) {
    TopAppBar(
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    imageVector = Icons.Default.MusicNote,
                    contentDescription = null,
                    tint = MediaColors.MediaTypes.Music,
                    modifier = Modifier.size(24.dp)
                )
                Spacer(modifier = Modifier.width(MediaSpacing.SM))
                Text(
                    text = "Music",
                    style = MediaTypography.TitleMedium,
                    color = MediaColors.TextPrimary
                )
            }
        },
        navigationIcon = {
            IconButton(onClick = onBackClick) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = MediaColors.TextPrimary
                )
            }
        },
        actions = {
            IconButton(onClick = onShuffleAll) {
                Icon(
                    imageVector = Icons.Default.Shuffle,
                    contentDescription = "Shuffle All",
                    tint = MediaColors.TextSecondary
                )
            }
            IconButton(onClick = onSearchClick) {
                Icon(
                    imageVector = Icons.Default.Search,
                    contentDescription = "Search",
                    tint = MediaColors.TextSecondary
                )
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = MediaColors.BackgroundElevated
        )
    )
}

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

@Composable
private fun AlbumCard(
    album: MusicAlbum,
    onClick: () -> Unit
) {
    Column(
        modifier = Modifier
            .width(150.dp)
            .clickable(onClick = onClick)
    ) {
        Box(
            modifier = Modifier
                .size(150.dp)
                .clip(RoundedCornerShape(MediaCorners.MD))
        ) {
            if (album.artworkUrl != null) {
                AsyncImage(
                    model = album.artworkUrl,
                    contentDescription = album.title,
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Surface(
                    color = MediaColors.BackgroundSurface,
                    modifier = Modifier.fillMaxSize()
                ) {
                    Icon(
                        imageVector = Icons.Default.Album,
                        contentDescription = null,
                        tint = MediaColors.MediaTypes.Music.copy(alpha = 0.5f),
                        modifier = Modifier
                            .padding(MediaSpacing.XL)
                            .fillMaxSize()
                    )
                }
            }
            
            // Play overlay on hover
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .background(
                        Brush.verticalGradient(
                            colors = listOf(
                                Color.Transparent,
                                Color.Black.copy(alpha = 0.5f)
                            )
                        )
                    ),
                contentAlignment = Alignment.BottomEnd
            ) {
                Surface(
                    shape = CircleShape,
                    color = MediaColors.AccentPrimary,
                    modifier = Modifier
                        .padding(MediaSpacing.SM)
                        .size(36.dp)
                ) {
                    Icon(
                        imageVector = Icons.Default.PlayArrow,
                        contentDescription = "Play",
                        tint = Color.Black,
                        modifier = Modifier.padding(6.dp)
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        Text(
            text = album.title,
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextPrimary,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
            fontWeight = FontWeight.Medium
        )
        
        Text(
            text = album.artist,
            style = MediaTypography.LabelSmall,
            color = MediaColors.TextSecondary,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis
        )
        
        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.XS)
        ) {
            Text(
                text = album.year?.toString() ?: "",
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextTertiary
            )
            if (album.trackCount > 0) {
                Text(
                    text = "•",
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextTertiary
                )
                Text(
                    text = "${album.trackCount} tracks",
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextTertiary
                )
            }
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

@Composable
private fun ArtistCard(
    artist: MusicArtist,
    onClick: () -> Unit
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        modifier = Modifier
            .width(140.dp)
            .clickable(onClick = onClick)
    ) {
        Box(
            modifier = Modifier
                .size(120.dp)
                .clip(CircleShape)
        ) {
            if (artist.imageUrl != null) {
                AsyncImage(
                    model = artist.imageUrl,
                    contentDescription = artist.name,
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Surface(
                    color = MediaColors.BackgroundSurface,
                    modifier = Modifier.fillMaxSize()
                ) {
                    Icon(
                        imageVector = Icons.Default.Person,
                        contentDescription = null,
                        tint = MediaColors.MediaTypes.Music.copy(alpha = 0.5f),
                        modifier = Modifier
                            .padding(MediaSpacing.LG)
                            .fillMaxSize()
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        Text(
            text = artist.name,
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextPrimary,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
            textAlign = TextAlign.Center,
            fontWeight = FontWeight.Medium
        )
        
        Text(
            text = "${artist.albumCount} albums",
            style = MediaTypography.LabelSmall,
            color = MediaColors.TextSecondary,
            textAlign = TextAlign.Center
        )
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

@Composable
private fun TrackListItem(
    track: MusicTrack,
    trackNumber: Int,
    isPlaying: Boolean,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .background(
                if (isPlaying) MediaColors.AccentPrimary.copy(alpha = 0.1f)
                else Color.Transparent
            )
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Track number or now playing indicator
        Box(
            modifier = Modifier.width(32.dp),
            contentAlignment = Alignment.Center
        ) {
            if (isPlaying) {
                Icon(
                    imageVector = Icons.Default.VolumeUp,
                    contentDescription = "Playing",
                    tint = MediaColors.AccentPrimary,
                    modifier = Modifier.size(20.dp)
                )
            } else {
                Text(
                    text = trackNumber.toString(),
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextTertiary
                )
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.SM))
        
        // Album art
        Surface(
            modifier = Modifier
                .size(48.dp)
                .clip(RoundedCornerShape(MediaCorners.XS)),
            color = MediaColors.BackgroundSurface
        ) {
            if (track.albumArtUrl != null) {
                AsyncImage(
                    model = track.albumArtUrl,
                    contentDescription = null,
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Icon(
                    imageVector = Icons.Default.MusicNote,
                    contentDescription = null,
                    tint = MediaColors.MediaTypes.Music.copy(alpha = 0.5f),
                    modifier = Modifier.padding(MediaSpacing.SM)
                )
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        // Track info
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = track.title,
                style = MediaTypography.BodyMedium,
                color = if (isPlaying) MediaColors.AccentPrimary else MediaColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                fontWeight = if (isPlaying) FontWeight.Medium else FontWeight.Normal
            )
            Text(
                text = "${track.artist} • ${track.album}",
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextSecondary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
        
        // Duration
        Text(
            text = track.duration,
            style = MediaTypography.LabelSmall,
            color = MediaColors.TextTertiary
        )
        
        // More options
        IconButton(onClick = { /* Show menu */ }) {
            Icon(
                imageVector = Icons.Default.MoreVert,
                contentDescription = "More options",
                tint = MediaColors.TextTertiary,
                modifier = Modifier.size(20.dp)
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
                contentDescription = null,
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

@Composable
private fun PlaylistCard(
    playlist: MusicPlaylist,
    onClick: () -> Unit
) {
    Column(
        modifier = Modifier
            .width(160.dp)
            .clickable(onClick = onClick)
    ) {
        // Playlist artwork grid
        Surface(
            modifier = Modifier
                .size(160.dp)
                .clip(RoundedCornerShape(MediaCorners.MD)),
            color = MediaColors.BackgroundSurface
        ) {
            when {
                playlist.artworkUrls.size >= 4 -> {
                    // 2x2 grid of album arts
                    Column {
                        Row(modifier = Modifier.weight(1f)) {
                            playlist.artworkUrls.take(2).forEach { url ->
                                AsyncImage(
                                    model = url,
                                    contentDescription = null,
                                    contentScale = ContentScale.Crop,
                                    modifier = Modifier
                                        .weight(1f)
                                        .fillMaxHeight()
                                )
                            }
                        }
                        Row(modifier = Modifier.weight(1f)) {
                            playlist.artworkUrls.drop(2).take(2).forEach { url ->
                                AsyncImage(
                                    model = url,
                                    contentDescription = null,
                                    contentScale = ContentScale.Crop,
                                    modifier = Modifier
                                        .weight(1f)
                                        .fillMaxHeight()
                                )
                            }
                        }
                    }
                }
                playlist.artworkUrls.isNotEmpty() -> {
                    AsyncImage(
                        model = playlist.artworkUrls.first(),
                        contentDescription = null,
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                }
                else -> {
                    Box(contentAlignment = Alignment.Center) {
                        Icon(
                            imageVector = Icons.Default.QueueMusic,
                            contentDescription = null,
                            tint = MediaColors.MediaTypes.Music.copy(alpha = 0.5f),
                            modifier = Modifier.size(48.dp)
                        )
                    }
                }
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        Text(
            text = playlist.name,
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextPrimary,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
            fontWeight = FontWeight.Medium
        )
        
        Text(
            text = "${playlist.trackCount} tracks",
            style = MediaTypography.LabelSmall,
            color = MediaColors.TextSecondary
        )
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

@Composable
private fun NowPlayingMiniBar(
    track: MusicTrack,
    onTap: () -> Unit,
    onPlayPauseClick: () -> Unit,
    onPreviousClick: () -> Unit,
    onNextClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onTap),
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.MD
    ) {
        Column {
            // Progress bar
            LinearProgressIndicator(
                progress = { track.playbackProgress },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(2.dp),
                color = MediaColors.AccentPrimary,
                trackColor = MediaColors.ProgressBackground
            )
            
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(MediaSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Album art
                Surface(
                    modifier = Modifier
                        .size(48.dp)
                        .clip(RoundedCornerShape(MediaCorners.XS)),
                    color = MediaColors.BackgroundSurface
                ) {
                    if (track.albumArtUrl != null) {
                        AsyncImage(
                            model = track.albumArtUrl,
                            contentDescription = null,
                            contentScale = ContentScale.Crop,
                            modifier = Modifier.fillMaxSize()
                        )
                    }
                }
                
                Spacer(modifier = Modifier.width(MediaSpacing.MD))
                
                // Track info
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = track.title,
                        style = MediaTypography.BodyMedium,
                        color = MediaColors.TextPrimary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = track.artist,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                
                // Playback controls
                IconButton(onClick = onPreviousClick) {
                    Icon(
                        imageVector = Icons.Default.SkipPrevious,
                        contentDescription = "Previous",
                        tint = MediaColors.TextSecondary
                    )
                }
                
                IconButton(onClick = onPlayPauseClick) {
                    Surface(
                        shape = CircleShape,
                        color = MediaColors.AccentPrimary,
                        modifier = Modifier.size(36.dp)
                    ) {
                        Icon(
                            imageVector = if (track.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                            contentDescription = if (track.isPlaying) "Pause" else "Play",
                            tint = Color.Black,
                            modifier = Modifier.padding(6.dp)
                        )
                    }
                }
                
                IconButton(onClick = onNextClick) {
                    Icon(
                        imageVector = Icons.Default.SkipNext,
                        contentDescription = "Next",
                        tint = MediaColors.TextSecondary
                    )
                }
            }
        }
    }
}

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
            contentDescription = null,
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
