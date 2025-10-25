package com.universalmedialibrary.ui.main

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.ui.theme.ThemePalette
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class MainViewModel @Inject constructor(
    private val libraryDao: LibraryDao,
    private val settingsRepository: SettingsRepository
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
}
