package com.universalmedialibrary

import com.universalmedialibrary.widget.MediaType
import com.universalmedialibrary.widget.MediaWidgetState
import com.universalmedialibrary.widget.WidgetAction
import com.universalmedialibrary.widget.WidgetSize
import org.junit.Test
import org.junit.Assert.*

/**
 * Unit tests for Media Widget functionality
 */
class MediaWidgetTest {

    @Test
    fun testMediaWidgetStateDefaults() {
        val defaultState = MediaWidgetState()
        
        assertEquals("", defaultState.title)
        assertEquals("", defaultState.artist)
        assertFalse(defaultState.isPlaying)
        assertFalse(defaultState.hasMedia)
        assertEquals(MediaType.UNKNOWN, defaultState.mediaType)
        assertNull(defaultState.artworkUri)
        assertNull(defaultState.artworkBitmap)
        assertEquals(0L, defaultState.duration)
        assertEquals(0L, defaultState.position)
        assertFalse(defaultState.canSkipPrevious)
        assertFalse(defaultState.canSkipNext)
        assertFalse(defaultState.isLoading)
        assertNull(defaultState.error)
    }

    @Test
    fun testMediaWidgetStateWithMedia() {
        val stateWithMedia = MediaWidgetState(
            title = "The Great Gatsby",
            artist = "F. Scott Fitzgerald",
            isPlaying = true,
            hasMedia = true,
            mediaType = MediaType.AUDIOBOOK,
            duration = 300000L,
            position = 45000L,
            canSkipNext = true,
            canSkipPrevious = true
        )
        
        assertEquals("The Great Gatsby", stateWithMedia.title)
        assertEquals("F. Scott Fitzgerald", stateWithMedia.artist)
        assertTrue(stateWithMedia.isPlaying)
        assertTrue(stateWithMedia.hasMedia)
        assertEquals(MediaType.AUDIOBOOK, stateWithMedia.mediaType)
        assertEquals(300000L, stateWithMedia.duration)
        assertEquals(45000L, stateWithMedia.position)
        assertTrue(stateWithMedia.canSkipNext)
        assertTrue(stateWithMedia.canSkipPrevious)
        assertFalse(stateWithMedia.hasError)
    }

    @Test
    fun testMediaWidgetStateProgress() {
        val state = MediaWidgetState(
            duration = 120000L, // 2 minutes
            position = 60000L   // 1 minute
        )
        
        assertEquals(0.5f, state.progress, 0.01f)
    }

    @Test
    fun testMediaWidgetStateProgressWithZeroDuration() {
        val state = MediaWidgetState(
            duration = 0L,
            position = 60000L
        )
        
        assertEquals(0f, state.progress, 0.01f)
    }

    @Test
    fun testMediaWidgetStateHasArtwork() {
        val stateWithoutArtwork = MediaWidgetState()
        assertFalse(stateWithoutArtwork.hasArtwork)
        
        val stateWithArtworkUri = MediaWidgetState(artworkUri = "/path/to/artwork.jpg")
        assertTrue(stateWithArtworkUri.hasArtwork)
    }

    @Test
    fun testWidgetActions() {
        // Test that widget actions are properly sealed
        val playPauseAction = WidgetAction.PlayPause
        val skipNextAction = WidgetAction.SkipNext
        val skipPreviousAction = WidgetAction.SkipPrevious
        val openAppAction = WidgetAction.OpenApp
        val seekToAction = WidgetAction.SeekTo(30000L)
        
        assertNotNull(playPauseAction)
        assertNotNull(skipNextAction)
        assertNotNull(skipPreviousAction)
        assertNotNull(openAppAction)
        assertNotNull(seekToAction)
        
        // Test SeekTo action with position
        assertTrue(seekToAction is WidgetAction.SeekTo)
        assertEquals(30000L, (seekToAction as WidgetAction.SeekTo).position)
    }

    @Test
    fun testMediaTypes() {
        val mediaTypes = MediaType.values()
        
        assertTrue(mediaTypes.contains(MediaType.BOOK))
        assertTrue(mediaTypes.contains(MediaType.AUDIOBOOK))
        assertTrue(mediaTypes.contains(MediaType.MUSIC))
        assertTrue(mediaTypes.contains(MediaType.MOVIE))
        assertTrue(mediaTypes.contains(MediaType.PODCAST))
        assertTrue(mediaTypes.contains(MediaType.UNKNOWN))
    }

    @Test
    fun testWidgetSizes() {
        val widgetSizes = WidgetSize.values()
        
        assertTrue(widgetSizes.contains(WidgetSize.SMALL))
        assertTrue(widgetSizes.contains(WidgetSize.MEDIUM))
        assertTrue(widgetSizes.contains(WidgetSize.LARGE))
    }

    @Test
    fun testMediaWidgetStateWithError() {
        val stateWithError = MediaWidgetState(
            error = "Playback failed"
        )
        
        assertTrue(stateWithError.hasError)
        assertEquals("Playback failed", stateWithError.error)
    }
}