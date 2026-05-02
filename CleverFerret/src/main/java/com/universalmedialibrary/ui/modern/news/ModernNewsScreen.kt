// ModernNewsScreen — RSS / Atom news feed reader.
// Top: source filter chip row. Body: article cards with hero swatch,
// source label, title, snippet, age, and offline / save toggles.

package com.universalmedialibrary.ui.modern.news

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
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFTagChip
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

data class UiNewsArticle(
    val id: String,
    val source: String,
    val title: String,
    val snippet: String,
    val ageLabel: String,
    val tint: Color,
    val saved: Boolean = false,
    val read: Boolean = false,
)

data class UiNewsSource(val id: String, val label: String)

data class ModernNewsUiState(
    val articles: List<UiNewsArticle> = emptyList(),
    val sources: List<UiNewsSource> = emptyList(),
    val activeSourceId: String? = null,
)

@Composable
fun ModernNewsScreen(
    state: ModernNewsUiState,
    onBack: () -> Unit,
    onAddSource: () -> Unit,
    onRefresh: () -> Unit,
    onSelectSource: (UiNewsSource?) -> Unit,
    onOpenArticle: (UiNewsArticle) -> Unit,
    onToggleSaved: (UiNewsArticle) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = "News",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onRefresh)   { Icon(Icons.Default.Refresh, contentDescription = "Refresh") }
                    IconButton(onClick = onAddSource) { Icon(Icons.Default.Add, contentDescription = "Add source") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        Column(Modifier.fillMaxSize().padding(padding)) {
            if (state.sources.isNotEmpty()) {
                LazyRow(
                    contentPadding = PaddingValues(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                ) {
                    item {
                        Box(Modifier.clickable { onSelectSource(null) }) {
                            CFTagChip(text = "All", selected = state.activeSourceId == null)
                        }
                    }
                    items(state.sources) { src ->
                        Box(Modifier.clickable { onSelectSource(src) }) {
                            CFTagChip(text = src.label, selected = src.id == state.activeSourceId)
                        }
                    }
                }
            }
            if (state.articles.isEmpty()) {
                CFEmptyState(
                    icon = Icons.Default.Article,
                    title = "Nothing in the feed",
                    body = "Add an RSS or Atom URL to start watching a source.",
                    actionLabel = "Add source",
                    onAction = onAddSource,
                )
            } else {
                LazyColumn(
                    contentPadding = PaddingValues(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                    verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                    modifier = Modifier.fillMaxSize(),
                ) {
                    items(state.articles) { article ->
                        ArticleCard(
                            article = article,
                            onOpen = { onOpenArticle(article) },
                            onToggleSaved = { onToggleSaved(article) },
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun ArticleCard(article: UiNewsArticle, onOpen: () -> Unit, onToggleSaved: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    val titleColor = if (article.read) cs.onSurfaceVariant else cs.onSurface
    Column(
        Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(14.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp))
            .clickable(onClick = onOpen)
            .padding(CFSpacing.md),
        verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
    ) {
        Box(
            Modifier
                .fillMaxWidth()
                .height(140.dp)
                .clip(RoundedCornerShape(10.dp))
                .background(Brush.linearGradient(listOf(article.tint, article.tint.copy(alpha = 0.4f)))),
        )
        Row(verticalAlignment = Alignment.CenterVertically) {
            Text(
                article.source.uppercase(),
                style = MaterialTheme.typography.labelSmall,
                color = cs.primary,
                fontWeight = FontWeight.Black,
            )
            Spacer(Modifier.weight(1f))
            Text(article.ageLabel, style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
        }
        Text(article.title, style = MaterialTheme.typography.titleMedium.copy(fontWeight = FontWeight.Black), color = titleColor, maxLines = 3, overflow = TextOverflow.Ellipsis)
        Text(article.snippet, style = MaterialTheme.typography.bodyMedium, color = cs.onSurfaceVariant, maxLines = 3, overflow = TextOverflow.Ellipsis)
        Row(verticalAlignment = Alignment.CenterVertically) {
            Spacer(Modifier.weight(1f))
            IconButton(onClick = onToggleSaved) {
                Icon(
                    if (article.saved) Icons.Default.Bookmark else Icons.Default.BookmarkBorder,
                    contentDescription = "Save",
                    tint = if (article.saved) cs.primary else cs.onSurfaceVariant,
                )
            }
        }
    }
}
