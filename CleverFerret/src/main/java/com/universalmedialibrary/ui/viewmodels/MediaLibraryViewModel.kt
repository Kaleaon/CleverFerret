package com.universalmedialibrary.ui.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.ui.components.MediaItemData
import com.universalmedialibrary.ui.models.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Media Library Screen
 * 
 * Manages state for:
 * - Selected media category
 * - Media items list from database
 * - Loading state
 * - Settings dialog visibility
 * - App settings with persistence
 */
@HiltViewModel
class MediaLibraryViewModel @Inject constructor(
    private val database: AppDatabase,
    private val settingsRepository: SettingsRepository
) : ViewModel() {
    
    // UI State
    private val _selectedCategory = MutableStateFlow(MediaCategory.MUSIC)
    val selectedCategory: StateFlow<MediaCategory> = _selectedCategory.asStateFlow()
    
    private val _mediaItems = MutableStateFlow<List<MediaItemData>>(emptyList())
    val mediaItems: StateFlow<List<MediaItemData>> = _mediaItems.asStateFlow()
    
    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()
    
    private val _showSettingsDialog = MutableStateFlow(false)
    val showSettingsDialog: StateFlow<Boolean> = _showSettingsDialog.asStateFlow()
    
    // Settings State - loaded from DataStore
    private val _appSettings = MutableStateFlow(AppSettings())
    val appSettings: StateFlow<AppSettings> = _appSettings.asStateFlow()
    
    init {
        // Load initial data
        loadMediaItems()
        loadSettings()
    }
    
    /**
     * Load settings from DataStore
     */
    private fun loadSettings() {
        viewModelScope.launch {
            combine(
                settingsRepository.themeFlow,
                settingsRepository.darkModeFlow,
                settingsRepository.apiSettingsFlow
            ) { theme, darkMode, apiSettings ->
                _appSettings.value = _appSettings.value.copy(
                    apiKeys = ApiKeys(
                        googleBooksApiKey = apiSettings.googleBooksApiKey,
                        tmdbApiKey = apiSettings.tmdbApiKey,
                        tvdbApiKey = apiSettings.tvdbApiKey
                    )
                )
            }.collect()
        }
    }
    
    /**
     * Select a media category
     */
    fun selectCategory(category: MediaCategory) {
        _selectedCategory.value = category
        loadMediaItems()
    }
    
    /**
     * Load media items for current category from database
     */
    fun loadMediaItems() {
        viewModelScope.launch {
            _isLoading.value = true
            
            try {
                // Map category to database media type
                val mediaType = mapCategoryToMediaType(_selectedCategory.value)
                
                // Query database for items of this type
                database.mediaItemDao().getMediaItemsByType(mediaType)
                    .catch { e ->
                        // On error, show empty list
                        _mediaItems.value = emptyList()
                        _isLoading.value = false
                    }
                    .collect { items ->
                        // Map database entities to UI model
                        _mediaItems.value = items.map { it.toMediaItemData() }
                        _isLoading.value = false
                    }
            } catch (e: Exception) {
                _mediaItems.value = emptyList()
                _isLoading.value = false
            }
        }
    }
    
    /**
     * Map MediaCategory to database media type string
     */
    private fun mapCategoryToMediaType(category: MediaCategory): String {
        return when (category) {
            MediaCategory.MUSIC -> "MUSIC"
            MediaCategory.MOVIES -> "MOVIE"
            MediaCategory.TV_SHOWS -> "TV_SHOW"
            MediaCategory.RADIO -> "RADIO"
            MediaCategory.EBOOKS -> "BOOK"
            MediaCategory.COMICS -> "COMIC"
            MediaCategory.AUDIOBOOKS -> "AUDIOBOOK"
            MediaCategory.PODCASTS -> "PODCAST"
            MediaCategory.MAGAZINES -> "MAGAZINE"
            MediaCategory.NEWS -> "NEWS"
            MediaCategory.FANFICTION -> "FANFICTION"
        }
    }
    
    /**
     * Convert MediaItem entity to MediaItemData for UI
     */
    private fun MediaItem.toMediaItemData(): MediaItemData {
        return MediaItemData(
            id = itemId,
            title = fileName.substringBeforeLast('.'),
            subtitle = null, // TODO: Extract from metadata
            year = null, // TODO: Extract from metadata  
            imageUrl = null, // TODO: Extract from metadata or thumbnail
            progress = null, // TODO: Load from progress tracking
            rating = null, // TODO: Load from ratings
            mediaType = mediaType
        )
    }
    
    /**
     * Show settings dialog
     */
    fun showSettings() {
        _showSettingsDialog.value = true
    }
    
    /**
     * Hide settings dialog
     */
    fun hideSettings() {
        _showSettingsDialog.value = false
    }
    
    /**
     * Update app settings and persist to DataStore
     */
    fun updateSettings(settings: AppSettings) {
        viewModelScope.launch {
            _appSettings.value = settings
            
            // Persist API settings to DataStore
            settingsRepository.setApiSettings(
                com.universalmedialibrary.data.settings.ApiSettings(
                    googleBooksApiKey = settings.apiKeys.googleBooksApiKey,
                    tmdbApiKey = settings.apiKeys.tmdbApiKey,
                    tvdbApiKey = settings.apiKeys.tvdbApiKey,
                    plexServerUrl = "",
                    plexAuthToken = ""
                )
            )
        }
    }
    
    /**
     * Update API keys
     */
    fun updateApiKeys(apiKeys: ApiKeys) {
        updateSettings(_appSettings.value.copy(apiKeys = apiKeys))
    }
    
    /**
     * Update reader settings
     */
    fun updateReaderSettings(readerSettings: ReaderSettings) {
        updateSettings(_appSettings.value.copy(reader = readerSettings))
    }
    
    /**
     * Update audiobook settings
     */
    fun updateAudiobookSettings(audiobookSettings: AudiobookSettings) {
        updateSettings(_appSettings.value.copy(audiobook = audiobookSettings))
    }
    
    /**
     * Update metadata settings
     */
    fun updateMetadataSettings(metadataSettings: MetadataSettings) {
        updateSettings(_appSettings.value.copy(metadata = metadataSettings))
    }
    
    /**
     * Update cloud sync settings
     */
    fun updateCloudSyncSettings(cloudSyncSettings: CloudSyncSettings) {
        updateSettings(_appSettings.value.copy(cloudSync = cloudSyncSettings))
    }
    
    /**
     * Update interface settings
     */
    fun updateInterfaceSettings(interfaceSettings: InterfaceSettings) {
        updateSettings(_appSettings.value.copy(interface_ = interfaceSettings))
    }
    
    /**
     * Update import settings
     */
    fun updateImportSettings(importSettings: ImportSettings) {
        updateSettings(_appSettings.value.copy(import = importSettings))
    }
    
    /**
     * Refresh current category
     */
    fun refresh() {
        loadMediaItems()
    }
}
