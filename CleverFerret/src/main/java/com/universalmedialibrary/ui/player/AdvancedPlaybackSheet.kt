package com.universalmedialibrary.ui.player

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.material3.rememberModalBottomSheetState
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.draw.scale
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.graphics.Shadow
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.foundation.horizontalScroll
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import coil.compose.AsyncImage
import com.universalmedialibrary.services.audio.AudioPlaybackManager.AudioQueueEntry
import com.universalmedialibrary.ui.player.WaveformSource
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import java.util.Locale
import kotlin.math.PI
import kotlin.math.absoluteValue
import kotlin.math.cos
import kotlin.math.sin
import kotlin.math.roundToInt

@OptIn(ExperimentalMaterial3Api::class)
@Composable
internal fun AdvancedPlaybackSheet(
    skipSilenceEnabled: Boolean,
    onSkipSilenceToggled: () -> Unit,
    crossfadeSeconds: Int,
    onCrossfadeDurationChanged: (Int) -> Unit,
    onCrossfadeToggle: () -> Unit,
    partyModeEnabled: Boolean,
    onPartyModeToggle: () -> Unit,
    onSleepTimerSelected: (Int) -> Unit,
    onSleepTimerClear: () -> Unit,
    lastSleepTimerMinutes: Int,
    onDismiss: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .navigationBarsPadding()
            .padding(24.dp),
        verticalArrangement = Arrangement.spacedBy(20.dp)
    ) {
        Text("Playback Enhancements", style = MaterialTheme.typography.titleMedium)

        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column {
                Text("Skip silence", style = MaterialTheme.typography.bodyLarge)
                Text("Trim quiet gaps automatically", style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
            }
            Switch(checked = skipSilenceEnabled, onCheckedChange = { onSkipSilenceToggled() })
        }

        Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    Text("Crossfade", style = MaterialTheme.typography.bodyLarge)
                    Text("Blend transitions between tracks", style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
                }
                Switch(checked = crossfadeSeconds > 0, onCheckedChange = { onCrossfadeToggle() })
            }
            Slider(
                value = crossfadeSeconds.toFloat(),
                onValueChange = { onCrossfadeDurationChanged(it.roundToInt()) },
                valueRange = 0f..12f,
                steps = 11,
                colors = SliderDefaults.colors(activeTrackColor = MaterialTheme.colorScheme.primary)
            )
            Text("${crossfadeSeconds}s", style = MaterialTheme.typography.labelMedium)
        }

        Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
            Text("Sleep timer", style = MaterialTheme.typography.bodyLarge)
            Row(
                modifier = Modifier
                    .horizontalScroll(rememberScrollState()),
                horizontalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                listOf(15, 30, 45, 60).forEach { minutes ->
                    FilterChip(
                        selected = lastSleepTimerMinutes == minutes,
                        onClick = { onSleepTimerSelected(minutes) },
                        label = { Text("${minutes}m") },
                        leadingIcon = if (lastSleepTimerMinutes == minutes) {
                            { Icon(Icons.Default.Check, contentDescription = "Confirm", modifier = Modifier.size(16.dp)) }
                        } else null
                    )
                }
                FilterChip(
                    selected = false,
                    onClick = onSleepTimerClear,
                    label = { Text("Clear") }
                )
            }
        }

        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column {
                Text("Party mode", style = MaterialTheme.typography.bodyLarge)
                Text("Animated backdrop for celebrations", style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
            }
            Switch(checked = partyModeEnabled, onCheckedChange = { onPartyModeToggle() })
        }

        Spacer(modifier = Modifier.height(8.dp))
        Button(
            onClick = onDismiss,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Done")
        }
    }
}
