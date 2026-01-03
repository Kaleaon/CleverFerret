package com.universalmedialibrary.services.ai

import android.content.Context
import android.content.Intent
import android.net.Uri
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.jsonArray
import kotlinx.serialization.json.jsonObject
import kotlinx.serialization.json.jsonPrimitive
import okhttp3.OkHttpClient
import okhttp3.Request
import dagger.hilt.android.qualifiers.ApplicationContext
import java.net.URLEncoder
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service providing AI-accessible tools for SynthChat.
 * Enables AI characters to perform actions like web search, browsing, downloading, etc.
 * 
 * Enhanced with reading progress awareness for book discussions.
 */
@Singleton
class AIToolsService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val aiContentCacheService: AIContentCacheService,
    private val aiLibraryBrowserService: AILibraryBrowserService
) {
    // Lazy-injected services for reading progress (set via setter to avoid circular dependencies)
    private var aiReadingProgressService: AIReadingProgressService? = null
    private var aiBookDiscussionService: AIBookDiscussionService? = null
    
    /**
     * Set the AI Reading Progress Service for enhanced reading tools
     */
    fun setAIReadingProgressService(service: AIReadingProgressService) {
        aiReadingProgressService = service
    }
    
    /**
     * Set the AI Book Discussion Service for book discussion tools
     */
    fun setAIBookDiscussionService(service: AIBookDiscussionService) {
        aiBookDiscussionService = service
    }
    private val json = Json { ignoreUnknownKeys = true }
    
    private val httpClient = OkHttpClient.Builder()
        .connectTimeout(30, TimeUnit.SECONDS)
        .readTimeout(30, TimeUnit.SECONDS)
        .build()
    
    private val _toolExecutionLog = MutableStateFlow<List<ToolExecution>>(emptyList())
    val toolExecutionLog: StateFlow<List<ToolExecution>> = _toolExecutionLog.asStateFlow()
    
    private val _isExecutingTool = MutableStateFlow(false)
    val isExecutingTool: StateFlow<Boolean> = _isExecutingTool.asStateFlow()
    
    /**
     * All available tools that AI can use
     */
    val availableTools: List<AITool> = listOf(
        AITool(
            id = "web_search",
            name = "Web Search",
            description = "Search the web for information using DuckDuckGo",
            parameters = listOf(
                ToolParameter("query", "string", "The search query", required = true),
                ToolParameter("max_results", "int", "Maximum number of results (default: 5)", required = false)
            )
        ),
        AITool(
            id = "fetch_webpage",
            name = "Fetch Webpage",
            description = "Fetch and extract text content from a webpage URL",
            parameters = listOf(
                ToolParameter("url", "string", "The URL to fetch", required = true)
            )
        ),
        AITool(
            id = "download_pdf",
            name = "Download PDF",
            description = "Download and cache a PDF document from a URL",
            parameters = listOf(
                ToolParameter("url", "string", "The PDF URL", required = true),
                ToolParameter("name", "string", "A name for the document", required = false)
            )
        ),
        AITool(
            id = "download_article",
            name = "Download Article",
            description = "Download and cache an article/webpage as readable text",
            parameters = listOf(
                ToolParameter("url", "string", "The article URL", required = true),
                ToolParameter("name", "string", "A name for the article", required = false)
            )
        ),
        AITool(
            id = "browse_library",
            name = "Browse Library",
            description = "Browse the user's media library (books, movies, music, comics)",
            parameters = listOf(
                ToolParameter("media_type", "string", "Type: BOOK, MOVIE, MUSIC, COMIC, or ALL", required = false),
                ToolParameter("query", "string", "Search query for title/author", required = false),
                ToolParameter("limit", "int", "Maximum results (default: 20)", required = false)
            )
        ),
        AITool(
            id = "get_library_item",
            name = "Get Library Item",
            description = "Get detailed information about a specific library item",
            parameters = listOf(
                ToolParameter("item_id", "long", "The media item ID", required = true)
            )
        ),
        AITool(
            id = "search_cached_content",
            name = "Search Cached Content",
            description = "Search through previously downloaded/cached content",
            parameters = listOf(
                ToolParameter("query", "string", "Search query", required = true)
            )
        ),
        AITool(
            id = "get_reading_progress",
            name = "Get Reading Progress",
            description = "Get the user's reading progress for books",
            parameters = listOf(
                ToolParameter("book_id", "long", "Optional specific book ID", required = false)
            )
        ),
        AITool(
            id = "get_recommendations",
            name = "Get Recommendations",
            description = "Get content recommendations based on user's library",
            parameters = listOf(
                ToolParameter("media_type", "string", "Type: BOOK, MOVIE, MUSIC, COMIC", required = false),
                ToolParameter("based_on", "string", "Base recommendations on: recent, favorites, or genre", required = false)
            )
        ),
        
        // ==================== Enhanced Reading Progress Tools ====================
        
        AITool(
            id = "get_current_book",
            name = "Get Current Book",
            description = "Get detailed information about the book(s) the user is currently reading, including progress, reading time, and estimated completion",
            parameters = listOf(
                ToolParameter("limit", "int", "Maximum number of books to return (default: 5)", required = false)
            )
        ),
        AITool(
            id = "get_book_context",
            name = "Get Book Discussion Context",
            description = "Get rich context about a specific book for discussion, including progress, themes, spoiler guidelines, and suggested topics",
            parameters = listOf(
                ToolParameter("book_id", "long", "The book ID to get context for", required = true)
            )
        ),
        AITool(
            id = "get_reading_position",
            name = "Get Reading Position",
            description = "Get the user's exact position in a book with spoiler-awareness guidelines",
            parameters = listOf(
                ToolParameter("book_id", "long", "The book ID", required = true)
            )
        ),
        AITool(
            id = "get_reading_history",
            name = "Get Reading History",
            description = "Get the user's reading history summary including books completed, time spent reading, and patterns",
            parameters = listOf(
                ToolParameter("days", "int", "Number of days to look back (default: 30)", required = false)
            )
        ),
        AITool(
            id = "get_completed_books",
            name = "Get Completed Books",
            description = "Get a list of books the user has finished reading",
            parameters = listOf(
                ToolParameter("limit", "int", "Maximum number of books to return (default: 20)", required = false)
            )
        ),
        AITool(
            id = "get_reading_context_summary",
            name = "Get Reading Context Summary",
            description = "Get a formatted summary of all current reading for AI context injection",
            parameters = emptyList()
        ),
        AITool(
            id = "get_discussion_questions",
            name = "Get Discussion Questions",
            description = "Generate spoiler-safe discussion questions for a book based on reading progress",
            parameters = listOf(
                ToolParameter("book_id", "long", "The book ID", required = true),
                ToolParameter("count", "int", "Number of questions to generate (default: 3)", required = false)
            )
        ),
        AITool(
            id = "get_discussion_guidance",
            name = "Get Discussion Guidance",
            description = "Get guidance for AI on how to discuss a book based on reading progress (what to avoid, suggested approach)",
            parameters = listOf(
                ToolParameter("book_id", "long", "The book ID", required = true)
            )
        ),
        AITool(
            id = "get_reading_journey",
            name = "Get Reading Journey",
            description = "Get a summary of the user's reading journey with a specific book including discussions and milestones",
            parameters = listOf(
                ToolParameter("book_id", "long", "The book ID", required = true),
                ToolParameter("character_id", "long", "The AI character ID for retrieving past discussions", required = true)
            )
        ),
        AITool(
            id = "store_book_discussion",
            name = "Store Book Discussion",
            description = "Store a book discussion as a memory for future reference",
            parameters = listOf(
                ToolParameter("character_id", "long", "The AI character ID", required = true),
                ToolParameter("book_id", "long", "The book ID", required = true),
                ToolParameter("book_title", "string", "The book title", required = true),
                ToolParameter("topic", "string", "The discussion topic", required = true),
                ToolParameter("user_thoughts", "string", "What the user shared", required = true),
                ToolParameter("ai_response", "string", "AI's response summary", required = true),
                ToolParameter("progress", "float", "Current reading progress (0-100)", required = true)
            )
        ),
        AITool(
            id = "store_book_opinion",
            name = "Store Book Opinion",
            description = "Store the user's opinion about a book for future reference",
            parameters = listOf(
                ToolParameter("character_id", "long", "The AI character ID", required = true),
                ToolParameter("book_id", "long", "The book ID", required = true),
                ToolParameter("book_title", "string", "The book title", required = true),
                ToolParameter("opinion_type", "string", "Type: OVERALL_RATING, FAVORITE_PART, DISLIKED_PART, CHARACTER_OPINION, THEME_REFLECTION, RECOMMENDATION, EMOTIONAL_REACTION", required = true),
                ToolParameter("opinion", "string", "The user's opinion", required = true),
                ToolParameter("progress", "float", "Current reading progress (0-100)", required = true)
            )
        ),
        AITool(
            id = "get_book_opinions",
            name = "Get Book Opinions",
            description = "Retrieve stored opinions the user has shared about a book",
            parameters = listOf(
                ToolParameter("character_id", "long", "The AI character ID", required = true),
                ToolParameter("book_id", "long", "The book ID", required = true)
            )
        ),
        AITool(
            id = "initiate_book_discussion",
            name = "Initiate Book Discussion",
            description = "Start a book discussion session with full context for AI",
            parameters = listOf(
                ToolParameter("book_id", "long", "The book ID", required = true),
                ToolParameter("character_id", "long", "The AI character ID", required = true)
            )
        )
    )
    
    /**
     * Execute a tool by ID with given parameters
     */
    suspend fun executeTool(toolId: String, parameters: Map<String, Any>): ToolResult {
        _isExecutingTool.value = true
        
        val startTime = System.currentTimeMillis()
        val result = try {
            when (toolId) {
                "web_search" -> executeWebSearch(parameters)
                "fetch_webpage" -> executeFetchWebpage(parameters)
                "download_pdf" -> executeDownloadPdf(parameters)
                "download_article" -> executeDownloadArticle(parameters)
                "browse_library" -> executeBrowseLibrary(parameters)
                "get_library_item" -> executeGetLibraryItem(parameters)
                "search_cached_content" -> executeSearchCachedContent(parameters)
                "get_reading_progress" -> executeGetReadingProgress(parameters)
                "get_recommendations" -> executeGetRecommendations(parameters)
                
                // Enhanced Reading Progress Tools
                "get_current_book" -> executeGetCurrentBook(parameters)
                "get_book_context" -> executeGetBookContext(parameters)
                "get_reading_position" -> executeGetReadingPosition(parameters)
                "get_reading_history" -> executeGetReadingHistory(parameters)
                "get_completed_books" -> executeGetCompletedBooks(parameters)
                "get_reading_context_summary" -> executeGetReadingContextSummary(parameters)
                "get_discussion_questions" -> executeGetDiscussionQuestions(parameters)
                "get_discussion_guidance" -> executeGetDiscussionGuidance(parameters)
                "get_reading_journey" -> executeGetReadingJourney(parameters)
                "store_book_discussion" -> executeStoreBookDiscussion(parameters)
                "store_book_opinion" -> executeStoreBookOpinion(parameters)
                "get_book_opinions" -> executeGetBookOpinions(parameters)
                "initiate_book_discussion" -> executeInitiateBookDiscussion(parameters)
                
                else -> ToolResult(
                    success = false,
                    toolId = toolId,
                    error = "Unknown tool: $toolId"
                )
            }
        } catch (e: Exception) {
            ToolResult(
                success = false,
                toolId = toolId,
                error = e.message ?: "Tool execution failed"
            )
        }
        
        val endTime = System.currentTimeMillis()
        
        // Log execution
        val execution = ToolExecution(
            toolId = toolId,
            parameters = parameters,
            result = result,
            timestamp = startTime,
            durationMs = endTime - startTime
        )
        _toolExecutionLog.value = listOf(execution) + _toolExecutionLog.value.take(99)
        
        _isExecutingTool.value = false
        return result
    }
    
    /**
     * Parse a natural language tool request and extract tool ID and parameters
     */
    fun parseToolRequest(message: String): ToolRequest? {
        val lowerMessage = message.lowercase()
        
        // Detect search intent
        if (lowerMessage.contains("search for") || lowerMessage.contains("look up") || 
            lowerMessage.contains("find information about")) {
            val query = extractSearchQuery(message)
            if (query != null) {
                return ToolRequest("web_search", mapOf("query" to query))
            }
        }
        
        // Detect URL fetch intent
        val urlPattern = Regex("https?://[\\w\\-.]+(?:\\.[a-z]{2,})+[/\\w\\-._~:/?#\\[\\]@!$&'()*+,;=]*", RegexOption.IGNORE_CASE)
        val urlMatch = urlPattern.find(message)
        if (urlMatch != null) {
            val url = urlMatch.value
            return when {
                url.endsWith(".pdf", ignoreCase = true) -> {
                    ToolRequest("download_pdf", mapOf("url" to url))
                }
                lowerMessage.contains("download") || lowerMessage.contains("save") -> {
                    ToolRequest("download_article", mapOf("url" to url))
                }
                else -> {
                    ToolRequest("fetch_webpage", mapOf("url" to url))
                }
            }
        }
        
        // Detect library browse intent
        if (lowerMessage.contains("my library") || lowerMessage.contains("my books") ||
            lowerMessage.contains("my movies") || lowerMessage.contains("my music") ||
            lowerMessage.contains("my comics") || lowerMessage.contains("what do i have")) {
            val mediaType = when {
                lowerMessage.contains("book") -> "BOOK"
                lowerMessage.contains("movie") || lowerMessage.contains("film") -> "MOVIE"
                lowerMessage.contains("music") || lowerMessage.contains("song") -> "MUSIC"
                lowerMessage.contains("comic") -> "COMIC"
                else -> "ALL"
            }
            return ToolRequest("browse_library", mapOf("media_type" to mediaType))
        }
        
        // Detect reading progress intent
        if (lowerMessage.contains("reading progress") || lowerMessage.contains("where am i in") ||
            lowerMessage.contains("what page") || lowerMessage.contains("how far")) {
            return ToolRequest("get_reading_progress", emptyMap())
        }
        
        // Detect current book intent
        if (lowerMessage.contains("currently reading") || lowerMessage.contains("what am i reading") ||
            lowerMessage.contains("current book") || lowerMessage.contains("reading now") ||
            lowerMessage.contains("what book")) {
            return ToolRequest("get_current_book", emptyMap())
        }
        
        // Detect book discussion intent
        if (lowerMessage.contains("discuss") && (lowerMessage.contains("book") || lowerMessage.contains("reading"))) {
            return ToolRequest("get_reading_context_summary", emptyMap())
        }
        
        // Detect reading history intent
        if (lowerMessage.contains("reading history") || lowerMessage.contains("reading stats") ||
            lowerMessage.contains("how much have i read") || lowerMessage.contains("reading time")) {
            return ToolRequest("get_reading_history", mapOf("days" to 30))
        }
        
        // Detect completed books intent
        if (lowerMessage.contains("finished") && lowerMessage.contains("book") ||
            lowerMessage.contains("completed") && lowerMessage.contains("book") ||
            lowerMessage.contains("books i've read")) {
            return ToolRequest("get_completed_books", emptyMap())
        }
        
        // Detect recommendation intent
        if (lowerMessage.contains("recommend") || lowerMessage.contains("suggestion") ||
            lowerMessage.contains("what should i")) {
            val mediaType = when {
                lowerMessage.contains("book") || lowerMessage.contains("read") -> "BOOK"
                lowerMessage.contains("movie") || lowerMessage.contains("watch") -> "MOVIE"
                lowerMessage.contains("music") || lowerMessage.contains("listen") -> "MUSIC"
                lowerMessage.contains("comic") -> "COMIC"
                else -> null
            }
            return ToolRequest("get_recommendations", 
                if (mediaType != null) mapOf("media_type" to mediaType) else emptyMap())
        }
        
        return null
    }
    
    private fun extractSearchQuery(message: String): String? {
        val patterns = listOf(
            Regex("search for [\"']?(.+?)[\"']?(?:\\.|$)", RegexOption.IGNORE_CASE),
            Regex("look up [\"']?(.+?)[\"']?(?:\\.|$)", RegexOption.IGNORE_CASE),
            Regex("find information about [\"']?(.+?)[\"']?(?:\\.|$)", RegexOption.IGNORE_CASE)
        )
        
        for (pattern in patterns) {
            pattern.find(message)?.groupValues?.getOrNull(1)?.let { return it.trim() }
        }
        return null
    }
    
    // ==================== Tool Implementations ====================
    
    private suspend fun executeWebSearch(params: Map<String, Any>): ToolResult = withContext(Dispatchers.IO) {
        val query = params["query"]?.toString() ?: return@withContext ToolResult(
            success = false,
            toolId = "web_search",
            error = "Missing required parameter: query"
        )
        val maxResults = (params["max_results"] as? Number)?.toInt() ?: 5
        
        try {
            // Use DuckDuckGo instant answer API (no API key required)
            val encodedQuery = URLEncoder.encode(query, "UTF-8")
            val request = Request.Builder()
                .url("https://api.duckduckgo.com/?q=$encodedQuery&format=json&no_html=1&skip_disambig=1")
                .build()
            
            val response = httpClient.newCall(request).execute()
            
            if (response.isSuccessful) {
                val body = response.body?.string() ?: ""
                val jsonResponse = json.decodeFromString<JsonObject>(body)
                
                val results = mutableListOf<SearchResult>()
                
                // Abstract (main answer)
                val abstract = jsonResponse["Abstract"]?.jsonPrimitive?.content
                val abstractSource = jsonResponse["AbstractSource"]?.jsonPrimitive?.content
                val abstractUrl = jsonResponse["AbstractURL"]?.jsonPrimitive?.content
                
                if (!abstract.isNullOrBlank()) {
                    results.add(SearchResult(
                        title = abstractSource ?: "Result",
                        snippet = abstract,
                        url = abstractUrl ?: ""
                    ))
                }
                
                // Related topics
                jsonResponse["RelatedTopics"]?.jsonArray?.take(maxResults - results.size)?.forEach { topic ->
                    val topicObj = topic.jsonObject
                    val text = topicObj["Text"]?.jsonPrimitive?.content ?: ""
                    val url = topicObj["FirstURL"]?.jsonPrimitive?.content ?: ""
                    if (text.isNotBlank()) {
                        results.add(SearchResult(
                            title = text.take(50) + if (text.length > 50) "..." else "",
                            snippet = text,
                            url = url
                        ))
                    }
                }
                
                ToolResult(
                    success = true,
                    toolId = "web_search",
                    data = mapOf(
                        "query" to query,
                        "results" to results.map { mapOf("title" to it.title, "snippet" to it.snippet, "url" to it.url) }
                    ),
                    summary = if (results.isNotEmpty()) {
                        "Found ${results.size} result(s) for \"$query\":\n" +
                        results.mapIndexed { i, r -> "${i + 1}. ${r.title}: ${r.snippet.take(100)}..." }.joinToString("\n")
                    } else {
                        "No direct results found for \"$query\". Try a different query."
                    }
                )
            } else {
                ToolResult(
                    success = false,
                    toolId = "web_search",
                    error = "Search request failed: ${response.code}"
                )
            }
        } catch (e: Exception) {
            ToolResult(
                success = false,
                toolId = "web_search",
                error = "Search failed: ${e.message}"
            )
        }
    }
    
    private suspend fun executeFetchWebpage(params: Map<String, Any>): ToolResult = withContext(Dispatchers.IO) {
        val url = params["url"]?.toString() ?: return@withContext ToolResult(
            success = false,
            toolId = "fetch_webpage",
            error = "Missing required parameter: url"
        )
        
        try {
            val request = Request.Builder()
                .url(url)
                .addHeader("User-Agent", "Mozilla/5.0 (compatible; CleverFerret/1.0)")
                .build()
            
            val response = httpClient.newCall(request).execute()
            
            if (response.isSuccessful) {
                val html = response.body?.string() ?: ""
                val text = extractTextFromHtml(html)
                val truncatedText = if (text.length > 4000) text.take(4000) + "...[truncated]" else text
                
                ToolResult(
                    success = true,
                    toolId = "fetch_webpage",
                    data = mapOf(
                        "url" to url,
                        "content" to truncatedText,
                        "length" to text.length
                    ),
                    summary = "Fetched content from $url (${text.length} characters):\n\n$truncatedText"
                )
            } else {
                ToolResult(
                    success = false,
                    toolId = "fetch_webpage",
                    error = "Failed to fetch webpage: HTTP ${response.code}"
                )
            }
        } catch (e: Exception) {
            ToolResult(
                success = false,
                toolId = "fetch_webpage",
                error = "Failed to fetch webpage: ${e.message}"
            )
        }
    }
    
    private suspend fun executeDownloadPdf(params: Map<String, Any>): ToolResult {
        val url = params["url"]?.toString() ?: return ToolResult(
            success = false,
            toolId = "download_pdf",
            error = "Missing required parameter: url"
        )
        val name = params["name"]?.toString()
        
        val result = aiContentCacheService.downloadAndCachePdf(url, name)
        
        return if (result.isSuccess) {
            val cachedItem = result.getOrNull()
            ToolResult(
                success = true,
                toolId = "download_pdf",
                data = mapOf(
                    "url" to url,
                    "cached_id" to (cachedItem?.id ?: ""),
                    "name" to (cachedItem?.name ?: name ?: "PDF")
                ),
                summary = "Successfully downloaded and cached PDF: ${cachedItem?.name ?: name}"
            )
        } else {
            ToolResult(
                success = false,
                toolId = "download_pdf",
                error = result.exceptionOrNull()?.message ?: "Download failed"
            )
        }
    }
    
    private suspend fun executeDownloadArticle(params: Map<String, Any>): ToolResult {
        val url = params["url"]?.toString() ?: return ToolResult(
            success = false,
            toolId = "download_article",
            error = "Missing required parameter: url"
        )
        val name = params["name"]?.toString()
        
        val result = aiContentCacheService.downloadAndCacheArticle(url, name)
        
        return if (result.isSuccess) {
            val cachedItem = result.getOrNull()
            ToolResult(
                success = true,
                toolId = "download_article",
                data = mapOf(
                    "url" to url,
                    "cached_id" to (cachedItem?.id ?: ""),
                    "name" to (cachedItem?.name ?: name ?: "Article")
                ),
                summary = "Successfully downloaded and cached article: ${cachedItem?.name ?: name}"
            )
        } else {
            ToolResult(
                success = false,
                toolId = "download_article",
                error = result.exceptionOrNull()?.message ?: "Download failed"
            )
        }
    }
    
    private suspend fun executeBrowseLibrary(params: Map<String, Any>): ToolResult {
        val mediaType = params["media_type"]?.toString()?.uppercase()
        val query = params["query"]?.toString()
        val limit = (params["limit"] as? Number)?.toInt() ?: 20
        
        val items = aiLibraryBrowserService.browseLibrary(
            mediaType = mediaType,
            searchQuery = query,
            limit = limit
        )
        
        return ToolResult(
            success = true,
            toolId = "browse_library",
            data = mapOf(
                "items" to items.map { item ->
                    mapOf(
                        "id" to item.id,
                        "title" to item.title,
                        "type" to item.mediaType,
                        "author" to (item.author ?: ""),
                        "year" to (item.year ?: ""),
                        "hasProgress" to item.hasProgress
                    )
                },
                "total" to items.size
            ),
            summary = if (items.isNotEmpty()) {
                "Found ${items.size} item(s) in your library:\n" +
                items.take(10).mapIndexed { i, item -> 
                    "${i + 1}. ${item.title}" + (item.author?.let { " by $it" } ?: "") + " (${item.mediaType})"
                }.joinToString("\n")
            } else {
                "No items found matching your criteria."
            }
        )
    }
    
    private suspend fun executeGetLibraryItem(params: Map<String, Any>): ToolResult {
        val itemId = (params["item_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "get_library_item",
            error = "Missing required parameter: item_id"
        )
        
        val item = aiLibraryBrowserService.getLibraryItemDetails(itemId)
        
        return if (item != null) {
            ToolResult(
                success = true,
                toolId = "get_library_item",
                data = mapOf(
                    "id" to item.id,
                    "title" to item.title,
                    "type" to item.mediaType,
                    "author" to (item.author ?: ""),
                    "year" to (item.year ?: ""),
                    "summary" to (item.summary ?: ""),
                    "genres" to item.genres,
                    "progress" to (item.progress ?: 0f),
                    "rating" to (item.rating ?: 0f)
                ),
                summary = buildString {
                    appendLine("**${item.title}**")
                    item.author?.let { appendLine("By: $it") }
                    appendLine("Type: ${item.mediaType}")
                    item.year?.let { appendLine("Year: $it") }
                    if (item.genres.isNotEmpty()) appendLine("Genres: ${item.genres.joinToString(", ")}")
                    item.rating?.let { appendLine("Rating: $it/10") }
                    item.progress?.let { if (it > 0) appendLine("Progress: ${(it * 100).toInt()}%") }
                    item.summary?.let { appendLine("\n${it.take(300)}...") }
                }
            )
        } else {
            ToolResult(
                success = false,
                toolId = "get_library_item",
                error = "Item not found with ID: $itemId"
            )
        }
    }
    
    private suspend fun executeSearchCachedContent(params: Map<String, Any>): ToolResult {
        val query = params["query"]?.toString() ?: return ToolResult(
            success = false,
            toolId = "search_cached_content",
            error = "Missing required parameter: query"
        )
        
        val results = aiContentCacheService.searchCachedContent(query)
        
        return ToolResult(
            success = true,
            toolId = "search_cached_content",
            data = mapOf(
                "query" to query,
                "results" to results.map { item ->
                    mapOf(
                        "id" to item.id,
                        "name" to item.name,
                        "type" to item.type.name,
                        "snippet" to (item.contentSnippet ?: "")
                    )
                }
            ),
            summary = if (results.isNotEmpty()) {
                "Found ${results.size} cached item(s) matching \"$query\":\n" +
                results.take(5).mapIndexed { i, item -> 
                    "${i + 1}. ${item.name} (${item.type.name})"
                }.joinToString("\n")
            } else {
                "No cached content found matching \"$query\"."
            }
        )
    }
    
    private suspend fun executeGetReadingProgress(params: Map<String, Any>): ToolResult {
        val bookId = (params["book_id"] as? Number)?.toLong()
        
        val progress = aiLibraryBrowserService.getReadingProgress(bookId)
        
        return ToolResult(
            success = true,
            toolId = "get_reading_progress",
            data = mapOf(
                "items" to progress.map { p ->
                    mapOf(
                        "book_id" to p.bookId,
                        "title" to p.title,
                        "progress_percent" to p.progressPercent,
                        "current_page" to p.currentPage,
                        "total_pages" to p.totalPages,
                        "last_read" to p.lastRead
                    )
                }
            ),
            summary = if (progress.isNotEmpty()) {
                "Reading progress:\n" +
                progress.take(10).mapIndexed { i, p ->
                    "${i + 1}. ${p.title}: ${p.progressPercent}% (page ${p.currentPage}/${p.totalPages})"
                }.joinToString("\n")
            } else {
                "No reading progress found."
            }
        )
    }
    
    private suspend fun executeGetRecommendations(params: Map<String, Any>): ToolResult {
        val mediaType = params["media_type"]?.toString()?.uppercase()
        val basedOn = params["based_on"]?.toString() ?: "recent"
        
        val recommendations = aiLibraryBrowserService.getRecommendations(mediaType, basedOn)
        
        return ToolResult(
            success = true,
            toolId = "get_recommendations",
            data = mapOf(
                "recommendations" to recommendations.map { r ->
                    mapOf(
                        "title" to r.title,
                        "author" to (r.author ?: ""),
                        "type" to r.mediaType,
                        "reason" to r.reason
                    )
                }
            ),
            summary = if (recommendations.isNotEmpty()) {
                "Based on your library, I recommend:\n" +
                recommendations.take(5).mapIndexed { i, r ->
                    "${i + 1}. ${r.title}" + (r.author?.let { " by $it" } ?: "") + 
                    "\n   Reason: ${r.reason}"
                }.joinToString("\n")
            } else {
                "Unable to generate recommendations. Add more items to your library!"
            }
        )
    }
    
    // ==================== Enhanced Reading Progress Tool Implementations ====================
    
    private suspend fun executeGetCurrentBook(params: Map<String, Any>): ToolResult {
        val readingService = aiReadingProgressService ?: return ToolResult(
            success = false,
            toolId = "get_current_book",
            error = "Reading progress service not available"
        )
        
        val limit = (params["limit"] as? Number)?.toInt() ?: 5
        val currentBooks = readingService.getCurrentlyReading(limit)
        
        return ToolResult(
            success = true,
            toolId = "get_current_book",
            data = mapOf(
                "books" to currentBooks.map { book ->
                    mapOf(
                        "book_id" to book.bookId,
                        "title" to book.title,
                        "author" to (book.author ?: ""),
                        "current_page" to book.currentPage,
                        "total_pages" to book.totalPages,
                        "progress_percent" to book.progressPercent,
                        "last_read" to book.lastReadFormatted,
                        "reading_time_minutes" to book.totalReadingTimeMinutes,
                        "session_count" to book.sessionCount,
                        "estimated_minutes_remaining" to book.estimatedMinutesRemaining,
                        "genres" to book.genres,
                        "is_nearing_completion" to book.isNearingCompletion,
                        "is_just_started" to book.isJustStarted
                    )
                }
            ),
            summary = if (currentBooks.isNotEmpty()) {
                "Currently reading:\n" +
                currentBooks.mapIndexed { i, book ->
                    buildString {
                        append("${i + 1}. \"${book.title}\"")
                        book.author?.let { append(" by $it") }
                        append("\n   📖 ${book.progressPercent.toInt()}% complete (page ${book.currentPage}/${book.totalPages})")
                        append("\n   ⏱️ ${book.lastReadFormatted}")
                        if (book.totalReadingTimeMinutes > 0) {
                            append(" | ${book.totalReadingTimeMinutes} min reading time")
                        }
                        if (book.isNearingCompletion) append("\n   🏁 Almost finished!")
                        if (book.isJustStarted) append("\n   🆕 Just started")
                        book.estimatedMinutesRemaining?.let { 
                            append("\n   ⏳ ~$it min remaining")
                        }
                    }
                }.joinToString("\n\n")
            } else {
                "Not currently reading any books."
            }
        )
    }
    
    private suspend fun executeGetBookContext(params: Map<String, Any>): ToolResult {
        val readingService = aiReadingProgressService ?: return ToolResult(
            success = false,
            toolId = "get_book_context",
            error = "Reading progress service not available"
        )
        
        val bookId = (params["book_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "get_book_context",
            error = "Missing required parameter: book_id"
        )
        
        val context = readingService.getBookContextForDiscussion(bookId)
            ?: return ToolResult(
                success = false,
                toolId = "get_book_context",
                error = "Book not found or no reading progress"
            )
        
        return ToolResult(
            success = true,
            toolId = "get_book_context",
            data = mapOf(
                "book_id" to context.bookId,
                "title" to context.title,
                "author" to (context.author ?: ""),
                "progress_summary" to context.progressSummary,
                "pattern_summary" to context.patternSummary,
                "current_page" to context.currentPage,
                "total_pages" to context.totalPages,
                "progress_percent" to context.progressPercent,
                "genres" to context.genres,
                "book_summary" to (context.bookSummary ?: ""),
                "key_themes" to context.keyThemes,
                "suggested_topics" to context.suggestedTopics,
                "is_nearing_end" to context.isNearingEnd,
                "has_just_started" to context.hasJustStarted
            ),
            summary = buildString {
                appendLine("📚 Book Discussion Context: \"${context.title}\"")
                context.author?.let { appendLine("By: $it") }
                appendLine()
                appendLine("Progress: ${context.progressSummary}")
                appendLine()
                appendLine("Reading Pattern: ${context.patternSummary}")
                appendLine()
                if (context.keyThemes.isNotEmpty()) {
                    appendLine("Key Themes: ${context.keyThemes.joinToString(", ")}")
                }
                if (context.suggestedTopics.isNotEmpty()) {
                    appendLine()
                    appendLine("Suggested Discussion Topics:")
                    context.suggestedTopics.forEach { topic ->
                        appendLine("  • $topic")
                    }
                }
            }
        )
    }
    
    private suspend fun executeGetReadingPosition(params: Map<String, Any>): ToolResult {
        val readingService = aiReadingProgressService ?: return ToolResult(
            success = false,
            toolId = "get_reading_position",
            error = "Reading progress service not available"
        )
        
        val bookId = (params["book_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "get_reading_position",
            error = "Missing required parameter: book_id"
        )
        
        val position = readingService.getReadingPositionContext(bookId)
            ?: return ToolResult(
                success = false,
                toolId = "get_reading_position",
                error = "Book not found or no reading progress"
            )
        
        return ToolResult(
            success = true,
            toolId = "get_reading_position",
            data = mapOf(
                "book_id" to position.bookId,
                "title" to position.title,
                "current_page" to position.currentPage,
                "total_pages" to position.totalPages,
                "current_chapter" to position.currentChapter,
                "progress_percent" to position.progressPercent,
                "phase" to position.phase.name,
                "phase_description" to position.phaseDescription,
                "spoiler_warning" to position.spoilerWarning,
                "safe_to_discuss" to position.safeToDiscuss,
                "do_not_spoil" to (position.doNotSpoil ?: "")
            ),
            summary = buildString {
                appendLine("📍 Reading Position: \"${position.title}\"")
                appendLine()
                appendLine("Current Position: Page ${position.currentPage}/${position.totalPages} (Chapter ${position.currentChapter})")
                appendLine("Progress: ${position.progressPercent.toInt()}%")
                appendLine("Reading Phase: ${position.phaseDescription}")
                appendLine()
                appendLine("⚠️ SPOILER GUIDELINES:")
                appendLine(position.spoilerWarning)
                appendLine()
                appendLine("✅ Safe to discuss: ${position.safeToDiscuss}")
                position.doNotSpoil?.let {
                    appendLine("🚫 Do not reveal: $it")
                }
            }
        )
    }
    
    private suspend fun executeGetReadingHistory(params: Map<String, Any>): ToolResult {
        val readingService = aiReadingProgressService ?: return ToolResult(
            success = false,
            toolId = "get_reading_history",
            error = "Reading progress service not available"
        )
        
        val days = (params["days"] as? Number)?.toInt() ?: 30
        val history = readingService.getReadingHistory(days)
        
        return ToolResult(
            success = true,
            toolId = "get_reading_history",
            data = mapOf(
                "period_days" to history.periodDays,
                "total_reading_time_minutes" to history.totalReadingTimeMinutes,
                "total_pages_read" to history.totalPagesRead,
                "books_completed" to history.booksCompleted,
                "books_in_progress" to history.booksInProgress,
                "total_sessions" to history.totalSessions,
                "days_with_reading" to history.daysWithReading,
                "average_minutes_per_day" to history.averageMinutesPerDay,
                "average_minutes_per_session" to history.averageMinutesPerSession,
                "recently_completed" to history.recentlyCompletedBooks.map { book ->
                    mapOf(
                        "book_id" to book.bookId,
                        "title" to book.title,
                        "author" to (book.author ?: ""),
                        "completed_date" to book.completedDateFormatted,
                        "reading_time_minutes" to book.totalReadingTimeMinutes
                    )
                }
            ),
            summary = buildString {
                appendLine("📊 Reading History (Last $days days)")
                appendLine()
                appendLine("Total Reading Time: ${formatMinutes(history.totalReadingTimeMinutes)}")
                appendLine("Pages Read: ${history.totalPagesRead}")
                appendLine("Reading Sessions: ${history.totalSessions}")
                appendLine("Days with Reading: ${history.daysWithReading}")
                appendLine()
                appendLine("📈 Averages:")
                appendLine("  Per Day: ${history.averageMinutesPerDay} min")
                appendLine("  Per Session: ${history.averageMinutesPerSession} min")
                appendLine()
                appendLine("Books Completed: ${history.booksCompleted}")
                appendLine("Books In Progress: ${history.booksInProgress}")
                
                if (history.recentlyCompletedBooks.isNotEmpty()) {
                    appendLine()
                    appendLine("Recently Completed:")
                    history.recentlyCompletedBooks.forEach { book ->
                        appendLine("  • \"${book.title}\" - ${book.completedDateFormatted}")
                    }
                }
            }
        )
    }
    
    private suspend fun executeGetCompletedBooks(params: Map<String, Any>): ToolResult {
        val readingService = aiReadingProgressService ?: return ToolResult(
            success = false,
            toolId = "get_completed_books",
            error = "Reading progress service not available"
        )
        
        val limit = (params["limit"] as? Number)?.toInt() ?: 20
        val completedBooks = readingService.getCompletedBooks(limit)
        
        return ToolResult(
            success = true,
            toolId = "get_completed_books",
            data = mapOf(
                "books" to completedBooks.map { book ->
                    mapOf(
                        "book_id" to book.bookId,
                        "title" to book.title,
                        "author" to (book.author ?: ""),
                        "completed_date" to book.completedDateFormatted,
                        "reading_time_minutes" to book.totalReadingTimeMinutes
                    )
                }
            ),
            summary = if (completedBooks.isNotEmpty()) {
                "📚 Completed Books:\n" +
                completedBooks.mapIndexed { i, book ->
                    "${i + 1}. \"${book.title}\"${book.author?.let { " by $it" } ?: ""}\n   Completed: ${book.completedDateFormatted}"
                }.joinToString("\n")
            } else {
                "No completed books found."
            }
        )
    }
    
    private suspend fun executeGetReadingContextSummary(params: Map<String, Any>): ToolResult {
        val readingService = aiReadingProgressService ?: return ToolResult(
            success = false,
            toolId = "get_reading_context_summary",
            error = "Reading progress service not available"
        )
        
        val summary = readingService.getReadingContextSummary()
        
        return ToolResult(
            success = true,
            toolId = "get_reading_context_summary",
            data = mapOf("summary" to summary),
            summary = summary
        )
    }
    
    private suspend fun executeGetDiscussionQuestions(params: Map<String, Any>): ToolResult {
        val discussionService = aiBookDiscussionService ?: return ToolResult(
            success = false,
            toolId = "get_discussion_questions",
            error = "Book discussion service not available"
        )
        
        val bookId = (params["book_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "get_discussion_questions",
            error = "Missing required parameter: book_id"
        )
        
        val count = (params["count"] as? Number)?.toInt() ?: 3
        val questions = discussionService.generateDiscussionQuestions(bookId, count)
        
        return ToolResult(
            success = true,
            toolId = "get_discussion_questions",
            data = mapOf(
                "questions" to questions.map { q ->
                    mapOf(
                        "question" to q.question,
                        "category" to q.category.name,
                        "safe_at_progress" to q.safeAtProgress
                    )
                }
            ),
            summary = if (questions.isNotEmpty()) {
                "💬 Discussion Questions:\n" +
                questions.mapIndexed { i, q ->
                    "${i + 1}. ${q.question}"
                }.joinToString("\n")
            } else {
                "No discussion questions available for this book."
            }
        )
    }
    
    private suspend fun executeGetDiscussionGuidance(params: Map<String, Any>): ToolResult {
        val discussionService = aiBookDiscussionService ?: return ToolResult(
            success = false,
            toolId = "get_discussion_guidance",
            error = "Book discussion service not available"
        )
        
        val bookId = (params["book_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "get_discussion_guidance",
            error = "Missing required parameter: book_id"
        )
        
        val guidance = discussionService.getDiscussionGuidance(bookId)
        
        return ToolResult(
            success = true,
            toolId = "get_discussion_guidance",
            data = mapOf(
                "can_discuss_plot" to guidance.canDiscussPlot,
                "plot_boundary" to guidance.plotBoundary,
                "can_discuss_ending" to guidance.canDiscussEnding,
                "can_discuss_character_fates" to guidance.canDiscussCharacterFates,
                "can_ask_for_predictions" to guidance.canAskForPredictions,
                "suggested_approach" to guidance.suggestedApproach,
                "emotional_tone" to guidance.emotionalTone,
                "discussion_depth" to guidance.discussionDepth,
                "themes" to guidance.themes,
                "avoid_topics" to guidance.avoidTopics
            ),
            summary = buildString {
                appendLine("📋 Discussion Guidance")
                appendLine()
                appendLine("Approach: ${guidance.suggestedApproach}")
                appendLine("Tone: ${guidance.emotionalTone}")
                appendLine("Depth: ${guidance.discussionDepth}")
                appendLine()
                appendLine("✅ Can discuss plot up to: ${guidance.plotBoundary}")
                appendLine("Can discuss ending: ${if (guidance.canDiscussEnding) "Yes" else "No"}")
                appendLine("Can discuss character fates: ${if (guidance.canDiscussCharacterFates) "Yes" else "No"}")
                appendLine("Can ask for predictions: ${if (guidance.canAskForPredictions) "Yes" else "No"}")
                
                if (guidance.themes.isNotEmpty()) {
                    appendLine()
                    appendLine("Themes to explore: ${guidance.themes.joinToString(", ")}")
                }
                
                if (guidance.avoidTopics.isNotEmpty()) {
                    appendLine()
                    appendLine("🚫 Topics to avoid:")
                    guidance.avoidTopics.forEach { topic ->
                        appendLine("  • $topic")
                    }
                }
            }
        )
    }
    
    private suspend fun executeGetReadingJourney(params: Map<String, Any>): ToolResult {
        val discussionService = aiBookDiscussionService ?: return ToolResult(
            success = false,
            toolId = "get_reading_journey",
            error = "Book discussion service not available"
        )
        
        val bookId = (params["book_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "get_reading_journey",
            error = "Missing required parameter: book_id"
        )
        
        val characterId = (params["character_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "get_reading_journey",
            error = "Missing required parameter: character_id"
        )
        
        val journey = discussionService.getReadingJourneySummary(characterId, bookId)
            ?: return ToolResult(
                success = false,
                toolId = "get_reading_journey",
                error = "Book not found or no reading progress"
            )
        
        return ToolResult(
            success = true,
            toolId = "get_reading_journey",
            data = mapOf(
                "book_id" to journey.bookId,
                "title" to journey.bookTitle,
                "author" to (journey.author ?: ""),
                "current_progress" to journey.currentProgress,
                "is_completed" to journey.isCompleted,
                "reading_time_minutes" to journey.totalReadingTimeMinutes,
                "discussion_count" to journey.discussionCount,
                "opinion_count" to journey.opinionCount,
                "milestones" to journey.milestones.map { m ->
                    mapOf(
                        "type" to m.type.name,
                        "date" to m.date,
                        "progress" to m.progressPercent,
                        "description" to m.description
                    )
                },
                "key_opinions" to journey.keyOpinions
            ),
            summary = buildString {
                appendLine("📖 Reading Journey: \"${journey.bookTitle}\"")
                journey.author?.let { appendLine("By: $it") }
                appendLine()
                appendLine("Progress: ${journey.currentProgress.toInt()}%${if (journey.isCompleted) " (Completed!)" else ""}")
                appendLine("Reading Time: ${formatMinutes(journey.totalReadingTimeMinutes)}")
                appendLine("Discussions: ${journey.discussionCount}")
                appendLine("Opinions Shared: ${journey.opinionCount}")
                
                if (journey.milestones.isNotEmpty()) {
                    appendLine()
                    appendLine("Milestones:")
                    journey.milestones.forEach { m ->
                        appendLine("  • ${m.description}")
                    }
                }
                
                if (journey.keyOpinions.isNotEmpty()) {
                    appendLine()
                    appendLine("Key Opinions:")
                    journey.keyOpinions.take(3).forEach { opinion ->
                        appendLine("  • ${opinion.take(100)}...")
                    }
                }
            }
        )
    }
    
    private suspend fun executeStoreBookDiscussion(params: Map<String, Any>): ToolResult {
        val discussionService = aiBookDiscussionService ?: return ToolResult(
            success = false,
            toolId = "store_book_discussion",
            error = "Book discussion service not available"
        )
        
        val characterId = (params["character_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "store_book_discussion",
            error = "Missing required parameter: character_id"
        )
        val bookId = (params["book_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "store_book_discussion",
            error = "Missing required parameter: book_id"
        )
        val bookTitle = params["book_title"]?.toString() ?: return ToolResult(
            success = false,
            toolId = "store_book_discussion",
            error = "Missing required parameter: book_title"
        )
        val topic = params["topic"]?.toString() ?: return ToolResult(
            success = false,
            toolId = "store_book_discussion",
            error = "Missing required parameter: topic"
        )
        val userThoughts = params["user_thoughts"]?.toString() ?: return ToolResult(
            success = false,
            toolId = "store_book_discussion",
            error = "Missing required parameter: user_thoughts"
        )
        val aiResponse = params["ai_response"]?.toString() ?: return ToolResult(
            success = false,
            toolId = "store_book_discussion",
            error = "Missing required parameter: ai_response"
        )
        val progress = (params["progress"] as? Number)?.toFloat() ?: return ToolResult(
            success = false,
            toolId = "store_book_discussion",
            error = "Missing required parameter: progress"
        )
        
        val memoryId = discussionService.storeBookDiscussionMemory(
            aiCharacterId = characterId,
            bookId = bookId,
            bookTitle = bookTitle,
            discussionTopic = topic,
            userThoughts = userThoughts,
            aiResponse = aiResponse,
            progressAtDiscussion = progress
        )
        
        return ToolResult(
            success = memoryId > 0,
            toolId = "store_book_discussion",
            data = mapOf("memory_id" to memoryId),
            summary = if (memoryId > 0) {
                "✅ Discussion about \"$bookTitle\" stored successfully."
            } else {
                "Failed to store discussion."
            }
        )
    }
    
    private suspend fun executeStoreBookOpinion(params: Map<String, Any>): ToolResult {
        val discussionService = aiBookDiscussionService ?: return ToolResult(
            success = false,
            toolId = "store_book_opinion",
            error = "Book discussion service not available"
        )
        
        val characterId = (params["character_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "store_book_opinion",
            error = "Missing required parameter: character_id"
        )
        val bookId = (params["book_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "store_book_opinion",
            error = "Missing required parameter: book_id"
        )
        val bookTitle = params["book_title"]?.toString() ?: return ToolResult(
            success = false,
            toolId = "store_book_opinion",
            error = "Missing required parameter: book_title"
        )
        val opinionTypeStr = params["opinion_type"]?.toString() ?: return ToolResult(
            success = false,
            toolId = "store_book_opinion",
            error = "Missing required parameter: opinion_type"
        )
        val opinion = params["opinion"]?.toString() ?: return ToolResult(
            success = false,
            toolId = "store_book_opinion",
            error = "Missing required parameter: opinion"
        )
        val progress = (params["progress"] as? Number)?.toFloat() ?: return ToolResult(
            success = false,
            toolId = "store_book_opinion",
            error = "Missing required parameter: progress"
        )
        
        val opinionType = try {
            BookOpinionType.valueOf(opinionTypeStr.uppercase())
        } catch (e: Exception) {
            return ToolResult(
                success = false,
                toolId = "store_book_opinion",
                error = "Invalid opinion_type: $opinionTypeStr"
            )
        }
        
        val memoryId = discussionService.storeBookOpinion(
            aiCharacterId = characterId,
            bookId = bookId,
            bookTitle = bookTitle,
            opinionType = opinionType,
            opinion = opinion,
            currentProgress = progress
        )
        
        return ToolResult(
            success = memoryId > 0,
            toolId = "store_book_opinion",
            data = mapOf("memory_id" to memoryId),
            summary = if (memoryId > 0) {
                "✅ ${opinionType.displayName} for \"$bookTitle\" stored successfully."
            } else {
                "Failed to store opinion."
            }
        )
    }
    
    private suspend fun executeGetBookOpinions(params: Map<String, Any>): ToolResult {
        val discussionService = aiBookDiscussionService ?: return ToolResult(
            success = false,
            toolId = "get_book_opinions",
            error = "Book discussion service not available"
        )
        
        val characterId = (params["character_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "get_book_opinions",
            error = "Missing required parameter: character_id"
        )
        val bookId = (params["book_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "get_book_opinions",
            error = "Missing required parameter: book_id"
        )
        
        val opinions = discussionService.getBookOpinions(characterId, bookId)
        
        return ToolResult(
            success = true,
            toolId = "get_book_opinions",
            data = mapOf(
                "opinions" to opinions.map { o ->
                    mapOf(
                        "memory_id" to o.memoryId,
                        "opinion_type" to o.opinionType.name,
                        "opinion_type_display" to o.opinionType.displayName,
                        "progress_at_opinion" to o.progressAtOpinion,
                        "opinion" to o.opinion
                    )
                }
            ),
            summary = if (opinions.isNotEmpty()) {
                "💭 Stored Opinions about \"${opinions.firstOrNull()?.bookTitle}\":\n" +
                opinions.mapIndexed { i, o ->
                    "${i + 1}. ${o.opinionType.displayName}:\n   ${o.opinion.take(150)}..."
                }.joinToString("\n")
            } else {
                "No stored opinions for this book."
            }
        )
    }
    
    private suspend fun executeInitiateBookDiscussion(params: Map<String, Any>): ToolResult {
        val discussionService = aiBookDiscussionService ?: return ToolResult(
            success = false,
            toolId = "initiate_book_discussion",
            error = "Book discussion service not available"
        )
        
        val bookId = (params["book_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "initiate_book_discussion",
            error = "Missing required parameter: book_id"
        )
        val characterId = (params["character_id"] as? Number)?.toLong() ?: return ToolResult(
            success = false,
            toolId = "initiate_book_discussion",
            error = "Missing required parameter: character_id"
        )
        
        val session = discussionService.initiateBookDiscussion(bookId, characterId)
            ?: return ToolResult(
                success = false,
                toolId = "initiate_book_discussion",
                error = "Failed to initiate discussion - book not found or no reading progress"
            )
        
        return ToolResult(
            success = true,
            toolId = "initiate_book_discussion",
            data = mapOf(
                "book_id" to session.bookId,
                "title" to session.bookTitle,
                "author" to (session.bookAuthor ?: ""),
                "current_progress" to session.currentProgress,
                "previous_discussion_count" to session.previousDiscussionCount,
                "suggested_topics" to session.suggestedTopics,
                "spoiler_guidelines" to session.spoilerGuidelines,
                "system_prompt_addition" to session.systemPromptAddition
            ),
            summary = buildString {
                appendLine("🎬 Book Discussion Session Started")
                appendLine()
                appendLine("Book: \"${session.bookTitle}\"${session.bookAuthor?.let { " by $it" } ?: ""}")
                appendLine("Progress: ${session.currentProgress.toInt()}%")
                appendLine("Previous Discussions: ${session.previousDiscussionCount}")
                appendLine()
                appendLine("⚠️ Spoiler Guidelines: ${session.spoilerGuidelines}")
                appendLine()
                appendLine("Suggested Topics:")
                session.suggestedTopics.forEach { topic ->
                    appendLine("  • $topic")
                }
                appendLine()
                appendLine("--- System Prompt Addition ---")
                append(session.systemPromptAddition)
            }
        )
    }
    
    // Helper function for formatting minutes
    private fun formatMinutes(minutes: Int): String {
        return when {
            minutes < 60 -> "$minutes min"
            minutes < 120 -> "1 hr ${minutes % 60} min"
            else -> "${minutes / 60} hrs ${minutes % 60} min"
        }
    }
    
    private fun extractTextFromHtml(html: String): String {
        return html
            // Remove scripts and styles
            .replace(Regex("<script[^>]*>[\\s\\S]*?</script>", RegexOption.IGNORE_CASE), "")
            .replace(Regex("<style[^>]*>[\\s\\S]*?</style>", RegexOption.IGNORE_CASE), "")
            // Remove HTML comments
            .replace(Regex("<!--[\\s\\S]*?-->"), "")
            // Convert some tags to newlines
            .replace(Regex("<(br|p|div|h[1-6]|li)[^>]*>", RegexOption.IGNORE_CASE), "\n")
            // Remove all other tags
            .replace(Regex("<[^>]+>"), " ")
            // Decode common HTML entities
            .replace("&nbsp;", " ")
            .replace("&amp;", "&")
            .replace("&lt;", "<")
            .replace("&gt;", ">")
            .replace("&quot;", "\"")
            .replace("&#39;", "'")
            // Clean up whitespace
            .replace(Regex("\\s+"), " ")
            .replace(Regex("\n\\s*\n"), "\n\n")
            .trim()
    }
    
    /**
     * Clear tool execution log
     */
    fun clearExecutionLog() {
        _toolExecutionLog.value = emptyList()
    }
}

// ==================== Data Classes ====================

@Serializable
data class AITool(
    val id: String,
    val name: String,
    val description: String,
    val parameters: List<ToolParameter>
)

@Serializable
data class ToolParameter(
    val name: String,
    val type: String,
    val description: String,
    val required: Boolean = false
)

data class ToolRequest(
    val toolId: String,
    val parameters: Map<String, Any>
)

data class ToolResult(
    val success: Boolean,
    val toolId: String,
    val data: Map<String, Any>? = null,
    val summary: String? = null,
    val error: String? = null
)

data class ToolExecution(
    val toolId: String,
    val parameters: Map<String, Any>,
    val result: ToolResult,
    val timestamp: Long,
    val durationMs: Long
)

data class SearchResult(
    val title: String,
    val snippet: String,
    val url: String
)
