// ModernBookSourceManagerScreen — pluggable metadata source manager
// (Goodreads, OpenLibrary, Google Books, ComicVine, MAL, etc.). Each
// row toggles enabled state, exposes priority drag handle, and reveals
// auth status when a source needs an API key.

package com.universalmedialibrary.ui.modern.books

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
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

enum class BookSourceAuthState { Public, Configured, NeedsKey, Error }

data class UiBookSource(
    val id: String,
    val name: String,
    val description: String,
    val icon: ImageVector,
    val enabled: Boolean,
    val authState: BookSourceAuthState,
    val priority: Int,                 // lower = higher priority
)

data class ModernBookSourceManagerUiState(
    val sources: List<UiBookSource>,
    val testEndpoint: String? = null,  // currently-running smoke test
)

@Composable
fun ModernBookSourceManagerScreen(
    state: ModernBookSourceManagerUiState,
    onBack: () -> Unit,
    onToggle: (UiBookSource, Boolean) -> Unit,
    onConfigure: (UiBookSource) -> Unit,
    onPriorityUp: (UiBookSource) -> Unit,
    onPriorityDown: (UiBookSource) -> Unit,
    onAddSource: () -> Unit,
    onTestAll: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val sorted = state.sources.sortedBy { it.priority }
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Metadata sources",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onTestAll) { Icon(Icons.Default.NetworkCheck, contentDescription = "Test all") }
                    IconButton(onClick = onAddSource) { Icon(Icons.Default.Add, contentDescription = "Add source") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        if (sorted.isEmpty()) {
            Box(Modifier.fillMaxSize().padding(padding)) {
                CFEmptyState(
                    icon = Icons.Default.MenuBook,
                    title = "No metadata sources",
                    body = "Add OpenLibrary, Goodreads, Google Books, ComicVine, or your own to enrich item metadata.",
                    actionLabel = "Add source",
                    onAction = onAddSource,
                )
            }
            return@Scaffold
        }
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
        ) {
            item { CFSectionHeader("Priority order", "Top is tried first", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
            items(sorted) { source ->
                Row(
                    Modifier
                        .fillMaxWidth()
                        .padding(horizontal = CFSpacing.lg)
                        .clip(RoundedCornerShape(12.dp))
                        .background(cs.surface)
                        .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(12.dp))
                        .clickable { onConfigure(source) }
                        .padding(CFSpacing.md),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                ) {
                    Box(
                        Modifier
                            .size(40.dp)
                            .clip(RoundedCornerShape(10.dp))
                            .background(cs.surfaceVariant),
                        contentAlignment = Alignment.Center,
                    ) { Icon(source.icon, contentDescription = null, tint = cs.primary) }
                    Column(Modifier.weight(1f)) {
                        Text(source.name, style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.Black, maxLines = 1, overflow = TextOverflow.Ellipsis)
                        Text(source.description, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1, overflow = TextOverflow.Ellipsis)
                        AuthBadge(source.authState)
                    }
                    Column(verticalArrangement = Arrangement.spacedBy(0.dp)) {
                        IconButton(onClick = { onPriorityUp(source) }, modifier = Modifier.size(28.dp)) {
                            Icon(Icons.Default.KeyboardArrowUp, contentDescription = "Higher priority", modifier = Modifier.size(18.dp))
                        }
                        IconButton(onClick = { onPriorityDown(source) }, modifier = Modifier.size(28.dp)) {
                            Icon(Icons.Default.KeyboardArrowDown, contentDescription = "Lower priority", modifier = Modifier.size(18.dp))
                        }
                    }
                    Switch(checked = source.enabled, onCheckedChange = { onToggle(source, it) }, enabled = source.authState != BookSourceAuthState.NeedsKey)
                }
            }
        }
    }
}

@Composable
private fun AuthBadge(state: BookSourceAuthState) {
    val cs = MaterialTheme.colorScheme
    val (label, color) = when (state) {
        BookSourceAuthState.Public      -> "Public"      to cs.onSurfaceVariant
        BookSourceAuthState.Configured  -> "Configured"  to cs.primary
        BookSourceAuthState.NeedsKey    -> "Needs key"   to cs.error
        BookSourceAuthState.Error       -> "Error"       to cs.error
    }
    Text(label, style = MaterialTheme.typography.labelSmall, color = color)
}
