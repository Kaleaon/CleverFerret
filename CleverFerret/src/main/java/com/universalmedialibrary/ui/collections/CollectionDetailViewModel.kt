package com.universalmedialibrary.ui.collections

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.UnifiedCollection
import com.universalmedialibrary.data.repository.CollectionRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class CollectionDetailViewModel @Inject constructor(
    private val repository: CollectionRepository
) : ViewModel() {

    private val _uiState = MutableStateFlow(CollectionDetailUiState())
    val uiState: StateFlow<CollectionDetailUiState> = _uiState.asStateFlow()

    private var currentCollectionId: Long = 0

    fun loadCollection(collectionId: Long) {
        currentCollectionId = collectionId
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true, error = null)

                // Load collection and items
                combine(
                    repository.getCollection(collectionId),
                    repository.getItemsInCollection(collectionId)
                ) { collection, items ->
                    CollectionDetailUiState(
                        isLoading = false,
                        collection = collection,
                        items = items,
                        error = null
                    )
                }.collect { state ->
                    _uiState.value = state.copy(
                        isEditMode = _uiState.value.isEditMode,
                        showAddItemsDialog = _uiState.value.showAddItemsDialog
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = e.message ?: "Failed to load collection"
                )
            }
        }
    }

    fun toggleEditMode() {
        _uiState.value = _uiState.value.copy(isEditMode = !_uiState.value.isEditMode)
    }

    fun removeItem(itemId: Long) {
        viewModelScope.launch {
            try {
                repository.removeItem(currentCollectionId, itemId)
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "Failed to remove item: ${e.message}"
                )
            }
        }
    }

    fun addItems(itemIds: List<Long>) {
        viewModelScope.launch {
            try {
                itemIds.forEach { itemId ->
                    repository.addItem(currentCollectionId, itemId)
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "Failed to add items: ${e.message}"
                )
            }
        }
    }

    fun deleteCollection() {
        viewModelScope.launch {
            try {
                repository.deleteCollection(currentCollectionId)
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "Failed to delete collection: ${e.message}"
                )
            }
        }
    }

    fun showAddItemsDialog() {
        _uiState.value = _uiState.value.copy(showAddItemsDialog = true)
    }

    fun hideAddItemsDialog() {
        _uiState.value = _uiState.value.copy(showAddItemsDialog = false)
    }

    fun reorderItems(orderedItemIds: List<Long>) {
        viewModelScope.launch {
            try {
                repository.reorderItems(currentCollectionId, orderedItemIds)
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "Failed to reorder items: ${e.message}"
                )
            }
        }
    }
}

data class CollectionDetailUiState(
    val isLoading: Boolean = false,
    val collection: UnifiedCollection? = null,
    val items: List<MediaItem> = emptyList(),
    val isEditMode: Boolean = false,
    val showAddItemsDialog: Boolean = false,
    val error: String? = null
)
