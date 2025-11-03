package com.universalmedialibrary.utils

import android.app.Activity
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.view.WindowManager
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

/**
 * Manages screen timeout behavior for reader screens.
 * 
 * Provides extended screen timeout functionality similar to ProseReader,
 * allowing users to keep the screen on for a specified duration while reading,
 * regardless of the system's default screen timeout setting.
 * 
 * Key features:
 * - Configurable timeout duration (in minutes)
 * - Automatic reset on user interaction
 * - Respects user preferences for enabling/disabling the feature
 * 
 * Inspired by ProseReader's screen timeout implementation.
 */
class ScreenTimeoutManager(private val activity: Activity) {
    private val handler = Handler(Looper.getMainLooper())
    private var timeoutMinutes = DEFAULT_TIMEOUT_MINUTES
    private var isEnabled = false
    
    private val _isScreenKeptOn = MutableStateFlow(false)
    val isScreenKeptOn: StateFlow<Boolean> = _isScreenKeptOn.asStateFlow()
    
    private val disableKeepScreenOnRunnable = Runnable {
        setKeepScreenOn(false)
    }
    
    /**
     * Enables or disables the screen keep-on flag.
     * When enabled with a timeout set, schedules automatic disable.
     * 
     * @param enabled Whether to keep the screen on
     */
    fun setKeepScreenOn(enabled: Boolean) {
        // Remove any pending disable messages
        handler.removeCallbacks(disableKeepScreenOnRunnable)
        
        if (enabled && isEnabled && timeoutMinutes > 0) {
            // Set the keep screen on flag
            activity.window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
            _isScreenKeptOn.value = true
            
            // Calculate delay: timeout in minutes converted to milliseconds
            val totalDelayMs = timeoutMinutes * 60 * 1000L
            
            // Schedule automatic disable after the specified timeout
            if (totalDelayMs > 0) {
                handler.postDelayed(disableKeepScreenOnRunnable, totalDelayMs)
            }
        } else {
            // Clear the keep screen on flag
            activity.window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
            _isScreenKeptOn.value = false
        }
    }
    
    /**
     * Called when user interacts with the screen.
     * Resets the timeout timer to keep the screen on for the full duration again.
     */
    fun onUserInteraction() {
        if (isEnabled && timeoutMinutes > 0) {
            // Reset the timer by calling setKeepScreenOn again
            setKeepScreenOn(true)
        }
    }
    
    /**
     * Sets the screen timeout duration in minutes.
     * 
     * @param minutes Timeout duration (0 to disable, 1-60 for custom timeout)
     */
    fun setTimeoutMinutes(minutes: Int) {
        timeoutMinutes = minutes.coerceIn(0, MAX_TIMEOUT_MINUTES)
        if (isEnabled && _isScreenKeptOn.value) {
            // Restart with new timeout
            setKeepScreenOn(true)
        }
    }
    
    /**
     * Enables or disables the extended screen timeout feature.
     * 
     * @param enabled Whether extended screen timeout should be active
     */
    fun setEnabled(enabled: Boolean) {
        isEnabled = enabled
        if (!enabled) {
            // Immediately disable keep screen on
            setKeepScreenOn(false)
        } else if (timeoutMinutes > 0) {
            // Enable with current timeout setting
            setKeepScreenOn(true)
        }
    }
    
    /**
     * Gets the current timeout setting in minutes.
     */
    fun getTimeoutMinutes(): Int = timeoutMinutes
    
    /**
     * Checks if extended screen timeout is enabled.
     */
    fun isFeatureEnabled(): Boolean = isEnabled
    
    /**
     * Cleans up resources when the manager is no longer needed.
     * Should be called in Activity's onDestroy or similar lifecycle method.
     */
    fun cleanup() {
        handler.removeCallbacks(disableKeepScreenOnRunnable)
        setKeepScreenOn(false)
    }
    
    companion object {
        const val DEFAULT_TIMEOUT_MINUTES = 5
        const val MAX_TIMEOUT_MINUTES = 60
        
        /**
         * Predefined timeout options for UI selection
         */
        val TIMEOUT_OPTIONS = listOf(
            0 to "System default",
            1 to "1 minute",
            2 to "2 minutes",
            5 to "5 minutes",
            10 to "10 minutes",
            15 to "15 minutes",
            30 to "30 minutes",
            60 to "60 minutes"
        )
    }
}
