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
 */
@Singleton
class AIToolsService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val aiContentCacheService: AIContentCacheService,
    private val aiLibraryBrowserService: AILibraryBrowserService
) {
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
