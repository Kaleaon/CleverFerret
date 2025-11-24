package com.universalmedialibrary.ui.books

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.BookSource
import com.universalmedialibrary.services.reading.BookSourceService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class BookSourceViewModel @Inject constructor(
    private val bookSourceService: BookSourceService
) : ViewModel() {

    private val _uiState = MutableStateFlow(BookSourceUiState())
    val uiState: StateFlow<BookSourceUiState> = _uiState.asStateFlow()

    init {
        loadBookSources()
    }

    private fun loadBookSources() {
        viewModelScope.launch {
            bookSourceService.getAllBookSources().collectLatest { sources ->
                _uiState.value = _uiState.value.copy(
                    bookSources = sources,
                    isLoading = false
                )
            }
        }
    }

    fun toggleBookSource(source: BookSource) {
        viewModelScope.launch {
            bookSourceService.toggleBookSource(source.id, !source.enabled)
        }
    }

    fun deleteBookSource(source: BookSource) {
        viewModelScope.launch {
            bookSourceService.deleteBookSource(source)
        }
    }

    fun importBookSources(json: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)
            val result = bookSourceService.importBookSources(json)
            result.fold(
                onSuccess = { count ->
                    _uiState.value = _uiState.value.copy(
                        message = "Successfully imported $count sources",
                        isLoading = false
                    )
                },
                onFailure = { error ->
                    _uiState.value = _uiState.value.copy(
                        error = "Import failed: ${error.message}",
                        isLoading = false
                    )
                }
            )
        }
    }

    fun clearMessage() {
        _uiState.value = _uiState.value.copy(message = null, error = null)
    }
}

data class BookSourceUiState(
    val bookSources: List<BookSource> = emptyList(),
    val isLoading: Boolean = true,
    val error: String? = null,
    val message: String? = null
)
