package com.universalmedialibrary.ui.reader

import androidx.compose.ui.input.key.Key
import org.junit.Assert.assertEquals
import org.junit.Test

class ReaderKeyDispatcherTest {

    @Test
    fun testResolveAction_NextPageKeys() {
        assertEquals(ReaderKeyAction.NEXT_PAGE, ReaderKeyDispatcher.resolveAction(Key.DirectionRight))
        assertEquals(ReaderKeyAction.NEXT_PAGE, ReaderKeyDispatcher.resolveAction(Key.PageDown))
        assertEquals(ReaderKeyAction.NEXT_PAGE, ReaderKeyDispatcher.resolveAction(Key.DirectionDown))
    }

    @Test
    fun testResolveAction_PreviousPageKeys() {
        assertEquals(ReaderKeyAction.PREVIOUS_PAGE, ReaderKeyDispatcher.resolveAction(Key.DirectionLeft))
        assertEquals(ReaderKeyAction.PREVIOUS_PAGE, ReaderKeyDispatcher.resolveAction(Key.PageUp))
        assertEquals(ReaderKeyAction.PREVIOUS_PAGE, ReaderKeyDispatcher.resolveAction(Key.DirectionUp))
    }

    @Test
    fun testResolveAction_ToggleUIKeys() {
        assertEquals(ReaderKeyAction.TOGGLE_UI, ReaderKeyDispatcher.resolveAction(Key.DirectionCenter))
        assertEquals(ReaderKeyAction.TOGGLE_UI, ReaderKeyDispatcher.resolveAction(Key.Enter))
        assertEquals(ReaderKeyAction.TOGGLE_UI, ReaderKeyDispatcher.resolveAction(Key.Spacebar))
    }

    @Test
    fun testResolveAction_ShowMenuKeys() {
        assertEquals(ReaderKeyAction.SHOW_MENU, ReaderKeyDispatcher.resolveAction(Key.M))
        assertEquals(ReaderKeyAction.SHOW_MENU, ReaderKeyDispatcher.resolveAction(Key.Menu))
        assertEquals(ReaderKeyAction.SHOW_MENU, ReaderKeyDispatcher.resolveAction(Key.Escape))
    }

    @Test
    fun testResolveAction_UnmappedKeysReturnNone() {
        assertEquals(ReaderKeyAction.NONE, ReaderKeyDispatcher.resolveAction(Key.A))
        assertEquals(ReaderKeyAction.NONE, ReaderKeyDispatcher.resolveAction(Key.Tab))
    }
}
