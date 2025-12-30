package com.universalmedialibrary.services.ai

import android.content.Context
import android.net.Uri
import com.universalmedialibrary.utils.ErrorLogger
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.File
import java.io.FileOutputStream
import java.net.URL
import java.security.MessageDigest
import java.text.SimpleDateFormat
import java.util.*
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Enhanced AI Content Cache Service
 * 
 * Provides individual AI content caching with download capabilities for:
 * - Web pages and articles
 * - PDF documents
 * - Images and media files
 * - Research papers and academic content
 * - User-generated content and references
 */
@Singleton
class EnhancedAIContentCacheService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val aiRateLimitService: AIRateLimitService
) {
    
    companion object {
        private const val CACHE_DIR_NAME = "ai_content_cache"
        private const val METADATA_FILE_EXTENSION = ".meta.json"
        private const val MAX_CACHE_SIZE_MB = 1024 // 1GB cache limit
        private const val MAX_ITEM_AGE_DAYS = 30
        private const val MAX_FILE_SIZE_MB = 50 // 50MB per file
    }
    
    private val json = Json { 
        ignoreUnknownKeys = true 
        prettyPrint = true
        encodeDefaults = true
    }
    
    private val httpClient = OkHttpClient.Builder()
        .connectTimeout(30, TimeUnit.SECONDS)
        .readTimeout(60, TimeUnit.SECONDS)
        .writeTimeout(60, TimeUnit.SECONDS)
        .build()
    
    private val cacheDir: File by lazy {
        File(context.cacheDir, CACHE_DIR_NAME).also { dir ->
            if (!dir.exists()) dir.mkdirs()
        }
    }
    
    private val _cacheItems = MutableStateFlow<List<CacheItem>>(emptyList())
    val cacheItems: StateFlow<List<CacheItem>> = _cacheItems.asStateFlow()
    
    private val _downloadProgress = MutableStateFlow<DownloadProgress?>(null)
    val downloadProgress: StateFlow<DownloadProgress?> = _downloadProgress.asStateFlow()
    
    private val _cacheStats = MutableStateFlow<CacheStatistics?>(null)
    val cacheStatistics: StateFlow<CacheStatistics?> = _cacheStats.asStateFlow()
    
    init {
        refreshCacheItems()
        cleanupExpiredItems()
    }
    
    // ==================== Content Download & Caching ====================
    
    /**
     * Download and cache a web page as readable content
     */
    suspend fun downloadAndCacheWebPage(
        url: String,
        characterId: Long? = null,
        options: DownloadOptions = DownloadOptions()
    ): Result<CacheItem> = withContext(Dispatchers.IO) {
        try {
            // Check rate limits
            val rateLimitResult = aiRateLimitService.checkRateLimit(
                provider = AIProvider.OPENAI, // Use OpenAI as default for web operations
                requestType = RequestType.DOWNLOAD
            )
            
            if (!rateLimitResult.allowed) {
                return@withContext Result.failure(
                    Exception("Rate limit exceeded: ${rateLimitResult.reason}")
                )
            }
            
            _downloadProgress.value = DownloadProgress(
                url = url,
                status = DownloadStatus.DOWNLOADING,
                progress = 0f,
                message = "Fetching web page..."
            )
            
            // Download web page
            val request = Request.Builder()
                .url(url)
                .addHeader("User-Agent", "Mozilla/5.0 (compatible; CleverFerret/1.0)")
                .build()
            
            val response = httpClient.newCall(request).execute()
            
            if (!response.isSuccessful) {
                return@withContext Result.failure(
                    Exception("HTTP ${response.code}: ${response.message}")
                )
            }
            
            val html = response.body?.string() ?: ""
            _downloadProgress.value = DownloadProgress(
                url = url,
                status = DownloadStatus.PROCESSING,
                progress = 0.5f,
                message = "Extracting content..."
            )
            
            // Extract readable text
            val textContent = extractReadableText(html)
            val title = extractTitle(html) ?: URL(url).host
            
            // Create cache item
            val cacheItem = createCacheItem(
                url = url,
                content = textContent,
                title = title,
                type = ContentType.WEB_PAGE,
                characterId = characterId,
                originalUrl = url,
                sourceDomain = URL(url).host,
                metadata = mapOf(
                    "content_length" to textContent.length.toString(),
                    "original_size" to html.length.toString(),
                    "download_date" to SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault()).format(Date())
                )
            )
            
            _downloadProgress.value = DownloadProgress(
                url = url,
                status = DownloadStatus.COMPLETED,
                progress = 1f,
                message = "Web page cached successfully"
            )
            
            // Record successful request
            aiRateLimitService.recordRequest(
                provider = AIProvider.OPENAI,
                requestType = RequestType.DOWNLOAD,
                success = true,
                responseTimeMs = 0 // Would need to track this properly
            )
            
            refreshCacheItems()
            Result.success(cacheItem)
            
        } catch (e: Exception) {
            _downloadProgress.value = null
            
            // Record failed request
            aiRateLimitService.recordRequest(
                provider = AIProvider.OPENAI,
                requestType = RequestType.DOWNLOAD,
                success = false,
                responseTimeMs = 0
            )
            
            ErrorLogger.logError("EnhancedAIContentCache", "Failed to download web page: $url", e)
            Result.failure(e)
        }
    }
    
    /**
     * Download and cache a PDF document
     */
    suspend fun downloadAndCachePdf(
        url: String,
        characterId: Long? = null,
        options: DownloadOptions = DownloadOptions()
    ): Result<CacheItem> = withContext(Dispatchers.IO) {
        try {
            val rateLimitResult = aiRateLimitService.checkRateLimit(
                provider = AIProvider.OPENAI,
                requestType = RequestType.DOWNLOAD
            )
            
            if (!rateLimitResult.allowed) {
                return@withContext Result.failure(
                    Exception("Rate limit exceeded: ${rateLimitResult.reason}")
                )
            }
            
            _downloadProgress.value = DownloadProgress(
                url = url,
                status = DownloadStatus.DOWNLOADING,
                progress = 0f,
                message = "Downloading PDF..."
            )
            
            // Download PDF file
            val request = Request.Builder()
                .url(url)
                .build()
            
            val response = httpClient.newCall(request).execute()
            
            if (!response.isSuccessful) {
                return@withContext Result.failure(
                    Exception("HTTP ${response.code}: ${response.message}")
                )
            }
            
            val pdfBytes = response.body?.byteStream()?.use { input ->
                input.readBytes()
            } ?: return@withContext Result.failure(Exception("Empty response body"))
            
            // Check file size limit
            val fileSizeMB = pdfBytes.size / (1024 * 1024)
            if (fileSizeMB > MAX_FILE_SIZE_MB) {
                return@withContext Result.failure(
                    Exception("File too large: ${fileSizeMB}MB (limit: ${MAX_FILE_SIZE_MB}MB)")
                )
            }
            
            _downloadProgress.value = DownloadProgress(
                url = url,
                status = DownloadStatus.PROCESSING,
                progress = 0.7f,
                message = "Processing PDF..."
            )
            
            // Extract text from PDF (simplified - would use PDF parser in production)
            val extractedText = extractTextFromPdf(pdfBytes)
            val title = extractTitleFromUrl(url) ?: "PDF Document"
            
            // Save PDF file
            val fileHash = calculateHash(pdfBytes)
            val pdfFile = File(cacheDir, "${fileHash}.pdf")
            pdfFile.writeBytes(pdfBytes)
            
            // Create cache item
            val cacheItem = createCacheItem(
                url = url,
                content = extractedText,
                title = title,
                type = ContentType.PDF,
                characterId = characterId,
                originalUrl = url,
                sourceDomain = URL(url).host,
                filePath = pdfFile.absolutePath,
                metadata = mapOf(
                    "file_size" to pdfBytes.size.toString(),
                    "file_hash" to fileHash,
                    "download_date" to SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault()).format(Date()),
                    "pdf_pages" to estimatePdfPages(pdfBytes.size).toString()
                )
            )
            
            _downloadProgress.value = DownloadProgress(
                url = url,
                status = DownloadStatus.COMPLETED,
                progress = 1f,
                message = "PDF cached successfully"
            )
            
            aiRateLimitService.recordRequest(
                provider = AIProvider.OPENAI,
                requestType = RequestType.DOWNLOAD,
                success = true,
                responseTimeMs = 0,
                tokensUsed = extractedText.length / 4 // Rough token estimate
            )
            
            refreshCacheItems()
            Result.success(cacheItem)
            
        } catch (e: Exception) {
            _downloadProgress.value = null
            aiRateLimitService.recordRequest(
                provider = AIProvider.OPENAI,
                requestType = RequestType.DOWNLOAD,
                success = false,
                responseTimeMs = 0
            )
            ErrorLogger.logError("EnhancedAIContentCache", "Failed to download PDF: $url", e)
            Result.failure(e)
        }
    }
    
    /**
     * Download and cache an article with images
     */
    suspend fun downloadAndCacheArticle(
        url: String,
        characterId: Long? = null,
        includeImages: Boolean = true
    ): Result<CacheItem> = withContext(Dispatchers.IO) {
        try {
            val rateLimitResult = aiRateLimitService.checkRateLimit(
                provider = AIProvider.OPENAI,
                requestType = RequestType.DOWNLOAD
            )
            
            if (!rateLimitResult.allowed) {
                return@withContext Result.failure(
                    Exception("Rate limit exceeded: ${rateLimitResult.reason}")
                )
            }
            
            _downloadProgress.value = DownloadProgress(
                url = url,
                status = DownloadStatus.DOWNLOADING,
                progress = 0f,
                message = "Downloading article..."
            )
            
            // Download article
            val request = Request.Builder()
                .url(url)
                .addHeader("User-Agent", "Mozilla/5.0 (compatible; CleverFerret/1.0)")
                .build()
            
            val response = httpClient.newCall(request).execute()
            
            if (!response.isSuccessful) {
                return@withContext Result.failure(
                    Exception("HTTP ${response.code}: ${response.message}")
                )
            }
            
            val html = response.body?.string() ?: ""
            _downloadProgress.value = DownloadProgress(
                url = url,
                status = DownloadStatus.PROCESSING,
                progress = 0.3f,
                message = "Extracting article content..."
            )
            
            // Extract article content
            val articleData = extractArticleContent(html)
            val title = articleData.title ?: extractTitleFromUrl(url) ?: "Article"
            
            // Download images if requested
            val downloadedImages = mutableListOf<String>()
            if (includeImages) {
                articleData.imageUrls.forEachIndexed { index, imageUrl ->
                    try {
                        _downloadProgress.value = DownloadProgress(
                            url = url,
                            status = DownloadStatus.PROCESSING,
                            progress = 0.3f + (0.4f * index / articleData.imageUrls.size),
                            message = "Downloading image ${index + 1}/${articleData.imageUrls.size}..."
                        )
                        
                        val imageFile = downloadImage(imageUrl)
                        if (imageFile != null) {
                            downloadedImages.add(imageFile.absolutePath)
                        }
                    } catch (e: Exception) {
                        ErrorLogger.logWarning("EnhancedAIContentCache", "Failed to download image: $imageUrl", e)
                    }
                }
            }
            
            _downloadProgress.value = DownloadProgress(
                url = url,
                status = DownloadStatus.PROCESSING,
                progress = 0.8f,
                message = "Creating cache entry..."
            )
            
            // Create cache item
            val cacheItem = createCacheItem(
                url = url,
                content = articleData.content,
                title = title,
                type = ContentType.ARTICLE,
                characterId = characterId,
                originalUrl = url,
                sourceDomain = URL(url).host,
                metadata = mapOf(
                    "author" to (articleData.author ?: ""),
                    "publish_date" to (articleData.publishDate ?: ""),
                    "content_length" to articleData.content.length.toString(),
                    "image_count" to downloadedImages.size.toString(),
                    "downloaded_images" to downloadedImages.joinToString(","),
                    "download_date" to SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault()).format(Date())
                )
            )
            
            _downloadProgress.value = DownloadProgress(
                url = url,
                status = DownloadStatus.COMPLETED,
                progress = 1f,
                message = "Article cached successfully"
            )
            
            aiRateLimitService.recordRequest(
                provider = AIProvider.OPENAI,
                requestType = RequestType.DOWNLOAD,
                success = true,
                responseTimeMs = 0
            )
            
            refreshCacheItems()
            Result.success(cacheItem)
            
        } catch (e: Exception) {
            _downloadProgress.value = null
            aiRateLimitService.recordRequest(
                provider = AIProvider.OPENAI,
                requestType = RequestType.DOWNLOAD,
                success = false,
                responseTimeMs = 0
            )
            ErrorLogger.logError("EnhancedAIContentCache", "Failed to download article: $url", e)
            Result.failure(e)
        }
    }
    
    // ==================== Cache Management ====================
    
    /**
     * Search cached content
     */
    fun searchCachedContent(query: String, characterId: Long? = null): List<CacheItem> {
        val items = _cacheItems.value
        val searchQuery = query.lowercase()
        
        return items.filter { item ->
            // Filter by character if specified
            if (characterId != null && item.characterId != characterId) return@filter false
            
            // Search in title and content
            item.title.lowercase().contains(searchQuery) ||
            item.content.lowercase().contains(searchQuery) ||
            item.tags.any { it.lowercase().contains(searchQuery) }
        }.sortedByDescending { it.createdAt }
    }
    
    /**
     * Get cache item by ID
     */
    fun getCacheItem(id: String): CacheItem? {
        return _cacheItems.value.find { it.id == id }
    }
    
    /**
     * Delete cache item
     */
    suspend fun deleteCacheItem(id: String): Boolean = withContext(Dispatchers.IO) {
        try {
            val item = getCacheItem(id) ?: return@withContext false
            
            // Delete content file if exists
            item.filePath?.let { filePath ->
                File(filePath).delete()
            }
            
            // Delete metadata file
            val metadataFile = File(cacheDir, "${id}$METADATA_FILE_EXTENSION")
            metadataFile.delete()
            
            refreshCacheItems()
            true
        } catch (e: Exception) {
            ErrorLogger.logError("EnhancedAIContentCache", "Failed to delete cache item: $id", e)
            false
        }
    }
    
    /**
     * Clear all cached content
     */
    suspend fun clearCache(): Boolean = withContext(Dispatchers.IO) {
        try {
            cacheDir.listFiles()?.forEach { file ->
                file.deleteRecursively()
            }
            refreshCacheItems()
            true
        } catch (e: Exception) {
            ErrorLogger.logError("EnhancedAIContentCache", "Failed to clear cache", e)
            false
        }
    }
    
    /**
     * Get cache statistics
     */
    fun getCacheStatistics(): CacheStatistics {
        val items = _cacheItems.value
        val totalSize = items.sumOf { it.sizeBytes }
        val sizeByType = items.groupBy { it.type }
            .mapValues { (_, items) -> items.sumOf { it.sizeBytes } }
        
        return CacheStatistics(
            totalItems = items.size,
            totalSizeBytes = totalSize,
            totalSizeMB = totalSize / (1024.0 * 1024.0),
            sizeByType = sizeByType,
            oldestItem = items.minByOrNull { it.createdAt }?.createdAt,
            newestItem = items.maxByOrNull { it.createdAt }?.createdAt,
            cacheUsagePercent = (totalSize / (MAX_CACHE_SIZE_MB * 1024.0 * 1024.0)) * 100
        )
    }
    
    // ==================== Private Helper Methods ====================
    
    private fun createCacheItem(
        url: String,
        content: String,
        title: String,
        type: ContentType,
        characterId: Long?,
        originalUrl: String,
        sourceDomain: String,
        filePath: String? = null,
        metadata: Map<String, String> = emptyMap()
    ): CacheItem {
        val id = generateId(url, characterId)
        val now = System.currentTimeMillis()
        
        val item = CacheItem(
            id = id,
            url = url,
            title = title,
            content = content,
            type = type,
            characterId = characterId,
            originalUrl = originalUrl,
            sourceDomain = sourceDomain,
            filePath = filePath,
            sizeBytes = (content.length + (filePath?.let { File(it).length() } ?: 0)),
            tags = extractTags(content, type),
            createdAt = now,
            lastAccessed = now,
            metadata = metadata
        )
        
        // Save metadata
        saveCacheItemMetadata(item)
        return item
    }
    
    private fun saveCacheItemMetadata(item: CacheItem) {
        val metadataFile = File(cacheDir, "${item.id}$METADATA_FILE_EXTENSION")
        val metadataJson = json.encodeToString(item)
        metadataFile.writeText(metadataJson)
    }
    
    private fun loadCacheItems(): List<CacheItem> {
        return try {
            cacheDir.listFiles { _, name -> name.endsWith(METADATA_FILE_EXTENSION) }
                ?.mapNotNull { file ->
                    try {
                        json.decodeFromString<CacheItem>(file.readText())
                    } catch (e: Exception) {
                        ErrorLogger.logWarning("EnhancedAIContentCache", "Failed to load metadata: ${file.name}", e)
                        null
                    }
                }?.sortedByDescending { it.createdAt }
                ?: emptyList()
        } catch (e: Exception) {
            ErrorLogger.logError("EnhancedAIContentCache", "Failed to load cache items", e)
            emptyList()
        }
    }
    
    private fun refreshCacheItems() {
        _cacheItems.value = loadCacheItems()
        _cacheStats.value = getCacheStatistics()
    }
    
    private fun cleanupExpiredItems() {
        val cutoffTime = System.currentTimeMillis() - (MAX_ITEM_AGE_DAYS * 24 * 60 * 60 * 1000L)
        val expiredItems = _cacheItems.value.filter { it.createdAt < cutoffTime }
        
        expiredItems.forEach { item ->
            deleteCacheItem(item.id)
        }
    }
    
    // Content extraction methods (simplified implementations)
    
    private fun extractReadableText(html: String): String {
        return html
            .replace(Regex("<script[^>]*>[\\s\\S]*?</script>", RegexOption.IGNORE_CASE), "")
            .replace(Regex("<style[^>]*>[\\s\\S]*?</style>", RegexOption.IGNORE_CASE), "")
            .replace(Regex("<[^>]+>"), " ")
            .replace(Regex("&\\w+;"), " ")
            .replace(Regex("\\s+"), " ")
            .trim()
    }
    
    private fun extractTitle(html: String): String? {
        val titleRegex = Regex("<title[^>]*>([^<]+)</title>", RegexOption.IGNORE_CASE)
        return titleRegex.find(html)?.groupValues?.get(1)?.trim()
    }
    
    private fun extractTitleFromUrl(url: String): String? {
        return try {
            URL(url).path.split("/").lastOrNull()?.replace(Regex("\\.[^.]+$"), "")
        } catch (e: Exception) {
            null
        }
    }
    
    private fun extractTextFromPdf(pdfBytes: ByteArray): String {
        // Simplified PDF text extraction
        // In production, would use a proper PDF library like PDFBox or AndroidPdfViewer
        return "PDF content extraction not implemented. File size: ${pdfBytes.size} bytes."
    }
    
    private fun estimatePdfPages(fileSize: Int): Int {
        // Rough estimation: average PDF page is ~100KB
        return maxOf(1, fileSize / (100 * 1024))
    }
    
    private fun extractArticleContent(html: String): ArticleData {
        val content = extractReadableText(html)
        val title = extractTitle(html)
        
        // Extract author and publish date (simplified)
        val author = extractAuthor(html)
        val publishDate = extractPublishDate(html)
        
        // Extract image URLs
        val imageUrls = extractImageUrls(html)
        
        return ArticleData(
            title = title,
            content = content,
            author = author,
            publishDate = publishDate,
            imageUrls = imageUrls
        )
    }
    
    private fun extractAuthor(html: String): String? {
        val authorPatterns = listOf(
            Regex("author[^:]*:([^<]+)", RegexOption.IGNORE_CASE),
            Regex("by\\s+([^.]+)", RegexOption.IGNORE_CASE)
        )
        
        for (pattern in authorPatterns) {
            pattern.find(html)?.groupValues?.get(1)?.let { author ->
                return author.trim().take(100)
            }
        }
        return null
    }
    
    private fun extractPublishDate(html: String): String? {
        val datePatterns = listOf(
            Regex("(\\d{4}-\\d{2}-\\d{2})"),
            Regex("(\\d{1,2}/\\d{1,2}/\\d{4})")
        )
        
        for (pattern in datePatterns) {
            pattern.find(html)?.groupValues?.get(1)?.let { date ->
                return date.trim()
            }
        }
        return null
    }
    
    private fun extractImageUrls(html: String): List<String> {
        val imgRegex = Regex("<img[^>]+src=[&quot;']([^&quot;']+)[&quot;']", RegexOption.IGNORE_CASE)
        return imgRegex.findAll(html).map { it.groupValues[1] }.toList()
    }
    
    private suspend fun downloadImage(imageUrl: String): File? = withContext(Dispatchers.IO) {
        try {
            val request = Request.Builder().url(imageUrl).build()
            val response = httpClient.newCall(request).execute()
            
            if (response.isSuccessful) {
                val imageBytes = response.body?.byteStream()?.use { it.readBytes() }
                if (imageBytes != null) {
                    val imageHash = calculateHash(imageBytes)
                    val extension = getImageExtension(imageUrl) ?: "jpg"
                    val imageFile = File(cacheDir, "${imageHash}.${extension}")
                    imageFile.writeBytes(imageBytes)
                    return@withContext imageFile
                }
            }
            null
        } catch (e: Exception) {
            ErrorLogger.logWarning("EnhancedAIContentCache", "Failed to download image: $imageUrl", e)
            null
        }
    }
    
    private fun getImageExtension(url: String): String? {
        return try {
            URL(url).path.substringAfterLast('.', "")
        } catch (e: Exception) {
            null
        }
    }
    
    private fun extractTags(content: String, type: ContentType): List<String> {
        val tags = mutableListOf<String>()
        tags.add(type.name.lowercase())
        
        // Extract potential keywords based on content
        val words = content.split(Regex("\\s+")).filter { it.length > 4 }
        val commonWords = words.groupingBy { it.lowercase() }.eachCount()
            .filter { it.value >= 3 }
            .keys
            .take(5)
        
        tags.addAll(commonWords)
        return tags.distinct()
    }
    
    private fun generateId(url: String, characterId: Long?): String {
        val input = "$url${characterId ?: ""}"
        return calculateHash(input.toByteArray())
    }
    
    private fun calculateHash(data: ByteArray): String {
        val digest = MessageDigest.getInstance("SHA-256")
        val hash = digest.digest(data)
        return hash.joinToString("") { "%02x".format(it) }
    }
}

// ==================== Data Classes ====================

enum class ContentType {
    WEB_PAGE,
    ARTICLE,
    PDF,
    IMAGE,
    VIDEO,
    DOCUMENT,
    RESEARCH_PAPER
}

enum class DownloadStatus {
    PENDING,
    DOWNLOADING,
    PROCESSING,
    COMPLETED,
    FAILED
}

data class DownloadOptions(
    val includeImages: Boolean = true,
    val maxFileSizeMB: Int = 50,
    val extractFullText: Boolean = true,
    val generateSummary: Boolean = false
)

data class DownloadProgress(
    val url: String,
    val status: DownloadStatus,
    val progress: Float,
    val message: String,
    val bytesDownloaded: Long = 0,
    val totalBytes: Long = 0
)

data class CacheItem(
    val id: String,
    val url: String,
    val title: String,
    val content: String,
    val type: ContentType,
    val characterId: Long?,
    val originalUrl: String,
    val sourceDomain: String,
    val filePath: String?,
    val sizeBytes: Long,
    val tags: List<String>,
    val createdAt: Long,
    var lastAccessed: Long,
    val metadata: Map<String, String>
) {
    val contentSnippet: String 
        get() = content.take(200) + if (content.length > 200) "..." else ""
    val ageDays: Long 
        get() = (System.currentTimeMillis() - createdAt) / (24 * 60 * 60 * 1000)
    val formattedSize: String 
        get() = when {
            sizeBytes < 1024 -> "${sizeBytes}B"
            sizeBytes < 1024 * 1024 -> "${sizeBytes / 1024}KB"
            else -> "${sizeBytes / (1024 * 1024)}MB"
        }
}

data class CacheStatistics(
    val totalItems: Int,
    val totalSizeBytes: Long,
    val totalSizeMB: Double,
    val sizeByType: Map<ContentType, Long>,
    val oldestItem: Long?,
    val newestItem: Long?,
    val cacheUsagePercent: Double
)

data class ArticleData(
    val title: String?,
    val content: String,
    val author: String?,
    val publishDate: String?,
    val imageUrls: List<String>
)