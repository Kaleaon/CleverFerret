package com.universalmedialibrary.ui.filepicker

import android.os.Environment
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import javax.inject.Inject

@HiltViewModel
class StorageBrowserViewModel @Inject constructor() : ViewModel() {

    private val _uiState = MutableStateFlow(StorageBrowserUiState())
    val uiState: StateFlow<StorageBrowserUiState> = _uiState.asStateFlow()

    private val pathHistory = mutableListOf<String>()

    init {
        // Start at external storage root
        val initialPath = Environment.getExternalStorageDirectory().absolutePath
        navigateTo(initialPath)
    }

    fun navigateTo(path: String) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true, error = null)
                
                val files = loadFiles(path)
                
                pathHistory.add(path)
                
                _uiState.value = _uiState.value.copy(
                    currentPath = path,
                    files = files,
                    isLoading = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Cannot access this folder: ${e.message}"
                )
            }
        }
    }

    fun navigateInto(directory: File) {
        if (directory.isDirectory && directory.canRead()) {
            navigateTo(directory.absolutePath)
        }
    }

    fun navigateUp() {
        val currentPath = _uiState.value.currentPath
        val parentFile = File(currentPath).parentFile
        
        if (parentFile != null && parentFile.canRead()) {
            pathHistory.removeLastOrNull()
            navigateTo(parentFile.absolutePath)
        }
    }

    fun canNavigateUp(): Boolean {
        val currentPath = _uiState.value.currentPath
        val parentFile = File(currentPath).parentFile
        return parentFile != null && parentFile.canRead()
    }

    fun refresh() {
        navigateTo(_uiState.value.currentPath)
    }

    fun setViewMode(mode: ViewMode) {
        _uiState.value = _uiState.value.copy(viewMode = mode)
    }

    fun toggleShowHidden() {
        val newShowHidden = !_uiState.value.showHidden
        _uiState.value = _uiState.value.copy(showHidden = newShowHidden)
        refresh()
    }

    private suspend fun loadFiles(path: String): List<File> = withContext(Dispatchers.IO) {
        val directory = File(path)
        
        if (!directory.exists() || !directory.isDirectory || !directory.canRead()) {
            throw IllegalAccessException("Cannot access directory")
        }

        val files = directory.listFiles()?.toList() ?: emptyList()
        
        val filtered = if (!_uiState.value.showHidden) {
            files.filter { !it.name.startsWith(".") }
        } else {
            files
        }

        // Filter known media types or directories
        // This ensures we show files the app can actually handle
        val supportedExtensions = setOf(
            "epub", "pdf", "mobi", "azw", "azw3", "fb2", "txt", "rtf", "doc", "docx", "djvu", "html", "htm", // Books
            "cbz", "cbr", "cbt", "cb7", // Comics
            "mp3", "m4a", "m4b", "aac", "ogg", "opus", "flac", "wav", "wma", // Audio
            "mp4", "mkv", "avi", "mov", "wmv", "flv", "webm", "m4v", "mpg", "mpeg", // Video
            "jpg", "jpeg", "png", "gif", "bmp", "webp", "svg", "tiff" // Images
        )

        val finalFiltered = filtered.filter { file ->
            file.isDirectory || file.extension.lowercase() in supportedExtensions
        }

        // Sort: directories first, then files, both alphabetically
        finalFiltered.sortedWith(
            compareBy<File> { !it.isDirectory }
                .thenBy(String.CASE_INSENSITIVE_ORDER) { it.name }
        )
    }
}

data class StorageBrowserUiState(
    val currentPath: String = "",
    val files: List<File> = emptyList(),
    val isLoading: Boolean = false,
    val error: String? = null,
    val viewMode: ViewMode = ViewMode.LIST,
    val showHidden: Boolean = false
)
