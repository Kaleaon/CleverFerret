package com.universalmedialibrary.ui.maintenance

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.MaintenanceChange
import com.universalmedialibrary.data.repository.MaintenanceRepository
import com.universalmedialibrary.services.duplicates.DuplicateDetectionService
import com.universalmedialibrary.services.metadata.RealMetadataService
import com.universalmedialibrary.services.thumbnails.ThumbnailService
import com.universalmedialibrary.services.maintenance.FileChangeScanner
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.data.repository.LibraryRepository
import com.google.gson.Gson
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject
import com.universalmedialibrary.data.local.entity.Library

@HiltViewModel
class MaintenanceViewModel @Inject constructor(
    private val repository: MaintenanceRepository,
    private val duplicateDetectionService: DuplicateDetectionService,
    private val metadataService: RealMetadataService,
    private val thumbnailService: ThumbnailService,
    private val fileChangeScanner: FileChangeScanner,
    private val mediaRepository: MediaRepository,
    private val libraryRepository: LibraryRepository
) : ViewModel() {

    val pending: StateFlow<List<MaintenanceChange>> = repository.getPending()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    val libraries: StateFlow<List<Library>> = libraryRepository.getAllActiveLibraries()
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

    fun fetchMetadataProposals(query: String) {
        viewModelScope.launch {
            val result = metadataService.searchBookMetadata(query = query)
            val md = result.metadata ?: return@launch
            // Map by title to a local item for proposal
            mediaRepository.searchMediaItems(md.title, 25).firstOrNull()?.let { item ->
                val before = mediaRepository.getCommonMetadata(item.itemId)
                val after = before?.copy(
                    title = md.title,
                    summary = md.description ?: before.summary
                )
                val gson = Gson()
                val oldJson = before?.let { mapOf("title" to it.title, "summary" to it.summary) }?.let { gson.toJson(it) }
                val newJson = after?.let { mapOf("title" to it.title, "summary" to it.summary) }?.let { gson.toJson(it) }
                repository.propose(
                    MaintenanceChange(
                        itemId = item.itemId,
                        changeType = "METADATA_UPDATE",
                        summary = "Update metadata from ${result.sources.joinToString()}",
                        oldDataJson = oldJson,
                        newDataJson = newJson
                    )
                )
            }
        }
    }

    fun generateCoverProposalsForLibrary(libraryId: Long) {
        viewModelScope.launch {
            mediaRepository.getMediaItemsByLibrary(libraryId).collect { items ->
                items.take(5).forEach { item ->
                    // Placeholder cover generation preview proposal
                    repository.propose(
                        MaintenanceChange(
                            itemId = item.itemId,
                            changeType = "COVER_UPDATE",
                            summary = "Generate placeholder cover for ${item.fileName}",
                            oldDataJson = null,
                            newDataJson = null
                        )
                    )
                }
            }
        }
    }

    fun scanFileChanges(libraryId: Long) {
        viewModelScope.launch {
            mediaRepository.getMediaItemsByLibrary(libraryId).collect { items ->
                val proposals = fileChangeScanner.scan(items)
                proposals.forEach { repository.propose(it) }
            }
        }
    }
}
