// ModernCollaborativeSessionScreen — synchronized listening / reading
// session with friends. Top: now-playing card with sync status. Body:
// participant list with avatars + activity, plus a join-via-QR / -code
// CTA when not in a session.

package com.universalmedialibrary.ui.modern.collaborative

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
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

enum class ParticipantState { Synced, Behind, Ahead, Buffering, Disconnected }

data class UiParticipant(
    val id: String,
    val displayName: String,
    val initials: String,
    val accent: Color,
    val isHost: Boolean,
    val isYou: Boolean,
    val state: ParticipantState,
    val drift: String? = null,         // "+3s" / "-1s"
)

data class ModernCollaborativeUiState(
    val sessionCode: String?,
    val nowPlayingTitle: String?,
    val nowPlayingSubtitle: String?,
    val nowPlayingAccent: Color = Color.DarkGray,
    val participants: List<UiParticipant> = emptyList(),
)

@Composable
fun ModernCollaborativeSessionScreen(
    state: ModernCollaborativeUiState,
    onBack: () -> Unit,
    onCreateSession: () -> Unit,
    onJoinByCode: () -> Unit,
    onScanQr: () -> Unit,
    onShareSession: () -> Unit,
    onLeaveSession: () -> Unit,
    onResync: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    val inSession = state.sessionCode != null

    Scaffold(
        topBar = {
            CFTopBar(
                title = "Listen together",
                onBack = onBack,
                actions = {
                    if (inSession) {
                        IconButton(onClick = onShareSession) { Icon(Icons.Default.Share, contentDescription = "Share") }
                        IconButton(onClick = onResync)       { Icon(Icons.Default.Sync, contentDescription = "Resync") }
                        IconButton(onClick = onLeaveSession) { Icon(Icons.Default.ExitToApp, contentDescription = "Leave") }
                    }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        if (!inSession) {
            Column(
                Modifier.fillMaxSize().padding(padding).padding(CFSpacing.xl),
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.spacedBy(CFSpacing.lg, Alignment.CenterVertically),
            ) {
                CFEmptyState(
                    icon = Icons.Default.Groups,
                    title = "Listen together",
                    body = "Sync playback with friends in real time across audiobooks, podcasts, and music.",
                )
                CFMetalButton(text = "Create a session", onClick = onCreateSession, leadingIcon = Icons.Default.Add)
                Row(horizontalArrangement = Arrangement.spacedBy(CFSpacing.md)) {
                    OutlinedButton(onClick = onJoinByCode) {
                        Icon(Icons.Default.Keyboard, contentDescription = null); Spacer(Modifier.width(6.dp)); Text("Join by code")
                    }
                    OutlinedButton(onClick = onScanQr) {
                        Icon(Icons.Default.QrCodeScanner, contentDescription = null); Spacer(Modifier.width(6.dp)); Text("Scan QR")
                    }
                }
            }
            return@Scaffold
        }

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
                        .clip(RoundedCornerShape(16.dp))
                        .background(cs.surface)
                        .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(16.dp))
                        .padding(CFSpacing.lg),
                ) {
                    Text("SESSION", style = MaterialTheme.typography.labelMedium, color = cs.onSurfaceVariant)
                    Text(
                        state.sessionCode ?: "—",
                        style = MaterialTheme.typography.headlineSmall.copy(
                            brush = tokens.metal.brush(),
                            fontWeight = FontWeight.Black,
                        ),
                    )
                    if (state.nowPlayingTitle != null) {
                        Spacer(Modifier.height(CFSpacing.sm))
                        Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(CFSpacing.md)) {
                            Box(
                                Modifier
                                    .size(48.dp)
                                    .clip(RoundedCornerShape(8.dp))
                                    .background(Brush.linearGradient(listOf(state.nowPlayingAccent, state.nowPlayingAccent.copy(alpha = 0.4f)))),
                            )
                            Column(Modifier.weight(1f)) {
                                Text(state.nowPlayingTitle, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
                                Text(state.nowPlayingSubtitle ?: "", style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1, overflow = TextOverflow.Ellipsis)
                            }
                        }
                    }
                }
            }

            item { CFSectionHeader("Participants", "${state.participants.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
            items(state.participants) { p -> ParticipantRow(p) }
        }
    }
}

@Composable
private fun ParticipantRow(p: UiParticipant) {
    val cs = MaterialTheme.colorScheme
    val (label, color) = when (p.state) {
        ParticipantState.Synced       -> "In sync"        to Color(0xFF5BD68E)
        ParticipantState.Behind       -> "Behind"          to Color(0xFFE0B040)
        ParticipantState.Ahead        -> "Ahead"           to Color(0xFFE0B040)
        ParticipantState.Buffering    -> "Buffering"       to cs.onSurfaceVariant
        ParticipantState.Disconnected -> "Disconnected"    to cs.error
    }
    Row(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(12.dp))
            .padding(CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(
            Modifier
                .size(40.dp)
                .clip(CircleShape)
                .background(Brush.linearGradient(listOf(p.accent, p.accent.copy(alpha = 0.5f)))),
            contentAlignment = Alignment.Center,
        ) {
            Text(p.initials, style = MaterialTheme.typography.titleSmall, color = Color.White, fontWeight = FontWeight.Black)
        }
        Column(Modifier.weight(1f)) {
            Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                Text(p.displayName, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
                if (p.isHost) Text("HOST", style = MaterialTheme.typography.labelSmall, color = cs.primary, fontWeight = FontWeight.Black)
                if (p.isYou)  Text("YOU",  style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
            }
            Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                Box(Modifier.size(6.dp).clip(CircleShape).background(color))
                Text(label, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant)
                p.drift?.let { Text("· $it", style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant) }
            }
        }
    }
}
