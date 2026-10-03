package com.universalmedialibrary.ui.metadata.review

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.StagedMetadataCandidate
import com.universalmedialibrary.data.repository.MetadataStagingRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

enum class ConfidenceFilter {
    ALL, HIGH, MEDIUM, LOW
}

data class FieldDiff(
    val fieldName: String,
    val currentValue: String?,
    val proposedValue: String?,
    val isDifferent: Boolean
)

data class CandidateDiffItem(
    val candidate: StagedMetadataCandidate,
    val currentMetadata: MetadataCommon?,
    val mediaItemName: String,
    val fieldDiffs: List<FieldDiff>
)

data class MetadataReviewQueueUiState(
    val isLoading: Boolean = false,
    val candidateDiffs: List<CandidateDiffItem> = emptyList(),
    val filter: ConfidenceFilter = ConfidenceFilter.ALL,
    val selectedCandidateForEdit: StagedMetadataCandidate? = null
)

@HiltViewModel
class MetadataReviewQueueViewModel @Inject constructor(
    private val metadataStagingRepository: MetadataStagingRepository,
    private val metadataDao: MetadataDao,
    private val mediaItemDao: MediaItemDao
) : ViewModel() {

    private val _filter = MutableStateFlow(ConfidenceFilter.ALL)
    private val _selectedCandidate = MutableStateFlow<StagedMetadataCandidate?>(null)

    val uiState: StateFlow<MetadataReviewQueueUiState> = combine(
        metadataStagingRepository.observePendingCandidates(),
        _filter,
        _selectedCandidate
    ) { candidates, filter, selectedCandidate ->
        val filtered = candidates.filter { candidate ->
            when (filter) {
                ConfidenceFilter.ALL -> true
                ConfidenceFilter.HIGH -> candidate.confidenceScore >= 0.80f
                ConfidenceFilter.MEDIUM -> candidate.confidenceScore in 0.50f..0.79f
                ConfidenceFilter.LOW -> candidate.confidenceScore < 0.50f
            }
        }

        val diffItems = filtered.map { candidate ->
            val current = metadataDao.getMetadataCommonByItemId(candidate.itemId)
            val item = mediaItemDao.getMediaItemById(candidate.itemId)
            val itemName = item?.fileName ?: "Item #${candidate.itemId}"
            CandidateDiffItem(
                candidate = candidate,
                currentMetadata = current,
                mediaItemName = itemName,
                fieldDiffs = buildDiffs(current, candidate)
            )
        }

        MetadataReviewQueueUiState(
            isLoading = false,
            candidateDiffs = diffItems,
            filter = filter,
            selectedCandidateForEdit = selectedCandidate
        )
    }.stateIn(
        scope = viewModelScope,
        started = SharingStarted.WhileSubscribed(5000),
        initialValue = MetadataReviewQueueUiState(isLoading = true)
    )

    fun setFilter(filter: ConfidenceFilter) {
        _filter.value = filter
    }

    fun selectCandidateForEdit(candidate: StagedMetadataCandidate?) {
        _selectedCandidate.value = candidate
    }

    fun approveCandidate(candidateId: Long) {
        viewModelScope.launch {
            metadataStagingRepository.approveCandidate(candidateId)
        }
    }

    fun approveAllVisible() {
        viewModelScope.launch {
            val ids = uiState.value.candidateDiffs.map { it.candidate.candidateId }
            metadataStagingRepository.approveCandidates(ids)
        }
    }

    fun discardCandidate(candidateId: Long) {
        viewModelScope.launch {
            metadataStagingRepository.discardCandidate(candidateId)
        }
    }

    fun discardAllVisible() {
        viewModelScope.launch {
            val ids = uiState.value.candidateDiffs.map { it.candidate.candidateId }
            metadataStagingRepository.discardCandidates(ids)
        }
    }

    fun saveAndApproveEditedCandidate(candidate: StagedMetadataCandidate) {
        viewModelScope.launch {
            metadataStagingRepository.editAndApproveCandidate(candidate)
            _selectedCandidate.value = null
        }
    }

    private fun buildDiffs(current: MetadataCommon?, candidate: StagedMetadataCandidate): List<FieldDiff> {
        val diffs = mutableListOf<FieldDiff>()

        candidate.title?.let { prop ->
            val curr = current?.title
            diffs.add(FieldDiff("Title", curr, prop, curr != prop))
        }
        candidate.year?.let { prop ->
            val curr = current?.year?.toString()
            diffs.add(FieldDiff("Year", curr, prop.toString(), curr != prop.toString()))
        }
        candidate.rating?.let { prop ->
            val curr = current?.rating?.toString()
            diffs.add(FieldDiff("Rating", curr, prop.toString(), curr != prop.toString()))
        }
        candidate.summary?.let { prop ->
            val curr = current?.summary
            diffs.add(FieldDiff("Summary", curr, prop, curr != prop))
        }
        candidate.tags?.let { prop ->
            diffs.add(FieldDiff("Suggested Tags", null, prop, true))
        }
        candidate.language?.let { prop ->
            val curr = current?.language
            diffs.add(FieldDiff("Language", curr, prop, curr != prop))
        }

        return diffs
    }
}
