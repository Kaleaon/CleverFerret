package com.universalmedialibrary.ui.ai

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.ai.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class AIBackupSettingsViewModel @Inject constructor(
    private val aiBackupAutomationService: AIBackupAutomationService
) : ViewModel() {

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    private val _backupConfig = MutableStateFlow(
        BackupConfig(
            enabled = aiBackupAutomationService.isBackupEnabled(),
            scheduleHours = aiBackupAutomationService.getBackupSchedule(),
            location = aiBackupAutomationService.getBackupLocation(),
            encryptionEnabled = aiBackupAutomationService.isEncryptionEnabled(),
            autoRestoreEnabled = aiBackupAutomationService.isAutoRestoreEnabled()
        )
    )
    val backupConfig: StateFlow<BackupConfig> = _backupConfig.asStateFlow()

    private val _backupHistory = MutableStateFlow<List<BackupResult>>(emptyList())
    val backupHistory: StateFlow<List<BackupResult>> = _backupHistory.asStateFlow()

    init {
        loadBackupHistory()
    }

    private fun loadBackupHistory() {
        viewModelScope.launch {
            _isLoading.value = true
            try {
                val history = aiBackupAutomationService.getBackupHistory()
                _backupHistory.value = history
            } catch (e: Exception) {
                // Handle error
            } finally {
                _isLoading.value = false
            }
        }
    }

    fun toggleBackup(enabled: Boolean) {
        viewModelScope.launch {
            try {
                if (enabled) {
                    aiBackupAutomationService.enableBackup(
                        scheduleHours = _backupConfig.value.scheduleHours,
                        location = _backupConfig.value.location
                    )
                } else {
                    aiBackupAutomationService.disableBackup()
                }
                
                _backupConfig.value = _backupConfig.value.copy(enabled = enabled)
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun updateSchedule(hours: Int) {
        viewModelScope.launch {
            try {
                aiBackupAutomationService.updateBackupSchedule(hours)
                _backupConfig.value = _backupConfig.value.copy(scheduleHours = hours)
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun updateBackupLocation(location: BackupLocation) {
        viewModelScope.launch {
            try {
                aiBackupAutomationService.updateBackupLocation(location)
                _backupConfig.value = _backupConfig.value.copy(location = location)
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun updateEncryption(enabled: Boolean) {
        viewModelScope.launch {
            try {
                aiBackupAutomationService.updateEncryptionSettings(enabled)
                _backupConfig.value = _backupConfig.value.copy(encryptionEnabled = enabled)
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun performManualBackup() {
        viewModelScope.launch {
            _isLoading.value = true
            try {
                val result = aiBackupAutomationService.performBackup()
                _backupHistory.value = listOf(result) + _backupHistory.value
            } catch (e: Exception) {
                // Handle error
            } finally {
                _isLoading.value = false
            }
        }
    }

    fun performRestore() {
        viewModelScope.launch {
            _isLoading.value = true
            try {
                val mostRecentBackup = _backupHistory.value.firstOrNull()
                if (mostRecentBackup != null && mostRecentBackup.success) {
                    val backupFile = java.io.File(mostRecentBackup.backupFile ?: return@launch)
                    aiBackupAutomationService.performRestore(backupFile)
                }
            } catch (e: Exception) {
                // Handle error
            } finally {
                _isLoading.value = false
            }
        }
    }

    fun restoreFromBackup(backup: BackupResult) {
        viewModelScope.launch {
            _isLoading.value = true
            try {
                if (backup.success && backup.backupFile != null) {
                    val backupFile = java.io.File(backup.backupFile)
                    aiBackupAutomationService.performRestore(backupFile)
                }
            } catch (e: Exception) {
                // Handle error
            } finally {
                _isLoading.value = false
            }
        }
    }

    fun deleteBackup(backup: BackupResult) {
        viewModelScope.launch {
            try {
                if (backup.backupFile != null) {
                    val backupFile = java.io.File(backup.backupFile)
                    if (backupFile.exists()) {
                        backupFile.delete()
                        _backupHistory.value = _backupHistory.value - backup
                    }
                }
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun exportBackup() {
        viewModelScope.launch {
            try {
                // Export backup to user-selected location
                aiBackupAutomationService.exportBackup()
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun importBackup() {
        viewModelScope.launch {
            try {
                // Import backup from user-selected location
                aiBackupAutomationService.importBackup()
                loadBackupHistory() // Refresh history after import
            } catch (e: Exception) {
                // Handle error
            }
        }
    }
}