package com.universalmedialibrary.services.pipeline

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.repository.MetadataStagingRepository
import com.universalmedialibrary.services.media.MetadataExtractionService
import com.universalmedialibrary.services.pipeline.processors.RawExtractionProcessor
import com.universalmedialibrary.services.pipeline.processors.RemoteEnrichmentProcessor
import com.universalmedialibrary.services.pipeline.processors.SchemaNormalizationProcessor
import com.universalmedialibrary.services.pipeline.processors.StagingPersistenceProcessor
import com.universalmedialibrary.api.plugin.PluginRegistry
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.mockk
import kotlinx.coroutines.runBlocking
import org.junit.Assert.*
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

class CatalogingPipelineEngineTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    private val metadataExtractionService = mockk<MetadataExtractionService>()
    private val pluginRegistry = mockk<PluginRegistry>()
    private val mediaItemDao = mockk<MediaItemDao>()
    private val metadataDao = mockk<MetadataDao>()
    private val metadataStagingRepository = mockk<MetadataStagingRepository>()

    private lateinit var rawExtractionProcessor: RawExtractionProcessor
    private lateinit var schemaNormalizationProcessor: SchemaNormalizationProcessor
    private lateinit var remoteEnrichmentProcessor: RemoteEnrichmentProcessor
    private lateinit var stagingPersistenceProcessor: StagingPersistenceProcessor
    private lateinit var engine: CatalogingPipelineEngineImpl

    @Before
    fun setUp() {
        rawExtractionProcessor = RawExtractionProcessor(metadataExtractionService)
        schemaNormalizationProcessor = SchemaNormalizationProcessor()
        remoteEnrichmentProcessor = RemoteEnrichmentProcessor(pluginRegistry)
        stagingPersistenceProcessor = StagingPersistenceProcessor(mediaItemDao, metadataDao, metadataStagingRepository)

        val processors = listOf(
            rawExtractionProcessor,
            schemaNormalizationProcessor,
            remoteEnrichmentProcessor,
            stagingPersistenceProcessor
        )

        engine = CatalogingPipelineEngineImpl(processors)

        coEvery { pluginRegistry.getMetadataProviders() } returns emptyList()
    }

    @Test
    fun `test High-Confidence Item passes through all 4 stages and persists directly`() = runBlocking {
        val file = tempFolder.newFile("The Great Gatsby.epub")

        val raw = RawMetadata(
            title = "The Great Gatsby",
            creators = listOf("F. Scott Fitzgerald"),
            year = 1925,
            confidenceScore = 0.85f,
            source = "EPUB_PARSER"
        )

        coEvery { metadataExtractionService.extractRawMetadata(any(), "BOOK") } returns raw
        coEvery { mediaItemDao.getItemByPath(file.absolutePath) } returns null

        val dummyMediaItem = MediaItem(
            itemId = 100L,
            libraryId = 1L,
            filePath = file.absolutePath,
            fileName = file.name,
            fileExtension = "epub",
            fileSize = file.length(),
            mediaType = "BOOK"
        )

        coEvery { mediaItemDao.insertMediaItem(any()) } returns 100L
        coEvery { metadataDao.insertMetadataCommon(any()) } returns Unit
        coEvery { metadataDao.insertMetadataBook(any()) } returns Unit
        coEvery { mediaItemDao.updateMediaItem(any()) } returns 1

        val result = engine.execute(file, "BOOK", 1L)

        assertTrue(result.isSuccess)
        assertFalse(result.isStaged)
        assertEquals(PipelineStatus.COMPLETED, result.context.status)
        assertEquals("Great Gatsby, The", result.context.normalizedCommon?.sortTitle)
        assertTrue(result.context.confidenceScore >= 0.85f)

        coVerify { metadataDao.insertMetadataCommon(match { it.isVerified }) }
    }

    @Test
    fun `test Low-Confidence Item routes to MetadataStagingRepository`() = runBlocking {
        val file = tempFolder.newFile("unclear_scan_document.pdf")

        val raw = RawMetadata(
            title = "unclear scan document",
            creators = emptyList(),
            confidenceScore = 0.50f,
            source = "PDF_FALLBACK"
        )

        coEvery { metadataExtractionService.extractRawMetadata(any(), "BOOK") } returns raw
        coEvery { mediaItemDao.getItemByPath(file.absolutePath) } returns null

        val dummyMediaItem = MediaItem(
            itemId = 200L,
            libraryId = 1L,
            filePath = file.absolutePath,
            fileName = file.name,
            fileExtension = "pdf",
            fileSize = file.length(),
            mediaType = "BOOK"
        )

        coEvery { mediaItemDao.insertMediaItem(any()) } returns 200L
        coEvery { metadataDao.insertMetadataCommon(any()) } returns Unit
        coEvery { metadataDao.insertMetadataBook(any()) } returns Unit
        coEvery { metadataStagingRepository.stageMetadataCommon(any(), any(), any(), any(), any()) } returns 555L

        val result = engine.execute(file, "BOOK", 1L)

        assertTrue(result.isSuccess)
        assertTrue(result.isStaged)
        assertEquals(PipelineStatus.STAGED, result.context.status)
        assertEquals(555L, result.context.stagedCandidateId)

        coVerify { metadataStagingRepository.stageMetadataCommon(eq(200L), any(), any(), any(), any()) }
    }
}
