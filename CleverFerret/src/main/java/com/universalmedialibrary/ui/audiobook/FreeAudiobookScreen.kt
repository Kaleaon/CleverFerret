package com.universalmedialibrary.ui.audiobook

import android.content.Intent
import android.net.Uri
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.CloudDownload
import androidx.compose.material.icons.filled.OpenInNew
import androidx.compose.material3.AssistChip
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FilterChip
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.SnackbarHost
import androidx.compose.material3.SnackbarHostState
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateSetOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberSaveable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import com.universalmedialibrary.services.audiobook.free.AudiobookDownloadOption
import com.universalmedialibrary.services.audiobook.free.FreeAudiobook
import com.universalmedialibrary.services.audiobook.free.FreeAudiobookSource

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun FreeAudiobookScreen(
    onBack: () -> Unit,
    viewModel: FreeAudiobookViewModel = hiltViewModel()
) {
    val state by viewModel.uiState.collectAsState()
    val snackbarHostState = remember { SnackbarHostState() }
    val processedStatuses = remember { mutableStateSetOf<String>() }

    val context = LocalContext.current

    LaunchedEffect(state.downloadStatus) {
        state.downloadStatus.forEach { (id, status) ->
            if (processedStatuses.add("$id-${status::class.simpleName}")) {
                when (status) {
                    is DownloadUiStatus.Queued -> {
                        snackbarHostState.showSnackbar("Download queued")
                    }
                    is DownloadUiStatus.Error -> {
                        snackbarHostState.showSnackbar("Download failed: ${status.message}")
                    }
                }
            }
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Free Audiobooks") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.refresh() }) {
                        Icon(Icons.Default.CloudDownload, contentDescription = "Refresh")
                    }
                }
            )
        },
        snackbarHost = { SnackbarHost(snackbarHostState) }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(horizontal = 16.dp, vertical = 12.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            SourceSelector(
                selected = state.selectedSource,
                onSelect = viewModel::updateSource
            )

            SearchBar(
                query = state.query,
                onQueryChange = viewModel::updateQuery
            )

            when {
                state.isLoading && state.results.isEmpty() -> {
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(top = 48.dp),
                        contentAlignment = Alignment.TopCenter
                    ) {
                        CircularProgressIndicator()
                    }
                }
                state.error != null && state.results.isEmpty() -> {
                    ErrorState(message = state.error ?: "Failed to load audiobooks")
                }
                else -> {
                    LazyColumn(
                        modifier = Modifier.fillMaxSize(),
                        verticalArrangement = Arrangement.spacedBy(16.dp),
                        contentPadding = PaddingValues(bottom = 32.dp)
                    ) {
                        items(state.results, key = { it.id }) { audiobook ->
                            AudiobookCard(
                                audiobook = audiobook,
                                onDownload = { option -> viewModel.download(audiobook, option) },
                                onOpenLink = { url ->
                                    val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
                                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                                    context.startActivity(intent)
                                }
                            )
                        }
                    }
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class, ExperimentalLayoutApi::class)
@Composable
private fun SourceSelector(
    selected: FreeAudiobookSource?,
    onSelect: (FreeAudiobookSource?) -> Unit
) {
    val sources = listOf<FreeAudiobookSource?>(null) + FreeAudiobookSource.values()

    FlowRow(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
        sources.forEach { source ->
            val label = when (source) {
                null -> "All Sources"
                else -> source.displayName
            }
            FilterChip(
                selected = source == selected,
                onClick = { onSelect(source) },
                label = { Text(label) }
            )
        }
    }
}

@Composable
private fun SearchBar(
    query: String,
    onQueryChange: (String) -> Unit
) {
    var localQuery by rememberSaveable { mutableStateOf(query) }

    LaunchedEffect(query) {
        if (query != localQuery) {
            localQuery = query
        }
    }

    OutlinedTextField(
        value = localQuery,
        onValueChange = {
            localQuery = it
            onQueryChange(it)
        },
        label = { Text("Search catalog") },
        placeholder = { Text("Titles, authors, narrators") },
        modifier = Modifier.fillMaxWidth(),
        singleLine = true,
        trailingIcon = {
            if (localQuery.isNotBlank()) {
                TextButton(onClick = {
                    localQuery = ""
                    onQueryChange("")
                }) {
                    Text("Clear")
                }
            }
        }
    )
}

@OptIn(ExperimentalMaterial3Api::class, ExperimentalLayoutApi::class)
@Composable
private fun AudiobookCard(
    audiobook: FreeAudiobook,
    onDownload: (AudiobookDownloadOption) -> Unit,
    onOpenLink: (String) -> Unit
) {
    Column(
        modifier = Modifier.fillMaxWidth(),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        Row(
            horizontalArrangement = Arrangement.spacedBy(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            AsyncImage(
                model = audiobook.coverUrl,
                contentDescription = null,
                modifier = Modifier
                    .size(width = 96.dp, height = 96.dp)
            )

            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = audiobook.title,
                    style = MaterialTheme.typography.titleMedium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                audiobook.author?.let {
                    Text(
                        text = it,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Text(
                    text = audiobook.source.displayName,
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.primary
                )
            }
        }

        audiobook.description?.takeIf { it.isNotBlank() }?.let {
            Text(
                text = it,
                style = MaterialTheme.typography.bodyMedium,
                maxLines = 4,
                overflow = TextOverflow.Ellipsis
            )
        }

        if (audiobook.tags.isNotEmpty()) {
            FlowRow(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                audiobook.tags.take(6).forEach { tag ->
                    AssistChip(onClick = {}, label = { Text(tag) })
                }
            }
        }

        Row(
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            val downloadOptions = audiobook.downloadOptions.takeIf { it.isNotEmpty() }
            if (downloadOptions != null) {
                downloadOptions.forEach { option ->
                    AssistChip(
                        onClick = { onDownload(option) },
                        label = {
                            Text(option.label)
                        },
                        leadingIcon = {
                            Icon(Icons.Default.CloudDownload, contentDescription = null)
                        }
                    )
                }
            }

            audiobook.streamUrl?.let { streamUrl ->
                TextButton(onClick = { onOpenLink(streamUrl) }) {
                    Icon(Icons.Default.OpenInNew, contentDescription = null)
                    Spacer(Modifier.width(4.dp))
                    Text("Preview")
                }
            }

            audiobook.detailUrl?.let { detailUrl ->
                TextButton(onClick = { onOpenLink(detailUrl) }) {
                    Icon(Icons.Default.OpenInNew, contentDescription = null)
                    Spacer(Modifier.width(4.dp))
                    Text("Details")
                }
            }
        }
    }
}

@Composable
private fun ErrorState(message: String) {
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(
            text = message,
            style = MaterialTheme.typography.bodyLarge,
            color = MaterialTheme.colorScheme.error
        )
    }
}
