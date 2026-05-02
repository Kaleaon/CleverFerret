// ModernRadioScreen — unified radio browser covering FM, HD, internet
// stations, and old-time radio series. Tabs switch source; each shows
// a station list with genre tag, broadcast quality, and play CTA.

package com.universalmedialibrary.ui.modern.radio

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
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTagChip
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

enum class RadioTab(val label: String) {
    Internet("Internet"), FM("FM"), HD("HD"), OldTime("Old-time")
}

data class UiStation(
    val id: String,
    val name: String,
    val frequencyOrUrl: String,
    val genre: String,
    val quality: String,         // "320 kbps" / "FM" / "HD2"
    val live: Boolean,
    val favorite: Boolean,
    val hue: Color,
)

data class ModernRadioUiState(
    val tab: RadioTab = RadioTab.Internet,
    val stations: List<UiStation> = emptyList(),
    val genres: List<String> = emptyList(),
    val activeGenre: String? = null,
)

@Composable
fun ModernRadioScreen(
    state: ModernRadioUiState,
    onBack: () -> Unit,
    onChangeTab: (RadioTab) -> Unit,
    onSelectGenre: (String?) -> Unit,
    onPlay: (UiStation) -> Unit,
    onToggleFavorite: (UiStation) -> Unit,
    onSearch: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Radio",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onSearch) { Icon(Icons.Default.Search, contentDescription = "Search") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        Column(Modifier.fillMaxSize().padding(padding)) {
            TabRow(selectedTabIndex = state.tab.ordinal, containerColor = cs.background) {
                RadioTab.entries.forEach { t ->
                    Tab(selected = t == state.tab, onClick = { onChangeTab(t) }, text = { Text(t.label) })
                }
            }
            if (state.genres.isNotEmpty()) {
                LazyRow(
                    contentPadding = PaddingValues(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                ) {
                    item { Box(Modifier.clickable { onSelectGenre(null) }) { CFTagChip(text = "All", selected = state.activeGenre == null) } }
                    items(state.genres) { g ->
                        Box(Modifier.clickable { onSelectGenre(g) }) {
                            CFTagChip(text = g, selected = g == state.activeGenre)
                        }
                    }
                }
            }
            if (state.stations.isEmpty()) {
                Box(Modifier.fillMaxSize()) {
                    CFEmptyState(
                        icon = Icons.Default.Radio,
                        title = "No stations",
                        body = when (state.tab) {
                            RadioTab.FM      -> "Tune the dial or check device tuner support."
                            RadioTab.HD      -> "No HD subchannels detected on the current frequency."
                            RadioTab.Internet -> "Connect to the internet to browse stations."
                            RadioTab.OldTime -> "Add an OTRR archive or feed in Settings → Connections."
                        },
                    )
                }
            } else {
                LazyColumn(
                    contentPadding = PaddingValues(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                    verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
                ) {
                    items(state.stations) { st -> StationRow(st, onPlay = { onPlay(st) }, onToggleFavorite = { onToggleFavorite(st) }) }
                }
            }
        }
    }
}

@Composable
private fun StationRow(station: UiStation, onPlay: () -> Unit, onToggleFavorite: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Row(
        Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(12.dp))
            .clickable(onClick = onPlay)
            .padding(CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(
            Modifier
                .size(56.dp)
                .clip(RoundedCornerShape(8.dp))
                .background(Brush.linearGradient(listOf(station.hue, station.hue.copy(alpha = 0.4f)))),
            contentAlignment = Alignment.Center,
        ) {
            Icon(Icons.Default.Radio, contentDescription = null, tint = Color.White)
        }
        Column(Modifier.weight(1f)) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                if (station.live) {
                    Box(
                        Modifier
                            .padding(end = 6.dp)
                            .clip(RoundedCornerShape(50))
                            .background(tokens.metal.brush())
                            .padding(horizontal = 6.dp, vertical = 2.dp),
                    ) {
                        Text("LIVE", style = MaterialTheme.typography.labelSmall, color = cs.onPrimary, fontWeight = FontWeight.Black)
                    }
                }
                Text(station.name, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
            }
            Text(
                "${station.frequencyOrUrl} · ${station.genre} · ${station.quality}",
                style = MaterialTheme.typography.bodySmall,
                color = cs.onSurfaceVariant,
                maxLines = 1,
            )
        }
        IconButton(onClick = onToggleFavorite) {
            Icon(
                if (station.favorite) Icons.Default.Favorite else Icons.Default.FavoriteBorder,
                contentDescription = "Favorite",
                tint = if (station.favorite) cs.primary else cs.onSurfaceVariant,
            )
        }
        IconButton(onClick = onPlay) {
            Icon(Icons.Default.PlayCircle, contentDescription = "Play", tint = cs.primary)
        }
    }
}
