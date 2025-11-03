package com.universalmedialibrary.ui.ambient

import androidx.compose.runtime.mutableStateOf
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.ambient.SoundLibrary
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Theme Manager Screen
 * Manages themed sound collections and their state
 */
@HiltViewModel
class ThemeManagerViewModel @Inject constructor() : ViewModel() {
    
    private val _collections = MutableStateFlow<List<SoundLibrary.SoundCollection>>(emptyList())
    val collections: StateFlow<List<SoundLibrary.SoundCollection>> = _collections.asStateFlow()
    
    private val _stats = MutableStateFlow(SoundLibrary.getStats())
    val stats: StateFlow<SoundLibrary.LibraryStats> = _stats.asStateFlow()
    
    val selectedTheme = mutableStateOf<String?>(null)
    
    private val expandedCollections = mutableSetOf<String>()
    
    init {
        loadCollections()
    }
    
    private fun loadCollections() {
        viewModelScope.launch {
            refreshData()
        }
    }
    
    private fun refreshData() {
        val allCollections = SoundLibrary.getAllCollections()
        
        _collections.value = if (selectedTheme.value != null) {
            allCollections.filter { it.theme == selectedTheme.value }
        } else {
            allCollections
        }.sortedWith(
            compareByDescending<SoundLibrary.SoundCollection> { it.enabled }
                .thenBy { it.theme }
                .thenBy { it.name }
        )
        
        _stats.value = SoundLibrary.getStats()
    }
    
    fun toggleCollection(collectionId: String) {
        viewModelScope.launch {
            val collection = SoundLibrary.getCollection(collectionId)
            if (collection != null) {
                SoundLibrary.setCollectionEnabled(collectionId, !collection.enabled)
                refreshData()
            }
        }
    }
    
    fun filterByTheme(theme: String?) {
        selectedTheme.value = theme
        refreshData()
    }
    
    fun toggleExpanded(collectionId: String) {
        if (expandedCollections.contains(collectionId)) {
            expandedCollections.remove(collectionId)
        } else {
            expandedCollections.add(collectionId)
        }
        // Trigger recomposition by updating collections
        _collections.value = _collections.value.toList()
    }
    
    fun isExpanded(collectionId: String): Boolean {
        return expandedCollections.contains(collectionId)
    }
    
    override fun onCleared() {
        super.onCleared()
        expandedCollections.clear()
    }
}
