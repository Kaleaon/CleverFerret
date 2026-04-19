package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.History
import androidx.compose.material.icons.filled.Undo
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.produceState
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.core.content.ContextCompat
import com.universalmedialibrary.services.StorageAccessService
import dagger.hilt.android.EntryPointAccessors
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ImportHistoryScreen(
    onBack: () -> Unit
) {
    val context = LocalContext.current
    val coroutineScope = rememberCoroutineScope()
    val appContext = context.applicationContext
    val storageService = remember(appContext) {
        EntryPointAccessors.fromApplication(appContext, ImportHistoryEntryPoint::class.java).storageService()
    }

    var status by remember { mutableStateOf<String?>(null) }
    var progress by remember { mutableStateOf<String?>(null) }
    var reloadToken by remember { mutableStateOf(0) }
    var isUndoing by remember { mutableStateOf(false) }
    var undoingImportId by remember { mutableStateOf<String?>(null) }
    var selectedImportDetails by remember { mutableStateOf<com.universalmedialibrary.services.importer.ImportTransactionLog?>(null) }
    val df = remember { SimpleDateFormat("MMM dd, yyyy HH:mm", Locale.getDefault()) }

    val logs by produceState(initialValue = emptyList(), key1 = reloadToken) {
        value = withContext(Dispatchers.IO) { storageService.listImportLogs(context) }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Import History") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            progress?.let { Text(it) }
            status?.let { Text(it) }

            if (logs.isEmpty()) {
                Card(modifier = Modifier.fillMaxWidth()) {
                    Column(modifier = Modifier.padding(16.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                        Icon(Icons.Default.History, contentDescription = "Import history")
                        Text("No import logs found yet.")
                    }
                }
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    items(logs) { log ->
                        Card(modifier = Modifier.fillMaxWidth()) {
                            Column(
                                modifier = Modifier.padding(16.dp),
                                verticalArrangement = Arrangement.spacedBy(8.dp)
                            ) {
                                Text("Import ${log.importId}")
                                Text("Started: ${df.format(Date(log.startedAt))}")
                                Text("Ops: ${log.operationCount}, Failed: ${log.failedCount}")
                                Text(if (log.moveFiles) "Mode: Move" else "Mode: Copy")

                                Button(
                                    enabled = !isUndoing,
                                    onClick = {
                                        status = null
                                        progress = "Undoing ${log.importId}…"
                                        if (isUndoing) return@Button
                                        isUndoing = true
                                        undoingImportId = log.importId
                                        val mainExecutor = ContextCompat.getMainExecutor(appContext)
                                        coroutineScope.launch {
                                            try {
                                                val result = storageService.undoImport(
                                                    context = context,
                                                    fileName = log.fileName,
                                                    progressCallback = { msg ->
                                                        mainExecutor.execute { progress = msg }
                                                    }
                                                )
                                                status =
                                                    "Undo complete. Restored: ${result.restoredFiles} (failures: ${result.restoredFailures}). DB removed: ${result.deletedDbItems} (failures: ${result.deletedDbFailures})."
                                            } catch (e: Exception) {
                                                status = "Undo failed: ${e.message ?: e.javaClass.simpleName}"
                                            } finally {
                                                progress = null
                                                isUndoing = false
                                                undoingImportId = null
                                                reloadToken++
                                            }
                                        }
                                    }
                                ) {
                                    Icon(
                                        Icons.Default.Undo,
                                        contentDescription = if (undoingImportId == log.importId) "Undoing import" else "Undo import"
                                    )
                                    Text(if (undoingImportId == log.importId) "  Undoing…" else "  Undo")
                                }
                                OutlinedButton(
                                    onClick = {
                                        coroutineScope.launch {
                                            selectedImportDetails = withContext(Dispatchers.IO) {
                                                storageService.readImportLog(context, log.fileName)
                                            }
                                        }
                                    }
                                ) {
                                    Text("View details")
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    selectedImportDetails?.let { details ->
        AlertDialog(
            onDismissRequest = { selectedImportDetails = null },
            title = { Text("Import details") },
            text = {
                LazyColumn(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                    items(details.operations.take(20)) { operation ->
                        Text(
                            "${operation.status.name}: ${operation.sourceUri} → ${operation.destUri}",
                            style = androidx.compose.material3.MaterialTheme.typography.bodySmall
                        )
                    }
                }
            },
            confirmButton = {
                TextButton(onClick = { selectedImportDetails = null }) {
                    Text("Close")
                }
            }
        )
    }
}

@dagger.hilt.EntryPoint
@dagger.hilt.InstallIn(dagger.hilt.components.SingletonComponent::class)
interface ImportHistoryEntryPoint {
    fun storageService(): StorageAccessService
}
