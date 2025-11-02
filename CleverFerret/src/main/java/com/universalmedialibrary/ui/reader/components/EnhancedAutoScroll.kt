package com.universalmedialibrary.ui.reader.components

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.expandVertically
import androidx.compose.animation.shrinkVertically
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.delay
import kotlinx.coroutines.isActive

/**
 * Enhanced Auto-Scroll Controls
 * Provides smooth automatic scrolling with fine-grained speed control
 * Inspired by LibreraReader's musician mode
 */
@Composable
fun EnhancedAutoScrollControls(
    isScrolling: Boolean,
    scrollSpeed: Float,
    onScrollToggle: () -> Unit,
    onSpeedChange: (Float) -> Unit,
    modifier: Modifier = Modifier
) {
    var showSpeedControl by remember { mutableStateOf(false) }
    
    Card(
        modifier = modifier,
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Column(
            modifier = Modifier.padding(8.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Decrease speed
                IconButton(
                    onClick = { onSpeedChange((scrollSpeed - 0.1f).coerceAtLeast(0.1f)) },
                    enabled = scrollSpeed > 0.1f
                ) {
                    Icon(Icons.Default.Remove, "Decrease speed")
                }
                
                // Play/Pause
                FilledTonalButton(
                    onClick = onScrollToggle,
                    modifier = Modifier.width(120.dp)
                ) {
                    Icon(
                        if (isScrolling) Icons.Default.Pause else Icons.Default.PlayArrow,
                        contentDescription = if (isScrolling) "Pause" else "Start"
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Text(if (isScrolling) "Pause" else "Auto Scroll")
                }
                
                // Increase speed
                IconButton(
                    onClick = { onSpeedChange((scrollSpeed + 0.1f).coerceAtMost(5.0f)) },
                    enabled = scrollSpeed < 5.0f
                ) {
                    Icon(Icons.Default.Add, "Increase speed")
                }
                
                // Settings toggle
                IconButton(
                    onClick = { showSpeedControl = !showSpeedControl }
                ) {
                    Icon(Icons.Default.Settings, "Speed settings")
                }
            }
            
            AnimatedVisibility(
                visible = showSpeedControl,
                enter = expandVertically(),
                exit = shrinkVertically()
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(top = 8.dp)
                ) {
                    Text(
                        text = "Scroll Speed: ${String.format("%.1f", scrollSpeed)}x",
                        style = MaterialTheme.typography.bodyMedium,
                        modifier = Modifier.padding(bottom = 4.dp)
                    )
                    
                    Slider(
                        value = scrollSpeed,
                        onValueChange = onSpeedChange,
                        valueRange = 0.1f..5.0f,
                        steps = 48,
                        modifier = Modifier.fillMaxWidth()
                    )
                    
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text(
                            "0.1x (Very Slow)",
                            style = MaterialTheme.typography.bodySmall
                        )
                        Text(
                            "5.0x (Very Fast)",
                            style = MaterialTheme.typography.bodySmall
                        )
                    }
                    
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    // Preset speed buttons
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceEvenly
                    ) {
                        PresetSpeedButton("Slow", 0.5f, onSpeedChange)
                        PresetSpeedButton("Normal", 1.0f, onSpeedChange)
                        PresetSpeedButton("Fast", 2.0f, onSpeedChange)
                        PresetSpeedButton("Ultra", 3.0f, onSpeedChange)
                    }
                }
            }
        }
    }
}

@Composable
private fun PresetSpeedButton(
    label: String,
    speed: Float,
    onSpeedChange: (Float) -> Unit
) {
    OutlinedButton(
        onClick = { onSpeedChange(speed) },
        modifier = Modifier.height(32.dp),
        contentPadding = PaddingValues(horizontal = 8.dp)
    ) {
        Text(label, style = MaterialTheme.typography.bodySmall)
    }
}

/**
 * Auto-scroll state manager
 * Manages the scrolling behavior and speed
 */
class AutoScrollState {
    var isScrolling by mutableStateOf(false)
        private set
    
    var speed by mutableStateOf(1.0f)
    
    fun toggle() {
        isScrolling = !isScrolling
    }
    
    fun start() {
        isScrolling = true
    }
    
    fun stop() {
        isScrolling = false
    }
    
    fun updateSpeed(newSpeed: Float) {
        speed = newSpeed.coerceIn(0.1f, 5.0f)
    }
}

/**
 * Create and remember an auto-scroll state
 */
@Composable
fun rememberAutoScrollState(): AutoScrollState {
    return remember { AutoScrollState() }
}

/**
 * Effect to handle auto-scrolling
 * @param enabled Whether auto-scroll is currently active
 * @param speed Scroll speed multiplier
 * @param onScroll Callback to perform the scroll action (receives delta pixels)
 */
@Composable
fun AutoScrollEffect(
    enabled: Boolean,
    speed: Float,
    onScroll: (Float) -> Unit
) {
    LaunchedEffect(enabled, speed) {
        if (enabled) {
            while (isActive) {
                // Base scroll rate: 1 pixel per 16ms (60fps) at 1.0x speed
                val scrollDelta = speed
                onScroll(scrollDelta)
                delay(16) // ~60fps
            }
        }
    }
}
