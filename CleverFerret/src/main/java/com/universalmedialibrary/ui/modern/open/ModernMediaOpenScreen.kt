// ModernMediaOpenScreen — "Open with CleverFerret" / external-intent
// landing screen. Detects what was passed in (file URI, URL, share text)
// and offers the right action: open in reader / player, add to library,
// import as collection, etc.

package com.universalmedialibrary.ui.modern.open

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
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

enum class IncomingPayloadKind { File, Url, Text, OpdsFeed, Calibre, Plex, Unknown }

data class UiOpenAction(
    val id: String,
    val label: String,
    val description: String,
    val icon: ImageVector,
    val recommended: Boolean = false,
)

data class ModernMediaOpenUiState(
    val payloadKind: IncomingPayloadKind,
    val payloadDisplay: String,        // file name / URL / first line of text
    val payloadDetail: String? = null, // mime / domain / size
    val actions: List<UiOpenAction>,
)

@Composable
fun ModernMediaOpenScreen(
    state: ModernMediaOpenUiState,
    onBack: () -> Unit,
    onSelectAction: (UiOpenAction) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = { CFTopBar(title = "Open with CleverFerret", onBack = onBack) },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            item {
                Row(
                    Modifier
                        .fillMaxWidth()
                        .padding(horizontal = CFSpacing.lg)
                        .clip(RoundedCornerShape(16.dp))
                        .background(cs.surface)
                        .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(16.dp))
                        .padding(CFSpacing.lg),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                ) {
                    Box(
                        Modifier
                            .size(56.dp)
                            .clip(CircleShape)
                            .background(tokens.metal.brush()),
                        contentAlignment = Alignment.Center,
                    ) { Icon(state.payloadKind.icon(), contentDescription = null, tint = cs.onPrimary) }
                    Column(Modifier.weight(1f)) {
                        Text(state.payloadKind.label().uppercase(), style = MaterialTheme.typography.labelMedium, color = cs.primary, fontWeight = FontWeight.Black)
                        Text(state.payloadDisplay, style = MaterialTheme.typography.titleSmall, maxLines = 2, overflow = TextOverflow.Ellipsis)
                        state.payloadDetail?.let { Text(it, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1, overflow = TextOverflow.Ellipsis) }
                    }
                }
            }
            items(state.actions) { action -> ActionRow(action, onSelect = { onSelectAction(action) }) }
        }
    }
}

@Composable
private fun ActionRow(action: UiOpenAction, onSelect: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(14.dp))
            .background(if (action.recommended) cs.primaryContainer.copy(alpha = 0.4f) else cs.surface)
            .border(1.dp, if (action.recommended) cs.primary else cs.outline.copy(alpha = 0.25f), RoundedCornerShape(14.dp))
            .clickable(onClick = onSelect)
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
        ) { Icon(action.icon, contentDescription = null, tint = cs.primary) }
        Column(Modifier.weight(1f)) {
            Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                Text(action.label, style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.Black)
                if (action.recommended) Text("RECOMMENDED", style = MaterialTheme.typography.labelSmall, color = cs.primary, fontWeight = FontWeight.Black)
            }
            Text(action.description, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 2, overflow = TextOverflow.Ellipsis)
        }
        Icon(Icons.Default.ChevronRight, contentDescription = null, tint = cs.onSurfaceVariant)
    }
}

private fun IncomingPayloadKind.icon() = when (this) {
    IncomingPayloadKind.File     -> Icons.Default.InsertDriveFile
    IncomingPayloadKind.Url      -> Icons.Default.Link
    IncomingPayloadKind.Text     -> Icons.Default.TextSnippet
    IncomingPayloadKind.OpdsFeed -> Icons.Default.Public
    IncomingPayloadKind.Calibre  -> Icons.Default.LibraryBooks
    IncomingPayloadKind.Plex     -> Icons.Default.Cast
    IncomingPayloadKind.Unknown  -> Icons.Default.HelpOutline
}

private fun IncomingPayloadKind.label() = when (this) {
    IncomingPayloadKind.File     -> "File"
    IncomingPayloadKind.Url      -> "URL"
    IncomingPayloadKind.Text     -> "Text"
    IncomingPayloadKind.OpdsFeed -> "OPDS feed"
    IncomingPayloadKind.Calibre  -> "Calibre"
    IncomingPayloadKind.Plex     -> "Plex"
    IncomingPayloadKind.Unknown  -> "Unknown"
}
