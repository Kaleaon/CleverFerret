package com.universalmedialibrary.ui.maintenance

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.icons.PhosphorIcons
import com.universalmedialibrary.data.local.entity.MaintenanceChange
import com.universalmedialibrary.data.local.entity.Library

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MaintenanceScreen(
    onBack: () -> Unit,
    viewModel: MaintenanceViewModel = hiltViewModel()
) {
    val pending by viewModel.pending.collectAsState()
    val libraries by viewModel.libraries.collectAsState()
    
    // Default to the first library if available, otherwise 0
    var selectedLibrary by remember(libraries) { 
        mutableStateOf(libraries.firstOrNull()) 
    }
    
    // If selectedLibrary is null but libraries are available, select the first one
    LaunchedEffect(libraries) {
        if (selectedLibrary == null && libraries.isNotEmpty()) {
            selectedLibrary = libraries.first()
        }
    }

    var showMetadataDialog by remember { mutableStateOf(false) }
    var metadataQuery by remember { mutableStateOf("") }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Maintenance") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(PhosphorIcons.ArrowLeft, contentDescription = "Back")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp)
        ) {
            // Library Selector
            Text("Target Library", style = MaterialTheme.typography.titleMedium)
            Spacer(Modifier.height(8.dp))
            
            LibrarySelector(
                libraries = libraries,
                selectedLibrary = selectedLibrary,
                onLibrarySelected = { selectedLibrary = it }
            )
            
            Spacer(Modifier.height(16.dp))

            Text("Actions", style = MaterialTheme.typography.titleMedium)
            Spacer(Modifier.height(8.dp))
            
            // Actions Grid
            val libraryId = selectedLibrary?.libraryId ?: -1L
            val isLibrarySelected = libraryId != -1L

            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp), 
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Button(
                        onClick = { viewModel.detectDuplicates(libraryId) },
                        modifier = Modifier.weight(1f),
                        enabled = isLibrarySelected
                    ) { 
                        Text("Detect Duplicates") 
                    }
                    
                    Button(
                        onClick = { showMetadataDialog = true },
                        modifier = Modifier.weight(1f)
                    ) { 
                        Text("Fetch Metadata") 
                    }
                }
                
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp), 
                    modifier = Modifier.fillMaxWidth()
                ) {
                    OutlinedButton(
                        onClick = { viewModel.generateCoverProposalsForLibrary(libraryId) },
                        modifier = Modifier.weight(1f),
                        enabled = isLibrarySelected
                    ) { 
                        Text("Generate Covers") 
                    }
                    
                    OutlinedButton(
                        onClick = { viewModel.scanFileChanges(libraryId) },
                        modifier = Modifier.weight(1f),
                        enabled = isLibrarySelected
                    ) { 
                        Text("Review File Changes") 
                    }
                }
            }

            Spacer(Modifier.height(24.dp))
            
            if (pending.isNotEmpty()) {
                Text("Pending Changes", style = MaterialTheme.typography.titleMedium)
                Spacer(Modifier.height(8.dp))

                LazyColumn(
                    verticalArrangement = Arrangement.spacedBy(8.dp),
                    modifier = Modifier.weight(1f)
                ) {
                    items(pending) { change ->
                        ChangeRow(
                            change = change, 
                            onAccept = { viewModel.accept(change.changeId) }, 
                            onReject = { viewModel.reject(change.changeId) }
                        )
                    }
                }
            } else {
                Box(
                    modifier = Modifier.weight(1f).fillMaxWidth(),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        "No pending maintenance tasks",
                        style = MaterialTheme.typography.bodyLarge,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
    
    if (showMetadataDialog) {
        AlertDialog(
            onDismissRequest = { showMetadataDialog = false },
            title = { Text("Fetch Metadata") },
            text = {
                Column {
                    Text("Enter book title or ISBN to search:")
                    Spacer(Modifier.height(8.dp))
                    OutlinedTextField(
                        value = metadataQuery,
                        onValueChange = { metadataQuery = it },
                        modifier = Modifier.fillMaxWidth(),
                        singleLine = true
                    )
                }
            },
            confirmButton = {
                Button(
                    onClick = { 
                        if (metadataQuery.isNotBlank()) {
                            viewModel.fetchMetadataProposals(metadataQuery)
                            showMetadataDialog = false
                            metadataQuery = ""
                        }
                    }
                ) {
                    Text("Search")
                }
            },
            dismissButton = {
                TextButton(onClick = { showMetadataDialog = false }) {
                    Text("Cancel")
                }
            }
        )
    }
}

@Composable
private fun LibrarySelector(
    libraries: List<Library>,
    selectedLibrary: Library?,
    onLibrarySelected: (Library) -> Unit
) {
    var expanded by remember { mutableStateOf(false) }

    Box(modifier = Modifier.fillMaxWidth()) {
        OutlinedCard(
            onClick = { expanded = true },
            modifier = Modifier.fillMaxWidth()
        ) {
            Row(
                modifier = Modifier
                    .padding(16.dp)
                    .fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    if (selectedLibrary != null) {
                        Text(
                            text = selectedLibrary.name,
                            style = MaterialTheme.typography.bodyLarge,
                            fontWeight = FontWeight.Medium
                        )
                        Text(
                            text = selectedLibrary.path,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    } else {
                        Text(
                            text = if (libraries.isEmpty()) "No libraries found" else "Select a library",
                            style = MaterialTheme.typography.bodyLarge
                        )
                    }
                }
                Icon(Icons.Default.ArrowDropDown, "Select Library")
            }
        }

        DropdownMenu(
            expanded = expanded,
            onDismissRequest = { expanded = false },
            modifier = Modifier.fillMaxWidth(0.9f)
        ) {
            libraries.forEach { library ->
                DropdownMenuItem(
                    text = { 
                        Column {
                            Text(library.name)
                            Text(
                                library.path,
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    },
                    onClick = {
                        onLibrarySelected(library)
                        expanded = false
                    }
                )
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
                Text(
                    change.changeType.replace("_", " "), 
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.Bold
                )
                Spacer(Modifier.height(4.dp))
                Text(change.summary, style = MaterialTheme.typography.bodyMedium)
            }
            Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                TextButton(onClick = onReject) { Text("Reject") }
                Button(onClick = onAccept) { Text("Accept") }
            }
        }
    }
}
