package com.universalmedialibrary.ui.news

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.news.NewsManager
import com.universalmedialibrary.services.news.NewsRecipe
import com.universalmedialibrary.services.news.NewsRecipeRegistry
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import java.io.File
import javax.inject.Inject

@HiltViewModel
class NewsViewModel @Inject constructor(
    private val newsManager: NewsManager,
    private val recipeRegistry: NewsRecipeRegistry
) : ViewModel() {

    private val _recipes = MutableStateFlow<List<NewsRecipe>>(emptyList())
    val recipes: StateFlow<List<NewsRecipe>> = _recipes.asStateFlow()

    private val _downloadStatus = MutableStateFlow<Map<String, DownloadStatus>>(emptyMap())
    val downloadStatus: StateFlow<Map<String, DownloadStatus>> = _downloadStatus.asStateFlow()

    init {
        loadRecipes()
    }

    private fun loadRecipes() {
        _recipes.value = recipeRegistry.builtInRecipes
    }

    fun downloadRecipe(recipe: NewsRecipe) {
        val recipeId = recipe.id
        _downloadStatus.value = _downloadStatus.value + (recipeId to DownloadStatus.Downloading)

        viewModelScope.launch {
            val result = newsManager.downloadRecipe(recipe)
            
            val newStatus = result.fold(
                onSuccess = { file -> DownloadStatus.Success(file) },
                onFailure = { error -> DownloadStatus.Error(error.message ?: "Unknown error") }
            )
            
            _downloadStatus.value = _downloadStatus.value + (recipeId to newStatus)
        }
    }
}

sealed class DownloadStatus {
    object Downloading : DownloadStatus()
    data class Success(val file: File) : DownloadStatus()
    data class Error(val message: String) : DownloadStatus()
}
