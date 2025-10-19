package com.universalmedialibrary.ui.sync

import android.content.Context
import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.sync.CloudSyncService
import com.universalmedialibrary.services.sync.SyncState
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import java.io.File
import javax.inject.Inject

/**
 * ViewModel for Cloud Sync Screen
 */
@HiltViewModel
class CloudSyncViewModel @Inject constructor(
    private val cloudSyncService: CloudSyncService
) : ViewModel() {
    
    val syncState: StateFlow<SyncState> = cloudSyncService.syncState
    
    private val _lastSyncTime = MutableStateFlow<Long?>(null)
    val lastSyncTime: StateFlow<Long?> = _lastSyncTime.asStateFlow()
    
    /**
     * Export data to URI
     */
    fun exportToUri(context: Context, uri: Uri) {
        viewModelScope.launch {
            try {
                // Create temp file
                val tempFile = File(context.cacheDir, "export_temp.json")
                
                val result = cloudSyncService.exportToFile(tempFile)
                
                if (result.isSuccess) {
                    // Copy to user-selected location
                    context.contentResolver.openOutputStream(uri)?.use { output ->
                        tempFile.inputStream().use { input ->
                            input.copyTo(output)
                        }
                    }
                    
                    tempFile.delete()
                    _lastSyncTime.value = System.currentTimeMillis()
                }
            } catch (e: Exception) {
                // Error is already handled in CloudSyncService
            }
        }
    }
    
    /**
     * Import data from URI
     */
    fun importFromUri(context: Context, uri: Uri) {
        viewModelScope.launch {
            try {
                // Copy to temp file
                val tempFile = File(context.cacheDir, "import_temp.json")
                
                context.contentResolver.openInputStream(uri)?.use { input ->
                    tempFile.outputStream().use { output ->
                        input.copyTo(output)
                    }
                }
                
                val result = cloudSyncService.importFromFile(tempFile)
                
                tempFile.delete()
                
                if (result.isSuccess) {
                    _lastSyncTime.value = System.currentTimeMillis()
                }
            } catch (e: Exception) {
                // Error is already handled in CloudSyncService
            }
        }
    }
    
    /**
     * Manual sync trigger
     */
    fun syncNow() {
        viewModelScope.launch {
            // Note: Will use configured cloud provider
            // For now, this is a placeholder
        }
    }
}
