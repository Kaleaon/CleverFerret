package com.universalmedialibrary.ui.plex.viewmodels

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.ui.plex.components.PlexMediaItem
import com.universalmedialibrary.ui.plex.components.PlexMediaType
import com.universalmedialibrary.ui.plex.screens.*
import com.universalmedialibrary.ui.plex.theme.PlexColors
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Radio ViewModel (Simplified)
 */
@HiltViewModel
class PlexRadioViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(RadioScreenState())
    val uiState: StateFlow<RadioScreenState> = _uiState.asStateFlow()
    
    init {
        loadRadioData()
    }
    
    private fun loadRadioData() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = false) }
        }
    }
    
    fun playStation(station: RadioStation) {
        viewModelScope.launch {
            _uiState.update { it.copy(nowPlaying = station) }
        }
    }
    
    fun toggleFavorite(station: RadioStation) {
        viewModelScope.launch {
            val updated = if (station.isFavorite) {
                _uiState.value.favoriteStations.filter { it.id != station.id }
            } else {
                _uiState.value.favoriteStations + station.copy(isFavorite = true)
            }
            _uiState.update { it.copy(favoriteStations = updated) }
        }
    }
    
    fun selectCategory(category: RadioCategory) {
        // Filter stations by category
    }
}

/**
 * Web Fiction ViewModel (Simplified)
 */
@HiltViewModel
class PlexWebFictionViewModel @Inject constructor() : ViewModel() {
    
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
class PlexOPDSViewModel @Inject constructor() : ViewModel() {
    
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
        navigationStack.removeLast()
        
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
class PlexAmbientViewModel @Inject constructor() : ViewModel() {
    
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
                    AmbientSound("rain", "Rain", Icons.Default.WaterDrop, PlexColors.Info, ""),
                    AmbientSound("thunder", "Thunder", Icons.Default.Thunderstorm, PlexColors.Warning, ""),
                    AmbientSound("wind", "Wind", Icons.Default.Air, PlexColors.TextSecondary, "")
                )
            ),
            AmbientCategory(
                id = "water",
                name = "Water",
                icon = Icons.Default.Water,
                sounds = listOf(
                    AmbientSound("ocean", "Ocean Waves", Icons.Default.Waves, PlexColors.Info, ""),
                    AmbientSound("stream", "Stream", Icons.Default.Stream, PlexColors.Success, "")
                )
            )
        )
        
        val presets = listOf(
            AmbientPreset("focus", "Focus", Icons.Default.Psychology, PlexColors.AccentPrimary, emptyList()),
            AmbientPreset("sleep", "Sleep", Icons.Default.Bedtime, PlexColors.AccentSecondary, emptyList()),
            AmbientPreset("relax", "Relax", Icons.Default.Spa, PlexColors.Success, emptyList())
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
@HiltViewModel
class PlexNewsViewModel @Inject constructor() : ViewModel() {
    
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
class PlexCollectionsViewModel @Inject constructor() : ViewModel() {
    
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
class PlexCollectionDetailViewModel @Inject constructor(
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
    
    fun removeItem(item: PlexMediaItem) {
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
class PlexSyncViewModel @Inject constructor() : ViewModel() {
    
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
    
    fun configureService(service: com.universalmedialibrary.ui.plex.screens.SyncService) {
        // Configure sync service
    }
}

/**
 * Import/Export ViewModel (Simplified)
 */
@HiltViewModel
class PlexImportExportViewModel @Inject constructor() : ViewModel() {
    
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
class PlexMediaDetailViewModel @Inject constructor(
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
// ImportExportScreenState, ImportExportType are defined in PlexScreensData.kt
