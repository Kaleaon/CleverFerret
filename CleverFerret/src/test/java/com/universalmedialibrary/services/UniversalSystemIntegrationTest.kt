package com.universalmedialibrary.services

import androidx.test.core.app.ApplicationProvider
import com.universalmedialibrary.services.ai.*
import com.universalmedialibrary.services.search.*
import com.universalmedialibrary.services.tagging.*
import dagger.hilt.android.testing.HiltAndroidRule
import dagger.hilt.android.testing.HiltAndroidTest
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import javax.inject.Inject
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

/**
 * Integration tests for the Universal Search & Tagging System
 * 
 * Tests the integration between:
 * - UniversalTagManager and database
 * - UniversalSearchService and search engines
 * - AI providers and content analysis
 * - Tool execution and web access
 */
@HiltAndroidTest
@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28])
class UniversalSystemIntegrationTest {

    @get:Rule
    val hiltRule = HiltAndroidRule(this)

    @Inject
    lateinit var universalTagManager: UniversalTagManager

    @Inject
    lateinit var universalSearchService: UniversalSearchService

    @Inject
    lateinit var aiContentAnalysisService: AIContentAnalysisService

    @Inject
    lateinit var aiToolsService: AIToolsService

    @Inject
    lateinit var openAIProvider: OpenAIProvider

    @Before
    fun setup() {
        hiltRule.inject()
    }

    @Test
    fun universalTagManagerIntegration() = runTest {
        // Test tag creation
        val tag = universalTagManager.createTag(
            name = "Test Tag",
            category = "Test Category",
            color = "#FF0000",
            description = "A test tag"
        )
        
        assertNotNull(tag.id)
        assertEquals("Test Tag", tag.name)
        assertEquals("Test Category", tag.category)

        // Test tag retrieval
        val retrievedTag = universalTagManager.getTag(tag.id)
        assertNotNull(retrievedTag)
        assertEquals(tag.id, retrievedTag!!.id)

        // Test tag search
        val searchResults = universalTagManager.searchTags("Test")
        assertTrue(searchResults.isNotEmpty())
        assertTrue(searchResults.any { it.id == tag.id })
    }

    @Test
    fun universalSearchServiceIntegration() = runTest {
        // Test basic search functionality
        val searchRequest = SearchRequest(
            query = "test",
            mediaTypes = setOf("BOOK", "DOCUMENT"),
            tags = emptySet(),
            limit = 10
        )

        val searchResults = universalSearchService.search(searchRequest).first()
        assertNotNull(searchResults)
        // Results may be empty if no test data exists, but service should not crash
    }

    @Test
    fun aiContentAnalysisIntegration() = runTest {
        // Test AI content analysis with sample content
        val sampleContent = """
            Chapter 1: The Beginning
            
            In a world where technology and magic coexist, a young protagonist 
            embarks on an epic journey to discover their true destiny. This is 
            a story of courage, friendship, and the power of believing in oneself.
            
            The main characters include:
            - Alex, the brave hero
            - Sarah, the wise mentor
            - Max, the loyal companion
        """.trimIndent()

        // Mock analysis without real API key
        val analysisRequest = AIAnalysisRequest(
            content = sampleContent,
            contentType = "BOOK_CHAPTER",
            analysisTypes = setOf("SUMMARY", "CHARACTERS", "THEMES", "TAGS")
        )

        // This test verifies the service structure works even without API keys
        try {
            val result = aiContentAnalysisService.analyzeContent(analysisRequest)
            // If API key is configured, verify result structure
            assertNotNull(result)
        } catch (e: Exception) {
            // Expected if no API key is configured - verify error handling
            assertTrue(e.message?.contains("API") == true || e.message?.contains("key") == true)
        }
    }

    @Test
    fun aiToolsWebAccessIntegration() = runTest {
        // Test web search tool
        val searchResult = aiToolsService.executeTool("web_search", mapOf(
            "query" to "artificial intelligence",
            "max_results" to 3
        ))

        assertNotNull(searchResult)
        assertTrue(searchResult.success)
        assertNotNull(searchResult.summary)

        // Test webpage fetch tool
        val fetchResult = aiToolsService.executeTool("fetch_webpage", mapOf(
            "url" to "https://httpbin.org/html"
        ))

        assertNotNull(fetchResult)
        assertTrue(fetchResult.success)
        assertNotNull(fetchResult.data)
    }

    @Test
    fun aiProviderIntegration() {
        // Test OpenAI provider initialization
        assertNotNull(openAIProvider)
        assertEquals("OPENAI", openAIProvider.providerId)
        assertEquals("OpenAI GPT", openAIProvider.displayName)

        // Test API key setting
        openAIProvider.setApiKey("test-key-123")
        
        // Verify key is stored (not checking actual value for security)
        // The provider should not crash with a test key
    }

    @Test
    fun searchEngineIntegration() = runTest {
        // Test book search engine
        val bookSearch = universalSearchService.getSearchEngine("BOOK")
        assertNotNull(bookSearch)

        val bookResults = bookSearch.search(SearchRequest(
            query = "adventure",
            mediaTypes = setOf("BOOK"),
            limit = 5
        ))

        assertNotNull(bookResults)

        // Test audio search engine
        val audioSearch = universalSearchService.getSearchEngine("AUDIO")
        assertNotNull(audioSearch)

        val audioResults = audioSearch.search(SearchRequest(
            query = "music",
            mediaTypes = setOf("MUSIC", "PODCAST"),
            limit = 5
        ))

        assertNotNull(audioResults)
    }

    @Test
    fun toolDetectionAndExecution() = runTest {
        // Test automatic tool detection from user messages
        val searchMessage = "Search for information about quantum computing"
        val toolRequest = aiToolsService.detectToolRequest(searchMessage)
        
        assertNotNull(toolRequest)
        assertEquals("web_search", toolRequest.toolId)
        assertEquals("quantum computing", toolRequest.parameters["query"])

        val urlMessage = "Can you fetch content from https://httpbin.org/json"
        val urlToolRequest = aiToolsService.detectToolRequest(urlMessage)
        
        assertNotNull(urlToolRequest)
        assertEquals("fetch_webpage", urlToolRequest.toolId)
        assertEquals("https://httpbin.org/json", urlToolRequest.parameters["url"])

        val libraryMessage = "Show me my books"
        val libraryToolRequest = aiToolsService.detectToolRequest(libraryMessage)
        
        assertNotNull(libraryToolRequest)
        assertEquals("browse_library", libraryToolRequest.toolId)
        assertEquals("BOOK", libraryToolRequest.parameters["media_type"])
    }

    @Test
    fun systemTagInitialization() = runTest {
        // Test that system tags are properly initialized
        val allTags = universalTagManager.getAllTags().first()
        
        // Should have at least the 65 pre-installed system tags
        assertTrue(allTags.size >= 65, "Should have at least 65 system tags, found ${allTags.size}")

        // Test specific system tags exist
        val genreTags = allTags.filter { it.category == "Genre" }
        assertTrue(genreTags.isNotEmpty(), "Should have genre tags")

        val moodTags = allTags.filter { it.category == "Mood" }
        assertTrue(moodTags.isNotEmpty(), "Should have mood tags")

        val formatTags = allTags.filter { it.category == "Format" }
        assertTrue(formatTags.isNotEmpty(), "Should have format tags")
    }

    @Test
    fun searchHistoryAndAnalytics() = runTest {
        // Perform a search to create history
        val searchRequest = SearchRequest(
            query = "test query",
            mediaTypes = setOf("BOOK"),
            limit = 10
        )

        universalSearchService.search(searchRequest)
        
        // Verify search history is recorded
        val searchHistory = universalSearchService.getSearchHistory().first()
        assertTrue(searchHistory.isNotEmpty(), "Search history should not be empty")
        assertTrue(searchHistory.any { it.query.contains("test query") })
    }

    @Test
    fun errorHandlingAndGracefulDegradation() = runTest {
        // Test error handling with invalid parameters
        val invalidSearchResult = aiToolsService.executeTool("web_search", emptyMap())
        
        assertNotNull(invalidSearchResult)
        assertTrue(!invalidSearchResult.success)
        assertTrue(invalidSearchResult.error?.contains("query") == true)

        // Test with non-existent tool
        val invalidToolResult = aiToolsService.executeTool("non_existent_tool", mapOf())
        
        assertNotNull(invalidToolResult)
        assertTrue(!invalidToolResult.success)
        assertTrue(invalidToolResult.error?.contains("Unknown tool") == true)
    }

    @Test
    fun performanceAndCaching() = runTest {
        // Test that search results are cached appropriately
        val searchRequest = SearchRequest(
            query = "performance test",
            mediaTypes = setOf("BOOK"),
            limit = 5
        )

        // First search
        val startTime = System.currentTimeMillis()
        val firstResults = universalSearchService.search(searchRequest).first()
        val firstDuration = System.currentTimeMillis() - startTime

        // Second search (should be cached/faster)
        val secondStartTime = System.currentTimeMillis()
        val secondResults = universalSearchService.search(searchRequest).first()
        val secondDuration = System.currentTimeMillis() - secondStartTime

        assertNotNull(firstResults)
        assertNotNull(secondResults)
        
        // Results should be identical for same query
        assertEquals(firstResults.size, secondResults.size)
        
        // Second search should be faster or equal (due to caching)
        assertTrue(secondDuration <= firstDuration + 50, "Second search should be faster or equal")
    }
}