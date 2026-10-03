// ModernSyncScreen — sync dashboard. Shows the global "last sync" status,
// per-source rows with health + last-sync time + sync-now CTA, and a
// transient list of currently-running jobs at the top.

package com.universalmedialibrary.ui.modern.sync

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

enum class SyncHealth { Online, Syncing, Stale, Failed, Offline }

data class UiSyncSource(
    val id: String,
    val name: String,
    val health: SyncHealth,
    val lastSyncLabel: String,
    val itemCount: Int,
    val errorMessage: String? = null,
)

data class UiSyncJob(
    val id: String,
    val label: String,
    val progress: Float,           // -1f = indeterminate
    val detail: String,
)

data class ModernSyncUiState(
    val lastSyncSummary: String,
    val activeJobs: List<UiSyncJob> = emptyList(),
    val sources: List<UiSyncSource> = emptyList(),
)

@Composable
fun ModernSyncScreen(
    state: ModernSyncUiState,
    onBack: () -> Unit,
    onSyncAll: () -> Unit,
    onSyncOne: (UiSyncSource) -> Unit,
    onCancelJob: (UiSyncJob) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = { CFTopBar(title = "Sync", onBack = onBack) },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            item {
                Column(
                    Modifier
                        .fillMaxWidth()
                        .padding(horizontal = CFSpacing.lg)
                        .clip(RoundedCornerShape(16.dp))
                        .background(cs.surface)
                        .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(16.dp))
                        .padding(CFSpacing.lg),
                ) {
                    Text("LAST SYNC", style = MaterialTheme.typography.labelMedium, color = cs.onSurfaceVariant)
                    Text(
                        state.lastSyncSummary,
                        style = MaterialTheme.typography.titleLarge.copy(
                            brush = tokens.metal.brush(),
                            fontWeight = FontWeight.Black,
                        ),
                    )
                    Spacer(Modifier.height(CFSpacing.md))
                    CFMetalButton(text = "Sync all now", onClick = onSyncAll, leadingIcon = Icons.Default.Sync)
                }
            }

            if (state.activeJobs.isNotEmpty()) {
                item { CFSectionHeader("Running", "${state.activeJobs.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
                items(state.activeJobs) { job -> JobRow(job, onCancel = { onCancelJob(job) }) }
            }

            item { CFSectionHeader("Sources", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
            items(state.sources) { src -> SourceRow(src, onSync = { onSyncOne(src) }) }
        }
    }
}

@Composable
private fun JobRow(job: UiSyncJob, onCancel: () -> Unit) {
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
            Text(job.label, style = MaterialTheme.typography.titleSmall, modifier = Modifier.weight(1f), maxLines = 1, overflow = TextOverflow.Ellipsis)
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
private fun SourceRow(src: UiSyncSource, onSync: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    val (dot, statusLabel) = when (src.health) {
        SyncHealth.Online   -> Color(0xFF5BD68E) to "Online"
        SyncHealth.Syncing  -> cs.primary to "Syncing"
        SyncHealth.Stale    -> Color(0xFFE0B040) to "Stale"
        SyncHealth.Failed   -> cs.error to "Failed"
        SyncHealth.Offline  -> cs.onSurfaceVariant to "Offline"
    }
    Row(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(12.dp))
            .padding(CFSpacing.md),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(Modifier.size(10.dp).clip(CircleShape).background(dot))
        Column(Modifier.weight(1f)) {
            Text(src.name, style = MaterialTheme.typography.titleSmall)
            Text(
                "$statusLabel · ${src.itemCount} items · ${src.lastSyncLabel}",
                style = MaterialTheme.typography.bodySmall,
                color = cs.onSurfaceVariant,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
            src.errorMessage?.let {
                Text(it, style = MaterialTheme.typography.bodySmall, color = cs.error, maxLines = 2, overflow = TextOverflow.Ellipsis)
            }
        }
        IconButton(onClick = onSync) {
            Icon(Icons.Default.Refresh, contentDescription = "Sync now", tint = cs.primary)
        }
    }
}
