// ModernHomeScreen — top-level dashboard / launchpad.
// Hero "Resume" card, quick-action tiles, recently-added carousel,
// and an "Across all formats" stat strip.

package com.universalmedialibrary.ui.modern.home

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
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
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.*
import com.universalmedialibrary.ui.modern.domain.MediaItem
import com.universalmedialibrary.ui.modern.domain.MediaKind
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class HomeQuickAction(
    val id: String,
    val label: String,
    val icon: ImageVector,
)

data class HomeStat(val label: String, val value: String)

data class ModernHomeUiState(
    val resume: MediaItem?,                                 // hero card; null = empty state
    val quickActions: List<HomeQuickAction> = DEFAULT_QUICK_ACTIONS,
    val continueRow: List<MediaItem> = emptyList(),
    val recentlyAdded: List<MediaItem> = emptyList(),
    val stats: List<HomeStat> = emptyList(),
)

private val DEFAULT_QUICK_ACTIONS = listOf(
    HomeQuickAction("scan",     "Scan",     Icons.Default.QrCodeScanner),
    HomeQuickAction("import",   "Import",   Icons.Default.FileDownload),
    HomeQuickAction("opds",     "OPDS",     Icons.Default.Public),
    HomeQuickAction("plex",     "Plex",     Icons.Default.Cast),
    HomeQuickAction("downloads","Offline",  Icons.Default.Download),
    HomeQuickAction("stats",    "Stats",    Icons.Default.QueryStats),
)

@Composable
fun ModernHomeScreen(
    state: ModernHomeUiState,
    onResume: (MediaItem) -> Unit,
    onOpenItem: (MediaItem) -> Unit,
    onQuickAction: (HomeQuickAction) -> Unit,
    onSearch: () -> Unit,
    onCast: () -> Unit,
    onSeeAllRecent: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = "CleverFerret",
                actions = {
                    IconButton(onClick = onSearch) { Icon(Icons.Default.Search, contentDescription = "Search") }
                    IconButton(onClick = onCast)  { Icon(Icons.Default.Cast, contentDescription = "Cast") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            modifier = Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = 96.dp),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            item {
                HomeHero(
                    item = state.resume,
                    onResume = onResume,
                    modifier = Modifier.padding(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                )
            }

            item {
                Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                    CFSectionHeader("Quick actions")
                    Spacer(Modifier.height(CFSpacing.sm))
                    LazyVerticalGrid(
                        columns = GridCells.Fixed(3),
                        horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                        verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                        modifier = Modifier.heightIn(max = 200.dp),
                        userScrollEnabled = false,
                    ) {
                        items(state.quickActions) { qa ->
                            QuickActionTile(qa, onClick = { onQuickAction(qa) })
                        }
                    }
                }
            }

            if (state.continueRow.isNotEmpty()) {
                item {
                    CFSectionHeader(
                        "Continue",
                        "Pick up where you left off",
                        modifier = Modifier.padding(horizontal = CFSpacing.lg),
                    )
                    Spacer(Modifier.height(CFSpacing.sm))
                    LazyRow(
                        contentPadding = PaddingValues(horizontal = CFSpacing.lg),
                        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                    ) {
                        items(state.continueRow) { item ->
                            HomeContinueCard(item, onClick = { onOpenItem(item) })
                        }
                    }
                }
            }

            if (state.recentlyAdded.isNotEmpty()) {
                item {
                    CFSectionHeader(
                        "Recently added",
                        actionLabel = "See all",
                        onAction = onSeeAllRecent,
                        modifier = Modifier.padding(horizontal = CFSpacing.lg),
                    )
                    Spacer(Modifier.height(CFSpacing.sm))
                    LazyRow(
                        contentPadding = PaddingValues(horizontal = CFSpacing.lg),
                        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                    ) {
                        items(state.recentlyAdded) { item ->
                            CFCover(item, width = 120.dp, height = 168.dp, modifier = Modifier.clickable { onOpenItem(item) })
                        }
                    }
                }
            }

            if (state.stats.isNotEmpty()) {
                item {
                    Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                        CFSectionHeader("Across all formats")
                        Spacer(Modifier.height(CFSpacing.sm))
                        Row(horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
                            state.stats.forEach { StatTile(it, Modifier.weight(1f)) }
                        }
                    }
                }
            }

            if (state.resume == null && state.continueRow.isEmpty() && state.recentlyAdded.isEmpty()) {
                item {
                    CFEmptyState(
                        icon = Icons.Default.LibraryBooks,
                        title = "Welcome to CleverFerret",
                        body = "Add a library, connect a server, or scan a barcode to get started.",
                        actionLabel = "Add library",
                        onAction = { onQuickAction(HomeQuickAction("import", "Import", Icons.Default.FileDownload)) },
                    )
                }
            }
        }
    }
}

@Composable
private fun HomeHero(
    item: MediaItem?,
    onResume: (MediaItem) -> Unit,
    modifier: Modifier = Modifier,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    if (item == null) return
    Row(
        modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(18.dp))
            .background(Brush.linearGradient(listOf(cs.surfaceVariant, cs.surface)))
            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(18.dp))
            .padding(CFSpacing.lg),
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.lg),
    ) {
        CFCover(item, width = 96.dp, height = 132.dp, showLabel = false)
        Column(Modifier.weight(1f), verticalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
            MetalChip(text = "RESUME")
            Text(
                item.title,
                style = MaterialTheme.typography.headlineMedium.copy(fontWeight = FontWeight.Black),
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
            )
            Text(
                item.author,
                style = MaterialTheme.typography.bodyMedium,
                color = cs.onSurfaceVariant,
            )
            Text(
                item.subtitle,
                style = MaterialTheme.typography.labelMedium,
                color = cs.onSurfaceVariant,
            )
            LinearProgressIndicator(
                progress = { item.progress },
                modifier = Modifier.fillMaxWidth().height(4.dp).clip(RoundedCornerShape(2.dp)),
                color = cs.primary,
                trackColor = cs.onSurface.copy(alpha = 0.12f),
            )
            CFMetalButton(text = "Resume", onClick = { onResume(item) }, leadingIcon = Icons.Default.PlayArrow)
        }
    }
}

@Composable
private fun QuickActionTile(action: HomeQuickAction, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Column(
        Modifier
            .height(80.dp)
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(12.dp))
            .clickable(onClick = onClick)
            .padding(CFSpacing.sm),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(CFSpacing.xs, Alignment.CenterVertically),
    ) {
        Icon(action.icon, contentDescription = null, tint = cs.primary)
        Text(action.label, style = MaterialTheme.typography.labelMedium)
    }
}

@Composable
private fun HomeContinueCard(item: MediaItem, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Column(
        Modifier
            .width(160.dp)
            .clip(RoundedCornerShape(14.dp))
            .background(cs.surface)
            .clickable(onClick = onClick)
            .padding(CFSpacing.md),
        verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
    ) {
        CFCover(item, width = 136.dp, height = 196.dp)
        Text(
            item.title,
            style = MaterialTheme.typography.titleSmall,
            maxLines = 2,
            overflow = TextOverflow.Ellipsis,
        )
        LinearProgressIndicator(
            progress = { item.progress },
            modifier = Modifier.fillMaxWidth().height(2.dp),
            color = cs.primary,
            trackColor = cs.onSurface.copy(alpha = 0.12f),
        )
    }
}

@Composable
private fun StatTile(stat: HomeStat, modifier: Modifier = Modifier) {
    val cs = MaterialTheme.colorScheme
    Column(
        modifier
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(12.dp))
            .padding(CFSpacing.md),
    ) {
        Text(
            stat.value,
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Black,
        )
        Text(
            stat.label,
            style = MaterialTheme.typography.labelSmall,
            color = cs.onSurfaceVariant,
        )
    }
}
