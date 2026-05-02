// ModernLibraryScreen — Compose-style adaptive Library home for CleverFerret.
// Uses WindowSizeClass to switch between bottom-nav (compact) and a permanent
// NavigationRail (medium/expanded). Browse-by-format grid lets users drill
// into any single media type. The Continue row, Smart Shelves, and Sources
// list always render in the central pane.
//
// All colors are read from MaterialTheme.colorScheme + LocalCFTokens (metal
// brush). Replace the placeholder covers with AsyncImage once Coil + cover
// sources are wired up to the modern surface.

package com.universalmedialibrary.ui.modern.library

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Cast
import androidx.compose.material.icons.filled.ChevronRight
import androidx.compose.material.icons.filled.Download
import androidx.compose.material.icons.filled.Explore
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.LibraryBooks
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.*
import androidx.compose.material3.windowsizeclass.WindowWidthSizeClass
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFCover
import com.universalmedialibrary.ui.modern.domain.MediaItem
import com.universalmedialibrary.ui.modern.domain.MediaKind
import com.universalmedialibrary.ui.modern.domain.SampleData
import com.universalmedialibrary.ui.modern.domain.Source
import com.universalmedialibrary.ui.modern.domain.SourceStatus
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class LibraryNavDestination(
    val id: String,
    val label: String,
    val icon: androidx.compose.ui.graphics.vector.ImageVector,
)

private val NAV_DESTS = listOf(
    LibraryNavDestination("home",     "Home",     Icons.Default.Home),
    LibraryNavDestination("library",  "Library",  Icons.Default.LibraryBooks),
    LibraryNavDestination("discover", "Discover", Icons.Default.Explore),
    LibraryNavDestination("downloads","Downloads",Icons.Default.Download),
    LibraryNavDestination("settings", "Settings", Icons.Default.Settings),
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ModernLibraryScreen(
    widthClass: WindowWidthSizeClass,
    onOpenItem: (MediaItem) -> Unit,
    onBrowseFormat: (MediaKind) -> Unit,
) {
    val tokens = LocalCFTokens.current
    val cs = MaterialTheme.colorScheme
    val expanded = widthClass != WindowWidthSizeClass.Compact
    var selectedNav by remember { mutableStateOf("home") }

    Scaffold(
        bottomBar = {
            if (!expanded) {
                NavigationBar(containerColor = cs.surface) {
                    NAV_DESTS.take(4).forEach { d ->
                        NavigationBarItem(
                            selected = selectedNav == d.id,
                            onClick = { selectedNav = d.id },
                            icon = { Icon(d.icon, contentDescription = null) },
                            label = { Text(d.label) },
                        )
                    }
                }
            }
        },
        containerColor = cs.background,
    ) { padding ->
        Row(Modifier.fillMaxSize().padding(padding)) {
            if (expanded) {
                NavigationRail(
                    containerColor = cs.surface,
                    header = {
                        Spacer(Modifier.height(CFSpacing.lg))
                        Text(
                            "CF",
                            style = MaterialTheme.typography.headlineMedium.copy(
                                brush = tokens.metal.brush(),
                                fontWeight = FontWeight.Black,
                            ),
                        )
                        Spacer(Modifier.height(CFSpacing.lg))
                    },
                ) {
                    NAV_DESTS.forEach { d ->
                        NavigationRailItem(
                            selected = selectedNav == d.id,
                            onClick = { selectedNav = d.id },
                            icon = { Icon(d.icon, contentDescription = null) },
                            label = if (widthClass == WindowWidthSizeClass.Expanded) {
                                @Composable { Text(d.label) }
                            } else null,
                        )
                    }
                }
            }
            LibraryContent(
                widthClass = widthClass,
                onOpenItem = onOpenItem,
                onBrowseFormat = onBrowseFormat,
                modifier = Modifier.weight(1f),
            )
        }
    }
}

@Composable
private fun LibraryContent(
    widthClass: WindowWidthSizeClass,
    onOpenItem: (MediaItem) -> Unit,
    onBrowseFormat: (MediaKind) -> Unit,
    modifier: Modifier = Modifier,
) {
    val tokens = LocalCFTokens.current
    val pad = if (widthClass == WindowWidthSizeClass.Compact) CFSpacing.lg else CFSpacing.xl
    val gridCols = when (widthClass) {
        WindowWidthSizeClass.Compact  -> 4
        WindowWidthSizeClass.Medium   -> 6
        else                           -> 8
    }

    LazyColumn(
        modifier = modifier.fillMaxSize(),
        contentPadding = PaddingValues(
            bottom = if (widthClass == WindowWidthSizeClass.Compact) 96.dp else 24.dp
        ),
        verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
    ) {
        item {
            LibraryHeader(
                themeName = tokens.displayName,
                modifier = Modifier.padding(horizontal = pad, vertical = CFSpacing.md),
            )
        }

        item {
            // Browse-by-format quick grid
            Column(Modifier.padding(horizontal = pad)) {
                ShelfHeader("Browse", "Tap to drill into any format")
                Spacer(Modifier.height(CFSpacing.sm))
                LazyVerticalGrid(
                    columns = GridCells.Fixed(gridCols),
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                    verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                    modifier = Modifier.heightIn(max = 240.dp),
                    userScrollEnabled = false,
                ) {
                    items(MediaKind.entries.toList()) { kind ->
                        FormatTile(kind, SampleData.formatCounts[kind] ?: 0) {
                            onBrowseFormat(kind)
                        }
                    }
                }
            }
        }

        item {
            ShelfHeader(
                "Continue",
                "Pick up where you left off",
                modifier = Modifier.padding(horizontal = pad),
            )
            Spacer(Modifier.height(CFSpacing.sm))
            LazyRow(
                contentPadding = PaddingValues(horizontal = pad),
                horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
            ) {
                items(SampleData.continueReading) { item ->
                    ContinueCard(item, onClick = { onOpenItem(item) })
                }
            }
        }

        item {
            ShelfHeader(
                "Sources",
                "OPDS · Plex · Reddit · Local",
                modifier = Modifier.padding(horizontal = pad),
            )
            Column(Modifier.padding(horizontal = pad)) {
                SampleData.sources.forEach { SourceRow(it) }
            }
        }
    }
}

@Composable
private fun LibraryHeader(themeName: String, modifier: Modifier = Modifier) {
    val tokens = LocalCFTokens.current
    Row(modifier.fillMaxWidth(), verticalAlignment = Alignment.CenterVertically) {
        Column(Modifier.weight(1f)) {
            Text(
                "Library · $themeName",
                style = MaterialTheme.typography.labelMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
            )
            Text(
                "CleverFerret",
                style = MaterialTheme.typography.headlineLarge.copy(
                    brush = tokens.metal.brush(),
                    fontWeight = FontWeight.Black,
                ),
            )
        }
        IconButton(onClick = {}) { Icon(Icons.Default.Search, contentDescription = "Search") }
        IconButton(onClick = {}) { Icon(Icons.Default.Cast, contentDescription = "Cast") }
    }
}

@Composable
private fun ShelfHeader(title: String, subtitle: String? = null, modifier: Modifier = Modifier) {
    Column(modifier.fillMaxWidth()) {
        Text(title, style = MaterialTheme.typography.titleLarge)
        subtitle?.let {
            Text(
                it,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
            )
        }
    }
}

@Composable
private fun FormatTile(kind: MediaKind, count: Int, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Box(
        Modifier
            .height(64.dp)
            .clip(RoundedCornerShape(10.dp))
            .background(Brush.linearGradient(listOf(cs.surfaceVariant, cs.surface)))
            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(10.dp))
            .clickable(onClick = onClick)
            .padding(10.dp),
    ) {
        Column(Modifier.fillMaxSize(), verticalArrangement = Arrangement.SpaceBetween) {
            Text(
                kind.displayName(),
                style = MaterialTheme.typography.labelSmall,
                color = cs.onSurfaceVariant,
            )
            Text(
                count.formatCount(),
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Black,
            )
        }
    }
}

@Composable
private fun ContinueCard(item: MediaItem, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .width(268.dp)
            .clip(RoundedCornerShape(14.dp))
            .background(cs.surface)
            .clickable(onClick = onClick)
            .padding(CFSpacing.md),
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        CFCover(
            item,
            width = 88.dp,
            height = if (item.kind == MediaKind.Audiobook ||
                item.kind == MediaKind.Podcast
            ) 88.dp else 132.dp,
        )
        Column(Modifier.weight(1f), verticalArrangement = Arrangement.SpaceBetween) {
            Column {
                Text(
                    item.kind.displayName().uppercase(),
                    style = MaterialTheme.typography.labelSmall,
                    color = cs.primary,
                )
                Text(
                    item.title,
                    style = MaterialTheme.typography.titleSmall,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                )
                Text(
                    item.author,
                    style = MaterialTheme.typography.bodySmall,
                    color = cs.onSurfaceVariant,
                    maxLines = 1,
                )
            }
            Column {
                Text(
                    item.subtitle,
                    style = MaterialTheme.typography.labelSmall,
                    color = cs.onSurfaceVariant,
                )
                Spacer(Modifier.height(4.dp))
                LinearProgressIndicator(
                    progress = { item.progress },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(3.dp)
                        .clip(RoundedCornerShape(2.dp)),
                    color = cs.primary,
                    trackColor = cs.onSurface.copy(alpha = 0.12f),
                )
            }
        }
    }
}

@Composable
private fun SourceRow(source: Source) {
    val cs = MaterialTheme.colorScheme
    val dot = when (source.status) {
        SourceStatus.Online  -> Color(0xFF5BD68E)
        SourceStatus.Syncing -> cs.primary
        SourceStatus.Offline -> cs.onSurfaceVariant
    }
    Row(
        Modifier.fillMaxWidth().padding(vertical = CFSpacing.md),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(Modifier.size(8.dp).clip(CircleShape).background(dot))
        Column(Modifier.weight(1f)) {
            Text(source.label, style = MaterialTheme.typography.titleSmall)
            Text(
                source.description,
                style = MaterialTheme.typography.bodySmall,
                color = cs.onSurfaceVariant,
            )
        }
        Icon(Icons.Default.ChevronRight, contentDescription = null, tint = cs.onSurfaceVariant)
    }
}

// ─── Helpers ─────────────────────────────────────────────────────────────
private fun MediaKind.displayName(): String = when (this) {
    MediaKind.Book -> "Books"; MediaKind.Audiobook -> "Audiobooks"
    MediaKind.Podcast -> "Podcasts"; MediaKind.Comic -> "Comics"
    MediaKind.Movie -> "Movies"; MediaKind.Tv -> "TV"
    MediaKind.Music -> "Music"; MediaKind.Radio -> "Radio"
    MediaKind.WebFiction -> "Web Fiction"
}

private fun Int.formatCount(): String =
    if (this >= 1000) "%.1fk".format(this / 1000.0).removeSuffix(".0k") + "k" else toString()
