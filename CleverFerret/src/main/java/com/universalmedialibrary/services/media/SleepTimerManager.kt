package com.universalmedialibrary.services.media

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.delay
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import java.util.Locale
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Sleep Timer Manager for media playback
 * 
 * Provides sleep timer functionality for audiobooks, podcasts, and music.
 * Features:
 * - Customizable duration
 * - Pause/resume capability
 * - Countdown display
 * - Fade-out option
 */
@Singleton
class SleepTimerManager @Inject constructor() {
    
    private var timerJob: Job? = null
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.Default)
    
    private val _state = MutableStateFlow(SleepTimerState())
    val state: StateFlow<SleepTimerState> = _state.asStateFlow()
    
    /**
     * Start sleep timer
     * @param durationMinutes Timer duration in minutes
     * @param fadeOut Whether to fade out audio before stopping
     * @param onComplete Callback when timer completes
     */
    fun startTimer(
        durationMinutes: Int,
        fadeOut: Boolean = true,
        onComplete: () -> Unit
    ) {
        stopTimer()
        
        val durationSeconds = durationMinutes * 60L
        _state.value = SleepTimerState(
            isActive = true,
            isPaused = false,
            totalSeconds = durationSeconds,
            remainingSeconds = durationSeconds,
            fadeOut = fadeOut
        )
        
        timerJob = scope.launch {
            var remaining = durationSeconds
            
            while (remaining > 0 && isActive) {
                if (!_state.value.isPaused) {
                    delay(1000)
                    remaining--
                    
                    _state.value = _state.value.copy(
                        remainingSeconds = remaining
                    )
                } else {
                    delay(100)
                }
            }
            
            if (remaining == 0L) {
                _state.value = _state.value.copy(
                    isActive = false,
                    remainingSeconds = 0
                )
                onComplete()
            }
        }
    }
    
    /**
     * Pause the timer
     */
    fun pauseTimer() {
        if (_state.value.isActive) {
            _state.value = _state.value.copy(isPaused = true)
        }
    }
    
    /**
     * Resume the timer
     */
    fun resumeTimer() {
        if (_state.value.isActive && _state.value.isPaused) {
            _state.value = _state.value.copy(isPaused = false)
        }
    }
    
    /**
     * Stop and cancel the timer
     */
    fun stopTimer() {
        timerJob?.cancel()
        timerJob = null
        _state.value = SleepTimerState()
    }
    
    /**
     * Add time to the current timer
     * @param additionalMinutes Minutes to add
     */
    fun addTime(additionalMinutes: Int) {
        if (_state.value.isActive) {
            val additionalSeconds = additionalMinutes * 60L
            _state.value = _state.value.copy(
                totalSeconds = _state.value.totalSeconds + additionalSeconds,
                remainingSeconds = _state.value.remainingSeconds + additionalSeconds
            )
        }
    }
    
    /**
     * Get formatted time remaining as MM:SS
     */
    fun getFormattedTimeRemaining(): String {
        val seconds = _state.value.remainingSeconds
        val minutes = seconds / 60
        val secs = seconds % 60
        return String.format(Locale.getDefault(), "%02d:%02d", minutes, secs)
    }
    
    /**
     * Check if timer should trigger fade out
     * Fade out starts in the last 10 seconds
     */
    fun shouldFadeOut(): Boolean {
        return _state.value.fadeOut && 
               _state.value.isActive && 
               _state.value.remainingSeconds <= 10
    }
    
    /**
     * Get fade out progress (0.0 to 1.0)
     * Returns 1.0 (full volume) to 0.0 (silent) over last 10 seconds
     */
    fun getFadeOutProgress(): Float {
        if (!shouldFadeOut()) return 1.0f
        return (_state.value.remainingSeconds / 10f).coerceIn(0f, 1f)
    }
}

/**
 * State of the sleep timer
 */
data class SleepTimerState(
    val isActive: Boolean = false,
    val isPaused: Boolean = false,
    val totalSeconds: Long = 0,
    val remainingSeconds: Long = 0,
    val fadeOut: Boolean = true
) {
    val progressPercentage: Float
        get() = if (totalSeconds > 0) {
            ((totalSeconds - remainingSeconds).toFloat() / totalSeconds) * 100f
        } else 0f
    
    val minutesRemaining: Int
        get() = (remainingSeconds / 60).toInt()
    
    val secondsRemaining: Int
        get() = (remainingSeconds % 60).toInt()
}
