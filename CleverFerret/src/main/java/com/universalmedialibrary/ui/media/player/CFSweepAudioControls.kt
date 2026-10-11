package com.universalmedialibrary.ui.media.player

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.universalmedialibrary.ui.media.theme.MediaSizes
import com.universalmedialibrary.ui.media.theme.MediaSpacing
import com.universalmedialibrary.ui.modern.theme.cfContrastInk

internal data class CFTransportActions(val previous: () -> Unit, val playPause: () -> Unit, val next: () -> Unit)
internal data class CFAudioExtras(val shuffle: () -> Unit, val repeat: () -> Unit, val speed: () -> Unit, val sleep: () -> Unit)

@Composable
internal fun CFSweepAudioControls(state: AudioPlayerState, transport: CFTransportActions, extras: CFAudioExtras) {
    val music = state.playerType == PlayerType.MUSIC
    Column(Modifier.fillMaxWidth().padding(horizontal = MediaSpacing.SM)) {
        Row(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.spacedBy(MediaSpacing.XS)) {
            ConsoleTransportButton(if (music) "Previous" else "Rewind 30s", transport.previous, Modifier.weight(1f))
            ConsoleTransportButton(if (state.isPlaying) "Pause" else "Play", transport.playPause, Modifier.weight(1f))
            ConsoleTransportButton(if (music) "Next" else "Forward 30s", transport.next, Modifier.weight(1f))
        }
        Row(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceEvenly) {
            TextButton(onClick = if (music) extras.shuffle else extras.speed,
                modifier = Modifier.heightIn(min = MediaSizes.TouchTarget)) {
                Text(if (music) "Shuffle: ${if (state.isShuffleEnabled) "on" else "off"}" else "Speed: ${state.playbackSpeed}x")
            }
            TextButton(onClick = if (music) extras.repeat else extras.sleep,
                modifier = Modifier.heightIn(min = MediaSizes.TouchTarget)) {
                Text(if (music) "Repeat: ${state.repeatMode.name.lowercase()}" else "Sleep timer")
            }
        }
    }
}

@Composable
private fun ConsoleTransportButton(label: String, onClick: () -> Unit, modifier: Modifier) {
    val cs = MaterialTheme.colorScheme
    Button(onClick = onClick, modifier = modifier.heightIn(min = MediaSizes.TouchTarget),
        colors = ButtonDefaults.buttonColors(contentColor = cfContrastInk(cs.primary))) { Text(label) }
}
