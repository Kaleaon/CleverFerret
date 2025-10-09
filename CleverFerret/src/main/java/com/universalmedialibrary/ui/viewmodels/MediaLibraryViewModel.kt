package com.universalmedialibrary.ui.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.ui.components.MediaItemData
import com.universalmedialibrary.ui.models.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject
import kotlin.random.Random

/**
 * ViewModel for Media Library Screen
 * 
 * Manages state for:
 * - Selected media category
 * - Media items list
 * - Loading state
 * - Settings dialog visibility
 * - App settings
 */
@HiltViewModel
class MediaLibraryViewModel @Inject constructor(
    // Future: Inject repositories here
    // private val mediaRepository: MediaRepository,
    // private val settingsRepository: SettingsRepository
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
    
    // Settings State
    private val _appSettings = MutableStateFlow(AppSettings())
    val appSettings: StateFlow<AppSettings> = _appSettings.asStateFlow()
    
    init {
        // Load initial data
        loadMediaItems()
        // Future: Load settings from DataStore
        // loadSettings()
    }
    
    /**
     * Select a media category
     */
    fun selectCategory(category: MediaCategory) {
        _selectedCategory.value = category
        loadMediaItems()
    }
    
    /**
     * Load media items for current category
     */
    fun loadMediaItems() {
        viewModelScope.launch {
            _isLoading.value = true
            
            // TODO: Replace with actual database query
            // val items = mediaRepository.getItemsByCategory(_selectedCategory.value)
            
            // Placeholder data for testing
            _mediaItems.value = generatePlaceholderData(_selectedCategory.value)
            
            _isLoading.value = false
        }
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
     * Update app settings
     */
    fun updateSettings(settings: AppSettings) {
        viewModelScope.launch {
            _appSettings.value = settings
            // TODO: Persist to DataStore
            // settingsRepository.saveSettings(settings)
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
     * Generate placeholder data for testing
     */
    private fun generatePlaceholderData(category: MediaCategory): List<MediaItemData> {
        val random = Random.Default
        return List(20) { index ->
            MediaItemData(
                id = index.toLong(),
                title = "${category.label} Item ${index + 1}",
                subtitle = "Artist or Author",
                year = "202${random.nextInt(0, 4)}",
                imageUrl = null, // Use placeholder letters
                progress = if (index % 3 == 0) random.nextFloat() * 0.8f + 0.1f else null,
                rating = if (index % 2 == 0) random.nextFloat() * 2f + 3f else null,
                mediaType = category.label.uppercase()
            )
        }
    }
    
    /**
     * Refresh current category
     */
    fun refresh() {
        loadMediaItems()
    }
}
