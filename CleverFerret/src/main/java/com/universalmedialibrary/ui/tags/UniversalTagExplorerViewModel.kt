package com.universalmedialibrary.ui.tags

import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.UnifiedTagWithUsage
import com.universalmedialibrary.data.local.entity.TagType
import com.universalmedialibrary.data.repository.TagRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.flatMapLatest
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import java.util.Locale
import javax.inject.Inject

private const val TAG_PARAM_DELIMITER = "|"

@OptIn(ExperimentalCoroutinesApi::class)
@HiltViewModel
class UniversalTagExplorerViewModel @Inject constructor(
    private val tagRepository: TagRepository
) : ViewModel() {

    private val selectedMediaType = MutableStateFlow<String?>(null)
    private val searchQuery = MutableStateFlow("")
    private val selectedTagIds = MutableStateFlow<Set<Long>>(emptySet())
    private val sortOrder = MutableStateFlow(TagSortOrder.BY_USAGE)

    val mediaTypeFilters: List<MediaTypeFilter> = MediaTypeFilter.defaults()
    val searchText: StateFlow<String> = searchQuery

    private val _uiState = MutableStateFlow(UniversalTagExplorerUiState())
    val uiState: StateFlow<UniversalTagExplorerUiState> = _uiState

    init {
        viewModelScope.launch {
            val usageFlow = selectedMediaType.flatMapLatest { mediaType ->
                tagRepository.observeTagUsage(mediaType)
            }

            combine(
                usageFlow,
                searchQuery,
                sortOrder,
                selectedTagIds,
                selectedMediaType
            ) { usage, query, order, selectedIds, mediaType ->
                val normalizedQuery = query.trim()
                val filtered = usage.filter { entry ->
                    normalizedQuery.isEmpty() ||
                        entry.tag.name.contains(normalizedQuery, ignoreCase = true) ||
                        (entry.tag.description?.contains(normalizedQuery, ignoreCase = true) == true)
                }

                val sorted = when (order) {
                    TagSortOrder.BY_USAGE -> filtered.sortedWith(
                        compareByDescending<UnifiedTagWithUsage> { it.filteredUsage }
                            .thenBy { it.tag.name.lowercase(Locale.getDefault()) }
                    )
                    TagSortOrder.ALPHABETICAL -> filtered.sortedBy {
                        it.tag.name.lowercase(Locale.getDefault())
                    }
                    TagSortOrder.RECENT -> filtered.sortedByDescending { it.tag.lastUsed }
                }

                UniversalTagExplorerUiState(
                    tags = sorted.map { usageItem ->
                        TagExplorerListItem(
                            tagId = usageItem.tag.tagId,
                            name = usageItem.tag.name,
                            description = usageItem.tag.description,
                            color = usageItem.tag.color,
                            type = usageItem.tag.type,
                            totalUsage = usageItem.tag.usageCount,
                            filteredUsage = usageItem.filteredUsage,
                            isSelected = selectedIds.contains(usageItem.tag.tagId)
                        )
                    },
                    selectedMediaType = mediaType,
                    selectedCount = selectedIds.size,
                    totalCount = sorted.size,
                    sortOrder = order
                )
            }.collect { state ->
                _uiState.value = state
            }
        }
    }

    fun selectMediaType(mediaType: String?) {
        if (selectedMediaType.value == mediaType) return
        selectedMediaType.value = mediaType
        selectedTagIds.value = emptySet()
    }

    fun updateSearchQuery(query: String) {
        searchQuery.value = query
    }

    fun toggleTagSelection(tagId: Long) {
        selectedTagIds.update { current ->
            current.toMutableSet().also { set ->
                if (!set.add(tagId)) {
                    set.remove(tagId)
                }
            }
        }
    }

    fun clearSelection() {
        selectedTagIds.value = emptySet()
    }

    fun setSortOrder(order: TagSortOrder) {
        sortOrder.value = order
    }

    fun buildSearchRouteForSelection(): String {
        val tagNames = _uiState.value.tags
            .filter { it.isSelected }
            .map { it.name }
        return buildSearchRoute(tagNames)
    }

    fun buildSearchRouteForTag(tagId: Long): String {
        val tagName = _uiState.value.tags
            .firstOrNull { it.tagId == tagId }
            ?.name
            ?: return "enhanced_search"
        return buildSearchRoute(listOf(tagName))
    }

    private fun buildSearchRoute(tagNames: List<String>): String {
        val params = mutableListOf<String>()
        if (tagNames.isNotEmpty()) {
            params += "tags=${Uri.encode(tagNames.joinToString(TAG_PARAM_DELIMITER))}"
        }
        selectedMediaType.value?.let { mediaType ->
            params += "mediaTypes=${Uri.encode(mediaType)}"
        }
        return if (params.isEmpty()) {
            "enhanced_search"
        } else {
            "enhanced_search?${params.joinToString("&")}"
        }
    }
}

data class UniversalTagExplorerUiState(
    val tags: List<TagExplorerListItem> = emptyList(),
    val selectedMediaType: String? = null,
    val selectedCount: Int = 0,
    val totalCount: Int = 0,
    val sortOrder: TagSortOrder = TagSortOrder.BY_USAGE
)

data class TagExplorerListItem(
    val tagId: Long,
    val name: String,
    val description: String?,
    val color: String?,
    val type: TagType,
    val totalUsage: Int,
    val filteredUsage: Int,
    val isSelected: Boolean
)

enum class TagSortOrder {
    BY_USAGE,
    ALPHABETICAL,
    RECENT
}

data class MediaTypeFilter(
    val key: String?,
    val label: String
) {
    companion object {
        fun defaults(): List<MediaTypeFilter> = listOf(
            MediaTypeFilter(null, "All Media"),
            MediaTypeFilter("BOOK", "Books"),
            MediaTypeFilter("AUDIOBOOK", "Audiobooks"),
            MediaTypeFilter("MUSIC_TRACK", "Music"),
            MediaTypeFilter("MOVIE", "Movies"),
            MediaTypeFilter("TV_SHOW", "TV Shows"),
            MediaTypeFilter("PODCAST_EPISODE", "Podcasts"),
            MediaTypeFilter("COMIC", "Comics"),
            MediaTypeFilter("DOCUMENT", "Documents")
        )
    }
}
