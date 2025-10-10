package com.universalmedialibrary.ui.reader

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.delay
import com.universalmedialibrary.data.local.entity.AutoScrollMode
import com.universalmedialibrary.data.local.entity.ReaderSettings

@Composable
fun AutoScrollController(
    isEnabled: Boolean,
    settings: ReaderSettings,
    onToggle: () -> Unit,
    onSpeedChange: (Float) -> Unit,
    modifier: Modifier = Modifier
) {
    if (isEnabled) {
        Card(
            modifier = modifier
                .fillMaxWidth()
                .padding(8.dp),
            elevation = CardDefaults.cardElevation(defaultElevation = 4.dp),
            colors = CardDefaults.cardColors(
                containerColor = MaterialTheme.colorScheme.primaryContainer
            )
        ) {
            Column(
                modifier = Modifier.padding(16.dp)
            ) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Auto-Scroll Active",
                        style = MaterialTheme.typography.titleMedium,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )

                    IconButton(onClick = onToggle) {
                        Icon(
                            imageVector = Icons.Default.Stop,
                            contentDescription = "Stop auto-scroll",
                            tint = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                }

                Spacer(modifier = Modifier.height(8.dp))

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = Icons.Default.Speed,
                        contentDescription = null
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Slider(
                        value = 50f, // TODO: Add autoScrollSpeed to ReaderSettings entity
                        onValueChange = onSpeedChange,
                        valueRange = 10f..100f,
                        modifier = Modifier.weight(1f)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = "50", // TODO: Add autoScrollSpeed to ReaderSettings entity
                        style = MaterialTheme.typography.bodySmall,
                        modifier = Modifier.width(30.dp)
                    )
                }

                Text(
                    text = "Mode: ${'$'}{settings.autoScrollMode.name}",
                    style = MaterialTheme.typography.bodySmall
                )
            }
        }
    }
}

@Composable
fun AutoScrollingText(
    text: String,
    isScrolling: Boolean,
    speed: Float,
    mode: AutoScrollMode,
    modifier: Modifier = Modifier,
    onScrollEnd: () -> Unit = {}
) {
    // Simplified generic auto-scroll that adapts to mode
    val effectiveSpeed = when (mode) {
        AutoScrollMode.OFF -> 0f
        AutoScrollMode.SLOW -> speed * 0.5f
        AutoScrollMode.MEDIUM -> speed
        AutoScrollMode.FAST -> speed * 1.5f
        AutoScrollMode.CUSTOM -> speed
    }.coerceAtLeast(0f)

    // We don't implement actual UI scrolling here to keep this self-contained.
    // In your readers, bind this timing to scrollState or lazy lists.
    LaunchedEffect(isScrolling, effectiveSpeed) {
        if (isScrolling && effectiveSpeed > 0f) {
            while (isScrolling) {
                // Tick based on speed (higher speed -> shorter delay)
                val delayMs = (1000f / effectiveSpeed).toLong().coerceIn(5L, 500L)
                delay(delayMs)
                // A real implementation would increment scroll position here
            }
        }
    }

    Text(
        text = text,
        modifier = modifier,
        style = MaterialTheme.typography.bodyLarge
    )
}
