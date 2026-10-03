// ModernReaderScreen — book reader chrome.
// Caller supplies the actual reader surface (Readium navigator, EPUB pager,
// PDF view, etc.) as `pageSurface`. This composable handles top/bottom
// toolbars that fade in on tap and an inline progress bar showing
// "page X of Y" + chapter title. Stays entirely token-driven so it adopts
// every CFTheme palette automatically — including Paper & Ink (light reader).

package com.universalmedialibrary.ui.modern.reader

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class ModernReaderUiState(
    val title: String,
    val author: String,
    val chapterTitle: String,
    val pageIndex: Int,
    val pageCount: Int,
    val progress: Float, // 0..1
    val isBookmarked: Boolean = false,
    val ttsAvailable: Boolean = false,
    val ttsActive: Boolean = false,
)

@Composable
fun ModernReaderScreen(
    state: ModernReaderUiState,
    onBack: () -> Unit,
    onToggleBookmark: () -> Unit,
    onOpenChapters: () -> Unit,
    onOpenSearch: () -> Unit,
    onOpenSettings: () -> Unit,
    onToggleTts: () -> Unit,
    onSeek: (Float) -> Unit,
    pageSurface: @Composable BoxScope.() -> Unit,
) {
    var chromeVisible by remember { mutableStateOf(true) }
    val interaction = remember { MutableInteractionSource() }

    Box(
        Modifier
            .fillMaxSize()
            .background(MaterialTheme.colorScheme.background)
            .clickable(interactionSource = interaction, indication = null) {
                chromeVisible = !chromeVisible
            },
    ) {
        pageSurface()

        AnimatedVisibility(
            visible = chromeVisible,
            enter = slideInVertically { -it } + fadeIn(),
            exit = slideOutVertically { -it } + fadeOut(),
            modifier = Modifier.align(Alignment.TopCenter),
        ) {
            ReaderTopBar(
                state = state,
                onBack = onBack,
                onToggleBookmark = onToggleBookmark,
                onOpenSearch = onOpenSearch,
                onOpenSettings = onOpenSettings,
            )
        }

        AnimatedVisibility(
            visible = chromeVisible,
            enter = slideInVertically { it } + fadeIn(),
            exit = slideOutVertically { it } + fadeOut(),
            modifier = Modifier.align(Alignment.BottomCenter),
        ) {
            ReaderBottomBar(
                state = state,
                onSeek = onSeek,
                onOpenChapters = onOpenChapters,
                onToggleTts = onToggleTts,
            )
        }
    }
}

@Composable
private fun ReaderTopBar(
    state: ModernReaderUiState,
    onBack: () -> Unit,
    onToggleBookmark: () -> Unit,
    onOpenSearch: () -> Unit,
    onOpenSettings: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Surface(
        color = cs.surface,
        tonalElevation = 4.dp,
    ) {
        Row(
            Modifier
                .fillMaxWidth()
                .padding(horizontal = CFSpacing.sm, vertical = CFSpacing.sm),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(CFSpacing.xs),
        ) {
            IconButton(onClick = onBack) {
                Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
            }
            Column(Modifier.weight(1f)) {
                Text(
                    state.title,
                    style = MaterialTheme.typography.titleSmall.copy(
                        brush = tokens.metal.brush(),
                        fontWeight = FontWeight.Black,
                    ),
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                )
                Text(
                    state.author,
                    style = MaterialTheme.typography.labelSmall,
                    color = cs.onSurfaceVariant,
                    maxLines = 1,
                )
            }
            IconButton(onClick = onToggleBookmark) {
                Icon(
                    if (state.isBookmarked) Icons.Default.Bookmark else Icons.Default.BookmarkBorder,
                    contentDescription = "Bookmark",
                    tint = if (state.isBookmarked) cs.primary else cs.onSurface,
                )
            }
            IconButton(onClick = onOpenSearch) { Icon(Icons.Default.Search, contentDescription = "Search") }
            IconButton(onClick = onOpenSettings) { Icon(Icons.Default.TextFields, contentDescription = "Reader settings") }
        }
    }
}

@Composable
private fun ReaderBottomBar(
    state: ModernReaderUiState,
    onSeek: (Float) -> Unit,
    onOpenChapters: () -> Unit,
    onToggleTts: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Surface(color = cs.surface, tonalElevation = 4.dp) {
        Column(
            Modifier
                .fillMaxWidth()
                .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.md),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
        ) {
            Text(
                state.chapterTitle,
                style = MaterialTheme.typography.labelMedium,
                color = cs.onSurfaceVariant,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
            Slider(
                value = state.progress.coerceIn(0f, 1f),
                onValueChange = onSeek,
                colors = SliderDefaults.colors(
                    thumbColor = cs.primary,
                    activeTrackColor = cs.primary,
                    inactiveTrackColor = cs.onSurface.copy(alpha = 0.12f),
                ),
            )
            Row(verticalAlignment = Alignment.CenterVertically) {
                Text(
                    "Page ${state.pageIndex + 1} of ${state.pageCount}",
                    style = MaterialTheme.typography.labelSmall,
                    color = cs.onSurfaceVariant,
                )
                Spacer(Modifier.weight(1f))
                ChromeIcon(Icons.AutoMirrored.Filled.MenuBook, "Chapters", onOpenChapters)
                if (state.ttsAvailable) {
                    ChromeIcon(
                        if (state.ttsActive) Icons.Default.RecordVoiceOver else Icons.Default.VoiceOverOff,
                        "Read aloud",
                        onToggleTts,
                        accent = state.ttsActive,
                    )
                }
            }
        }
    }
}

@Composable
private fun ChromeIcon(
    icon: ImageVector,
    label: String,
    onClick: () -> Unit,
    accent: Boolean = false,
) {
    val cs = MaterialTheme.colorScheme
    val tint = if (accent) cs.primary else cs.onSurface
    IconButton(onClick = onClick, modifier = Modifier.clip(RoundedCornerShape(12.dp))) {
        Icon(icon, contentDescription = label, tint = tint)
    }
}
