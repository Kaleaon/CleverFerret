package com.universalmedialibrary.ui.music

import androidx.compose.animation.*
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.theme.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MusicLibraryScreen(
    navController: NavController,
    viewModel: MusicLibraryViewModel = hiltViewModel()
) {
    val state by viewModel.uiState.collectAsState()
    var showSearch by remember { mutableStateOf(false) }

    LaunchedEffect(Unit) {
        viewModel.scan()
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    if (showSearch) {
                        OutlinedTextField(
                            value = state.searchQuery,
                            onValueChange = viewModel::setSearchQuery,
                            modifier = Modifier.fillMaxWidth(),
                            placeholder = { Text("Search music...") },
                            singleLine = true,
                            trailingIcon = {
                                IconButton(onClick = { 
                                    viewModel.setSearchQuery("")
                                    showSearch = false 
                                }) {
                                    Icon(Icons.Default.Close, "Close search")
                                }
                            }
                        )
                    } else {
                        Text("Music Library")
                    }
                },
                actions = {
                    if (!showSearch) {
                        // Search button
                        IconButton(onClick = { showSearch = true }) {
                            Icon(Icons.Default.Search, "Search")
                        }

                        // View mode toggle
                        IconButton(onClick = {
                            val modes = MusicViewMode.values()
                            val currentIndex = modes.indexOf(state.viewMode)
                            val nextMode = modes[(currentIndex + 1) % modes.size]
                            viewModel.setViewMode(nextMode)
                        }) {
                            Icon(state.viewMode.icon, state.viewMode.displayName)
                        }

                        // Sort menu
                        Box {
                            IconButton(onClick = viewModel::toggleSortMenu) {
                                Icon(Icons.Default.Sort, "Sort")
                            }
                            
                            DropdownMenu(
                                expanded = state.showSortMenu,
                                onDismissRequest = viewModel::toggleSortMenu
                            ) {
                                MusicSortOption.values().forEach { option ->
                                    DropdownMenuItem(
                                        text = {
                                            Row(
                                                horizontalArrangement = Arrangement.spacedBy(8.dp),
                                                verticalAlignment = Alignment.CenterVertically
                                            ) {
                                                Icon(option.icon, null, modifier = Modifier.size(20.dp))
                                                Text(option.displayName)
                                            }
                                        },
                                        onClick = {
                                            viewModel.setSortOption(option)
                                            viewModel.toggleSortMenu()
                                        },
                                        leadingIcon = {
                                            if (state.sortOption == option) {
                                                Icon(Icons.Default.Check, null, modifier = Modifier.size(20.dp))
                                            }
                                        }
                                    )
                                }
                            }
                        }

                        // Filter menu
                        Box {
                            IconButton(onClick = viewModel::toggleFilterMenu) {
                                Badge(
                                    containerColor = if (state.selectedGenre != null || 
                                        state.selectedArtist != null || 
                                        state.selectedAlbum != null) 
                                        MaterialTheme.colorScheme.primary 
                                    else MaterialTheme.colorScheme.surfaceVariant
                                ) {
                                    Icon(Icons.Default.FilterList, "Filter")
                                }
                            }
                        }

                        // Play actions menu
                        var showPlayMenu by remember { mutableStateOf(false) }
                        Box {
                            IconButton(onClick = { showPlayMenu = true }) {
                                Icon(Icons.Default.MoreVert, "More")
                            }
                            
                            DropdownMenu(
                                expanded = showPlayMenu,
                                onDismissRequest = { showPlayMenu = false }
                            ) {
                                DropdownMenuItem(
                                    text = { Text("Play All") },
                                    onClick = {
                                        viewModel.playAll()
                                        showPlayMenu = false
                                    },
                                    leadingIcon = { Icon(Icons.Default.PlayArrow, null) }
                                )
                                DropdownMenuItem(
                                    text = { Text("Shuffle All") },
                                    onClick = {
                                        viewModel.shuffleAll()
                                        showPlayMenu = false
                                    },
                                    leadingIcon = { Icon(Icons.Default.Shuffle, null) }
                                )
                            }
                        }
                    }
                }
            )
        }
    ) { padding ->
        Column(modifier = Modifier.fillMaxSize().padding(padding)) {
            // Tab Row
            ScrollableTabRow(
                selectedTabIndex = state.currentTab.ordinal,
                containerColor = MaterialTheme.colorScheme.surface,
                edgePadding = 0.dp
            ) {
                MusicTab.values().forEach { tab ->
                    Tab(
                        selected = state.currentTab == tab,
                        onClick = { viewModel.setTab(tab) },
                        text = { Text(tab.displayName) },
                        icon = { Icon(tab.icon, null) }
                    )
                }
            }

            // Filter chips (if any filters applied)
            AnimatedVisibility(
                visible = state.selectedGenre != null || 
                         state.selectedArtist != null || 
                         state.selectedAlbum != null
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp, vertical = 8.dp),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    state.selectedGenre?.let { genre ->
                        FilterChip(
                            selected = true,
                            onClick = { viewModel.setGenreFilter(null) },
                            label = { Text("Genre: $genre") },
                            trailingIcon = { Icon(Icons.Default.Close, null, modifier = Modifier.size(16.dp)) }
                        )
                    }
                    state.selectedArtist?.let { artist ->
                        FilterChip(
                            selected = true,
                            onClick = { viewModel.setArtistFilter(null) },
                            label = { Text("Artist: $artist") },
                            trailingIcon = { Icon(Icons.Default.Close, null, modifier = Modifier.size(16.dp)) }
                        )
                    }
                    state.selectedAlbum?.let { album ->
                        FilterChip(
                            selected = true,
                            onClick = { viewModel.setAlbumFilter(null) },
                            label = { Text("Album: $album") },
                            trailingIcon = { Icon(Icons.Default.Close, null, modifier = Modifier.size(16.dp)) }
                        )
                    }
                    TextButton(onClick = viewModel::clearFilters) {
                        Text("Clear All")
                    }
                }
            }

            // Content area
            if (state.isLoading) {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    CircularProgressIndicator()
                }
            } else {
                when (state.currentTab) {
                    MusicTab.SONGS -> SongsTab(state, viewModel)
                    MusicTab.ALBUMS -> AlbumsTab(state, viewModel)
                    MusicTab.ARTISTS -> ArtistsTab(state, viewModel)
                    MusicTab.GENRES -> GenresTab(state, viewModel)
                    MusicTab.PLAYLISTS -> PlaylistsTab()
                }
            }
        }
    }
}

@Composable
private fun SongsTab(state: MusicLibraryUiState, viewModel: MusicLibraryViewModel) {
    when (state.viewMode) {
        MusicViewMode.GRID -> {
            LazyVerticalGrid(
                columns = GridCells.Adaptive(minSize = 160.dp),
                contentPadding = PaddingValues(16.dp),
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                items(state.tracks) { track ->
                    TrackGridItem(track = track, onClick = { viewModel.playTrack(track) })
                }
            }
        }
        MusicViewMode.LIST, MusicViewMode.COMPACT -> {
            LazyColumn(
                contentPadding = PaddingValues(vertical = 8.dp),
                verticalArrangement = Arrangement.spacedBy(2.dp)
            ) {
                items(state.tracks) { track ->
                    TrackListItem(
                        track = track,
                        compact = state.viewMode == MusicViewMode.COMPACT,
                        onClick = { viewModel.playTrack(track) }
                    )
                }
            }
        }
    }
}

@Composable
private fun AlbumsTab(state: MusicLibraryUiState, viewModel: MusicLibraryViewModel) {
    LazyVerticalGrid(
        columns = GridCells.Adaptive(minSize = 160.dp),
        contentPadding = PaddingValues(16.dp),
        horizontalArrangement = Arrangement.spacedBy(12.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        items(state.albums) { album ->
            AlbumGridItem(album = album, onClick = { viewModel.playAlbum(album) })
        }
    }
}

@Composable
private fun ArtistsTab(state: MusicLibraryUiState, viewModel: MusicLibraryViewModel) {
    LazyColumn(
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        items(state.artists) { artist ->
            ArtistListItem(artist = artist, onClick = { viewModel.playArtist(artist) })
        }
    }
}

@Composable
private fun GenresTab(state: MusicLibraryUiState, viewModel: MusicLibraryViewModel) {
    LazyColumn(
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        items(state.genres) { genre ->
            GenreListItem(genre = genre, onClick = { viewModel.playGenre(genre) })
        }
    }
}

@Composable
private fun PlaylistsTab() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Text("Playlists - Coming Soon", style = MaterialTheme.typography.titleMedium)
    }
}

@Composable
private fun TrackGridItem(track: Track, onClick: () -> Unit) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(8.dp)
    ) {
        Column {
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(1f)
                    .clip(RoundedCornerShape(topStart = 8.dp, topEnd = 8.dp))
            ) {
                Icon(
                    Icons.Default.MusicNote,
                    contentDescription = null,
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(32.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
            }
            Column(modifier = Modifier.padding(12.dp)) {
                Text(
                    text = track.title ?: "Unknown",
                    style = MaterialTheme.typography.bodyMedium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    text = track.displayArtist,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    text = track.displayDuration,
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@Composable
private fun TrackListItem(track: Track, compact: Boolean = false, onClick: () -> Unit) {
    ListItem(
        headlineContent = { Text(track.title ?: "Unknown", maxLines = 1) },
        supportingContent = {
            if (compact) {
                Text("${track.displayArtist} • ${track.displayDuration}", maxLines = 1)
            } else {
                Column {
                    Text(track.displayArtist, maxLines = 1)
                    Text(
                        "${track.displayAlbum} • ${track.displayDuration}${if (track.year != null) " • ${track.year}" else ""}",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1
                    )
                }
            }
        },
        leadingContent = {
            Surface(
                modifier = Modifier.size(if (compact) 40.dp else 56.dp),
                shape = RoundedCornerShape(4.dp),
                color = MaterialTheme.colorScheme.surfaceVariant
            ) {
                Icon(
                    Icons.Default.MusicNote,
                    contentDescription = null,
                    modifier = Modifier.padding(8.dp)
                )
            }
        },
        trailingContent = {
            if (!compact && track.trackNumber != null) {
                Text(
                    text = "#${track.trackNumber}",
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        },
        modifier = Modifier.clickable(onClick = onClick)
    )
}

@Composable
private fun AlbumGridItem(album: Album, onClick: () -> Unit) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(8.dp)
    ) {
        Column {
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(1f)
                    .clip(RoundedCornerShape(topStart = 8.dp, topEnd = 8.dp))
            ) {
                if (album.artworkUri != null) {
                    AsyncImage(
                        model = album.artworkUri,
                        contentDescription = null,
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    Icon(
                        Icons.Default.Album,
                        contentDescription = null,
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(32.dp),
                        tint = MaterialTheme.colorScheme.primary
                    )
                }
            }
            Column(modifier = Modifier.padding(12.dp)) {
                Text(
                    text = album.displayName,
                    style = MaterialTheme.typography.titleSmall,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    text = album.displayArtist,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Row(
                    horizontalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    if (album.year != null) {
                        Text(
                            text = album.displayYear,
                            style = MaterialTheme.typography.labelSmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Text("•", style = MaterialTheme.typography.labelSmall)
                    }
                    Text(
                        text = "${album.trackCount} tracks",
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
}

@Composable
private fun ArtistListItem(artist: Artist, onClick: () -> Unit) {
    ListItem(
        headlineContent = { Text(artist.displayName) },
        supportingContent = { 
            Text("${artist.albumCount} albums • ${artist.trackCount} tracks") 
        },
        leadingContent = {
            Surface(
                modifier = Modifier.size(56.dp),
                shape = RoundedCornerShape(28.dp),
                color = MaterialTheme.colorScheme.primaryContainer
            ) {
                Icon(
                    Icons.Default.Person,
                    contentDescription = null,
                    modifier = Modifier.padding(12.dp),
                    tint = MaterialTheme.colorScheme.onPrimaryContainer
                )
            }
        },
        trailingContent = {
            Icon(Icons.Default.ChevronRight, contentDescription = null)
        },
        modifier = Modifier.clickable(onClick = onClick)
    )
}

@Composable
private fun GenreListItem(genre: Genre, onClick: () -> Unit) {
    ListItem(
        headlineContent = { Text(genre.displayName) },
        supportingContent = { Text("${genre.trackCount} tracks") },
        leadingContent = {
            Surface(
                modifier = Modifier.size(56.dp),
                shape = RoundedCornerShape(8.dp),
                color = MaterialTheme.colorScheme.tertiaryContainer
            ) {
                Icon(
                    Icons.Default.Category,
                    contentDescription = null,
                    modifier = Modifier.padding(12.dp),
                    tint = MaterialTheme.colorScheme.onTertiaryContainer
                )
            }
        },
        trailingContent = {
            Icon(Icons.Default.ChevronRight, contentDescription = null)
        },
        modifier = Modifier.clickable(onClick = onClick)
    )
}
