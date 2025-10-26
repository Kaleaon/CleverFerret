package com.universalmedialibrary.widgets

import com.universalmedialibrary.data.local.entity.MediaItem
import org.junit.Test
import org.junit.Assert.*

/**
 * Unit tests for MediaPlaybackWidgetState
 */
class MediaPlaybackWidgetStateTest {

    @Test
    fun `test empty state has correct default values`() {
        val state = MediaPlaybackWidgetState()
        
        assertFalse(state.hasMedia)
        assertFalse(state.hasError)
        assertFalse(state.canPlay)
        assertEquals("No Media", state.displayTitle)
        assertEquals("", state.displaySubtitle)
    }

    @Test
    fun `test book media displays correct title and subtitle`() {
        val bookMedia = MediaItem(
            itemId = 1,
            libraryId = 1,
            filePath = "/path/to/book.epub",
            fileName = "The Great Novel.epub",
            fileExtension = "epub",
            fileSize = 1024L,
            mediaType = "BOOK"
        )
        
        val state = MediaPlaybackWidgetState(currentMedia = bookMedia)
        
        assertTrue(state.hasMedia)
        assertTrue(state.canPlay)
        assertEquals("The Great Novel", state.displayTitle)
        assertEquals("Book", state.displaySubtitle)
    }
    
    @Test
    fun `test music media displays correct title and subtitle`() {
        val musicMedia = MediaItem(
            itemId = 2,
            libraryId = 1,
            filePath = "/path/to/song.mp3",
            fileName = "Amazing Song.mp3",
            fileExtension = "mp3",
            fileSize = 2048L,
            mediaType = "MUSIC_TRACK"
        )
        
        val state = MediaPlaybackWidgetState(currentMedia = musicMedia)
        
        assertTrue(state.hasMedia)
        assertTrue(state.canPlay)
        assertEquals("Amazing Song", state.displayTitle)
        assertEquals("Music", state.displaySubtitle)
    }
    
    @Test
    fun `test movie media displays correct title and subtitle`() {
        val movieMedia = MediaItem(
            itemId = 3,
            libraryId = 1,
            filePath = "/path/to/movie.mp4",
            fileName = "Epic Movie.mp4",
            fileExtension = "mp4",
            fileSize = 4096L,
            mediaType = "MOVIE"
        )
        
        val state = MediaPlaybackWidgetState(currentMedia = movieMedia)
        
        assertTrue(state.hasMedia)
        assertTrue(state.canPlay)
        assertEquals("Epic Movie", state.displayTitle)
        assertEquals("Movie", state.displaySubtitle)
    }
    
    @Test
    fun `test loading state prevents playback`() {
        val media = MediaItem(
            itemId = 1,
            libraryId = 1,
            filePath = "/path/to/file.mp3",
            fileName = "file.mp3",
            fileExtension = "mp3",
            fileSize = 1024L,
            mediaType = "MUSIC_TRACK"
        )
        
        val state = MediaPlaybackWidgetState(
            currentMedia = media,
            isLoading = true
        )
        
        assertTrue(state.hasMedia)
        assertFalse(state.canPlay) // Cannot play while loading
    }
    
    @Test
    fun `test error state prevents playback`() {
        val media = MediaItem(
            itemId = 1,
            libraryId = 1,
            filePath = "/path/to/file.mp3",
            fileName = "file.mp3",
            fileExtension = "mp3",
            fileSize = 1024L,
            mediaType = "MUSIC_TRACK"
        )
        
        val state = MediaPlaybackWidgetState(
            currentMedia = media,
            error = "Playback error"
        )
        
        assertTrue(state.hasMedia)
        assertTrue(state.hasError)
        assertFalse(state.canPlay) // Cannot play with error
    }
    
    @Test
    fun `test unknown media type displays capitalized name`() {
        val unknownMedia = MediaItem(
            itemId = 1,
            libraryId = 1,
            filePath = "/path/to/file.xyz",
            fileName = "file.xyz",
            fileExtension = "xyz",
            fileSize = 1024L,
            mediaType = "UNKNOWN_TYPE"
        )
        
        val state = MediaPlaybackWidgetState(currentMedia = unknownMedia)
        
        assertEquals("file", state.displayTitle)
        assertEquals("Unknown_type", state.displaySubtitle)
    }
}