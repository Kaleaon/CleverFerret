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
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class OnboardingViewModel @Inject constructor(
    private val settingsRepository: SettingsRepository,
    private val mediaItemDao: MediaItemDao,
    @ApplicationContext private val appContext: Context
) : ViewModel() {

    val isOnboardingCompleted: StateFlow<Boolean> = settingsRepository.hasCompletedOnboardingFlow
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = false
        )

    val totalMediaItemsCount: StateFlow<Int> = flow {
        emit(mediaItemDao.getMediaItemCount())
    }.stateIn(
        scope = viewModelScope,
        started = SharingStarted.WhileSubscribed(5000),
        initialValue = 0
    )

    private val _isScanDispatched = MutableStateFlow(false)
    val isScanDispatched: StateFlow<Boolean> = _isScanDispatched.asStateFlow()

    fun triggerInitialScan() {
        if (PermissionsHandler.hasStoragePermissions(appContext)) {
            _isScanDispatched.value = true
            val intent = Intent(appContext, MediaScannerService::class.java).apply {
                action = MediaScannerService.ACTION_SCAN_ALL
            }
            runCatching {
                ContextCompat.startForegroundService(appContext, intent)
            }.onFailure {
                runCatching {
                    appContext.startService(intent)
                }
            }
        }
    }

    fun completeOnboarding(onCompletedCallback: () -> Unit) {
        viewModelScope.launch {
            if (PermissionsHandler.hasStoragePermissions(appContext)) {
                triggerInitialScan()
            }
            settingsRepository.setHasCompletedOnboarding(true)
            onCompletedCallback()
        }
    }
}
