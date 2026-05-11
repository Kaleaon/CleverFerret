// ModernImportScreen — universal import surface covering FolderImport,
// ImportSorter, and ImportHistory. Three sections: Active jobs, Pick a
// source (folder, OPDS, archive, Calibre, etc.), and Recent history.

package com.universalmedialibrary.ui.modern.imports

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFSettingsRow
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

data class ImportSource(
    val id: String,
    val label: String,
    val description: String,
    val icon: ImageVector,
)

object DefaultImportSources {
    val DEFAULT = listOf(
        ImportSource("folder",   "Folder scan",       "Scan a device folder",                        Icons.Default.Folder),
        ImportSource("calibre",  "Calibre library",   "Import a Calibre folder or sync OPDS feed",   Icons.Default.LibraryBooks),
        ImportSource("opds",     "OPDS catalog",      "Add an OPDS feed and pull entries",           Icons.Default.Public),
        ImportSource("archive",  "Archive",           "Import a .zip / .tar / .cbz / .cbr",          Icons.Default.Archive),
        ImportSource("ebooks",   "EPUB / PDF",        "Single document import",                       Icons.Default.MenuBook),
        ImportSource("plex",     "Plex / Jellyfin",   "Mirror metadata from a media server",         Icons.Default.Cast),
        ImportSource("reddit",   "Reddit subreddit",  "Watch a subreddit for new chapters",          Icons.Default.Forum),
    )
}

enum class ImportJobState { Queued, Running, Done, Failed }

data class UiImportJob(
    val id: String,
    val sourceLabel: String,
    val detail: String,
    val state: ImportJobState,
    val progress: Float,        // -1f for indeterminate
    val itemCount: Int = 0,
    val errorMessage: String? = null,
)

data class ModernImportUiState(
    val active: List<UiImportJob> = emptyList(),
    val recent: List<UiImportJob> = emptyList(),
    val sources: List<ImportSource> = DefaultImportSources.DEFAULT,
)

@Composable
fun ModernImportScreen(
    state: ModernImportUiState,
    onBack: () -> Unit,
    onPickSource: (ImportSource) -> Unit,
    onCancelJob: (UiImportJob) -> Unit,
    onClearHistory: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Import",
                onBack = onBack,
                actions = {
                    if (state.recent.isNotEmpty()) {
                        IconButton(onClick = onClearHistory) {
                            Icon(Icons.Default.ClearAll, contentDescription = "Clear history")
                        }
                    }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            if (state.active.isNotEmpty()) {
                item { CFSectionHeader("Running", "${state.active.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
                items(state.active) { job -> JobRow(job, onCancel = { onCancelJob(job) }) }
            }

            item {
                Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                    CFSectionHeader("Pick a source")
                    Spacer(Modifier.height(CFSpacing.sm))
                    Column(
                        Modifier
                            .fillMaxWidth()
                            .clip(RoundedCornerShape(14.dp))
                            .background(cs.surface)
                            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp)),
                    ) {
                        state.sources.forEachIndexed { idx, src ->
                            CFSettingsRow(
                                icon = src.icon,
                                title = src.label,
                                subtitle = src.description,
                                onClick = { onPickSource(src) },
                            )
                            if (idx != state.sources.lastIndex) {
                                HorizontalDivider(color = cs.outline.copy(alpha = 0.2f), modifier = Modifier.padding(start = 64.dp))
                            }
                        }
                    }
                }
            }

            if (state.recent.isEmpty() && state.active.isEmpty()) {
                item {
                    CFEmptyState(
                        icon = Icons.Default.History,
                        title = "No import history",
                        body = "Past import runs will appear here once you've imported something.",
                    )
                }
            } else if (state.recent.isNotEmpty()) {
                item { CFSectionHeader("Recent", "${state.recent.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
                items(state.recent) { job -> RecentRow(job) }
            }
        }
    }
}

@Composable
private fun JobRow(job: UiImportJob, onCancel: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Column(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .padding(CFSpacing.md),
    ) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Text(
                job.sourceLabel,
                style = MaterialTheme.typography.titleSmall,
                modifier = Modifier.weight(1f),
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
            IconButton(onClick = onCancel) {
                Icon(Icons.Default.Close, contentDescription = "Cancel", tint = cs.onSurfaceVariant)
            }
        }
        Text(job.detail, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant)
        Spacer(Modifier.height(4.dp))
        if (job.progress < 0f) {
            LinearProgressIndicator(
                modifier = Modifier.fillMaxWidth().height(3.dp).clip(RoundedCornerShape(2.dp)),
                color = cs.primary,
                trackColor = cs.onSurface.copy(alpha = 0.12f),
            )
        } else {
            LinearProgressIndicator(
                progress = { job.progress },
                modifier = Modifier.fillMaxWidth().height(3.dp).clip(RoundedCornerShape(2.dp)),
                color = cs.primary,
                trackColor = cs.onSurface.copy(alpha = 0.12f),
            )
        }
    }
}

@Composable
private fun RecentRow(job: UiImportJob) {
    val cs = MaterialTheme.colorScheme
    val (icon, tint, label) = when (job.state) {
        ImportJobState.Done    -> Triple(Icons.Default.CheckCircle, cs.primary,         "Imported ${job.itemCount}")
        ImportJobState.Failed  -> Triple(Icons.Default.ErrorOutline, cs.error,           job.errorMessage ?: "Failed")
        ImportJobState.Running -> Triple(Icons.Default.Sync,         cs.onSurfaceVariant, "Running")
        ImportJobState.Queued  -> Triple(Icons.Default.HourglassEmpty, cs.onSurfaceVariant, "Queued")
    }
    Row(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(10.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(10.dp))
            .padding(CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Icon(icon, contentDescription = label, tint = tint)
        Column(Modifier.weight(1f)) {
            Text(job.sourceLabel, style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.SemiBold, maxLines = 1, overflow = TextOverflow.Ellipsis)
            Text(label, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1, overflow = TextOverflow.Ellipsis)
        }
    }
}
