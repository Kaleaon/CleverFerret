package com.universalmedialibrary.ui.reader

import android.app.Activity
import android.view.KeyEvent
import android.view.Window
import androidx.test.core.app.ActivityScenario
import com.universalmedialibrary.data.local.dao.CustomFontDao
import com.universalmedialibrary.data.local.dao.ReaderSettingsDao
import com.universalmedialibrary.data.local.entity.ReaderSettings as EntityReaderSettings
import com.universalmedialibrary.data.local.entity.ReaderSettingsEntity
import com.universalmedialibrary.data.repository.ReaderSettingsRepository
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.Mockito.mock
import org.mockito.Mockito.never
import org.mockito.Mockito.verify
import org.mockito.Mockito.`when`
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = android.app.Application::class, manifest = Config.NONE, sdk = [28])
class UnifiedReaderScaffoldTest {

    @Test
    fun volumeDown_whenEnabled_routesToNextPageAndConsumes() {
        var nextPageCalls = 0
        var prevPageCalls = 0

        val downEvent = KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_VOLUME_DOWN)
        val consumed = ReaderKeyEventDispatcher.handleKeyEvent(
            event = downEvent,
            volumeKeysEnabled = true,
            isModalOrSearchActive = false,
            onNextPage = { nextPageCalls++ },
            onPreviousPage = { prevPageCalls++ }
        )

        assertTrue(consumed)
        assertEquals(1, nextPageCalls)
        assertEquals(0, prevPageCalls)

        // Key up should also be consumed to suppress volume HUD, without second invocation
        val upEvent = KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_VOLUME_DOWN)
        val upConsumed = ReaderKeyEventDispatcher.handleKeyEvent(
            event = upEvent,
            volumeKeysEnabled = true,
            isModalOrSearchActive = false,
            onNextPage = { nextPageCalls++ },
            onPreviousPage = { prevPageCalls++ }
        )

        assertTrue(upConsumed)
        assertEquals(1, nextPageCalls)
        assertEquals(0, prevPageCalls)
    }

    @Test
    fun volumeUp_whenEnabled_routesToPreviousPageAndConsumes() {
        var nextPageCalls = 0
        var prevPageCalls = 0

        val downEvent = KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_VOLUME_UP)
        val consumed = ReaderKeyEventDispatcher.handleKeyEvent(
            event = downEvent,
            volumeKeysEnabled = true,
            isModalOrSearchActive = false,
            onNextPage = { nextPageCalls++ },
            onPreviousPage = { prevPageCalls++ }
        )

        assertTrue(consumed)
        assertEquals(0, nextPageCalls)
        assertEquals(1, prevPageCalls)

        val upEvent = KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_VOLUME_UP)
        val upConsumed = ReaderKeyEventDispatcher.handleKeyEvent(
            event = upEvent,
            volumeKeysEnabled = true,
            isModalOrSearchActive = false,
            onNextPage = { nextPageCalls++ },
            onPreviousPage = { prevPageCalls++ }
        )

        assertTrue(upConsumed)
        assertEquals(0, nextPageCalls)
        assertEquals(1, prevPageCalls)
    }

    @Test
    fun volumeDown_repeatedKeyPress_doesNotFireMultipleTimes() {
        var nextPageCalls = 0

        // Simulated repeat event (repeatCount = 1)
        val repeatEvent = KeyEvent(0L, 0L, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_VOLUME_DOWN, 1)
        val consumed = ReaderKeyEventDispatcher.handleKeyEvent(
            event = repeatEvent,
            volumeKeysEnabled = true,
            isModalOrSearchActive = false,
            onNextPage = { nextPageCalls++ },
            onPreviousPage = {}
        )

        assertTrue(consumed)
        assertEquals(0, nextPageCalls)
    }

    @Test
    fun volumeKeys_whenDisabled_passesThroughToSystem() {
        var nextPageCalls = 0
        var prevPageCalls = 0

        val downEvent = KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_VOLUME_DOWN)
        val consumed = ReaderKeyEventDispatcher.handleKeyEvent(
            event = downEvent,
            volumeKeysEnabled = false,
            isModalOrSearchActive = false,
            onNextPage = { nextPageCalls++ },
            onPreviousPage = { prevPageCalls++ }
        )

        assertFalse(consumed)
        assertEquals(0, nextPageCalls)
        assertEquals(0, prevPageCalls)

        val upEvent = KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_VOLUME_UP)
        val upConsumed = ReaderKeyEventDispatcher.handleKeyEvent(
            event = upEvent,
            volumeKeysEnabled = false,
            isModalOrSearchActive = false,
            onNextPage = { nextPageCalls++ },
            onPreviousPage = { prevPageCalls++ }
        )

        assertFalse(upConsumed)
        assertEquals(0, nextPageCalls)
        assertEquals(0, prevPageCalls)
    }

    @Test
    fun volumeKeys_whenModalOrSearchActive_passesThroughToSystem() {
        var nextPageCalls = 0
        var prevPageCalls = 0

        val downEvent = KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_VOLUME_DOWN)
        val consumed = ReaderKeyEventDispatcher.handleKeyEvent(
            event = downEvent,
            volumeKeysEnabled = true,
            isModalOrSearchActive = true,
            onNextPage = { nextPageCalls++ },
            onPreviousPage = { prevPageCalls++ }
        )

        assertFalse(consumed)
        assertEquals(0, nextPageCalls)
        assertEquals(0, prevPageCalls)
    }

    @Test
    fun nonVolumeKeys_alwaysPassThrough() {
        var nextPageCalls = 0
        var prevPageCalls = 0

        val backEvent = KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_BACK)
        val consumed = ReaderKeyEventDispatcher.handleKeyEvent(
            event = backEvent,
            volumeKeysEnabled = true,
            isModalOrSearchActive = false,
            onNextPage = { nextPageCalls++ },
            onPreviousPage = { prevPageCalls++ }
        )

        assertFalse(consumed)
        assertEquals(0, nextPageCalls)
        assertEquals(0, prevPageCalls)
    }

    @Test
    fun windowCallbackWrapper_interceptsAndSuppressesDelegateWhenConsumed() {
        val originalCallback = mock(Window.Callback::class.java)
        var consumed = false

        val wrapper = VolumeKeyInterceptorWindowCallback(originalCallback) { event ->
            if (event.keyCode == KeyEvent.KEYCODE_VOLUME_DOWN) {
                consumed = true
                true
            } else {
                false
            }
        }

        val volumeEvent = KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_VOLUME_DOWN)
        val result = wrapper.dispatchKeyEvent(volumeEvent)

        assertTrue(result)
        assertTrue(consumed)
        verify(originalCallback, never()).dispatchKeyEvent(volumeEvent)

        val otherEvent = KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_BACK)
        `when`(originalCallback.dispatchKeyEvent(otherEvent)).thenReturn(true)
        val otherResult = wrapper.dispatchKeyEvent(otherEvent)

        assertTrue(otherResult)
        verify(originalCallback).dispatchKeyEvent(otherEvent)
    }

    @Test
    fun repositorySettingsFlow_controlsVolumeKeysToTurnPages() {
        val dao = mock(ReaderSettingsDao::class.java)
        val fontDao = mock(CustomFontDao::class.java)
        val activity = Robolectric.buildActivity(Activity::class.java).setup().get()
        val repository = ReaderSettingsRepository(activity, dao, fontDao)

        val mediaId = 42L
        `when`(dao.getGlobalSettingsFlow()).thenReturn(flowOf(ReaderSettingsEntity(id = 1, volumeKeysToTurnPages = false)))
        `when`(dao.getBookSettingsFlow(mediaId)).thenReturn(flowOf(null))

        val flow = repository.getReaderSettingsFlow(mediaId)
        val settings = runBlocking { flow.first() }

        assertFalse(settings.volumeKeysToTurnPages)
    }

    @Test
    fun windowInterceptor_cleanlyRestoresOriginalCallbackOnDispose() {
        val activity = Robolectric.buildActivity(Activity::class.java).setup().get()
        val originalCallback = activity.window.callback

        val interceptor = VolumeKeyInterceptorWindowCallback(originalCallback) { true }
        activity.window.callback = interceptor
        assertSame(interceptor, activity.window.callback)

        // Simulate onDispose restoration
        if (activity.window.callback === interceptor) {
            activity.window.callback = originalCallback
        }

        assertSame(originalCallback, activity.window.callback)
    }
}
