package com.universalmedialibrary.ui.collections

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.CollectionType
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.UnifiedCollection
import com.universalmedialibrary.data.repository.CollectionRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class CollectionsViewModel @Inject constructor(
    private val repository: CollectionRepository
) : ViewModel() {

    val collections: StateFlow<List<UnifiedCollection>> = repository.getCollections()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    fun createCollection(name: String, type: CollectionType, description: String?) {
        viewModelScope.launch {
            repository.createCollection(name, type, description)
        }
    }

    fun addItem(collectionId: Long, itemId: Long) {
        viewModelScope.launch { repository.addItem(collectionId, itemId) }
    }

    fun removeItem(collectionId: Long, itemId: Long) {
        viewModelScope.launch { repository.removeItem(collectionId, itemId) }
    }
}

