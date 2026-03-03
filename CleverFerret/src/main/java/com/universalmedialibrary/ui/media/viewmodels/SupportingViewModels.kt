package com.universalmedialibrary.ui.media.viewmodels

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.RadioStationDao
import com.universalmedialibrary.data.local.entity.RadioStation as DbRadioStation
import com.universalmedialibrary.services.radio.RadioBrowserService
import com.universalmedialibrary.ui.media.components.MediaItem
import com.universalmedialibrary.ui.media.components.MediaType
import com.universalmedialibrary.ui.media.screens.*
import com.universalmedialibrary.ui.media.theme.MediaColors
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject
import kotlin.math.roundToInt

/**
 * Radio ViewModel
 *
 * Backed by real sources:
 * - Internet radio catalog via `RadioBrowserService`
 * - Favorites / history via `RadioStationDao`
 */
@Deprecated("Transitional stub. Use com.universalmedialibrary.ui.radio.RadioScreenViewModel for canonical radio logic.")
@HiltViewModel
class TransitionalRadioViewModel @Inject constructor(
    private val radioBrowserService: RadioBrowserService,
    private val radioStationDao: RadioStationDao
) : ViewModel() {

    private val networkPopular = MutableStateFlow<List<DbRadioStation>>(emptyList())
    private val nowPlaying = MutableStateFlow<RadioStation?>(null)
    private val selectedGenre = MutableStateFlow<String?>(null)

    private data class RadioSnapshot(
        val favoritesDb: List<DbRadioStation>,
        val recentDb: List<DbRadioStation>,
        val mostPlayedDb: List<DbRadioStation>,
        val genreCounts: List<RadioStationDao.GenreCount>,
        val networkDb: List<DbRadioStation>
    )

    val uiState: StateFlow<RadioScreenState> =
        combine(
            combine(
                radioStationDao.getFavoriteStations(),
                radioStationDao.getRecentlyPlayed(limit = 10),
                radioStationDao.getMostPlayed(limit = 20),
                radioStationDao.getGenreCounts(),
                networkPopular
            ) { favoritesDb, recentDb, mostPlayedDb, genreCounts, networkDb ->
                RadioSnapshot(
                    favoritesDb = favoritesDb,
                    recentDb = recentDb,
                    mostPlayedDb = mostPlayedDb,
                    genreCounts = genreCounts,
                    networkDb = networkDb
                )
            },
            nowPlaying,
            selectedGenre
        ) { snapshot, nowPlayingUi, selected ->
            val favoritesByStreamUrl = snapshot.favoritesDb
                .mapNotNull { it.streamUrl }
                .toSet()

            val categories = snapshot.genreCounts
                .filter { it.genre.isNotBlank() }
                .take(20)
                .map { gc ->
                    RadioCategory(
                        id = gc.genre,
                        name = gc.genre,
                        icon = Icons.Default.Category,
                        color = MediaColors.AccentPrimary,
                        stationCount = gc.count
                    )
                }

            val popularSource = if (snapshot.mostPlayedDb.isNotEmpty()) snapshot.mostPlayedDb else snapshot.networkDb
            val popularUi = popularSource
                .mapNotNull { it.toUiStation(favoritesByStreamUrl) }
                .let { list ->
                    val filterGenre = selected?.trim()?.takeIf { it.isNotBlank() }
                    if (filterGenre == null) list else list.filter { it.genre.equals(filterGenre, ignoreCase = true) }
                }

            val favoritesUi = snapshot.favoritesDb.mapNotNull { it.toUiStation(favoritesByStreamUrl) }
            val recentUi = snapshot.recentDb.mapNotNull { it.toUiStation(favoritesByStreamUrl) }

            RadioScreenState(
                favoriteStations = favoritesUi,
                popularStations = popularUi,
                recentlyPlayed = recentUi,
                categories = categories,
                fmStations = emptyList(),
                hdStations = emptyList(),
                oldTimeShows = emptyList(),
                nowPlaying = nowPlayingUi,
                fmAvailable = false,
                hdAvailable = false,
                isLoading = false
            )
        }
            .stateIn(
                scope = viewModelScope,
                started = SharingStarted.WhileSubscribed(5_000),
                initialValue = RadioScreenState(isLoading = true)
            )

    init {
        refreshPopularStations()
    }

    fun refreshPopularStations() {
        viewModelScope.launch {
            runCatching {
                radioBrowserService.fetchTopStations(limit = 50)
            }.onSuccess { stations ->
                networkPopular.value = stations
            }
        }
    }

    fun playStation(station: RadioStation) {
        viewModelScope.launch {
            val db = ensureStationInDb(station)
            if (db != null) {
                radioStationDao.recordPlay(db.id, System.currentTimeMillis())
            }
            nowPlaying.value = station
        }
    }

    fun toggleFavorite(station: RadioStation) {
        viewModelScope.launch {
            val streamUrl = station.streamUrl.takeIf { it.isNotBlank() } ?: return@launch
            val existing = radioStationDao.getStationByStreamUrl(streamUrl)
            if (existing != null) {
                radioStationDao.updateFavoriteStatus(existing.id, !existing.isFavorite)
            } else {
                radioStationDao.insertStation(
                    DbRadioStation(
                        name = station.name,
                        description = null,
                        streamUrl = streamUrl,
                        websiteUrl = null,
                        logoUrl = station.logoUrl,
                        genre = station.genre,
                        country = station.country,
                        bitrate = station.bitrate,
                        isFavorite = true
                    )
                )
            }
        }
    }

    fun selectCategory(category: RadioCategory) {
        selectedGenre.value = category.name
    }

    private suspend fun ensureStationInDb(station: RadioStation): DbRadioStation? {
        val streamUrl = station.streamUrl.takeIf { it.isNotBlank() } ?: return null
        val existing = radioStationDao.getStationByStreamUrl(streamUrl)
        if (existing != null) return existing

        val id = radioStationDao.insertStation(
            DbRadioStation(
                name = station.name,
                description = null,
                streamUrl = streamUrl,
                websiteUrl = null,
                logoUrl = station.logoUrl,
                genre = station.genre,
                country = station.country,
                bitrate = station.bitrate,
                isFavorite = station.isFavorite
            )
        )
        return radioStationDao.getStationByIdDirect(id)
    }

    private fun DbRadioStation.toUiStation(favoritesByStreamUrl: Set<String>): RadioStation? {
        val url = streamUrl?.takeIf { it.isNotBlank() } ?: return null
        val genreName = genre?.takeIf { it.isNotBlank() } ?: "Radio"
        val favorite = isFavorite || favoritesByStreamUrl.contains(url)
        return RadioStation(
            id = id.toString(),
            name = name,
            logoUrl = logoUrl,
            streamUrl = url,
            genre = genreName,
            genreColor = MediaColors.AccentPrimary,
            country = country,
            bitrate = bitrate,
            isFavorite = favorite,
            currentTrack = null
        )
    }
}

/**
 * Web Fiction ViewModel (Simplified)
 */
@Deprecated("Transitional stub. Use com.universalmedialibrary.ui.webfiction.WebFictionManagerScreenViewModel for canonical web fiction logic.")
@HiltViewModel
class TransitionalWebFictionViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(WebFictionScreenState())
    val uiState: StateFlow<WebFictionScreenState> = _uiState.asStateFlow()
    
    init {
        loadWebFictionData()
    }
    
    private fun loadWebFictionData() {
        viewModelScope.launch {
            _uiState.update { it.copy(isRefreshing = false) }
        }
    }
    
    fun refresh() {
        viewModelScope.launch {
            _uiState.update { it.copy(isRefreshing = true) }
            // Refresh data
            _uiState.update { it.copy(isRefreshing = false) }
        }
    }
}

/**
 * OPDS Browser ViewModel (Simplified)
 */
@HiltViewModel
class OPDSViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(OPDSScreenState())
    val uiState: StateFlow<OPDSScreenState> = _uiState.asStateFlow()
    
    private val navigationStack = mutableListOf<String>()
    
    init {
        loadCatalogs()
    }
    
    private fun loadCatalogs() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = false) }
        }
    }
    
    fun openCatalog(catalog: OPDSCatalog) {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            navigationStack.add(catalog.name)
            _uiState.update {
                it.copy(
                    currentPath = catalog.name,
                    navigationStack = navigationStack.toList(),
                    isLoading = false
                )
            }
        }
    }
    
    fun navigateBack(): Boolean {
        if (navigationStack.isEmpty()) return false
        navigationStack.removeAt(navigationStack.lastIndex)
        
        if (navigationStack.isEmpty()) {
            loadCatalogs()
        }
        return true
    }
    
    fun search(query: String) {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            // Perform search
            _uiState.update { it.copy(isLoading = false) }
        }
    }
    
    fun addCatalog(url: String) {
        viewModelScope.launch {
            // Add catalog
            loadCatalogs()
        }
    }
    
    fun download(entry: OPDSEntry) {
        viewModelScope.launch {
            // Download entry
        }
    }
}

/**
 * Ambient Sounds ViewModel (Simplified)
 */
@HiltViewModel
class AmbientViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(AmbientScreenState())
    val uiState: StateFlow<AmbientScreenState> = _uiState.asStateFlow()
    
    init {
        loadAmbientData()
    }
    
    private fun loadAmbientData() {
        val categories = listOf(
            AmbientCategory(
                id = "nature",
                name = "Nature",
                icon = Icons.Default.Nature,
                sounds = listOf(
                    AmbientSound("rain", "Rain", Icons.Default.WaterDrop, MediaColors.Info, ""),
                    AmbientSound("thunder", "Thunder", Icons.Default.Thunderstorm, MediaColors.Warning, ""),
                    AmbientSound("wind", "Wind", Icons.Default.Air, MediaColors.TextSecondary, "")
                )
            ),
            AmbientCategory(
                id = "water",
                name = "Water",
                icon = Icons.Default.Water,
                sounds = listOf(
                    AmbientSound("ocean", "Ocean Waves", Icons.Default.Waves, MediaColors.Info, ""),
                    AmbientSound("stream", "Stream", Icons.Default.Stream, MediaColors.Success, "")
                )
            )
        )
        
        val presets = listOf(
            AmbientPreset("focus", "Focus", Icons.Default.Psychology, MediaColors.AccentPrimary, emptyList()),
            AmbientPreset("sleep", "Sleep", Icons.Default.Bedtime, MediaColors.AccentSecondary, emptyList()),
            AmbientPreset("relax", "Relax", Icons.Default.Spa, MediaColors.Success, emptyList())
        )
        
        _uiState.update { it.copy(categories = categories, presets = presets) }
    }
    
    fun toggleSound(sound: AmbientSound) {
        viewModelScope.launch {
            val active = _uiState.value.activeSounds.toMutableList()
            if (active.any { it.id == sound.id }) {
                active.removeAll { it.id == sound.id }
            } else {
                active.add(sound)
            }
            _uiState.update { it.copy(activeSounds = active) }
        }
    }
    
    fun setVolume(sound: AmbientSound, volume: Float) {
        // Update volume
    }
    
    fun applyPreset(preset: AmbientPreset) {
        viewModelScope.launch {
            _uiState.update { it.copy(activePreset = preset) }
        }
    }
    
    fun savePreset(name: String) {
        viewModelScope.launch {
            // Save preset
        }
    }
}

/**
 * News ViewModel (Simplified)
 */
@Deprecated("Transitional stub. Use com.universalmedialibrary.ui.news.NewsScreenViewModel for canonical news logic.")
@HiltViewModel
class TransitionalNewsViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(NewsScreenState())
    val uiState: StateFlow<NewsScreenState> = _uiState.asStateFlow()
    
    init {
        loadNewsData()
    }
    
    private fun loadNewsData() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = false) }
        }
    }
    
    fun selectFeed(feed: NewsFeed) {
        viewModelScope.launch {
            _uiState.update { it.copy(selectedFeed = feed, isLoading = true) }
            // Load articles for feed
            _uiState.update { it.copy(isLoading = false) }
        }
    }
    
    fun refresh() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            loadNewsData()
        }
    }
}

/**
 * Collections ViewModel (Simplified)
 */
@HiltViewModel
class CollectionsViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(CollectionsScreenState())
    val uiState: StateFlow<CollectionsScreenState> = _uiState.asStateFlow()
    
    init {
        loadCollections()
    }
    
    private fun loadCollections() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = false) }
        }
    }
    
    fun createCollection(name: String) {
        viewModelScope.launch {
            val newCollection = Collection(
                id = System.currentTimeMillis().toString(),
                name = name,
                coverUrls = emptyList(),
                itemCount = 0
            )
            _uiState.update { 
                it.copy(collections = it.collections + newCollection)
            }
        }
    }
}

/**
 * Collection Detail ViewModel (Simplified)
 */
@HiltViewModel
class CollectionDetailViewModel @Inject constructor(
    savedStateHandle: SavedStateHandle
) : ViewModel() {
    
    private val collectionId: String = savedStateHandle["collectionId"] ?: ""
    
    private val _uiState = MutableStateFlow(
        CollectionDetailState(
            collection = Collection(
                id = collectionId,
                name = "My Collection",
                coverUrls = emptyList(),
                itemCount = 0
            ),
            items = emptyList(),
            isLoading = true
        )
    )
    val uiState: StateFlow<CollectionDetailState> = _uiState.asStateFlow()
    
    init {
        loadCollectionDetail()
    }
    
    private fun loadCollectionDetail() {
        viewModelScope.launch {
            _uiState.update { 
                it.copy(isLoading = false)
            }
        }
    }
    
    fun removeItem(item: MediaItem) {
        viewModelScope.launch {
            _uiState.update { state ->
                state.copy(items = state.items.filter { it.id != item.id })
            }
        }
    }
}

/**
 * Sync ViewModel (Simplified)
 */
@HiltViewModel
class MediaSyncViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(SyncScreenState())
    val uiState: StateFlow<SyncScreenState> = _uiState.asStateFlow()
    
    init {
        loadSyncStatus()
    }
    
    private fun loadSyncStatus() {
        viewModelScope.launch {
            // Initial state already set by default constructor
        }
    }
    
    fun syncNow() {
        viewModelScope.launch {
            _uiState.update { it.copy(isSyncing = true) }
            // Perform sync
            _uiState.update { it.copy(isSyncing = false, lastSyncTime = "Just now") }
        }
    }
    
    fun configureService(service: com.universalmedialibrary.ui.media.screens.SyncService) {
        // Configure sync service
    }
}

/**
 * Import/Export ViewModel (Simplified)
 */
@HiltViewModel
class ImportExportViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(ImportExportScreenState())
    val uiState: StateFlow<ImportExportScreenState> = _uiState.asStateFlow()
    
    fun startImport(type: ImportExportType) {
        viewModelScope.launch {
            _uiState.update { it.copy(isProcessing = true) }
            // Perform import
            _uiState.update { it.copy(isProcessing = false) }
        }
    }
    
    fun startExport(type: ImportExportType) {
        viewModelScope.launch {
            _uiState.update { it.copy(isProcessing = true) }
            // Perform export
            _uiState.update { it.copy(isProcessing = false) }
        }
    }
}

/**
 * Media Detail ViewModel (Simplified)
 */
@HiltViewModel
class MediaDetailViewModel @Inject constructor(
    savedStateHandle: SavedStateHandle
) : ViewModel() {
    
    private val mediaType: String = savedStateHandle["mediaType"] ?: "book"
    private val mediaId: String = savedStateHandle["mediaId"] ?: ""
    
    private val _uiState = MutableStateFlow(MediaDetailViewState())
    val uiState: StateFlow<MediaDetailViewState> = _uiState.asStateFlow()
    
    init {
        loadMediaDetail()
    }
    
    private fun loadMediaDetail() {
        viewModelScope.launch {
            _uiState.update { 
                it.copy(
                    title = "Sample Title",
                    description = "Sample description for media item",
                    isLoading = false
                )
            }
        }
    }
    
    fun download() {
        viewModelScope.launch {
            _uiState.update { it.copy(isDownloading = true) }
            // Perform download
            _uiState.update { it.copy(isDownloading = false) }
        }
    }
}

// =============================================================================
// STATE CLASSES
// =============================================================================

data class MediaDetailViewState(
    val title: String = "",
    val description: String = "",
    val imageUrl: String? = null,
    val isLoading: Boolean = true,
    val isDownloading: Boolean = false,
    val error: String? = null
)

// Note: CollectionDetailState, SyncScreenState, SyncService, 
// ImportExportScreenState, ImportExportType are defined in MediaScreensData.kt
