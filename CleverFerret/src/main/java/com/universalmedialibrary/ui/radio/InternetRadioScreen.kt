package com.universalmedialibrary.ui.radio

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
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
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Internet Radio screen for streaming online radio stations
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun InternetRadioScreen(
    onNavigateBack: () -> Unit,
    viewModel: InternetRadioViewModel = hiltViewModel()
) {
    val stations by viewModel.stations.collectAsState()
    val currentStation by viewModel.currentStation.collectAsState()
    val isPlaying by viewModel.isPlaying.collectAsState()
    var searchQuery by remember { mutableStateOf("") }
    var selectedGenre by remember { mutableStateOf("All") }
    var showAddStationDialog by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Internet Radio") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { showAddStationDialog = true }) {
                        Icon(Icons.Default.Add, "Add Station")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Search Bar
            OutlinedTextField(
                value = searchQuery,
                onValueChange = { searchQuery = it },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                placeholder = { Text("Search stations...") },
                leadingIcon = {
                    Icon(Icons.Default.Search, "Search")
                },
                singleLine = true,
                shape = RoundedCornerShape(24.dp)
            )

            // Current Playing
            currentStation?.let { station ->
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp, vertical = 8.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer
                    )
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column(modifier = Modifier.weight(1f)) {
                            Text(
                                "Now Playing",
                                style = MaterialTheme.typography.labelSmall,
                                color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                            )
                            Text(
                                station.name,
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                            Text(
                                station.genre,
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                            )
                        }
                        
                        FilledIconButton(
                            onClick = { viewModel.togglePlayback() }
                        ) {
                            Icon(
                                if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                                if (isPlaying) "Pause" else "Play"
                            )
                        }
                    }
                }
            }

            // Genre Tabs - Dynamically generated from available stations
            val availableGenres by viewModel.availableGenres.collectAsState()
            val genres = listOf("All") + availableGenres.sorted()
            ScrollableTabRow(
                selectedTabIndex = genres.indexOf(selectedGenre).coerceAtLeast(0),
                modifier = Modifier.fillMaxWidth(),
                edgePadding = 16.dp
            ) {
                genres.forEach { genre ->
                    Tab(
                        selected = selectedGenre == genre,
                        onClick = { selectedGenre = genre },
                        text = { Text(genre) }
                    )
                }
            }

            // Station List
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(
                    stations.filter {
                        val matchesSearch = searchQuery.isEmpty() || 
                            it.name.contains(searchQuery, ignoreCase = true) ||
                            it.genre.contains(searchQuery, ignoreCase = true)
                        val matchesGenre = selectedGenre == "All" || it.genre.equals(selectedGenre, ignoreCase = true)
                        matchesSearch && matchesGenre
                    }
                ) { station ->
                    InternetRadioStationCard(
                        station = station,
                        isPlaying = currentStation == station && isPlaying,
                        onClick = { viewModel.selectStation(station) }
                    )
                }
            }
        }
    }
    
    // Add Station Dialog
    if (showAddStationDialog) {
        AddStationDialog(
            onDismiss = { showAddStationDialog = false },
            onAdd = { name, url, genre ->
                viewModel.addCustomStation(name, url, genre)
                showAddStationDialog = false
            },
            availableGenres = availableGenres
        )
    }
}

@Composable
private fun InternetRadioStationCard(
    station: InternetRadioStation,
    isPlaying: Boolean,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = if (isPlaying)
                MaterialTheme.colorScheme.secondaryContainer
            else
                MaterialTheme.colorScheme.surface
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    station.name,
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold
                )
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        station.genre,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Text("•", style = MaterialTheme.typography.bodySmall)
                    Text(
                        station.bitrate,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
            
            if (isPlaying) {
                Icon(
                    Icons.Default.GraphicEq,
                    "Playing",
                    tint = MaterialTheme.colorScheme.primary
                )
            } else {
                Icon(
                    Icons.Default.PlayArrow,
                    "Play",
                    tint = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

data class InternetRadioStation(
    val id: String,
    val name: String,
    val url: String,
    val genre: String,
    val bitrate: String,
    val country: String = ""
)

@HiltViewModel
class InternetRadioViewModel @Inject constructor(
    private val musicPlayerService: com.universalmedialibrary.services.music.AdvancedMusicPlayerService
) : ViewModel() {

    private val _stations = MutableStateFlow<List<InternetRadioStation>>(emptyList())
    val stations: StateFlow<List<InternetRadioStation>> = _stations.asStateFlow()

    private val _currentStation = MutableStateFlow<InternetRadioStation?>(null)
    val currentStation: StateFlow<InternetRadioStation?> = _currentStation.asStateFlow()

    val playbackState = musicPlayerService.playbackState
    val isPlaying: StateFlow<Boolean> = playbackState.map { it.isPlaying }.stateIn(
        scope = viewModelScope,
        started = kotlinx.coroutines.flow.SharingStarted.WhileSubscribed(5000),
        initialValue = false
    )

    // Dynamically extract available genres from all stations
    val availableGenres: StateFlow<List<String>> = _stations.map { stationList ->
        stationList.map { it.genre }.distinct().filter { it.isNotBlank() }
    }.stateIn(
        scope = viewModelScope,
        started = kotlinx.coroutines.flow.SharingStarted.WhileSubscribed(5000),
        initialValue = emptyList()
    )

    init {
        loadSampleStations()
    }

    private fun loadSampleStations() {
        // Curated stations from https://github.com/mikepierce/internet-radio-streams
        _stations.value = listOf(
            // Electronic & EDM
            InternetRadioStation("1", "313.FM Detroit", "http://icecast.ofdoom.com:8000/burst.mp3", "Electronic", "128 kbps"),
            InternetRadioStation("4", "AH.FM - EDM Radio", "http://nl.ah.fm:8000/live", "Electronic", "128 kbps"),
            InternetRadioStation("31", "Dogglounge Deep House", "http://dogglounge.com:8000", "Electronic", "128 kbps"),
            InternetRadioStation("45", "Frisky Chill", "https://chill.friskyradio.com", "Electronic", "128 kbps"),
            InternetRadioStation("46", "Frisky Deep", "https://deep.friskyradio.com", "Electronic", "128 kbps"),
            InternetRadioStation("47", "Frisky Radio", "https://stream.friskyradio.com", "Electronic", "128 kbps"),
            
            // Ambient & Chill
            InternetRadioStation("2", "9128.live Ambient", "http://streams.radio.co:80/s0aa1e6f4a/listen", "Ambient", "128 kbps"),
            InternetRadioStation("3", "A.M. Ambient", "http://radio.stereoscenic.com/ama-h", "Ambient", "128 kbps"),
            InternetRadioStation("16", "Ambient Sleeping Pill", "http://radio.stereoscenic.com/asp-h", "Ambient", "128 kbps"),
            InternetRadioStation("24", "Bluemars - Cryosleep", "http://50.116.12.253:8000/cryosleep", "Ambient", "128 kbps"),
            InternetRadioStation("25", "Bluemars - Voices", "http://50.116.12.253:8000/voicesfromwithin", "Ambient", "128 kbps"),
            InternetRadioStation("26", "Bluemars", "http://50.116.12.253:8000/bluemars", "Ambient", "128 kbps"),
            InternetRadioStation("29", "Dark Ambient Radio", "http://s3.viastreaming.net:8835/", "Ambient", "128 kbps"),
            
            // BBC Radio
            InternetRadioStation("17", "BBC Radio 1", "http://as-hls-ww-live.akamaized.net/pool_01505109/live/ww/bbc_radio_one/bbc_radio_one.isml/bbc_radio_one-audio%3d96000.norewind.m3u8", "Music", "96 kbps"),
            InternetRadioStation("18", "BBC Radio 1Xtra", "http://as-hls-ww-live.akamaized.net/pool_92079267/live/ww/bbc_1xtra/bbc_1xtra.isml/bbc_1xtra-audio%3d96000.norewind.m3u8", "Music", "96 kbps"),
            InternetRadioStation("19", "BBC Radio 1Dance", "http://as-hls-ww-live.akamaized.net/pool_62063831/live/ww/bbc_radio_one_dance/bbc_radio_one_dance.isml/bbc_radio_one_dance-audio%3d96000.norewind.m3u8", "Music", "96 kbps"),
            InternetRadioStation("20", "BBC Radio 2", "http://as-hls-ww-live.akamaized.net/pool_74208725/live/ww/bbc_radio_two/bbc_radio_two.isml/bbc_radio_two-audio%3d96000.norewind.m3u8", "Music", "96 kbps"),
            InternetRadioStation("21", "BBC Radio 6 Music", "http://as-hls-ww-live.akamaized.net/pool_81827798/live/ww/bbc_6music/bbc_6music.isml/bbc_6music-audio%3d96000.norewind.m3u8", "Rock", "96 kbps"),
            InternetRadioStation("22", "BBC World Service", "http://stream.live.vc.bbcmedia.co.uk/bbc_world_service", "News", "128 kbps"),
            
            // French Radio
            InternetRadioStation("33", "FIP", "http://direct.fipradio.fr/live/fip-midfi.mp3", "Music", "128 kbps"),
            InternetRadioStation("35", "FIP Jazz", "http://direct.fipradio.fr/live/fip-webradio2.mp3", "Jazz", "128 kbps"),
            InternetRadioStation("36", "FIP Groove", "http://direct.fipradio.fr/live/fip-webradio3.mp3", "Music", "128 kbps"),
            InternetRadioStation("43", "France Musique", "http://direct.francemusique.fr/live/francemusique-midfi.mp3", "Classical", "128 kbps"),
            
            // SomaFM Stations
            InternetRadioStation("71", "SomaFM - Groove Salad", "http://ice2.somafm.com/groovesalad-128-aac", "Ambient", "128 kbps"),
            InternetRadioStation("72", "SomaFM - Drone Zone", "http://ice2.somafm.com/dronezone-128-aac", "Ambient", "128 kbps"),
            InternetRadioStation("73", "SomaFM - Deep Space One", "http://ice2.somafm.com/deepspaceone-128-aac", "Ambient", "128 kbps"),
            InternetRadioStation("74", "SomaFM - Space Station", "http://ice2.somafm.com/spacestation-128-aac", "Ambient", "128 kbps"),
            InternetRadioStation("75", "SomaFM - Lush", "http://ice2.somafm.com/lush-128-aac", "Electronic", "128 kbps"),
            InternetRadioStation("76", "SomaFM - Illinois Street Lounge", "http://ice2.somafm.com/illstreet-128-aac", "Music", "128 kbps"),
            
            // Alternative & Indie
            InternetRadioStation("57", "KEXP Seattle", "http://live-mp3-128.kexp.org", "Rock", "128 kbps"),
            InternetRadioStation("32", "Dublab Los Angeles", "https://dublab.out.airtime.pro/dublab_a", "Music", "128 kbps"),
            InternetRadioStation("64", "NTS Radio 1", "http://stream-relay-geo.ntslive.net/stream", "Music", "128 kbps"),
            InternetRadioStation("65", "NTS Radio 2", "http://stream-relay-geo.ntslive.net/stream2", "Music", "128 kbps"),
            InternetRadioStation("67", "Newtown Radio", "https://streaming.radio.co/s0d090ee43/listen", "Music", "128 kbps"),
            
            // Specialty & Niche
            InternetRadioStation("23", "Badradio Phonk", "https://s2.radio.co/s2b2b68744/listen", "Hip Hop", "128 kbps"),
            InternetRadioStation("27", "Cashmere Radio", "https://cashmereradio.out.airtime.pro/cashmereradio_b", "Music", "128 kbps"),
            InternetRadioStation("61", "Kiosk Radio Brussels", "https://kioskradiobxl.out.airtime.pro/kioskradiobxl_b", "Music", "128 kbps"),
            InternetRadioStation("63", "NASA Third Rock Radio", "http://rfcm.streamguys1.com/thirdrock-icy", "Music", "128 kbps"),
            InternetRadioStation("68", "Nightwave Plaza", "http://radio.plaza.one/ogg", "Music", "128 kbps"),
            InternetRadioStation("70", "Radio Paradise", "http://stream.radioparadise.com/global-192", "Music", "192 kbps"),
            InternetRadioStation("69", "Radio Caroline", "http://78.129.202.10:8030/", "Music", "128 kbps"),
            InternetRadioStation("79", "The Lot Radio NYC", "https://thelot.out.airtime.pro/thelot_a", "Music", "128 kbps"),
            InternetRadioStation("80", "Worldwide FM", "https://worldwidefm.out.airtime.pro/worldwidefm_a", "Music", "128 kbps")
        )
    }

    fun selectStation(station: InternetRadioStation) {
        viewModelScope.launch {
            try {
                _currentStation.value = station
                // Play radio station via music player service
                musicPlayerService.playTrackFromUri(
                    uri = station.url,
                    title = station.name,
                    artist = "Internet Radio",
                    album = station.genre,
                    duration = 0L, // Streams have no duration
                    albumArtUrl = null
                )
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun togglePlayback() {
        if (playbackState.value.isPlaying) {
            musicPlayerService.pause()
        } else {
            musicPlayerService.play()
        }
    }
    
    fun addCustomStation(name: String, url: String, genre: String) {
        val newStation = InternetRadioStation(
            id = (stations.value.size + 1).toString(),
            name = name,
            url = url,
            genre = genre,
            bitrate = "128 kbps"
        )
        _stations.value = _stations.value + newStation
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun AddStationDialog(
    onDismiss: () -> Unit,
    onAdd: (String, String, String) -> Unit,
    availableGenres: List<String> = emptyList()
) {
    var name by remember { mutableStateOf("") }
    var url by remember { mutableStateOf("") }
    var genre by remember { mutableStateOf("") }
    var showGenreDropdown by remember { mutableStateOf(false) }
    
    // Suggest genres based on input
    val genreSuggestions = remember(genre, availableGenres) {
        if (genre.isBlank()) {
            availableGenres
        } else {
            availableGenres.filter { it.contains(genre, ignoreCase = true) }
        }
    }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add Radio Station") },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Station Name") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                OutlinedTextField(
                    value = url,
                    onValueChange = { url = it },
                    label = { Text("Stream URL") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true,
                    placeholder = { Text("https://...") }
                )
                
                // Genre field with dropdown suggestions
                ExposedDropdownMenuBox(
                    expanded = showGenreDropdown && genreSuggestions.isNotEmpty(),
                    onExpandedChange = { showGenreDropdown = it }
                ) {
                    OutlinedTextField(
                        value = genre,
                        onValueChange = { 
                            genre = it
                            showGenreDropdown = true
                        },
                        label = { Text("Genre") },
                        modifier = Modifier
                            .fillMaxWidth()
                            .menuAnchor(),
                        singleLine = true,
                        placeholder = { Text("Select or type genre...") },
                        trailingIcon = {
                            ExposedDropdownMenuDefaults.TrailingIcon(expanded = showGenreDropdown)
                        }
                    )
                    
                    if (genreSuggestions.isNotEmpty()) {
                        ExposedDropdownMenu(
                            expanded = showGenreDropdown,
                            onDismissRequest = { showGenreDropdown = false }
                        ) {
                            genreSuggestions.forEach { suggestion ->
                                DropdownMenuItem(
                                    text = { Text(suggestion) },
                                    onClick = {
                                        genre = suggestion
                                        showGenreDropdown = false
                                    }
                                )
                            }
                            // Option to add custom genre
                            if (genre.isNotBlank() && genre !in availableGenres) {
                                HorizontalDivider()
                                DropdownMenuItem(
                                    text = { Text("Add \"$genre\" as new genre") },
                                    onClick = {
                                        showGenreDropdown = false
                                    },
                                    leadingIcon = {
                                        Icon(Icons.Default.Add, "Add")
                                    }
                                )
                            }
                        }
                    }
                }
                
                Text(
                    text = "Tip: Choose an existing genre or create a new one",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    if (name.isNotBlank() && url.isNotBlank()) {
                        onAdd(name, url, genre.ifBlank { "Other" })
                        onDismiss()
                    }
                },
                enabled = name.isNotBlank() && url.isNotBlank()
            ) {
                Text("Add")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
