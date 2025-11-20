package com.universalmedialibrary.ui.selection

import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import javax.inject.Inject
import javax.inject.Singleton

data class SelectedMediaItem(
    val id: Long,
    val title: String,
    val type: String,
    val libraryId: Long?
)

data class GlobalSelectionState(
    val items: Map<Long, SelectedMediaItem> = emptyMap(),
    val lastUpdated: Long = System.currentTimeMillis()
) {
    val totalCount: Int get() = items.size
    fun isSelected(id: Long): Boolean = items.containsKey(id)
}

@Singleton
class GlobalSelectionManager @Inject constructor() {

    private val _state = MutableStateFlow(GlobalSelectionState())
    val state: StateFlow<GlobalSelectionState> = _state.asStateFlow()

    fun toggle(item: SelectedMediaItem) {
        _state.update { current ->
            val newItems = if (current.items.containsKey(item.id)) {
                current.items - item.id
            } else {
                current.items + (item.id to item)
            }
            current.copy(items = newItems, lastUpdated = System.currentTimeMillis())
        }
    }

    fun clear() {
        _state.update { current ->
            current.copy(items = emptyMap(), lastUpdated = System.currentTimeMillis())
        }
    }

    fun selectAll(items: List<SelectedMediaItem>) {
        val mapped = items.associateBy { it.id }
        _state.update {
            it.copy(items = mapped, lastUpdated = System.currentTimeMillis())
        }
    }
}
