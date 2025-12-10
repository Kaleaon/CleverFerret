package com.universalmedialibrary.ui.plex.viewmodels

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.*
import com.universalmedialibrary.services.radio.RadioBrowserService
import com.universalmedialibrary.services.webfiction.WebFictionService
import com.universalmedialibrary.services.opds.OPDSCatalogService
import com.universalmedialibrary.services.ambient.AmbientSoundService
import com.universalmedialibrary.services.news.NewsManager
import com.universalmedialibrary.ui.plex.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Radio ViewModel
 */
@HiltViewModel
class PlexRadioViewModel @Inject constructor(
    private val radioService: RadioBrowserService,
    private val radioRepository: RadioRepository
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(RadioScreenState())
    val uiState: StateFlow<RadioScreenState> = _uiState.asStateFlow()
    
    init {
        loadRadioData()
    }
    
    private fun loadRadioData() {
        viewModelScope.launch {
            combine(
                radioRepository.getFavoriteStations(),
                radioService.getPopularStations(),
                radioRepository.getRecentlyPlayed(),
                radioService.getCategories()
            ) { favorites, popular, recent, categories ->
                RadioScreenState(
                    favoriteStations = favorites.map { it.toRadioStation() },
                    popularStations = popular.map { it.toRadioStation() },
                    recentlyPlayed = recent.map { it.toRadioStation() },
                    categories = categories.map { it.toRadioCategory() },
                    fmAvailable = checkFmAvailable(),
                    hdAvailable = checkHdAvailable()
                )
            }.collect { state ->
                _uiState.value = state
            }
        }
    }
    
    fun playStation(station: RadioStation) {
        viewModelScope.launch {
            radioService.playStation(station.streamUrl)
            _uiState.update { it.copy(nowPlaying = station) }
            radioRepository.addToRecentlyPlayed(station.id)
        }
    }
    
    fun toggleFavorite(station: RadioStation) {
        viewModelScope.launch {
            if (station.isFavorite) {
                radioRepository.removeFavorite(station.id)
            } else {
                radioRepository.addFavorite(station.id)
            }
            loadRadioData()
        }
    }
    
    fun selectCategory(category: RadioCategory) {
        viewModelScope.launch {
            val stations = radioService.getStationsByCategory(category.id)
            // Update UI with filtered stations
        }
    }
    
    private fun checkFmAvailable(): Boolean = false
    private fun checkHdAvailable(): Boolean = false
    
    private fun Any.toRadioStation() = RadioStation(
        id = hashCode().toString(),
        name = toString(),
        logoUrl = null,
        streamUrl = "",
        genre = "Unknown"
    )
    
    private fun Any.toRadioCategory() = RadioCategory(
        id = hashCode().toString(),
        name = toString(),
        icon = androidx.compose.material.icons.Icons.Default.Radio,
        color = com.universalmedialibrary.ui.plex.theme.PlexColors.AccentPrimary,
        stationCount = 0
    )
}

/**
 * Web Fiction ViewModel
 */
@HiltViewModel
class PlexWebFictionViewModel @Inject constructor(
    private val webFictionService: WebFictionService,
    private val webFictionRepository: WebFictionRepository
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(WebFictionScreenState())
    val uiState: StateFlow<WebFictionScreenState> = _uiState.asStateFlow()
    
    init {
        loadWebFictionData()
    }
    
    private fun loadWebFictionData() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            
            combine(
                webFictionRepository.getFollowing(),
                webFictionRepository.getRecentUpdates(),
                webFictionService.getSupportedSources()
            ) { following, updates, sources ->
                WebFictionScreenState(
                    followingStories = following.map { it.toWebFictionStory() },
                    recentUpdates = updates.map { it.toWebFictionUpdate() },
                    sources = sources.map { it.toWebFictionSource() },
                    isLoading = false
                )
            }.collect { state ->
                _uiState.value = state
            }
        }
    }
    
    fun refresh() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            webFictionService.refreshAllStories()
            loadWebFictionData()
        }
    }
    
    private fun Any.toWebFictionStory() = WebFictionStory(
        id = hashCode().toString(),
        title = toString(),
        author = "Unknown",
        source = WebFictionSource("unknown", "Unknown", null),
        coverUrl = null,
        chapterCount = 0,
        wordCount = null,
        status = StoryStatus.ONGOING,
        tags = emptyList()
    )
    
    private fun Any.toWebFictionUpdate() = WebFictionUpdate(
        storyId = hashCode().toString(),
        storyTitle = toString(),
        chapterTitle = "New Chapter",
        updatedTime = "Just now",
        source = WebFictionSource("unknown", "Unknown", null)
    )
    
    private fun Any.toWebFictionSource() = WebFictionSource(
        id = hashCode().toString(),
        name = toString(),
        iconUrl = null
    )
}

/**
 * OPDS Browser ViewModel
 */
@HiltViewModel
class PlexOPDSViewModel @Inject constructor(
    private val opdsService: OPDSCatalogService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(OPDSScreenState())
    val uiState: StateFlow<OPDSScreenState> = _uiState.asStateFlow()
    
    private val navigationStack = mutableListOf<String>()
    
    init {
        loadCatalogs()
    }
    
    private fun loadCatalogs() {
        viewModelScope.launch {
            val catalogs = opdsService.getCatalogs()
            _uiState.update {
                it.copy(
                    catalogs = catalogs.map { catalog -> catalog.toOPDSCatalog() },
                    currentPath = ""
                )
            }
        }
    }
    
    fun openCatalog(catalog: OPDSCatalog) {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            navigationStack.add(catalog.name)
            
            try {
                val entries = opdsService.fetchCatalog(catalog.url)
                _uiState.update {
                    it.copy(
                        entries = entries.map { entry -> entry.toOPDSEntry() },
                        currentPath = catalog.name,
                        navigationStack = navigationStack.toList(),
                        isLoading = false
                    )
                }
            } catch (e: Exception) {
                _uiState.update {
                    it.copy(
                        error = e.message,
                        isLoading = false
                    )
                }
            }
        }
    }
    
    fun navigateBack(): Boolean {
        if (navigationStack.isEmpty()) return false
        navigationStack.removeLast()
        
        if (navigationStack.isEmpty()) {
            loadCatalogs()
        } else {
            // Navigate to previous level
        }
        return true
    }
    
    fun search(query: String) {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            try {
                val results = opdsService.search(query)
                _uiState.update {
                    it.copy(
                        entries = results.map { entry -> entry.toOPDSEntry() },
                        isLoading = false
                    )
                }
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message, isLoading = false) }
            }
        }
    }
    
    fun addCatalog(url: String) {
        viewModelScope.launch {
            opdsService.addCatalog(url)
            loadCatalogs()
        }
    }
    
    fun download(entry: OPDSEntry) {
        viewModelScope.launch {
            opdsService.downloadEntry(entry.id)
        }
    }
    
    private fun Any.toOPDSCatalog() = OPDSCatalog(
        id = hashCode().toString(),
        name = toString(),
        url = "",
        description = ""
    )
    
    private fun Any.toOPDSEntry() = OPDSEntry(
        id = hashCode().toString(),
        title = toString()
    )
}

/**
 * Ambient Sounds ViewModel
 */
@HiltViewModel
class PlexAmbientViewModel @Inject constructor(
    private val ambientService: AmbientSoundService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(AmbientScreenState())
    val uiState: StateFlow<AmbientScreenState> = _uiState.asStateFlow()
    
    init {
        loadAmbientData()
        observePlayback()
    }
    
    private fun loadAmbientData() {
        viewModelScope.launch {
            val categories = ambientService.getCategories()
            val presets = ambientService.getPresets()
            
            _uiState.update {
                it.copy(
                    categories = categories.map { cat -> cat.toAmbientCategory() },
                    presets = presets.map { preset -> preset.toAmbientPreset() }
                )
            }
        }
    }
    
    private fun observePlayback() {
        viewModelScope.launch {
            ambientService.activeSounds.collect { sounds ->
                _uiState.update {
                    it.copy(activeSounds = sounds.map { sound -> sound.toAmbientSound() })
                }
            }
        }
    }
    
    fun toggleSound(sound: AmbientSound) {
        viewModelScope.launch {
            if (_uiState.value.activeSounds.any { it.id == sound.id }) {
                ambientService.stopSound(sound.id)
            } else {
                ambientService.playSound(sound.id)
            }
        }
    }
    
    fun setVolume(sound: AmbientSound, volume: Float) {
        viewModelScope.launch {
            ambientService.setVolume(sound.id, volume)
        }
    }
    
    fun applyPreset(preset: AmbientPreset) {
        viewModelScope.launch {
            ambientService.applyPreset(preset.id)
            _uiState.update { it.copy(activePreset = preset) }
        }
    }
    
    fun savePreset(name: String) {
        viewModelScope.launch {
            val currentSounds = _uiState.value.activeSounds
            ambientService.savePreset(name, currentSounds.map { it.id })
            loadAmbientData()
        }
    }
    
    private fun Any.toAmbientCategory() = AmbientCategory(
        id = hashCode().toString(),
        name = toString(),
        icon = androidx.compose.material.icons.Icons.Default.Nature,
        sounds = emptyList()
    )
    
    private fun Any.toAmbientPreset() = AmbientPreset(
        id = hashCode().toString(),
        name = toString(),
        icon = androidx.compose.material.icons.Icons.Default.Spa,
        color = com.universalmedialibrary.ui.plex.theme.PlexColors.Success,
        sounds = emptyList()
    )
    
    private fun Any.toAmbientSound() = AmbientSound(
        id = hashCode().toString(),
        name = toString(),
        icon = androidx.compose.material.icons.Icons.Default.WaterDrop,
        color = com.universalmedialibrary.ui.plex.theme.PlexColors.Info,
        audioUrl = ""
    )
}

/**
 * News ViewModel
 */
@HiltViewModel
class PlexNewsViewModel @Inject constructor(
    private val newsManager: NewsManager
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(NewsScreenState())
    val uiState: StateFlow<NewsScreenState> = _uiState.asStateFlow()
    
    init {
        loadNewsData()
    }
    
    private fun loadNewsData() {
        viewModelScope.launch {
            val feeds = newsManager.getFeeds()
            val articles = newsManager.getArticles()
            val recipes = newsManager.getAvailableRecipes()
            
            _uiState.update {
                it.copy(
                    feeds = feeds.map { feed -> feed.toNewsFeed() },
                    articles = articles.map { article -> article.toNewsArticle() },
                    availableRecipes = recipes.map { recipe -> recipe.toNewsRecipe() }
                )
            }
        }
    }
    
    fun selectFeed(feed: NewsFeed) {
        viewModelScope.launch {
            _uiState.update { it.copy(selectedFeed = feed, isLoading = true) }
            val articles = if (feed.id == "all") {
                newsManager.getArticles()
            } else {
                newsManager.getArticlesByFeed(feed.id)
            }
            _uiState.update {
                it.copy(
                    articles = articles.map { article -> article.toNewsArticle() },
                    isLoading = false
                )
            }
        }
    }
    
    fun refresh() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            newsManager.refreshAll()
            loadNewsData()
        }
    }
    
    private fun Any.toNewsFeed() = NewsFeed(
        id = hashCode().toString(),
        name = toString()
    )
    
    private fun Any.toNewsArticle() = NewsArticle(
        id = hashCode().toString(),
        title = toString(),
        summary = null,
        content = null,
        imageUrl = null,
        feedName = "Unknown",
        feedId = "0",
        publishedDate = "Today"
    )
    
    private fun Any.toNewsRecipe() = NewsRecipe(
        id = hashCode().toString(),
        name = toString(),
        description = "News recipe",
        url = ""
    )
}

/**
 * Collections ViewModels
 */
@HiltViewModel
class PlexCollectionsViewModel @Inject constructor(
    private val collectionRepository: CollectionRepository
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(CollectionsScreenState())
    val uiState: StateFlow<CollectionsScreenState> = _uiState.asStateFlow()
    
    init {
        loadCollections()
    }
    
    private fun loadCollections() {
        viewModelScope.launch {
            collectionRepository.getAllCollections().collect { collections ->
                _uiState.update {
                    it.copy(collections = collections.map { c -> c.toCollection() })
                }
            }
        }
    }
    
    fun createCollection(name: String) {
        viewModelScope.launch {
            collectionRepository.createCollection(name)
            loadCollections()
        }
    }
    
    private fun Any.toCollection() = Collection(
        id = hashCode().toString(),
        name = toString(),
        coverUrls = emptyList(),
        itemCount = 0
    )
}

@HiltViewModel
class PlexCollectionDetailViewModel @Inject constructor(
    private val savedStateHandle: SavedStateHandle,
    private val collectionRepository: CollectionRepository
) : ViewModel() {
    
    private val collectionId: String = savedStateHandle.get<String>("collectionId") ?: ""
    
    private val _uiState = MutableStateFlow(CollectionDetailState(
        collection = Collection("", "Loading...", emptyList(), 0)
    ))
    val uiState: StateFlow<CollectionDetailState> = _uiState.asStateFlow()
    
    init {
        loadCollection()
    }
    
    private fun loadCollection() {
        viewModelScope.launch {
            val collection = collectionRepository.getCollection(collectionId)
            val items = collectionRepository.getCollectionItems(collectionId)
            _uiState.update {
                CollectionDetailState(
                    collection = collection?.toCollection() ?: Collection("", "Not Found", emptyList(), 0),
                    items = items.map { it.toPlexMediaItem() }
                )
            }
        }
    }
    
    fun removeItem(item: com.universalmedialibrary.ui.plex.components.PlexMediaItem) {
        viewModelScope.launch {
            collectionRepository.removeFromCollection(collectionId, item.id)
            loadCollection()
        }
    }
    
    private fun Any.toCollection() = Collection(
        id = hashCode().toString(),
        name = toString(),
        coverUrls = emptyList(),
        itemCount = 0
    )
    
    private fun Any.toPlexMediaItem() = com.universalmedialibrary.ui.plex.components.PlexMediaItem(
        id = hashCode().toString(),
        title = toString(),
        subtitle = null,
        imageUrl = null,
        mediaType = com.universalmedialibrary.ui.plex.components.PlexMediaType.BOOK,
        progress = 0f
    )
}

/**
 * Sync ViewModels
 */
@HiltViewModel
class PlexSyncViewModel @Inject constructor(
    private val syncRepository: SyncRepository
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(SyncScreenState())
    val uiState: StateFlow<SyncScreenState> = _uiState.asStateFlow()
    
    init {
        loadSyncState()
    }
    
    private fun loadSyncState() {
        viewModelScope.launch {
            // Load sync services and status
        }
    }
    
    fun syncNow() {
        viewModelScope.launch {
            _uiState.update { it.copy(isSyncing = true) }
            syncRepository.syncAll()
            _uiState.update { it.copy(isSyncing = false, lastSyncTime = "Just now") }
        }
    }
    
    fun configureService(service: SyncService) {
        // Navigate to service configuration
    }
}

@HiltViewModel
class PlexImportExportViewModel @Inject constructor(
    private val importExportRepository: ImportExportRepository
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(ImportExportScreenState())
    val uiState: StateFlow<ImportExportScreenState> = _uiState.asStateFlow()
    
    fun startImport(type: ImportExportType) {
        viewModelScope.launch {
            _uiState.update { it.copy(isProcessing = true) }
            importExportRepository.import(type)
            _uiState.update { it.copy(isProcessing = false) }
        }
    }
    
    fun startExport(type: ImportExportType) {
        viewModelScope.launch {
            _uiState.update { it.copy(isProcessing = true) }
            importExportRepository.export(type)
            _uiState.update { it.copy(isProcessing = false) }
        }
    }
}

/**
 * Media Detail ViewModel
 */
@HiltViewModel
class PlexMediaDetailViewModel @Inject constructor(
    private val savedStateHandle: SavedStateHandle,
    private val bookRepository: BookRepository,
    private val musicRepository: MusicRepository,
    private val videoRepository: VideoRepository,
    private val metadataService: com.universalmedialibrary.services.metadata.ComprehensiveMetadataService
) : ViewModel() {
    
    private val mediaType: String = savedStateHandle.get<String>("mediaType") ?: ""
    private val mediaId: String = savedStateHandle.get<String>("mediaId") ?: ""
    
    private val _uiState = MutableStateFlow(MediaDetailState())
    val uiState: StateFlow<MediaDetailState> = _uiState.asStateFlow()
    
    init {
        loadMediaDetail()
    }
    
    private fun loadMediaDetail() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            // Load media details based on type
            _uiState.update { it.copy(isLoading = false) }
        }
    }
    
    fun download() {
        viewModelScope.launch {
            // Start download
        }
    }
}

// Placeholder repository interfaces
interface RadioRepository {
    fun getFavoriteStations(): Flow<List<Any>>
    fun getRecentlyPlayed(): Flow<List<Any>>
    suspend fun addFavorite(id: String)
    suspend fun removeFavorite(id: String)
    suspend fun addToRecentlyPlayed(id: String)
}

interface SyncRepository {
    suspend fun syncAll()
}

interface ImportExportRepository {
    suspend fun import(type: ImportExportType)
    suspend fun export(type: ImportExportType)
}

data class MediaDetailState(
    val isLoading: Boolean = false,
    val title: String = "",
    val subtitle: String? = null,
    val description: String? = null,
    val imageUrl: String? = null
)
