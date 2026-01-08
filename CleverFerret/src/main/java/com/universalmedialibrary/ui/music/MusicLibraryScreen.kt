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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun PlaylistsTab(
    playlists: List<PlaylistSummary>,
    onCreatePlaylist: (String) -> Unit,
    onPlayPlaylist: (Long) -> Unit,
    onShufflePlaylist: (Long) -> Unit,
    onQueuePlaylist: (Long, Boolean) -> Unit,
    onRenamePlaylist: (Long, String) -> Unit,
    onDeletePlaylist: (Long) -> Unit
) {
    var showCreateDialog by remember { mutableStateOf(false) }
    var showRenameDialog by remember { mutableStateOf<PlaylistSummary?>(null) }
    var showDeleteDialog by remember { mutableStateOf<PlaylistSummary?>(null) }
    var playlistNameInput by remember { mutableStateOf("") }
    var expandedMenuId by remember { mutableStateOf<Long?>(null) }

    Box(modifier = Modifier.fillMaxSize()) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Playlists",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.SemiBold
                )
                ExtendedFloatingActionButton(
                    onClick = {
                        playlistNameInput = ""
                        showCreateDialog = true
                    }
                ) {
                    Icon(Icons.Default.Add, contentDescription = "Create playlist")
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("New Playlist")
                }
            }

            if (playlists.isEmpty()) {
                Surface(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(top = 24.dp),
                    tonalElevation = 2.dp,
                    shape = RoundedCornerShape(16.dp)
                ) {
                    Column(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(24.dp),
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        Icon(
                            Icons.Default.PlaylistPlay,
                            contentDescription = "No playlists",
                            modifier = Modifier.size(72.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Text(
                            "No playlists yet",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.SemiBold
                        )
                        Text(
                            "Create your first playlist to start organising favorite tracks and moods.",
                            style = MaterialTheme.typography.bodyMedium,
                            textAlign = TextAlign.Center,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        OutlinedButton(onClick = { showCreateDialog = true }) {
                            Icon(Icons.Default.Add, contentDescription = "Create playlist")
                            Spacer(Modifier.width(8.dp))
                            Text("Create Playlist")
                        }
                    }
                }
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(12.dp),
                    contentPadding = PaddingValues(bottom = 96.dp)
                ) {
                    items(playlists) { summary ->
                        PlaylistCard(
                            summary = summary,
                            expandedMenuId = expandedMenuId,
                            onExpandMenu = { expandedMenuId = it },
                            onDismissMenu = { expandedMenuId = null },
                            onPlay = { onPlayPlaylist(summary.id) },
                            onShuffle = { onShufflePlaylist(summary.id) },
                            onQueue = { playNext -> onQueuePlaylist(summary.id, playNext) },
                            onRename = {
                                playlistNameInput = summary.name
                                showRenameDialog = summary
                                expandedMenuId = null
                            },
                            onDelete = {
                                showDeleteDialog = summary
                                expandedMenuId = null
                            }
                        )
                    }
                }
            }
        }

        if (showCreateDialog) {
            PlaylistNameDialog(
                title = "Create Playlist",
                initialValue = playlistNameInput,
                onConfirm = { name ->
                    onCreatePlaylist(name.trim())
                    playlistNameInput = ""
                    showCreateDialog = false
                },
                onDismiss = { showCreateDialog = false }
            )
        }

        showRenameDialog?.let { summary ->
            PlaylistNameDialog(
                title = "Rename Playlist",
                initialValue = summary.name,
                onConfirm = { newName ->
                    onRenamePlaylist(summary.id, newName.trim())
                    playlistNameInput = ""
                    showRenameDialog = null
                },
                onDismiss = { showRenameDialog = null }
            )
        }

        showDeleteDialog?.let { summary ->
            AlertDialog(
                onDismissRequest = { showDeleteDialog = null },
                title = { Text("Delete Playlist") },
                text = {
                    Text("Are you sure you want to delete \"${summary.name}\"? This cannot be undone.")
                },
                confirmButton = {
                    TextButton(onClick = {
                        onDeletePlaylist(summary.id)
                        showDeleteDialog = null
                    }) {
                        Text("Delete")
                    }
                },
                dismissButton = {
                    TextButton(onClick = { showDeleteDialog = null }) {
                        Text("Cancel")
                    }
                }
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun PlaylistNameDialog(
    title: String,
    initialValue: String,
    onConfirm: (String) -> Unit,
    onDismiss: () -> Unit
) {
    var text by remember { mutableStateOf(initialValue) }
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text(title) },
        text = {
            OutlinedTextField(
                value = text,
                onValueChange = { text = it },
                label = { Text("Playlist Name") },
                singleLine = true
            )
        },
        confirmButton = {
            val enabled = text.isNotBlank()
            TextButton(
                onClick = {
                    if (enabled) {
                        onConfirm(text)
                        onDismiss()
                    }
                },
                enabled = enabled
            ) {
                Text("Save")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun PlaylistCard(
    summary: PlaylistSummary,
    expandedMenuId: Long?,
    onExpandMenu: (Long?) -> Unit,
    onDismissMenu: () -> Unit,
    onPlay: () -> Unit,
    onShuffle: () -> Unit,
    onQueue: (Boolean) -> Unit,
    onRename: () -> Unit,
    onDelete: () -> Unit
) {
    val updatedText = remember(summary.updatedAt) {
        DateUtils.getRelativeTimeSpanString(
            summary.updatedAt,
            System.currentTimeMillis(),
            DateUtils.MINUTE_IN_MILLIS
        ).toString()
    }

    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(16.dp),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = summary.name,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    val description = summary.description?.takeIf { it.isNotBlank() }
                    if (description != null) {
                        Text(
                            text = description,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            maxLines = 2,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                }

                Row(verticalAlignment = Alignment.CenterVertically) {
                    IconButton(onClick = onPlay) {
                        Icon(Icons.Default.PlayArrow, contentDescription = "Play playlist")
                    }
                    IconButton(onClick = onShuffle) {
                        Icon(Icons.Default.Shuffle, contentDescription = "Shuffle playlist")
                    }
                    Box {
                        IconButton(onClick = { onExpandMenu(summary.id) }) {
                            Icon(Icons.Default.MoreVert, contentDescription = "Playlist actions")
                        }
                        DropdownMenu(
                            expanded = expandedMenuId == summary.id,
                            onDismissRequest = onDismissMenu
                        ) {
                            DropdownMenuItem(
                                text = { Text("Add to Queue") },
                                onClick = {
                                    onQueue(false)
                                    onDismissMenu()
                                },
                                leadingIcon = { Icon(Icons.Default.QueueMusic, contentDescription = "Music queue") }
                            )
                            DropdownMenuItem(
                                text = { Text("Play Next") },
                                onClick = {
                                    onQueue(true)
                                    onDismissMenu()
                                },
                                leadingIcon = { Icon(Icons.Default.SkipNext, contentDescription = "Play next") }
                            )
                            DropdownMenuItem(
                                text = { Text("Rename") },
                                onClick = onRename,
                                leadingIcon = { Icon(Icons.Default.Edit, contentDescription = "Rename") }
                            )
                            DropdownMenuItem(
                                text = { Text("Delete") },
                                onClick = onDelete,
                                leadingIcon = { Icon(Icons.Default.Delete, contentDescription = "Delete") }
                            )
                        }
                    }
                }
            }

            Spacer(modifier = Modifier.height(12.dp))

            Row(
                horizontalArrangement = Arrangement.spacedBy(16.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                AssistChip(
                    onClick = {},
                    leadingIcon = {
                        Icon(
                            Icons.Default.MusicNote,
                            contentDescription = "Track count",
                            modifier = Modifier.size(16.dp)
                        )
                    },
                    label = { Text("${summary.trackCount} tracks") }
                )
                AssistChip(
                    onClick = {},
                    leadingIcon = {
                        Icon(
                            Icons.Default.AccessTime,
                            contentDescription = "Last updated",
                            modifier = Modifier.size(16.dp)
                        )
                    },
                    label = { Text("Updated $updatedText") }
                )
            }
        }
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
                val albumArt = track.albumArtUri
                if (albumArt != null) {
                    AsyncImage(
                    
                        model = albumArt,
                        contentDescription = "${track.displayAlbum} artwork",
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    Icon(
                        Icons.Default.MusicNote,
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
internal fun TrackListItem(track: Track, compact: Boolean = false, onClick: () -> Unit) {
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
                val albumArt = track.albumArtUri
                if (albumArt != null) {
                    AsyncImage(
                    
                        model = albumArt,
                        contentDescription = "${track.displayAlbum} artwork",
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    Icon(
                        Icons.Default.MusicNote,
                        contentDescription = null,
                        modifier = Modifier.padding(8.dp)
                    )
                }
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
                        contentDescription = "Media image",
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
                    contentDescription = null,
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
