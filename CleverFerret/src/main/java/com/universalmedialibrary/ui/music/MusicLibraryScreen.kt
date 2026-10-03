package com.universalmedialibrary.ui.music

import android.text.format.DateUtils
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
import androidx.compose.material.icons.automirrored.filled.Sort
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
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
                                Icon(Icons.AutoMirrored.Filled.Sort, "Sort")
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
                                val hasFilters = state.selectedGenre != null || 
                                    state.selectedArtist != null || 
                                    state.selectedAlbum != null
                                    
                                BadgedBox(
                                    badge = {
                                        if (hasFilters) {
                                            Badge(
                                                containerColor = MaterialTheme.colorScheme.primary
                                            )
                                        }
                                    }
                                ) {
                                    Icon(
                                        Icons.Default.FilterList, 
                                        contentDescription = "Filter",
                                        tint = if (hasFilters) MaterialTheme.colorScheme.primary else LocalContentColor.current
                                    )
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
            HivefyPromoCard(
                onExplore = { navController.navigate("hivefy_music") }
            )

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
            Box(modifier = Modifier.fillMaxSize()) {
                if (state.isLoading) {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CircularProgressIndicator()
                    }
                } else {
                    when (state.currentTab) {
                        MusicTab.SONGS -> SongsTab(state, viewModel, navController)
                        MusicTab.ALBUMS -> AlbumsTab(state, viewModel, navController)
                        MusicTab.ARTISTS -> ArtistsTab(state, viewModel, navController)
                        MusicTab.GENRES -> GenresTab(state, viewModel, navController)
                        MusicTab.PLAYLISTS -> PlaylistsTab(
                            playlists = state.playlists,
                            onCreatePlaylist = viewModel::createPlaylist,
                            onPlayPlaylist = { playlistId -> viewModel.playPlaylist(playlistId) },
                            onShufflePlaylist = { playlistId -> viewModel.playPlaylist(playlistId, shuffle = true) },
                            onQueuePlaylist = viewModel::queuePlaylist,
                            onRenamePlaylist = viewModel::renamePlaylist,
                            onDeletePlaylist = viewModel::deletePlaylist
                        )
                    }
                }
                
                // Mini player at bottom
                Column(
                    modifier = Modifier
                        .align(Alignment.BottomCenter)
                        .fillMaxWidth()
                ) {
                    MiniPlayer(
                        onClick = { navController.navigate("music_player") }
                    )
                }
                
                // Now Playing FAB
                NowPlayingFab(
                    onClick = { navController.navigate("music_player") },
                    modifier = Modifier
                        .align(Alignment.BottomEnd)
                        .padding(16.dp)
                        .padding(bottom = 72.dp) // Above mini player
                )
            }
        }
    }
}

@Composable
private fun HivefyPromoCard(onExplore: () -> Unit) {
    ElevatedCard(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp, vertical = 8.dp),
        onClick = onExplore
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(
                modifier = Modifier.weight(1f),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                Text(
                    text = "Hivefy x CleverFerret",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
                Text(
                    text = "Stream trending Saavn playlists and albums directly in the app.",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            AssistChip(
                onClick = onExplore,
                label = { Text("Explore") }
            )
        }
    }
}

@Composable
private fun SongsTab(state: MusicLibraryUiState, viewModel: MusicLibraryViewModel, navController: androidx.navigation.NavController) {
    when (state.viewMode) {
        MusicViewMode.GRID -> {
            LazyVerticalGrid(
                modifier = Modifier.fillMaxSize(),
                columns = GridCells.Adaptive(minSize = 160.dp),
                contentPadding = PaddingValues(start = 16.dp, end = 16.dp, top = 16.dp, bottom = 160.dp),
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                items(state.tracks) { track ->
                    TrackGridItem(track = track, onClick = { 
                        viewModel.playTrack(track)
                        navController.navigate("music_player")
                    })
                }
            }
        }
        MusicViewMode.LIST, MusicViewMode.COMPACT -> {
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(start = 8.dp, end = 8.dp, top = 8.dp, bottom = 160.dp),
                verticalArrangement = Arrangement.spacedBy(2.dp)
            ) {
                items(state.tracks) { track ->
                    TrackListItem(
                        track = track,
                        compact = state.viewMode == MusicViewMode.COMPACT,
                        onClick = { 
                            viewModel.playTrack(track)
                            navController.navigate("music_player")
                        }
                    )
                }
            }
        }
    }
}

@Composable
private fun AlbumsTab(state: MusicLibraryUiState, viewModel: MusicLibraryViewModel, navController: androidx.navigation.NavController) {
    LazyVerticalGrid(
        modifier = Modifier.fillMaxSize(),
        columns = GridCells.Adaptive(minSize = 160.dp),
        contentPadding = PaddingValues(start = 16.dp, end = 16.dp, top = 16.dp, bottom = 160.dp),
        horizontalArrangement = Arrangement.spacedBy(12.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        items(state.albums) { album ->
            AlbumGridItem(album = album, onClick = { 
                navController.navigate("album/${album.name}")
            })
        }
    }
}

@Composable
private fun ArtistsTab(state: MusicLibraryUiState, viewModel: MusicLibraryViewModel, navController: androidx.navigation.NavController) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(start = 16.dp, end = 16.dp, top = 16.dp, bottom = 160.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        items(state.artists) { artist ->
            ArtistListItem(artist = artist, onClick = { 
                navController.navigate("artist/${artist.name}")
            })
        }
    }
}

@Composable
private fun GenresTab(state: MusicLibraryUiState, viewModel: MusicLibraryViewModel, navController: androidx.navigation.NavController) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(start = 16.dp, end = 16.dp, top = 16.dp, bottom = 160.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        items(state.genres) { genre ->
            GenreListItem(genre = genre, onClick = { 
                navController.navigate("genre/${genre.name}")
            })
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
                    contentDescription = "Media image",
                    modifier = Modifier.padding(12.dp),
                    tint = MaterialTheme.colorScheme.onPrimaryContainer
                )
            }
        },
        trailingContent = {
            Icon(Icons.Default.ChevronRight, contentDescription = "Navigate")
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
                    contentDescription = "Media image",
                    modifier = Modifier.padding(12.dp),
                    tint = MaterialTheme.colorScheme.onTertiaryContainer
                )
            }
        },
        trailingContent = {
            Icon(Icons.Default.ChevronRight, contentDescription = "Navigate")
        },
        modifier = Modifier.clickable(onClick = onClick)
    )
}
