// ModernBookmarkScreen — bookmarks + highlights + notes for the active
// reader. Filter by type, jump-to-position on tap, swipe / icon button to
// delete.

package com.universalmedialibrary.ui.modern.reader

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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFTagChip
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

enum class BookmarkKind(val label: String) { Bookmark("Bookmarks"), Highlight("Highlights"), Note("Notes") }

data class UiBookmark(
    val id: String,
    val kind: BookmarkKind,
    val locationLabel: String,        // "Ch. 7, p. 142"
    val excerpt: String,
    val noteText: String? = null,
    val color: Color? = null,         // highlight color tint, optional
    val createdLabel: String,
)

data class ModernBookmarkUiState(
    val bookTitle: String,
    val bookmarks: List<UiBookmark>,
    val activeFilter: BookmarkKind? = null,
)

@Composable
fun ModernBookmarkScreen(
    state: ModernBookmarkUiState,
    onBack: () -> Unit,
    onSetFilter: (BookmarkKind?) -> Unit,
    onJumpTo: (UiBookmark) -> Unit,
    onDelete: (UiBookmark) -> Unit,
    onShare: (UiBookmark) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val displayed = state.activeFilter?.let { f -> state.bookmarks.filter { it.kind == f } } ?: state.bookmarks
    Scaffold(
        topBar = { CFTopBar(title = state.bookTitle, onBack = onBack) },
        containerColor = cs.background,
    ) { padding ->
        Column(Modifier.fillMaxSize().padding(padding)) {
            LazyRow(
                contentPadding = PaddingValues(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
            ) {
                item {
                    Box(Modifier.clickable { onSetFilter(null) }) {
                        CFTagChip(text = "All", selected = state.activeFilter == null)
                    }
                }
                items(BookmarkKind.entries.toList()) { kind ->
                    Box(Modifier.clickable { onSetFilter(kind) }) {
                        CFTagChip(text = kind.label, selected = kind == state.activeFilter)
                    }
                }
            }
            if (displayed.isEmpty()) {
                CFEmptyState(
                    icon = Icons.Default.Bookmarks,
                    title = "Nothing saved here",
                    body = "Long-press text in the reader to add a highlight, or tap the bookmark icon at any page.",
                )
            } else {
                LazyColumn(
                    contentPadding = PaddingValues(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                    verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                ) {
                    items(displayed) { bookmark ->
                        BookmarkRow(
                            bookmark = bookmark,
                            onJumpTo = { onJumpTo(bookmark) },
                            onDelete = { onDelete(bookmark) },
                            onShare = { onShare(bookmark) },
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun BookmarkRow(
    bookmark: UiBookmark,
    onJumpTo: () -> Unit,
    onDelete: () -> Unit,
    onShare: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Column(
        Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(12.dp))
            .clickable(onClick = onJumpTo)
            .padding(CFSpacing.md),
        verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
    ) {
        Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(6.dp)) {
            Icon(
                imageVector = when (bookmark.kind) {
                    BookmarkKind.Bookmark  -> Icons.Default.Bookmark
                    BookmarkKind.Highlight -> Icons.Default.Highlight
                    BookmarkKind.Note      -> Icons.Default.StickyNote2
                },
                contentDescription = bookmark.kind.label,
                tint = bookmark.color ?: cs.primary,
                modifier = Modifier.size(16.dp),
            )
            Text(
                bookmark.locationLabel.uppercase(),
                style = MaterialTheme.typography.labelSmall,
                color = cs.primary,
                fontWeight = FontWeight.Black,
            )
            Spacer(Modifier.weight(1f))
            Text(bookmark.createdLabel, style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
        }
        if (bookmark.excerpt.isNotBlank()) {
            Text(
                bookmark.excerpt,
                style = MaterialTheme.typography.bodyMedium.copy(fontStyle = FontStyle.Italic),
                maxLines = 4,
                overflow = TextOverflow.Ellipsis,
                color = bookmark.color?.let { cs.onSurface } ?: cs.onSurface,
            )
        }
        bookmark.noteText?.let {
            Text(it, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 3, overflow = TextOverflow.Ellipsis)
        }
        Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.End) {
            IconButton(onClick = onShare)  { Icon(Icons.Default.Share,  contentDescription = "Share",  tint = cs.onSurfaceVariant) }
            IconButton(onClick = onDelete) { Icon(Icons.Default.Delete, contentDescription = "Delete", tint = cs.onSurfaceVariant) }
        }
    }
}
