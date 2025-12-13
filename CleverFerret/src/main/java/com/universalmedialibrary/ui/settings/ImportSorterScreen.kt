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
import com.universalmedialibrary.services.ImportSortOptions
import com.universalmedialibrary.services.ImportPlan
import com.universalmedialibrary.services.ImportPlanItem
import com.universalmedialibrary.services.StorageAccessService
import dagger.hilt.android.EntryPointAccessors
import kotlinx.coroutines.launch

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ImportSorterScreen(
    onBack: () -> Unit
) {
    val context = LocalContext.current
    val lifecycleOwner = LocalLifecycleOwner.current
    val appContext = context.applicationContext
    val storageService = remember(appContext) {
        EntryPointAccessors.fromApplication(appContext, ImportSorterEntryPoint::class.java).storageService()
    }

    var inputUri by remember { mutableStateOf<Uri?>(null) }
    var outputUri by remember { mutableStateOf<Uri?>(null) }
    var moveFiles by remember { mutableStateOf(false) }
    var removeEmptyFolders by remember { mutableStateOf(true) }
    var reviewQuestionable by remember { mutableStateOf(true) }
    var progress by remember { mutableStateOf("") }
    var summary by remember { mutableStateOf<String?>(null) }
    var plan by remember { mutableStateOf<ImportPlan?>(null) }
    var editableItems by remember { mutableStateOf<List<ImportPlanItem>>(emptyList()) }
    var inReview by remember { mutableStateOf(false) }

    val inputPicker = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocumentTree()) { uri ->
        if (uri != null) {
            inputUri = uri
            storageService.persistUriPermission(context, uri)
        }
    }
    val outputPicker = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocumentTree()) { uri ->
        if (uri != null) {
            outputUri = uri
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

                    Button(
                        onClick = {
                            progress = "Starting…"
                            summary = null
                            lifecycleOwner.lifecycleScope.launch {
                                val execPlan = p.copy(items = editableItems)
                                val result = storageService.executeImportPlan(
                                    context = context,
                                    plan = execPlan,
                                    options = ImportSortOptions(
                                        moveFiles = moveFiles,
                                        removeEmptyFolders = removeEmptyFolders
                                    ),
                                    progressCallback = { msg -> progress = msg }
                                )
                                summary = "Imported: ${result.imported}, Skipped: ${result.skipped}, Errors: ${result.errors}, Empty folders removed: ${result.deletedFolders}"
                            }
                        }
                    ) {
                        Icon(Icons.Default.PlayArrow, contentDescription = null)
                        Text("  Approve & Import")
                    }

                    if (progress.isNotBlank()) Text(progress)
                    summary?.let { Text(it) }

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
                        Switch(checked = moveFiles, onCheckedChange = { moveFiles = it })
                    }

                    Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                        Text("Remove empty folders (after move)")
                        Switch(
                            checked = removeEmptyFolders,
                            onCheckedChange = { removeEmptyFolders = it }
                        )
                    }

                    Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                        Text("Review questionable items before import")
                        Switch(
                            checked = reviewQuestionable,
                            onCheckedChange = { reviewQuestionable = it }
                        )
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
                                            removeEmptyFolders = removeEmptyFolders
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
                                            removeEmptyFolders = removeEmptyFolders
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
interface ImportSorterEntryPoint {
    fun storageService(): StorageAccessService
}

