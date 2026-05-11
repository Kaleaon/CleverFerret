// ModernNetworkExplorerScreen — discovered SMB / DLNA / mDNS hosts on
// the LAN. Each host shows protocol badge, IP, share count. Tap to open
// the share / mount dialog (caller-driven).

package com.universalmedialibrary.ui.modern.network

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
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

enum class NetworkHostKind { Smb, Dlna, Mdns, Ftp, Sftp, Webdav, Plex, Jellyfin, Calibre }

data class UiNetworkHost(
    val id: String,
    val name: String,
    val address: String,
    val kind: NetworkHostKind,
    val shareCount: Int = 0,
    val online: Boolean = true,
    val needsAuth: Boolean = false,
)

data class ModernNetworkExplorerUiState(
    val hosts: List<UiNetworkHost> = emptyList(),
    val isScanning: Boolean = false,
)

@Composable
fun ModernNetworkExplorerScreen(
    state: ModernNetworkExplorerUiState,
    onBack: () -> Unit,
    onRescan: () -> Unit,
    onAddManual: () -> Unit,
    onOpenHost: (UiNetworkHost) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val grouped = state.hosts.groupBy { it.kind }
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Network",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onAddManual) { Icon(Icons.Default.Add, contentDescription = "Add manually") }
                    IconButton(onClick = onRescan) {
                        if (state.isScanning) CircularProgressIndicator(strokeWidth = 2.dp, modifier = Modifier.size(18.dp))
                        else Icon(Icons.Default.Refresh, contentDescription = "Rescan")
                    }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        if (state.hosts.isEmpty()) {
            Box(Modifier.fillMaxSize().padding(padding)) {
                CFEmptyState(
                    icon = Icons.Default.Lan,
                    title = if (state.isScanning) "Scanning network..." else "No hosts found",
                    body = "Make sure you're connected to a Wi-Fi network with shared services.",
                    actionLabel = if (!state.isScanning) "Add manually" else null,
                    onAction = if (!state.isScanning) onAddManual else null,
                )
            }
            return@Scaffold
        }
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            grouped.forEach { (kind, hosts) ->
                item { CFSectionHeader(kind.label(), "${hosts.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
                items(hosts) { host -> HostRow(host, onClick = { onOpenHost(host) }) }
            }
        }
    }
}

@Composable
private fun HostRow(host: UiNetworkHost, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(12.dp))
            .clickable(onClick = onClick)
            .padding(CFSpacing.md),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(
            Modifier.size(8.dp).clip(CircleShape).background(if (host.online) androidx.compose.ui.graphics.Color(0xFF5BD68E) else cs.onSurfaceVariant),
        )
        Column(Modifier.weight(1f)) {
            Text(host.name, style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.Black, maxLines = 1, overflow = TextOverflow.Ellipsis)
            Text(
                "${host.kind.label()} · ${host.address} · ${host.shareCount} shares",
                style = MaterialTheme.typography.bodySmall,
                color = cs.onSurfaceVariant,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
        }
        if (host.needsAuth) {
            Icon(Icons.Default.Lock, contentDescription = "Auth required", tint = cs.onSurfaceVariant)
        }
        Icon(Icons.Default.ChevronRight, contentDescription = null, tint = cs.onSurfaceVariant)
    }
}

private fun NetworkHostKind.label(): String = when (this) {
    NetworkHostKind.Smb       -> "SMB"
    NetworkHostKind.Dlna      -> "DLNA"
    NetworkHostKind.Mdns      -> "Bonjour"
    NetworkHostKind.Ftp       -> "FTP"
    NetworkHostKind.Sftp      -> "SFTP"
    NetworkHostKind.Webdav    -> "WebDAV"
    NetworkHostKind.Plex      -> "Plex"
    NetworkHostKind.Jellyfin  -> "Jellyfin"
    NetworkHostKind.Calibre   -> "Calibre"
}
