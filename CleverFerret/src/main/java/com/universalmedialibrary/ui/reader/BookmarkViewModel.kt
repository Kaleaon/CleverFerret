package com.universalmedialibrary.ui.reader

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.TextAnnotation
import com.universalmedialibrary.services.reader.AnnotationService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for bookmark management
 */
@HiltViewModel
class BookmarkViewModel @Inject constructor(
    private val annotationService: AnnotationService
) : ViewModel() {

    private val _uiState = MutableStateFlow(BookmarkUiState())
    val uiState: StateFlow<BookmarkUiState> = _uiState.asStateFlow()

    private var currentMediaId: Long = 0

    fun loadBookmarks(mediaId: Long) {
        currentMediaId = mediaId

        viewModelScope.launch {
            annotationService.getAnnotationsForBook(mediaId).collect { annotations ->
                val bookmarks = annotations.filter { it.annotationType == "BOOKMARK" }
                val highlights = annotations.filter { it.annotationType == "HIGHLIGHT" }
                val notes = annotations.filter { it.annotationType == "NOTE" || !it.noteText.isNullOrEmpty() }

                _uiState.value = _uiState.value.copy(
                    bookmarks = bookmarks,
                    highlights = highlights,
                    notes = notes
                )
            }
        }
    }

    fun toggleSelectionMode() {
        _uiState.value = _uiState.value.copy(
            isSelectionMode = !_uiState.value.isSelectionMode,
            selectedItems = emptySet()
        )
    }

    fun toggleItemSelection(annotationId: Long) {
        val currentSelected = _uiState.value.selectedItems.toMutableSet()
        if (currentSelected.contains(annotationId)) {
            currentSelected.remove(annotationId)
        } else {
            currentSelected.add(annotationId)
        }

        _uiState.value = _uiState.value.copy(
            selectedItems = currentSelected
        )
    }

    fun deleteSelectedItems() {
        viewModelScope.launch {
            _uiState.value.selectedItems.forEach { annotationId ->
                annotationService.deleteAnnotation(annotationId)
            }

            _uiState.value = _uiState.value.copy(
                selectedItems = emptySet(),
                isSelectionMode = false
            )
        }
    }

    fun deleteAnnotation(annotation: TextAnnotation) {
        viewModelScope.launch {
            annotationService.deleteAnnotation(annotation.annotationId)
        }
    }
}

/**
 * UI state for bookmark management
 */
data class BookmarkUiState(
    val bookmarks: List<TextAnnotation> = emptyList(),
    val highlights: List<TextAnnotation> = emptyList(),
    val notes: List<TextAnnotation> = emptyList(),
    val isSelectionMode: Boolean = false,
    val selectedItems: Set<Long> = emptySet(),
    val isLoading: Boolean = false,
    val error: String? = null
)
