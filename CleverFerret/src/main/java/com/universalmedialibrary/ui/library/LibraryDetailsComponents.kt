@file:Suppress("FunctionNaming")

package com.universalmedialibrary.ui.library

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material.icons.filled.Delete
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Slider
import androidx.compose.material3.Surface
import androidx.compose.material3.Switch
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.data.local.entity.LibraryScanSettings
import com.universalmedialibrary.data.local.entity.ListenHistoryDailyCount
import com.universalmedialibrary.data.local.entity.ListenHistoryTopItem
import com.universalmedialibrary.ui.selection.GlobalSelectionState

private const val BYTES_PER_MB = 1024L * 1024L
private const val RECENT_DAYS_LIMIT = 7

@Suppress("LongMethod")
@Composable
internal fun LibraryScanSettingsCard(
    settings: LibraryScanSettings,
    onSave: (LibraryScanSettings) -> Unit
) {
    var includePaths by remember(settings) { mutableStateOf(settings.includePaths) }
    var excludePaths by remember(settings) { mutableStateOf(settings.excludePaths) }
    var includeSubdirectories by remember(settings) { mutableStateOf(settings.includeSubdirectories) }
    var minFileSizeMb by remember(settings) {
        mutableStateOf(
            if (settings.minFileSizeBytes <= 0) "" else (settings.minFileSizeBytes / BYTES_PER_MB).toString()
        )
    }
    var minAudioDurationSec by remember(settings) {
        mutableStateOf(
            if (settings.minAudioDurationMs <= 0) "" else (settings.minAudioDurationMs / 1000).toString()
        )
    }
    var preventDuplicates by remember(settings) { mutableStateOf(settings.preventDuplicates) }
    var dedupeStrategy by remember(settings) { mutableStateOf(settings.deduplicationStrategy) }
    var minListenSeconds by remember(settings) { mutableStateOf(settings.minListenSeconds) }
    var minListenPercent by remember(settings) { mutableStateOf(settings.minListenPercent.toFloat()) }
    var showIncludeDialog by remember { mutableStateOf(false) }
    var showExcludeDialog by remember { mutableStateOf(false) }
    var strategyExpanded by remember { mutableStateOf(false) }
    val strategies = listOf("PATH", "FILENAME_SIZE", "HASH")

    if (showIncludeDialog) {
        PathInputDialog(
            title = "Add Include Folder",
            onDismiss = { showIncludeDialog = false },
            onConfirm = { newPath ->
                includePaths = includePaths + newPath
                showIncludeDialog = false
            }
        )
    }

    if (showExcludeDialog) {
        PathInputDialog(
            title = "Add Excluded Folder",
            onDismiss = { showExcludeDialog = false },
            onConfirm = { newPath ->
                excludePaths = excludePaths + newPath
                showExcludeDialog = false
            }
        )
    }

    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceContainer
        )
    ) {
        Column(
            verticalArrangement = Arrangement.spacedBy(12.dp),
            modifier = Modifier.padding(16.dp)
        ) {
            PreferencePathList(
                title = "Include folders",
                paths = includePaths,
                onRemove = { includePaths = includePaths - it },
                onAddClick = { showIncludeDialog = true }
            )

            PreferencePathList(
                title = "Exclude folders",
                paths = excludePaths,
                onRemove = { excludePaths = excludePaths - it },
                onAddClick = { showExcludeDialog = true }
            )

            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text(
                    text = "Include subdirectories",
                    color = MaterialTheme.colorScheme.onSurface
                )
                Switch(checked = includeSubdirectories, onCheckedChange = { includeSubdirectories = it })
            }

            OutlinedTextField(
                value = minFileSizeMb,
                onValueChange = { minFileSizeMb = it },
                label = { Text("Minimum file size (MB)") },
                modifier = Modifier.fillMaxWidth()
            )

            OutlinedTextField(
                value = minAudioDurationSec,
                onValueChange = { minAudioDurationSec = it },
                label = { Text("Minimum audio duration (seconds)") },
                modifier = Modifier.fillMaxWidth()
            )

            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text(
                    text = "Prevent duplicates",
                    color = MaterialTheme.colorScheme.onSurface
                )
                Switch(checked = preventDuplicates, onCheckedChange = { preventDuplicates = it })
            }

            Box(modifier = Modifier.fillMaxWidth()) {
                OutlinedTextField(
                    value = dedupeStrategy,
                    onValueChange = {},
                    readOnly = true,
                    label = { Text("Duplicate strategy") },
                    trailingIcon = {
                        Icon(
                            imageVector = Icons.Default.ArrowDropDown,
                            contentDescription = "Media image",
                            modifier = Modifier.clickable { strategyExpanded = !strategyExpanded }
                        )
                    },
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { strategyExpanded = true }
                )
                DropdownMenu(
                    expanded = strategyExpanded,
                    onDismissRequest = { strategyExpanded = false }
                ) {
                    strategies.forEach { strategy ->
                        DropdownMenuItem(
                            text = { Text(strategy) },
                            onClick = {
                                dedupeStrategy = strategy
                                strategyExpanded = false
                            }
                        )
                    }
                }
            }

            Column {
                Text(
                    text = "Minimum listen seconds: $minListenSeconds",
                    color = MaterialTheme.colorScheme.onSurface
                )
                Slider(
                    value = minListenSeconds.toFloat(),
                    onValueChange = { minListenSeconds = it.toInt() },
                    valueRange = 5f..120f
                )
            }

            Column {
                Text(
                    text = "Minimum listen percent: ${minListenPercent.toInt()}%",
                    color = MaterialTheme.colorScheme.onSurface
                )
                Slider(
                    value = minListenPercent,
                    onValueChange = { minListenPercent = it },
                    valueRange = 5f..100f
                )
            }

            Button(
                onClick = {
                    val minSizeBytes = minFileSizeMb.toLongOrNull()?.coerceAtLeast(0)?.times(BYTES_PER_MB) ?: 0L
                    val minDurationMs = minAudioDurationSec.toLongOrNull()?.coerceAtLeast(0)?.times(1000) ?: 0L
                    onSave(
                        settings.copy(
                            includePaths = includePaths.filter { it.isNotBlank() },
                            excludePaths = excludePaths.filter { it.isNotBlank() },
                            includeSubdirectories = includeSubdirectories,
                            minFileSizeBytes = minSizeBytes,
                            minAudioDurationMs = minDurationMs,
                            preventDuplicates = preventDuplicates,
                            deduplicationStrategy = dedupeStrategy,
                            minListenSeconds = minListenSeconds,
                            minListenPercent = minListenPercent.toInt()
                        )
                    )
                },
                modifier = Modifier.align(Alignment.End)
            ) {
                Text("Save Preferences")
            }
        }
    }
}

@Composable
internal fun PreferencePathList(
    title: String,
    paths: List<String>,
    onRemove: (String) -> Unit,
    onAddClick: () -> Unit
) {
    Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                title,
                style = MaterialTheme.typography.titleSmall,
                color = MaterialTheme.colorScheme.onSurface
            )
            IconButton(onClick = onAddClick) {
                Icon(
                    Icons.Default.Add,
                    contentDescription = "Add path",
                    tint = MaterialTheme.colorScheme.primary
                )
            }
        }

        if (paths.isEmpty()) {
            Text(
                "No paths configured",
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                style = MaterialTheme.typography.bodySmall
            )
        } else {
            paths.forEach { path ->
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clip(RoundedCornerShape(6.dp))
                        .background(MaterialTheme.colorScheme.surfaceContainerHigh)
                        .padding(horizontal = 8.dp, vertical = 6.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        path,
                        modifier = Modifier.weight(1f),
                        color = MaterialTheme.colorScheme.onSurface,
                        style = MaterialTheme.typography.bodySmall
                    )
                    IconButton(onClick = { onRemove(path) }, modifier = Modifier.size(28.dp)) {
                        Icon(
                            Icons.Default.Delete,
                            contentDescription = "Remove path",
                            tint = MaterialTheme.colorScheme.error,
                            modifier = Modifier.size(16.dp)
                        )
                    }
                }
            }
        }
    }
}

@Composable
internal fun HistoryInsightsCard(
    topItems: List<ListenHistoryTopItem>,
    dailyCounts: List<ListenHistoryDailyCount>
) {
    if (topItems.isEmpty() && dailyCounts.isEmpty()) return

    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceContainer
        )
    ) {
        Column(
            verticalArrangement = Arrangement.spacedBy(8.dp),
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                "Listening Insights",
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.onSurface
            )

            if (topItems.isNotEmpty()) {
                TopPlayedItemsSection(topItems = topItems)
            }

            if (dailyCounts.isNotEmpty()) {
                DailyActivitySection(dailyCounts = dailyCounts)
            }
        }
    }
}

@Composable
private fun TopPlayedItemsSection(topItems: List<ListenHistoryTopItem>) {
    Text(
        "Top played items",
        color = MaterialTheme.colorScheme.onSurfaceVariant,
        style = MaterialTheme.typography.labelMedium
    )
    topItems.forEach { item ->
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    item.title,
                    color = MaterialTheme.colorScheme.onSurface,
                    fontWeight = FontWeight.Medium
                )
                item.artist?.let {
                    Text(
                        it,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        style = MaterialTheme.typography.bodySmall
                    )
                }
            }
            Text(
                "${item.playCount}×",
                color = MaterialTheme.colorScheme.primary,
                fontWeight = FontWeight.Bold
            )
        }
    }
}

@Composable
private fun DailyActivitySection(dailyCounts: List<ListenHistoryDailyCount>) {
    Text(
        "Recent activity",
        color = MaterialTheme.colorScheme.onSurfaceVariant,
        style = MaterialTheme.typography.labelMedium
    )
    dailyCounts.take(RECENT_DAYS_LIMIT).forEach { count ->
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text(count.day, color = MaterialTheme.colorScheme.onSurface)
            Text(
                "${count.playCount} plays",
                color = MaterialTheme.colorScheme.primary
            )
        }
    }
}

@Composable
internal fun GlobalSelectionBar(
    selectionState: GlobalSelectionState,
    onClear: () -> Unit,
    modifier: Modifier = Modifier
) {
    Surface(
        tonalElevation = 8.dp,
        shadowElevation = 16.dp,
        color = MaterialTheme.colorScheme.surfaceContainerHigh,
        modifier = modifier
            .fillMaxWidth()
            .padding(16.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                "${selectionState.totalCount} selected",
                color = MaterialTheme.colorScheme.onSurface,
                fontWeight = FontWeight.SemiBold
            )
            OutlinedButton(onClick = onClear) {
                Text("Clear")
            }
        }
    }
}

@Composable
internal fun PathInputDialog(
    title: String,
    onDismiss: () -> Unit,
    onConfirm: (String) -> Unit
) {
    var text by remember { mutableStateOf("") }
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text(title) },
        text = {
            OutlinedTextField(
                value = text,
                onValueChange = { text = it },
                label = { Text("Path or URI") },
                modifier = Modifier.fillMaxWidth()
            )
        },
        confirmButton = {
            TextButton(
                onClick = {
                    if (text.isNotBlank()) {
                        onConfirm(text.trim())
                    }
                }
            ) {
                Text("Add")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
