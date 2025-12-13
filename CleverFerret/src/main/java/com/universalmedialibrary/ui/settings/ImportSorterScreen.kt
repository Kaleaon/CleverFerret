package com.universalmedialibrary.ui.settings

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.FolderOpen
import androidx.compose.material.icons.filled.FolderCopy
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Switch
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.lifecycle.compose.LocalLifecycleOwner
import androidx.lifecycle.lifecycleScope
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.work.ExistingWorkPolicy
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.workDataOf
import com.universalmedialibrary.services.ImportSortOptions
import com.universalmedialibrary.services.ImportPlan
import com.universalmedialibrary.services.ImportPlanItem
import com.universalmedialibrary.services.ImportConflictStrategy
import com.universalmedialibrary.services.ImportSortProfile
import com.universalmedialibrary.services.StorageAccessService
import com.universalmedialibrary.workers.ImportPlanWorker
import dagger.hilt.android.EntryPointAccessors
import kotlinx.coroutines.launch
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.io.File
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import com.universalmedialibrary.services.metadata.MetadataService
import com.universalmedialibrary.services.metadata.sources.EnhancedMetadata

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ImportSorterScreen(
    onBack: () -> Unit,
    viewModel: ImportSorterViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val lifecycleOwner = LocalLifecycleOwner.current
    val appContext = context.applicationContext
    val storageService = remember(appContext) {
        EntryPointAccessors.fromApplication(appContext, ImportSorterEntryPoint::class.java).storageService()
    }

    val prefs by viewModel.uiState.collectAsStateWithLifecycle()
    val inputUri: Uri? = prefs.inputUri?.let { runCatching { Uri.parse(it) }.getOrNull() }
    val outputUri: Uri? = prefs.outputUri?.let { runCatching { Uri.parse(it) }.getOrNull() }
    val moveFiles = prefs.moveFiles
    val removeEmptyFolders = prefs.removeEmptyFolders
    val reviewQuestionable = prefs.reviewQuestionable
    val runInBackground = prefs.runInBackground
    val useOnlineMetadata = prefs.useOnlineMetadata
    val preventDuplicates = prefs.preventDuplicates
    var conflictStrategy by remember(prefs.conflictStrategy) {
        mutableStateOf(
            runCatching { ImportConflictStrategy.valueOf(prefs.conflictStrategy) }
                .getOrDefault(ImportConflictStrategy.RENAME)
        )
    }
    var duplicateStrategy by remember(prefs.duplicateStrategy) {
        mutableStateOf(
            runCatching { ImportConflictStrategy.valueOf(prefs.duplicateStrategy) }
                .getOrDefault(ImportConflictStrategy.SKIP)
        )
    }
    var sortProfile by remember(prefs.profile) {
        mutableStateOf(
            runCatching { ImportSortProfile.valueOf(prefs.profile) }
                .getOrDefault(ImportSortProfile.DEFAULT)
        )
    }
    var progress by remember { mutableStateOf("") }
    var summary by remember { mutableStateOf<String?>(null) }
    var plan by remember { mutableStateOf<ImportPlan?>(null) }
    var editableItems by remember { mutableStateOf<List<ImportPlanItem>>(emptyList()) }
    var inReview by remember { mutableStateOf(false) }
    var backgroundStatus by remember { mutableStateOf<String?>(null) }

    val metadataService = remember(appContext) {
        EntryPointAccessors.fromApplication(appContext, ImportMetadataEntryPoint::class.java).metadataService()
    }

    val inputPicker = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocumentTree()) { uri ->
        if (uri != null) {
            viewModel.setInputUri(uri.toString())
            storageService.persistUriPermission(context, uri)
        }
    }
    val outputPicker = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocumentTree()) { uri ->
        if (uri != null) {
            viewModel.setOutputUri(uri.toString())
            storageService.persistUriPermission(context, uri)
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Import Sorter") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = null)
                    }
                }
            )
        }
    ) { paddingValues ->
        if (inReview && plan != null) {
            // Review UI for questionable items (and edits apply to all items)
            val p = plan!!
            Scaffold(
                topBar = {
                    TopAppBar(
                        title = { Text("Review Import (${editableItems.count { it.isQuestionable }} flagged)") },
                        navigationIcon = {
                            IconButton(onClick = {
                                inReview = false
                                plan = null
                                editableItems = emptyList()
                            }) {
                                Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = null)
                            }
                        }
                    )
                }
            ) { inner ->
                Column(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(inner)
                        .padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Text("Only items with low confidence are flagged. Edit title/author/series to prevent mis-grouping (e.g., one-off Tintin/Asterix issues).")
                    if (useOnlineMetadata) {
                        Text("Online metadata is enabled. Use the per-item button to fetch suggested Title/Author/Series.")
                    }

                    Button(
                        onClick = {
                            progress = "Starting…"
                            summary = null
                            lifecycleOwner.lifecycleScope.launch {
                                val execPlan = p.copy(items = editableItems)
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
                                    val dir = File(context.filesDir, "import_plans").apply { mkdirs() }
                                    val planName = "plan_${SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(Date())}.json"
                                    File(dir, planName).writeText(json.encodeToString(execPlan))

                                    val request = OneTimeWorkRequestBuilder<ImportPlanWorker>()
                                        .addTag("import_sorter")
                                        .setInputData(
                                            workDataOf(
                                                ImportPlanWorker.KEY_PLAN_FILE to planName,
                                                ImportPlanWorker.KEY_OPTIONS_JSON to json.encodeToString(options),
                                                ImportPlanWorker.KEY_STATE_FILE to "state_${planName}.txt"
                                            )
                                        )
                                        .build()

                                    WorkManager.getInstance(context).enqueueUniqueWork(
                                        "import_sorter",
                                        ExistingWorkPolicy.REPLACE,
                                        request
                                    )
                                    progress = ""
                                    backgroundStatus = "Import queued in background (WorkManager). You can leave the app."
                                } else {
                                    val result = storageService.executeImportPlan(
                                        context = context,
                                        plan = execPlan,
                                        options = options,
                                        progressCallback = { msg -> progress = msg }
                                    )
                                    summary = "Imported: ${result.imported}, Skipped: ${result.skipped}, Errors: ${result.errors}, Empty folders removed: ${result.deletedFolders}"
                                }
                            }
                        }
                    ) {
                        Icon(Icons.Default.PlayArrow, contentDescription = null)
                        Text("  Approve & Import")
                    }

                    if (progress.isNotBlank()) Text(progress)
                    backgroundStatus?.let { Text(it) }
                    summary?.let { Text(it) }

                    Button(
                        onClick = {
                            WorkManager.getInstance(context).cancelAllWorkByTag("import_sorter")
                            backgroundStatus = "Background import cancelled."
                        }
                    ) {
                        Text("Cancel background import")
                    }

                    LazyColumn(
                        modifier = Modifier.fillMaxSize(),
                        verticalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        itemsIndexed(editableItems) { index, item ->
                            if (!item.isQuestionable) return@itemsIndexed
                            Card(modifier = Modifier.fillMaxWidth()) {
                                Column(
                                    modifier = Modifier.padding(12.dp),
                                    verticalArrangement = Arrangement.spacedBy(8.dp)
                                ) {
                                    Text(item.sourceDisplayName)
                                    if (item.reasons.isNotEmpty()) {
                                        Text("Flags: ${item.reasons.joinToString("; ")}")
                                    }
                                    OutlinedTextField(
                                        value = item.title,
                                        onValueChange = { new ->
                                            editableItems = editableItems.toMutableList().also { list ->
                                                list[index] = list[index].copy(title = new)
                                            }
                                        },
                                        label = { Text("Title") },
                                        modifier = Modifier.fillMaxWidth()
                                    )
                                    OutlinedTextField(
                                        value = item.authorOrArtist ?: "",
                                        onValueChange = { new ->
                                            editableItems = editableItems.toMutableList().also { list ->
                                                list[index] = list[index].copy(authorOrArtist = new.ifBlank { null })
                                            }
                                        },
                                        label = { Text("Author / Creator") },
                                        modifier = Modifier.fillMaxWidth()
                                    )
                                    OutlinedTextField(
                                        value = item.series ?: "",
                                        onValueChange = { new ->
                                            editableItems = editableItems.toMutableList().also { list ->
                                                val updated = list[index].copy(series = new.ifBlank { null })
                                                // If user clears series for comics, keep comics at root to avoid collection folder.
                                                list[index] = if (updated.mediaType == "COMIC" && updated.series.isNullOrBlank()) {
                                                    updated.copy(destSegments = listOf("Comics"))
                                                } else updated
                                            }
                                        },
                                        label = { Text("Series (optional)") },
                                        modifier = Modifier.fillMaxWidth()
                                    )
                                    OutlinedTextField(
                                        value = item.mediaType,
                                        onValueChange = { },
                                        readOnly = true,
                                        label = { Text("Media type") },
                                        modifier = Modifier.fillMaxWidth()
                                    )
                                    Button(onClick = {
                                        val nextType = when (item.mediaType) {
                                            "BOOK" -> "COMIC"
                                            "COMIC" -> "MUSIC"
                                            "MUSIC" -> "MOVIE"
                                            "MOVIE" -> "DOCUMENT"
                                            "DOCUMENT" -> "OTHER"
                                            else -> "BOOK"
                                        }
                                        editableItems = editableItems.toMutableList().also { list ->
                                            list[index] = list[index].copy(mediaType = nextType)
                                        }
                                    }) {
                                        Text("Change media type")
                                    }

                                    OutlinedTextField(
                                        value = item.destSegments.joinToString("/"),
                                        onValueChange = { new ->
                                            val segs = new.split("/").map { it.trim() }.filter { it.isNotBlank() }
                                            editableItems = editableItems.toMutableList().also { list ->
                                                list[index] = list[index].copy(destSegments = if (segs.isEmpty()) listOf("Other") else segs)
                                            }
                                        },
                                        label = { Text("Destination folder (override)") },
                                        modifier = Modifier.fillMaxWidth()
                                    )

                                    if (useOnlineMetadata && item.mediaType == "BOOK") {
                                        Button(onClick = {
                                            progress = "Searching online metadata for ${item.title}…"
                                            lifecycleOwner.lifecycleScope.launch {
                                                val results = metadataService.searchAll(
                                                    query = null,
                                                    isbn = null,
                                                    title = item.title,
                                                    author = item.authorOrArtist,
                                                    maxResults = 3
                                                ).getOrNull().orEmpty()
                                                val details: EnhancedMetadata? = if (results.isNotEmpty()) {
                                                    metadataService.getDetailsFromMultipleSources(results.take(1)).getOrNull()
                                                } else null
                                                if (details != null) {
                                                    val newTitle = details.title ?: item.title
                                                    val newAuthor = details.authors.firstOrNull() ?: item.authorOrArtist
                                                    val newSeries = details.series?.name ?: item.series
                                                    editableItems = editableItems.toMutableList().also { list ->
                                                        list[index] = list[index].copy(
                                                            title = newTitle,
                                                            authorOrArtist = newAuthor,
                                                            series = newSeries,
                                                            reasons = (list[index].reasons + "Online metadata applied")
                                                        )
                                                    }
                                                    progress = "Online metadata applied."
                                                } else {
                                                    progress = "No online metadata found."
                                                }
                                            }
                                        }) {
                                            Text("Fetch online metadata")
                                        }
                                    }
                                    OutlinedTextField(
                                        value = item.conflictStrategy?.name ?: "",
                                        onValueChange = { },
                                        readOnly = true,
                                        label = { Text("Conflict Strategy (use main setting below)") },
                                        modifier = Modifier.fillMaxWidth()
                                    )
                                }
                            }
                        }
                    }
                }
            }
            return@Scaffold
        }

        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Card(modifier = Modifier.fillMaxWidth()) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(10.dp)
                ) {
                    Text("Pick an Input folder and an Output folder. Everything in Input will be scanned and sorted into Output with subfolders + basic metadata.")

                    Button(onClick = { inputPicker.launch(null) }) {
                        Icon(Icons.Default.FolderOpen, contentDescription = null)
                        Text("  Choose Input Folder")
                    }
                    inputUri?.let { Text("Input: $it") }

                    Button(onClick = { outputPicker.launch(null) }) {
                        Icon(Icons.Default.FolderCopy, contentDescription = null)
                        Text("  Choose Output Folder")
                    }
                    outputUri?.let { Text("Output: $it") }

                    Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                        Text("Move files instead of copy")
                        Switch(checked = moveFiles, onCheckedChange = { viewModel.setMoveFiles(it) })
                    }

                    Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                        Text("Remove empty folders (after move)")
                        Switch(
                            checked = removeEmptyFolders,
                            onCheckedChange = { viewModel.setRemoveEmptyFolders(it) }
                        )
                    }

                    Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                        Text("Review questionable items before import")
                        Switch(
                            checked = reviewQuestionable,
                            onCheckedChange = { viewModel.setReviewQuestionable(it) }
                        )
                    }

                    Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                        Text("Run import in background (WorkManager)")
                        Switch(checked = runInBackground, onCheckedChange = { viewModel.setRunInBackground(it) })
                    }

                    Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                        Text("Sorting profile: $sortProfile")
                        Button(onClick = {
                            sortProfile = when (sortProfile) {
                                ImportSortProfile.DEFAULT -> ImportSortProfile.COMICS_SINGLETONS_TO_ROOT
                                ImportSortProfile.COMICS_SINGLETONS_TO_ROOT -> ImportSortProfile.COMICS_ALWAYS_SERIES_FOLDER
                                ImportSortProfile.COMICS_ALWAYS_SERIES_FOLDER -> ImportSortProfile.BOOKS_AUTHOR_TITLE
                                ImportSortProfile.BOOKS_AUTHOR_TITLE -> ImportSortProfile.BOOKS_FLAT
                                ImportSortProfile.BOOKS_FLAT -> ImportSortProfile.DEFAULT
                            }
                            viewModel.setProfile(sortProfile.name)
                        }) {
                            Text("Change profile")
                        }
                    }

                    Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                        Text("Use online metadata during review")
                        Switch(checked = useOnlineMetadata, onCheckedChange = { viewModel.setUseOnlineMetadata(it) })
                    }

                    Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                        Text("Prevent duplicates (SHA-256)")
                        Switch(checked = preventDuplicates, onCheckedChange = { viewModel.setPreventDuplicates(it) })
                    }

                    Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                        Text("On duplicate (same hash): $duplicateStrategy")
                        Button(onClick = {
                            duplicateStrategy = when (duplicateStrategy) {
                                ImportConflictStrategy.SKIP -> ImportConflictStrategy.QUARANTINE
                                ImportConflictStrategy.QUARANTINE -> ImportConflictStrategy.RENAME
                                ImportConflictStrategy.RENAME -> ImportConflictStrategy.SKIP
                                ImportConflictStrategy.REPLACE -> ImportConflictStrategy.SKIP
                            }
                            viewModel.setDuplicateStrategy(duplicateStrategy.name)
                        }) {
                            Text("Change duplicate strategy")
                        }
                    }

                    Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                        Text("On conflict (same name in destination): $conflictStrategy")
                        // Simple toggle cycle to avoid adding a full dropdown dependency here
                        Button(onClick = {
                            conflictStrategy = when (conflictStrategy) {
                                ImportConflictStrategy.RENAME -> ImportConflictStrategy.SKIP
                                ImportConflictStrategy.SKIP -> ImportConflictStrategy.REPLACE
                                ImportConflictStrategy.REPLACE -> ImportConflictStrategy.QUARANTINE
                                ImportConflictStrategy.QUARANTINE -> ImportConflictStrategy.RENAME
                            }
                            viewModel.setConflictStrategy(conflictStrategy.name)
                        }) {
                            Text("Change conflict strategy")
                        }
                    }

                    Button(
                        enabled = inputUri != null && outputUri != null,
                        onClick = {
                            val inUri = inputUri ?: return@Button
                            val outUri = outputUri ?: return@Button
                            progress = "Starting…"
                            summary = null
                            lifecycleOwner.lifecycleScope.launch {
                                if (reviewQuestionable) {
                                    val built = storageService.buildImportPlan(
                                        context = context,
                                        inputTreeUri = inUri,
                                        outputTreeUri = outUri,
                                        options = ImportSortOptions(
                                            moveFiles = moveFiles,
                                            removeEmptyFolders = removeEmptyFolders,
                                            conflictStrategy = conflictStrategy,
                                            profile = sortProfile,
                                            preventDuplicates = preventDuplicates,
                                            duplicateStrategy = duplicateStrategy
                                        ),
                                        progressCallback = { msg -> progress = msg }
                                    )
                                    plan = built
                                    editableItems = built.items
                                    inReview = true
                                } else {
                                    val result = storageService.importFromInputToOutput(
                                        context = context,
                                        inputTreeUri = inUri,
                                        outputTreeUri = outUri,
                                        options = ImportSortOptions(
                                            moveFiles = moveFiles,
                                            removeEmptyFolders = removeEmptyFolders,
                                            conflictStrategy = conflictStrategy,
                                            profile = sortProfile,
                                            preventDuplicates = preventDuplicates,
                                            duplicateStrategy = duplicateStrategy
                                        ),
                                        progressCallback = { msg -> progress = msg }
                                    )
                                    summary = "Imported: ${result.imported}, Skipped: ${result.skipped}, Errors: ${result.errors}, Empty folders removed: ${result.deletedFolders}"
                                }
                            }
                        }
                    ) {
                        Icon(Icons.Default.PlayArrow, contentDescription = null)
                        Text("  Scan & Sort Now")
                    }

                    if (progress.isNotBlank()) Text(progress)
                    summary?.let { Text(it) }
                }
            }
        }
    }
}

@dagger.hilt.EntryPoint
@dagger.hilt.InstallIn(dagger.hilt.components.SingletonComponent::class)
interface ImportMetadataEntryPoint {
    fun metadataService(): MetadataService
}

@dagger.hilt.EntryPoint
@dagger.hilt.InstallIn(dagger.hilt.components.SingletonComponent::class)
interface ImportSorterEntryPoint {
    fun storageService(): StorageAccessService
}

