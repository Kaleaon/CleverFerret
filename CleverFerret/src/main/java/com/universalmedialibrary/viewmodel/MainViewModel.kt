package com.universalmedialibrary.viewmodel

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import androidx.activity.result.ActivityResultLauncher
import androidx.core.content.ContextCompat
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.ui.screens.MainUiState
import com.universalmedialibrary.ui.screens.MediaItemInfo
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class MainViewModel @Inject constructor(
    // Inject repositories and services as needed
) : ViewModel() {

    private val _uiState = MutableStateFlow(MainUiState())
    val uiState: StateFlow<MainUiState> = _uiState.asStateFlow()

    init {
        loadSampleData()
    }

    fun selectTab(index: Int) {
        _uiState.value = _uiState.value.copy(selectedTab = index)
    }

    fun requestPermissionsAndScan(
        launcher: ActivityResultLauncher<Array<String>>? = null,
        context: Context? = null
    ) {
        val permissions = mutableListOf<String>()

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            if (context?.let { ContextCompat.checkSelfPermission(it, Manifest.permission.READ_MEDIA_IMAGES) } != PackageManager.PERMISSION_GRANTED) {
                permissions.add(Manifest.permission.READ_MEDIA_IMAGES)
            }
            if (context?.let { ContextCompat.checkSelfPermission(it, Manifest.permission.READ_MEDIA_VIDEO) } != PackageManager.PERMISSION_GRANTED) {
                permissions.add(Manifest.permission.READ_MEDIA_VIDEO)
            }
            if (context?.let { ContextCompat.checkSelfPermission(it, Manifest.permission.READ_MEDIA_AUDIO) } != PackageManager.PERMISSION_GRANTED) {
                permissions.add(Manifest.permission.READ_MEDIA_AUDIO)
            }
        } else {
            if (context?.let { ContextCompat.checkSelfPermission(it, Manifest.permission.READ_EXTERNAL_STORAGE) } != PackageManager.PERMISSION_GRANTED) {
                permissions.add(Manifest.permission.READ_EXTERNAL_STORAGE)
            }
        }

        if (permissions.isNotEmpty()) {
            launcher?.launch(permissions.toTypedArray())
        } else {
            startMediaScan()
        }
    }

    fun startMediaScan() {
        if (_uiState.value.isScanning) return

        _uiState.value = _uiState.value.copy(
            isScanning = true,
            scanProgress = "Starting media scan..."
        )

        // Simulate scanning progress
        simulateScanProgress()
    }

    fun startSAFScan(uri: Uri) {
        _uiState.value = _uiState.value.copy(
            isScanning = true,
            scanProgress = "Scanning selected folder..."
        )

        simulateScanProgress()
    }

    private fun simulateScanProgress() {
        viewModelScope.launch {
            val progressMessages = listOf(
                "Scanning Documents folder...",
                "Found 15 PDF files",
                "Scanning Downloads folder...",
                "Found 8 EPUB files",
                "Scanning Music folder...",
                "Found 127 MP3 files",
                "Scanning Movies folder...",
                "Found 23 video files",
                "Processing metadata...",
                "Creating thumbnails...",
                "Scan complete!"
            )

            progressMessages.forEachIndexed { index, message ->
                delay(1500)
                _uiState.value = _uiState.value.copy(scanProgress = message)
                
                if (index == progressMessages.size - 1) {
                    _uiState.value = _uiState.value.copy(
                        isScanning = false,
                        scanProgress = "Last scan: ${java.text.SimpleDateFormat("MMM dd, HH:mm", java.util.Locale.getDefault()).format(java.util.Date())}"
                    )
                    loadDiscoveredMedia()
                }
            }
        }
    }

    fun loadSampleData() {
        val sampleData = listOf(
            MediaItemInfo(1, "The Great Gatsby", MediaType.BOOK, "F. Scott Fitzgerald", true),
            MediaItemInfo(2, "1984", MediaType.BOOK, "George Orwell", false),
            MediaItemInfo(3, "Dune", MediaType.BOOK, "Frank Herbert", true),
            MediaItemInfo(4, "Inception", MediaType.MOVIE, "Christopher Nolan", true),
            MediaItemInfo(5, "The Matrix", MediaType.MOVIE, "Wachowski Sisters", false),
            MediaItemInfo(6, "Interstellar", MediaType.MOVIE, "Christopher Nolan", true),
            MediaItemInfo(7, "Abbey Road", MediaType.MUSIC, "The Beatles", true),
            MediaItemInfo(8, "Dark Side of the Moon", MediaType.MUSIC, "Pink Floyd", true),
            MediaItemInfo(9, "Thriller", MediaType.MUSIC, "Michael Jackson", false),
            MediaItemInfo(10, "The Joe Rogan Experience #1234", MediaType.PODCAST, "Joe Rogan", false),
            MediaItemInfo(11, "This American Life", MediaType.PODCAST, "Ira Glass", true),
            MediaItemInfo(12, "National Geographic March 2024", MediaType.MAGAZINE, "Nat Geo", false),
            MediaItemInfo(13, "Android Development Guide", MediaType.DOCUMENT, "Google", false),
            MediaItemInfo(14, "Machine Learning Paper", MediaType.ACADEMIC_PAPER, "Dr. Smith", true)
        )

        _uiState.value = _uiState.value.copy(mediaItems = sampleData)
    }

    private fun loadDiscoveredMedia() {
        val discoveredItems = listOf(
            MediaItemInfo(100, "Discovered Movie.mp4", MediaType.MOVIE, "Found in Downloads", false),
            MediaItemInfo(101, "Audio Book.m4b", MediaType.AUDIOBOOK, "Found in Documents", false),
            MediaItemInfo(102, "Research Paper.pdf", MediaType.DOCUMENT, "Found in Downloads", false)
        )

        val currentItems = _uiState.value.mediaItems
        _uiState.value = _uiState.value.copy(mediaItems = currentItems + discoveredItems)
    }

    fun clearError() {
        _uiState.value = _uiState.value.copy(error = null)
    }
}