package com.universalmedialibrary.ui.media.viewmodels

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.DownloadedStory
import com.universalmedialibrary.data.local.entity.UnifiedTag
import com.universalmedialibrary.data.repository.MediaItemWithMetadata
import com.universalmedialibrary.data.repository.SearchRepository
import com.universalmedialibrary.data.repository.StoryRepository
import com.universalmedialibrary.data.repository.TagRepository
import com.universalmedialibrary.services.search.EngineSearchResult
import com.universalmedialibrary.services.search.UniversalSearchEngine
import com.universalmedialibrary.services.search.UniversalSearchQuery
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.FlowPreview
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

data class UniversalSearchAndDiscoveryUiState(
    val query: String = "",
    val selectedTags: Set<String> = emptySet(),
    val selectedType: String = "ALL",
    val libraryResults: List<MediaItemWithMetadata> = emptyList(),
    val storyResults: List<DownloadedStory> = emptyList(),
    val tagResults: List<UnifiedTag> = emptyList(),
    val popularTags: List<UnifiedTag> = emptyList(),
    val isLoading: Boolean = false,
    val searchTimeMs: Long = 0L
)

@OptIn(FlowPreview::class)
@HiltViewModel
class UniversalSearchViewModel @Inject constructor(
    private val savedStateHandle: SavedStateHandle,
    private val searchRepository: SearchRepository,
    private val storyRepository: StoryRepository,
    private val tagRepository: TagRepository,
    private val universalSearchEngine: UniversalSearchEngine
) : ViewModel() {

    private val initialQuery: String = savedStateHandle.get<String>("query")?.let { java.net.URLDecoder.decode(it, "UTF-8") } ?: ""
    private val initialTagsRaw: String = savedStateHandle.get<String>("tags")?.let { java.net.URLDecoder.decode(it, "UTF-8") } ?: ""
    private val initialType: String = savedStateHandle.get<String>("type")?.let { java.net.URLDecoder.decode(it, "UTF-8") } ?: "ALL"

    private val _query = MutableStateFlow(initialQuery)
    val query: StateFlow<String> = _query.asStateFlow()

    private val initialTagSet = initialTagsRaw
        .split(",")
        .map { it.trim() }
        .filter { it.isNotBlank() }
        .toSet()

    private val _selectedTags = MutableStateFlow<Set<String>>(initialTagSet)
    val selectedTags: StateFlow<Set<String>> = _selectedTags.asStateFlow()

    private val _selectedType = MutableStateFlow<String>(if (initialType.isBlank()) "ALL" else initialType.uppercase())
    val selectedType: StateFlow<String> = _selectedType.asStateFlow()

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    val popularTags: StateFlow<List<UnifiedTag>> = tagRepository.getPopularTags(20)
        .flowOn(Dispatchers.IO)
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    val uiState: StateFlow<UniversalSearchAndDiscoveryUiState> = combine(
        _query.debounce(250L).onStart { emit(_query.value) },
        _selectedTags,
        _selectedType,
        popularTags
    ) { currentQuery, tags, typeFilter, popular ->
        _isLoading.value = true
        val startTime = System.currentTimeMillis()

        // Concurrent multi-repository cross-domain search execution
        val mediaResults = runCatching {
            searchRepository.searchMedia(
                query = currentQuery,
                mediaTypes = if (typeFilter != "ALL" && typeFilter != "WEB_FICTION" && typeFilter != "TAGS") listOf(typeFilter) else emptyList()
            )
        }.getOrDefault(emptyList())

        val stories = runCatching {
            if (typeFilter == "ALL" || typeFilter == "WEB_FICTION") {
                val allStories = storyRepository.getAllStories().first()
                allStories.filter { story ->
                    val queryMatches = currentQuery.isBlank() ||
                            story.title.contains(currentQuery, ignoreCase = true) ||
                            story.author.contains(currentQuery, ignoreCase = true) ||
                            (story.description?.contains(currentQuery, ignoreCase = true) == true)

                    val tagMatches = tags.isEmpty() || tags.any { tag ->
                        story.tags.any { it.contains(tag, ignoreCase = true) } ||
                                (story.fandom?.contains(tag, ignoreCase = true) == true)
                    }

                    queryMatches && tagMatches
                }
            } else {
                emptyList()
            }
        }.getOrDefault(emptyList())

        val tagList = runCatching {
            if (typeFilter == "ALL" || typeFilter == "TAGS") {
                if (currentQuery.isNotBlank()) {
                    tagRepository.searchTags(currentQuery).first()
                } else {
                    popular
                }
            } else {
                emptyList()
            }
        }.getOrDefault(emptyList())

        val duration = System.currentTimeMillis() - startTime
        _isLoading.value = false

        UniversalSearchAndDiscoveryUiState(
            query = currentQuery,
            selectedTags = tags,
            selectedType = typeFilter,
            libraryResults = mediaResults,
            storyResults = stories,
            tagResults = tagList,
            popularTags = popular,
            isLoading = false,
            searchTimeMs = duration
        )
    }.flowOn(Dispatchers.IO)
        .stateIn(
            viewModelScope,
            SharingStarted.WhileSubscribed(5000),
            UniversalSearchAndDiscoveryUiState(
                query = initialQuery,
                selectedTags = initialTagSet,
                selectedType = if (initialType.isBlank()) "ALL" else initialType.uppercase()
            )
        )

    fun updateQuery(newQuery: String) {
        _query.value = newQuery
    }

    fun toggleTag(tag: String) {
        _selectedTags.update { current ->
            if (tag in current) current - tag else current + tag
        }
    }

    fun clearTags() {
        _selectedTags.value = emptySet()
    }

    fun selectType(type: String?) {
        _selectedType.value = type?.uppercase() ?: "ALL"
    }

    fun clearAll() {
        _query.value = ""
        _selectedTags.value = emptySet()
        _selectedType.value = "ALL"
    }
}
