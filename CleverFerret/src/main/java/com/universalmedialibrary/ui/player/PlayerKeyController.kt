package com.universalmedialibrary.ui.player

import androidx.compose.foundation.focusable
import androidx.compose.ui.Modifier
import androidx.compose.ui.input.key.Key
import androidx.compose.ui.input.key.KeyEvent
import androidx.compose.ui.input.key.KeyEventType
import androidx.compose.ui.input.key.isAltPressed
import androidx.compose.ui.input.key.isCtrlPressed
import androidx.compose.ui.input.key.key
import androidx.compose.ui.input.key.onKeyEvent
import androidx.compose.ui.input.key.type

/**
 * Enumeration of player key actions triggered by media buttons, DPAD, or hardware keyboard events.
 */
enum class PlayerKeyAction {
    TOGGLE_PLAY_PAUSE,
    PLAY,
    PAUSE,
    SEEK_BACKWARD,
    SEEK_FORWARD,
    TOGGLE_CONTROLS,
    NONE
}

/**
 * Pure dispatcher for mapping hardware key inputs to video player actions.
 */
object PlayerKeyDispatcher {
    @Suppress("UnusedParameter")
    fun resolveAction(
        key: Key,
        isCtrlPressed: Boolean = false,
        isAltPressed: Boolean = false
    ): PlayerKeyAction {
        return when (key) {
            Key.MediaPlayPause, Key.Spacebar, Key.DirectionCenter, Key.Enter -> PlayerKeyAction.TOGGLE_PLAY_PAUSE
            Key.MediaPlay -> PlayerKeyAction.PLAY
            Key.MediaPause -> PlayerKeyAction.PAUSE
            Key.DirectionLeft, Key.MediaRewind -> PlayerKeyAction.SEEK_BACKWARD
            Key.DirectionRight, Key.MediaFastForward -> PlayerKeyAction.SEEK_FORWARD
            Key.C, Key.Escape -> PlayerKeyAction.TOGGLE_CONTROLS
            else -> PlayerKeyAction.NONE
        }
    }

    @Suppress("LongParameterList")
    fun handleKeyEvent(
        event: KeyEvent,
        onTogglePlayPause: () -> Boolean,
        onPlay: () -> Boolean = onTogglePlayPause,
        onPause: () -> Boolean = onTogglePlayPause,
        onSeekBackward: () -> Boolean = { false },
        onSeekForward: () -> Boolean = { false },
        onToggleControls: () -> Boolean = { false }
    ): Boolean {
        if (event.type != KeyEventType.KeyDown) return false

        val action = resolveAction(
            key = event.key,
            isCtrlPressed = event.isCtrlPressed,
            isAltPressed = event.isAltPressed
        )

        return when (action) {
            PlayerKeyAction.TOGGLE_PLAY_PAUSE -> onTogglePlayPause()
            PlayerKeyAction.PLAY -> onPlay()
            PlayerKeyAction.PAUSE -> onPause()
            PlayerKeyAction.SEEK_BACKWARD -> onSeekBackward()
            PlayerKeyAction.SEEK_FORWARD -> onSeekForward()
            PlayerKeyAction.TOGGLE_CONTROLS -> onToggleControls()
            PlayerKeyAction.NONE -> false
        }
    }
}

/**
 * Modifier that binds hardware keyboard, media keys, and DPAD remote events to Video Player actions.
 */
@Suppress("LongParameterList")
fun Modifier.playerKeyController(
    enabled: Boolean = true,
    onTogglePlayPause: () -> Boolean = { false },
    onPlay: () -> Boolean = onTogglePlayPause,
    onPause: () -> Boolean = onTogglePlayPause,
    onSeekBackward: () -> Boolean = { false },
    onSeekForward: () -> Boolean = { false },
    onToggleControls: () -> Boolean = { false }
): Modifier {
    if (!enabled) return this

    return this
        .focusable()
        .onKeyEvent { event ->
            PlayerKeyDispatcher.handleKeyEvent(
                event = event,
                onTogglePlayPause = onTogglePlayPause,
                onPlay = onPlay,
                onPause = onPause,
                onSeekBackward = onSeekBackward,
                onSeekForward = onSeekForward,
                onToggleControls = onToggleControls
            )
        }
}
