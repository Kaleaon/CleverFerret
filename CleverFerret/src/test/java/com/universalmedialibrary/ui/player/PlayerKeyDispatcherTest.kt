package com.universalmedialibrary.ui.player

import androidx.compose.ui.input.key.Key
import org.junit.Assert.assertEquals
import org.junit.Test

class PlayerKeyDispatcherTest {

    @Test
    fun testResolveAction_TogglePlayPauseKeys() {
        assertEquals(PlayerKeyAction.TOGGLE_PLAY_PAUSE, PlayerKeyDispatcher.resolveAction(Key.MediaPlayPause))
        assertEquals(PlayerKeyAction.TOGGLE_PLAY_PAUSE, PlayerKeyDispatcher.resolveAction(Key.Spacebar))
        assertEquals(PlayerKeyAction.TOGGLE_PLAY_PAUSE, PlayerKeyDispatcher.resolveAction(Key.DirectionCenter))
        assertEquals(PlayerKeyAction.TOGGLE_PLAY_PAUSE, PlayerKeyDispatcher.resolveAction(Key.Enter))
    }

    @Test
    fun testResolveAction_PlayAndPauseKeys() {
        assertEquals(PlayerKeyAction.PLAY, PlayerKeyDispatcher.resolveAction(Key.MediaPlay))
        assertEquals(PlayerKeyAction.PAUSE, PlayerKeyDispatcher.resolveAction(Key.MediaPause))
    }

    @Test
    fun testResolveAction_SeekKeys() {
        assertEquals(PlayerKeyAction.SEEK_BACKWARD, PlayerKeyDispatcher.resolveAction(Key.DirectionLeft))
        assertEquals(PlayerKeyAction.SEEK_BACKWARD, PlayerKeyDispatcher.resolveAction(Key.MediaRewind))
        assertEquals(PlayerKeyAction.SEEK_FORWARD, PlayerKeyDispatcher.resolveAction(Key.DirectionRight))
        assertEquals(PlayerKeyAction.SEEK_FORWARD, PlayerKeyDispatcher.resolveAction(Key.MediaFastForward))
    }

    @Test
    fun testResolveAction_ToggleControlsKeys() {
        assertEquals(PlayerKeyAction.TOGGLE_CONTROLS, PlayerKeyDispatcher.resolveAction(Key.C))
        assertEquals(PlayerKeyAction.TOGGLE_CONTROLS, PlayerKeyDispatcher.resolveAction(Key.Escape))
    }

    @Test
    fun testResolveAction_UnmappedKeysReturnNone() {
        assertEquals(PlayerKeyAction.NONE, PlayerKeyDispatcher.resolveAction(Key.Z))
        assertEquals(PlayerKeyAction.NONE, PlayerKeyDispatcher.resolveAction(Key.Tab))
    }
}
