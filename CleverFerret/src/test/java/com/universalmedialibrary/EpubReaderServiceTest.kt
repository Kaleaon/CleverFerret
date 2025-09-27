package com.universalmedialibrary

import com.universalmedialibrary.services.epub.EpubReaderService
import com.universalmedialibrary.services.epub.EpubReaderState
import kotlinx.coroutines.runBlocking
import org.junit.Before
import org.junit.Test
import org.junit.Assert.*
import org.mockito.Mock
import org.mockito.MockitoAnnotations
import android.content.Context
import java.io.File

/**
 * Unit test class for EpubReaderService functionality
 */
class EpubReaderServiceTest {
    
    @Mock
    private lateinit var context: Context
    
    private lateinit var epubReaderService: EpubReaderService
    
    @Before
    fun setup() {
        MockitoAnnotations.openMocks(this)
        epubReaderService = EpubReaderService(context)
    }
    
    @Test
    fun testEpubReaderServiceInitialization() {
        assertNotNull("EpubReaderService should be initialized", epubReaderService)
        
        val initialState = epubReaderService.readerState.value
        assertFalse("Should not be loading initially", initialState.isLoading)
        assertFalse("Should not be loaded initially", initialState.isLoaded)
        assertEquals("Should have empty title initially", "", initialState.bookTitle)
        assertEquals("Should have zero chapters initially", 0, initialState.totalChapters)
    }
    
    @Test
    fun testEpubReaderStateProperties() {
        val state = epubReaderService.readerState.value
        
        // Test computed properties
        assertFalse("hasError should be false when no error", state.hasError)
        assertFalse("canGoNext should be false when not loaded", state.canGoNext)
        assertFalse("canGoPrevious should be false when not loaded", state.canGoPrevious)
        assertEquals("progress should be 0 when no chapters", 0f, state.progress, 0.001f)
    }
    
    @Test
    fun testEpubReaderStateWithError() {
        val stateWithError = EpubReaderState(error = "Test error")
        assertTrue("hasError should be true when error is present", stateWithError.hasError)
    }
    
    @Test
    fun testEpubReaderStateWithChapters() {
        val stateWithChapters = EpubReaderState(
            isLoaded = true,
            totalChapters = 5,
            currentChapter = 2
        )
        
        assertTrue("canGoNext should be true when not at last chapter", stateWithChapters.canGoNext)
        assertTrue("canGoPrevious should be true when not at first chapter", stateWithChapters.canGoPrevious)
        assertEquals("progress should be calculated correctly", 0.6f, stateWithChapters.progress, 0.001f)
    }
    
    @Test
    fun testDocumentContentWhenNotLoaded() {
        val documentContent = epubReaderService.getDocumentContent()
        assertNull("Should return null when no book is loaded", documentContent)
    }
    
    @Test
    fun testNavigationWhenNotLoaded() {
        assertFalse("nextChapter should return false when not loaded", epubReaderService.nextChapter())
        assertFalse("previousChapter should return false when not loaded", epubReaderService.previousChapter())
        assertFalse("jumpToChapter should return false when not loaded", epubReaderService.jumpToChapter(0))
    }
    
    @Test
    fun testGetCurrentChapterContentWhenNotLoaded() {
        val content = epubReaderService.getCurrentChapterContent()
        assertNull("Should return null when not loaded", content)
    }
    
    @Test
    fun testGetChapterWhenNotLoaded() {
        val chapter = epubReaderService.getChapter(0)
        assertNull("Should return null when not loaded", chapter)
    }
    
    @Test
    fun testGetBookMetadataWhenNotLoaded() {
        val metadata = epubReaderService.getBookMetadata()
        assertNull("Should return null when not loaded", metadata)
    }
}