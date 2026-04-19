package com.universalmedialibrary.services.reader

import android.content.Context
import com.universalmedialibrary.core.FormatRegistry
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.services.comic.GeminiComicService
import com.universalmedialibrary.services.epub.ReadiumAudiobookService
import com.universalmedialibrary.services.epub.ReadiumEpubService
import com.universalmedialibrary.services.epub.ReadiumPdfService
import com.universalmedialibrary.parsers.ParserFactory
import com.universalmedialibrary.parsers.DocumentParser
import com.universalmedialibrary.parsers.ParsedDocument
import com.universalmedialibrary.parsers.DocumentMetadata
import io.mockk.*
import kotlinx.coroutines.runBlocking
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import java.io.File

class UnifiedReaderServiceIntegrationTest {

    private lateinit var unifiedReaderService: UnifiedReaderService
    private val context = mockk<Context>(relaxed = true)
    private val readiumEpubService = mockk<ReadiumEpubService>(relaxed = true)
    private val readiumPdfService = mockk<ReadiumPdfService>(relaxed = true)
    private val readiumAudiobookService = mockk<ReadiumAudiobookService>(relaxed = true)
    private val geminiComicService = mockk<GeminiComicService>(relaxed = true)
    private val audioPlaybackManager = mockk<AudioPlaybackManager>(relaxed = true)
    private val formatRegistry = mockk<FormatRegistry>(relaxed = true)

    @Before
    fun setUp() {
        unifiedReaderService = UnifiedReaderService(
            context,
            readiumEpubService,
            readiumPdfService,
            readiumAudiobookService,
            geminiComicService,
            audioPlaybackManager,
            formatRegistry
        )
        mockkObject(ParserFactory)
    }

    @After
    fun tearDown() {
        unmockkObject(ParserFactory)
    }

    @Test
    fun `openPublication with mobi file should use parser registry and parser factory`() {
        runBlocking {
            // Given
            val tempFile = File.createTempFile("test", ".mobi")
            val filePath = tempFile.absolutePath

            // Mock ParserFactory to return a mock parser
            val mockParser = mockk<DocumentParser>()
            coEvery { mockParser.parse(any<String>()) } returns ParsedDocument("Parsed Content from Mock", DocumentMetadata(), null)
            every { ParserFactory.getParserForFileName(any()) } returns mockParser
            every { ParserFactory.getSupportedExtensions() } returns listOf("mobi")

            try {
                // When
                val result = unifiedReaderService.openPublication(filePath)

                // Then
                // This verification fails if the code doesn't call ParserFactory (which is the bug)
                verify(atLeast = 1) { ParserFactory.getParserForFileName(any()) }
            } finally {
                tempFile.delete()
            }
        }
    }
}
