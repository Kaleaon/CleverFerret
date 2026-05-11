// ModernAmbientSoundscapeScreen — layer-based ambient sound mixer
// covering AmbientSoundScreen, LayeredSoundscapeScreen, SoundPacksScreen
// in one surface. Top: master play + volume + sleep timer.
// Body: a list of active layers with per-layer volume sliders + remove,
// plus a "Add layer" sound-pack picker carousel underneath.

package com.universalmedialibrary.ui.modern.ambient

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
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class UiSoundLayer(
    val id: String,
    val packId: String,
    val name: String,
    val accent: Color,
    val volume: Float,           // 0..1
    val muted: Boolean = false,
)

data class UiSoundPack(
    val id: String,
    val name: String,
    val sampleCount: Int,
    val accent: Color,
)

data class ModernAmbientSoundscapeUiState(
    val masterVolume: Float,
    val masterPlaying: Boolean,
    val sleepLabel: String? = null,    // "12 min" while running
    val layers: List<UiSoundLayer> = emptyList(),
    val packs: List<UiSoundPack> = emptyList(),
)

@Composable
fun ModernAmbientSoundscapeScreen(
    state: ModernAmbientSoundscapeUiState,
    onBack: () -> Unit,
    onMasterPlayPause: () -> Unit,
    onMasterVolumeChange: (Float) -> Unit,
    onSleep: () -> Unit,
    onAddPack: () -> Unit,
    onChangeLayerVolume: (UiSoundLayer, Float) -> Unit,
    onMuteLayer: (UiSoundLayer) -> Unit,
    onRemoveLayer: (UiSoundLayer) -> Unit,
    onPickPack: (UiSoundPack) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current

    Scaffold(
        topBar = {
            CFTopBar(
                title = "Soundscape",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onAddPack) { Icon(Icons.Default.LibraryMusic, contentDescription = "Sound packs") }
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
                        .clip(RoundedCornerShape(16.dp))
                        .background(cs.surface)
                        .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(16.dp))
                        .padding(CFSpacing.lg),
                ) {
                    Text("MASTER", style = MaterialTheme.typography.labelMedium, color = cs.onSurfaceVariant)
                    Text(
                        "${state.layers.count { !it.muted }} layers active",
                        style = MaterialTheme.typography.titleLarge.copy(
                            brush = tokens.metal.brush(),
                            fontWeight = FontWeight.Black,
                        ),
                    )
                    Spacer(Modifier.height(CFSpacing.sm))
                    Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
                        Box(
                            Modifier
                                .size(56.dp)
                                .clip(CircleShape)
                                .background(tokens.metal.brush())
                                .clickable(onClick = onMasterPlayPause),
                            contentAlignment = Alignment.Center,
                        ) {
                            Icon(
                                if (state.masterPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                                contentDescription = "Play/Pause",
                                tint = cs.onPrimary,
                            )
                        }
                        Slider(
                            value = state.masterVolume.coerceIn(0f, 1f),
                            onValueChange = onMasterVolumeChange,
                            modifier = Modifier.weight(1f),
                        )
                    }
                    TextButton(onClick = onSleep) {
                        Icon(
                            Icons.Default.Bedtime,
                            contentDescription = null,
                            tint = if (state.sleepLabel != null) cs.primary else cs.onSurface,
                        )
                        Spacer(Modifier.width(4.dp))
                        Text(state.sleepLabel ?: "Sleep timer")
                    }
                }
            }

            if (state.layers.isEmpty()) {
                item {
                    CFEmptyState(
                        icon = Icons.Default.GraphicEq,
                        title = "No layers yet",
                        body = "Tap a sound pack below to start mixing.",
                    )
                }
            } else {
                item { CFSectionHeader("Layers", "${state.layers.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
                items(state.layers) { layer ->
                    LayerRow(
                        layer = layer,
                        onChangeVolume = { onChangeLayerVolume(layer, it) },
                        onMute = { onMuteLayer(layer) },
                        onRemove = { onRemoveLayer(layer) },
                    )
                }
            }

            if (state.packs.isNotEmpty()) {
                item {
                    CFSectionHeader("Sound packs", actionLabel = "Browse", onAction = onAddPack, modifier = Modifier.padding(horizontal = CFSpacing.lg))
                    Spacer(Modifier.height(CFSpacing.sm))
                    LazyRow(
                        contentPadding = PaddingValues(horizontal = CFSpacing.lg),
                        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                    ) {
                        items(state.packs) { pack -> PackTile(pack, onClick = { onPickPack(pack) }) }
                    }
                }
            }
        }
    }
}

@Composable
private fun LayerRow(
    layer: UiSoundLayer,
    onChangeVolume: (Float) -> Unit,
    onMute: () -> Unit,
    onRemove: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(12.dp))
            .padding(CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
    ) {
        Box(
            Modifier
                .size(40.dp)
                .clip(CircleShape)
                .background(Brush.linearGradient(listOf(layer.accent, layer.accent.copy(alpha = 0.4f)))),
        )
        Column(Modifier.weight(1f)) {
            Text(layer.name, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
            Slider(
                value = layer.volume.coerceIn(0f, 1f),
                onValueChange = onChangeVolume,
                enabled = !layer.muted,
            )
        }
        IconButton(onClick = onMute) {
            Icon(
                if (layer.muted) Icons.Default.VolumeOff else Icons.Default.VolumeUp,
                contentDescription = "Mute",
                tint = if (layer.muted) cs.onSurfaceVariant else cs.primary,
            )
        }
        IconButton(onClick = onRemove) {
            Icon(Icons.Default.Close, contentDescription = "Remove", tint = cs.onSurfaceVariant)
        }
    }
}

@Composable
private fun PackTile(pack: UiSoundPack, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Column(Modifier.width(120.dp).clickable(onClick = onClick)) {
        Box(
            Modifier
                .fillMaxWidth()
                .height(80.dp)
                .clip(RoundedCornerShape(10.dp))
                .background(Brush.linearGradient(listOf(pack.accent, pack.accent.copy(alpha = 0.4f)))),
        )
        Spacer(Modifier.height(4.dp))
        Text(pack.name, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
        Text("${pack.sampleCount} samples", style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
    }
}
