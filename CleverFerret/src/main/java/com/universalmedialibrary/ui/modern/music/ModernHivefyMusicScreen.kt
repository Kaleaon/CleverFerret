// ModernHivefyMusicScreen — Hivefy-flavored music browser. Surfaces the
// Hivefy "social listening" mood + room concepts on top of the standard
// music library: hero "Mood" card, live rooms strip, and trending-among-
// friends shelf.

package com.universalmedialibrary.ui.modern.music

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
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
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class UiHivefyMood(val id: String, val label: String, val accent: Color)
data class UiHivefyRoom(val id: String, val title: String, val host: String, val listeners: Int, val accent: Color)
data class UiHivefyTrend(val id: String, val title: String, val artist: String, val plays: Int, val accent: Color)

data class ModernHivefyMusicUiState(
    val activeMood: UiHivefyMood?,
    val moods: List<UiHivefyMood>,
    val rooms: List<UiHivefyRoom>,
    val trends: List<UiHivefyTrend>,
)

@Composable
fun ModernHivefyMusicScreen(
    state: ModernHivefyMusicUiState,
    onBack: () -> Unit,
    onPickMood: (UiHivefyMood) -> Unit,
    onJoinRoom: (UiHivefyRoom) -> Unit,
    onPlayTrend: (UiHivefyTrend) -> Unit,
    onCreateRoom: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Hivefy",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onCreateRoom) { Icon(Icons.Default.AddCircle, contentDescription = "Start a room") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            item {
                Column(
                    Modifier
                        .fillMaxWidth()
                        .padding(horizontal = CFSpacing.lg)
                        .clip(RoundedCornerShape(18.dp))
                        .background(
                            Brush.linearGradient(listOf(state.activeMood?.accent ?: cs.surfaceVariant, cs.surface))
                        )
                        .border(1.dp, cs.outline.copy(alpha = 0.4f), RoundedCornerShape(18.dp))
                        .padding(CFSpacing.lg),
                ) {
                    Text("MOOD", style = MaterialTheme.typography.labelMedium, color = cs.onSurfaceVariant)
                    Text(
                        state.activeMood?.label ?: "Pick a mood",
                        style = MaterialTheme.typography.headlineMedium.copy(
                            brush = tokens.metal.brush(),
                            fontWeight = FontWeight.Black,
                        ),
                    )
                    Spacer(Modifier.height(CFSpacing.sm))
                    LazyRow(horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
                        items(state.moods) { mood ->
                            MoodChip(mood = mood, selected = mood.id == state.activeMood?.id, onClick = { onPickMood(mood) })
                        }
                    }
                }
            }

            if (state.rooms.isNotEmpty()) {
                item {
                    CFSectionHeader("Live rooms", "${state.rooms.size} active", actionLabel = "Start", onAction = onCreateRoom, modifier = Modifier.padding(horizontal = CFSpacing.lg))
                    Spacer(Modifier.height(CFSpacing.sm))
                    LazyRow(
                        contentPadding = PaddingValues(horizontal = CFSpacing.lg),
                        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                    ) {
                        items(state.rooms) { room -> RoomTile(room) { onJoinRoom(room) } }
                    }
                }
            }

            if (state.trends.isNotEmpty()) {
                item { CFSectionHeader("Trending with friends", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
                items(state.trends) { trend -> TrendRow(trend, onPlay = { onPlayTrend(trend) }) }
            }
        }
    }
}

@Composable
private fun MoodChip(mood: UiHivefyMood, selected: Boolean, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .clip(CircleShape)
            .background(if (selected) mood.accent else cs.surface)
            .border(1.dp, mood.accent, CircleShape)
            .clickable(onClick = onClick)
            .padding(horizontal = 12.dp, vertical = 6.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Box(Modifier.size(8.dp).clip(CircleShape).background(if (selected) Color.White else mood.accent))
        Spacer(Modifier.width(6.dp))
        Text(mood.label, style = MaterialTheme.typography.labelMedium, color = if (selected) Color.White else cs.onSurface, fontWeight = FontWeight.Black)
    }
}

@Composable
private fun RoomTile(room: UiHivefyRoom, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Column(
        Modifier
            .width(180.dp)
            .clip(RoundedCornerShape(14.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp))
            .clickable(onClick = onClick)
            .padding(CFSpacing.sm),
    ) {
        Box(
            Modifier
                .fillMaxWidth()
                .height(86.dp)
                .clip(RoundedCornerShape(10.dp))
                .background(Brush.linearGradient(listOf(room.accent, room.accent.copy(alpha = 0.4f)))),
            contentAlignment = Alignment.TopEnd,
        ) {
            Box(
                Modifier
                    .padding(6.dp)
                    .clip(RoundedCornerShape(50))
                    .background(tokens.metal.brush())
                    .padding(horizontal = 6.dp, vertical = 2.dp),
            ) {
                Text("LIVE · ${room.listeners}", style = MaterialTheme.typography.labelSmall, color = cs.onPrimary, fontWeight = FontWeight.Black)
            }
        }
        Spacer(Modifier.height(CFSpacing.xs))
        Text(room.title, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
        Text("Hosted by ${room.host}", style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1, overflow = TextOverflow.Ellipsis)
    }
}

@Composable
private fun TrendRow(trend: UiHivefyTrend, onPlay: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .clickable(onClick = onPlay)
            .padding(CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(
            Modifier
                .size(48.dp)
                .clip(RoundedCornerShape(8.dp))
                .background(Brush.linearGradient(listOf(trend.accent, trend.accent.copy(alpha = 0.4f)))),
        )
        Column(Modifier.weight(1f)) {
            Text(trend.title, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
            Text(trend.artist, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1)
        }
        Text("${trend.plays} plays", style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
        IconButton(onClick = onPlay) { Icon(Icons.Default.PlayCircle, contentDescription = "Play", tint = cs.primary) }
    }
}
