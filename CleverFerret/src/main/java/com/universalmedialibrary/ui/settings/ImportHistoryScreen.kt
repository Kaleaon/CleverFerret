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
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.lifecycle.compose.LocalLifecycleOwner
import androidx.lifecycle.lifecycleScope
import com.universalmedialibrary.services.StorageAccessService
import dagger.hilt.android.EntryPointAccessors
import kotlinx.coroutines.launch
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ImportHistoryScreen(
    onBack: () -> Unit
) {
    val context = LocalContext.current
    val lifecycleOwner = LocalLifecycleOwner.current
    val appContext = context.applicationContext
    val storageService = remember(appContext) {
        EntryPointAccessors.fromApplication(appContext, ImportSorterEntryPoint::class.java).storageService()
    }

    var status by remember { mutableStateOf<String?>(null) }
    var progress by remember { mutableStateOf<String?>(null) }
    val logs = remember(status) { storageService.listImportLogs(context) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Import History") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = null)
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
                        Icon(Icons.Default.History, contentDescription = null)
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
                                val df = SimpleDateFormat("MMM dd, yyyy HH:mm", Locale.getDefault())
                                Text("Import ${log.importId}")
                                Text("Started: ${df.format(Date(log.startedAt))}")
                                Text("Ops: ${log.operationCount}, Failed: ${log.failedCount}")
                                Text(if (log.moveFiles) "Mode: Move" else "Mode: Copy")

                                Button(
                                    enabled = true,
                                    onClick = {
                                        status = null
                                        progress = "Undoing ${log.importId}…"
                                        lifecycleOwner.lifecycleScope.launch {
                                            val result = storageService.undoImport(
                                                context = context,
                                                fileName = log.fileName,
                                                progressCallback = { msg -> progress = msg }
                                            )
                                            progress = null
                                            status = "Undo complete. Restored: ${result.restoredFiles} (failures: ${result.restoredFailures}). DB removed: ${result.deletedDbItems} (failures: ${result.deletedDbFailures})."
                                        }
                                    }
                                ) {
                                    Icon(Icons.Default.Undo, contentDescription = null)
                                    Text("  Undo")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

