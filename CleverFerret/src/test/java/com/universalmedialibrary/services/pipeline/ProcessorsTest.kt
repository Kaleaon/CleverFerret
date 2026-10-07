package com.universalmedialibrary.services.pipeline

import com.universalmedialibrary.api.plugin.MediaType as PluginMediaType
import com.universalmedialibrary.api.plugin.MetadataProviderPlugin
import com.universalmedialibrary.api.plugin.MetadataSearchResult
import com.universalmedialibrary.api.plugin.MediaMetadata
import com.universalmedialibrary.api.plugin.PluginRegistry
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.repository.MetadataStagingRepository
import com.universalmedialibrary.services.media.MetadataExtractionService
import com.universalmedialibrary.services.pipeline.processors.RawExtractionProcessor
import com.universalmedialibrary.services.pipeline.processors.RemoteEnrichmentProcessor
import com.universalmedialibrary.services.pipeline.processors.SchemaNormalizationProcessor
import com.universalmedialibrary.services.pipeline.processors.StagingPersistenceProcessor
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.mockk
import kotlinx.coroutines.runBlocking
import org.junit.Assert.*
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder

class ProcessorsTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    @Test
    fun `test Stage 1 RawExtractionProcessor extracts metadata`() = runBlocking {
        val metadataExtractionService = mockk<MetadataExtractionService>()
        val processor = RawExtractionProcessor(metadataExtractionService)

        val file = tempFolder.newFile("test_audio.mp3")
        val raw = RawMetadata(
            title = "Sample Song",
            creators = listOf("Sample Artist"),
            album = "Sample Album",
            confidenceScore = 0.88f,
            source = "ID3_TAG_EXTRACTION"
        )

        coEvery { metadataExtractionService.extractRawMetadata(file, "MUSIC") } returns raw

        val initialContext = CatalogingPipelineContext(
            file = file,
            mediaType = "MUSIC",
            libraryId = 10L
        )

        val resultContext = processor.process(initialContext)

        assertNotNull(resultContext.rawMetadata)
        assertEquals("Sample Song", resultContext.rawMetadata?.title)
        assertEquals(0.88f, resultContext.confidenceScore)
    }

    @Test
    fun `test Stage 2 SchemaNormalizationProcessor generates sortTitle and entities`() = runBlocking {
        val processor = SchemaNormalizationProcessor()

        val file = tempFolder.newFile("The_Matrix.mkv")
        val raw = RawMetadata(
            title = "The Matrix",
            creators = listOf("Wachowskis"),
            durationMs = 8160000L, // ~136 min
            resolution = "1920x1080",
            confidenceScore = 0.80f
        )

        val context = CatalogingPipelineContext(
            file = file,
            mediaType = "MOVIE",
            libraryId = 5L,
            rawMetadata = raw,
            confidenceScore = 0.80f
        )

        val resultContext = processor.process(context)

        val common = resultContext.normalizedCommon
        assertNotNull(common)
        assertEquals("The Matrix", common?.title)
        assertEquals("Matrix, The", common?.sortTitle)

        val movie = resultContext.movieMetadata
        assertNotNull(movie)
        assertEquals(136, movie?.runtime)
        assertEquals("1920x1080", movie?.resolution)
        assertTrue(resultContext.confidenceScore > 0.80f)
    }

    @Test
    fun `test Stage 3 RemoteEnrichmentProcessor enriches missing fields from plugin`() = runBlocking {
        val pluginRegistry = mockk<PluginRegistry>()
        val provider = mockk<MetadataProviderPlugin>()

        coEvery { provider.id } returns "goodreads_plugin"
        coEvery { provider.name } returns "Goodreads Plugin"
        coEvery { provider.supportedMediaTypes } returns setOf(PluginMediaType.BOOK)

        val searchResult = MetadataSearchResult(
            id = "ext_123",
            providerId = "goodreads_plugin",
            title = "Dune",
            coverUrl = "https://example.com/dune.jpg",
            mediaType = PluginMediaType.BOOK
        )

        val mediaMetadata = MediaMetadata(
            id = "ext_123",
            providerId = "goodreads_plugin",
            title = "Dune",
            description = "A classic sci-fi epic set on Arrakis.",
            isbn = "9780441172719",
            publisher = "Chilton Books",
            mediaType = PluginMediaType.BOOK
        )

        coEvery { provider.search(any()) } returns Result.success(listOf(searchResult))
        coEvery { provider.fetchDetails("ext_123", PluginMediaType.BOOK) } returns Result.success(mediaMetadata)
        coEvery { pluginRegistry.getMetadataProviders() } returns listOf(provider)

        val processor = RemoteEnrichmentProcessor(pluginRegistry)

        val file = tempFolder.newFile("Dune.epub")
        val raw = RawMetadata(title = "Dune", creators = listOf("Frank Herbert"), confidenceScore = 0.70f)

        val schemaProcessor = SchemaNormalizationProcessor()
        var context = CatalogingPipelineContext(file = file, mediaType = "BOOK", libraryId = 1L, rawMetadata = raw, confidenceScore = 0.70f)
        context = schemaProcessor.process(context)

        val enrichedContext = processor.process(context)

        assertEquals("A classic sci-fi epic set on Arrakis.", enrichedContext.normalizedCommon?.summary)
        assertEquals("https://example.com/dune.jpg", enrichedContext.normalizedCommon?.coverImagePath)
        assertEquals("9780441172719", enrichedContext.bookMetadata?.isbn)
        assertTrue(enrichedContext.confidenceScore > 0.70f)
    }

    @Test
    fun `test Stage 4 StagingPersistenceProcessor routes low confidence to staging`() = runBlocking {
        val mediaItemDao = mockk<MediaItemDao>()
        val metadataDao = mockk<MetadataDao>()
        val metadataStagingRepository = mockk<MetadataStagingRepository>()

        val processor = StagingPersistenceProcessor(mediaItemDao, metadataDao, metadataStagingRepository)

        val file = tempFolder.newFile("low_confidence.epub")
        val dummyMediaItem = MediaItem(itemId = 300L, libraryId = 1L, filePath = file.absolutePath, fileName = file.name, fileExtension = "epub", fileSize = 100L, mediaType = "BOOK")

        coEvery { mediaItemDao.getItemByPath(file.absolutePath) } returns dummyMediaItem
        coEvery { metadataDao.insertMetadataCommon(any()) } returns Unit
        coEvery { metadataDao.insertMetadataBook(any()) } returns Unit
        coEvery { metadataStagingRepository.stageMetadataCommon(any(), any(), any(), any(), any()) } returns 888L

        val context = CatalogingPipelineContext(
            file = file,
            mediaType = "BOOK",
            libraryId = 1L,
            confidenceScore = 0.65f // < 0.85f threshold
        )

        val result = processor.process(context)

        assertTrue(result.isStaged)
        assertEquals(PipelineStatus.STAGED, result.status)
        assertEquals(888L, result.stagedCandidateId)

        coVerify { metadataStagingRepository.stageMetadataCommon(eq(300L), any(), any(), eq(0.65f), any()) }
    }
}
