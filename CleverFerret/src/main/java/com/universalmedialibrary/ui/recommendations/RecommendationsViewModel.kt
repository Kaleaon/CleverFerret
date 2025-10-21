package com.universalmedialibrary.ui.recommendations

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.recommendations.SmartRecommendationService
import com.universalmedialibrary.services.recommendations.RecommendationsState
import com.universalmedialibrary.services.recommendations.RecommendationOptions
import com.universalmedialibrary.services.recommendations.Recommendation
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class RecommendationsViewModel @Inject constructor(
    private val recommendationService: SmartRecommendationService
) : ViewModel() {

    private val _uiState = MutableStateFlow(RecommendationsUiState())
    val uiState: StateFlow<RecommendationsUiState> = _uiState.asStateFlow()

    val recommendationsState: StateFlow<RecommendationsState> = recommendationService.state
        .stateIn(viewModelScope, SharingStarted.Eagerly, RecommendationsState.IDLE)

    private val _options = MutableStateFlow(RecommendationOptions())
    val options: StateFlow<RecommendationOptions> = _options.asStateFlow()

    init {
        loadRecommendations()
    }

    fun loadRecommendations(forceRefresh: Boolean = false) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true, error = null)

                val recommendations = recommendationService.getRecommendations(
                    options = _options.value,
                    forceRefresh = forceRefresh
                )

                // Group recommendations by source
                val grouped = recommendations.groupBy { it.source }

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    recommendations = recommendations,
                    groupedRecommendations = grouped,
                    error = null
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = e.message ?: "Failed to load recommendations"
                )
            }
        }
    }

    fun updateOptions(options: RecommendationOptions) {
        _options.value = options
        loadRecommendations(forceRefresh = true)
    }

    fun toggleMediaType(mediaType: String) {
        val current = _options.value.mediaTypes?.toMutableSet() ?: mutableSetOf()
        if (current.contains(mediaType)) {
            current.remove(mediaType)
        } else {
            current.add(mediaType)
        }
        _options.value = _options.value.copy(
            mediaTypes = if (current.isEmpty()) null else current
        )
        loadRecommendations(forceRefresh = true)
    }

    fun toggleGenre(genre: String) {
        val current = _options.value.genres?.toMutableSet() ?: mutableSetOf()
        if (current.contains(genre)) {
            current.remove(genre)
        } else {
            current.add(genre)
        }
        _options.value = _options.value.copy(
            genres = if (current.isEmpty()) null else current
        )
        loadRecommendations(forceRefresh = true)
    }

    fun setMaxResults(max: Int) {
        _options.value = _options.value.copy(maxResults = max)
        loadRecommendations(forceRefresh = false) // Use cached if available
    }

    fun toggleAIRecommendations(enabled: Boolean) {
        _options.value = _options.value.copy(includeAI = enabled)
        loadRecommendations(forceRefresh = true)
    }

    fun dismissRecommendation(recommendation: Recommendation) {
        viewModelScope.launch {
            try {
                // Remove from current list
                val current = _uiState.value.recommendations.toMutableList()
                current.remove(recommendation)
                
                val grouped = current.groupBy { it.source }
                
                _uiState.value = _uiState.value.copy(
                    recommendations = current,
                    groupedRecommendations = grouped
                )

                // TODO: Persist dismissal to prevent showing again
            } catch (e: Exception) {
                // Silently fail
            }
        }
    }

    fun refreshRecommendations() {
        loadRecommendations(forceRefresh = true)
    }

    fun clearError() {
        _uiState.value = _uiState.value.copy(error = null)
    }
}

data class RecommendationsUiState(
    val isLoading: Boolean = false,
    val recommendations: List<Recommendation> = emptyList(),
    val groupedRecommendations: Map<String, List<Recommendation>> = emptyMap(),
    val error: String? = null
)
