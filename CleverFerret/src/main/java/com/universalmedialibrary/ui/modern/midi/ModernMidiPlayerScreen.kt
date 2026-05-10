// ModernMidiPlayerScreen — MIDI file playback with channel mixer.
// Top: track info + transport. Body: 16-channel mixer (mute, solo, volume,
// instrument), tempo + transpose controls.

package com.universalmedialibrary.ui.modern.midi

import androidx.compose.foundation.background
import androidx.compose.foundation.border
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
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class UiMidiChannel(
    val index: Int,
    val instrumentLabel: String,
    val volume: Float,           // 0..1
    val muted: Boolean,
    val soloed: Boolean,
    val noteCount: Int,
)

data class ModernMidiPlayerUiState(
    val title: String,
    val author: String,
    val tempoBpm: Int,
    val keyOffset: Int,         // -12..+12
    val positionLabel: String,
    val durationLabel: String,
    val progress: Float,
    val isPlaying: Boolean,
    val channels: List<UiMidiChannel>,
)

@Composable
fun ModernMidiPlayerScreen(
    state: ModernMidiPlayerUiState,
    onBack: () -> Unit,
    onPlayPause: () -> Unit,
    onSeek: (Float) -> Unit,
    onTempoChange: (Int) -> Unit,
    onKeyChange: (Int) -> Unit,
    onChannelMute: (UiMidiChannel) -> Unit,
    onChannelSolo: (UiMidiChannel) -> Unit,
    onChannelVolume: (UiMidiChannel, Float) -> Unit,
    onChangeInstrument: (UiMidiChannel) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = { CFTopBar(title = "MIDI", onBack = onBack) },
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
                    Text(
                        state.title,
                        style = MaterialTheme.typography.titleLarge.copy(
                            brush = tokens.metal.brush(),
                            fontWeight = FontWeight.Black,
                        ),
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis,
                    )
                    Text(state.author, style = MaterialTheme.typography.bodyMedium, color = cs.onSurfaceVariant)
                    Spacer(Modifier.height(CFSpacing.sm))
                    Slider(value = state.progress.coerceIn(0f, 1f), onValueChange = onSeek)
                    Row {
                        Text(state.positionLabel, style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
                        Spacer(Modifier.weight(1f))
                        Text(state.durationLabel, style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
                    }
                    Spacer(Modifier.height(CFSpacing.sm))
                    Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
                        Box(
                            Modifier.size(56.dp).clip(CircleShape).background(tokens.metal.brush()),
                            contentAlignment = Alignment.Center,
                        ) {
                            IconButton(onClick = onPlayPause) {
                                Icon(if (state.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow, contentDescription = null, tint = cs.onPrimary)
                            }
                        }
                        Stepper(label = "BPM", value = state.tempoBpm.toString(), onMinus = { onTempoChange((state.tempoBpm - 5).coerceAtLeast(1)) }, onPlus = { onTempoChange(state.tempoBpm + 5) })
                        Stepper(label = "Key", value = "${if (state.keyOffset >= 0) "+" else ""}${state.keyOffset}", onMinus = { onKeyChange((state.keyOffset - 1).coerceAtLeast(-12)) }, onPlus = { onKeyChange((state.keyOffset + 1).coerceAtMost(12)) })
                    }
                }
            }
            item { CFSectionHeader("Channels", "${state.channels.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
            items(state.channels) { ch ->
                ChannelRow(
                    channel = ch,
                    onMute = { onChannelMute(ch) },
                    onSolo = { onChannelSolo(ch) },
                    onVolume = { onChannelVolume(ch, it) },
                    onPickInstrument = { onChangeInstrument(ch) },
                )
            }
        }
    }
}

@Composable
private fun Stepper(label: String, value: String, onMinus: () -> Unit, onPlus: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .clip(RoundedCornerShape(50))
            .background(cs.surfaceVariant)
            .padding(horizontal = 4.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        IconButton(onClick = onMinus, modifier = Modifier.size(32.dp)) { Icon(Icons.Default.Remove, contentDescription = "Decrease $label", modifier = Modifier.size(16.dp)) }
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            Text(value, style = MaterialTheme.typography.labelLarge, fontWeight = FontWeight.Black)
            Text(label, style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
        }
        IconButton(onClick = onPlus, modifier = Modifier.size(32.dp)) { Icon(Icons.Default.Add, contentDescription = "Increase $label", modifier = Modifier.size(16.dp)) }
    }
}

@Composable
private fun ChannelRow(
    channel: UiMidiChannel,
    onMute: () -> Unit,
    onSolo: () -> Unit,
    onVolume: (Float) -> Unit,
    onPickInstrument: () -> Unit,
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
                .size(36.dp)
                .clip(CircleShape)
                .background(cs.primaryContainer.copy(alpha = 0.4f)),
            contentAlignment = Alignment.Center,
        ) {
            Text("%02d".format(channel.index + 1), style = MaterialTheme.typography.labelSmall, fontWeight = FontWeight.Black)
        }
        Column(Modifier.weight(1f)) {
            TextButton(onClick = onPickInstrument, contentPadding = PaddingValues(0.dp)) {
                Text(channel.instrumentLabel, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
            }
            Slider(
                value = channel.volume.coerceIn(0f, 1f),
                onValueChange = onVolume,
                enabled = !channel.muted,
            )
        }
        TextButton(onClick = onSolo) {
            Text("S", color = if (channel.soloed) cs.primary else cs.onSurfaceVariant, fontWeight = FontWeight.Black)
        }
        TextButton(onClick = onMute) {
            Text("M", color = if (channel.muted) cs.error else cs.onSurfaceVariant, fontWeight = FontWeight.Black)
        }
    }
}
