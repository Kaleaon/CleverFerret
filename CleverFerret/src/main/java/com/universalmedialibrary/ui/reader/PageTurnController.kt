package com.universalmedialibrary.ui.reader

import androidx.compose.foundation.gestures.detectHorizontalDragGestures
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalContext
import android.media.MediaPlayer
import android.os.VibrationEffect
import android.os.Vibrator
import android.os.Build
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import androidx.compose.runtime.rememberCoroutineScope

/**
 * Page Turn Controller
 * Handles page turning with animations, sounds, and haptic feedback
 * Inspired by Moonreader's page turning experience
 */

data class PageTurnState(
    val isTurning: Boolean = false,
    val turnProgress: Float = 0f, // 0.0 to 1.0
    val direction: PageTurnDirection = PageTurnDirection.NONE,
    val isDragging: Boolean = false
)

enum class PageTurnDirection {
    NONE,
    FORWARD,
    BACKWARD
}

@Composable
fun rememberPageTurnController(
    onPageTurn: (PageTurnDirection) -> Unit,
    animationSettings: AnimationSettings = AnimationSettings(),
    enableSound: Boolean = false,
    enableHaptic: Boolean = true
): PageTurnController {
    val context = LocalContext.current
    val scope = rememberCoroutineScope()
    val controller = remember {
        PageTurnController(
            context = context,
            onPageTurn = onPageTurn,
            animationSettings = animationSettings,
            enableSound = enableSound,
            enableHaptic = enableHaptic
        )
    }
    
    // Handle animation when turning starts
    LaunchedEffect(controller.state.value.isTurning) {
        if (controller.state.value.isTurning) {
            controller.animateTurn()
        }
    }
    
    DisposableEffect(controller) {
        onDispose {
            controller.cleanup()
        }
    }
    
    return controller
}

class PageTurnController(
    private val context: android.content.Context,
    private val onPageTurn: (PageTurnDirection) -> Unit,
    private val animationSettings: AnimationSettings,
    private val enableSound: Boolean,
    private val enableHaptic: Boolean
) {
    private var _state = mutableStateOf(PageTurnState())
    val state: State<PageTurnState> = _state
    
    private var mediaPlayer: MediaPlayer? = null
    private var vibrator: Vibrator? = null
    
    init {
        if (enableSound) {
            // Sound disabled - add custom sound file to res/raw if needed
            // Example: mediaPlayer = MediaPlayer.create(context, R.raw.page_turn)
            mediaPlayer = null
        }
        
        if (enableHaptic) {
            vibrator = context.getSystemService(android.content.Context.VIBRATOR_SERVICE) as? Vibrator
        }
    }
    
    fun startDrag(deltaX: Float) {
        if (_state.value.isTurning) return
        
        val direction = if (deltaX < 0) PageTurnDirection.FORWARD else PageTurnDirection.BACKWARD
        val progress = (kotlin.math.abs(deltaX) / 1000f).coerceIn(0f, 1f)
        
        _state.value = _state.value.copy(
            isDragging = true,
            direction = direction,
            turnProgress = progress
        )
    }
    
    fun updateDrag(deltaX: Float) {
        if (!_state.value.isDragging) return
        
        val direction = if (deltaX < 0) PageTurnDirection.FORWARD else PageTurnDirection.BACKWARD
        val progress = (kotlin.math.abs(deltaX) / 1000f).coerceIn(0f, 1f)
        
        _state.value = _state.value.copy(
            direction = direction,
            turnProgress = progress
        )
    }
    
    fun endDrag(scope: kotlinx.coroutines.CoroutineScope) {
        val currentState = _state.value
        if (!currentState.isDragging) return
        
        val threshold = animationSettings.swipeThreshold
        val shouldTurn = currentState.turnProgress >= threshold
        
        if (shouldTurn) {
            // Trigger page turn
            triggerPageTurn(currentState.direction)
        } else {
            // Cancel turn - animate back
            scope.launch {
                cancelTurn()
            }
        }
    }
    
    fun triggerPageTurn(direction: PageTurnDirection) {
        if (_state.value.isTurning) return
        
        // Play sound
        if (enableSound) {
            playPageTurnSound()
        }
        
        // Haptic feedback
        if (enableHaptic && animationSettings.enableHapticFeedback) {
            triggerHapticFeedback()
        }
        
        // Start animation
        _state.value = _state.value.copy(
            isTurning = true,
            isDragging = false,
            direction = direction,
            turnProgress = 0f
        )
        
        // Animation will be triggered by LaunchedEffect in rememberPageTurnController
    }
    
    suspend fun animateTurn() {
        val duration = animationSettings.duration
        val steps = 60 // 60 frames
        val stepDuration = duration / steps
        
        for (i in 0..steps) {
            val progress = i.toFloat() / steps
            _state.value = _state.value.copy(turnProgress = progress)
            delay(stepDuration.toLong())
        }
        
        // Complete turn
        onPageTurn(_state.value.direction)
        
        // Reset state
        _state.value = PageTurnState()
    }
    
    suspend fun cancelTurn() {
        // Animate back to start
        val duration = 200 // Quick cancel animation
        val steps = 30
        val stepDuration = duration / steps
        val startProgress = _state.value.turnProgress
        
        for (i in steps downTo 0) {
            val progress = startProgress * (i.toFloat() / steps)
            _state.value = _state.value.copy(turnProgress = progress)
            delay(stepDuration.toLong())
        }
        
        _state.value = PageTurnState()
    }
    
    private fun playPageTurnSound() {
        try {
            mediaPlayer?.let {
                if (it.isPlaying) {
                    it.stop()
                    it.prepare()
                }
                it.start()
            }
        } catch (e: Exception) {
            // Ignore sound errors
        }
    }
    
    private fun triggerHapticFeedback() {
        try {
            vibrator?.let {
                it.vibrate(VibrationEffect.createOneShot(50, VibrationEffect.DEFAULT_AMPLITUDE))
            }
        } catch (e: Exception) {
            // Ignore vibration errors
        }
    }
    
    fun cleanup() {
        mediaPlayer?.release()
        mediaPlayer = null
    }
}

/**
 * Composable modifier for page turning gestures
 */
@Composable
fun Modifier.pageTurnGestures(
    controller: PageTurnController
): Modifier {
    val scope = rememberCoroutineScope()
    return this.then(
        Modifier.pointerInput(Unit) {
            detectHorizontalDragGestures(
                onDragStart = { },
                onDragEnd = { controller.endDrag(scope) },
                onDragCancel = { scope.launch { controller.cancelTurn() } },
                onHorizontalDrag = { _, dragAmount ->
                    // Note: Simplified since change.previous doesn't exist in newer Compose API
                    controller.updateDrag(dragAmount)
                }
            )
        }
    )
}

/**
 * Composable that wraps content with page turning animation
 */
@Composable
fun PageTurnWrapper(
    currentPage: @Composable () -> Unit,
    nextPage: @Composable () -> Unit,
    previousPage: @Composable () -> Unit,
    controller: PageTurnController,
    animationSettings: AnimationSettings,
    modifier: Modifier = Modifier
) {
    val state = controller.state.value
    
    Box(
        modifier = modifier
            .fillMaxSize()
            .pageTurnGestures(controller)
    ) {
        when (state.direction) {
            PageTurnDirection.FORWARD -> {
                AnimatedPageTurn(
                    currentPage = currentPage,
                    nextPage = nextPage,
                    progress = state.turnProgress,
                    settings = animationSettings
                )
            }
            PageTurnDirection.BACKWARD -> {
                AnimatedPageTurn(
                    currentPage = currentPage,
                    nextPage = previousPage,
                    progress = state.turnProgress,
                    settings = animationSettings
                )
            }
            PageTurnDirection.NONE -> {
                currentPage()
            }
        }
    }
}
