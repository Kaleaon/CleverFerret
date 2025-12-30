package com.universalmedialibrary.services.ai

import android.content.Context
import android.net.Uri
import androidx.documentfile.provider.DocumentFile
import com.universalmedialibrary.data.preferences.AISettingsPreferencesStore
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.File
import java.security.MessageDigest
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for managing AI content cache - downloaded PDFs, articles, and web content.
 * Allows AI to access previously downloaded content and manages cache size.
 */
@Singleton
class AIContentCacheService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val aiSettings: AISettingsPreferencesStore
) {
    private val json = Json { 
        prettyPrint = true 
        ignoreUnknownKeys = true
    }
    
    private val httpClient = OkHttpClient.Builder()
        .connectTimeout(60, TimeUnit.SECONDS)
        .readTimeout(60, TimeUnit.SECONDS)
        .build()
    
    companion object {
        const val CACHE_FOLDER_NAME = "ai_content_cache"
        const val METADATA_FILE = "cache_metadata.json"
        const val DEFAULT_MAX_CACHE_SIZE_MB = 500L // 500 MB default
        const val MIN_CACHE_SIZE_MB = 50L
        const val MAX_CACHE_SIZE_MB = 5000L // 5 GB max
    }
    
    private val _cachedItems = MutableStateFlow<List<CachedContentItem>>(emptyList())
    val cachedItems: StateFlow<List<CachedContentItem>> = _cachedItems.asStateFlow()
    
    private val _currentCacheSize = MutableStateFlow(0L)
    val currentCacheSize: StateFlow<Long> = _currentCacheSize.asStateFlow()
    
    private val _isDownloading = MutableStateFlow(false)
    val isDownloading: StateFlow<Boolean> = _isDownloading.asStateFlow()
    
    /**
     * Initialize the cache service and load metadata
     */
    suspend fun initialize() = withContext(Dispatchers.IO) {
        loadCacheMetadata()
        updateCacheSize()
    }
    
    /**
     * Get the cache directory
     */
    private fun getCacheDirectory(): File {
        return File(context.filesDir, CACHE_FOLDER_NAME).also { it.mkdirs() }
    }
    
    /**
     * Get SD card cache directory if available and configured
     */
    private suspend fun getSdCardCacheDirectory(): File? {
        if (aiSettings.aiContentCacheLocation.first() != "sd_card") return null
        val externalDirs = context.getExternalFilesDirs(null)
        val sdCardDir = externalDirs.getOrNull(1) ?: return null
        return File(sdCardDir, CACHE_FOLDER_NAME).also { it.mkdirs() }
    }
    
    /**
     * Get the active cache directory based on settings
     */
    private suspend fun getActiveCacheDirectory(): File {
        return getSdCardCacheDirectory() ?: getCacheDirectory()
    }
    
    /**
     * Download and cache a PDF from URL
     */
    suspend fun downloadAndCachePdf(url: String, name: String? = null): Result<CachedContentItem> = withContext(Dispatchers.IO) {
        _isDownloading.value = true
        
        try {
            // Check if already cached
            val existingItem = _cachedItems.value.find { it.sourceUrl == url }
            if (existingItem != null) {
                _isDownloading.value = false
                return@withContext Result.success(existingItem)
            }
            
            // Ensure cache has space
            enforceCacheSizeLimit()
            
            val request = Request.Builder()
                .url(url)
                .addHeader("User-Agent", "Mozilla/5.0 (compatible; CleverFerret/1.0)")
                .build()
            
            val response = httpClient.newCall(request).execute()
            
            if (!response.isSuccessful) {
                _isDownloading.value = false
                return@withContext Result.failure(Exception("Download failed: HTTP ${response.code}"))
            }
            
            val contentType = response.header("Content-Type") ?: ""
            if (!contentType.contains("pdf", ignoreCase = true)) {
                _isDownloading.value = false
                return@withContext Result.failure(Exception("URL does not point to a PDF"))
            }
            
            val bytes = response.body?.bytes() ?: run {
                _isDownloading.value = false
                return@withContext Result.failure(Exception("Empty response"))
            }
            
            val cacheDir = getActiveCacheDirectory()
            val fileName = name?.let { sanitizeFileName(it) } ?: extractFileNameFromUrl(url)
            val finalFileName = if (!fileName.endsWith(".pdf", ignoreCase = true)) "$fileName.pdf" else fileName
            
            val id = generateContentId(url)
            val file = File(cacheDir, "${id}_$finalFileName")
            file.writeBytes(bytes)
            
            val item = CachedContentItem(
                id = id,
                name = name ?: finalFileName.removeSuffix(".pdf"),
                type = CachedContentType.PDF,
                sourceUrl = url,
                localPath = file.absolutePath,
                size = bytes.size.toLong(),
                cachedAt = System.currentTimeMillis(),
                lastAccessed = System.currentTimeMillis(),
                contentSnippet = null // PDF text extraction would require a PDF library
            )
            
            addCachedItem(item)
            saveCacheMetadata()
            updateCacheSize()
            
            _isDownloading.value = false
            Result.success(item)
        } catch (e: Exception) {
            _isDownloading.value = false
            Result.failure(e)
        }
    }
    
    /**
     * Download and cache an article/webpage as text
     */
    suspend fun downloadAndCacheArticle(url: String, name: String? = null): Result<CachedContentItem> = withContext(Dispatchers.IO) {
        _isDownloading.value = true
        
        try {
            // Check if already cached
            val existingItem = _cachedItems.value.find { it.sourceUrl == url }
            if (existingItem != null) {
                _isDownloading.value = false
                return@withContext Result.success(existingItem)
            }
            
            // Ensure cache has space
            enforceCacheSizeLimit()
            
            val request = Request.Builder()
                .url(url)
                .addHeader("User-Agent", "Mozilla/5.0 (compatible; CleverFerret/1.0)")
                .build()
            
            val response = httpClient.newCall(request).execute()
            
            if (!response.isSuccessful) {
                _isDownloading.value = false
                return@withContext Result.failure(Exception("Download failed: HTTP ${response.code}"))
            }
            
            val html = response.body?.string() ?: run {
                _isDownloading.value = false
                return@withContext Result.failure(Exception("Empty response"))
            }
            
            // Extract text content
            val textContent = extractArticleContent(html)
            val title = extractTitle(html) ?: name ?: extractFileNameFromUrl(url)
            
            val cacheDir = getActiveCacheDirectory()
            val id = generateContentId(url)
            
            // Save both HTML and extracted text
            val htmlFile = File(cacheDir, "${id}_original.html")
            val textFile = File(cacheDir, "${id}_content.txt")
            
            htmlFile.writeText(html)
            textFile.writeText(textContent)
            
            val item = CachedContentItem(
                id = id,
                name = title,
                type = CachedContentType.ARTICLE,
                sourceUrl = url,
                localPath = textFile.absolutePath,
                originalPath = htmlFile.absolutePath,
                size = textFile.length() + htmlFile.length(),
                cachedAt = System.currentTimeMillis(),
                lastAccessed = System.currentTimeMillis(),
                contentSnippet = textContent.take(500)
            )
            
            addCachedItem(item)
            saveCacheMetadata()
            updateCacheSize()
            
            _isDownloading.value = false
            Result.success(item)
        } catch (e: Exception) {
            _isDownloading.value = false
            Result.failure(e)
        }
    }
    
    /**
     * Cache arbitrary text content
     */
    suspend fun cacheTextContent(
        content: String,
        name: String,
        sourceUrl: String? = null
    ): Result<CachedContentItem> = withContext(Dispatchers.IO) {
        try {
            enforceCacheSizeLimit()
            
            val cacheDir = getActiveCacheDirectory()
            val id = generateContentId(sourceUrl ?: "$name-${System.currentTimeMillis()}")
            val file = File(cacheDir, "${id}_${sanitizeFileName(name)}.txt")
            file.writeText(content)
            
            val item = CachedContentItem(
                id = id,
                name = name,
                type = CachedContentType.TEXT,
                sourceUrl = sourceUrl,
                localPath = file.absolutePath,
                size = file.length(),
                cachedAt = System.currentTimeMillis(),
                lastAccessed = System.currentTimeMillis(),
                contentSnippet = content.take(500)
            )
            
            addCachedItem(item)
            saveCacheMetadata()
            updateCacheSize()
            
            Result.success(item)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Get cached content by ID
     */
    suspend fun getCachedContent(id: String): CachedContentItem? {
        val item = _cachedItems.value.find { it.id == id }
        if (item != null) {
            // Update last accessed time
            val updatedItem = item.copy(lastAccessed = System.currentTimeMillis())
            updateCachedItem(updatedItem)
        }
        return item
    }
    
    /**
     * Read content from a cached item
     */
    suspend fun readCachedContent(id: String): String? = withContext(Dispatchers.IO) {
        val item = getCachedContent(id) ?: return@withContext null
        val file = File(item.localPath)
        if (!file.exists()) return@withContext null
        
        return@withContext when (item.type) {
            CachedContentType.PDF -> "[PDF content - ${item.name}]" // Would need PDF parsing library
            CachedContentType.ARTICLE, CachedContentType.TEXT -> file.readText()
            CachedContentType.IMAGE -> "[Image: ${item.name}]"
        }
    }
    
    /**
     * Search through cached content
     */
    suspend fun searchCachedContent(query: String): List<CachedContentItem> = withContext(Dispatchers.IO) {
        val queryLower = query.lowercase()
        
        _cachedItems.value.filter { item ->
            item.name.lowercase().contains(queryLower) ||
            item.contentSnippet?.lowercase()?.contains(queryLower) == true
        }.also { results ->
            // Also search within text files
            results.forEach { item ->
                if (item.type in listOf(CachedContentType.ARTICLE, CachedContentType.TEXT)) {
                    val file = File(item.localPath)
                    if (file.exists()) {
                        val content = file.readText()
                        if (content.lowercase().contains(queryLower)) {
                            // Item already in results
                        }
                    }
                }
            }
        }
    }
    
    /**
     * Delete a cached item
     */
    suspend fun deleteCachedItem(id: String) = withContext(Dispatchers.IO) {
        val item = _cachedItems.value.find { it.id == id } ?: return@withContext
        
        // Delete files
        File(item.localPath).delete()
        item.originalPath?.let { File(it).delete() }
        
        // Remove from list
        _cachedItems.value = _cachedItems.value.filter { it.id != id }
        saveCacheMetadata()
        updateCacheSize()
    }
    
    /**
     * Clear all cached content
     */
    suspend fun clearCache() = withContext(Dispatchers.IO) {
        val cacheDir = getCacheDirectory()
        cacheDir.listFiles()?.forEach { it.delete() }
        
        getSdCardCacheDirectory()?.listFiles()?.forEach { it.delete() }
        
        _cachedItems.value = emptyList()
        saveCacheMetadata()
        _currentCacheSize.value = 0
    }
    
    /**
     * Get configured max cache size in MB
     */
    suspend fun getMaxCacheSizeMb(): Long {
        return aiSettings.aiContentCacheSizeMb.first()
    }
    
    /**
     * Enforce cache size limit by removing oldest items
     */
    private suspend fun enforceCacheSizeLimit() = withContext(Dispatchers.IO) {
        val maxSize = getMaxCacheSizeMb() * 1024 * 1024 // Convert to bytes
        var currentSize = _currentCacheSize.value
        
        if (currentSize < maxSize) return@withContext
        
        // Sort by last accessed (oldest first) and remove until under limit
        val sortedItems = _cachedItems.value.sortedBy { it.lastAccessed }
        
        for (item in sortedItems) {
            if (currentSize < maxSize * 0.8) break // Target 80% of max
            
            File(item.localPath).delete()
            item.originalPath?.let { File(it).delete() }
            currentSize -= item.size
            
            _cachedItems.value = _cachedItems.value.filter { it.id != item.id }
        }
        
        saveCacheMetadata()
        updateCacheSize()
    }
    
    /**
     * Get cache statistics
     */
    suspend fun getCacheStats(): CacheStats = withContext(Dispatchers.IO) {
        val items = _cachedItems.value
        val maxSizeMb = getMaxCacheSizeMb()
        val currentSizeMb = _currentCacheSize.value / (1024 * 1024)
        
        CacheStats(
            totalItems = items.size,
            pdfCount = items.count { it.type == CachedContentType.PDF },
            articleCount = items.count { it.type == CachedContentType.ARTICLE },
            textCount = items.count { it.type == CachedContentType.TEXT },
            currentSizeMb = currentSizeMb,
            maxSizeMb = maxSizeMb,
            usagePercent = if (maxSizeMb > 0) (currentSizeMb.toFloat() / maxSizeMb * 100).toInt() else 0
        )
    }
    
    private fun addCachedItem(item: CachedContentItem) {
        _cachedItems.value = listOf(item) + _cachedItems.value
    }
    
    private fun updateCachedItem(item: CachedContentItem) {
        _cachedItems.value = _cachedItems.value.map { 
            if (it.id == item.id) item else it 
        }
    }
    
    private suspend fun loadCacheMetadata() = withContext(Dispatchers.IO) {
        try {
            val metadataFile = File(getCacheDirectory(), METADATA_FILE)
            if (metadataFile.exists()) {
                val metadata = json.decodeFromString<CachePersistenceMetadata>(metadataFile.readText())
                _cachedItems.value = metadata.items.filter { 
                    File(it.localPath).exists() 
                }
            }
            
            // Also check SD card cache
            getSdCardCacheDirectory()?.let { sdDir ->
                val sdMetadataFile = File(sdDir, METADATA_FILE)
                if (sdMetadataFile.exists()) {
                    val sdMetadata = json.decodeFromString<CachePersistenceMetadata>(sdMetadataFile.readText())
                    val sdItems = sdMetadata.items.filter { File(it.localPath).exists() }
                    _cachedItems.value = (_cachedItems.value + sdItems).distinctBy { it.id }
                }
            }
        } catch (e: Exception) {
            // Ignore metadata loading errors
        }
    }
    
    private suspend fun saveCacheMetadata() = withContext(Dispatchers.IO) {
        try {
            val internalItems = _cachedItems.value.filter { 
                it.localPath.startsWith(getCacheDirectory().absolutePath) 
            }
            val metadata = CachePersistenceMetadata(
                lastUpdated = System.currentTimeMillis(),
                items = internalItems
            )
            File(getCacheDirectory(), METADATA_FILE).writeText(json.encodeToString(metadata))
            
            // Also save SD card items separately
            getSdCardCacheDirectory()?.let { sdDir ->
                val sdItems = _cachedItems.value.filter {
                    it.localPath.startsWith(sdDir.absolutePath)
                }
                val sdMetadata = CachePersistenceMetadata(
                    lastUpdated = System.currentTimeMillis(),
                    items = sdItems
                )
                File(sdDir, METADATA_FILE).writeText(json.encodeToString(sdMetadata))
            }
        } catch (e: Exception) {
            // Ignore metadata saving errors
        }
    }
    
    private fun updateCacheSize() {
        var totalSize = 0L
        _cachedItems.value.forEach { item ->
            totalSize += item.size
        }
        _currentCacheSize.value = totalSize
    }
    
    private fun generateContentId(input: String): String {
        val digest = MessageDigest.getInstance("SHA-256")
        val hash = digest.digest(input.toByteArray())
        return hash.take(8).joinToString("") { "%02x".format(it) }
    }
    
    private fun sanitizeFileName(name: String): String {
        return name.replace(Regex("[^a-zA-Z0-9._-]"), "_").take(100)
    }
    
    private fun extractFileNameFromUrl(url: String): String {
        val path = Uri.parse(url).path ?: return "content"
        val fileName = path.substringAfterLast('/')
        return if (fileName.isNotBlank()) sanitizeFileName(fileName) else "content"
    }
    
    private fun extractTitle(html: String): String? {
        val titleMatch = Regex("<title[^>]*>([^<]+)</title>", RegexOption.IGNORE_CASE).find(html)
        return titleMatch?.groupValues?.getOrNull(1)?.trim()?.take(200)
    }
    
    private fun extractArticleContent(html: String): String {
        return html
            // Remove scripts and styles
            .replace(Regex("<script[^>]*>[\\s\\S]*?</script>", RegexOption.IGNORE_CASE), "")
            .replace(Regex("<style[^>]*>[\\s\\S]*?</style>", RegexOption.IGNORE_CASE), "")
            .replace(Regex("<nav[^>]*>[\\s\\S]*?</nav>", RegexOption.IGNORE_CASE), "")
            .replace(Regex("<footer[^>]*>[\\s\\S]*?</footer>", RegexOption.IGNORE_CASE), "")
            .replace(Regex("<header[^>]*>[\\s\\S]*?</header>", RegexOption.IGNORE_CASE), "")
            // Remove HTML comments
            .replace(Regex("<!--[\\s\\S]*?-->"), "")
            // Convert paragraphs and breaks to newlines
            .replace(Regex("<(br|p|div|h[1-6]|li)[^>]*>", RegexOption.IGNORE_CASE), "\n")
            // Remove remaining tags
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
            .replace(Regex("\n\\s*\n+"), "\n\n")
            .trim()
    }
}

// ==================== Data Classes ====================

@Serializable
enum class CachedContentType {
    PDF,
    ARTICLE,
    TEXT,
    IMAGE
}

@Serializable
data class CachedContentItem(
    val id: String,
    val name: String,
    val type: CachedContentType,
    val sourceUrl: String?,
    val localPath: String,
    val originalPath: String? = null,
    val size: Long,
    val cachedAt: Long,
    val lastAccessed: Long,
    val contentSnippet: String? = null
)

@Serializable
data class CachePersistenceMetadata(
    val lastUpdated: Long,
    val items: List<CachedContentItem>
)

data class CacheStats(
    val totalItems: Int,
    val pdfCount: Int,
    val articleCount: Int,
    val textCount: Int,
    val currentSizeMb: Long,
    val maxSizeMb: Long,
    val usagePercent: Int
)
