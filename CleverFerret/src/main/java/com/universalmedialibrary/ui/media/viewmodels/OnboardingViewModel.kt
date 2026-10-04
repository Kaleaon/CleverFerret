package com.universalmedialibrary.ui.media.viewmodels

import android.content.Context
import android.content.Intent
import androidx.core.content.ContextCompat
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.services.MediaScannerService
import com.universalmedialibrary.utils.PermissionsHandler
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class OnboardingViewModel @Inject constructor(
    private val settingsRepository: SettingsRepository,
    private val mediaItemDao: MediaItemDao,
    @ApplicationContext private val appContext: Context
) : ViewModel() {

    val isOnboardingCompleted: StateFlow<Boolean> = settingsRepository.onboardingCompletedFlow
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = false
        )

    val totalMediaItemsCount: StateFlow<Int> = mediaItemDao.getAllMediaItemsFlow()
        .map { items -> items.size }
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = 0
        )

    private val _isScanDispatched = MutableStateFlow(false)
    val isScanDispatched: StateFlow<Boolean> = _isScanDispatched.asStateFlow()

    fun triggerInitialScan() {
        if (PermissionsHandler.hasStoragePermissions(appContext)) {
            viewModelScope.launch {
                settingsRepository.setInitialScanStarted(true)
                _isScanDispatched.value = true
                val intent = Intent(appContext, MediaScannerService::class.java).apply {
                    action = MediaScannerService.ACTION_SCAN_ALL
                }
                runCatching {
                    ContextCompat.startForegroundService(appContext, intent)
                }
            }
        }
    }

    fun completeOnboarding(onCompletedCallback: () -> Unit) {
        viewModelScope.launch {
            if (PermissionsHandler.hasStoragePermissions(appContext)) {
                triggerInitialScan()
            }
            settingsRepository.setOnboardingCompleted(true)
            onCompletedCallback()
        }
    }
}
