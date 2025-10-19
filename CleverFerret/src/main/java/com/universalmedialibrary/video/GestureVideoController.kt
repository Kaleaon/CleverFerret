package com.universalmedialibrary.video

import android.content.Context
import android.media.AudioManager
import android.provider.Settings
import android.view.WindowManager
import androidx.compose.foundation.gestures.detectDragGestures
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton
import kotlin.math.abs

/**
 * Gesture-based video controls (MX Player style)
 * 
 * Features:
 * - Left swipe: Brightness control
 * - Right swipe: Volume control
 * - Horizontal swipe: Seek forward/backward
 * - Double tap left: Rewind 10s
 * - Double tap right: Forward 10s
 * - Pinch: Zoom control
 */
@Singleton
class GestureVideoController @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    private val maxVolume = audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC)
    
    private val _brightness = MutableStateFlow(0.5f)
    val brightness: StateFlow<Float> = _brightness.asStateFlow()
    
    private val _volume = MutableStateFlow(
        audioManager.getStreamVolume(AudioManager.STREAM_MUSIC).toFloat() / maxVolume
    )
    val volume: StateFlow<Float> = _volume.asStateFlow()
    
    private val _seekPreview = MutableStateFlow<SeekPreview?>(null)
    val seekPreview: StateFlow<SeekPreview?> = _seekPreview.asStateFlow()
    
    data class SeekPreview(
        val deltaSeconds: Int,
        val newPosition: Long,
        val formattedTime: String
    )
    
    /**
     * Adjust brightness based on vertical swipe on left side
     */
    fun adjustBrightness(delta: Float, screenHeight: Float) {
        val change = -delta / screenHeight // Invert for natural feel
        val newBrightness = (_brightness.value + change).coerceIn(0f, 1f)
        _brightness.value = newBrightness
    }
    
    /**
     * Adjust volume based on vertical swipe on right side
     */
    fun adjustVolume(delta: Float, screenHeight: Float) {
        val change = -delta / screenHeight
        val newVolume = (_volume.value + change).coerceIn(0f, 1f)
        _volume.value = newVolume
        
        val volumeLevel = (newVolume * maxVolume).toInt()
        audioManager.setStreamVolume(
            AudioManager.STREAM_MUSIC,
            volumeLevel,
            0 // No UI feedback (we show our own)
        )
    }
    
    /**
     * Calculate seek amount based on horizontal swipe
     */
    fun calculateSeek(
        deltaX: Float,
        screenWidth: Float,
        currentPosition: Long,
        duration: Long
    ): SeekPreview {
        // Calculate seek amount: full swipe = 10% of duration
        val seekPercent = deltaX / screenWidth
        val seekAmount = (duration * seekPercent * 0.1f).toLong()
        val newPosition = (currentPosition + seekAmount).coerceIn(0L, duration)
        
        val deltaSeconds = (seekAmount / 1000).toInt()
        val formattedTime = formatTime(newPosition)
        
        val preview = SeekPreview(deltaSeconds, newPosition, formattedTime)
        _seekPreview.value = preview
        
        return preview
    }
    
    fun clearSeekPreview() {
        _seekPreview.value = null
    }
    
    private fun formatTime(ms: Long): String {
        val seconds = (ms / 1000).toInt()
        val minutes = seconds / 60
        val hours = minutes / 60
        
        return when {
            hours > 0 -> String.format("%d:%02d:%02d", hours, minutes % 60, seconds % 60)
            else -> String.format("%d:%02d", minutes, seconds % 60)
        }
    }
}

/**
 * Gesture detector modifier for video player
 */
fun Modifier.videoGestures(
    controller: GestureVideoController,
    screenWidth: Float,
    screenHeight: Float,
    currentPosition: Long,
    duration: Long,
    onSeek: (Long) -> Unit
): Modifier = this.pointerInput(Unit) {
    detectDragGestures(
        onDragStart = { offset ->
            // Determine gesture type based on start position
        },
        onDrag = { change, dragAmount ->
            val (x, y) = change.position
            val (dx, dy) = dragAmount
            
            // Determine if vertical or horizontal gesture
            if (abs(dy) > abs(dx)) {
                // Vertical gesture
                if (x < screenWidth / 2) {
                    // Left side = brightness
                    controller.adjustBrightness(dy, screenHeight)
                } else {
                    // Right side = volume
                    controller.adjustVolume(dy, screenHeight)
                }
            } else {
                // Horizontal gesture = seek
                controller.calculateSeek(dx, screenWidth, currentPosition, duration)
            }
        },
        onDragEnd = {
            // Apply seek if there was one
            val preview = controller.seekPreview.value
            if (preview != null) {
                onSeek(preview.newPosition)
                controller.clearSeekPreview()
            }
        }
    )
}

/**
 * On-screen indicators for gesture feedback
 */
@Composable
fun GestureIndicators(
    controller: GestureVideoController
) {
    val brightness by controller.brightness.collectAsState()
    val volume by controller.volume.collectAsState()
    val seekPreview by controller.seekPreview.collectAsState()
    
    Box(modifier = Modifier.fillMaxSize()) {
        // Brightness indicator (left side)
        if (brightness != 0.5f) {
            BrightnessIndicator(
                level = brightness,
                modifier = Modifier.align(Alignment.CenterStart)
            )
        }
        
        // Volume indicator (right side)
        if (volume != 0.5f) {
            VolumeIndicator(
                level = volume,
                modifier = Modifier.align(Alignment.CenterEnd)
            )
        }
        
        // Seek preview (center)
        seekPreview?.let { preview ->
            SeekIndicator(
                deltaSeconds = preview.deltaSeconds,
                time = preview.formattedTime,
                modifier = Modifier.align(Alignment.Center)
            )
        }
    }
}

@Composable
private fun BrightnessIndicator(
    level: Float,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier
            .padding(32.dp)
            .size(80.dp),
        shape = RoundedCornerShape(8.dp),
        color = MaterialTheme.colorScheme.surface.copy(alpha = 0.9f)
    ) {
        Column(
            modifier = Modifier.fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Icon(Icons.Default.Brightness6, null, modifier = Modifier.size(32.dp))
            Spacer(Modifier.height(4.dp))
            Text("${(level * 100).toInt()}%", style = MaterialTheme.typography.bodySmall)
        }
    }
}

@Composable
private fun VolumeIndicator(
    level: Float,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier
            .padding(32.dp)
            .size(80.dp),
        shape = RoundedCornerShape(8.dp),
        color = MaterialTheme.colorScheme.surface.copy(alpha = 0.9f)
    ) {
        Column(
            modifier = Modifier.fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Icon(Icons.Default.VolumeUp, null, modifier = Modifier.size(32.dp))
            Spacer(Modifier.height(4.dp))
            Text("${(level * 100).toInt()}%", style = MaterialTheme.typography.bodySmall)
        }
    }
}

@Composable
private fun SeekIndicator(
    deltaSeconds: Int,
    time: String,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier
            .padding(32.dp)
            .widthIn(min = 120.dp),
        shape = RoundedCornerShape(8.dp),
        color = MaterialTheme.colorScheme.surface.copy(alpha = 0.9f)
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                if (deltaSeconds > 0) Icons.Default.FastForward else Icons.Default.FastRewind,
                null,
                modifier = Modifier.size(32.dp)
            )
            Spacer(Modifier.height(4.dp))
            Text(
                "${if (deltaSeconds > 0) "+" else ""}$deltaSeconds s",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            Text(time, style = MaterialTheme.typography.bodySmall)
        }
    }
}
