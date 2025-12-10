package com.universalmedialibrary.ui.books

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.local.entity.BookSource

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun BookSourceManagerScreen(
    onBack: () -> Unit,
    viewModel: BookSourceViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    var showImportDialog by remember { mutableStateOf(false) }
    var importJson by remember { mutableStateOf("") }

    val snackbarHostState = remember { SnackbarHostState() }

    LaunchedEffect(uiState.message, uiState.error) {
        uiState.message?.let {
            snackbarHostState.showSnackbar(it)
            viewModel.clearMessage()
        }
        uiState.error?.let {
            snackbarHostState.showSnackbar(it)
            viewModel.clearMessage()
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Book Sources") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { showImportDialog = true }) {
                        Icon(Icons.Default.Add, "Import Source")
                    }
                }
            )
        },
        snackbarHost = { SnackbarHost(snackbarHostState) }
    ) { padding ->
        Box(modifier = Modifier.padding(padding)) {
            if (uiState.isLoading) {
                CircularProgressIndicator(modifier = Modifier.align(Alignment.Center))
            } else if (uiState.bookSources.isEmpty()) {
                Column(
                    modifier = Modifier.align(Alignment.Center),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Text("No book sources found")
                    Button(onClick = { showImportDialog = true }) {
                        Text("Import Source")
                    }
                }
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    contentPadding = PaddingValues(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(uiState.bookSources, key = { it.sourceId }) { source ->
                        BookSourceItem(
                            source = source,
                            onToggle = { viewModel.toggleBookSource(source) },
                            onDelete = { viewModel.deleteBookSource(source) }
                        )
                    }
                }
            }
        }
    }

    if (showImportDialog) {
        AlertDialog(
            onDismissRequest = { showImportDialog = false },
            title = { Text("Import Book Source") },
            text = {
                Column {
                    Text("Paste Book Source JSON:")
                    OutlinedTextField(
                        value = importJson,
                        onValueChange = { importJson = it },
                        modifier = Modifier.fillMaxWidth().height(200.dp),
                        maxLines = 10
                    )
                }
            },
            confirmButton = {
                TextButton(
                    onClick = {
                        viewModel.importBookSources(importJson)
                        showImportDialog = false
                        importJson = ""
                    },
                    enabled = importJson.isNotBlank()
                ) {
                    Text("Import")
                }
            },
            dismissButton = {
                TextButton(onClick = { showImportDialog = false }) {
                    Text("Cancel")
                }
            }
        )
    }
}

@Composable
fun BookSourceItem(
    source: BookSource,
    onToggle: () -> Unit,
    onDelete: () -> Unit
) {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = source.sourceName,
                    style = MaterialTheme.typography.titleMedium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    text = source.sourceUrl,
                    style = MaterialTheme.typography.bodySmall,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
            
            Switch(
                checked = source.enabled,
                onCheckedChange = { onToggle() }
            )
            
            IconButton(onClick = onDelete) {
                Icon(Icons.Default.Delete, "Delete")
            }
        }
    }
}
