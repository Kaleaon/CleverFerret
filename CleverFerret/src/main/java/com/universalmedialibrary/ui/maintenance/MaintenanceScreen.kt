package com.universalmedialibrary.ui.maintenance

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.local.entity.MaintenanceChange

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MaintenanceScreen(
    onBack: () -> Unit,
    viewModel: MaintenanceViewModel = hiltViewModel()
) {
    val pending by viewModel.pending.collectAsState()
    var libraryId by remember { mutableStateOf(1L) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Maintenance") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { padding ->
        Column(modifier = Modifier.fillMaxSize().padding(padding).padding(16.dp)) {
            Text("Actions", style = MaterialTheme.typography.titleMedium)
            Spacer(Modifier.height(8.dp))
            Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                Button(onClick = { viewModel.detectDuplicates(libraryId) }) { Text("Detect Duplicates") }
                OutlinedButton(onClick = { viewModel.fetchMetadataProposals("sample query") }) { Text("Fetch Metadata") }
                OutlinedButton(onClick = { viewModel.generateCoverProposalsForLibrary(libraryId) }) { Text("Generate Covers") }
                OutlinedButton(onClick = { viewModel.scanFileChanges(libraryId) }) { Text("Review File Changes") }
            }

            Spacer(Modifier.height(16.dp))
            Text("Pending Changes", style = MaterialTheme.typography.titleMedium)
            Spacer(Modifier.height(8.dp))

            LazyColumn(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                items(pending) { change ->
                    ChangeRow(change = change, onAccept = { viewModel.accept(change.changeId) }, onReject = { viewModel.reject(change.changeId) })
                }
            }
        }
    }
}

@Composable
private fun ChangeRow(change: MaintenanceChange, onAccept: () -> Unit, onReject: () -> Unit) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Row(
            modifier = Modifier.padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(change.changeType, style = MaterialTheme.typography.labelMedium)
                Spacer(Modifier.height(4.dp))
                Text(change.summary)
            }
            Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                TextButton(onClick = onReject) { Text("Reject") }
                Button(onClick = onAccept) { Text("Accept") }
            }
        }
    }
}

