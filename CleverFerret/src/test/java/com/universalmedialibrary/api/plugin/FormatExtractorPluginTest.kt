package com.universalmedialibrary.api.plugin

import android.content.Context
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.services.countEligibleFiles
import com.universalmedialibrary.services.determineMediaType
import com.universalmedialibrary.services.media.MetadataExtractionService
import com.universalmedialibrary.services.pipeline.CatalogingPipelineContext
import com.universalmedialibrary.services.pipeline.RawMetadata
import com.universalmedialibrary.services.pipeline.processors.RawExtractionProcessor
import io.mockk.mockk
import kotlinx.coroutines.runBlocking
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

class FormatExtractorPluginTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    private lateinit var registry: PluginRegistryImpl

    @Before
    fun setUp() {
        registry = PluginRegistryImpl()
        registry.hostApiVersion = "1.0.0"
        PluginRegistryImpl.defaultInstance = registry
        com.universalmedialibrary.services.setPluginRegistry(registry)
    }

    @After
    fun tearDown() {
        com.universalmedialibrary.services.setPluginRegistry(null)
        PluginRegistryImpl.defaultInstance = null
    }

    private class DummyFormatExtractorPlugin(
        override val id: String = "dummy-extractor-plugin",
        override val supportedExtensions: Set<String> = setOf("cstm", "novel"),
        override val mediaCategory: String = "BOOK",
        override var isEnabled: Boolean = true,
        private val shouldFail: Boolean = false
    ) : FormatExtractorPlugin {

        override val name: String = "Dummy Format Extractor"
        override val version: String = "1.0.0"
        override val supportedMimeTypes: Set<String> = setOf("application/x-custom-book")
        private val customSignature: ByteArray = byteArrayOf(0x43, 0x53, 0x54, 0x4D) // "CSTM"

        override val manifest: PluginManifest = PluginManifest(
            id = id,
            name = name,
            version = version,
            minHostVersion = "1.0.0",
            maxHostVersion = "2.0.0",
            author = "TestAuthor",
            description = "Custom test extractor"
        )

        override val configurationOptions: List<ConfigurationOption> = emptyList()

        override suspend fun initialize(): Result<Unit> = Result.success(Unit)
        override suspend fun shutdown() {
            // No-op for dummy test plugin
        }
        override suspend fun healthCheck(): PluginHealth = PluginHealth(HealthStatus.HEALTHY, "OK")

        override fun matchesSignature(headerBytes: ByteArray): Boolean {
            if (headerBytes.size < customSignature.size) return false
            return headerBytes.take(customSignature.size).toByteArray().contentEquals(customSignature)
        }

        override suspend fun extractRawMetadata(file: File): RawMetadata {
            if (shouldFail) {
                error("Corrupt custom format file: ${file.name}")
            }
            return RawMetadata(
                title = "Extracted: ${file.nameWithoutExtension}",
                creators = listOf("Custom Author"),
                publisher = "Custom Publisher",
                format = file.extension.uppercase(),
                confidenceScore = 0.92f,
                source = "PLUGIN:$id"
            )
        }
    }

    @Test
    fun `test register format extractor indexes case-insensitively by extension and mime`() {
        val plugin = DummyFormatExtractorPlugin()
        registry.registerPlugin(plugin)

        assertEquals(1, registry.getFormatExtractors().size)

        // Exact match
        val byLower = registry.getFormatExtractorByExtension("cstm")
        assertNotNull(byLower)
        assertEquals(plugin.id, byLower?.id)

        // Uppercase and with dot
        val byUpper = registry.getFormatExtractorByExtension(".CSTM")
        assertNotNull(byUpper)
        assertEquals(plugin.id, byUpper?.id)

        // Other supported extension
        val byOther = registry.getFormatExtractorByExtension("novel")
        assertNotNull(byOther)
        assertEquals(plugin.id, byOther?.id)

        // By MIME type
        val byMime = registry.getFormatExtractorByMimeType("APPLICATION/X-CUSTOM-BOOK")
        assertNotNull(byMime)
        assertEquals(plugin.id, byMime?.id)

        // Non-existent extension
        assertNull(registry.getFormatExtractorByExtension("unknown"))
    }

    @Test
    fun `test query format extractor by signature`() {
        val plugin = DummyFormatExtractorPlugin()
        registry.registerPlugin(plugin)

        val matchingHeader = byteArrayOf(0x43, 0x53, 0x54, 0x4D, 0x00, 0x01)
        val nonMatchingHeader = byteArrayOf(0x00, 0x00, 0x00, 0x00)

        assertNotNull(registry.getFormatExtractorBySignature(matchingHeader))
        assertNull(registry.getFormatExtractorBySignature(nonMatchingHeader))
    }

    @Test
    fun `test unregister and disable format extractor updates queries`() {
        val plugin = DummyFormatExtractorPlugin()
        registry.registerFormatExtractor(plugin)

        assertNotNull(registry.getFormatExtractorByExtension("cstm"))

        // Disable plugin
        registry.setPluginEnabled(plugin.id, false)
        assertNull(registry.getFormatExtractorByExtension("cstm"))
        assertTrue(registry.getFormatExtractors().isEmpty())

        // Re-enable plugin
        registry.setPluginEnabled(plugin.id, true)
        assertNotNull(registry.getFormatExtractorByExtension("cstm"))
        assertEquals(1, registry.getFormatExtractors().size)

        // Unregister plugin
        registry.unregisterFormatExtractor(plugin.id)
        assertNull(registry.getFormatExtractorByExtension("cstm"))
        assertTrue(registry.getFormatExtractors().isEmpty())
    }

    @Test
    fun `test determineMediaType detects custom extension from plugin`() {
        val customFile = tempFolder.newFile("my_story.cstm")
        val standardBook = tempFolder.newFile("standard_story.epub")
        val unknownFile = tempFolder.newFile("sample.random")

        // Before registration: custom is unrecognized
        assertNull(determineMediaType(customFile, registry))

        // Register custom plugin
        registry.registerPlugin(DummyFormatExtractorPlugin())

        // After registration: custom is recognized as BOOK
        assertEquals("BOOK", determineMediaType(customFile, registry))

        // Standard format remains BOOK via built-in parser
        assertEquals("BOOK", determineMediaType(standardBook, registry))

        // Unknown format remains null
        assertNull(determineMediaType(unknownFile, registry))
    }

    @Test
    fun `test built-in formats take priority over plugin extractors`() {
        // Plugin claiming to handle mp3 as "BOOK"
        val roguePlugin = DummyFormatExtractorPlugin(
            id = "rogue-mp3-plugin",
            supportedExtensions = setOf("mp3"),
            mediaCategory = "BOOK"
        )
        registry.registerPlugin(roguePlugin)

        val mp3File = tempFolder.newFile("audio_track.mp3")

        // Built-in parser must take priority -> "MUSIC"
        assertEquals("MUSIC", determineMediaType(mp3File, registry))
    }

    @Test
    fun `test countEligibleFiles includes files recognized by registered plugins`() {
        val dir = tempFolder.newFolder("scan_root")
        File(dir, "book1.epub").createNewFile()
        File(dir, "song1.mp3").createNewFile()
        File(dir, "custom.cstm").createNewFile()
        File(dir, "ignore.xyz").createNewFile()

        // Without plugin registered: epub and mp3 = 2 files
        assertEquals(2, countEligibleFiles(dir, null, registry))

        // Register plugin for cstm
        registry.registerPlugin(DummyFormatExtractorPlugin())

        // With plugin: epub, mp3, and cstm = 3 files
        assertEquals(3, countEligibleFiles(dir, null, registry))
    }

    @Test
    fun `test MetadataExtractionService delegates to plugin when built-in parsers are absent`() = runBlocking {
        val context = mockk<Context>(relaxed = true)
        val mediaRepository = mockk<MediaRepository>(relaxed = true)
        val service = MetadataExtractionService(context, mediaRepository, registry)

        registry.registerPlugin(DummyFormatExtractorPlugin())

        val customFile = tempFolder.newFile("custom_book.cstm")
        val metadata = service.extractRawMetadata(customFile, "BOOK")

        assertEquals("Extracted: custom_book", metadata.title)
        assertEquals(listOf("Custom Author"), metadata.creators)
        assertEquals("Custom Publisher", metadata.publisher)
        assertEquals("CSTM", metadata.format)
        assertEquals(0.92f, metadata.confidenceScore, 0.001f)
        assertEquals("PLUGIN:dummy-extractor-plugin", metadata.source)
    }

    @Test
    fun `test MetadataExtractionService catches plugin exceptions safely`() = runBlocking {
        val context = mockk<Context>(relaxed = true)
        val mediaRepository = mockk<MediaRepository>(relaxed = true)
        val service = MetadataExtractionService(context, mediaRepository, registry)

        // Plugin that throws during extraction
        registry.registerPlugin(DummyFormatExtractorPlugin(shouldFail = true))

        val customFile = tempFolder.newFile("broken_book.cstm")
        val metadata = service.extractRawMetadata(customFile, "BOOK")

        // Extraction should not throw and should return error fallback metadata
        assertEquals("broken_book", metadata.title)
        assertEquals("CSTM", metadata.format)
        assertTrue(metadata.source.startsWith("PLUGIN_EXTRACTION_ERROR:"))
    }

    @Test
    fun `test RawExtractionProcessor processes custom formats with PluginRegistry`() = runBlocking {
        val context = mockk<Context>(relaxed = true)
        val mediaRepository = mockk<MediaRepository>(relaxed = true)
        val service = MetadataExtractionService(context, mediaRepository, registry)
        val processor = RawExtractionProcessor(service, registry)

        registry.registerPlugin(DummyFormatExtractorPlugin())

        val customFile = tempFolder.newFile("pipeline_doc.novel")
        val pipelineContext = CatalogingPipelineContext(
            file = customFile,
            mediaType = "BOOK",
            libraryId = 1L
        )

        val resultContext = processor.process(pipelineContext)

        assertNotNull(resultContext.rawMetadata)
        assertEquals("Extracted: pipeline_doc", resultContext.rawMetadata?.title)
        assertEquals("PLUGIN:dummy-extractor-plugin", resultContext.metadataSource)
    }
}
