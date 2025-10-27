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
        // Comprehensive collection from filtermusic.net (241 stations) + GitHub internet-radio-streams (45 stations)
        // Total: 286 high-quality radio stations!
        _stations.value = listOf(
            // ==================================================================
            // filtermusic.net Collection (241 stations)
            // Source: https://filtermusic.net/
            // ==================================================================
            InternetRadioStation("fm1", "Deepershades", "https://andromeda.housejunkie.ca/radio/8000/radio.mp3", "House", "128 kbps"),
            InternetRadioStation("fm2", "Sound of Berlin", "https://fluxmusic.api.radiosphere.io/channels/sound-of-berlin/stream.aac", "House", "128 kbps"),
            InternetRadioStation("fm3", "Ibiza Global", "https://cdn-peer031.streaming-pro.com:8025/ibizaglobalradio.mp3", "House", "128 kbps"),
            InternetRadioStation("fm4", "Dogglounge", "https://securestreams4.autopo.st:1853/stream", "House", "128 kbps"),
            InternetRadioStation("fm5", "Vanilla Radio", "https://stream.vanillaradio.com:8003/stream", "House", "128 kbps"),
            InternetRadioStation("fm6", "Cavo Paradiso", "https://neos.win:48488/1", "House", "128 kbps"),
            InternetRadioStation("fm7", "Berlin Beach House Radio", "https://fluxmusic.api.radiosphere.io/channels/berlin-beach-house/stream.aac", "House", "128 kbps"),
            InternetRadioStation("fm8", "Deep House Radio", "https://streaming.shoutcast.com/dhr?1711824191948", "House", "128 kbps"),
            InternetRadioStation("fm9", "Club Sandwich", "https://streams.fluxfm.de/clubsandwich/mp3-128/streams.fluxfm.de", "House", "128 kbps"),
            InternetRadioStation("fm10", "Point Blank", "https://pointblankradio.co.uk/stream", "House", "128 kbps"),
            InternetRadioStation("fm11", "Deepinside", "https://stream.rcs.revma.com/uyrbt6xuhnruv", "House", "128 kbps"),
            InternetRadioStation("fm12", "DinamoFM Deep", "https://channels.dinamo.fm/deep-mp3", "House", "128 kbps"),
            InternetRadioStation("fm13", "Radio Deep", "https://s2.radio.co/s098f4886e/listen", "House", "128 kbps"),
            InternetRadioStation("fm14", "Ibiza Sonica Club", "https://ibizasonica.streaming-pro.com:8011/sonicaclub", "House", "128 kbps"),
            InternetRadioStation("fm15", "Mixadance", "https://stream.mixadance.fm/mixadance", "House", "128 kbps"),
            InternetRadioStation("fm16", "FG Avant Garde", "https://n11.rcs.revma.com/02s8zcv9898uv", "House", "128 kbps"),
            InternetRadioStation("fm17", "Ibiza Live Radio", "https://uksoutha.streaming.broadcast.radio/ibiza-live-radio", "House", "128 kbps"),
            InternetRadioStation("fm18", "Barcelona City fm", "https://s2.radio.co/sd9da54aa0/listen", "House", "128 kbps"),
            InternetRadioStation("fm19", "Physical", "https://s3.radio.co/sd59eccabf/listen", "House", "128 kbps"),
            InternetRadioStation("fm20", "Deep Radio", "https://29043.live.streamtheworld.com/DEEP_RADIOAAC.aac", "House", "128 kbps"),
            InternetRadioStation("fm21", "Experimental TV Radio", "https://s44.myradiostream.com/8890/listen.mp3", "House", "128 kbps"),
            InternetRadioStation("fm22", "Housefm", "https://uksoutha.streaming.broadcast.radio/housefm", "House", "128 kbps"),
            InternetRadioStation("fm23", "DinamoFM", "https://channels.dinamo.fm/legacy-mp3", "House", "128 kbps"),
            InternetRadioStation("fm24", "Frisky Deep", "https://stream.deep.friskyradio.com/mp3_low", "House", "128 kbps"),
            InternetRadioStation("fm25", "Music Factory", "https://i4.streams.ovh:2200/ssl/musicfactory?mp=/stream", "House", "128 kbps"),
            InternetRadioStation("fm26", "Fantasy FM", "https://eu4.fastcast4u.com/proxy/fantasyfm?mp=/1", "House", "128 kbps"),
            InternetRadioStation("fm27", "Deepinradio", "https://ssl1.viastreaming.net:8525/stream.mp3", "House", "128 kbps"),
            InternetRadioStation("fm28", "MoveDaHouse", "https://uk7.internet-radio.com/proxy/movedahouse?mp=//stream", "House", "128 kbps"),
            InternetRadioStation("fm29", "We get lifted", "https://s3.radio.co/sa80d22794/listen", "House", "128 kbps"),
            InternetRadioStation("fm30", "Mambo", "https://streamer.radio.co/sd7b28e5f3/listen", "House", "128 kbps"),
            InternetRadioStation("fm31", "Blue Marlin", "https://ibizasonica.streaming-pro.com:8001/bluemarlin", "House", "128 kbps"),
            InternetRadioStation("fm32", "MotionFM House", "https://vm.motionfm.com/motionone_free", "House", "128 kbps"),
            InternetRadioStation("fm33", "320fm", "https://stream.weblygo.de:8020/stream", "House", "128 kbps"),
            InternetRadioStation("fm34", "Centreforce", "https://listen.centreforceradio.com:8830/192", "House", "128 kbps"),
            InternetRadioStation("fm35", "BeachGrooves", "https://stream.beachgrooves.com:9000/;*.mp3", "House", "128 kbps"),
            InternetRadioStation("fm36", "Freak31", "https://stream.31media.net/freak31", "House", "128 kbps"),
            InternetRadioStation("fm37", "1 Radio Space ", "https://c22.radioboss.fm:18118/1RADIO.SPACE", "Techno", "128 kbps"),
            InternetRadioStation("fm38", "Frisky", "https://stream.frisky.friskyradio.com/mp3_low", "Techno", "128 kbps"),
            InternetRadioStation("fm39", "Insomnia fm", "https://insomniafm.cloudrad.io/live", "Techno", "128 kbps"),
            InternetRadioStation("fm40", "Proton radio", "https://shoutcast.protonradio.com/;*.mp3", "Techno", "128 kbps"),
            InternetRadioStation("fm41", "Joint Beat", "https://jointil.com/stream-beat", "Techno", "128 kbps"),
            InternetRadioStation("fm42", "TrancePulse", "https://stream.trance.ie:8443/stream", "Techno", "128 kbps"),
            InternetRadioStation("fm43", "Afterhours fm", "https://fr.ah.fm/live", "Techno", "128 kbps"),
            InternetRadioStation("fm44", "Trance Athena", "https://cast.streams.ovh:8008/;*.mp3", "Techno", "128 kbps"),
            InternetRadioStation("fm45", "Psyland", "https://sp.streams.ovh/8020/stream", "Techno", "128 kbps"),
            InternetRadioStation("fm46", "Discover trance", "https://uk01.discovertrance.com/;*.mp3", "Techno", "128 kbps"),
            InternetRadioStation("fm47", "FIP electro", "https://icecast.radiofrance.fr/fipelectro-midfi.mp3", "Electronic", "128 kbps"),
            InternetRadioStation("fm48", "Intergalactic", "https://radio.intergalactic.fm/1", "Electronic", "128 kbps"),
            InternetRadioStation("fm49", "Rinse UK", "https://admin.stream.rinse.fm/proxy/rinse_uk/stream", "Electronic", "128 kbps"),
            InternetRadioStation("fm50", "Sovietwave", "https://station.waveradio.org/soviet", "Electronic", "128 kbps"),
            InternetRadioStation("fm51", "Plusfm", "https://stream.plusfm.net/1", "Electronic", "128 kbps"),
            InternetRadioStation("fm52", "Biptunia", "https://ecast.myautodj.com:1380/listen.mp3", "Electronic", "128 kbps"),
            InternetRadioStation("fm53", "Noise FM", "https://play.sas-media.ru/play_256", "Electronic", "128 kbps"),
            InternetRadioStation("fm54", "Systrum Sistum Electronica", "https://systrum.net:8443/SSR2", "Electronic", "128 kbps"),
            InternetRadioStation("fm55", "Dirty", "https://live.dirty.radio/stream", "Electronic", "128 kbps"),
            InternetRadioStation("fm56", "AmpedOut", "https://s12.ssl-stream.com/8006/stream", "Electronic", "128 kbps"),
            InternetRadioStation("fm57", "Bloodlit", "https://usa5.fastcast4u.com/proxy/wwwblood?mp=/1", "Electronic", "128 kbps"),
            InternetRadioStation("fm58", "Bassdrive", "https://bassdrive.radioca.st/stream", "Drum & Bass", "128 kbps"),
            InternetRadioStation("fm59", "Renegade", "https://streaming06.liveboxstream.uk/proxy/renegade/stream", "Drum & Bass", "128 kbps"),
            InternetRadioStation("fm60", "Jungletrain", "https://chat.jungletrain.net/streamtest/;stream/1", "Drum & Bass", "128 kbps"),
            InternetRadioStation("fm61", "SubFM", "https://subfm.radioca.st/live", "Drum & Bass", "128 kbps"),
            InternetRadioStation("fm62", "Breakbeat Zone", "https://radio.bbz.ru/listen/bbz/192.mp3", "Drum & Bass", "128 kbps"),
            InternetRadioStation("fm63", "Dirty Mayhem dnb", "https://node-34.zeno.fm/x7d910w23d0uv", "Drum & Bass", "128 kbps"),
            InternetRadioStation("fm64", "Sunshine Live Drum-n-Bass", "https://sunsl.streamabc.net/sunsl-drumnbass-mp3-192-9834247", "Drum & Bass", "128 kbps"),
            InternetRadioStation("fm65", "UKBassRadio", "https://s2.ssl-stream.com/listen/uk_bass_radio/stream", "Drum & Bass", "128 kbps"),
            InternetRadioStation("fm66", "Dnbradio", "https://dnbradio.nl/dnbradio_main.mp3", "Drum & Bass", "128 kbps"),
            InternetRadioStation("fm67", "Old Skool Anthemz", "https://osa.radioca.st/stream", "Drum & Bass", "128 kbps"),
            InternetRadioStation("fm68", "Laylow FM", "https://stream.laylowlondon.co.uk/listen/laylowfm/radio.ogg", "Drum & Bass", "128 kbps"),
            InternetRadioStation("fm69", "Dirtybass", "https://kentha.dirtybass.fm/endpoint/dirtybass.mp3", "Drum & Bass", "128 kbps"),
            InternetRadioStation("fm70", "Partyvibe Drum and Bass", "https://www.partyviberadio.com:8061", "Drum & Bass", "128 kbps"),
            InternetRadioStation("fm71", "WeFunk", "https://s-09.wefunkradio.com:8443/wefunk64.mp3", "Hip Hop", "128 kbps"),
            InternetRadioStation("fm72", "Badradio", "https://s2.radio.co/s2b2b68744/listen", "Hip Hop", "128 kbps"),
            InternetRadioStation("fm73", "FIP hiphop", "https://icecast.radiofrance.fr/fiphiphop-midfi.mp3", "Hip Hop", "128 kbps"),
            InternetRadioStation("fm74", "HipHop Classics", "https://fluxmusic.api.radiosphere.io/channels/boom-fm-classics/stream.aac", "Hip Hop", "128 kbps"),
            InternetRadioStation("fm75", "Le Rapologue", "https://le-rapologue-radio.radiocult.fm/stream", "Hip Hop", "128 kbps"),
            InternetRadioStation("fm76", "Tequila HipHop", "https://ssl.omegahost.ro/7000/stream", "Hip Hop", "128 kbps"),
            InternetRadioStation("fm77", "DTLR", "https://radio.shoutcheap.com/proxy/shcaesar/stream.mp3", "Hip Hop", "128 kbps"),
            InternetRadioStation("fm78", "Itch fm", "https://streaming.radio.co/s264858a04/listen", "Hip Hop", "128 kbps"),
            InternetRadioStation("fm79", "Dilemaradio", "https://dilemaradiolive.radioca.st/stream", "Hip Hop", "128 kbps"),
            InternetRadioStation("fm80", "Base FM", "https://stream.basefm.co.nz/Base320MP3", "Hip Hop", "128 kbps"),
            InternetRadioStation("fm81", "Hot 108 Jamz", "https://live.powerhitz.com/hot108", "Hip Hop", "128 kbps"),
            InternetRadioStation("fm82", "Scratchvision", "https://stream.radio.co/saacde1bcb/listen", "Hip Hop", "128 kbps"),
            InternetRadioStation("fm83", "El Bloke", "https://streaming.radio.co/sd8f1e3a16/listen", "Hip Hop", "128 kbps"),
            InternetRadioStation("fm84", "Joint", "https://jointil.com/stream-reggae", "Reggae", "128 kbps"),
            InternetRadioStation("fm85", "Blue radio", "https://a3.asurahosting.com:7960/radio.mp3", "Reggae", "128 kbps"),
            InternetRadioStation("fm86", "TikiPod", "https://cast1.torontocast.com:3330/stream", "Reggae", "128 kbps"),
            InternetRadioStation("fm87", "Roots Legacy", "https://l.rootslegacy.fr/stream", "Reggae", "128 kbps"),
            InternetRadioStation("fm88", "Pigpen", "https://azuracast.spollin.net:8000/radio.mp3", "Reggae", "128 kbps"),
            InternetRadioStation("fm89", "Partyvibe reggae", "https://www.partyviberadio.com:8060", "Reggae", "128 kbps"),
            InternetRadioStation("fm90", "TBN Reggae", "https://puma.streemlion.com:1085/stream", "Reggae", "128 kbps"),
            InternetRadioStation("fm91", "Jah Music Mansion", "https://usa13.fastcast4u.com/proxy/jahmusicmansion?mp=/1", "Reggae", "128 kbps"),
            InternetRadioStation("fm92", "B4B Funk", "https://eu10.fastcast4u.com:8120/;*.mp3", "Funk", "128 kbps"),
            InternetRadioStation("fm93", "B-Funk", "https://streams.fluxfm.de/event01/mp3-128/streams.fluxfm.de", "Funk", "128 kbps"),
            InternetRadioStation("fm94", "Soulconnexion", "https://live.soulconnexionradio.com:1045/stream", "Funk", "128 kbps"),
            InternetRadioStation("fm95", "Funky Corner", "https://ais-sa2.cdnstream1.com/2447_192.mp3", "Funk", "128 kbps"),
            InternetRadioStation("fm96", "Soul Legends", "https://streamer.radio.co/s60f3e59d1/listen", "Funk", "128 kbps"),
            InternetRadioStation("fm97", "Funky", "https://funkyradio.streamingmedia.it/play.mp3", "Funk", "128 kbps"),
            InternetRadioStation("fm98", "Disco Paradise", "https://broadcast.miami/proxy/thediscoparadise?mp=/stream/;", "Funk", "128 kbps"),
            InternetRadioStation("fm99", "Nula", "https://strm.radionula.com/classics", "Funk", "128 kbps"),
            InternetRadioStation("fm100", "Goodfellas Music Station", "https://onair7.xdevel.com/proxy/xautocloud_q1v0_1005?mp=/;stream/", "Funk", "128 kbps"),
            InternetRadioStation("fm101", "Disco fetish", "https://radio.intergalactic.fm/2", "Funk", "128 kbps"),
            InternetRadioStation("fm102", "Luxfunk Blackmix", "https://luxfunkbroadcast.com/proxy/luxfunkradio/stream", "Funk", "128 kbps"),
            InternetRadioStation("fm103", "Palace", "https://www.radioking.com/play/palace-radio", "Funk", "128 kbps"),
            InternetRadioStation("fm104", "Generation Soul Disco Funk", "https://gestream.fr/g-radio-hd.mp3", "Funk", "128 kbps"),
            InternetRadioStation("fm105", "DanceGroove", "https://server7.streamserver24.com:8080/proxy/marasalf?mp=/stream", "Funk", "128 kbps"),
            InternetRadioStation("fm106", "Nicecream Green", "https://play.nicecream.fm/radio/8010/green.mp3", "Lounge", "128 kbps"),
            InternetRadioStation("fm107", "Bless your sound", "https://ibizasonica.streaming-pro.com:8015/nomorenoless", "Lounge", "128 kbps"),
            InternetRadioStation("fm108", "Cafe Del Mar", "https://streams.radio.co/se1a320b47/listen", "Lounge", "128 kbps"),
            InternetRadioStation("fm109", "Croissant Show", "https://streams.radio.co/sddfa96b70/listen", "Lounge", "128 kbps"),
            InternetRadioStation("fm110", "Nicecream Red", "https://play.nicecream.fm/radio/8000/red.mp3", "Lounge", "128 kbps"),
            InternetRadioStation("fm111", "Jazz de Ville Groove", "https://onair22.xdevel.com/proxy/xautocloud_1kha_423?mp=/stream", "Lounge", "128 kbps"),
            InternetRadioStation("fm112", "Qmusica", "https://eu8.fastcast4u.com/proxy/qfmserver2?mp=/1", "Lounge", "128 kbps"),
            InternetRadioStation("fm113", "FluxLounge", "https://streams.fluxfm.de/lounge/mp3-128/streams.fluxfm.de", "Lounge", "128 kbps"),
            InternetRadioStation("fm114", "RadioActive", "https://streamyourdream.org:8050/radioactive", "Lounge", "128 kbps"),
            InternetRadioStation("fm115", "Jockey", "https://ec4.yesstreaming.net:2135/stream", "Lounge", "128 kbps"),
            InternetRadioStation("fm116", "MotionFM Lounge", "https://vm.motionfm.com/motionthree_aacp", "Lounge", "128 kbps"),
            InternetRadioStation("fm117", "Vanilla Smooth", "https://smooth.vanillaradio.com:8032/live", "Lounge", "128 kbps"),
            InternetRadioStation("fm118", "Nordic Lodge", "https://radio.streemlion.com:3590/stream", "Lounge", "128 kbps"),
            InternetRadioStation("fm119", "Crooner", "https://croonerradio.ice.infomaniak.ch/croonerradio-midfi.mp3", "Lounge", "128 kbps"),
            InternetRadioStation("fm120", "Lounge Radio", "https://nl1.streamhosting.ch/lounge128.mp3", "Lounge", "128 kbps"),
            InternetRadioStation("fm121", "Salalondon", "https://solid55.streamupsolutions.com/proxy/cfyzzdah/stream", "Lounge", "128 kbps"),
            InternetRadioStation("fm122", "Sonicalm", "https://ibizasonica.streaming-pro.com:8014/sonicalm", "Lounge", "128 kbps"),
            InternetRadioStation("fm123", "Skylab", "https://uksoutha.streaming.broadcast.radio:29690/skylab-radio-limited", "Lounge", "128 kbps"),
            InternetRadioStation("fm124", "DinamoFM Caffe", "https://channels.dinamo.fm/caffe-mp3", "Lounge", "128 kbps"),
            InternetRadioStation("fm125", "Skyline radio e soul", "https://rblive.it:8010/radio.mp3", "Lounge", "128 kbps"),
            InternetRadioStation("fm126", "ABC Lounge", "https://listen.openstream.co/3139/audio", "Lounge", "128 kbps"),
            InternetRadioStation("fm127", "Luxuriamusic", "https://ice10.securenetsystems.net/LUXOMP3", "Lounge", "128 kbps"),
            InternetRadioStation("fm128", "Melodies", "https://i.streams.ovh:2200/ssl/melodies?mp=/stream", "Lounge", "128 kbps"),
            InternetRadioStation("fm129", "Bellostream", "https://stream.radio.co/s0ac307198/listen", "Lounge", "128 kbps"),
            InternetRadioStation("fm130", "OneLuvFM", "https://streamer.radio.co/s34d8d1549/listen", "Lounge", "128 kbps"),
            InternetRadioStation("fm131", "Smoothlounge", "https://smoothjazz.cdnstream1.com/2586_128.mp3", "Lounge", "128 kbps"),
            InternetRadioStation("fm132", "Maretimo Lounge", "https://s35.derstream.net/lounge.mp3", "Lounge", "128 kbps"),
            InternetRadioStation("fm133", "SwissGroove", "https://relay1.swissgroove.ch/;*.mp3", "Lounge", "128 kbps"),
            InternetRadioStation("fm134", "Systrum Sistum", "https://systrum.net:8443/SSR1", "Ambient", "128 kbps"),
            InternetRadioStation("fm135", "Ambient Radio", "https://uk2.internet-radio.com/proxy/ambientradio?mp=/;", "Ambient", "128 kbps"),
            InternetRadioStation("fm136", "ChillHop by FluxFM", "https://streams.fluxfm.de/Chillhop/mp3-128/streams.fluxfm.de", "Ambient", "128 kbps"),
            InternetRadioStation("fm137", "Yoga Sounds by FluxFM", "https://streams.fluxfm.de/yogasounds/mp3-128/streams.fluxfm.de", "Ambient", "128 kbps"),
            InternetRadioStation("fm138", "Verdure", "https://verdure.net/radio/192", "Ambient", "128 kbps"),
            InternetRadioStation("fm139", "Journeyscapes", "https://eagle.streemlion.com/proxy/journeys/stream", "Ambient", "128 kbps"),
            InternetRadioStation("fm140", "Psyndora", "https://cast.magicstreams.gr/sc/psychill/stream", "Ambient", "128 kbps"),
            InternetRadioStation("fm141", "Meuh", "https://radiomeuh2.ice.infomaniak.ch/radiomeuh2-128.mp3", "Music", "128 kbps"),
            InternetRadioStation("fm142", "Noods", "https://noods-radio.radiocult.fm/stream", "Music", "128 kbps"),
            InternetRadioStation("fm143", "Kiosk", "https://kioskradiobxl.out.airtime.pro/kioskradiobxl_b", "Music", "128 kbps"),
            InternetRadioStation("fm144", "Stegi Radio - The Other Side", "https://movementathens2.out.airtime.pro/movementathens2_a", "Music", "128 kbps"),
            InternetRadioStation("fm145", "Le Son Parisien", "https://stream.lesonparisien.com/hi.mp3", "Music", "128 kbps"),
            InternetRadioStation("fm146", "Athens Voice Electronic", "https://n09.radiojar.com/u52ufw1qayduv", "Music", "128 kbps"),
            InternetRadioStation("fm147", "Open Broadcast", "https://stream.openbroadcast.ch/320.mp3", "Music", "128 kbps"),
            InternetRadioStation("fm148", "The Music Machine", "https://msmn3.co/proxy/x2mp33/stream", "Music", "128 kbps"),
            InternetRadioStation("fm149", "OpenLab", "https://ice04.fluidstream.net/openlab.mp3", "Music", "128 kbps"),
            InternetRadioStation("fm150", "Monkey Bros", "https://n0b.radiojar.com/5tyqrwpgpfeuv", "Music", "128 kbps"),
            InternetRadioStation("fm151", "Raheem", "https://radioraheem.out.airtime.pro/radioraheem_a", "Music", "128 kbps"),
            InternetRadioStation("fm152", "Space dogs", "https://www.radioking.com/play/space-dogs-radio", "Music", "128 kbps"),
            InternetRadioStation("fm153", "Vintage Obscura", "https://radio.vintageobscura.net/stream", "Music", "128 kbps"),
            InternetRadioStation("fm154", "DinamoFM Smog", "https://channels.dinamo.fm/smog-mp3", "Music", "128 kbps"),
            InternetRadioStation("fm155", "Stegi Radio", "https://movementathens.out.airtime.pro/movementathens_a", "Music", "128 kbps"),
            InternetRadioStation("fm156", "Music Box", "https://uk5.internet-radio.com/proxy/musicboxradio?mp=/stream", "Music", "128 kbps"),
            InternetRadioStation("fm157", "Global Funk Radio", "https://securestreams2.autopo.st:1148/;*.mp3", "Music", "128 kbps"),
            InternetRadioStation("fm158", "Movie Radio", "https://stream.klassikradio.de/movie-national/aac-128/konsoleplayer", "Music", "128 kbps"),
            InternetRadioStation("fm159", "I Have A Dream", "https://live.radio-ihaveadream.com/stream", "Music", "128 kbps"),
            InternetRadioStation("fm160", "Radio 3S", "https://radio.solarsoundsystem.org/listen/radio3s/radio.mp3", "Music", "128 kbps"),
            InternetRadioStation("fm161", "Worldwide FM", "https://worldwidefm.out.airtime.pro/worldwidefm_b", "Music", "128 kbps"),
            InternetRadioStation("fm162", "Kiss FM", "https://s9.nexuscast.com:9565/kissfm.aac", "Music", "128 kbps"),
            InternetRadioStation("fm163", "Futuradios", "https://futuradiohits.ice.infomaniak.ch/frhits-128.mp3", "Music", "128 kbps"),
            InternetRadioStation("fm164", "Swisspop", "https://stream.srg-ssr.ch/m/rsp/mp3_128", "Music", "128 kbps"),
            InternetRadioStation("fm165", "Maxxima", "https://maxxima.mine.nu/maxxima.mp3", "Music", "128 kbps"),
            InternetRadioStation("fm166", "Frequence3", "https://frequence3.net-radio.fr/frequence3-128.mp3", "Music", "128 kbps"),
            InternetRadioStation("fm167", "PurelectroRadio", "https://str0.creacast.com/purelectro", "Music", "128 kbps"),
            InternetRadioStation("fm168", "EDM Sessions", "https://s2.radio.co/s30844a0f4/listen", "Music", "128 kbps"),
            InternetRadioStation("fm169", "GBH Music", "https://rocket.streamradio.fr:8062/stream", "Music", "128 kbps"),
            InternetRadioStation("fm170", "Tsugi", "https://www.radioking.com/play/tsugi-radio", "Music", "128 kbps"),
            InternetRadioStation("fm171", "8radio", "https://securestreams.autopo.st:1035/;*.mp3", "Music", "128 kbps"),
            InternetRadioStation("fm172", "Le Village Pop", "https://www.radioking.com/play/levillagepop", "Music", "128 kbps"),
            InternetRadioStation("fm173", "Beatles radio", "https://strw3.openstream.co/981", "Music", "128 kbps"),
            InternetRadioStation("fm174", "Dream Machine", "https://radio.intergalactic.fm/3", "Music", "128 kbps"),
            InternetRadioStation("fm175", "NTS", "https://stream-relay-geo.ntslive.net/stream", "Music", "128 kbps"),
            InternetRadioStation("fm176", "17bis", "https://listen.radioking.com/radio/444/stream/1754", "Music", "128 kbps"),
            InternetRadioStation("fm177", "EFR12", "https://listen.radioking.com/radio/151768/stream/192217", "Music", "128 kbps"),
            InternetRadioStation("fm178", "Dublab", "https://dublab.out.airtime.pro/dublab_a", "Music", "128 kbps"),
            InternetRadioStation("fm179", "GlitterBeam", "https://ukwesta.streaming.broadcast.radio/glitterbeam", "Music", "128 kbps"),
            InternetRadioStation("fm180", "Explorers Emporium", "https://www.radioking.com/play/explorers-emporium-radio", "Music", "128 kbps"),
            InternetRadioStation("fm181", "Electro Swing Revolution", "https://streamer.radio.co/s2c3cc784b/listen", "Music", "128 kbps"),
            InternetRadioStation("fm182", "Planet Pootwaddle", "https://ppw.streamguys1.com/sgplayer-mp3", "Music", "128 kbps"),
            InternetRadioStation("fm183", "80s Forever", "https://premium.shoutcastsolutions.com/radio/8050/256.mp3", "Retro", "128 kbps"),
            InternetRadioStation("fm184", "Lolli Oldies", "https://stream.lolliradio.net/lolli_oldies.mp3", "Retro", "128 kbps"),
            InternetRadioStation("fm185", "Fantasy radio", "https://italo.italo.nu/live", "Retro", "128 kbps"),
            InternetRadioStation("fm186", "Groovy Reflections", "https://usa12.fastcast4u.com/proxy/reflecti?mp=/1", "Retro", "128 kbps"),
            InternetRadioStation("fm187", "Retrosounds", "https://listen.radioking.com/radio/34544/stream/70739", "Retro", "128 kbps"),
            InternetRadioStation("fm188", "Stad den Haag", "https://stream.radiostaddenhaag.com/stream/1/;", "Retro", "128 kbps"),
            InternetRadioStation("fm189", "TopSide", "https://listen.radioking.com/radio/33560/stream/69731", "Retro", "128 kbps"),
            InternetRadioStation("fm190", "Affinity", "https://stream.radio.co/s038d07e75/listen", "Retro", "128 kbps"),
            InternetRadioStation("fm191", "TrendFM Den Haag", "https://trendfm.live-streams.nl:18030/live", "Retro", "128 kbps"),
            InternetRadioStation("fm192", "neoFM", "https://streams.fluxfm.de/neofm/mp3-128/streams.fluxfm.de", "Classical", "128 kbps"),
            InternetRadioStation("fm193", "Cinemix", "https://kathy.torontocast.com:1825/stream", "Classical", "128 kbps"),
            InternetRadioStation("fm194", "Minnesota Public Radio", "https://cms.stream.publicradio.org/cms.aac", "Classical", "128 kbps"),
            InternetRadioStation("fm195", "Stephansdom", "https://radioklassikstephansdom.ice.infomaniak.ch/radioklassikstephansdom.mp3", "Classical", "128 kbps"),
            InternetRadioStation("fm196", "Bru Zane", "https://uk2.streamingpulse.com/ssl/bzr", "Classical", "128 kbps"),
            InternetRadioStation("fm197", "Ancientfm", "https://mediaserv73.live-streams.nl:18058/stream", "Classical", "128 kbps"),
            InternetRadioStation("fm198", "Swiss Classic", "https://stream.srg-ssr.ch/m/rsc_de/mp3_128", "Classical", "128 kbps"),
            InternetRadioStation("fm199", "Venice classic", "https://uk2.streamingpulse.com/ssl/vcr1", "Classical", "128 kbps"),
            InternetRadioStation("fm200", "Radio Classique", "https://radioclassique.ice.infomaniak.ch/radioclassique-high.mp3", "Classical", "128 kbps"),
            InternetRadioStation("fm201", "Klassik Radio", "https://stream.klassikradio.de/klr-krdnational/aac-128/konsoleplayer", "Classical", "128 kbps"),
            InternetRadioStation("fm202", "RCO Live", "https://ice.cr6.streamzilla.xlcdn.com:8000/sz=RCOLiveWebradio=mp3-192", "Classical", "128 kbps"),
            InternetRadioStation("fm203", "Accent 4", "https://str0.creacast.com/accent4", "Classical", "128 kbps"),
            InternetRadioStation("fm204", "Schwarzenstein", "https://streams.fluxfm.de/jazzschwarz/mp3-128/streams.fluxfm.de", "Jazz", "128 kbps"),
            InternetRadioStation("fm205", "Concertzender", "https://streams.greenhost.nl:8006/live", "Jazz", "128 kbps"),
            InternetRadioStation("fm206", "Giants of Jazz", "https://streaming.radio.co/s297e618a7/listen", "Jazz", "128 kbps"),
            InternetRadioStation("fm207", "Megaton Cafe", "https://us2.internet-radio.com/proxy/megatoncafe?mp=/stream;", "Jazz", "128 kbps"),
            InternetRadioStation("fm208", "Swing Street", "https://s1.voscast.com:10413/stream", "Jazz", "128 kbps"),
            InternetRadioStation("fm209", "Couleurs Jazz", "https://listen.radioking.com/radio/127546/stream/167344", "Jazz", "128 kbps"),
            InternetRadioStation("fm210", "Smoothjazz", "https://smoothjazz.cdnstream1.com/2585_128.mp3", "Jazz", "128 kbps"),
            InternetRadioStation("fm211", "Radio Swiss Jazz", "https://stream.srg-ssr.ch/m/rsj/mp3_128", "Jazz", "128 kbps"),
            InternetRadioStation("fm212", "Smooth Jazz Florida", "https://usa6.fastcast4u.com/proxy/wsjfhd?mp=/1", "Jazz", "128 kbps"),
            InternetRadioStation("fm213", "WRTI", "https://wrti-live.streamguys1.com/jazz-mp3", "Jazz", "128 kbps"),
            InternetRadioStation("fm214", "TSF 89.9", "https://tsfjazz.ice.infomaniak.ch/tsfjazz-high.mp3", "Jazz", "128 kbps"),
            InternetRadioStation("fm215", "Jazzradio", "https://jazzradio.ice.infomaniak.ch/jazzradio-high.mp3", "Jazz", "128 kbps"),
            InternetRadioStation("fm216", "QCIndie", "https://stream.qcindie.com/live", "Rock", "128 kbps"),
            InternetRadioStation("fm217", "Loaded", "https://s2.radio.co/sad782b7f8/listen", "Rock", "128 kbps"),
            InternetRadioStation("fm218", "XRaydio", "https://xraydio.ddns.net/live", "Rock", "128 kbps"),
            InternetRadioStation("fm219", "Cathedral 13", "https://usa15.fastcast4u.com/proxy/tstamate?mp=/stream", "Rock", "128 kbps"),
            InternetRadioStation("fm220", "ZZROCK", "https://axtran.radioca.st/stream", "Rock", "128 kbps"),
            InternetRadioStation("fm221", "Wigwam", "https://streaming.radio.co/s2b39cfe62/listen", "Rock", "128 kbps"),
            InternetRadioStation("fm222", "Spoon", "https://spoonradio.ice.infomaniak.ch/spoonradio-light.aac", "Rock", "128 kbps"),
            InternetRadioStation("fm223", "SA Rock", "https://sarock.radioca.st/stream", "Rock", "128 kbps"),
            InternetRadioStation("fm224", "DKFM Shoegaze", "https://kathy.torontocast.com:2005/stream", "Rock", "128 kbps"),
            InternetRadioStation("fm225", "Cosmic Fuzz", "https://15113.live.streamtheworld.com/SAM04AAC335_SC", "Rock", "128 kbps"),
            InternetRadioStation("fm226", "Caroline", "https://stream.radiocaroline.net/;*.mp3", "Rock", "128 kbps"),
            InternetRadioStation("fm227", "Surf Rock", "https://radio.dripfeed.net/radio/8020/radio.mp3", "Rock", "128 kbps"),
            InternetRadioStation("fm228", "Krautrock world", "https://krautrockworld.stream.laut.fm/krautrockworld", "Rock", "128 kbps"),
            InternetRadioStation("fm229", "Morow", "https://stream.fr.morow.com/morow_med.aacp", "Rock", "128 kbps"),
            InternetRadioStation("fm230", "Bluesradio", "https://i4.streams.ovh/sc/bluesrad/stream", "Rock", "128 kbps"),
            InternetRadioStation("fm231", "Delicious Agony", "https://deliciousagony.streamguys1.com", "Rock", "128 kbps"),
            InternetRadioStation("fm232", "Rock Melodic", "https://i4.streams.ovh:2200/ssl/rockmelo?mp=/stream", "Rock", "128 kbps"),
            InternetRadioStation("fm233", "OUI FM", "https://ouifm.ice.infomaniak.ch/ouifm-high.mp3", "Rock", "128 kbps"),
            InternetRadioStation("fm234", "Idobi Howl", "https://idobihowl.idobi.com/;stream.mp3", "Rock", "128 kbps"),
            InternetRadioStation("fm235", "12XU", "https://12xu.stream.laut.fm/12xu", "Rock", "128 kbps"),
            InternetRadioStation("fm236", "Free Phoenix", "https://s6.reliastream.com/proxy/radiofre?mp=/stream", "Rock", "128 kbps"),
            InternetRadioStation("fm237", "La Grosse Radio Rock", "https://hd.lagrosseradio.info/lagrosseradio-rock-192.mp3", "Rock", "128 kbps"),
            InternetRadioStation("fm238", "Paul in Rio", "https://usa10.fastcast4u.com/paulinrio/;*.mp3", "World", "128 kbps"),
            InternetRadioStation("fm239", "Exotica", "https://solid67.streamupsolutions.com/proxy/repadnom?mp=/;type=mp3", "World", "128 kbps"),
            InternetRadioStation("fm240", "ILoveRio", "https://eu10.fastcast4u.com/iloverio", "World", "128 kbps"),
            InternetRadioStation("fm241", "Salseo", "https://stream.radio.co/s579ede15c/listen", "World", "128 kbps"),
            
            // ==================================================================
            // GitHub internet-radio-streams Collection (45 stations)
            // Source: https://github.com/mikepierce/internet-radio-streams
            // ==================================================================
            
            // Electronic & EDM
            InternetRadioStation("gh1", "313.FM Detroit", "http://icecast.ofdoom.com:8000/burst.mp3", "Electronic", "128 kbps"),
            InternetRadioStation("gh2", "AH.FM - EDM Radio", "http://nl.ah.fm:8000/live", "Electronic", "128 kbps"),
            
            // Ambient & Chill
            InternetRadioStation("gh3", "9128.live Ambient", "http://streams.radio.co:80/s0aa1e6f4a/listen", "Ambient", "128 kbps"),
            InternetRadioStation("gh4", "A.M. Ambient", "http://radio.stereoscenic.com/ama-h", "Ambient", "128 kbps"),
            InternetRadioStation("gh5", "Ambient Sleeping Pill", "http://radio.stereoscenic.com/asp-h", "Ambient", "128 kbps"),
            InternetRadioStation("gh6", "Bluemars - Cryosleep", "http://50.116.12.253:8000/cryosleep", "Ambient", "128 kbps"),
            InternetRadioStation("gh7", "Bluemars - Voices", "http://50.116.12.253:8000/voicesfromwithin", "Ambient", "128 kbps"),
            InternetRadioStation("gh8", "Bluemars", "http://50.116.12.253:8000/bluemars", "Ambient", "128 kbps"),
            InternetRadioStation("gh9", "Dark Ambient Radio", "http://s3.viastreaming.net:8835/", "Ambient", "128 kbps"),
            
            // BBC Radio
            InternetRadioStation("gh10", "BBC Radio 1", "http://as-hls-ww-live.akamaized.net/pool_01505109/live/ww/bbc_radio_one/bbc_radio_one.isml/bbc_radio_one-audio%3d96000.norewind.m3u8", "Music", "96 kbps"),
            InternetRadioStation("gh11", "BBC Radio 1Xtra", "http://as-hls-ww-live.akamaized.net/pool_92079267/live/ww/bbc_1xtra/bbc_1xtra.isml/bbc_1xtra-audio%3d96000.norewind.m3u8", "Music", "96 kbps"),
            InternetRadioStation("gh12", "BBC Radio 1Dance", "http://as-hls-ww-live.akamaized.net/pool_62063831/live/ww/bbc_radio_one_dance/bbc_radio_one_dance.isml/bbc_radio_one_dance-audio%3d96000.norewind.m3u8", "Music", "96 kbps"),
            InternetRadioStation("gh13", "BBC Radio 2", "http://as-hls-ww-live.akamaized.net/pool_74208725/live/ww/bbc_radio_two/bbc_radio_two.isml/bbc_radio_two-audio%3d96000.norewind.m3u8", "Music", "96 kbps"),
            InternetRadioStation("gh14", "BBC Radio 6 Music", "http://as-hls-ww-live.akamaized.net/pool_81827798/live/ww/bbc_6music/bbc_6music.isml/bbc_6music-audio%3d96000.norewind.m3u8", "Rock", "96 kbps"),
            InternetRadioStation("gh15", "BBC World Service", "http://stream.live.vc.bbcmedia.co.uk/bbc_world_service", "News", "128 kbps"),
            
            // French Radio
            InternetRadioStation("gh16", "FIP", "http://direct.fipradio.fr/live/fip-midfi.mp3", "Music", "128 kbps"),
            InternetRadioStation("gh17", "FIP Jazz", "http://direct.fipradio.fr/live/fip-webradio2.mp3", "Jazz", "128 kbps"),
            InternetRadioStation("gh18", "FIP Groove", "http://direct.fipradio.fr/live/fip-webradio3.mp3", "Music", "128 kbps"),
            InternetRadioStation("gh19", "France Musique", "http://direct.francemusique.fr/live/francemusique-midfi.mp3", "Classical", "128 kbps"),
            
            // SomaFM Stations
            InternetRadioStation("gh20", "SomaFM - Groove Salad", "http://ice2.somafm.com/groovesalad-128-aac", "Ambient", "128 kbps"),
            InternetRadioStation("gh21", "SomaFM - Drone Zone", "http://ice2.somafm.com/dronezone-128-aac", "Ambient", "128 kbps"),
            InternetRadioStation("gh22", "SomaFM - Deep Space One", "http://ice2.somafm.com/deepspaceone-128-aac", "Ambient", "128 kbps"),
            InternetRadioStation("gh23", "SomaFM - Space Station", "http://ice2.somafm.com/spacestation-128-aac", "Ambient", "128 kbps"),
            InternetRadioStation("gh24", "SomaFM - Lush", "http://ice2.somafm.com/lush-128-aac", "Electronic", "128 kbps"),
            InternetRadioStation("gh25", "SomaFM - Illinois Street Lounge", "http://ice2.somafm.com/illstreet-128-aac", "Music", "128 kbps"),
            
            // Alternative & Indie
            InternetRadioStation("gh26", "KEXP Seattle", "http://live-mp3-128.kexp.org", "Rock", "128 kbps"),
            InternetRadioStation("gh27", "Dublab Los Angeles", "https://dublab.out.airtime.pro/dublab_a", "Music", "128 kbps"),
            InternetRadioStation("gh28", "NTS Radio 1", "http://stream-relay-geo.ntslive.net/stream", "Music", "128 kbps"),
            InternetRadioStation("gh29", "NTS Radio 2", "http://stream-relay-geo.ntslive.net/stream2", "Music", "128 kbps"),
            InternetRadioStation("gh30", "Newtown Radio", "https://streaming.radio.co/s0d090ee43/listen", "Music", "128 kbps"),
            
            // Specialty & Niche
            InternetRadioStation("gh31", "Badradio Phonk", "https://s2.radio.co/s2b2b68744/listen", "Hip Hop", "128 kbps"),
            InternetRadioStation("gh32", "Cashmere Radio", "https://cashmereradio.out.airtime.pro/cashmereradio_b", "Music", "128 kbps"),
            InternetRadioStation("gh33", "Kiosk Radio Brussels", "https://kioskradiobxl.out.airtime.pro/kioskradiobxl_b", "Music", "128 kbps"),
            InternetRadioStation("gh34", "NASA Third Rock Radio", "http://rfcm.streamguys1.com/thirdrock-icy", "Music", "128 kbps"),
            InternetRadioStation("gh35", "Nightwave Plaza", "http://radio.plaza.one/ogg", "Music", "128 kbps"),
            InternetRadioStation("gh36", "Radio Paradise", "http://stream.radioparadise.com/global-192", "Music", "192 kbps"),
            InternetRadioStation("gh37", "Radio Caroline", "http://78.129.202.10:8030/", "Music", "128 kbps"),
            InternetRadioStation("gh38", "The Lot Radio NYC", "https://thelot.out.airtime.pro/thelot_a", "Music", "128 kbps"),
            InternetRadioStation("gh39", "Worldwide FM", "https://worldwidefm.out.airtime.pro/worldwidefm_a", "Music", "128 kbps")
        )
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
