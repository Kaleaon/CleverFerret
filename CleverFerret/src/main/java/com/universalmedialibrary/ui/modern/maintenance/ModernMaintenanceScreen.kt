// ModernMaintenanceScreen — admin / housekeeping tasks: rebuild index,
// vacuum DB, dedupe, recompute thumbnails, clear caches, etc. Also shows
// device usage stats and a recent activity log.

package com.universalmedialibrary.ui.modern.maintenance

import androidx.compose.foundation.background
import androidx.compose.foundation.border
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
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFSettingsRow
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

data class MaintenanceTask(
    val id: String,
    val label: String,
    val description: String,
    val icon: ImageVector,
    val destructive: Boolean = false,
    val running: Boolean = false,
)

data class UsageStat(val label: String, val value: String)

data class ModernMaintenanceUiState(
    val storageUsedBytes: Long,
    val storageBudgetBytes: Long,
    val itemsByKind: List<UsageStat>,
    val tasks: List<MaintenanceTask>,
    val activityLog: List<String> = emptyList(),
)

object DefaultMaintenanceTasks {
    val DEFAULT = listOf(
        MaintenanceTask("rebuild-index", "Rebuild search index", "Re-run full-text indexing across all libraries", Icons.Default.Search),
        MaintenanceTask("dedupe",        "Detect duplicates",   "Find duplicate files by hash + metadata",        Icons.Default.ContentCopy),
        MaintenanceTask("vacuum",        "Compact database",    "Reclaim space; safe to run any time",            Icons.Default.Compress),
        MaintenanceTask("thumbs",        "Regenerate thumbnails","Rebuild every cover thumbnail",                 Icons.Default.Image),
        MaintenanceTask("metadata",      "Refresh metadata",    "Re-fetch metadata from external providers",      Icons.Default.Sync),
        MaintenanceTask("clear-cache",   "Clear cache",         "Drop transient artwork + parsed-doc caches",     Icons.Default.CleaningServices, destructive = true),
        MaintenanceTask("reset-progress","Reset reading progress", "Wipe progress for all items",                 Icons.Default.Restore, destructive = true),
    )
}

@Composable
fun ModernMaintenanceScreen(
    state: ModernMaintenanceUiState,
    onBack: () -> Unit,
    onRunTask: (MaintenanceTask) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = { CFTopBar(title = "Maintenance", onBack = onBack) },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            item { StorageCard(state) }

            if (state.itemsByKind.isNotEmpty()) {
                item {
                    Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                        CFSectionHeader("Library breakdown")
                        Spacer(Modifier.height(CFSpacing.sm))
                        Column(
                            Modifier
                                .fillMaxWidth()
                                .clip(RoundedCornerShape(12.dp))
                                .background(cs.surface)
                                .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(12.dp)),
                        ) {
                            state.itemsByKind.forEachIndexed { idx, s ->
                                Row(
                                    Modifier.fillMaxWidth().padding(horizontal = CFSpacing.lg, vertical = CFSpacing.md),
                                ) {
                                    Text(s.label, modifier = Modifier.weight(1f), style = MaterialTheme.typography.bodyMedium)
                                    Text(s.value, style = MaterialTheme.typography.bodyMedium, color = cs.primary, fontWeight = FontWeight.Black)
                                }
                                if (idx != state.itemsByKind.lastIndex) HorizontalDivider(color = cs.outline.copy(alpha = 0.2f))
                            }
                        }
                    }
                }
            }

            item {
                Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                    CFSectionHeader("Tasks")
                    Spacer(Modifier.height(CFSpacing.sm))
                    Column(
                        Modifier
                            .fillMaxWidth()
                            .clip(RoundedCornerShape(14.dp))
                            .background(cs.surface)
                            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp)),
                    ) {
                        state.tasks.forEachIndexed { idx, task ->
                            CFSettingsRow(
                                icon = task.icon,
                                title = task.label,
                                subtitle = task.description,
                                onClick = { onRunTask(task) },
                                trailing = {
                                    if (task.running) {
                                        CircularProgressIndicator(modifier = Modifier.size(20.dp), strokeWidth = 2.dp, color = cs.primary)
                                    } else {
                                        Icon(
                                            Icons.Default.PlayArrow,
                                            contentDescription = null,
                                            tint = if (task.destructive) cs.error else cs.primary,
                                        )
                                    }
                                },
                            )
                            if (idx != state.tasks.lastIndex) HorizontalDivider(color = cs.outline.copy(alpha = 0.2f), modifier = Modifier.padding(start = 64.dp))
                        }
                    }
                }
            }

            if (state.activityLog.isNotEmpty()) {
                item {
                    Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                        CFSectionHeader("Activity log")
                        Spacer(Modifier.height(CFSpacing.sm))
                    }
                }
                items(state.activityLog) { line ->
                    Text(
                        line,
                        style = MaterialTheme.typography.bodySmall,
                        color = cs.onSurfaceVariant,
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = CFSpacing.lg + CFSpacing.sm, vertical = 2.dp),
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                    )
                }
            }
        }
    }
}

@Composable
private fun StorageCard(state: ModernMaintenanceUiState) {
    val cs = MaterialTheme.colorScheme
    val pct = if (state.storageBudgetBytes > 0) {
        (state.storageUsedBytes.toFloat() / state.storageBudgetBytes.toFloat()).coerceIn(0f, 1f)
    } else 0f
    Column(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(14.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp))
            .padding(CFSpacing.lg),
    ) {
        Text("STORAGE", style = MaterialTheme.typography.labelMedium, color = cs.onSurfaceVariant)
        Text(
            "${state.storageUsedBytes.formatBytes()} / ${state.storageBudgetBytes.formatBytes()}",
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Black,
        )
        Spacer(Modifier.height(CFSpacing.sm))
        LinearProgressIndicator(
            progress = { pct },
            modifier = Modifier.fillMaxWidth().height(4.dp).clip(RoundedCornerShape(2.dp)),
            color = if (pct > 0.9f) cs.error else cs.primary,
            trackColor = cs.onSurface.copy(alpha = 0.12f),
        )
    }
}

private fun Long.formatBytes(): String {
    val kb = this / 1024.0
    val mb = kb / 1024.0
    val gb = mb / 1024.0
    return when {
        gb >= 1.0 -> "%.2f GB".format(gb)
        mb >= 1.0 -> "%.1f MB".format(mb)
        kb >= 1.0 -> "%.0f KB".format(kb)
        else      -> "$this B"
    }
}
