// ModernSharingScreen — share a media item, library, or collaborative
// session via QR code, share-to system intent, or copy link. The actual
// QR bitmap is supplied by the caller as `qrSurface`.

package com.universalmedialibrary.ui.modern.sharing

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
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
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class ModernSharingUiState(
    val title: String,                  // "Share session" / "Share book"
    val subtitle: String,               // human description of the target
    val shortCode: String?,             // "F3-RV9K" join code, optional
    val shareUrl: String,
    val expiresLabel: String? = null,
)

@Composable
fun ModernSharingScreen(
    state: ModernSharingUiState,
    onBack: () -> Unit,
    onCopyLink: () -> Unit,
    onCopyCode: () -> Unit,
    onShareSystem: () -> Unit,
    qrSurface: @Composable BoxScope.() -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = { CFTopBar(title = state.title, onBack = onBack) },
        containerColor = cs.background,
    ) { padding ->
        Column(
            Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(CFSpacing.lg),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
            horizontalAlignment = Alignment.CenterHorizontally,
        ) {
            Text(
                state.subtitle,
                style = MaterialTheme.typography.bodyMedium,
                color = cs.onSurfaceVariant,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
            )

            Box(
                Modifier
                    .size(260.dp)
                    .clip(RoundedCornerShape(20.dp))
                    .background(cs.surface)
                    .border(1.dp, cs.outline.copy(alpha = 0.4f), RoundedCornerShape(20.dp))
                    .padding(CFSpacing.lg),
                contentAlignment = Alignment.Center,
            ) {
                qrSurface()
            }

            state.shortCode?.let { code ->
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    CFSectionHeader("Or use this code")
                    Spacer(Modifier.height(CFSpacing.xs))
                    Text(
                        code,
                        style = MaterialTheme.typography.displayMedium.copy(
                            brush = tokens.metal.brush(),
                            fontWeight = FontWeight.Black,
                        ),
                    )
                    TextButton(onClick = onCopyCode) {
                        Icon(Icons.Default.ContentCopy, contentDescription = null); Spacer(Modifier.width(4.dp)); Text("Copy code")
                    }
                }
            }

            state.expiresLabel?.let {
                Text(
                    "Expires $it",
                    style = MaterialTheme.typography.labelSmall,
                    color = cs.onSurfaceVariant,
                )
            }

            Spacer(Modifier.weight(1f))

            Row(horizontalArrangement = Arrangement.spacedBy(CFSpacing.md)) {
                OutlinedButton(onClick = onCopyLink) {
                    Icon(Icons.Default.Link, contentDescription = null); Spacer(Modifier.width(4.dp)); Text("Copy link")
                }
                CFMetalButton(text = "Share", onClick = onShareSystem, leadingIcon = Icons.Default.Share)
            }
        }
    }
}
