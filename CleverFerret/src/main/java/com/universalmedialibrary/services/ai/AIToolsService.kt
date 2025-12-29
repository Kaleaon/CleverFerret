package com.universalmedialibrary.services.ai

import android.content.Context
import android.media.MediaMetadataRetriever
import android.net.Uri
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import org.json.JSONArray
import org.json.JSONObject
import java.net.URL
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton

/**
 * AI Tools Service
 * 
 * Provides tools for AI assistants to:
 * - Search the web
 * - Retrieve and process documents from URLs
 * - View and parse web pages
 * - Scan and process the media library
 * - Process books (extract text, summaries)
 * - Analyze music files
 */
@Singleton
class AIToolsService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        private const val USER_AGENT = "Mozilla/5.0 (Android; CleverFerret AI Assistant)"
        private const val TIMEOUT_MS = 15000
        private const val MAX_CONTENT_LENGTH = 50000 // Characters
        private const val SEARCH_RESULT_LIMIT = 10
    }
    
    private val _toolStatus = MutableStateFlow<ToolStatus>(ToolStatus.Idle)
    val toolStatus: StateFlow<ToolStatus> = _toolStatus.asStateFlow()
    
    private val _enabledTools = MutableStateFlow<Set<AITool>>(AITool.values().toSet())
    val enabledTools: StateFlow<Set<AITool>> = _enabledTools.asStateFlow()
    
    /**
     * Enable or disable a specific tool
     */
    fun setToolEnabled(tool: AITool, enabled: Boolean) {
        val current = _enabledTools.value.toMutableSet()
        if (enabled) {
            current.add(tool)
        } else {
            current.remove(tool)
        }
        _enabledTools.value = current
    }
    
    /**
     * Check if a tool is enabled
     */
    fun isToolEnabled(tool: AITool): Boolean = tool in _enabledTools.value
    
    /**
     * Get tool descriptions for AI system prompt
     */
    fun getToolDescriptions(): String {
        val tools = _enabledTools.value
        return buildString {
            appendLine("You have access to the following tools:")
            appendLine()
            
            tools.forEach { tool ->
                appendLine("- ${tool.displayName}: ${tool.description}")
                appendLine("  Usage: ${tool.usage}")
                appendLine()
            }
        }
    }
    
    // ==================== WEB SEARCH ====================
    
    /**
     * Perform a web search using DuckDuckGo
     */
    suspend fun webSearch(query: String, maxResults: Int = SEARCH_RESULT_LIMIT): Result<List<SearchResult>> = withContext(Dispatchers.IO) {
        if (!isToolEnabled(AITool.WEB_SEARCH)) {
            return@withContext Result.failure(ToolDisabledException(AITool.WEB_SEARCH))
        }
        
        try {
            _toolStatus.value = ToolStatus.Searching(query)
            
            val encodedQuery = URLEncoder.encode(query, "UTF-8")
            val url = "https://html.duckduckgo.com/html/?q=$encodedQuery"
            
            val doc = Jsoup.connect(url)
                .userAgent(USER_AGENT)
                .timeout(TIMEOUT_MS)
                .get()
            
            val results = doc.select(".result__body").take(maxResults).mapNotNull { element ->
                val titleElement = element.selectFirst(".result__title a")
                val snippetElement = element.selectFirst(".result__snippet")
                
                val title = titleElement?.text() ?: return@mapNotNull null
                val link = titleElement.attr("href")
                val snippet = snippetElement?.text() ?: ""
                
                // DuckDuckGo wraps links, extract actual URL
                val actualUrl = extractDuckDuckGoUrl(link)
                
                SearchResult(
                    title = title,
                    url = actualUrl,
                    snippet = snippet
                )
            }
            
            _toolStatus.value = ToolStatus.Idle
            Result.success(results)
        } catch (e: Exception) {
            _toolStatus.value = ToolStatus.Error(e.message ?: "Search failed")
            Result.failure(e)
        }
    }
    
    private fun extractDuckDuckGoUrl(wrappedUrl: String): String {
        return try {
            if (wrappedUrl.contains("uddg=")) {
                val startIndex = wrappedUrl.indexOf("uddg=") + 5
                val endIndex = wrappedUrl.indexOf("&", startIndex).takeIf { it > 0 } ?: wrappedUrl.length
                java.net.URLDecoder.decode(wrappedUrl.substring(startIndex, endIndex), "UTF-8")
            } else {
                wrappedUrl
            }
        } catch (e: Exception) {
            wrappedUrl
        }
    }
    
    // ==================== WEB PAGE RETRIEVAL ====================
    
    /**
     * Fetch and parse a web page
     */
    suspend fun fetchWebPage(url: String): Result<WebPageContent> = withContext(Dispatchers.IO) {
        if (!isToolEnabled(AITool.VIEW_WEB_PAGE)) {
            return@withContext Result.failure(ToolDisabledException(AITool.VIEW_WEB_PAGE))
        }
        
        try {
            _toolStatus.value = ToolStatus.FetchingPage(url)
            
            val doc = Jsoup.connect(url)
                .userAgent(USER_AGENT)
                .timeout(TIMEOUT_MS)
                .maxBodySize(MAX_CONTENT_LENGTH * 2)
                .get()
            
            val content = extractPageContent(doc)
            
            _toolStatus.value = ToolStatus.Idle
            Result.success(content)
        } catch (e: Exception) {
            _toolStatus.value = ToolStatus.Error(e.message ?: "Failed to fetch page")
            Result.failure(e)
        }
    }
    
    private fun extractPageContent(doc: Document): WebPageContent {
        // Remove script, style, nav, footer elements
        doc.select("script, style, nav, footer, header, aside, .ad, .advertisement, .sidebar").remove()
        
        val title = doc.title()
        val description = doc.selectFirst("meta[name=description]")?.attr("content") ?: ""
        
        // Extract main content
        val mainContent = doc.selectFirst("main, article, .content, .post, .entry, #content, #main")
            ?: doc.body()
        
        val text = mainContent?.text()?.take(MAX_CONTENT_LENGTH) ?: ""
        
        // Extract headings
        val headings = doc.select("h1, h2, h3").map { it.text() }.take(20)
        
        // Extract links
        val links = doc.select("a[href]").mapNotNull { link ->
            val href = link.absUrl("href")
            val linkText = link.text()
            if (href.isNotBlank() && linkText.isNotBlank()) {
                WebLink(text = linkText, url = href)
            } else null
        }.take(50)
        
        // Extract images
        val images = doc.select("img[src]").mapNotNull { img ->
            val src = img.absUrl("src")
            val alt = img.attr("alt")
            if (src.isNotBlank()) {
                WebImage(url = src, alt = alt)
            } else null
        }.take(20)
        
        return WebPageContent(
            url = doc.location(),
            title = title,
            description = description,
            textContent = text,
            headings = headings,
            links = links,
            images = images
        )
    }
    
    // ==================== DOCUMENT RETRIEVAL ====================
    
    /**
     * Retrieve a document from URL (PDF, text, HTML)
     */
    suspend fun retrieveDocument(url: String): Result<DocumentContent> = withContext(Dispatchers.IO) {
        if (!isToolEnabled(AITool.DOCUMENT_RETRIEVAL)) {
            return@withContext Result.failure(ToolDisabledException(AITool.DOCUMENT_RETRIEVAL))
        }
        
        try {
            _toolStatus.value = ToolStatus.RetrievingDocument(url)
            
            val connection = URL(url).openConnection().apply {
                setRequestProperty("User-Agent", USER_AGENT)
                connectTimeout = TIMEOUT_MS
                readTimeout = TIMEOUT_MS
            }
            
            val contentType = connection.contentType ?: "text/plain"
            val content = connection.getInputStream().bufferedReader().use { it.readText() }
            
            val documentType = when {
                contentType.contains("html") -> DocumentType.HTML
                contentType.contains("json") -> DocumentType.JSON
                contentType.contains("xml") -> DocumentType.XML
                contentType.contains("pdf") -> DocumentType.PDF
                else -> DocumentType.TEXT
            }
            
            val processedContent = when (documentType) {
                DocumentType.HTML -> {
                    val doc = Jsoup.parse(content)
                    doc.select("script, style").remove()
                    doc.body()?.text() ?: content
                }
                DocumentType.JSON -> {
                    try {
                        JSONObject(content).toString(2)
                    } catch (e: Exception) {
                        try {
                            JSONArray(content).toString(2)
                        } catch (e2: Exception) {
                            content
                        }
                    }
                }
                else -> content
            }.take(MAX_CONTENT_LENGTH)
            
            _toolStatus.value = ToolStatus.Idle
            Result.success(DocumentContent(
                url = url,
                type = documentType,
                content = processedContent,
                size = content.length
            ))
        } catch (e: Exception) {
            _toolStatus.value = ToolStatus.Error(e.message ?: "Failed to retrieve document")
            Result.failure(e)
        }
    }
    
    // ==================== MEDIA LIBRARY SCANNING ====================
    
    /**
     * Scan media library for books
     */
    suspend fun scanBooksLibrary(): Result<List<MediaLibraryItem>> = withContext(Dispatchers.IO) {
        if (!isToolEnabled(AITool.SCAN_MEDIA_LIBRARY)) {
            return@withContext Result.failure(ToolDisabledException(AITool.SCAN_MEDIA_LIBRARY))
        }
        
        try {
            _toolStatus.value = ToolStatus.ScanningLibrary("books")
            
            val books = mutableListOf<MediaLibraryItem>()
            
            // Query media store for documents/books
            val projection = arrayOf(
                android.provider.MediaStore.Files.FileColumns._ID,
                android.provider.MediaStore.Files.FileColumns.DISPLAY_NAME,
                android.provider.MediaStore.Files.FileColumns.DATA,
                android.provider.MediaStore.Files.FileColumns.SIZE,
                android.provider.MediaStore.Files.FileColumns.DATE_MODIFIED,
                android.provider.MediaStore.Files.FileColumns.MIME_TYPE
            )
            
            val bookMimeTypes = listOf(
                "application/epub+zip",
                "application/pdf",
                "application/x-mobipocket-ebook",
                "text/plain",
                "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
            )
            
            val selection = bookMimeTypes.joinToString(" OR ") { 
                "${android.provider.MediaStore.Files.FileColumns.MIME_TYPE} = ?" 
            }
            
            context.contentResolver.query(
                android.provider.MediaStore.Files.getContentUri("external"),
                projection,
                selection,
                bookMimeTypes.toTypedArray(),
                "${android.provider.MediaStore.Files.FileColumns.DATE_MODIFIED} DESC"
            )?.use { cursor ->
                val idColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Files.FileColumns._ID)
                val nameColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Files.FileColumns.DISPLAY_NAME)
                val pathColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Files.FileColumns.DATA)
                val sizeColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Files.FileColumns.SIZE)
                val dateColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Files.FileColumns.DATE_MODIFIED)
                val mimeColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Files.FileColumns.MIME_TYPE)
                
                while (cursor.moveToNext()) {
                    books.add(MediaLibraryItem(
                        id = cursor.getLong(idColumn),
                        name = cursor.getString(nameColumn) ?: "Unknown",
                        path = cursor.getString(pathColumn) ?: "",
                        size = cursor.getLong(sizeColumn),
                        dateModified = cursor.getLong(dateColumn) * 1000,
                        mimeType = cursor.getString(mimeColumn) ?: "",
                        type = MediaType.BOOK
                    ))
                }
            }
            
            _toolStatus.value = ToolStatus.Idle
            Result.success(books)
        } catch (e: Exception) {
            _toolStatus.value = ToolStatus.Error(e.message ?: "Failed to scan library")
            Result.failure(e)
        }
    }
    
    /**
     * Scan media library for music
     */
    suspend fun scanMusicLibrary(): Result<List<MediaLibraryItem>> = withContext(Dispatchers.IO) {
        if (!isToolEnabled(AITool.SCAN_MEDIA_LIBRARY)) {
            return@withContext Result.failure(ToolDisabledException(AITool.SCAN_MEDIA_LIBRARY))
        }
        
        try {
            _toolStatus.value = ToolStatus.ScanningLibrary("music")
            
            val music = mutableListOf<MediaLibraryItem>()
            
            val projection = arrayOf(
                android.provider.MediaStore.Audio.Media._ID,
                android.provider.MediaStore.Audio.Media.DISPLAY_NAME,
                android.provider.MediaStore.Audio.Media.DATA,
                android.provider.MediaStore.Audio.Media.SIZE,
                android.provider.MediaStore.Audio.Media.DATE_MODIFIED,
                android.provider.MediaStore.Audio.Media.TITLE,
                android.provider.MediaStore.Audio.Media.ARTIST,
                android.provider.MediaStore.Audio.Media.ALBUM,
                android.provider.MediaStore.Audio.Media.DURATION
            )
            
            context.contentResolver.query(
                android.provider.MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
                projection,
                "${android.provider.MediaStore.Audio.Media.IS_MUSIC} != 0",
                null,
                "${android.provider.MediaStore.Audio.Media.DATE_MODIFIED} DESC"
            )?.use { cursor ->
                val idColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Audio.Media._ID)
                val nameColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Audio.Media.DISPLAY_NAME)
                val pathColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Audio.Media.DATA)
                val sizeColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Audio.Media.SIZE)
                val dateColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Audio.Media.DATE_MODIFIED)
                val titleColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Audio.Media.TITLE)
                val artistColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Audio.Media.ARTIST)
                val albumColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Audio.Media.ALBUM)
                val durationColumn = cursor.getColumnIndexOrThrow(android.provider.MediaStore.Audio.Media.DURATION)
                
                while (cursor.moveToNext()) {
                    music.add(MediaLibraryItem(
                        id = cursor.getLong(idColumn),
                        name = cursor.getString(nameColumn) ?: "Unknown",
                        path = cursor.getString(pathColumn) ?: "",
                        size = cursor.getLong(sizeColumn),
                        dateModified = cursor.getLong(dateColumn) * 1000,
                        mimeType = "audio/*",
                        type = MediaType.MUSIC,
                        metadata = mapOf(
                            "title" to (cursor.getString(titleColumn) ?: ""),
                            "artist" to (cursor.getString(artistColumn) ?: ""),
                            "album" to (cursor.getString(albumColumn) ?: ""),
                            "duration" to cursor.getLong(durationColumn).toString()
                        )
                    ))
                }
            }
            
            _toolStatus.value = ToolStatus.Idle
            Result.success(music)
        } catch (e: Exception) {
            _toolStatus.value = ToolStatus.Error(e.message ?: "Failed to scan library")
            Result.failure(e)
        }
    }
    
    // ==================== BOOK PROCESSING ====================
    
    /**
     * Extract text from a book file
     */
    suspend fun processBook(uri: Uri): Result<BookContent> = withContext(Dispatchers.IO) {
        if (!isToolEnabled(AITool.PROCESS_BOOKS)) {
            return@withContext Result.failure(ToolDisabledException(AITool.PROCESS_BOOKS))
        }
        
        try {
            _toolStatus.value = ToolStatus.ProcessingBook
            
            val mimeType = context.contentResolver.getType(uri) ?: ""
            val inputStream = context.contentResolver.openInputStream(uri)
                ?: return@withContext Result.failure(Exception("Cannot open file"))
            
            val content = when {
                mimeType.contains("epub") -> extractEpubText(inputStream)
                mimeType.contains("pdf") -> extractPdfText(inputStream)
                mimeType.contains("text") -> inputStream.bufferedReader().readText()
                else -> inputStream.bufferedReader().readText()
            }
            
            inputStream.close()
            
            // Extract metadata
            val wordCount = content.split(Regex("\\s+")).size
            val characterCount = content.length
            val paragraphCount = content.split(Regex("\n\n+")).size
            
            // Extract first few paragraphs as preview
            val preview = content.take(2000)
            
            _toolStatus.value = ToolStatus.Idle
            Result.success(BookContent(
                uri = uri.toString(),
                textContent = content.take(MAX_CONTENT_LENGTH),
                preview = preview,
                wordCount = wordCount,
                characterCount = characterCount,
                paragraphCount = paragraphCount
            ))
        } catch (e: Exception) {
            _toolStatus.value = ToolStatus.Error(e.message ?: "Failed to process book")
            Result.failure(e)
        }
    }
    
    private fun extractEpubText(inputStream: java.io.InputStream): String {
        // Simplified EPUB extraction - in production would use a proper EPUB library
        val zipInput = java.util.zip.ZipInputStream(inputStream)
        val textBuilder = StringBuilder()
        
        var entry = zipInput.nextEntry
        while (entry != null) {
            if (entry.name.endsWith(".html") || entry.name.endsWith(".xhtml")) {
                val content = zipInput.bufferedReader().readText()
                val doc = Jsoup.parse(content)
                doc.select("script, style").remove()
                textBuilder.appendLine(doc.body()?.text() ?: "")
            }
            zipInput.closeEntry()
            entry = zipInput.nextEntry
        }
        zipInput.close()
        
        return textBuilder.toString()
    }
    
    private fun extractPdfText(inputStream: java.io.InputStream): String {
        // Placeholder - would need a PDF library like PDFBox or iText
        return "[PDF text extraction requires PDF library integration]"
    }
    
    // ==================== MUSIC ANALYSIS ====================
    
    /**
     * Get metadata from a music file
     */
    suspend fun analyzeMusicFile(uri: Uri): Result<MusicMetadata> = withContext(Dispatchers.IO) {
        if (!isToolEnabled(AITool.LISTEN_MUSIC)) {
            return@withContext Result.failure(ToolDisabledException(AITool.LISTEN_MUSIC))
        }
        
        try {
            _toolStatus.value = ToolStatus.AnalyzingMusic
            
            val retriever = MediaMetadataRetriever()
            retriever.setDataSource(context, uri)
            
            val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE) ?: "Unknown"
            val artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST) ?: "Unknown"
            val album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM) ?: "Unknown"
            val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull() ?: 0
            val year = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_YEAR) ?: ""
            val genre = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_GENRE) ?: ""
            val bitrate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_BITRATE)?.toIntOrNull() ?: 0
            val trackNumber = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER) ?: ""
            
            val albumArt = retriever.embeddedPicture
            
            retriever.release()
            
            _toolStatus.value = ToolStatus.Idle
            Result.success(MusicMetadata(
                uri = uri.toString(),
                title = title,
                artist = artist,
                album = album,
                duration = duration,
                year = year,
                genre = genre,
                bitrate = bitrate,
                trackNumber = trackNumber,
                hasAlbumArt = albumArt != null
            ))
        } catch (e: Exception) {
            _toolStatus.value = ToolStatus.Error(e.message ?: "Failed to analyze music")
            Result.failure(e)
        }
    }
    
    // ==================== TOOL EXECUTION ====================
    
    /**
     * Execute a tool by name with parameters
     * Used by AI to call tools dynamically
     */
    suspend fun executeTool(toolName: String, parameters: Map<String, Any>): ToolResult {
        return try {
            when (toolName.lowercase()) {
                "search", "web_search" -> {
                    val query = parameters["query"]?.toString() ?: return ToolResult.Error("Missing query parameter")
                    val results = webSearch(query).getOrThrow()
                    ToolResult.Success(results.joinToString("\n\n") { 
                        "**${it.title}**\n${it.url}\n${it.snippet}" 
                    })
                }
                "fetch_page", "view_page", "get_page" -> {
                    val url = parameters["url"]?.toString() ?: return ToolResult.Error("Missing url parameter")
                    val content = fetchWebPage(url).getOrThrow()
                    ToolResult.Success("# ${content.title}\n\n${content.textContent}")
                }
                "get_document", "fetch_document" -> {
                    val url = parameters["url"]?.toString() ?: return ToolResult.Error("Missing url parameter")
                    val doc = retrieveDocument(url).getOrThrow()
                    ToolResult.Success(doc.content)
                }
                "scan_books", "list_books" -> {
                    val books = scanBooksLibrary().getOrThrow()
                    ToolResult.Success(books.joinToString("\n") { 
                        "- ${it.name} (${formatSize(it.size)})" 
                    })
                }
                "scan_music", "list_music" -> {
                    val music = scanMusicLibrary().getOrThrow()
                    ToolResult.Success(music.joinToString("\n") { item ->
                        val title = item.metadata["title"] ?: item.name
                        val artist = item.metadata["artist"] ?: "Unknown"
                        "- $title by $artist"
                    })
                }
                else -> ToolResult.Error("Unknown tool: $toolName")
            }
        } catch (e: ToolDisabledException) {
            ToolResult.Error("Tool '${e.tool.displayName}' is disabled")
        } catch (e: Exception) {
            ToolResult.Error(e.message ?: "Tool execution failed")
        }
    }
    
    private fun formatSize(bytes: Long): String {
        return when {
            bytes >= 1_000_000 -> String.format("%.1f MB", bytes / 1_000_000.0)
            bytes >= 1_000 -> String.format("%.1f KB", bytes / 1_000.0)
            else -> "$bytes B"
        }
    }
}

/**
 * Available AI Tools
 */
enum class AITool(
    val displayName: String,
    val description: String,
    val usage: String
) {
    WEB_SEARCH(
        "Web Search",
        "Search the web using DuckDuckGo",
        "search(query: \"your search query\")"
    ),
    VIEW_WEB_PAGE(
        "View Web Page",
        "Fetch and read content from a web page",
        "fetch_page(url: \"https://example.com\")"
    ),
    DOCUMENT_RETRIEVAL(
        "Document Retrieval",
        "Download and read documents from URLs",
        "get_document(url: \"https://example.com/doc.pdf\")"
    ),
    SCAN_MEDIA_LIBRARY(
        "Scan Media Library",
        "Scan user's device for books, music, videos",
        "scan_books() or scan_music()"
    ),
    PROCESS_BOOKS(
        "Process Books",
        "Read and extract text from book files (EPUB, PDF, etc.)",
        "process_book(uri: \"content://...\")"
    ),
    LISTEN_MUSIC(
        "Listen to Music",
        "Analyze music files and extract metadata",
        "analyze_music(uri: \"content://...\")"
    )
}

/**
 * Tool status
 */
sealed class ToolStatus {
    object Idle : ToolStatus()
    data class Searching(val query: String) : ToolStatus()
    data class FetchingPage(val url: String) : ToolStatus()
    data class RetrievingDocument(val url: String) : ToolStatus()
    data class ScanningLibrary(val type: String) : ToolStatus()
    object ProcessingBook : ToolStatus()
    object AnalyzingMusic : ToolStatus()
    data class Error(val message: String) : ToolStatus()
}

/**
 * Tool execution result
 */
sealed class ToolResult {
    data class Success(val content: String) : ToolResult()
    data class Error(val message: String) : ToolResult()
}

/**
 * Exception for disabled tools
 */
class ToolDisabledException(val tool: AITool) : Exception("Tool ${tool.displayName} is disabled")

/**
 * Search result
 */
data class SearchResult(
    val title: String,
    val url: String,
    val snippet: String
)

/**
 * Web page content
 */
data class WebPageContent(
    val url: String,
    val title: String,
    val description: String,
    val textContent: String,
    val headings: List<String>,
    val links: List<WebLink>,
    val images: List<WebImage>
)

data class WebLink(val text: String, val url: String)
data class WebImage(val url: String, val alt: String)

/**
 * Document content
 */
data class DocumentContent(
    val url: String,
    val type: DocumentType,
    val content: String,
    val size: Int
)

enum class DocumentType {
    HTML, JSON, XML, PDF, TEXT
}

/**
 * Media library item
 */
data class MediaLibraryItem(
    val id: Long,
    val name: String,
    val path: String,
    val size: Long,
    val dateModified: Long,
    val mimeType: String,
    val type: MediaType,
    val metadata: Map<String, String> = emptyMap()
)

enum class MediaType {
    BOOK, MUSIC, VIDEO, IMAGE, DOCUMENT
}

/**
 * Book content
 */
data class BookContent(
    val uri: String,
    val textContent: String,
    val preview: String,
    val wordCount: Int,
    val characterCount: Int,
    val paragraphCount: Int
)

/**
 * Music metadata
 */
data class MusicMetadata(
    val uri: String,
    val title: String,
    val artist: String,
    val album: String,
    val duration: Long,
    val year: String,
    val genre: String,
    val bitrate: Int,
    val trackNumber: String,
    val hasAlbumArt: Boolean
) {
    val durationFormatted: String
        get() {
            val minutes = duration / 60000
            val seconds = (duration % 60000) / 1000
            return String.format("%d:%02d", minutes, seconds)
        }
}
