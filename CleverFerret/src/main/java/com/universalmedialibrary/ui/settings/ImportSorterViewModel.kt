package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.SettingsRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ImportSorterViewModel @Inject constructor(
    private val settingsRepository: SettingsRepository
) : ViewModel() {

    val uiState: StateFlow<ImportSorterPrefsState> =
        combine(
            settingsRepository.importSorterInputUriFlow,
            settingsRepository.importSorterOutputUriFlow
        ) { input, output -> input to output }
            .combine(settingsRepository.importSorterMoveFilesFlow) { (input, output), move ->
                Triple(input, output, move)
            }
            .combine(settingsRepository.importSorterRemoveEmptyFoldersFlow) { (input, output, move), removeEmpty ->
                ImportSorterPrefsState(
                    inputUri = input,
                    outputUri = output,
                    moveFiles = move,
                    removeEmptyFolders = removeEmpty
                )
            }
            .combine(settingsRepository.importSorterReviewQuestionableFlow) { state, review ->
                state.copy(reviewQuestionable = review)
            }
            .combine(settingsRepository.importSorterRunInBackgroundFlow) { state, background ->
                state.copy(runInBackground = background)
            }
            .combine(settingsRepository.importSorterConflictStrategyFlow) { state, conflict ->
                state.copy(conflictStrategy = conflict)
            }
            .combine(settingsRepository.importSorterProfileFlow) { state, profile ->
                state.copy(profile = profile)
            }
            .combine(settingsRepository.importSorterUseOnlineMetadataFlow) { state, useOnline ->
                state.copy(useOnlineMetadata = useOnline)
            }
            .combine(settingsRepository.importSorterPreventDuplicatesFlow) { state, prevent ->
                state.copy(preventDuplicates = prevent)
            }
            .combine(settingsRepository.importSorterDuplicateStrategyFlow) { state, strategy ->
                state.copy(duplicateStrategy = strategy)
            }
            .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5_000), ImportSorterPrefsState())

    fun setInputUri(uri: String?) = viewModelScope.launch { settingsRepository.setImportSorterInputUri(uri) }
    fun setOutputUri(uri: String?) = viewModelScope.launch { settingsRepository.setImportSorterOutputUri(uri) }
    fun setMoveFiles(enabled: Boolean) = viewModelScope.launch { settingsRepository.setImportSorterMoveFiles(enabled) }
    fun setRemoveEmptyFolders(enabled: Boolean) = viewModelScope.launch { settingsRepository.setImportSorterRemoveEmptyFolders(enabled) }
    fun setReviewQuestionable(enabled: Boolean) = viewModelScope.launch { settingsRepository.setImportSorterReviewQuestionable(enabled) }
    fun setRunInBackground(enabled: Boolean) = viewModelScope.launch { settingsRepository.setImportSorterRunInBackground(enabled) }
    fun setConflictStrategy(strategy: String) = viewModelScope.launch { settingsRepository.setImportSorterConflictStrategy(strategy) }
    fun setProfile(profile: String) = viewModelScope.launch { settingsRepository.setImportSorterProfile(profile) }
    fun setUseOnlineMetadata(enabled: Boolean) = viewModelScope.launch { settingsRepository.setImportSorterUseOnlineMetadata(enabled) }
    fun setPreventDuplicates(enabled: Boolean) = viewModelScope.launch { settingsRepository.setImportSorterPreventDuplicates(enabled) }
    fun setDuplicateStrategy(strategy: String) = viewModelScope.launch { settingsRepository.setImportSorterDuplicateStrategy(strategy) }
}

data class ImportSorterPrefsState(
    val inputUri: String? = null,
    val outputUri: String? = null,
    val moveFiles: Boolean = false,
    val removeEmptyFolders: Boolean = true,
    val reviewQuestionable: Boolean = true,
    val runInBackground: Boolean = true,
    val conflictStrategy: String = "RENAME",
    val profile: String = "DEFAULT",
    val useOnlineMetadata: Boolean = false,
    val preventDuplicates: Boolean = true,
    val duplicateStrategy: String = "SKIP"
)

