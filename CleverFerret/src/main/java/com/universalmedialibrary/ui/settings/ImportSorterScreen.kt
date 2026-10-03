package com.universalmedialibrary.ui.settings

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.PaddingValues
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
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.services.ImportSortOptions
import com.universalmedialibrary.services.ImportPlan
import com.universalmedialibrary.services.ImportPlanItem
import com.universalmedialibrary.services.ImportConflictStrategy
import com.universalmedialibrary.services.ImportSortProfile
import com.universalmedialibrary.jobs.WorkScheduler

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ImportSorterScreen(
    onBack: () -> Unit,
    viewModel: ImportSorterViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val appContext = context.applicationContext

    val prefs by viewModel.uiState.collectAsStateWithLifecycle()
    val runtime by viewModel.runtimeState.collectAsStateWithLifecycle()
    val inputUri: Uri? = prefs.inputUri?.let { runCatching { Uri.parse(it) }.getOrNull() }
    val outputUri: Uri? = prefs.outputUri?.let { runCatching { Uri.parse(it) }.getOrNull() }
    val moveFiles = prefs.moveFiles
    val removeEmptyFolders = prefs.removeEmptyFolders
    val reviewQuestionable = prefs.reviewQuestionable
    val runInBackground = prefs.runInBackground
    val useOnlineMetadata = prefs.useOnlineMetadata
    val preventDuplicates = prefs.preventDuplicates
    val conflictStrategy = remember(prefs.conflictStrategy) {
        runCatching { ImportConflictStrategy.valueOf(prefs.conflictStrategy) }
            .getOrDefault(ImportConflictStrategy.RENAME)
    }
    val duplicateStrategy = remember(prefs.duplicateStrategy) {
        runCatching { ImportConflictStrategy.valueOf(prefs.duplicateStrategy) }
            .getOrDefault(ImportConflictStrategy.SKIP)
    }
    val sortProfile = remember(prefs.profile) {
        runCatching { ImportSortProfile.valueOf(prefs.profile) }
            .getOrDefault(ImportSortProfile.DEFAULT)
    }

    val inputPicker = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocumentTree()) { uri ->
        if (uri != null) {
            viewModel.setInputUri(uri.toString())
            viewModel.persistUriPermission(context, uri)
        }
    }
    val outputPicker = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocumentTree()) { uri ->
        if (uri != null) {
            viewModel.setOutputUri(uri.toString())
            viewModel.persistUriPermission(context, uri)
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Import Sorter") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        if (runtime.inReview && runtime.plan != null) {
            // Review UI for questionable items (and edits apply to all items)
            val p: ImportPlan = runtime.plan!!
            val editableItems: List<ImportPlanItem> = runtime.editableItems
            Scaffold(
                topBar = {
                    TopAppBar(
                        title = { Text("Review Import (${editableItems.count { it.isQuestionable }} flagged)") },
                        navigationIcon = {
                            IconButton(onClick = {
                                viewModel.resetReview()
                            }) {
                                Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
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
                            viewModel.approveAndExecute(
                                context = appContext,
                                moveFiles = moveFiles,
                                removeEmptyFolders = removeEmptyFolders,
                                runInBackground = runInBackground,
                                preventDuplicates = preventDuplicates,
                                conflictStrategy = conflictStrategy,
                                duplicateStrategy = duplicateStrategy,
                                sortProfile = sortProfile
                            )
                        }
                    ) {
                        Icon(Icons.Default.PlayArrow, contentDescription = "Start import")
                        Text("  Approve & Import")
                    }

                    if (runtime.progress.isNotBlank()) Text(runtime.progress)
                    runtime.backgroundStatus?.let { Text(it) }
                    runtime.summary?.let { Text(it) }

                    Button(
                        enabled = runtime.backgroundStatus != null,
                        onClick = {
                            WorkScheduler.cancelOneOffImport(appContext)
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
                                            viewModel.updateEditableItem(index, item.copy(title = new))
                                        },
                                        label = { Text("Title") },
                                        modifier = Modifier.fillMaxWidth()
                                    )
                                    OutlinedTextField(
                                        value = item.authorOrArtist ?: "",
                                        onValueChange = { new ->
                                            viewModel.updateEditableItem(index, item.copy(authorOrArtist = new.ifBlank { null }))
                                        },
                                        label = { Text("Author / Creator") },
                                        modifier = Modifier.fillMaxWidth()
                                    )
                                    OutlinedTextField(
                                        value = item.series ?: "",
                                        onValueChange = { new ->
                                            val updated = item.copy(series = new.ifBlank { null })
                                            // If user clears series for comics, keep comics at root to avoid collection folder.
                                            val finalItem = if (updated.mediaType == "COMIC" && updated.series.isNullOrBlank()) {
                                                updated.copy(destSegments = listOf("Comics"))
                                            } else {
                                                updated
                                            }
                                            viewModel.updateEditableItem(index, finalItem)
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
                                        viewModel.updateEditableItem(index, item.copy(mediaType = nextType))
                                    }) {
                                        Text("Change media type")
                                    }

                                    OutlinedTextField(
                                        value = item.destSegments.joinToString("/"),
                                        onValueChange = { new ->
                                            val segs = new.split("/")
                                                .map { it.trim() }
                                                .filter { it.isNotBlank() && it != "." && it != ".." }
                                            viewModel.updateEditableItem(
                                                index,
                                                item.copy(destSegments = if (segs.isEmpty()) listOf("Other") else segs)
                                            )
                                        },
                                        label = { Text("Destination folder (override)") },
                                        modifier = Modifier.fillMaxWidth()
                                    )

                                    if (useOnlineMetadata && item.mediaType == "BOOK") {
                                        val isLoading = runtime.onlineMetadataLoadingSourceUris.contains(item.sourceUri)
                                        Button(
                                            enabled = !isLoading,
                                            onClick = { viewModel.fetchOnlineMetadataForBook(index) }
                                        ) {
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

        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            item {
                Card(modifier = Modifier.fillMaxWidth()) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        verticalArrangement = Arrangement.spacedBy(10.dp)
                    ) {
                        Text("Pick an Input folder and an Output folder. Everything in Input will be scanned and sorted into Output with subfolders + basic metadata.")

                        Button(onClick = { inputPicker.launch(null) }) {
                            Icon(Icons.Default.FolderOpen, contentDescription = "Select input folder")
                            Text("  Choose Input Folder")
                        }
                        OutlinedTextField(
                            value = inputUri?.toString().orEmpty(),
                            onValueChange = { },
                            readOnly = true,
                            singleLine = true,
                            label = { Text("Input folder") },
                            modifier = Modifier.fillMaxWidth()
                        )

                        Button(onClick = { outputPicker.launch(null) }) {
                            Icon(Icons.Default.FolderCopy, contentDescription = "Select output folder")
                            Text("  Choose Output Folder")
                        }
                        OutlinedTextField(
                            value = outputUri?.toString().orEmpty(),
                            onValueChange = { },
                            readOnly = true,
                            singleLine = true,
                            label = { Text("Output folder") },
                            modifier = Modifier.fillMaxWidth()
                        )

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
                                val next = when (sortProfile) {
                                    ImportSortProfile.DEFAULT -> ImportSortProfile.COMICS_SINGLETONS_TO_ROOT
                                    ImportSortProfile.COMICS_SINGLETONS_TO_ROOT -> ImportSortProfile.COMICS_ALWAYS_SERIES_FOLDER
                                    ImportSortProfile.COMICS_ALWAYS_SERIES_FOLDER -> ImportSortProfile.BOOKS_AUTHOR_TITLE
                                    ImportSortProfile.BOOKS_AUTHOR_TITLE -> ImportSortProfile.BOOKS_FLAT
                                    ImportSortProfile.BOOKS_FLAT -> ImportSortProfile.DEFAULT
                                }
                                viewModel.setProfile(next.name)
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
                                val next = when (duplicateStrategy) {
                                    ImportConflictStrategy.SKIP -> ImportConflictStrategy.QUARANTINE
                                    ImportConflictStrategy.QUARANTINE -> ImportConflictStrategy.RENAME
                                    ImportConflictStrategy.RENAME -> ImportConflictStrategy.SKIP
                                    ImportConflictStrategy.REPLACE -> ImportConflictStrategy.SKIP
                                }
                                viewModel.setDuplicateStrategy(next.name)
                            }) {
                                Text("Change duplicate strategy")
                            }
                        }

                        Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                            Text("On conflict (same name in destination): $conflictStrategy")
                            // Simple toggle cycle to avoid adding a full dropdown dependency here
                            Button(onClick = {
                                val next = when (conflictStrategy) {
                                    ImportConflictStrategy.RENAME -> ImportConflictStrategy.SKIP
                                    ImportConflictStrategy.SKIP -> ImportConflictStrategy.REPLACE
                                    ImportConflictStrategy.REPLACE -> ImportConflictStrategy.QUARANTINE
                                    ImportConflictStrategy.QUARANTINE -> ImportConflictStrategy.RENAME
                                }
                                viewModel.setConflictStrategy(next.name)
                            }) {
                                Text("Change conflict strategy")
                            }
                        }

                        Button(
                            enabled = inputUri != null && outputUri != null,
                            onClick = {
                                val inUri = inputUri ?: return@Button
                                val outUri = outputUri ?: return@Button
                                viewModel.scanOrBuildPlan(
                                    context = appContext,
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
                                    reviewQuestionable = reviewQuestionable
                                )
                            }
                        ) {
                            Icon(Icons.Default.PlayArrow, contentDescription = "Scan and sort")
                            Text("  Scan & Sort Now")
                        }

                        if (runtime.progress.isNotBlank()) Text(runtime.progress)
                        runtime.summary?.let { Text(it) }
                    }
                }
            }
        }
    }
}
