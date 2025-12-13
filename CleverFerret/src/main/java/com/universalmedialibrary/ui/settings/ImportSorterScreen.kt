package com.universalmedialibrary.ui.settings

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
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
    var progress by remember { mutableStateOf("") }
    var summary by remember { mutableStateOf<String?>(null) }

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

                    Button(
                        enabled = inputUri != null && outputUri != null,
                        onClick = {
                            val inUri = inputUri ?: return@Button
                            val outUri = outputUri ?: return@Button
                            progress = "Starting…"
                            summary = null
                            lifecycleOwner.lifecycleScope.launch {
                                val result = storageService.importFromInputToOutput(
                                    context = context,
                                    inputTreeUri = inUri,
                                    outputTreeUri = outUri,
                                    options = ImportSortOptions(moveFiles = moveFiles),
                                    progressCallback = { msg -> progress = msg }
                                )
                                summary = "Imported: ${result.imported}, Skipped: ${result.skipped}, Errors: ${result.errors}"
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

