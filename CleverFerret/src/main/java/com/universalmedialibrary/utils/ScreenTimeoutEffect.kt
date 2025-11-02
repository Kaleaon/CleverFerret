package com.universalmedialibrary.utils

import android.app.Activity
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.platform.LocalContext
import kotlinx.coroutines.flow.Flow

/**
 * Composable effect that manages screen timeout based on reader settings.
 * 
 * This effect integrates with ScreenTimeoutManager to:
 * - Enable/disable screen timeout based on keepScreenOn setting
 * - Configure timeout duration
 * - Clean up when the composable is disposed
 * 
 * Usage in a reader screen:
 * ```
 * ReaderScreenTimeoutEffect(
 *     enabled = readerSettings.keepScreenOn,
 *     timeoutMinutes = readerSettings.screenTimeoutMinutes
 * )
 * ```
 * 
 * @param enabled Whether to keep the screen on
 * @param timeoutMinutes Duration in minutes before screen turns off (0 = system default)
 * @param screenTimeoutManager Optional ScreenTimeoutManager instance. If null, will attempt to get from MainActivity.
 */
@Composable
fun ReaderScreenTimeoutEffect(
    enabled: Boolean,
    timeoutMinutes: Int,
    screenTimeoutManager: ScreenTimeoutManager? = null
) {
    val context = LocalContext.current
    val activity = context as? Activity
    
    DisposableEffect(enabled, timeoutMinutes) {
        val manager = screenTimeoutManager ?: run {
            // Fallback: try to get from MainActivity if not provided
            if (activity != null) {
                try {
                    (activity as? com.universalmedialibrary.MainActivity)?.screenTimeoutManager
                } catch (e: Exception) {
                    null
                }
            } else {
                null
            }
        }
        
        manager?.let {
            it.setEnabled(enabled)
            if (enabled) {
                it.setTimeoutMinutes(timeoutMinutes)
                it.setKeepScreenOn(true)
            }
        }
        
        onDispose {
            manager?.setKeepScreenOn(false)
        }
    }
}

/**
 * Observes reader settings and applies screen timeout configuration.
 * 
 * This is a higher-level effect that observes a Flow of reader settings
 * and automatically updates screen timeout when settings change.
 * 
 * Usage:
 * ```
 * ObserveReaderSettings(
 *     settingsFlow = preferencesStore.globalPreferences
 * ) { settings ->
 *     // Settings changed
 * }
 * ```
 * 
 * @param settingsFlow Flow of settings to observe
 * @param onSettingsChange Callback invoked when settings change
 */
@Composable
fun <T> ObserveReaderSettings(
    settingsFlow: Flow<T>,
    onSettingsChange: (T) -> Unit
) {
    LaunchedEffect(settingsFlow) {
        settingsFlow.collect { settings ->
            onSettingsChange(settings)
        }
    }
}
