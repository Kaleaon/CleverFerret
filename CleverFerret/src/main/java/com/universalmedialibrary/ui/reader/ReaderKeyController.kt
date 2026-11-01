package com.universalmedialibrary.ui.reader

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
 * Enumeration of reader key actions triggered by DPAD or hardware keyboard events.
 */
enum class ReaderKeyAction {
    NEXT_PAGE,
    PREVIOUS_PAGE,
    TOGGLE_UI,
    SHOW_MENU,
    NONE
}

/**
 * Pure dispatcher for mapping hardware key inputs to document reader actions.
 */
object ReaderKeyDispatcher {
    @Suppress("UnusedParameter")
    fun resolveAction(
        key: Key,
        isCtrlPressed: Boolean = false,
        isAltPressed: Boolean = false
    ): ReaderKeyAction {
        return when (key) {
            Key.DirectionRight, Key.PageDown, Key.DirectionDown -> ReaderKeyAction.NEXT_PAGE
            Key.DirectionLeft, Key.PageUp, Key.DirectionUp -> ReaderKeyAction.PREVIOUS_PAGE
            Key.DirectionCenter, Key.Enter, Key.Spacebar -> ReaderKeyAction.TOGGLE_UI
            Key.M, Key.Menu, Key.Escape -> ReaderKeyAction.SHOW_MENU
            else -> ReaderKeyAction.NONE
        }
    }

    fun handleKeyEvent(
        event: KeyEvent,
        onNextPage: () -> Boolean,
        onPreviousPage: () -> Boolean,
        onToggleUI: () -> Boolean,
        onShowMenu: (() -> Boolean)? = null
    ): Boolean {
        if (event.type != KeyEventType.KeyDown) return false

        val action = resolveAction(
            key = event.key,
            isCtrlPressed = event.isCtrlPressed,
            isAltPressed = event.isAltPressed
        )

        return when (action) {
            ReaderKeyAction.NEXT_PAGE -> onNextPage()
            ReaderKeyAction.PREVIOUS_PAGE -> onPreviousPage()
            ReaderKeyAction.TOGGLE_UI -> onToggleUI()
            ReaderKeyAction.SHOW_MENU -> onShowMenu?.invoke() ?: false
            ReaderKeyAction.NONE -> false
        }
    }
}

/**
 * Modifier that binds hardware keyboard and DPAD remote events to Document Reader navigation actions.
 */
fun Modifier.readerKeyController(
    enabled: Boolean = true,
    onNextPage: () -> Boolean = { false },
    onPreviousPage: () -> Boolean = { false },
    onToggleUI: () -> Boolean = { false },
    onShowMenu: (() -> Boolean)? = null
): Modifier {
    if (!enabled) return this

    return this
        .focusable()
        .onKeyEvent { event ->
            ReaderKeyDispatcher.handleKeyEvent(
                event = event,
                onNextPage = onNextPage,
                onPreviousPage = onPreviousPage,
                onToggleUI = onToggleUI,
                onShowMenu = onShowMenu
            )
        }
}
