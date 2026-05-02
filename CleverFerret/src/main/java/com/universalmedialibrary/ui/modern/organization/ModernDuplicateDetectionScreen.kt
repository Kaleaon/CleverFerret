// ModernDuplicateDetectionScreen — review duplicate-set candidates
// detected during a maintenance run. Each set shows the keeper (largest /
// best-quality) and dismissible alternates. Bulk-resolve via "Keep best,
// trash rest" CTA per set.

package com.universalmedialibrary.ui.modern.organization

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
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
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

data class UiDuplicateCandidate(
    val id: String,
    val title: String,
    val subtitle: String,        // path / format / size
    val accent: Color,
    val isKeeper: Boolean,
    val isMarkedForDelete: Boolean,
)

data class UiDuplicateSet(
    val id: String,
    val groupLabel: String,           // "Same SHA-1" / "Fuzzy match 92%"
    val candidates: List<UiDuplicateCandidate>,
)

data class ModernDuplicateDetectionUiState(
    val sets: List<UiDuplicateSet>,
    val isScanning: Boolean = false,
    val totalReclaimableBytes: Long = 0L,
)

@Composable
fun ModernDuplicateDetectionScreen(
    state: ModernDuplicateDetectionUiState,
    onBack: () -> Unit,
    onRescan: () -> Unit,
    onPickKeeper: (UiDuplicateSet, UiDuplicateCandidate) -> Unit,
    onToggleDelete: (UiDuplicateSet, UiDuplicateCandidate) -> Unit,
    onResolveSet: (UiDuplicateSet) -> Unit,
    onResolveAll: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Duplicates",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onRescan) {
                        if (state.isScanning) CircularProgressIndicator(strokeWidth = 2.dp, modifier = Modifier.size(18.dp))
                        else Icon(Icons.Default.Refresh, contentDescription = "Rescan")
                    }
                },
            )
        },
        bottomBar = {
            if (state.sets.isNotEmpty()) {
                Row(
                    Modifier
                        .fillMaxWidth()
                        .background(cs.surface)
                        .padding(CFSpacing.lg),
                    verticalAlignment = Alignment.CenterVertically,
                ) {
                    Text(
                        "${state.sets.size} sets · ${state.totalReclaimableBytes.formatBytes()} reclaimable",
                        style = MaterialTheme.typography.labelMedium,
                        color = cs.onSurfaceVariant,
                        modifier = Modifier.weight(1f),
                    )
                    CFMetalButton(text = "Resolve all", onClick = onResolveAll, leadingIcon = Icons.Default.DoneAll)
                }
            }
        },
        containerColor = cs.background,
    ) { padding ->
        if (state.sets.isEmpty()) {
            Box(Modifier.fillMaxSize().padding(padding)) {
                CFEmptyState(
                    icon = Icons.Default.ContentCopy,
                    title = if (state.isScanning) "Scanning..." else "No duplicates found",
                    body = "Run a scan from Maintenance to look for duplicate files across your libraries.",
                    actionLabel = if (!state.isScanning) "Run scan" else null,
                    onAction = if (!state.isScanning) onRescan else null,
                )
            }
            return@Scaffold
        }
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(CFSpacing.lg),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            items(state.sets) { set ->
                Column(
                    Modifier
                        .fillMaxWidth()
                        .clip(RoundedCornerShape(14.dp))
                        .background(cs.surface)
                        .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp))
                        .padding(CFSpacing.md),
                    verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                ) {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Text(set.groupLabel, style = MaterialTheme.typography.titleSmall, modifier = Modifier.weight(1f))
                        TextButton(onClick = { onResolveSet(set) }) { Text("Resolve") }
                    }
                    set.candidates.forEach { c -> CandidateRow(set, c, onPickKeeper, onToggleDelete) }
                }
            }
        }
    }
}

@Composable
private fun CandidateRow(
    set: UiDuplicateSet,
    candidate: UiDuplicateCandidate,
    onPickKeeper: (UiDuplicateSet, UiDuplicateCandidate) -> Unit,
    onToggleDelete: (UiDuplicateSet, UiDuplicateCandidate) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(10.dp))
            .background(if (candidate.isKeeper) cs.primaryContainer.copy(alpha = 0.4f) else cs.background)
            .border(1.dp, if (candidate.isKeeper) cs.primary else cs.outline.copy(alpha = 0.25f), RoundedCornerShape(10.dp))
            .clickable { onPickKeeper(set, candidate) }
            .padding(CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(
            Modifier
                .size(32.dp)
                .clip(CircleShape)
                .background(Brush.linearGradient(listOf(candidate.accent, candidate.accent.copy(alpha = 0.4f)))),
            contentAlignment = Alignment.Center,
        ) {
            if (candidate.isKeeper) Icon(Icons.Default.Star, contentDescription = "Keeper", tint = Color.White, modifier = Modifier.size(16.dp))
        }
        Column(Modifier.weight(1f)) {
            Text(candidate.title, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis, fontWeight = FontWeight.SemiBold)
            Text(candidate.subtitle, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1, overflow = TextOverflow.Ellipsis)
        }
        Checkbox(
            checked = candidate.isMarkedForDelete,
            onCheckedChange = { onToggleDelete(set, candidate) },
            enabled = !candidate.isKeeper,
        )
        Text("Trash", style = MaterialTheme.typography.labelSmall, color = if (candidate.isKeeper) cs.onSurfaceVariant.copy(alpha = 0.4f) else cs.error)
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
