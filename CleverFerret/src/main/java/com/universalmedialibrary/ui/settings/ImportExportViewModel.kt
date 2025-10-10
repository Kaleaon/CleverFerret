package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.BackupInfo
import com.universalmedialibrary.data.repository.ExportResult
import com.universalmedialibrary.data.repository.ImportExportRepository
import com.universalmedialibrary.data.repository.ImportResult
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ImportExportViewModel @Inject constructor(
    private val importExportRepository: ImportExportRepository
) : ViewModel() {

    private val _uiState = MutableStateFlow(ImportExportUiState())
    val uiState: StateFlow<ImportExportUiState> = _uiState.asStateFlow()

    fun loadBackups() {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoadingBackups = true)
                val backups = importExportRepository.getAvailableBackups()
                _uiState.value = _uiState.value.copy(
                    isLoadingBackups = false,
                    availableBackups = backups
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoadingBackups = false,
                    error = "Failed to load backups: ${e.message}"
                )
            }
        }
    }

    fun exportLibrary(
        includeMetadata: Boolean = true,
        includeProgress: Boolean = true,
        includeBookmarks: Boolean = true,
        includeCollections: Boolean = true
    ) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(
                    isExporting = true,
                    exportSuccess = null,
                    error = null
                )

                val result = importExportRepository.exportLibrary(
                    includeMetadata = includeMetadata,
                    includeProgress = includeProgress,
                    includeBookmarks = includeBookmarks,
                    includeCollections = includeCollections
                )

                when (result) {
                    is ExportResult.Success -> {
                        _uiState.value = _uiState.value.copy(
                            isExporting = false,
                            exportSuccess = "Exported ${result.itemCount} items to ${result.filePath}"
                        )
                        loadBackups() // Refresh backup list
                    }
                    is ExportResult.Error -> {
                        _uiState.value = _uiState.value.copy(
                            isExporting = false,
                            error = result.message
                        )
                    }
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isExporting = false,
                    error = "Export failed: ${e.message}"
                )
            }
        }
    }

    fun exportToCSV() {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(
                    isExporting = true,
                    exportSuccess = null,
                    error = null
                )

                val result = importExportRepository.exportToCSV()

                when (result) {
                    is ExportResult.Success -> {
                        _uiState.value = _uiState.value.copy(
                            isExporting = false,
                            exportSuccess = "Exported ${result.itemCount} items to CSV: ${result.filePath}"
                        )
                    }
                    is ExportResult.Error -> {
                        _uiState.value = _uiState.value.copy(
                            isExporting = false,
                            error = result.message
                        )
                    }
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isExporting = false,
                    error = "CSV export failed: ${e.message}"
                )
            }
        }
    }

    fun importLibrary(filePath: String, overwriteExisting: Boolean = false) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(
                    isImporting = true,
                    importSuccess = null,
                    error = null
                )

                val result = importExportRepository.importLibrary(filePath, overwriteExisting)

                when (result) {
                    is ImportResult.Success -> {
                        _uiState.value = _uiState.value.copy(
                            isImporting = false,
                            importSuccess = "Imported ${result.importedItems} items (${result.skippedItems} skipped, ${result.errors} errors)"
                        )
                    }
                    is ImportResult.Error -> {
                        _uiState.value = _uiState.value.copy(
                            isImporting = false,
                            error = result.message
                        )
                    }
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isImporting = false,
                    error = "Import failed: ${e.message}"
                )
            }
        }
    }

    fun deleteBackup(filePath: String) {
        viewModelScope.launch {
            try {
                val success = importExportRepository.deleteBackup(filePath)
                if (success) {
                    loadBackups() // Refresh list
                } else {
                    _uiState.value = _uiState.value.copy(
                        error = "Failed to delete backup"
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "Delete failed: ${e.message}"
                )
            }
        }
    }

    fun clearStatus() {
        _uiState.value = _uiState.value.copy(
            exportSuccess = null,
            importSuccess = null,
            error = null
        )
    }
}

data class ImportExportUiState(
    val isExporting: Boolean = false,
    val isImporting: Boolean = false,
    val isLoadingBackups: Boolean = false,
    val availableBackups: List<BackupInfo> = emptyList(),
    val exportSuccess: String? = null,
    val importSuccess: String? = null,
    val error: String? = null
)
