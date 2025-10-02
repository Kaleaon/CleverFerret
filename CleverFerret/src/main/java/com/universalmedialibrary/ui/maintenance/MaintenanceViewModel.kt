package com.universalmedialibrary.ui.maintenance

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.MaintenanceChange
import com.universalmedialibrary.data.repository.MaintenanceRepository
import com.universalmedialibrary.services.duplicates.DuplicateDetectionService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class MaintenanceViewModel @Inject constructor(
    private val repository: MaintenanceRepository,
    private val duplicateDetectionService: DuplicateDetectionService
) : ViewModel() {

    val pending: StateFlow<List<MaintenanceChange>> = repository.getPending()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    fun detectDuplicates(libraryId: Long) {
        viewModelScope.launch {
            duplicateDetectionService.scanLibraryForDuplicates(libraryId)
                .collect { result ->
                    when (result) {
                        is com.universalmedialibrary.services.duplicates.DuplicateScanResult.Complete -> {
                            result.groups.forEach { group ->
                                group.items.drop(1).forEach { dup ->
                                    repository.propose(
                                        MaintenanceChange(
                                            itemId = dup.itemId,
                                            changeType = "DUPLICATE",
                                            summary = "Duplicate of fingerprint ${group.fingerprint}",
                                            oldDataJson = null,
                                            newDataJson = null
                                        )
                                    )
                                }
                            }
                        }
                        else -> {}
                    }
                }
        }
    }

    fun accept(changeId: Long) {
        viewModelScope.launch { repository.accept(changeId) }
    }

    fun reject(changeId: Long) {
        viewModelScope.launch { repository.reject(changeId) }
    }
}

