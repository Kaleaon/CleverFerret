package com.universalmedialibrary.ui.reader

import androidx.lifecycle.ViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject

/**
 * Comic Reader ViewModel - Placeholder for v1.0.0
 * Full implementation in v1.1.0
 */
@HiltViewModel
class ComicReaderViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(ComicReaderUiState())
    val uiState: StateFlow<ComicReaderUiState> = _uiState.asStateFlow()
}

data class ComicReaderUiState(
    val isLoading: Boolean = false
)
