// ModernCloudStorageScreen — connected cloud / network storage accounts.
// Each provider row shows quota, last-sync, status. Tap to manage; long
// actions (sync now, sign out) live behind icon buttons.

package com.universalmedialibrary.ui.modern.cloud

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
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
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

enum class CloudProviderKind { Drive, Dropbox, OneDrive, Box, Webdav, Smb, Nfs, S3 }

data class UiCloudAccount(
    val id: String,
    val provider: CloudProviderKind,
    val email: String,
    val usedBytes: Long,
    val quotaBytes: Long?,
    val lastSyncLabel: String,
    val online: Boolean,
)

data class CloudProviderOption(val kind: CloudProviderKind, val label: String, val icon: ImageVector)

object DefaultCloudProviders {
    val DEFAULT = listOf(
        CloudProviderOption(CloudProviderKind.Drive,    "Google Drive", Icons.Default.Cloud),
        CloudProviderOption(CloudProviderKind.Dropbox,  "Dropbox",      Icons.Default.Cloud),
        CloudProviderOption(CloudProviderKind.OneDrive, "OneDrive",     Icons.Default.Cloud),
        CloudProviderOption(CloudProviderKind.Box,      "Box",          Icons.Default.Cloud),
        CloudProviderOption(CloudProviderKind.Webdav,   "WebDAV",       Icons.Default.Public),
        CloudProviderOption(CloudProviderKind.Smb,      "SMB",          Icons.Default.Storage),
        CloudProviderOption(CloudProviderKind.Nfs,      "NFS",          Icons.Default.Storage),
        CloudProviderOption(CloudProviderKind.S3,       "S3",           Icons.Default.Cloud),
    )
}

data class ModernCloudStorageUiState(
    val accounts: List<UiCloudAccount> = emptyList(),
    val providers: List<CloudProviderOption> = DefaultCloudProviders.DEFAULT,
)

@Composable
fun ModernCloudStorageScreen(
    state: ModernCloudStorageUiState,
    onBack: () -> Unit,
    onAddAccount: (CloudProviderOption) -> Unit,
    onSyncAccount: (UiCloudAccount) -> Unit,
    onSignOut: (UiCloudAccount) -> Unit,
    onOpenAccount: (UiCloudAccount) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = { CFTopBar(title = "Cloud storage", onBack = onBack) },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            if (state.accounts.isEmpty()) {
                item {
                    CFEmptyState(
                        icon = Icons.Default.Cloud,
                        title = "No cloud accounts",
                        body = "Connect a provider below to back up your library or stream from elsewhere.",
                    )
                }
            } else {
                item { CFSectionHeader("Connected", "${state.accounts.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
                items(state.accounts) { acct ->
                    AccountRow(
                        account = acct,
                        onOpen     = { onOpenAccount(acct) },
                        onSync     = { onSyncAccount(acct) },
                        onSignOut  = { onSignOut(acct) },
                    )
                }
            }

            item {
                Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                    CFSectionHeader("Add provider")
                    Spacer(Modifier.height(CFSpacing.sm))
                    Column(
                        Modifier
                            .fillMaxWidth()
                            .clip(RoundedCornerShape(14.dp))
                            .background(cs.surface)
                            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp)),
                    ) {
                        state.providers.forEachIndexed { idx, provider ->
                            ProviderRow(provider, onClick = { onAddAccount(provider) })
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

@Composable
private fun AccountRow(
    account: UiCloudAccount,
    onOpen: () -> Unit,
    onSync: () -> Unit,
    onSignOut: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val pct = account.quotaBytes?.takeIf { it > 0 }?.let { (account.usedBytes.toFloat() / it).coerceIn(0f, 1f) }
    Column(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(14.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp))
            .clickable(onClick = onOpen)
            .padding(CFSpacing.md),
    ) {
        Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(CFSpacing.md)) {
            Icon(
                if (account.online) Icons.Default.CloudDone else Icons.Default.CloudOff,
                contentDescription = null,
                tint = if (account.online) cs.primary else cs.onSurfaceVariant,
                modifier = Modifier.size(32.dp),
            )
            Column(Modifier.weight(1f)) {
                Text(account.provider.name, style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.Black)
                Text(account.email, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1, overflow = TextOverflow.Ellipsis)
                Text(account.lastSyncLabel, style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
            }
            IconButton(onClick = onSync)    { Icon(Icons.Default.Refresh, contentDescription = "Sync", tint = cs.primary) }
            IconButton(onClick = onSignOut) { Icon(Icons.Default.Logout, contentDescription = "Sign out", tint = cs.onSurfaceVariant) }
        }
        if (pct != null) {
            Spacer(Modifier.height(CFSpacing.xs))
            LinearProgressIndicator(
                progress = { pct },
                modifier = Modifier.fillMaxWidth().height(3.dp).clip(RoundedCornerShape(2.dp)),
                color = if (pct > 0.9f) cs.error else cs.primary,
                trackColor = cs.onSurface.copy(alpha = 0.12f),
            )
        }
    }
}

@Composable
private fun ProviderRow(provider: CloudProviderOption, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.md),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(
            Modifier
                .size(40.dp)
                .clip(RoundedCornerShape(10.dp))
                .background(cs.surfaceVariant),
            contentAlignment = Alignment.Center,
        ) { Icon(provider.icon, contentDescription = null, tint = cs.primary) }
        Text(provider.label, style = MaterialTheme.typography.titleSmall, modifier = Modifier.weight(1f))
        Icon(Icons.Default.Add, contentDescription = "Connect", tint = cs.primary)
    }
}
