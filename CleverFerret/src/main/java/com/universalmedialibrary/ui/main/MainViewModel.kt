package com.universalmedialibrary.ui.main

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.ui.home.SampleClassic
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.data.settings.BottomBarPreferences
import dagger.hilt.android.lifecycle.HiltViewModel
import java.io.File
import java.io.IOException
import java.net.HttpURLConnection
import java.net.URL
import javax.inject.Inject
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

/**
 * MainViewModel - ViewModel for the main application screen
 * 
 * Manages:
 * - Library list state
 * - Theme selection and dark mode preferences
 * - Library creation operations
 * 
 * @property libraryDao Data access for library operations
 * @property settingsRepository Repository for user preferences and settings
 */
@HiltViewModel
class MainViewModel @Inject constructor(
    private val libraryDao: LibraryDao,
    private val settingsRepository: SettingsRepository,
    @ApplicationContext private val appContext: Context
) : ViewModel() {

    val libraries: StateFlow<List<Library>> = libraryDao.getAllLibraries()
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyList()
        )

    val selectedTheme: StateFlow<ThemePalette> = settingsRepository.themeFlow
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.Eagerly,
            initialValue = ThemePalette.NAVY_GOLD
        )

    val darkMode: StateFlow<Boolean> = settingsRepository.darkModeFlow
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.Eagerly,
            initialValue = true
        )

    val bottomGearPosition: StateFlow<BottomGearPosition> = settingsRepository.bottomGearPositionFlow
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.Eagerly,
            initialValue = BottomGearPosition.RIGHT
        )

    val miniPlayerBackgroundMode: StateFlow<MiniPlayerBackgroundMode> =
        settingsRepository.miniPlayerBackgroundModeFlow
            .stateIn(
                scope = viewModelScope,
                started = SharingStarted.Eagerly,
                initialValue = MiniPlayerBackgroundMode.THEME
            )

    val bottomBarPreferences: StateFlow<BottomBarPreferences> =
        settingsRepository.bottomBarPreferencesFlow
            .stateIn(
                scope = viewModelScope,
                started = SharingStarted.Eagerly,
                initialValue = BottomBarPreferences.Default
            )

    fun addLibrary(name: String, type: String, path: String) {
        viewModelScope.launch {
            val newLibrary = Library(name = name, type = type, path = path)
            libraryDao.insertLibrary(newLibrary)
        }
    }
    
    fun setTheme(theme: ThemePalette) {
        viewModelScope.launch {
            settingsRepository.setTheme(theme)
        }
    }

    private val _sampleDownloads = MutableStateFlow<Map<String, SampleDownloadStatus>>(emptyMap())
    val sampleDownloads: StateFlow<Map<String, SampleDownloadStatus>> = _sampleDownloads.asStateFlow()

    fun syncSampleStatuses(samples: List<SampleClassic>) {
        viewModelScope.launch(Dispatchers.IO) {
            val states = samples.associate { sample ->
                val file = sampleFile(sample)
                sample.id to if (file.exists()) {
                    SampleDownloadStatus.Downloaded(file.absolutePath)
                } else {
                    SampleDownloadStatus.NotDownloaded
                }
            }
            _sampleDownloads.value = states
        }
    }

    fun downloadSample(sample: SampleClassic) {
        viewModelScope.launch {
            _sampleDownloads.updateState(sample.id, SampleDownloadStatus.Downloading)

            val result = withContext(Dispatchers.IO) {
                val destination = sampleFile(sample)
                destination.parentFile?.mkdirs()
                runCatching {
                    val url = URL(sample.downloadUrl)
                    val connection = (url.openConnection() as HttpURLConnection).apply {
                        connectTimeout = 15_000
                        readTimeout = 30_000
                        requestMethod = "GET"
                    }

                    try {
                        if (connection.responseCode !in 200..299) {
                            throw IOException("HTTP ${connection.responseCode}")
                        }

                        connection.inputStream.use { input ->
                            destination.outputStream().use { output ->
                                input.copyTo(output)
                            }
                        }
                        SampleDownloadStatus.Downloaded(destination.absolutePath)
                    } finally {
                        connection.disconnect()
                    }
                }.getOrElse { error ->
                    destination.delete()
                    SampleDownloadStatus.Error(error.message ?: "Download failed")
                }
            }

            _sampleDownloads.updateState(sample.id, result)
        }
    }

    fun removeSample(sample: SampleClassic) {
        viewModelScope.launch(Dispatchers.IO) {
            val file = sampleFile(sample)
            if (file.exists()) {
                file.delete()
            }
            _sampleDownloads.updateState(sample.id, SampleDownloadStatus.NotDownloaded)
        }
    }

    private fun MutableStateFlow<Map<String, SampleDownloadStatus>>.updateState(
        sampleId: String,
        status: SampleDownloadStatus
    ) {
        value = value.toMutableMap().apply {
            this[sampleId] = status
        }
    }

    private fun sampleFile(sample: SampleClassic): File {
        val dir = File(appContext.getExternalFilesDir(null) ?: appContext.filesDir, "samples")
        if (!dir.exists()) {
            dir.mkdirs()
        }
        return File(dir, sample.fileName)
    }
}

sealed class SampleDownloadStatus {
    data object NotDownloaded : SampleDownloadStatus()
    data object Downloading : SampleDownloadStatus()
    data class Downloaded(val path: String) : SampleDownloadStatus()
    data class Error(val message: String) : SampleDownloadStatus()
}
