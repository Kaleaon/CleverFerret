// ModernTagExplorerScreen — universal tag browser + manager.
// Top: search field. Body: tag cloud-ish flow of all tags sized by usage.
// Tap a tag for its items list (caller-driven). Long-press to rename / delete.

package com.universalmedialibrary.ui.modern.tags

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

data class UiTag(
    val id: String,
    val name: String,
    val count: Int,
    val color: Color? = null,
)

data class ModernTagExplorerUiState(
    val query: String,
    val tags: List<UiTag>,
    val recent: List<UiTag> = emptyList(),
)

@OptIn(ExperimentalFoundationApi::class, ExperimentalLayoutApi::class)
@Composable
fun ModernTagExplorerScreen(
    state: ModernTagExplorerUiState,
    onBack: () -> Unit,
    onQueryChange: (String) -> Unit,
    onAddTag: () -> Unit,
    onOpenTag: (UiTag) -> Unit,
    onLongPressTag: (UiTag) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val maxCount = (state.tags.maxOfOrNull { it.count } ?: 1).coerceAtLeast(1)
    val displayed = if (state.query.isBlank()) state.tags
                    else state.tags.filter { it.name.contains(state.query, ignoreCase = true) }

    Scaffold(
        topBar = {
            CFTopBar(
                title = "Tags",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onAddTag) { Icon(Icons.Default.Add, contentDescription = "New tag") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        Column(Modifier.fillMaxSize().padding(padding).verticalScroll(rememberScrollState())) {
            OutlinedTextField(
                value = state.query,
                onValueChange = onQueryChange,
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(CFSpacing.lg),
                placeholder = { Text("Filter tags") },
                leadingIcon = { Icon(Icons.Default.Search, contentDescription = null) },
                singleLine = true,
            )

            if (state.recent.isNotEmpty() && state.query.isBlank()) {
                Text(
                    "RECENT",
                    style = MaterialTheme.typography.labelMedium,
                    color = cs.onSurfaceVariant,
                    modifier = Modifier.padding(horizontal = CFSpacing.lg, vertical = CFSpacing.xs),
                )
                FlowRow(
                    modifier = Modifier.padding(horizontal = CFSpacing.lg),
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.xs),
                    verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
                ) {
                    state.recent.forEach { tag -> TagChipBig(tag, maxCount, onOpen = { onOpenTag(tag) }, onLongPress = { onLongPressTag(tag) }) }
                }
            }

            if (displayed.isEmpty()) {
                CFEmptyState(
                    icon = Icons.Default.LocalOffer,
                    title = "No tags",
                    body = if (state.query.isBlank()) "Tag a few items in their detail screens to see them here."
                           else "Nothing matches that filter.",
                )
            } else {
                Text(
                    "ALL TAGS",
                    style = MaterialTheme.typography.labelMedium,
                    color = cs.onSurfaceVariant,
                    modifier = Modifier.padding(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                )
                FlowRow(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.xs),
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.xs),
                    verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
                ) {
                    displayed.forEach { tag -> TagChipBig(tag, maxCount, onOpen = { onOpenTag(tag) }, onLongPress = { onLongPressTag(tag) }) }
                }
            }
        }
    }
}

@OptIn(ExperimentalFoundationApi::class)
@Composable
private fun TagChipBig(tag: UiTag, maxCount: Int, onOpen: () -> Unit, onLongPress: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    val frac = (tag.count.toFloat() / maxCount).coerceIn(0.1f, 1f)
    val fontSizeSp = (12 + (frac * 14)).toInt().coerceAtLeast(12).sp
    val bg = tag.color ?: cs.surfaceVariant
    Row(
        Modifier
            .clip(CircleShape)
            .background(bg)
            .border(1.dp, cs.outline.copy(alpha = 0.4f), CircleShape)
            .combinedClickable(onClick = onOpen, onLongClick = onLongPress)
            .padding(horizontal = 12.dp, vertical = 6.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(6.dp),
    ) {
        Text(
            tag.name,
            style = MaterialTheme.typography.labelLarge.copy(fontSize = fontSizeSp),
            color = cs.onSurface,
            fontWeight = FontWeight.Black,
        )
        Box(
            Modifier
                .clip(RoundedCornerShape(50))
                .background(cs.background)
                .padding(horizontal = 6.dp, vertical = 1.dp),
        ) {
            Text("${tag.count}", style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
        }
    }
}
