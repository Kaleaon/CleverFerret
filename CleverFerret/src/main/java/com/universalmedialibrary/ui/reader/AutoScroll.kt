package com.universalmedialibrary.ui.reader

import androidx.compose.animation.core.*
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.delay
import kotlinx.coroutines.isActive
import kotlin.math.roundToInt

/**
 * Auto-Scroll Feature
 * - Configurable scroll speed (words per minute or pixels per second)
 * - Pause/Resume with tap
 * - Smart stopping at chapter ends
 * - Speed adjustment during scrolling
 * - Reading progress tracking
 */

data class AutoScrollSettings(
    val enabled: Boolean = false,
    val speedWordsPerMinute: Int = 250,      // 100-500 WPM
    val speedPixelsPerSecond: Float = 30f,   // Alternative measurement
    val pauseAtChapterEnd: Boolean = true,
    val pauseDurationSeconds: Int = 3,
    val smoothAcceleration: Boolean = true,
    val accelerationDuration: Int = 2,        // seconds
    val showSpeedIndicator: Boolean = true,
    val tapToPause: Boolean = true,
    val useWPM: Boolean = true                // true = WPM, false = pixels/second
)

enum class AutoScrollState {
    STOPPED,
    ACCELERATING,
    SCROLLING,
    PAUSED,
    CHAPTER_END_PAUSE,
    DECELERATING
}

class AutoScrollController {
    private var _state = mutableStateOf(AutoScrollState.STOPPED)
    val state: State<AutoScrollState> = _state

    private var _currentSpeed = mutableStateOf(0f)
    val currentSpeed: State<Float> = _currentSpeed

    private var _scrollProgress = mutableStateOf(0f)
    val scrollProgress: State<Float> = _scrollProgress

    private var targetSpeed = 0f

    fun start(settings: AutoScrollSettings) {
        if (_state.value == AutoScrollState.STOPPED || _state.value == AutoScrollState.PAUSED) {
            targetSpeed = if (settings.useWPM) {
                // Convert WPM to pixels per second (approximate: 5 chars per word, 2 pixels per char)
                (settings.speedWordsPerMinute * 5 * 2) / 60f
            } else {
                settings.speedPixelsPerSecond
            }

            if (settings.smoothAcceleration) {
                _state.value = AutoScrollState.ACCELERATING
            } else {
                _currentSpeed.value = targetSpeed
                _state.value = AutoScrollState.SCROLLING
            }
        }
    }

    fun pause() {
        if (_state.value == AutoScrollState.SCROLLING || _state.value == AutoScrollState.ACCELERATING) {
            _state.value = AutoScrollState.PAUSED
        }
    }

    fun resume(settings: AutoScrollSettings) {
        if (_state.value == AutoScrollState.PAUSED) {
            start(settings)
        }
    }

    fun stop() {
        _state.value = AutoScrollState.STOPPED
        _currentSpeed.value = 0f
        _scrollProgress.value = 0f
    }

    fun adjustSpeed(delta: Float) {
        targetSpeed = (targetSpeed + delta).coerceIn(10f, 200f)
        if (_state.value == AutoScrollState.SCROLLING) {
            _currentSpeed.value = targetSpeed
        }
    }

    fun setChapterEnd() {
        if (_state.value == AutoScrollState.SCROLLING) {
            _state.value = AutoScrollState.CHAPTER_END_PAUSE
        }
    }

    fun updateSpeed(deltaTime: Float, settings: AutoScrollSettings) {
        when (_state.value) {
            AutoScrollState.ACCELERATING -> {
                val acceleration = targetSpeed / (settings.accelerationDuration * 1000)
                _currentSpeed.value = (_currentSpeed.value + acceleration * deltaTime)
                    .coerceAtMost(targetSpeed)
                if (_currentSpeed.value >= targetSpeed) {
                    _state.value = AutoScrollState.SCROLLING
                }
            }
            AutoScrollState.DECELERATING -> {
                val deceleration = _currentSpeed.value / (settings.accelerationDuration * 1000)
                _currentSpeed.value = (_currentSpeed.value - deceleration * deltaTime)
                    .coerceAtLeast(0f)
                if (_currentSpeed.value <= 0f) {
                    _state.value = AutoScrollState.STOPPED
                }
            }
            else -> {}
        }
    }

    fun updateProgress(progress: Float) {
        _scrollProgress.value = progress
    }
}

@Composable
fun AutoScrollControl(
    settings: AutoScrollSettings,
    controller: AutoScrollController,
    onSettingsChange: (AutoScrollSettings) -> Unit,
    modifier: Modifier = Modifier
) {
    val state by controller.state
    val currentSpeed by controller.currentSpeed
    val scrollProgress by controller.scrollProgress

    Card(
        modifier = modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = if (state == AutoScrollState.SCROLLING || state == AutoScrollState.ACCELERATING) {
                MaterialTheme.colorScheme.primaryContainer
            } else {
                MaterialTheme.colorScheme.surface
            }
        ),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            // Header with status
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Icon(
                        imageVector = when (state) {
                            AutoScrollState.SCROLLING -> Icons.Default.PlayArrow
                            AutoScrollState.PAUSED -> Icons.Default.Pause
                            AutoScrollState.ACCELERATING -> Icons.Default.TrendingUp
                            AutoScrollState.CHAPTER_END_PAUSE -> Icons.Default.HourglassEmpty
                            else -> Icons.Default.Stop
                        },
                        contentDescription = null,
                        tint = MaterialTheme.colorScheme.primary
                    )
                    Text(
                        text = when (state) {
                            AutoScrollState.SCROLLING -> "Auto-Scrolling"
                            AutoScrollState.PAUSED -> "Paused"
                            AutoScrollState.ACCELERATING -> "Starting..."
                            AutoScrollState.CHAPTER_END_PAUSE -> "Chapter End"
                            else -> "Auto-Scroll"
                        },
                        style = MaterialTheme.typography.titleMedium
                    )
                }

                if (settings.showSpeedIndicator && state != AutoScrollState.STOPPED) {
                    Text(
                        text = if (settings.useWPM) {
                            "${((currentSpeed * 60) / 10).roundToInt()} WPM"
                        } else {
                            "${currentSpeed.roundToInt()} px/s"
                        },
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.primary
                    )
                }
            }

            // Progress indicator
            if (state != AutoScrollState.STOPPED) {
                LinearProgressIndicator(
                    progress = scrollProgress,
                    modifier = Modifier.fillMaxWidth()
                )
            }

            // Control buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                // Start/Resume button
                Button(
                    onClick = {
                        if (state == AutoScrollState.STOPPED) {
                            controller.start(settings)
                        } else if (state == AutoScrollState.PAUSED || state == AutoScrollState.CHAPTER_END_PAUSE) {
                            controller.resume(settings)
                        } else {
                            controller.pause()
                        }
                    },
                    modifier = Modifier.weight(1f),
                    colors = ButtonDefaults.buttonColors(
                        containerColor = if (state == AutoScrollState.SCROLLING || state == AutoScrollState.ACCELERATING) {
                            MaterialTheme.colorScheme.secondary
                        } else {
                            MaterialTheme.colorScheme.primary
                        }
                    )
                ) {
                    Icon(
                        imageVector = if (state == AutoScrollState.SCROLLING || state == AutoScrollState.ACCELERATING) {
                            Icons.Default.Pause
                        } else {
                            Icons.Default.PlayArrow
                        },
                        contentDescription = null,
                        modifier = Modifier.size(20.dp)
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Text(
                        if (state == AutoScrollState.STOPPED) "Start"
                        else if (state == AutoScrollState.PAUSED || state == AutoScrollState.CHAPTER_END_PAUSE) "Resume"
                        else "Pause"
                    )
                }

                // Stop button
                if (state != AutoScrollState.STOPPED) {
                    Button(
                        onClick = { controller.stop() },
                        modifier = Modifier.weight(0.5f),
                        colors = ButtonDefaults.buttonColors(
                            containerColor = MaterialTheme.colorScheme.error
                        )
                    ) {
                        Icon(
                            imageVector = Icons.Default.Stop,
                            contentDescription = "Stop",
                            modifier = Modifier.size(20.dp)
                        )
                    }
                }
            }

            // Speed controls
            if (state != AutoScrollState.STOPPED) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    IconButton(
                        onClick = { controller.adjustSpeed(-10f) }
                    ) {
                        Icon(Icons.Default.Remove, "Decrease Speed")
                    }

                    Slider(
                        value = currentSpeed,
                        onValueChange = { controller.adjustSpeed(it - currentSpeed) },
                        valueRange = 10f..200f,
                        modifier = Modifier.weight(1f)
                    )

                    IconButton(
                        onClick = { controller.adjustSpeed(10f) }
                    ) {
                        Icon(Icons.Default.Add, "Increase Speed")
                    }
                }
            }

            // Settings (collapsible)
            var showSettings by remember { mutableStateOf(false) }
            
            TextButton(
                onClick = { showSettings = !showSettings },
                modifier = Modifier.fillMaxWidth()
            ) {
                Text(if (showSettings) "Hide Settings" else "Show Settings")
                Icon(
                    imageVector = if (showSettings) Icons.Default.ExpandLess else Icons.Default.ExpandMore,
                    contentDescription = null
                )
            }

            if (showSettings) {
                AutoScrollSettings(
                    settings = settings,
                    onSettingsChange = onSettingsChange
                )
            }
        }
    }
}

@Composable
private fun AutoScrollSettings(
    settings: AutoScrollSettings,
    onSettingsChange: (AutoScrollSettings) -> Unit
) {
    Column(
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        HorizontalDivider()

        // Speed unit toggle
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text("Speed in WPM", style = MaterialTheme.typography.bodyMedium)
            Switch(
                checked = settings.useWPM,
                onCheckedChange = { onSettingsChange(settings.copy(useWPM = it)) }
            )
        }

        // Speed slider
        if (settings.useWPM) {
            Text(
                text = "Reading Speed: ${settings.speedWordsPerMinute} WPM",
                style = MaterialTheme.typography.bodyMedium
            )
            Slider(
                value = settings.speedWordsPerMinute.toFloat(),
                onValueChange = { onSettingsChange(settings.copy(speedWordsPerMinute = it.roundToInt())) },
                valueRange = 100f..500f,
                steps = 39
            )
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text("Slow (100)", style = MaterialTheme.typography.bodySmall)
                Text("Fast (500)", style = MaterialTheme.typography.bodySmall)
            }
        } else {
            Text(
                text = "Scroll Speed: ${settings.speedPixelsPerSecond.roundToInt()} px/s",
                style = MaterialTheme.typography.bodyMedium
            )
            Slider(
                value = settings.speedPixelsPerSecond,
                onValueChange = { onSettingsChange(settings.copy(speedPixelsPerSecond = it)) },
                valueRange = 10f..200f,
                steps = 189
            )
        }

        // Pause at chapter end
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text("Pause at Chapter End", style = MaterialTheme.typography.bodyMedium)
            Switch(
                checked = settings.pauseAtChapterEnd,
                onCheckedChange = { onSettingsChange(settings.copy(pauseAtChapterEnd = it)) }
            )
        }

        if (settings.pauseAtChapterEnd) {
            Text(
                text = "Pause Duration: ${settings.pauseDurationSeconds}s",
                style = MaterialTheme.typography.bodyMedium
            )
            Slider(
                value = settings.pauseDurationSeconds.toFloat(),
                onValueChange = { onSettingsChange(settings.copy(pauseDurationSeconds = it.roundToInt())) },
                valueRange = 1f..10f,
                steps = 8
            )
        }

        // Smooth acceleration
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text("Smooth Acceleration", style = MaterialTheme.typography.bodyMedium)
            Switch(
                checked = settings.smoothAcceleration,
                onCheckedChange = { onSettingsChange(settings.copy(smoothAcceleration = it)) }
            )
        }

        if (settings.smoothAcceleration) {
            Text(
                text = "Acceleration Time: ${settings.accelerationDuration}s",
                style = MaterialTheme.typography.bodyMedium
            )
            Slider(
                value = settings.accelerationDuration.toFloat(),
                onValueChange = { onSettingsChange(settings.copy(accelerationDuration = it.roundToInt())) },
                valueRange = 1f..5f,
                steps = 3
            )
        }

        // Tap to pause
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text("Tap to Pause", style = MaterialTheme.typography.bodyMedium)
            Switch(
                checked = settings.tapToPause,
                onCheckedChange = { onSettingsChange(settings.copy(tapToPause = it)) }
            )
        }

        // Show speed indicator
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text("Show Speed Indicator", style = MaterialTheme.typography.bodyMedium)
            Switch(
                checked = settings.showSpeedIndicator,
                onCheckedChange = { onSettingsChange(settings.copy(showSpeedIndicator = it)) }
            )
        }
    }
}

/**
 * Modifier to enable tap-to-pause on the reading content
 */
fun Modifier.autoScrollGestures(
    settings: AutoScrollSettings,
    controller: AutoScrollController
): Modifier = this.then(
    if (settings.tapToPause) {
        Modifier.pointerInput(Unit) {
            detectTapGestures {
                val state = controller.state.value
                if (state == AutoScrollState.SCROLLING || state == AutoScrollState.ACCELERATING) {
                    controller.pause()
                } else if (state == AutoScrollState.PAUSED || state == AutoScrollState.CHAPTER_END_PAUSE) {
                    controller.resume(settings)
                }
            }
        }
    } else {
        Modifier
    }
)

/**
 * Auto-scroll effect that updates scroll position
 */
@Composable
fun AutoScrollEffect(
    controller: AutoScrollController,
    settings: AutoScrollSettings,
    onScroll: (Float) -> Unit,
    onChapterEnd: () -> Unit = {}
) {
    val state by controller.state
    val currentSpeed by controller.currentSpeed

    LaunchedEffect(state, currentSpeed) {
        var lastFrameTime = System.currentTimeMillis()
        
        while (isActive && (state == AutoScrollState.SCROLLING || 
                           state == AutoScrollState.ACCELERATING ||
                           state == AutoScrollState.CHAPTER_END_PAUSE)) {
            val currentTime = System.currentTimeMillis()
            val deltaTime = (currentTime - lastFrameTime).toFloat()
            lastFrameTime = currentTime

            // Update speed (for acceleration/deceleration)
            controller.updateSpeed(deltaTime, settings)

            // Scroll by current speed
            if (state == AutoScrollState.SCROLLING) {
                val scrollAmount = currentSpeed * deltaTime / 1000f
                onScroll(scrollAmount)
            } else if (state == AutoScrollState.CHAPTER_END_PAUSE) {
                // Wait for pause duration, then continue or stop
                delay(settings.pauseDurationSeconds * 1000L)
                // Check if there's a next chapter
                onChapterEnd()
            }

            // Frame delay (approximately 60 FPS)
            delay(16)
        }
    }
}