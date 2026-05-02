// ModernMultiRoomAudioScreen — group rooms, sync playback across them.
// Top: now-playing summary with a "playing in N rooms" pill.
// Body: per-room cards with current group color, volume slider, and add /
// remove from current group.

package com.universalmedialibrary.ui.modern.audio

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
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
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

data class UiRoom(
    val id: String,
    val name: String,
    val deviceLabel: String,
    val volume: Float,           // 0..1
    val muted: Boolean,
    val accent: Color,
    val online: Boolean,
    val groupId: String?,        // null = ungrouped; "main" = playing the master group
)

data class ModernMultiRoomUiState(
    val nowPlayingTitle: String?,
    val nowPlayingSubtitle: String?,
    val nowPlayingAccent: Color = Color.DarkGray,
    val rooms: List<UiRoom> = emptyList(),
    val mainGroupId: String = "main",
)

@Composable
fun ModernMultiRoomAudioScreen(
    state: ModernMultiRoomUiState,
    onBack: () -> Unit,
    onScanRooms: () -> Unit,
    onToggleRoomGroup: (UiRoom) -> Unit,
    onRoomVolume: (UiRoom, Float) -> Unit,
    onRoomMute: (UiRoom) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val groupedCount = state.rooms.count { it.groupId == state.mainGroupId }
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Rooms",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onScanRooms) { Icon(Icons.Default.Refresh, contentDescription = "Scan") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        if (state.rooms.isEmpty()) {
            Box(Modifier.fillMaxSize().padding(padding)) {
                CFEmptyState(
                    icon = Icons.Default.SpeakerGroup,
                    title = "No rooms found",
                    body = "Connect a Cast / DLNA / Sonos receiver to your network to see it here.",
                    actionLabel = "Scan",
                    onAction = onScanRooms,
                )
            }
            return@Scaffold
        }

        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            if (state.nowPlayingTitle != null) {
                item {
                    Column(
                        Modifier
                            .fillMaxWidth()
                            .padding(horizontal = CFSpacing.lg)
                            .clip(RoundedCornerShape(16.dp))
                            .background(cs.surface)
                            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(16.dp))
                            .padding(CFSpacing.lg),
                    ) {
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Box(
                                Modifier
                                    .size(48.dp)
                                    .clip(RoundedCornerShape(8.dp))
                                    .background(Brush.linearGradient(listOf(state.nowPlayingAccent, state.nowPlayingAccent.copy(alpha = 0.4f)))),
                            )
                            Spacer(Modifier.width(CFSpacing.md))
                            Column(Modifier.weight(1f)) {
                                Text(state.nowPlayingTitle, style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.Black, maxLines = 1, overflow = TextOverflow.Ellipsis)
                                Text(state.nowPlayingSubtitle ?: "", style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1)
                            }
                            Box(
                                Modifier
                                    .clip(RoundedCornerShape(50))
                                    .background(cs.primary)
                                    .padding(horizontal = 10.dp, vertical = 4.dp),
                            ) {
                                Text(
                                    "$groupedCount room${if (groupedCount == 1) "" else "s"}",
                                    style = MaterialTheme.typography.labelSmall,
                                    color = cs.onPrimary,
                                    fontWeight = FontWeight.Black,
                                )
                            }
                        }
                    }
                }
            }
            item { CFSectionHeader("Rooms", "${state.rooms.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
            items(state.rooms) { room ->
                RoomCard(
                    room = room,
                    grouped = room.groupId == state.mainGroupId,
                    onToggleGroup = { onToggleRoomGroup(room) },
                    onVolume = { onRoomVolume(room, it) },
                    onMute = { onRoomMute(room) },
                )
            }
        }
    }
}

@Composable
private fun RoomCard(
    room: UiRoom,
    grouped: Boolean,
    onToggleGroup: () -> Unit,
    onVolume: (Float) -> Unit,
    onMute: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Column(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(14.dp))
            .background(if (grouped) cs.primaryContainer.copy(alpha = 0.4f) else cs.surface)
            .border(1.dp, if (grouped) cs.primary else cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp))
            .padding(CFSpacing.md),
    ) {
        Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(CFSpacing.md)) {
            Box(
                Modifier
                    .size(36.dp)
                    .clip(CircleShape)
                    .background(Brush.linearGradient(listOf(room.accent, room.accent.copy(alpha = 0.5f)))),
            )
            Column(Modifier.weight(1f)) {
                Text(room.name, style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.Black, maxLines = 1, overflow = TextOverflow.Ellipsis)
                Text(
                    if (room.online) room.deviceLabel else "${room.deviceLabel} · offline",
                    style = MaterialTheme.typography.bodySmall,
                    color = cs.onSurfaceVariant,
                    maxLines = 1,
                )
            }
            Switch(checked = grouped, onCheckedChange = { onToggleGroup() }, enabled = room.online)
        }
        Spacer(Modifier.height(CFSpacing.xs))
        Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
            IconButton(onClick = onMute) {
                Icon(if (room.muted) Icons.Default.VolumeOff else Icons.Default.VolumeUp, contentDescription = "Mute")
            }
            Slider(
                value = room.volume.coerceIn(0f, 1f),
                onValueChange = onVolume,
                modifier = Modifier.weight(1f),
                enabled = !room.muted && room.online,
            )
        }
    }
}
