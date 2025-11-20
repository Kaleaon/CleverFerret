package com.universalmedialibrary.ui.selection

import androidx.lifecycle.ViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.StateFlow
import javax.inject.Inject

@HiltViewModel
class GlobalSelectionViewModel @Inject constructor(
    private val manager: GlobalSelectionManager
) : ViewModel() {

    val selectionState: StateFlow<GlobalSelectionState> = manager.state

    fun toggle(item: SelectedMediaItem) = manager.toggle(item)

    fun clear() = manager.clear()

    fun selectAll(items: List<SelectedMediaItem>) = manager.selectAll(items)
}
