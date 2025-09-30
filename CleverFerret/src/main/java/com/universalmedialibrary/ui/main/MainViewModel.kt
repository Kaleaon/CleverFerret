package com.universalmedialibrary.ui.main

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.Library
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class MainViewModel @Inject constructor() : ViewModel() {
    private val _libraries = MutableStateFlow<List<Library>>(emptyList())
    val libraries: StateFlow<List<Library>> = _libraries
    
    fun addLibrary(name: String, type: String, path: String) {
        viewModelScope.launch {
            // TODO: Implement library creation
        }
    }
}
