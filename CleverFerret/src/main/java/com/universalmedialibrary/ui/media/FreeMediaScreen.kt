package com.universalmedialibrary.ui.media

import android.content.Intent
import android.net.Uri
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.OpenInNew
import androidx.compose.material.icons.filled.CloudDownload
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
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import com.universalmedialibrary.services.media.free.FreeMediaDownloadOption
import com.universalmedialibrary.services.media.free.FreeMediaItem
import com.universalmedialibrary.services.media.free.FreeMediaType

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun FreeMediaScreen(
    onBack: () -> Unit,
    viewModel: FreeMediaViewModel = hiltViewModel()
) {
    val state by viewModel.uiState.collectAsState()
    val snackbarHostState = remember { SnackbarHostState() }
    val context = LocalContext.current

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Free Media") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
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
            TypeSelector(
                selected = state.activeType,
                onSelect = viewModel::selectType
            )

            SearchField(
                query = state.query,
                onQueryChange = viewModel::search,
                modifier = Modifier.fillMaxWidth()
            )

            when {
                state.isLoading && state.results.isEmpty() -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CircularProgressIndicator()
                    }
                }
                state.error != null && state.results.isEmpty() -> {
                    ErrorState(state.error ?: "Failed to load media")
                }
                else -> {
                    MediaList(
                        items = state.results,
                        onDownload = { option ->
                            val intent = Intent(Intent.ACTION_VIEW, Uri.parse(option.url))
                            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                            context.startActivity(intent)
                        },
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

@OptIn(ExperimentalMaterial3Api::class, ExperimentalLayoutApi::class)
@Composable
private fun TypeSelector(
    selected: FreeMediaType,
    onSelect: (FreeMediaType) -> Unit
) {
    FlowRow(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
        FreeMediaType.values().forEach { type ->
            FilterChip(
                selected = type == selected,
                onClick = { onSelect(type) },
                label = { Text(type.displayName) }
            )
        }
    }
}

@Composable
private fun SearchField(
    query: String,
    onQueryChange: (String) -> Unit,
    modifier: Modifier = Modifier
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
        placeholder = { Text("Titles, creators, keywords") },
        modifier = modifier,
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

@Composable
private fun MediaList(
    items: List<FreeMediaItem>,
    onDownload: (FreeMediaDownloadOption) -> Unit,
    onOpenLink: (String) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(bottom = 32.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        itemsIndexed(
            items = items,
            key = { index, item -> freeMediaItemKey(item = item, index = index) }
        ) { _, item ->
            MediaCard(
                item = item,
                onDownload = onDownload,
                onOpenLink = onOpenLink
            )
        }
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun MediaCard(
    item: FreeMediaItem,
    onDownload: (FreeMediaDownloadOption) -> Unit,
    onOpenLink: (String) -> Unit
) {
    val uiModel = item.toUiModel()

    Column(
        modifier = Modifier.fillMaxWidth(),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        Row(
            horizontalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            AsyncImage(
                model = uiModel.thumbnailUrl,
                contentDescription = "${item.title} thumbnail",
                modifier = Modifier
                    .size(width = 120.dp, height = 90.dp)
            )

            Column(
                modifier = Modifier.weight(1f),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                Text(
                    text = item.title,
                    style = MaterialTheme.typography.titleMedium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                item.creator?.let {
                    Text(
                        text = it,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Text(
                    text = item.type.displayName,
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.primary
                )
                Text(
                    text = uiModel.yearLabel,
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Text(
                    text = uiModel.durationLabel,
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }

        item.description?.takeIf { it.isNotBlank() }?.let {
            Text(
                text = it,
                style = MaterialTheme.typography.bodyMedium,
                maxLines = 4,
                overflow = TextOverflow.Ellipsis
            )
        }

        if (item.tags.isNotEmpty()) {
            FlowRow(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                item.tags.take(8).forEach { tag ->
                    AssistChip(onClick = {}, label = { Text(tag) })
                }
            }
        }

        Row(
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            item.downloadOptions.forEach { option ->
                AssistChip(
                    onClick = { onDownload(option) },
                    label = { Text(option.label) },
                    leadingIcon = {
                        Icon(Icons.Default.CloudDownload, contentDescription = "Download")
                    }
                )
            }

            item.streamingUrl?.let { streamUrl ->
                TextButton(onClick = { onOpenLink(streamUrl) }) {
                    Icon(Icons.AutoMirrored.Filled.OpenInNew, contentDescription = "Stream in browser")
                    Spacer(Modifier.width(4.dp))
                    Text("Stream")
                }
            }

            item.detailUrl?.let { url ->
                TextButton(onClick = { onOpenLink(url) }) {
                    Icon(Icons.AutoMirrored.Filled.OpenInNew, contentDescription = "View details in browser")
                    Spacer(Modifier.width(4.dp))
                    Text("Details")
                }
            }
        }
    }
}

internal fun freeMediaItemKey(item: FreeMediaItem, index: Int): String {
    val normalizedId = item.id.trim()
    if (normalizedId.isNotEmpty()) {
        return "${item.type.name}:$normalizedId"
    }

    val fallbackTitle = item.title.ifBlank { "untitled" }
    val fallbackYear = item.year?.takeIf { it.isNotBlank() } ?: "unknown-year"
    return "${item.type.name}:$fallbackTitle:$fallbackYear:$index"
}

internal data class FreeMediaItemUiModel(
    val thumbnailUrl: String?,
    val yearLabel: String,
    val durationLabel: String
)

internal fun FreeMediaItem.toUiModel(): FreeMediaItemUiModel {
    return FreeMediaItemUiModel(
        thumbnailUrl = thumbnailUrl?.takeIf { it.isNotBlank() },
        yearLabel = year?.takeIf { it.isNotBlank() } ?: "Year unknown",
        durationLabel = runtimeSeconds
            ?.takeIf { it > 0 }
            ?.let(::formatRuntimeLabel)
            ?: "Duration unknown"
    )
}

private fun formatRuntimeLabel(seconds: Long): String {
    val totalMinutes = seconds / 60
    val hours = totalMinutes / 60
    val minutes = totalMinutes % 60

    return when {
        hours > 0 -> "Duration: ${hours}h ${minutes}m"
        totalMinutes > 0 -> "Duration: ${totalMinutes}m"
        else -> "Duration: <1m"
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
