package com.universalmedialibrary.ui.music

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.MusicRepository
import com.universalmedialibrary.services.music.ArtistInfo
import com.universalmedialibrary.services.music.ArtistInfoService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ArtistDetailScreen(
    artistName: String,
    onNavigateBack: () -> Unit,
    onNavigateToPlayer: () -> Unit,
    onNavigateToAlbum: (String) -> Unit = {},
    viewModel: ArtistDetailViewModel = hiltViewModel()
) {
    val artist by viewModel.artist.collectAsState()
    val albums by viewModel.albums.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()
    val artistInfo by viewModel.artistInfo.collectAsState()
    val infoLoading by viewModel.infoLoading.collectAsState()

    LaunchedEffect(artistName) {
        viewModel.loadArtist(artistName)
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Artist") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(
                        onClick = { viewModel.refreshArtistInfo() },
                        enabled = !infoLoading
                    ) {
                        if (infoLoading) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(24.dp),
                                strokeWidth = 2.dp
                            )
                        } else {
                            Icon(
                                Icons.Default.Refresh,
                                "Refresh Artist Info",
                                tint = MaterialTheme.colorScheme.primary
                            )
                        }
                    }
                }
            )
        }
    ) { padding ->
        if (isLoading) {
            Box(
                modifier = Modifier.fillMaxSize().padding(padding),
                contentAlignment = Alignment.Center
            ) {
                CircularProgressIndicator()
            }
        } else {
            artist?.let { artistData ->
                LazyColumn(
                    modifier = Modifier.fillMaxSize().padding(padding),
                    contentPadding = PaddingValues(16.dp),
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    // Artist header
                    item {
                        Column(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Surface(
                                modifier = Modifier.size(120.dp),
                                shape = RoundedCornerShape(60.dp),
                                color = MaterialTheme.colorScheme.primaryContainer
                            ) {
                                Icon(
                                    Icons.Default.Person,
                                    contentDescription = null,
                                    modifier = Modifier.padding(24.dp),
                                    tint = MaterialTheme.colorScheme.onPrimaryContainer
                                )
                            }
                            
                            Text(
                                text = artistData.displayName,
                                style = MaterialTheme.typography.headlineMedium,
                                fontWeight = FontWeight.Bold
                            )
                            Text(
                                text = "${artistData.albumCount} albums • ${artistData.trackCount} tracks",
                                style = MaterialTheme.typography.bodyLarge,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }

                    // Artist enriched info
                    artistInfo?.let { info ->
                        if (info.hasDetailedInfo) {
                            item {
                                ArtistInfoCard(info = info)
                            }
                        }
                    }

                    // Action buttons
                    item {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Button(
                                onClick = {
                                    viewModel.playArtist(artistData)
                                    onNavigateToPlayer()
                                },
                                modifier = Modifier.weight(1f)
                            ) {
                                Icon(Icons.Default.PlayArrow, null)
                                Spacer(Modifier.width(8.dp))
                                Text("Play All")
                            }
                            OutlinedButton(
                                onClick = {
                                    viewModel.shuffleArtist(artistData)
                                    onNavigateToPlayer()
                                },
                                modifier = Modifier.weight(1f)
                            ) {
                                Icon(Icons.Default.Shuffle, null)
                                Spacer(Modifier.width(8.dp))
                                Text("Shuffle")
                            }
                        }
                    }

                    item {
                        HorizontalDivider()
                    }

                    // Albums section
                    item {
                        Text(
                            text = "Albums",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                    }

                    items(albums) { album ->
                        AlbumListItem(
                            album = album,
                            onClick = { onNavigateToAlbum(album.name) }
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun AlbumListItem(album: Album, onClick: () -> Unit) {
    ListItem(
        headlineContent = { Text(album.displayName) },
        supportingContent = {
            Text("${album.year ?: ""} • ${album.trackCount} tracks")
        },
        leadingContent = {
            Surface(
                modifier = Modifier.size(56.dp),
                shape = RoundedCornerShape(4.dp),
                color = MaterialTheme.colorScheme.surfaceVariant
            ) {
                Icon(
                    Icons.Default.Album,
                    contentDescription = null,
                    modifier = Modifier.padding(12.dp)
                )
            }
        },
        trailingContent = {
            Icon(Icons.Default.ChevronRight, null)
        },
        modifier = Modifier.clickable(onClick = onClick)
    )
}

@Composable
private fun ArtistInfoCard(info: ArtistInfo) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.secondaryContainer
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            // Years active
            if (info.startYear != "Unknown") {
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        Icons.Default.CalendarMonth,
                        contentDescription = null,
                        modifier = Modifier.size(20.dp),
                        tint = MaterialTheme.colorScheme.onSecondaryContainer
                    )
                    Text(
                        text = info.yearsActive,
                        style = MaterialTheme.typography.bodyMedium,
                        fontWeight = FontWeight.SemiBold
                    )
                }
            }

            // Origin
            if (info.origin.isNotBlank()) {
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        Icons.Default.Place,
                        contentDescription = null,
                        modifier = Modifier.size(20.dp),
                        tint = MaterialTheme.colorScheme.onSecondaryContainer
                    )
                    Text(
                        text = info.origin,
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
            }

            // Genres
            if (info.genres.isNotEmpty()) {
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        Icons.Default.MusicNote,
                        contentDescription = null,
                        modifier = Modifier.size(20.dp),
                        tint = MaterialTheme.colorScheme.onSecondaryContainer
                    )
                    Text(
                        text = info.genres.joinToString(", "),
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
            }

            HorizontalDivider()

            // Biography
            if (info.biography.isNotBlank()) {
                Text(
                    text = info.biography,
                    style = MaterialTheme.typography.bodyMedium,
                    lineHeight = MaterialTheme.typography.bodyMedium.lineHeight
                )
            }

            // Interesting facts
            if (info.facts.isNotEmpty()) {
                HorizontalDivider()
                Text(
                    text = "Interesting Facts",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.primary
                )
                info.facts.forEachIndexed { index, fact ->
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        modifier = Modifier.padding(top = if (index == 0) 0.dp else 4.dp)
                    ) {
                        Text(
                            text = "•",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.primary
                        )
                        Text(
                            text = fact,
                            style = MaterialTheme.typography.bodyMedium,
                            modifier = Modifier.weight(1f)
                        )
                    }
                }
            }

            // Notable works
            if (info.notableWorks.isNotEmpty()) {
                HorizontalDivider()
                Text(
                    text = "Notable Works",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.primary
                )
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        Icons.Default.Star,
                        contentDescription = null,
                        modifier = Modifier.size(16.dp),
                        tint = MaterialTheme.colorScheme.primary
                    )
                    Text(
                        text = info.notableWorks.take(5).joinToString(", "),
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            // Confidence indicator (only for low confidence)
            if (info.confidence < 0.7f) {
                Text(
                    text = "ℹ️ Some information may be incomplete or uncertain",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    fontStyle = androidx.compose.ui.text.font.FontStyle.Italic
                )
            }
        }
    }
}

@HiltViewModel
class ArtistDetailViewModel @Inject constructor(
    private val musicRepository: MusicRepository,
    private val musicPlayerService: com.universalmedialibrary.services.music.AdvancedMusicPlayerService,
    private val artistInfoService: ArtistInfoService
) : ViewModel() {

    private val _artist = MutableStateFlow<Artist?>(null)
    val artist: StateFlow<Artist?> = _artist.asStateFlow()

    private val _albums = MutableStateFlow<List<Album>>(emptyList())
    val albums: StateFlow<List<Album>> = _albums.asStateFlow()

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    private val _artistInfo = MutableStateFlow<ArtistInfo?>(null)
    val artistInfo: StateFlow<ArtistInfo?> = _artistInfo.asStateFlow()

    private val _infoLoading = MutableStateFlow(false)
    val infoLoading: StateFlow<Boolean> = _infoLoading.asStateFlow()

    private var currentArtistName: String? = null

    fun loadArtist(artistName: String) {
        currentArtistName = artistName
        viewModelScope.launch {
            _isLoading.value = true
            _artist.value = musicRepository.getArtist(artistName)
            _albums.value = musicRepository.getAlbumsByArtist(artistName)
            _isLoading.value = false
            
            // Load enriched artist info from Gemini
            loadArtistInfo(artistName)
        }
    }

    private suspend fun loadArtistInfo(artistName: String) {
        if (!artistInfoService.isInitialized()) {
            return
        }

        _infoLoading.value = true
        try {
            val result = artistInfoService.getArtistInfo(artistName)
            if (result.success) {
                _artistInfo.value = result.artistInfo
            }
        } catch (e: Exception) {
            // Silently fail - artist info is optional enhancement
        } finally {
            _infoLoading.value = false
        }
    }

    fun refreshArtistInfo() {
        val artistName = currentArtistName ?: return
        viewModelScope.launch {
            _infoLoading.value = true
            try {
                // Fetch with force refresh (bypasses cache)
                val result = artistInfoService.getArtistInfo(artistName, forceRefresh = true)
                if (result.success) {
                    _artistInfo.value = result.artistInfo
                }
            } catch (e: Exception) {
                // Silently fail - artist info is optional enhancement
            } finally {
                _infoLoading.value = false
            }
        }
    }

    fun playArtist(artist: Artist) {
        viewModelScope.launch {
            val tracks = artist.tracks
            if (tracks.isNotEmpty()) {
                val firstTrack = tracks.first()
                musicPlayerService.playTrackFromUri(
                    uri = firstTrack.uri.toString(),
                    title = firstTrack.title ?: "Unknown",
                    artist = firstTrack.artist,
                    album = firstTrack.album,
                    duration = firstTrack.duration,
                    albumArtUrl = firstTrack.albumArtUri?.toString()
                )
            }
        }
    }

    fun shuffleArtist(artist: Artist) {
        viewModelScope.launch {
            val tracks = artist.tracks.shuffled()
            if (tracks.isNotEmpty()) {
                val firstTrack = tracks.first()
                musicPlayerService.playTrackFromUri(
                    uri = firstTrack.uri.toString(),
                    title = firstTrack.title ?: "Unknown",
                    artist = firstTrack.artist,
                    album = firstTrack.album,
                    duration = firstTrack.duration,
                    albumArtUrl = firstTrack.albumArtUri?.toString()
                )
            }
        }
    }
}
