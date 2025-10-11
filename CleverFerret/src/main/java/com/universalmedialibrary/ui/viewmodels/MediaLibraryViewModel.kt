package com.universalmedialibrary.ui.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.MediaRepository
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
    private val mediaRepository: MediaRepository
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
            
            try {
                // Map category to media type
                val mediaType = when (_selectedCategory.value) {
                    MediaCategory.MUSIC -> "MUSIC_TRACK"
                    MediaCategory.AUDIOBOOKS -> "BOOK"
                    MediaCategory.MOVIES -> "MOVIE"
                    MediaCategory.TV_SHOWS -> "TV_SHOW"
                    MediaCategory.BOOKS -> "BOOK"
                    MediaCategory.COMICS -> "COMIC"
                    MediaCategory.PODCASTS -> "PODCAST"
                    MediaCategory.RADIO -> "RADIO_STATION"
                }
                
                // Load items from database
                mediaRepository.getMediaItemsByType(mediaType).collect { dbItems ->
                    _mediaItems.value = dbItems.map { item ->
                        MediaItemData(
                            id = item.itemId,
                            title = item.fileName.substringBeforeLast('.'),
                            subtitle = "", // Could load from metadata
                            year = "", // Could load from metadata
                            imageUrl = null,
                            progress = null, // Could load from progress tracking
                            rating = null, // Could load from ratings
                            mediaType = item.mediaType
                        )
                    }
                    
                    // If no items in DB, show helpful message or generate sample data
                    if (dbItems.isEmpty()) {
                        _mediaItems.value = generatePlaceholderData(_selectedCategory.value)
                    }
                }
            } catch (e: Exception) {
                // If error, fall back to placeholder data
                _mediaItems.value = generatePlaceholderData(_selectedCategory.value)
            } finally {
                _isLoading.value = false
            }
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
            // Settings persistence would be handled by DataStore in a production app
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
