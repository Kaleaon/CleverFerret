// ModernStorageBrowserScreen — file picker / device storage browser.
// Used everywhere the user needs to point at a folder or file: import,
// add library root, pick destination for downloads, etc.
//
// Top: breadcrumb path. Body: folders + files list. Bottom: actions
// (Select / Cancel) when in pick mode.

package com.universalmedialibrary.ui.modern.storage

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
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
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFTagChip
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

enum class StorageEntryKind { Folder, File }

data class UiStorageEntry(
    val id: String,
    val name: String,
    val kind: StorageEntryKind,
    val sizeLabel: String? = null,        // null for folders
    val modifiedLabel: String? = null,
    val mimeIcon: ImageVector = Icons.Default.InsertDriveFile,
    val selected: Boolean = false,
)

enum class StoragePickMode { BrowseOnly, PickFolder, PickFile }

data class ModernStorageBrowserUiState(
    val pathCrumbs: List<String>,         // breadcrumb labels, root first
    val entries: List<UiStorageEntry>,
    val mode: StoragePickMode = StoragePickMode.BrowseOnly,
    val selectedCount: Int = 0,
)

@Composable
fun ModernStorageBrowserScreen(
    state: ModernStorageBrowserUiState,
    onBack: () -> Unit,
    onJumpCrumb: (Int) -> Unit,
    onOpenFolder: (UiStorageEntry) -> Unit,
    onToggleEntry: (UiStorageEntry) -> Unit,
    onConfirm: () -> Unit,
    onCancel: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = when (state.mode) {
                    StoragePickMode.BrowseOnly -> "Storage"
                    StoragePickMode.PickFolder -> "Pick a folder"
                    StoragePickMode.PickFile   -> "Pick a file"
                },
                onBack = onBack,
            )
        },
        bottomBar = {
            if (state.mode != StoragePickMode.BrowseOnly) {
                Row(
                    Modifier
                        .fillMaxWidth()
                        .background(cs.surface)
                        .padding(CFSpacing.lg),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                ) {
                    OutlinedButton(onClick = onCancel) { Text("Cancel") }
                    Spacer(Modifier.weight(1f))
                    Text(
                        when (state.mode) {
                            StoragePickMode.PickFolder -> "Use this folder"
                            StoragePickMode.PickFile   -> "${state.selectedCount} selected"
                            else -> ""
                        },
                        style = MaterialTheme.typography.labelMedium,
                        color = cs.onSurfaceVariant,
                    )
                    CFMetalButton(text = "Select", onClick = onConfirm, leadingIcon = Icons.Default.Check)
                }
            }
        },
        containerColor = cs.background,
    ) { padding ->
        Column(Modifier.fillMaxSize().padding(padding)) {
            if (state.pathCrumbs.isNotEmpty()) {
                LazyRow(
                    contentPadding = PaddingValues(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.xs),
                    verticalAlignment = Alignment.CenterVertically,
                ) {
                    itemsIndexed(state.pathCrumbs) { index, label ->
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Box(Modifier.clickable { onJumpCrumb(index) }) {
                                CFTagChip(text = label)
                            }
                            if (index != state.pathCrumbs.lastIndex) {
                                Icon(
                                    Icons.Default.ChevronRight,
                                    contentDescription = null,
                                    tint = cs.onSurfaceVariant,
                                    modifier = Modifier.padding(horizontal = 2.dp),
                                )
                            }
                        }
                    }
                }
            }
            if (state.entries.isEmpty()) {
                CFEmptyState(
                    icon = Icons.Default.FolderOff,
                    title = "Folder is empty",
                    body = "Nothing to show here.",
                )
            } else {
                LazyColumn(
                    contentPadding = PaddingValues(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                    verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
                ) {
                    items(state.entries) { entry ->
                        EntryRow(
                            entry,
                            mode = state.mode,
                            onOpen = { if (entry.kind == StorageEntryKind.Folder) onOpenFolder(entry) },
                            onToggle = { onToggleEntry(entry) },
                        )
                    }
                }
            }
        }
    }
}

// LazyRow doesn't have itemsIndexed by default for List — re-implement.
private fun <T> androidx.compose.foundation.lazy.LazyListScope.itemsIndexed(
    items: List<T>,
    itemContent: @androidx.compose.runtime.Composable androidx.compose.foundation.lazy.LazyItemScope.(Int, T) -> Unit,
) {
    items(items.size) { i -> itemContent(i, items[i]) }
}

@Composable
private fun EntryRow(
    entry: UiStorageEntry,
    mode: StoragePickMode,
    onOpen: () -> Unit,
    onToggle: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val isFolder = entry.kind == StorageEntryKind.Folder
    Row(
        Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(10.dp))
            .background(if (entry.selected) cs.primaryContainer.copy(alpha = 0.4f) else cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(10.dp))
            .clickable {
                if (mode == StoragePickMode.PickFile && !isFolder) onToggle()
                else onOpen()
            }
            .padding(CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(
            Modifier
                .size(40.dp)
                .clip(RoundedCornerShape(8.dp))
                .background(cs.surfaceVariant),
            contentAlignment = Alignment.Center,
        ) {
            Icon(
                imageVector = if (isFolder) Icons.Default.Folder else entry.mimeIcon,
                contentDescription = null,
                tint = if (isFolder) cs.primary else cs.onSurfaceVariant,
            )
        }
        Column(Modifier.weight(1f)) {
            Text(
                entry.name,
                style = MaterialTheme.typography.titleSmall,
                fontWeight = if (isFolder) FontWeight.SemiBold else FontWeight.Normal,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
            val meta = listOfNotNull(entry.sizeLabel, entry.modifiedLabel).joinToString(" · ")
            if (meta.isNotBlank()) {
                Text(meta, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant)
            }
        }
        if (mode == StoragePickMode.PickFile && !isFolder) {
            Checkbox(checked = entry.selected, onCheckedChange = { onToggle() })
        } else if (isFolder) {
            Icon(Icons.Default.ChevronRight, contentDescription = null, tint = cs.onSurfaceVariant)
        }
    }
}
