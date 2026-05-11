// ModernServerIntegrationScreen — generic media-server pairing surface
// covering Plex, Jellyfin, Kavita, Komga, Audiobookshelf, etc.
// Top: connected servers list. Body: provider picker, plus a connection
// form (host, port, token) when adding.

package com.universalmedialibrary.ui.modern.integration

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
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFSettingsRow
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

enum class ServerKind { Plex, Jellyfin, Emby, Kavita, Komga, Audiobookshelf, NavidromeJellyfin }

data class UiServerConnection(
    val id: String,
    val kind: ServerKind,
    val name: String,
    val address: String,
    val online: Boolean,
    val itemCount: Int,
)

data class ServerProvider(val kind: ServerKind, val label: String, val description: String, val icon: ImageVector)

object DefaultServerProviders {
    val DEFAULT = listOf(
        ServerProvider(ServerKind.Plex,            "Plex",            "Movies, TV, music",           Icons.Default.Cast),
        ServerProvider(ServerKind.Jellyfin,        "Jellyfin",        "Open-source media server",    Icons.Default.Cast),
        ServerProvider(ServerKind.Emby,            "Emby",            "Closed-source media server",  Icons.Default.Cast),
        ServerProvider(ServerKind.Audiobookshelf,  "Audiobookshelf",  "Audiobooks + podcasts",       Icons.Default.Headphones),
        ServerProvider(ServerKind.Komga,           "Komga",           "Comics + manga",              Icons.Default.AutoStories),
        ServerProvider(ServerKind.Kavita,          "Kavita",          "Books + comics",              Icons.Default.MenuBook),
    )
}

data class ConnectFormState(
    val host: String = "",
    val port: String = "",
    val username: String = "",
    val password: String = "",
    val token: String = "",
    val visible: Boolean = false,
    val provider: ServerProvider? = null,
    val isConnecting: Boolean = false,
    val errorMessage: String? = null,
)

data class ModernServerIntegrationUiState(
    val connections: List<UiServerConnection> = emptyList(),
    val providers: List<ServerProvider> = DefaultServerProviders.DEFAULT,
    val form: ConnectFormState = ConnectFormState(),
)

@Composable
fun ModernServerIntegrationScreen(
    state: ModernServerIntegrationUiState,
    onBack: () -> Unit,
    onPickProvider: (ServerProvider) -> Unit,
    onCloseForm: () -> Unit,
    onChangeHost: (String) -> Unit,
    onChangePort: (String) -> Unit,
    onChangeUsername: (String) -> Unit,
    onChangePassword: (String) -> Unit,
    onChangeToken: (String) -> Unit,
    onConnect: () -> Unit,
    onDisconnect: (UiServerConnection) -> Unit,
    onOpenConnection: (UiServerConnection) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = { CFTopBar(title = "Media servers", onBack = onBack) },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            if (state.connections.isEmpty() && !state.form.visible) {
                item {
                    CFEmptyState(
                        icon = Icons.Default.Cast,
                        title = "No servers connected",
                        body = "Pair a media server below to stream and mirror metadata.",
                    )
                }
            } else if (state.connections.isNotEmpty()) {
                item { CFSectionHeader("Connected", "${state.connections.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
                items(state.connections) { conn -> ConnectionRow(conn, onOpen = { onOpenConnection(conn) }, onDisconnect = { onDisconnect(conn) }) }
            }

            if (state.form.visible) {
                item { ConnectForm(state.form, onClose = onCloseForm, onChangeHost = onChangeHost, onChangePort = onChangePort, onChangeUsername = onChangeUsername, onChangePassword = onChangePassword, onChangeToken = onChangeToken, onConnect = onConnect) }
            } else {
                item {
                    Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                        CFSectionHeader("Add server")
                        Spacer(Modifier.height(CFSpacing.sm))
                        Column(
                            Modifier
                                .fillMaxWidth()
                                .clip(RoundedCornerShape(14.dp))
                                .background(cs.surface)
                                .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp)),
                        ) {
                            state.providers.forEachIndexed { idx, p ->
                                CFSettingsRow(
                                    icon = p.icon,
                                    title = p.label,
                                    subtitle = p.description,
                                    onClick = { onPickProvider(p) },
                                )
                                if (idx != state.providers.lastIndex) {
                                    HorizontalDivider(color = cs.outline.copy(alpha = 0.2f), modifier = Modifier.padding(start = 64.dp))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun ConnectionRow(connection: UiServerConnection, onOpen: () -> Unit, onDisconnect: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(12.dp))
            .clickable(onClick = onOpen)
            .padding(CFSpacing.md),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(Modifier.size(10.dp).clip(CircleShape).background(if (connection.online) androidx.compose.ui.graphics.Color(0xFF5BD68E) else cs.onSurfaceVariant))
        Column(Modifier.weight(1f)) {
            Text(connection.name, style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.Black, maxLines = 1, overflow = TextOverflow.Ellipsis)
            Text(
                "${connection.kind.name} · ${connection.address} · ${connection.itemCount} items",
                style = MaterialTheme.typography.bodySmall,
                color = cs.onSurfaceVariant,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
        }
        IconButton(onClick = onDisconnect) {
            Icon(Icons.Default.LinkOff, contentDescription = "Disconnect", tint = cs.onSurfaceVariant)
        }
    }
}

@Composable
private fun ConnectForm(
    form: ConnectFormState,
    onClose: () -> Unit,
    onChangeHost: (String) -> Unit,
    onChangePort: (String) -> Unit,
    onChangeUsername: (String) -> Unit,
    onChangePassword: (String) -> Unit,
    onChangeToken: (String) -> Unit,
    onConnect: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Column(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(16.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(16.dp))
            .padding(CFSpacing.lg),
        verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
    ) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Text(
                form.provider?.label ?: "Connect server",
                style = MaterialTheme.typography.titleLarge,
                modifier = Modifier.weight(1f),
            )
            IconButton(onClick = onClose) { Icon(Icons.Default.Close, contentDescription = "Cancel") }
        }
        OutlinedTextField(value = form.host, onValueChange = onChangeHost, label = { Text("Host") }, singleLine = true, modifier = Modifier.fillMaxWidth())
        OutlinedTextField(value = form.port, onValueChange = onChangePort, label = { Text("Port") }, singleLine = true, modifier = Modifier.fillMaxWidth())
        OutlinedTextField(value = form.username, onValueChange = onChangeUsername, label = { Text("Username") }, singleLine = true, modifier = Modifier.fillMaxWidth())
        OutlinedTextField(value = form.password, onValueChange = onChangePassword, label = { Text("Password") }, singleLine = true, modifier = Modifier.fillMaxWidth())
        OutlinedTextField(value = form.token, onValueChange = onChangeToken, label = { Text("Or API token") }, singleLine = true, modifier = Modifier.fillMaxWidth())
        form.errorMessage?.let { Text(it, color = cs.error, style = MaterialTheme.typography.bodySmall) }
        Spacer(Modifier.height(CFSpacing.xs))
        CFMetalButton(
            text = if (form.isConnecting) "Connecting..." else "Connect",
            onClick = onConnect,
            leadingIcon = Icons.Default.Link,
            modifier = Modifier.align(Alignment.End),
        )
    }
}
