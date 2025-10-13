package com.universalmedialibrary.ui.comic

import android.graphics.Bitmap
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Language
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.ComicPageResponse
import com.universalmedialibrary.services.comic.ComicProcessorRepository
import com.universalmedialibrary.services.comic.ComicTranslationApiKeyManager
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Comic Reader Translation
 */
@HiltViewModel
class ComicReaderTranslationViewModel @Inject constructor(
    private val repository: ComicProcessorRepository?,
    private val apiKeyManager: ComicTranslationApiKeyManager
) : ViewModel() {

    var translationEnabled by mutableStateOf(false)
        private set
    
    var translationData by mutableStateOf<ComicPageResponse?>(null)
        private set
    
    var isLoading by mutableStateOf(false)
        private set
    
    var errorMessage by mutableStateOf<String?>(null)
        private set
    
    var isConfigured by mutableStateOf(false)
        private set
    
    var currentComicId by mutableStateOf("")
        private set
    
    var currentPageNumber by mutableStateOf(0)
        private set

    init {
        isConfigured = apiKeyManager.areKeysConfigured()
    }

    fun toggleTranslation() {
        translationEnabled = !translationEnabled
        if (!translationEnabled) {
            translationData = null
            errorMessage = null
        }
    }

    fun translatePage(
        pageBitmap: Bitmap,
        comicId: String,
        pageNumber: Int,
        targetLanguage: String = "en"
    ) {
        if (repository == null) {
            errorMessage = "Translation not configured. Please add your API key in settings."
            return
        }
        
        currentComicId = comicId
        currentPageNumber = pageNumber
        
        viewModelScope.launch {
            isLoading = true
            errorMessage = null
            
            val result = repository.processPage(pageBitmap, comicId, pageNumber, targetLanguage)
            
            result.onSuccess { response ->
                translationData = response
                errorMessage = null
            }.onFailure { error ->
                errorMessage = error.message ?: "Translation failed"
                translationData = null
            }
            
            isLoading = false
        }
    }

    fun retryTranslation(
        pageBitmap: Bitmap,
        targetLanguage: String = "en"
    ) {
        if (currentComicId.isNotEmpty() && currentPageNumber > 0) {
            translatePage(pageBitmap, currentComicId, currentPageNumber, targetLanguage)
        }
    }

    fun clearCache(comicId: String) {
        viewModelScope.launch {
            repository?.clearCache(comicId)
        }
    }
}

/**
 * Comic Reader Translation Control Bar
 * 
 * Floating action button and controls for translation in the comic reader
 */
@Composable
fun ComicReaderTranslationControls(
    viewModel: ComicReaderTranslationViewModel = hiltViewModel(),
    onOpenSettings: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier,
        horizontalAlignment = Alignment.End,
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        // Error Message
        AnimatedVisibility(
            visible = viewModel.errorMessage != null,
            enter = fadeIn(),
            exit = fadeOut()
        ) {
            Surface(
                color = MaterialTheme.colorScheme.errorContainer,
                shape = MaterialTheme.shapes.small,
                modifier = Modifier.padding(8.dp)
            ) {
                Row(
                    modifier = Modifier.padding(12.dp),
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        viewModel.errorMessage ?: "",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onErrorContainer,
                        modifier = Modifier.weight(1f)
                    )
                    IconButton(
                        onClick = { viewModel.errorMessage?.let { null } },
                        modifier = Modifier.size(24.dp)
                    ) {
                        Icon(
                            Icons.Default.Close,
                            contentDescription = "Dismiss",
                            tint = MaterialTheme.colorScheme.onErrorContainer
                        )
                    }
                }
            }
        }

        // Loading Indicator
        AnimatedVisibility(
            visible = viewModel.isLoading,
            enter = fadeIn(),
            exit = fadeOut()
        ) {
            Surface(
                color = MaterialTheme.colorScheme.primaryContainer,
                shape = MaterialTheme.shapes.small,
                modifier = Modifier.padding(8.dp)
            ) {
                Row(
                    modifier = Modifier.padding(12.dp),
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(20.dp),
                        strokeWidth = 2.dp
                    )
                    Text(
                        "Translating page...",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                }
            }
        }

        // Control Buttons
        Row(
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            // Settings Button
            if (!viewModel.isConfigured) {
                FloatingActionButton(
                    onClick = onOpenSettings,
                    containerColor = MaterialTheme.colorScheme.tertiaryContainer,
                    contentColor = MaterialTheme.colorScheme.onTertiaryContainer
                ) {
                    Icon(Icons.Default.Settings, contentDescription = "Settings")
                }
            }

            // Retry Button (shown on error)
            if (viewModel.errorMessage != null && viewModel.isConfigured) {
                FloatingActionButton(
                    onClick = { /* Will be handled by parent */ },
                    containerColor = MaterialTheme.colorScheme.errorContainer,
                    contentColor = MaterialTheme.colorScheme.onErrorContainer
                ) {
                    Icon(Icons.Default.Refresh, contentDescription = "Retry")
                }
            }

            // Main Translation Toggle
            if (viewModel.isConfigured) {
                FloatingActionButton(
                    onClick = { viewModel.toggleTranslation() },
                    containerColor = if (viewModel.translationEnabled) {
                        MaterialTheme.colorScheme.primaryContainer
                    } else {
                        MaterialTheme.colorScheme.surface
                    },
                    contentColor = if (viewModel.translationEnabled) {
                        MaterialTheme.colorScheme.onPrimaryContainer
                    } else {
                        MaterialTheme.colorScheme.onSurface
                    }
                ) {
                    Icon(
                        Icons.Default.Language,
                        contentDescription = if (viewModel.translationEnabled) {
                            "Disable translation"
                        } else {
                            "Enable translation"
                        }
                    )
                }
            }
        }
    }
}

/**
 * Translation Status Badge
 * 
 * Small badge showing translation status in the reader
 */
@Composable
fun TranslationStatusBadge(
    isEnabled: Boolean,
    isLoading: Boolean,
    hasData: Boolean,
    modifier: Modifier = Modifier
) {
    if (!isEnabled) return
    
    Surface(
        color = when {
            isLoading -> MaterialTheme.colorScheme.tertiaryContainer
            hasData -> MaterialTheme.colorScheme.primaryContainer
            else -> MaterialTheme.colorScheme.errorContainer
        },
        shape = MaterialTheme.shapes.extraSmall,
        modifier = modifier
    ) {
        Row(
            modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
            horizontalArrangement = Arrangement.spacedBy(4.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            if (isLoading) {
                CircularProgressIndicator(
                    modifier = Modifier.size(12.dp),
                    strokeWidth = 1.5.dp
                )
            } else {
                Icon(
                    Icons.Default.Language,
                    contentDescription = null,
                    modifier = Modifier.size(12.dp)
                )
            }
            Text(
                when {
                    isLoading -> "Translating..."
                    hasData -> "Translated"
                    else -> "Translation ready"
                },
                style = MaterialTheme.typography.labelSmall
            )
        }
    }
}
