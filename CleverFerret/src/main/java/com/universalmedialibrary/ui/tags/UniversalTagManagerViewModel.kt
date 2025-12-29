package com.universalmedialibrary.ui.tags

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.TagHierarchyDao
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.data.repository.TagRepository
import com.universalmedialibrary.services.suggestions.AutoSuggestionService
import com.universalmedialibrary.services.suggestions.NewTagSuggestion
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import android.util.Log
import javax.inject.Inject

@HiltViewModel
class UniversalTagManagerViewModel @Inject constructor(
    private val tagRepository: TagRepository,
    private val tagHierarchyDao: TagHierarchyDao,
    private val autoSuggestionService: AutoSuggestionService
) : ViewModel() {

    private val _searchQuery = MutableStateFlow("")
    private val _selectedCategory = MutableStateFlow<TagCategory?>(null)
    private val _selectedTagType = MutableStateFlow<TagType?>(null)

    private val allTags = tagRepository.getAllTags()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    private val allCategories = tagHierarchyDao.getAllCategories()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    private val _tagCategories = MutableStateFlow<Map<Long, List<Long>>>(emptyMap())
    private val _suggestedNewTags = MutableStateFlow<List<NewTagSuggestion>>(emptyList())

    val uiState: StateFlow<UniversalTagManagerUiState> = combine(
        allTags,
        allCategories,
        _searchQuery,
        _selectedCategory,
        _selectedTagType,
        _tagCategories,
        _suggestedNewTags
    ) { values ->
        @Suppress("UNCHECKED_CAST")
        val tags = values[0] as List<UnifiedTag>
        val categories = values[1] as List<TagCategory>
        val searchQuery = values[2] as String
        val selectedCategory = values[3] as TagCategory?
        val selectedTagType = values[4] as TagType?
        val tagCategories = values[5] as Map<Long, List<Long>>
        val suggestedNewTags = values[6] as List<NewTagSuggestion>

        // Filter tags
        val filteredTags = tags.filter { tag ->
            // Search filter
            val matchesSearch = searchQuery.isEmpty() ||
                tag.name.contains(searchQuery, ignoreCase = true) ||
                tag.description?.contains(searchQuery, ignoreCase = true) == true

            // Category filter
            val matchesCategory = selectedCategory == null ||
                tagCategories[tag.tagId]?.contains(selectedCategory.categoryId) == true

            // Type filter
            val matchesType = selectedTagType == null || tag.type == selectedTagType

            matchesSearch && matchesCategory && matchesType
        }

        UniversalTagManagerUiState(
            tags = tags,
            filteredTags = filteredTags,
            categories = categories,
            searchQuery = searchQuery,
            selectedCategory = selectedCategory,
            selectedTagType = selectedTagType,
            tagCategories = tagCategories,
            suggestedNewTags = suggestedNewTags
        )
    }.stateIn(
        viewModelScope,
        SharingStarted.WhileSubscribed(5000),
        UniversalTagManagerUiState()
    )

    init {
        // Load tag-category relationships using batch query to avoid N+1
        viewModelScope.launch {
            try {
                withContext(Dispatchers.IO) {
                    val assignments = tagHierarchyDao.getAllTagCategoryAssignments()
                    val categoryMap = assignments.groupBy(
                        keySelector = { it.tagId },
                        valueTransform = { it.categoryId }
                    )
                    _tagCategories.value = categoryMap
                }
            } catch (e: Exception) {
                Log.w("TagManagerVM", "Failed to load tag-category relationships", e)
            }
        }

        // Load suggested new tags
        viewModelScope.launch {
            try {
                withContext(Dispatchers.IO) {
                    val suggestions = autoSuggestionService.suggestNewTags()
                    _suggestedNewTags.value = suggestions
                }
            } catch (e: Exception) {
                // Non-critical: tag suggestions are supplementary
                Log.w("TagManagerVM", "Failed to load tag suggestions", e)
            }
        }
    }

    fun updateSearchQuery(query: String) {
        _searchQuery.value = query
    }

    fun selectCategory(category: TagCategory?) {
        _selectedCategory.value = category
    }

    fun selectTagType(type: TagType?) {
        _selectedTagType.value = type
    }

    fun createTag(
        name: String,
        type: TagType,
        color: String?,
        description: String?,
        categoryId: Long?
    ) {
        viewModelScope.launch {
            val tagId = tagRepository.createTag(
                name = name,
                type = type,
                color = color,
                description = description
            )

            // Assign to category if selected
            categoryId?.let { catId ->
                tagHierarchyDao.assignTagToCategory(
                    TagCategoryAssignment(tagId = tagId, categoryId = catId)
                )
            }
        }
    }

    fun updateTag(tag: UnifiedTag, categoryIds: List<Long>) {
        viewModelScope.launch {
            withContext(Dispatchers.IO) {
                tagRepository.updateTag(tag)

                // Update category assignments
                val currentCategories = tagHierarchyDao.getCategoriesForTagSync(tag.tagId)
                val currentCategoryIds = currentCategories.map { it.categoryId }.toSet()

                // Remove from categories no longer selected
                for (catId in currentCategoryIds) {
                    if (catId !in categoryIds) {
                        tagHierarchyDao.removeTagFromCategory(tag.tagId, catId)
                    }
                }

                // Add to newly selected categories
                for (catId in categoryIds) {
                    if (catId !in currentCategoryIds) {
                        tagHierarchyDao.assignTagToCategory(
                            TagCategoryAssignment(tagId = tag.tagId, categoryId = catId)
                        )
                    }
                }
            }
            
            // Refresh tag-category map
            refreshTagCategories()
        }
    }
    
    private suspend fun refreshTagCategories() {
        withContext(Dispatchers.IO) {
            val assignments = tagHierarchyDao.getAllTagCategoryAssignments()
            val categoryMap = assignments.groupBy(
                keySelector = { it.tagId },
                valueTransform = { it.categoryId }
            )
            _tagCategories.value = categoryMap
        }
    }

    fun deleteTag(tag: UnifiedTag) {
        viewModelScope.launch {
            tagRepository.deleteTag(tag)
        }
    }

    fun createCategory(
        name: String,
        displayName: String,
        color: String?,
        description: String?
    ) {
        viewModelScope.launch {
            tagHierarchyDao.insertCategory(
                TagCategory(
                    name = name,
                    displayName = displayName,
                    color = color,
                    description = description
                )
            )
        }
    }

    fun createTagFromSuggestion(suggestion: NewTagSuggestion) {
        viewModelScope.launch {
            val tagId = tagRepository.createTag(
                name = suggestion.suggestedName,
                type = suggestion.suggestedType,
                description = suggestion.reason
            )

            // Assign to category if suggested
            suggestion.suggestedCategory?.let { categoryName ->
                val category = tagHierarchyDao.getCategoryByName(categoryName)
                    ?: run {
                        // Create the category if it doesn't exist
                        val catId = tagHierarchyDao.insertCategory(
                            TagCategory(
                                name = categoryName.lowercase().replace(" ", "_"),
                                displayName = categoryName
                            )
                        )
                        tagHierarchyDao.getCategoryById(catId)
                    }

                category?.let {
                    tagHierarchyDao.assignTagToCategory(
                        TagCategoryAssignment(tagId = tagId, categoryId = it.categoryId)
                    )
                }
            }

            // Refresh suggestions
            val updatedSuggestions = _suggestedNewTags.value.filter {
                it.suggestedName != suggestion.suggestedName
            }
            _suggestedNewTags.value = updatedSuggestions
        }
    }
}

data class UniversalTagManagerUiState(
    val tags: List<UnifiedTag> = emptyList(),
    val filteredTags: List<UnifiedTag> = emptyList(),
    val categories: List<TagCategory> = emptyList(),
    val searchQuery: String = "",
    val selectedCategory: TagCategory? = null,
    val selectedTagType: TagType? = null,
    val tagCategories: Map<Long, List<Long>> = emptyMap(),
    val suggestedNewTags: List<NewTagSuggestion> = emptyList()
)
