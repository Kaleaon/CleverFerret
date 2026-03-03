package com.universalmedialibrary.ui.settings

import android.content.Context
import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.work.workDataOf
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.jobs.JobStatusBus
import com.universalmedialibrary.jobs.WorkScheduler
import com.universalmedialibrary.services.ImportConflictStrategy
import com.universalmedialibrary.services.ImportPlan
import com.universalmedialibrary.services.ImportPlanItem
import com.universalmedialibrary.services.ImportSortOptions
import com.universalmedialibrary.services.ImportSortProfile
import com.universalmedialibrary.services.StorageAccessService
import com.universalmedialibrary.services.metadata.MetadataService
import com.universalmedialibrary.services.metadata.sources.EnhancedMetadata
import com.universalmedialibrary.utils.ErrorLogger
import com.universalmedialibrary.workers.ImportPlanWorker
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.io.File
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import javax.inject.Inject

@HiltViewModel
class ImportSorterViewModel @Inject constructor(
    private val settingsRepository: SettingsRepository,
    private val storageService: StorageAccessService,
    private val metadataService: MetadataService
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

    val importJobEvents = JobStatusBus.events

    private val _runtimeState = MutableStateFlow(ImportSorterRuntimeState())
    val runtimeState: StateFlow<ImportSorterRuntimeState> = _runtimeState.asStateFlow()

    private val onlineFetchJobsBySourceUri = mutableMapOf<String, Job>()

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

    fun persistUriPermission(context: Context, uri: Uri) {
        storageService.persistUriPermission(context, uri)
    }

    fun resetReview() {
        _runtimeState.value = ImportSorterRuntimeState()
    }

    fun updateEditableItem(index: Int, item: ImportPlanItem) {
        _runtimeState.update { state ->
            val list = state.editableItems.toMutableList()
            if (index in list.indices) {
                list[index] = item
            }
            state.copy(editableItems = list)
        }
    }

    fun scanOrBuildPlan(
        context: Context,
        inputTreeUri: Uri,
        outputTreeUri: Uri,
        options: ImportSortOptions,
        reviewQuestionable: Boolean
    ) {
        _runtimeState.update { it.copy(progress = "Starting…", summary = null, backgroundStatus = null) }
        viewModelScope.launch {
            try {
                if (reviewQuestionable) {
                    val built = storageService.buildImportPlan(
                        context = context,
                        inputTreeUri = inputTreeUri,
                        outputTreeUri = outputTreeUri,
                        options = options,
                        progressCallback = { msg -> _runtimeState.update { it.copy(progress = msg) } }
                    )
                    _runtimeState.update {
                        it.copy(
                            plan = built,
                            editableItems = built.items,
                            inReview = true,
                            progress = ""
                        )
                    }
                } else {
                    val result = storageService.importFromInputToOutput(
                        context = context,
                        inputTreeUri = inputTreeUri,
                        outputTreeUri = outputTreeUri,
                        options = options,
                        progressCallback = { msg -> _runtimeState.update { it.copy(progress = msg) } }
                    )
                    _runtimeState.update {
                        it.copy(
                            summary = "Imported: ${result.imported}, Skipped: ${result.skipped}, Errors: ${result.errors}, Empty folders removed: ${result.deletedFolders}",
                            progress = ""
                        )
                    }
                }
            } catch (e: Exception) {
                ErrorLogger.logError("ImportSorterViewModel", "Scan/import failed", e)
                _runtimeState.update { it.copy(progress = "", summary = "Error: ${e.message ?: e.javaClass.simpleName}") }
            }
        }
    }

    fun approveAndExecute(
        context: Context,
        moveFiles: Boolean,
        removeEmptyFolders: Boolean,
        runInBackground: Boolean,
        preventDuplicates: Boolean,
        conflictStrategy: ImportConflictStrategy,
        duplicateStrategy: ImportConflictStrategy,
        sortProfile: ImportSortProfile
    ) {
        val currentPlan = _runtimeState.value.plan ?: return
        _runtimeState.update { it.copy(progress = "Starting…", summary = null, backgroundStatus = null) }
        viewModelScope.launch {
            try {
                val execPlan = currentPlan.copy(items = _runtimeState.value.editableItems)
                val options = ImportSortOptions(
                    moveFiles = moveFiles,
                    removeEmptyFolders = removeEmptyFolders,
                    conflictStrategy = conflictStrategy,
                    profile = sortProfile,
                    preventDuplicates = preventDuplicates,
                    duplicateStrategy = duplicateStrategy
                )
                if (runInBackground) {
                    val json = Json { prettyPrint = true; ignoreUnknownKeys = true }
                    val planName = "plan_${SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(Date())}.json"
                    withContext(Dispatchers.IO) {
                        val dir = File(context.filesDir, "import_plans").apply { mkdirs() }
                        File(dir, planName).writeText(json.encodeToString(execPlan))
                    }

                    WorkScheduler.scheduleOneOffImport(
                        context = context,
                        inputData = workDataOf(
                            ImportPlanWorker.KEY_PLAN_FILE to planName,
                            ImportPlanWorker.KEY_OPTIONS_JSON to json.encodeToString(options),
                            ImportPlanWorker.KEY_STATE_FILE to "state_${planName}.txt"
                        )
                    )
                    _runtimeState.update {
                        it.copy(
                            progress = "",
                            backgroundStatus = "Import queued in background scheduler. You can leave the app."
                        )
                    }
                } else {
                    val result = storageService.executeImportPlan(
                        context = context,
                        plan = execPlan,
                        options = options,
                        progressCallback = { msg -> _runtimeState.update { it.copy(progress = msg) } }
                    )
                    _runtimeState.update {
                        it.copy(
                            summary = "Imported: ${result.imported}, Skipped: ${result.skipped}, Errors: ${result.errors}, Empty folders removed: ${result.deletedFolders}",
                            progress = ""
                        )
                    }
                }
            } catch (e: Exception) {
                ErrorLogger.logError("ImportSorterViewModel", "Approve/import failed", e)
                _runtimeState.update { it.copy(progress = "", summary = "Error: ${e.message ?: e.javaClass.simpleName}") }
            }
        }
    }

    fun fetchOnlineMetadataForBook(index: Int) {
        val item = _runtimeState.value.editableItems.getOrNull(index) ?: return
        if (item.mediaType != "BOOK") return

        val existing = onlineFetchJobsBySourceUri[item.sourceUri]
        if (existing?.isActive == true) return

        _runtimeState.update { it.copy(onlineMetadataLoadingSourceUris = it.onlineMetadataLoadingSourceUris + item.sourceUri) }
        _runtimeState.update { it.copy(progress = "Searching online metadata for ${item.title}…") }

        onlineFetchJobsBySourceUri[item.sourceUri] = viewModelScope.launch {
            try {
                val results = metadataService.searchAll(
                    query = null,
                    isbn = null,
                    title = item.title,
                    author = item.authorOrArtist,
                    maxResults = 3
                ).getOrThrow()

                val details: EnhancedMetadata? = if (results.isNotEmpty()) {
                    metadataService.getDetailsFromMultipleSources(results.take(1)).getOrThrow()
                } else {
                    null
                }

                if (details != null) {
                    val newTitle = details.title ?: item.title
                    val newAuthor = details.authors.firstOrNull() ?: item.authorOrArtist
                    val newSeries = details.series?.name ?: item.series
                    updateEditableItem(
                        index,
                        item.copy(
                            title = newTitle,
                            authorOrArtist = newAuthor,
                            series = newSeries,
                            reasons = (item.reasons + "Online metadata applied")
                        )
                    )
                    _runtimeState.update { it.copy(progress = "Online metadata applied.") }
                } else {
                    _runtimeState.update { it.copy(progress = "No online metadata found.") }
                }
            } catch (e: Exception) {
                ErrorLogger.logError("ImportSorterViewModel", "Online metadata fetch failed", e)
                _runtimeState.update { it.copy(progress = "Online metadata error: ${e.message ?: e.javaClass.simpleName}") }
            } finally {
                _runtimeState.update { it.copy(onlineMetadataLoadingSourceUris = it.onlineMetadataLoadingSourceUris - item.sourceUri) }
                onlineFetchJobsBySourceUri.remove(item.sourceUri)
            }
        }
    }
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

data class ImportSorterRuntimeState(
    val progress: String = "",
    val summary: String? = null,
    val plan: ImportPlan? = null,
    val editableItems: List<ImportPlanItem> = emptyList(),
    val inReview: Boolean = false,
    val backgroundStatus: String? = null,
    val onlineMetadataLoadingSourceUris: Set<String> = emptySet()
)
