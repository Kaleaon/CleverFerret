package com.universalmedialibrary.ui.gallery

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.gallery.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Gallery ViewModel
 * 
 * Manages UI state for the gallery feature with MVI pattern.
 * Provides Plex-like functionality with albums, smart collections, filtering, and tagging.
 */
@HiltViewModel
class GalleryViewModel @Inject constructor(
    private val galleryRepository: GalleryRepository,
    private val preferencesStore: GalleryPreferencesStore
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(GalleryUiState())
    val uiState: StateFlow<GalleryUiState> = _uiState.asStateFlow()
    
    init {
        initialize()
        observeSettings()
        observeAlbums()
        observeSmartCollections()
        observeTags()
    }
    
    private fun initialize() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            
            try {
                galleryRepository.initialize()
                galleryRepository.loadAllMedia()
                
                _uiState.update { it.copy(isLoading = false) }
            } catch (e: Exception) {
                _uiState.update { it.copy(
                    isLoading = false,
                    error = e.message
                )}
            }
        }
    }
    
    private fun observeSettings() {
        viewModelScope.launch {
            preferencesStore.settings.collect { settings ->
                _uiState.update { it.copy(
                    viewMode = settings.viewMode,
                    sortOrder = settings.sortOrder,
                    showHidden = settings.showHidden,
                    gridColumns = settings.gridColumns
                )}
            }
        }
    }
    
    private fun observeAlbums() {
        viewModelScope.launch {
            combine(
                galleryRepository.observeAlbums(),
                preferencesStore.pinnedAlbums,
                preferencesStore.hiddenAlbums
            ) { albums, pinned, hidden ->
                Triple(albums, pinned, hidden)
            }.collect { (albums, pinned, hidden) ->
                val processedAlbums = albums.map { album ->
                    album.copy(
                        isPinned = album.id in pinned,
                        isHidden = album.id in hidden
                    )
                }.sortedWith(
                    compareByDescending<GalleryAlbum> { it.isPinned }
                        .thenByDescending { it.latestTimestamp }
                )
                
                _uiState.update { it.copy(
                    albums = processedAlbums,
                    totalItemCount = processedAlbums.sumOf { a -> a.itemCount },
                    totalSize = processedAlbums.sumOf { a -> a.totalSize }
                )}
            }
        }
    }
    
    private fun observeSmartCollections() {
        viewModelScope.launch {
            galleryRepository.smartCollections.collect { collections ->
                _uiState.update { it.copy(smartCollections = collections) }
            }
        }
    }
    
    private fun observeTags() {
        viewModelScope.launch {
            galleryRepository.observeGalleryTags().collect { tags ->
                _uiState.update { it.copy(tags = tags) }
            }
        }
    }
    
    /**
     * Handle UI events
     */
    fun onEvent(event: GalleryEvent) {
        when (event) {
            is GalleryEvent.LoadAlbums -> loadAlbums()
            is GalleryEvent.OpenAlbum -> openAlbum(event.albumId)
            is GalleryEvent.OpenItem -> openItem(event.itemId)
            is GalleryEvent.NavigateBack -> navigateBack()
            
            is GalleryEvent.SetSortOrder -> setSortOrder(event.order)
            is GalleryEvent.SetViewMode -> setViewMode(event.mode)
            is GalleryEvent.ApplyFilter -> applyFilter(event.filter)
            is GalleryEvent.Search -> search(event.query)
            
            is GalleryEvent.ToggleSelection -> toggleSelection(event.itemId)
            is GalleryEvent.SelectAll -> selectAll()
            is GalleryEvent.ClearSelection -> clearSelection()
            is GalleryEvent.SetSelectionMode -> setSelectionMode(event.enabled)
            
            is GalleryEvent.ToggleFavorite -> toggleFavorite(event.itemId)
            is GalleryEvent.SetRating -> setRating(event.itemId, event.rating)
            is GalleryEvent.AddTags -> addTags(event.itemIds, event.tagIds)
            is GalleryEvent.RemoveTags -> removeTags(event.itemIds, event.tagIds)
            is GalleryEvent.HideItems -> hideItems(event.itemIds)
            is GalleryEvent.UnhideItems -> unhideItems(event.itemIds)
            is GalleryEvent.DeleteItems -> deleteItems(event.itemIds)
            is GalleryEvent.ShareItems -> shareItems(event.itemIds)
            
            is GalleryEvent.CreateAlbum -> createAlbum(event.name)
            is GalleryEvent.RenameAlbum -> { /* Not supported for MediaStore folders */ }
            is GalleryEvent.SetAlbumCover -> { /* Custom covers stored in preferences */ }
            is GalleryEvent.ToggleAlbumPin -> toggleAlbumPin(event.albumId)
            is GalleryEvent.HideAlbum -> hideAlbum(event.albumId)
            
            is GalleryEvent.CreateTag -> createTag(event.name, event.color)
            is GalleryEvent.DeleteTag -> deleteTag(event.tagId)
            is GalleryEvent.RenameTag -> renameTag(event.tagId, event.newName)
            
            is GalleryEvent.NamePerson -> { /* Future: Face recognition */ }
            is GalleryEvent.MergePeople -> { /* Future: Face recognition */ }
            is GalleryEvent.HidePerson -> { /* Future: Face recognition */ }
            
            is GalleryEvent.OpenSmartCollection -> openSmartCollection(event.type)
            is GalleryEvent.RefreshSmartCollections -> refreshSmartCollections()
            
            is GalleryEvent.Refresh -> refresh()
            is GalleryEvent.ScanForNewMedia -> scanForNewMedia()
        }
    }
    
    // ==================== NAVIGATION ====================
    
    private fun loadAlbums() {
        viewModelScope.launch {
            _uiState.update { it.copy(
                isLoading = true,
                currentAlbum = null,
                currentSmartCollection = null
            )}
            
            try {
                galleryRepository.getAlbums()
                _uiState.update { it.copy(isLoading = false) }
            } catch (e: Exception) {
                _uiState.update { it.copy(
                    isLoading = false,
                    error = e.message
                )}
            }
        }
    }
    
    private fun openAlbum(albumId: String) {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            
            try {
                val album = _uiState.value.albums.find { it.id == albumId }
                val items = galleryRepository.getItemsForAlbum(albumId, _uiState.value.sortOrder)
                
                val filteredItems = if (_uiState.value.showHidden) {
                    items
                } else {
                    items.filter { !it.isHidden }
                }
                
                _uiState.update { it.copy(
                    isLoading = false,
                    currentAlbum = album,
                    currentSmartCollection = null,
                    items = filteredItems,
                    selectedItemIds = emptySet(),
                    isSelectionMode = false
                )}
            } catch (e: Exception) {
                _uiState.update { it.copy(
                    isLoading = false,
                    error = e.message
                )}
            }
        }
    }
    
    private fun openSmartCollection(type: SmartGalleryCollectionType) {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            
            try {
                val collection = _uiState.value.smartCollections.find { it.type == type }
                val items = galleryRepository.getItemsForSmartCollection(type, _uiState.value.sortOrder)
                
                _uiState.update { it.copy(
                    isLoading = false,
                    currentAlbum = null,
                    currentSmartCollection = collection,
                    items = items,
                    selectedItemIds = emptySet(),
                    isSelectionMode = false
                )}
            } catch (e: Exception) {
                _uiState.update { it.copy(
                    isLoading = false,
                    error = e.message
                )}
            }
        }
    }
    
    private fun openItem(itemId: Long) {
        val item = _uiState.value.items.find { it.id == itemId }
        _uiState.update { it.copy(currentItem = item) }
    }
    
    private fun navigateBack() {
        val state = _uiState.value
        when {
            state.currentItem != null -> {
                _uiState.update { it.copy(currentItem = null) }
            }
            state.currentAlbum != null || state.currentSmartCollection != null -> {
                _uiState.update { it.copy(
                    currentAlbum = null,
                    currentSmartCollection = null,
                    items = emptyList(),
                    selectedItemIds = emptySet(),
                    isSelectionMode = false
                )}
            }
        }
    }
    
    // ==================== SORTING & FILTERING ====================
    
    private fun setSortOrder(order: GallerySortOrder) {
        viewModelScope.launch {
            preferencesStore.setSortOrder(order)
            
            // Re-sort current items
            val state = _uiState.value
            when {
                state.currentAlbum != null -> openAlbum(state.currentAlbum.id)
                state.currentSmartCollection != null -> openSmartCollection(state.currentSmartCollection.type)
            }
        }
    }
    
    private fun setViewMode(mode: GalleryViewMode) {
        viewModelScope.launch {
            preferencesStore.setViewMode(mode)
        }
    }
    
    private fun applyFilter(filter: GalleryFilterRules?) {
        viewModelScope.launch {
            _uiState.update { it.copy(
                isLoading = true,
                activeFilter = filter
            )}
            
            try {
                val items = if (filter != null) {
                    galleryRepository.getFilteredItems(filter, _uiState.value.sortOrder)
                } else {
                    emptyList()
                }
                
                _uiState.update { it.copy(
                    isLoading = false,
                    items = items
                )}
            } catch (e: Exception) {
                _uiState.update { it.copy(
                    isLoading = false,
                    error = e.message
                )}
            }
        }
    }
    
    private fun search(query: String) {
        _uiState.update { it.copy(searchQuery = query) }
        
        if (query.isBlank()) {
            _uiState.update { it.copy(searchResults = emptyList()) }
            return
        }
        
        viewModelScope.launch {
            try {
                val results = galleryRepository.searchItems(query, _uiState.value.sortOrder)
                _uiState.update { it.copy(searchResults = results) }
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message) }
            }
        }
    }
    
    // ==================== SELECTION ====================
    
    private fun toggleSelection(itemId: Long) {
        val current = _uiState.value.selectedItemIds
        val updated = if (itemId in current) current - itemId else current + itemId
        
        _uiState.update { it.copy(
            selectedItemIds = updated,
            isSelectionMode = updated.isNotEmpty()
        )}
    }
    
    private fun selectAll() {
        val allIds = _uiState.value.items.map { it.id }.toSet()
        _uiState.update { it.copy(
            selectedItemIds = allIds,
            isSelectionMode = true
        )}
    }
    
    private fun clearSelection() {
        _uiState.update { it.copy(
            selectedItemIds = emptySet(),
            isSelectionMode = false
        )}
    }
    
    private fun setSelectionMode(enabled: Boolean) {
        _uiState.update { it.copy(
            isSelectionMode = enabled,
            selectedItemIds = if (!enabled) emptySet() else it.selectedItemIds
        )}
    }
    
    // ==================== ITEM ACTIONS ====================
    
    private fun toggleFavorite(itemId: Long) {
        viewModelScope.launch {
            galleryRepository.toggleFavorite(itemId)
            refreshCurrentView()
        }
    }
    
    private fun setRating(itemId: Long, rating: Int) {
        viewModelScope.launch {
            galleryRepository.setRating(itemId, rating)
        }
    }
    
    private fun addTags(itemIds: Set<Long>, tagIds: Set<Long>) {
        viewModelScope.launch {
            galleryRepository.addTags(itemIds, tagIds)
        }
    }
    
    private fun removeTags(itemIds: Set<Long>, tagIds: Set<Long>) {
        viewModelScope.launch {
            galleryRepository.removeTags(itemIds, tagIds)
        }
    }
    
    private fun hideItems(itemIds: Set<Long>) {
        viewModelScope.launch {
            itemIds.forEach { galleryRepository.setHidden(it, true) }
            clearSelection()
            refreshCurrentView()
        }
    }
    
    private fun unhideItems(itemIds: Set<Long>) {
        viewModelScope.launch {
            itemIds.forEach { galleryRepository.setHidden(it, false) }
            clearSelection()
            refreshCurrentView()
        }
    }
    
    private fun deleteItems(itemIds: Set<Long>) {
        viewModelScope.launch {
            val result = galleryRepository.deleteItems(itemIds)
            
            when (result) {
                is DeleteResult.Success -> {
                    clearSelection()
                    refreshCurrentView()
                }
                is DeleteResult.RequiresPermission -> {
                    _uiState.update { it.copy(
                        pendingDeleteRequest = PendingDeleteRequest(
                            itemIds = itemIds,
                            pendingIntent = result.pendingIntent
                        )
                    )}
                }
                is DeleteResult.Error -> {
                    _uiState.update { it.copy(error = result.message) }
                }
            }
        }
    }
    
    private fun shareItems(itemIds: Set<Long>) {
        val items = _uiState.value.items.filter { it.id in itemIds }
        _uiState.update { it.copy(
            pendingShareItems = items
        )}
    }
    
    /**
     * Call after user confirms deletion on Android 11+
     */
    fun onDeleteConfirmed() {
        val pending = _uiState.value.pendingDeleteRequest ?: return
        galleryRepository.onDeleteConfirmed(pending.itemIds)
        
        _uiState.update { it.copy(
            pendingDeleteRequest = null,
            selectedItemIds = emptySet(),
            isSelectionMode = false
        )}
        
        refreshCurrentView()
    }
    
    fun onDeleteCancelled() {
        _uiState.update { it.copy(pendingDeleteRequest = null) }
    }
    
    fun onShareHandled() {
        _uiState.update { it.copy(pendingShareItems = null) }
    }
    
    // ==================== ALBUM ACTIONS ====================
    
    private fun createAlbum(name: String) {
        // Note: Creating folders in MediaStore is complex
        // This would create a new folder in Pictures
        viewModelScope.launch {
            // Implementation would use MediaStore to create folder
            refresh()
        }
    }
    
    private fun toggleAlbumPin(albumId: String) {
        viewModelScope.launch {
            preferencesStore.toggleAlbumPin(albumId)
        }
    }
    
    private fun hideAlbum(albumId: String) {
        viewModelScope.launch {
            preferencesStore.toggleAlbumHidden(albumId)
        }
    }
    
    // ==================== TAG ACTIONS ====================
    
    private fun createTag(name: String, color: String?) {
        viewModelScope.launch {
            galleryRepository.createTag(name, color)
        }
    }
    
    private fun deleteTag(tagId: Long) {
        viewModelScope.launch {
            galleryRepository.deleteTag(tagId)
        }
    }
    
    private fun renameTag(tagId: Long, newName: String) {
        viewModelScope.launch {
            galleryRepository.renameTag(tagId, newName)
        }
    }
    
    // ==================== REFRESH ====================
    
    private fun refresh() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            
            try {
                galleryRepository.refresh()
                refreshCurrentView()
            } catch (e: Exception) {
                _uiState.update { it.copy(
                    isLoading = false,
                    error = e.message
                )}
            }
        }
    }
    
    private fun refreshSmartCollections() {
        viewModelScope.launch {
            galleryRepository.refreshSmartCollections()
        }
    }
    
    private fun scanForNewMedia() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            galleryRepository.loadAllMedia()
            refreshCurrentView()
        }
    }
    
    private fun refreshCurrentView() {
        val state = _uiState.value
        when {
            state.currentAlbum != null -> openAlbum(state.currentAlbum.id)
            state.currentSmartCollection != null -> openSmartCollection(state.currentSmartCollection.type)
            else -> _uiState.update { it.copy(isLoading = false) }
        }
    }
    
    fun clearError() {
        _uiState.update { it.copy(error = null) }
    }
}

/**
 * UI State for Gallery
 */
data class GalleryUiState(
    val isLoading: Boolean = false,
    val error: String? = null,
    
    // Albums view
    val albums: List<GalleryAlbum> = emptyList(),
    val currentAlbum: GalleryAlbum? = null,
    
    // Smart collections
    val smartCollections: List<SmartGalleryCollection> = emptyList(),
    val currentSmartCollection: SmartGalleryCollection? = null,
    
    // Current items
    val items: List<GalleryItem> = emptyList(),
    val currentItem: GalleryItem? = null,
    
    // Selection
    val selectedItemIds: Set<Long> = emptySet(),
    val isSelectionMode: Boolean = false,
    
    // View settings
    val viewMode: GalleryViewMode = GalleryViewMode.GRID_MEDIUM,
    val sortOrder: GallerySortOrder = GallerySortOrder.DATE_TAKEN_DESC,
    val gridColumns: Int = 3,
    val showHidden: Boolean = false,
    val activeFilter: GalleryFilterRules? = null,
    
    // Search
    val searchQuery: String = "",
    val searchResults: List<GalleryItem> = emptyList(),
    
    // Tags
    val tags: List<GalleryTag> = emptyList(),
    
    // Statistics
    val totalItemCount: Int = 0,
    val totalSize: Long = 0,
    
    // Pending operations
    val pendingDeleteRequest: PendingDeleteRequest? = null,
    val pendingShareItems: List<GalleryItem>? = null
) {
    val hasSelection: Boolean
        get() = selectedItemIds.isNotEmpty()
    
    val selectedCount: Int
        get() = selectedItemIds.size
    
    val isInAlbum: Boolean
        get() = currentAlbum != null || currentSmartCollection != null
    
    val currentTitle: String
        get() = currentAlbum?.name 
            ?: currentSmartCollection?.name 
            ?: "Gallery"
    
    val formattedTotalSize: String
        get() = when {
            totalSize >= 1_000_000_000 -> String.format("%.2f GB", totalSize / 1_000_000_000.0)
            totalSize >= 1_000_000 -> String.format("%.2f MB", totalSize / 1_000_000.0)
            totalSize >= 1_000 -> String.format("%.2f KB", totalSize / 1_000.0)
            else -> "$totalSize B"
        }
}

/**
 * Pending delete request (for Android 11+ confirmation)
 */
data class PendingDeleteRequest(
    val itemIds: Set<Long>,
    val pendingIntent: android.app.PendingIntent
)
