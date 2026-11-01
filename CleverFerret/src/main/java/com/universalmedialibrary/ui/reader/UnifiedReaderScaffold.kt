package com.universalmedialibrary.ui.reader

import android.app.Activity
import android.content.Context
import android.content.ContextWrapper
import android.view.KeyEvent
import android.view.Window
import androidx.appcompat.view.WindowCallbackWrapper
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.contentColorFor
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.produceState
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberUpdatedState
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import com.universalmedialibrary.data.local.entity.ReaderSettings as EntityReaderSettings
import com.universalmedialibrary.data.repository.ReaderSettingsRepository
import dagger.hilt.EntryPoint
import dagger.hilt.InstallIn
import dagger.hilt.android.EntryPointAccessors
import dagger.hilt.components.SingletonComponent

/**
 * Hilt EntryPoint for resolving ReaderSettingsRepository within reader composables.
 */
@EntryPoint
@InstallIn(SingletonComponent::class)
interface ReaderScaffoldEntryPoint {
    fun readerSettingsRepository(): ReaderSettingsRepository
}

/**
 * Pure dispatcher that inspects incoming hardware key events and maps Volume Up/Down
 * to page turns according to configuration and active modal dialog / search state.
 */
object ReaderKeyEventDispatcher {

    /**
     * Handles hardware key event. Returns true if the key event was consumed
     * (suppressing downstream handling and system volume overlays), or false if
     * it should be passed to the default window callback / operating system.
     */
    fun handleKeyEvent(
        event: KeyEvent,
        volumeKeysEnabled: Boolean,
        isModalOrSearchActive: Boolean,
        onNextPage: () -> Unit,
        onPreviousPage: () -> Unit
    ): Boolean {
        if (!volumeKeysEnabled || isModalOrSearchActive) {
            return false
        }

        return when (event.keyCode) {
            KeyEvent.KEYCODE_VOLUME_DOWN -> {
                if (event.action == KeyEvent.ACTION_DOWN) {
                    if (event.repeatCount == 0) {
                        onNextPage()
                    }
                    true
                } else if (event.action == KeyEvent.ACTION_UP) {
                    true
                } else {
                    false
                }
            }
            KeyEvent.KEYCODE_VOLUME_UP -> {
                if (event.action == KeyEvent.ACTION_DOWN) {
                    if (event.repeatCount == 0) {
                        onPreviousPage()
                    }
                    true
                } else if (event.action == KeyEvent.ACTION_UP) {
                    true
                } else {
                    false
                }
            }
            else -> false
        }
    }
}

/**
 * Custom WindowCallbackWrapper intercepting hardware key dispatch before child views.
 */
class VolumeKeyInterceptorWindowCallback(
    delegate: Window.Callback,
    private val onDispatchKeyEvent: (KeyEvent) -> Boolean
) : WindowCallbackWrapper(delegate) {

    override fun dispatchKeyEvent(event: KeyEvent): Boolean {
        if (onDispatchKeyEvent(event)) {
            return true
        }
        return super.dispatchKeyEvent(event)
    }
}

private tailrec fun Context.findActivity(): Activity? = when (this) {
    is Activity -> this
    is ContextWrapper -> baseContext.findActivity()
    else -> null
}

/**
 * Unified reader scaffold providing hardware volume key page navigation interception
 * at the Window level before child views consume events.
 */
@Suppress("LongParameterList", "LongMethod", "FunctionNaming")
@Composable
fun UnifiedReaderScaffold(
    modifier: Modifier = Modifier,
    mediaId: Long = 0L,
    volumeKeysEnabledOverride: Boolean? = null,
    isModalOrSearchActive: Boolean = false,
    onNextPage: () -> Unit = {},
    onPreviousPage: () -> Unit = {},
    readerSettingsRepository: ReaderSettingsRepository? = null,
    containerColor: Color = MaterialTheme.colorScheme.background,
    contentColor: Color = contentColorFor(containerColor),
    topBar: @Composable () -> Unit = {},
    bottomBar: @Composable () -> Unit = {},
    snackbarHost: @Composable () -> Unit = {},
    floatingActionButton: @Composable () -> Unit = {},
    content: @Composable (PaddingValues) -> Unit
) {
    val context = LocalContext.current
    val repository = readerSettingsRepository ?: remember(context) {
        runCatching {
            EntryPointAccessors.fromApplication(
                context.applicationContext,
                ReaderScaffoldEntryPoint::class.java
            ).readerSettingsRepository()
        }.getOrNull()
    }

    val observedSettings by produceState(
        initialValue = EntityReaderSettings.fromEntity(EntityReaderSettings.default()),
        key1 = repository,
        key2 = mediaId
    ) {
        if (repository != null) {
            repository.getReaderSettingsFlow(mediaId).collect { settings ->
                value = settings
            }
        }
    }

    val volumeKeysEnabled = volumeKeysEnabledOverride ?: observedSettings.volumeKeysToTurnPages

    val currentOnNextPage by rememberUpdatedState(onNextPage)
    val currentOnPreviousPage by rememberUpdatedState(onPreviousPage)
    val currentVolumeKeysEnabled by rememberUpdatedState(volumeKeysEnabled)
    val currentIsModalOrSearchActive by rememberUpdatedState(isModalOrSearchActive)

    val activity = remember(context) { context.findActivity() }
    val window = activity?.window

    DisposableEffect(window) {
        if (window == null) {
            onDispose {}
        } else {
            val originalCallback = window.callback
            if (originalCallback == null) {
                onDispose {}
            } else {
                val interceptorCallback = VolumeKeyInterceptorWindowCallback(originalCallback) { event ->
                    ReaderKeyEventDispatcher.handleKeyEvent(
                        event = event,
                        volumeKeysEnabled = currentVolumeKeysEnabled,
                        isModalOrSearchActive = currentIsModalOrSearchActive,
                        onNextPage = currentOnNextPage,
                        onPreviousPage = currentOnPreviousPage
                    )
                }
                window.callback = interceptorCallback

                onDispose {
                    if (window.callback === interceptorCallback) {
                        window.callback = originalCallback
                    }
                }
            }
        }
    }

    Scaffold(
        modifier = modifier,
        containerColor = containerColor,
        contentColor = contentColor,
        topBar = topBar,
        bottomBar = bottomBar,
        snackbarHost = snackbarHost,
        floatingActionButton = floatingActionButton,
        content = content
    )
}
