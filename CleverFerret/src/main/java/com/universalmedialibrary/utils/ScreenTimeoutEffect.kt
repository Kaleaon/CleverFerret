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
 */
@Composable
fun ReaderScreenTimeoutEffect(
    enabled: Boolean,
    timeoutMinutes: Int
) {
    val context = LocalContext.current
    val activity = context as? Activity
    
    DisposableEffect(enabled, timeoutMinutes) {
        if (activity != null) {
            val screenTimeoutManager = try {
                // Try to get ScreenTimeoutManager from MainActivity
                (activity as? com.universalmedialibrary.MainActivity)?.screenTimeoutManager
            } catch (e: Exception) {
                null
            }
            
            screenTimeoutManager?.let { manager ->
                manager.setEnabled(enabled)
                if (enabled) {
                    manager.setTimeoutMinutes(timeoutMinutes)
                    manager.setKeepScreenOn(true)
                }
            }
            
            onDispose {
                screenTimeoutManager?.setKeepScreenOn(false)
            }
        } else {
            onDispose { }
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
