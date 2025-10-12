package com.universalmedialibrary.data.migration

import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Backup Restoration Manager
 * 
 * Manages the state of backup restoration requests.
 * Used to communicate between Application and MainActivity for showing restoration dialog.
 */
@Singleton
class BackupRestorationManager @Inject constructor() {
    
    private val _restorationRequest = MutableStateFlow<RestorationRequest?>(null)
    val restorationRequest: StateFlow<RestorationRequest?> = _restorationRequest.asStateFlow()
    
    /**
     * Request backup restoration
     */
    fun requestRestoration(backupPath: String, errorMessage: String) {
        _restorationRequest.value = RestorationRequest(
            backupPath = backupPath,
            errorMessage = errorMessage
        )
    }
    
    /**
     * Clear restoration request
     */
    fun clearRequest() {
        _restorationRequest.value = null
    }
    
    /**
     * Restoration request data
     */
    data class RestorationRequest(
        val backupPath: String,
        val errorMessage: String
    )
}