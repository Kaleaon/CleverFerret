package com.universalmedialibrary

import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.data.models.MediaType
import com.universalmedialibrary.data.models.UnifiedMediaItem
import com.universalmedialibrary.data.models.toUnifiedMediaItem
import org.junit.Test
import org.junit.Assert.*

/**
 * Tests for the unified media model and type system
 */
class UnifiedMediaModelTest {

    @Test
    fun testMediaTypeFromExtension() {
        // Test book extensions
        assertEquals(MediaType.BOOK, MediaType.fromExtension("epub"))
        assertEquals(MediaType.BOOK, MediaType.fromExtension("PDF"))
        assertEquals(MediaType.BOOK, MediaType.fromExtension("mobi"))
        
        // Test video extensions (note: mp4 will match MOVIE first since it appears first in enum)
        assertEquals(MediaType.MOVIE, MediaType.fromExtension("mp4"))
        assertEquals(MediaType.MOVIE, MediaType.fromExtension("MKV"))
        
        // Test audio extensions
        assertEquals(MediaType.MUSIC_TRACK, MediaType.fromExtension("mp3"))
        assertEquals(MediaType.MUSIC_TRACK, MediaType.fromExtension("FLAC"))
        
        // Test unknown extension
        assertEquals(MediaType.DOCUMENT, MediaType.fromExtension("xyz"))
    }

    @Test
    fun testMediaTypeFromString() {
        assertEquals(MediaType.BOOK, MediaType.fromString("BOOK"))
        assertEquals(MediaType.MOVIE, MediaType.fromString("movie"))
        assertEquals(MediaType.MUSIC_TRACK, MediaType.fromString("Music_Track"))
        assertEquals(MediaType.DOCUMENT, MediaType.fromString("unknown"))
    }

    @Test
    fun testUnifiedMediaItemBook() {
        val mediaItem = MediaItem(
            itemId = 1L,
            libraryId = 1L,
            filePath = "/test/book.epub",
            fileName = "test-book.epub",
            fileExtension = "epub",
            fileSize = 1024L,
            mediaType = "BOOK",
            isAvailable = true
        )
        
        val commonMetadata = MetadataCommon(
            itemId = 1L,
            title = "Test Book",
            year = 2023,
            rating = 4.5f,
            summary = "A test book"
        )
        
        val bookMetadata = MetadataBook(
            itemId = 1L,
            isbn = "978-1234567890",
            pageCount = 200,
            readingProgress = 0.25f,
            isRead = false
        )
        
        val unifiedItem = mediaItem.toUnifiedMediaItem(
            commonMetadata = commonMetadata,
            bookMetadata = bookMetadata
        )
        
        assertTrue(unifiedItem is UnifiedMediaItem.Book)
        assertEquals("Test Book", unifiedItem.title)
        assertEquals(2023, unifiedItem.year)
        assertEquals(4.5f, unifiedItem.rating)
        assertEquals("A test book", unifiedItem.summary)
        assertEquals(MediaType.BOOK, unifiedItem.mediaType)
        
        val bookItem = unifiedItem as UnifiedMediaItem.Book
        assertEquals("978-1234567890", bookItem.isbn)
        assertEquals(200, bookItem.pageCount)
        assertEquals(0.25f, bookItem.readingProgress)
        assertFalse(bookItem.isRead)
    }

    @Test
    fun testUnifiedMediaItemMovie() {
        val mediaItem = MediaItem(
            itemId = 2L,
            libraryId = 1L,
            filePath = "/test/movie.mp4",
            fileName = "test-movie.mp4",
            fileExtension = "mp4",
            fileSize = 2048L,
            mediaType = "MOVIE",
            isAvailable = true
        )
        
        val commonMetadata = MetadataCommon(
            itemId = 2L,
            title = "Test Movie",
            year = 2022,
            rating = 3.8f
        )
        
        val movieMetadata = MetadataMovie(
            itemId = 2L,
            runtime = 120,
            imdbId = "tt1234567",
            watchedStatus = "WATCHED",
            watchProgress = 1.0f
        )
        
        val unifiedItem = mediaItem.toUnifiedMediaItem(
            commonMetadata = commonMetadata,
            movieMetadata = movieMetadata
        )
        
        assertTrue(unifiedItem is UnifiedMediaItem.Movie)
        val movieItem = unifiedItem as UnifiedMediaItem.Movie
        assertEquals(120, movieItem.runtime)
        assertEquals("tt1234567", movieItem.imdbId)
        assertEquals(1.0f, movieItem.watchProgress)
        assertTrue(movieItem.isWatched)
    }

    @Test
    fun testUnifiedMediaItemMusicTrack() {
        val mediaItem = MediaItem(
            itemId = 3L,
            libraryId = 1L,
            filePath = "/test/song.mp3",
            fileName = "test-song.mp3",
            fileExtension = "mp3",
            fileSize = 512L,
            mediaType = "MUSIC_TRACK",
            isAvailable = true
        )
        
        val commonMetadata = MetadataCommon(
            itemId = 3L,
            title = "Test Song",
            year = 2021
        )
        
        val musicMetadata = MetadataMusicTrack(
            itemId = 3L,
            artist = "Test Artist",
            album = "Test Album",
            duration = 180000L, // 3 minutes in milliseconds
            trackNumber = 5,
            playCount = 10,
            isFavorite = true
        )
        
        val unifiedItem = mediaItem.toUnifiedMediaItem(
            commonMetadata = commonMetadata,
            musicMetadata = musicMetadata
        )
        
        assertTrue(unifiedItem is UnifiedMediaItem.MusicTrack)
        val musicItem = unifiedItem as UnifiedMediaItem.MusicTrack
        assertEquals("Test Artist", musicItem.artist)
        assertEquals("Test Album", musicItem.album)
        assertEquals(180000L, musicItem.duration)
        assertEquals(5, musicItem.trackNumber)
        assertEquals(10, musicItem.playCount)
        assertTrue(musicItem.isFavorite)
    }
}