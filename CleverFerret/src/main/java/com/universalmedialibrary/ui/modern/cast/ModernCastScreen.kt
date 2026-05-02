// ModernCastScreen — picker + remote-control sheet for Cast / DLNA /
// AirPlay-compatible receivers. Top: discovered devices. Body: when a
// device is selected, a remote-control panel for the active media.

package com.universalmedialibrary.ui.modern.cast

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
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

enum class CastDeviceKind { ChromeCast, AndroidTv, Speaker, Tv, AirPlay, Dlna }

data class UiCastDevice(
    val id: String,
    val name: String,
    val kind: CastDeviceKind,
    val groupSize: Int = 1,
    val isConnected: Boolean = false,
    val signalBars: Int = 4,        // 0..4
)

data class UiCastNowPlaying(
    val title: String,
    val subtitle: String,
    val volume: Float,                 // 0..1
    val muted: Boolean,
    val positionLabel: String,
    val durationLabel: String,
    val progress: Float,
    val isPlaying: Boolean,
)

data class ModernCastUiState(
    val devices: List<UiCastDevice> = emptyList(),
    val nowPlaying: UiCastNowPlaying? = null,
    val isScanning: Boolean = false,
)

@Composable
fun ModernCastScreen(
    state: ModernCastUiState,
    onBack: () -> Unit,
    onRescan: () -> Unit,
    onConnect: (UiCastDevice) -> Unit,
    onDisconnect: (UiCastDevice) -> Unit,
    onPlayPause: () -> Unit,
    onSeek: (Float) -> Unit,
    onVolumeChange: (Float) -> Unit,
    onMuteToggle: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Cast",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onRescan) {
                        if (state.isScanning) CircularProgressIndicator(strokeWidth = 2.dp, modifier = Modifier.size(18.dp))
                        else Icon(Icons.Default.Refresh, contentDescription = "Rescan")
                    }
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
            if (state.devices.isEmpty()) {
                item {
                    CFEmptyState(
                        icon = Icons.Default.Cast,
                        title = "No devices found",
                        body = if (state.isScanning) "Scanning your network..."
                               else "Make sure your receiver is on the same Wi-Fi.",
                        actionLabel = "Rescan",
                        onAction = onRescan,
                    )
                }
            } else {
                items(state.devices) { device ->
                    DeviceRow(
                        device = device,
                        onClick = { if (device.isConnected) onDisconnect(device) else onConnect(device) },
                    )
                }
            }
            state.nowPlaying?.let { np ->
                item {
                    NowPlayingPanel(
                        np = np,
                        onPlayPause = onPlayPause,
                        onSeek = onSeek,
                        onVolumeChange = onVolumeChange,
                        onMuteToggle = onMuteToggle,
                    )
                }
            }
        }
    }
}

@Composable
private fun DeviceRow(device: UiCastDevice, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Row(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(14.dp))
            .background(if (device.isConnected) cs.primaryContainer.copy(alpha = 0.4f) else cs.surface)
            .border(
                1.dp,
                if (device.isConnected) cs.primary else cs.outline.copy(alpha = 0.3f),
                RoundedCornerShape(14.dp),
            )
            .clickable(onClick = onClick)
            .padding(CFSpacing.md),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(
            Modifier
                .size(48.dp)
                .clip(CircleShape)
                .background(if (device.isConnected) tokens.metal.brush() else androidx.compose.ui.graphics.SolidColor(cs.surfaceVariant)),
            contentAlignment = Alignment.Center,
        ) {
            Icon(device.kind.icon(), contentDescription = null, tint = if (device.isConnected) cs.onPrimary else cs.onSurfaceVariant)
        }
        Column(Modifier.weight(1f)) {
            Text(device.name, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
            Text(
                buildString {
                    append(device.kind.label())
                    if (device.groupSize > 1) append(" · ${device.groupSize} speakers")
                    if (device.isConnected) append(" · Connected")
                },
                style = MaterialTheme.typography.bodySmall,
                color = cs.onSurfaceVariant,
                maxLines = 1,
            )
        }
        SignalDots(bars = device.signalBars)
    }
}

@Composable
private fun SignalDots(bars: Int) {
    val cs = MaterialTheme.colorScheme
    Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(2.dp)) {
        repeat(4) { i ->
            Box(
                Modifier
                    .size(width = 4.dp, height = (6 + i * 3).dp)
                    .clip(RoundedCornerShape(1.dp))
                    .background(if (i < bars) cs.primary else cs.onSurface.copy(alpha = 0.18f)),
            )
        }
    }
}

@Composable
private fun NowPlayingPanel(
    np: UiCastNowPlaying,
    onPlayPause: () -> Unit,
    onSeek: (Float) -> Unit,
    onVolumeChange: (Float) -> Unit,
    onMuteToggle: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
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
        Text(
            "Casting",
            style = MaterialTheme.typography.labelMedium.copy(
                brush = tokens.metal.brush(),
                fontWeight = FontWeight.Black,
            ),
        )
        Text(np.title, style = MaterialTheme.typography.titleLarge, maxLines = 1, overflow = TextOverflow.Ellipsis)
        Text(np.subtitle, style = MaterialTheme.typography.bodyMedium, color = cs.onSurfaceVariant, maxLines = 1)
        Slider(value = np.progress.coerceIn(0f, 1f), onValueChange = onSeek)
        Row {
            Text(np.positionLabel, style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
            Spacer(Modifier.weight(1f))
            Text(np.durationLabel, style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
        }
        Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
            FilledIconButton(onClick = onPlayPause, colors = IconButtonDefaults.filledIconButtonColors(containerColor = cs.primary)) {
                Icon(if (np.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow, contentDescription = null, tint = cs.onPrimary)
            }
            IconButton(onClick = onMuteToggle) {
                Icon(if (np.muted) Icons.Default.VolumeOff else Icons.Default.VolumeUp, contentDescription = "Mute")
            }
            Slider(
                value = np.volume.coerceIn(0f, 1f),
                onValueChange = onVolumeChange,
                modifier = Modifier.weight(1f),
            )
        }
    }
}

private fun CastDeviceKind.icon(): ImageVector = when (this) {
    CastDeviceKind.ChromeCast -> Icons.Default.Cast
    CastDeviceKind.AndroidTv  -> Icons.Default.Tv
    CastDeviceKind.Speaker    -> Icons.Default.Speaker
    CastDeviceKind.Tv         -> Icons.Default.Tv
    CastDeviceKind.AirPlay    -> Icons.Default.AirplayActive
    CastDeviceKind.Dlna       -> Icons.Default.DeviceHub
}

private fun CastDeviceKind.label(): String = when (this) {
    CastDeviceKind.ChromeCast -> "Chromecast"
    CastDeviceKind.AndroidTv  -> "Android TV"
    CastDeviceKind.Speaker    -> "Speaker"
    CastDeviceKind.Tv         -> "TV"
    CastDeviceKind.AirPlay    -> "AirPlay"
    CastDeviceKind.Dlna       -> "DLNA"
}
