package com.universalmedialibrary

import android.content.Context
import android.net.Uri
import androidx.test.core.app.ApplicationProvider
import androidx.test.ext.junit.runners.AndroidJUnit4
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.services.epub.EPUBReaderService
import com.universalmedialibrary.services.metadata.RealMetadataService
import kotlinx.coroutines.runBlocking
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.Mock
import org.mockito.MockitoAnnotations
import org.mockito.kotlin.whenever
import java.io.File

/**
 * Test class for EPUB and Metadata functionality
 */
@RunWith(AndroidJUnit4::class)
class EPUBMetadataTest {
    
    private lateinit var context: Context
    private lateinit var epubReaderService: EPUBReaderService
    private lateinit var realMetadataService: RealMetadataService
    
    @Mock
    private lateinit var mockApiKeyRepository: APIKeyRepository
    
    @Before
    fun setup() {
        MockitoAnnotations.openMocks(this)
        context = ApplicationProvider.getApplicationContext()
        epubReaderService = EPUBReaderService(context)
        realMetadataService = RealMetadataService(mockApiKeyRepository)
    }
    
    @Test
    fun testEPUBChapterExtraction() = runBlocking {
        // Create a test EPUB file
        val testEpub = createTestEPUBFile()
        val uri = Uri.fromFile(testEpub)
        
        // Load the EPUB
        val success = epubReaderService.loadEPUB(uri)
        assert(success) { "Failed to load EPUB file" }
        
        // Check that chapters were extracted
        val state = epubReaderService.readerState.value
        assert(state.isLoaded) { "EPUB not loaded" }
        assert(state.chapters.isNotEmpty()) { "No chapters extracted" }
        assert(state.bookTitle.isNotEmpty()) { "Book title not extracted" }
        
        println("EPUB Test Results:")
        println("Title: ${state.bookTitle}")
        println("Author: ${state.bookAuthor}")
        println("Chapters: ${state.totalChapters}")
        state.chapters.forEach { chapter ->
            println("  Chapter ${chapter.index + 1}: ${chapter.title}")
        }
        
        // Test navigation
        epubReaderService.nextChapter()
        val newState = epubReaderService.readerState.value
        assert(newState.currentChapter == 1) { "Chapter navigation failed" }
        
        // Clean up
        testEpub.delete()
    }
    
    @Test
    fun testBookMetadataFetching() = runBlocking {
        // Test with real Google Books API (no key required)
        val result = realMetadataService.searchBookMetadata(query = "Harry Potter and the Philosopher's Stone")
        
        assert(result.sources.isNotEmpty()) { "No metadata sources returned" }
        result.metadata?.let { book ->
            assert(book.title.isNotEmpty()) { "Book title is empty" }
            assert(book.authors.isNotEmpty()) { "No authors found" }
            
            println("Book Metadata Test Results:")
            println("Title: ${book.title}")
            println("Authors: ${book.authors.joinToString()}")
            println("Publisher: ${book.publisher}")
            println("ISBN-13: ${book.isbn13}")
            println("Categories: ${book.categories.joinToString()}")
            println("Sources: ${result.sources.joinToString()}")
        } ?: assert(false) { "No metadata returned" }
    }
    
    @Test
    fun testMusicMetadataFetching() = runBlocking {
        // Test with MusicBrainz API (no key required)
        val result = realMetadataService.searchMusicMetadata(artist = "The Beatles", album = "Abbey Road")
        
        result.metadata?.let { music ->
            assert(music.title.isNotEmpty()) { "Music title is empty" }
            
            println("Music Metadata Test Results:")
            println("Title: ${music.title}")
            println("Artist: ${music.artist}")
            println("Release Date: ${music.releaseDate}")
            println("MusicBrainz ID: ${music.mbid}")
        }
    }
    
    @Test
    fun testMovieMetadataWithoutAPIKey() = runBlocking {
        // Mock API key repository to return null (no API key)
        whenever(mockApiKeyRepository.getAPIKeyValue("tmdb")).thenReturn(null)
        whenever(mockApiKeyRepository.getAPIKeyValue("omdb")).thenReturn(null)
        
        val result = realMetadataService.searchMovieMetadata(title = "Inception")
        
        // Should return empty result without API keys
        assert(result.sources.isEmpty()) { "Should not have sources without API keys" }
        assert(result.metadata == null) { "Should not have metadata without API keys" }
        
        println("Movie Metadata Test (No API Key):")
        println("Sources: ${result.sources}")
        println("Metadata: ${result.metadata}")
    }
    
    @Test
    fun testEPUBSearchFunctionality() = runBlocking {
        val testEpub = createTestEPUBFile()
        val uri = Uri.fromFile(testEpub)
        
        // Load EPUB
        epubReaderService.loadEPUB(uri)
        
        // Search for text
        val searchResults = epubReaderService.searchInBook("test")
        
        println("EPUB Search Test Results:")
        println("Found ${searchResults.size} occurrences")
        searchResults.forEach { result ->
            println("  Chapter ${result.chapterIndex + 1}: ${result.context}")
        }
        
        // Clean up
        testEpub.delete()
    }
    
    private fun createTestEPUBFile(): File {
        // Create a minimal EPUB structure for testing
        val tempDir = File(context.cacheDir, "test_epub_${System.currentTimeMillis()}")
        tempDir.mkdirs()
        
        // META-INF/container.xml
        val metaInf = File(tempDir, "META-INF")
        metaInf.mkdirs()
        File(metaInf, "container.xml").writeText("""
            <?xml version="1.0" encoding="UTF-8"?>
            <container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
                <rootfiles>
                    <rootfile full-path="content.opf" media-type="application/oebps-package+xml"/>
                </rootfiles>
            </container>
        """.trimIndent())
        
        // content.opf
        File(tempDir, "content.opf").writeText("""
            <?xml version="1.0" encoding="UTF-8"?>
            <package xmlns="http://www.idpf.org/2007/opf" version="3.0">
                <metadata xmlns:dc="http://purl.org/dc/elements/1.1/">
                    <dc:title>Test EPUB Book</dc:title>
                    <dc:creator>Test Author</dc:creator>
                    <dc:language>en</dc:language>
                </metadata>
                <manifest>
                    <item id="chapter1" href="chapter1.xhtml" media-type="application/xhtml+xml"/>
                    <item id="chapter2" href="chapter2.xhtml" media-type="application/xhtml+xml"/>
                </manifest>
                <spine>
                    <itemref idref="chapter1"/>
                    <itemref idref="chapter2"/>
                </spine>
            </package>
        """.trimIndent())
        
        // Chapter 1
        File(tempDir, "chapter1.xhtml").writeText("""
            <?xml version="1.0" encoding="UTF-8"?>
            <!DOCTYPE html>
            <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Chapter 1</title>
            </head>
            <body>
                <h1>Chapter 1: Introduction</h1>
                <p>This is a test chapter with some content to test the EPUB reader functionality.</p>
                <p>It contains multiple paragraphs to test text extraction and rendering.</p>
            </body>
            </html>
        """.trimIndent())
        
        // Chapter 2
        File(tempDir, "chapter2.xhtml").writeText("""
            <?xml version="1.0" encoding="UTF-8"?>
            <!DOCTYPE html>
            <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Chapter 2</title>
            </head>
            <body>
                <h1>Chapter 2: Content</h1>
                <p>This is the second chapter with more test content.</p>
                <p>We can search for specific words in the EPUB content.</p>
            </body>
            </html>
        """.trimIndent())
        
        // Create ZIP file (EPUB is a ZIP)
        val epubFile = File(context.cacheDir, "test_book_${System.currentTimeMillis()}.epub")
        createZipFile(tempDir, epubFile)
        
        // Clean up temp directory
        tempDir.deleteRecursively()
        
        return epubFile
    }
    
    private fun createZipFile(sourceDir: File, outputFile: File) {
        val zipOutputStream = java.util.zip.ZipOutputStream(outputFile.outputStream())
        
        sourceDir.walkTopDown().forEach { file ->
            val relativePath = file.relativeTo(sourceDir).path
            if (file.isFile) {
                val entry = java.util.zip.ZipEntry(relativePath)
                zipOutputStream.putNextEntry(entry)
                file.inputStream().use { it.copyTo(zipOutputStream) }
                zipOutputStream.closeEntry()
            }
        }
        
        zipOutputStream.close()
    }
}