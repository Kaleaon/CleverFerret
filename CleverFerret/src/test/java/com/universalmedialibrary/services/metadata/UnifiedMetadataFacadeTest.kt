package com.universalmedialibrary.services.metadata

import com.universalmedialibrary.services.music.MusicMetadataService
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Before
import org.junit.Test
import org.mockito.Mockito.`when`
import org.mockito.Mockito.mock
import org.mockito.Mockito.verify

class UnifiedMetadataFacadeTest {

    private lateinit var embeddedTagExtractor: EmbeddedTagExtractor
    private lateinit var centralizedApiClient: CentralizedMetadataApiClient
    private lateinit var realMetadataService: RealMetadataService
    private lateinit var audioMetadataService: AudioMetadataService
    private lateinit var bookMetadataService: BookMetadataService
    private lateinit var comicMetadataService: ComicMetadataService
    private lateinit var fanfictionMetadataService: FanfictionMetadataService
    private lateinit var musicMetadataService: MusicMetadataService

    private lateinit var facade: UnifiedMetadataFacade

    @Before
    fun setUp() {
        embeddedTagExtractor = mock(EmbeddedTagExtractor::class.java)
        centralizedApiClient = mock(CentralizedMetadataApiClient::class.java)
        realMetadataService = mock(RealMetadataService::class.java)
        audioMetadataService = mock(AudioMetadataService::class.java)
        bookMetadataService = mock(BookMetadataService::class.java)
        comicMetadataService = mock(ComicMetadataService::class.java)
        fanfictionMetadataService = mock(FanfictionMetadataService::class.java)
        musicMetadataService = mock(MusicMetadataService::class.java)

        facade = UnifiedMetadataFacade(
            embeddedTagExtractor = embeddedTagExtractor,
            centralizedApiClient = centralizedApiClient,
            realMetadataService = realMetadataService,
            audioMetadataService = audioMetadataService,
            bookMetadataService = bookMetadataService,
            comicMetadataService = comicMetadataService,
            fanfictionMetadataService = fanfictionMetadataService,
            musicMetadataService = musicMetadataService
        )
    }

    @Test
    fun testExtractEmbeddedMetadataDelegatesToEmbeddedExtractor() = runBlocking {
        val testPath = "/tmp/test.mp3"
        val expected = UniversalMetadata(title = "Test Song", artist = "Test Artist", extractionSuccess = true, filePath = testPath)
        `when`(embeddedTagExtractor.extractMetadata(testPath)).thenReturn(expected)

        val result = facade.extractEmbeddedMetadata(testPath)

        assertEquals("Test Song", result.title)
        assertEquals("Test Artist", result.artist)
        verify(embeddedTagExtractor).extractMetadata(testPath)
    }

    @Test
    fun testExtractTrackMetadataMapsFieldsCorrectly() = runBlocking {
        val testPath = "/tmp/track.flac"
        val universalMeta = UniversalMetadata(
            title = "FLAC Track",
            artist = "FLAC Artist",
            album = "FLAC Album",
            trackNumber = 5,
            extractionSuccess = true,
            filePath = testPath
        )
        `when`(embeddedTagExtractor.extractMetadata(testPath)).thenReturn(universalMeta)

        val trackMeta = facade.extractTrackMetadata(testPath)

        assertNotNull(trackMeta)
        assertEquals("FLAC Track", trackMeta.title)
        assertEquals("FLAC Artist", trackMeta.artist)
        assertEquals(5, trackMeta.trackNumber)
    }

    @Test
    fun testSearchBookMetadataDelegatesToRealMetadataService() = runBlocking {
        val expected = BookMetadataResult(metadata = null, sources = emptyList())
        `when`(realMetadataService.searchBookMetadata(query = "Dune")).thenReturn(expected)

        val result = facade.searchBookMetadata(query = "Dune")

        assertEquals(expected, result)
        verify(realMetadataService).searchBookMetadata(query = "Dune")
    }

    @Test
    fun testSearchMovieMetadataDelegatesToRealMetadataService() = runBlocking {
        val expected = MovieMetadataResult(metadata = null, sources = emptyList())
        `when`(realMetadataService.searchMovieMetadata(title = "Inception", year = 2010)).thenReturn(expected)

        val result = facade.searchMovieMetadata(title = "Inception", year = 2010)

        assertEquals(expected, result)
        verify(realMetadataService).searchMovieMetadata(title = "Inception", year = 2010)
    }

    @Test
    fun testSearchMusicMetadataDelegatesToRealMetadataService() = runBlocking {
        val expected = MusicMetadataResult(metadata = null, sources = emptyList())
        `when`(realMetadataService.searchMusicMetadata(artist = "Daft Punk")).thenReturn(expected)

        val result = facade.searchMusicMetadata(artist = "Daft Punk")

        assertEquals(expected, result)
        verify(realMetadataService).searchMusicMetadata(artist = "Daft Punk")
    }
}
