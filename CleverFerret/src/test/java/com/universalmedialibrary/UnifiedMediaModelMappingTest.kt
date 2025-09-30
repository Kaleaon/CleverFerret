package com.universalmedialibrary

import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.MetadataMovie
import com.universalmedialibrary.data.models.MediaType
import com.universalmedialibrary.data.models.UnifiedMediaItem
import com.universalmedialibrary.data.models.toUnifiedMediaItem
import org.junit.Test
import org.junit.Assert.*

/**
 * Unit tests for MediaType to UnifiedMediaItem mapping
 * 
 * Tests the correct mapping of media types, specifically ensuring:
 * - MOVIE media type maps to UnifiedMediaItem.Movie
 * - TV_SHOW media type maps to UnifiedMediaItem.TvShow
 */
class UnifiedMediaModelMappingTest {

    @Test
    fun `test MOVIE mediaType maps to UnifiedMediaItem Movie`() {
        // Given a MediaItem with MOVIE mediaType
        val mediaItem = MediaItem(
            itemId = 1L,
            libraryId = 1L,
            filePath = "/test/movie.mp4",
            fileName = "test-movie.mp4",
            fileExtension = "mp4",
            fileSize = 2048L,
            mediaType = "MOVIE",
            isAvailable = true
        )
        
        val commonMetadata = MetadataCommon(
            itemId = 1L,
            title = "Test Movie",
            year = 2023,
            rating = 4.5f,
            summary = "A test movie"
        )
        
        val movieMetadata = MetadataMovie(
            itemId = 1L,
            runtime = 120,
            imdbId = "tt1234567",
            watchedStatus = "UNWATCHED",
            watchProgress = 0.0f
        )
        
        // When converting to UnifiedMediaItem
        val unifiedItem = mediaItem.toUnifiedMediaItem(
            commonMetadata = commonMetadata,
            movieMetadata = movieMetadata
        )
        
        // Then it should be a UnifiedMediaItem.Movie
        assertTrue("Expected UnifiedMediaItem.Movie but got ${unifiedItem::class.simpleName}", 
                   unifiedItem is UnifiedMediaItem.Movie)
        assertEquals(MediaType.MOVIE, unifiedItem.mediaType)
        
        // Verify movie-specific properties are accessible
        val movieItem = unifiedItem as UnifiedMediaItem.Movie
        assertEquals(120, movieItem.runtime)
        assertEquals("tt1234567", movieItem.imdbId)
        assertEquals(0.0f, movieItem.watchProgress)
        assertFalse(movieItem.isWatched)
    }

    @Test
    fun `test TV_SHOW mediaType maps to UnifiedMediaItem TvShow`() {
        // Given a MediaItem with TV_SHOW mediaType
        val mediaItem = MediaItem(
            itemId = 2L,
            libraryId = 1L,
            filePath = "/test/tvshow.mkv",
            fileName = "test-tvshow-s01e01.mkv",
            fileExtension = "mkv",
            fileSize = 1536L,
            mediaType = "TV_SHOW",
            isAvailable = true
        )
        
        val commonMetadata = MetadataCommon(
            itemId = 2L,
            title = "Test TV Show - S01E01",
            year = 2023,
            rating = 4.2f,
            summary = "First episode of test TV show"
        )
        
        // When converting to UnifiedMediaItem
        val unifiedItem = mediaItem.toUnifiedMediaItem(
            commonMetadata = commonMetadata
        )
        
        // Then it should be a UnifiedMediaItem.TvShow (NOT Movie)
        assertTrue("Expected UnifiedMediaItem.TvShow but got ${unifiedItem::class.simpleName}", 
                   unifiedItem is UnifiedMediaItem.TvShow)
        assertFalse("TV_SHOW should NOT map to Movie", 
                    unifiedItem is UnifiedMediaItem.Movie)
        assertEquals(MediaType.TV_SHOW, unifiedItem.mediaType)
        
        // Verify common properties are accessible
        assertEquals("Test TV Show - S01E01", unifiedItem.title)
        assertEquals(2023, unifiedItem.year)
        assertEquals(4.2f, unifiedItem.rating)
    }

    @Test
    fun `test MOVIE and TV_SHOW map to different UnifiedMediaItem types`() {
        // Given two MediaItems: one MOVIE and one TV_SHOW
        val movieItem = MediaItem(
            itemId = 1L,
            libraryId = 1L,
            filePath = "/test/movie.mp4",
            fileName = "movie.mp4",
            fileExtension = "mp4",
            fileSize = 2048L,
            mediaType = "MOVIE",
            isAvailable = true
        )
        
        val tvShowItem = MediaItem(
            itemId = 2L,
            libraryId = 1L,
            filePath = "/test/tvshow.mkv",
            fileName = "tvshow.mkv",
            fileExtension = "mkv",
            fileSize = 1536L,
            mediaType = "TV_SHOW",
            isAvailable = true
        )
        
        // When converting both to UnifiedMediaItem
        val unifiedMovie = movieItem.toUnifiedMediaItem()
        val unifiedTvShow = tvShowItem.toUnifiedMediaItem()
        
        // Then they should map to different types
        assertTrue("Movie should map to UnifiedMediaItem.Movie", 
                   unifiedMovie is UnifiedMediaItem.Movie)
        assertTrue("TV_SHOW should map to UnifiedMediaItem.TvShow", 
                   unifiedTvShow is UnifiedMediaItem.TvShow)
        
        // And they should NOT be the same type
        assertNotEquals("MOVIE and TV_SHOW should map to different UnifiedMediaItem types",
                        unifiedMovie::class, unifiedTvShow::class)
        
        // Verify their mediaTypes are different
        assertEquals(MediaType.MOVIE, unifiedMovie.mediaType)
        assertEquals(MediaType.TV_SHOW, unifiedTvShow.mediaType)
    }

    @Test
    fun `test TV_SHOW mediaType enum value matches TvShow media type`() {
        // Given a TvShow UnifiedMediaItem
        val mediaItem = MediaItem(
            itemId = 1L,
            libraryId = 1L,
            filePath = "/test/show.mkv",
            fileName = "show.mkv",
            fileExtension = "mkv",
            fileSize = 1000L,
            mediaType = "TV_SHOW",
            isAvailable = true
        )
        
        val unifiedItem = mediaItem.toUnifiedMediaItem()
        
        // Then the mediaType enum should be TV_SHOW
        assertEquals(MediaType.TV_SHOW, unifiedItem.mediaType)
        assertEquals("TV Show", unifiedItem.mediaType.displayName)
    }
}
