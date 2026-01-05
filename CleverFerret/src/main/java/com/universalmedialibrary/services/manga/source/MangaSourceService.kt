package com.universalmedialibrary.services.manga.source

import android.content.Context
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONArray
import org.json.JSONObject
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Manga Source Service
 * 
 * Manages online manga sources for browsing and downloading manga
 * Designed to integrate with futon-parsers library when available
 * 
 * Features:
 * - Browse 1200+ manga sources (via futon-parsers)
 * - Search across multiple sources
 * - Get chapter pages for reading
 * - Track chapter updates
 * - Source management (enable/disable, pin, sort)
 */
@Singleton
class MangaSourceService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val httpClient: OkHttpClient,
    private val sourceRepository: MangaSourceRepository
) {
    
    companion object {
        private const val TAG = "MangaSourceService"
        
        // Popular built-in sources for when futon-parsers is not available
        val BUILTIN_SOURCES = listOf(
            MangaSource(
                id = "mangadex",
                name = "MangaDex",
                locale = "en",
                domain = "mangadex.org",
                favicon = "https://mangadex.org/favicon.ico"
            ),
            MangaSource(
                id = "mangaplus",
                name = "Manga Plus",
                locale = "en",
                domain = "mangaplus.shueisha.co.jp",
                favicon = "https://mangaplus.shueisha.co.jp/favicon.ico"
            ),
            MangaSource(
                id = "webtoons",
                name = "Webtoons",
                locale = "en",
                domain = "webtoons.com",
                favicon = "https://webtoons.com/favicon.ico"
            ),
            MangaSource(
                id = "mangasee",
                name = "MangaSee",
                locale = "en",
                domain = "mangasee123.com"
            ),
            MangaSource(
                id = "mangakakalot",
                name = "Mangakakalot",
                locale = "en",
                domain = "mangakakalot.com"
            )
        )
    }
    
    private val _availableSources = MutableStateFlow<List<MangaSource>>(emptyList())
    val availableSources: StateFlow<List<MangaSource>> = _availableSources.asStateFlow()
    
    private val _enabledSources = MutableStateFlow<List<MangaSource>>(emptyList())
    val enabledSources: StateFlow<List<MangaSource>> = _enabledSources.asStateFlow()
    
    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()
    
    init {
        loadSources()
    }
    
    private fun loadSources() {
        _availableSources.value = BUILTIN_SOURCES
        _enabledSources.value = BUILTIN_SOURCES.filter { it.isEnabled }
    }
    
    /**
     * Get all available manga sources
     */
    suspend fun getAllSources(): List<MangaSource> = withContext(Dispatchers.IO) {
        val savedSources = sourceRepository.getAllSources()
        if (savedSources.isEmpty()) {
            BUILTIN_SOURCES
        } else {
            savedSources
        }
    }
    
    /**
     * Get enabled sources
     */
    suspend fun getEnabledSources(): List<MangaSource> = withContext(Dispatchers.IO) {
        getAllSources().filter { it.isEnabled }
    }
    
    /**
     * Enable or disable a source
     */
    suspend fun setSourceEnabled(sourceId: String, enabled: Boolean) {
        sourceRepository.setSourceEnabled(sourceId, enabled)
        loadSources()
    }
    
    /**
     * Pin or unpin a source
     */
    suspend fun setSourcePinned(sourceId: String, pinned: Boolean) {
        sourceRepository.setSourcePinned(sourceId, pinned)
        loadSources()
    }
    
    /**
     * Search for manga across a source
     */
    suspend fun search(
        sourceId: String,
        query: String,
        page: Int = 0
    ): Result<MangaListPage> = withContext(Dispatchers.IO) {
        try {
            _isLoading.value = true
            
            when (sourceId) {
                "mangadex" -> searchMangaDex(query, page)
                else -> Result.failure(Exception("Source $sourceId not yet implemented"))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Search failed for $sourceId", e)
            Result.failure(e)
        } finally {
            _isLoading.value = false
        }
    }
    
    /**
     * Get popular manga from a source
     */
    suspend fun getPopular(
        sourceId: String,
        page: Int = 0
    ): Result<MangaListPage> = withContext(Dispatchers.IO) {
        try {
            _isLoading.value = true
            
            when (sourceId) {
                "mangadex" -> getPopularMangaDex(page)
                else -> Result.failure(Exception("Source $sourceId not yet implemented"))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Get popular failed for $sourceId", e)
            Result.failure(e)
        } finally {
            _isLoading.value = false
        }
    }
    
    /**
     * Get latest updates from a source
     */
    suspend fun getLatestUpdates(
        sourceId: String,
        page: Int = 0
    ): Result<MangaListPage> = withContext(Dispatchers.IO) {
        try {
            _isLoading.value = true
            
            when (sourceId) {
                "mangadex" -> getLatestMangaDex(page)
                else -> Result.failure(Exception("Source $sourceId not yet implemented"))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Get latest failed for $sourceId", e)
            Result.failure(e)
        } finally {
            _isLoading.value = false
        }
    }
    
    /**
     * Get manga details including chapters
     */
    suspend fun getMangaDetails(
        sourceId: String,
        mangaUrl: String
    ): Result<OnlineManga> = withContext(Dispatchers.IO) {
        try {
            when (sourceId) {
                "mangadex" -> getMangaDetailsMangaDex(mangaUrl)
                else -> Result.failure(Exception("Source $sourceId not yet implemented"))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Get details failed", e)
            Result.failure(e)
        }
    }
    
    /**
     * Get chapter pages for reading
     */
    suspend fun getChapterPages(
        sourceId: String,
        chapterId: Long,
        chapterUrl: String
    ): Result<List<MangaPage>> = withContext(Dispatchers.IO) {
        try {
            when (sourceId) {
                "mangadex" -> getChapterPagesMangaDex(chapterId, chapterUrl)
                else -> Result.failure(Exception("Source $sourceId not yet implemented"))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Get pages failed", e)
            Result.failure(e)
        }
    }
    
    // ========================================
    // MangaDex Implementation
    // ========================================
    
    private val mangaDexBaseUrl = "https://api.mangadex.org"
    
    private suspend fun searchMangaDex(query: String, page: Int): Result<MangaListPage> {
        val limit = 20
        val offset = page * limit
        
        val url = "$mangaDexBaseUrl/manga?title=$query&limit=$limit&offset=$offset" +
                  "&includes[]=cover_art&includes[]=author"
        
        val request = Request.Builder()
            .url(url)
            .header("User-Agent", "CleverFerret/1.0")
            .build()
        
        httpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                return Result.failure(Exception("HTTP error: ${response.code}"))
            }
            
            val json = JSONObject(response.body?.string() ?: "")
            val data = json.getJSONArray("data")
            val total = json.optInt("total", 0)
            
            val manga = parseMangaDexList(data)
            
            return Result.success(MangaListPage(
                manga = manga,
                hasNextPage = offset + limit < total
            ))
        }
    }
    
    private suspend fun getPopularMangaDex(page: Int): Result<MangaListPage> {
        val limit = 20
        val offset = page * limit
        
        val url = "$mangaDexBaseUrl/manga?order[followedCount]=desc&limit=$limit&offset=$offset" +
                  "&includes[]=cover_art&includes[]=author"
        
        val request = Request.Builder()
            .url(url)
            .header("User-Agent", "CleverFerret/1.0")
            .build()
        
        httpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                return Result.failure(Exception("HTTP error: ${response.code}"))
            }
            
            val json = JSONObject(response.body?.string() ?: "")
            val data = json.getJSONArray("data")
            val total = json.optInt("total", 0)
            
            return Result.success(MangaListPage(
                manga = parseMangaDexList(data),
                hasNextPage = offset + limit < total
            ))
        }
    }
    
    private suspend fun getLatestMangaDex(page: Int): Result<MangaListPage> {
        val limit = 20
        val offset = page * limit
        
        val url = "$mangaDexBaseUrl/manga?order[latestUploadedChapter]=desc&limit=$limit&offset=$offset" +
                  "&includes[]=cover_art&includes[]=author"
        
        val request = Request.Builder()
            .url(url)
            .header("User-Agent", "CleverFerret/1.0")
            .build()
        
        httpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                return Result.failure(Exception("HTTP error: ${response.code}"))
            }
            
            val json = JSONObject(response.body?.string() ?: "")
            val data = json.getJSONArray("data")
            val total = json.optInt("total", 0)
            
            return Result.success(MangaListPage(
                manga = parseMangaDexList(data),
                hasNextPage = offset + limit < total
            ))
        }
    }
    
    private suspend fun getMangaDetailsMangaDex(mangaUrl: String): Result<OnlineManga> {
        val mangaId = mangaUrl.substringAfterLast("/")
        
        // Get manga details
        val detailsUrl = "$mangaDexBaseUrl/manga/$mangaId?includes[]=cover_art&includes[]=author&includes[]=artist"
        
        val detailsRequest = Request.Builder()
            .url(detailsUrl)
            .header("User-Agent", "CleverFerret/1.0")
            .build()
        
        val manga = httpClient.newCall(detailsRequest).execute().use { response ->
            if (!response.isSuccessful) {
                return Result.failure(Exception("HTTP error: ${response.code}"))
            }
            
            val json = JSONObject(response.body?.string() ?: "")
            parseMangaDexManga(json.getJSONObject("data"))
        }
        
        // Get chapters
        val chaptersUrl = "$mangaDexBaseUrl/manga/$mangaId/feed?limit=500&order[chapter]=asc&translatedLanguage[]=en"
        
        val chaptersRequest = Request.Builder()
            .url(chaptersUrl)
            .header("User-Agent", "CleverFerret/1.0")
            .build()
        
        val chapters = httpClient.newCall(chaptersRequest).execute().use { response ->
            if (!response.isSuccessful) {
                return Result.failure(Exception("HTTP error: ${response.code}"))
            }
            
            val json = JSONObject(response.body?.string() ?: "")
            parseMangaDexChapters(json.getJSONArray("data"), manga.id)
        }
        
        return Result.success(manga.copy(chapters = chapters))
    }
    
    private suspend fun getChapterPagesMangaDex(
        chapterId: Long,
        chapterUrl: String
    ): Result<List<MangaPage>> {
        val chapterMdId = chapterUrl.substringAfterLast("/")
        
        val url = "$mangaDexBaseUrl/at-home/server/$chapterMdId"
        
        val request = Request.Builder()
            .url(url)
            .header("User-Agent", "CleverFerret/1.0")
            .build()
        
        httpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                return Result.failure(Exception("HTTP error: ${response.code}"))
            }
            
            val json = JSONObject(response.body?.string() ?: "")
            val baseUrl = json.getString("baseUrl")
            val chapter = json.getJSONObject("chapter")
            val hash = chapter.getString("hash")
            val data = chapter.getJSONArray("data")
            
            val pages = (0 until data.length()).map { i ->
                val filename = data.getString(i)
                MangaPage(
                    id = i.toLong(),
                    chapterId = chapterId,
                    url = "$baseUrl/data/$hash/$filename"
                )
            }
            
            return Result.success(pages)
        }
    }
    
    // Helper parsing methods
    
    private fun parseMangaDexList(data: JSONArray): List<OnlineManga> {
        return (0 until data.length()).mapNotNull { i ->
            try {
                parseMangaDexManga(data.getJSONObject(i))
            } catch (e: Exception) {
                Log.e(TAG, "Failed to parse manga", e)
                null
            }
        }
    }
    
    private fun parseMangaDexManga(data: JSONObject): OnlineManga {
        val id = data.getString("id")
        val attributes = data.getJSONObject("attributes")
        val relationships = data.optJSONArray("relationships") ?: JSONArray()
        
        // Get title
        val titleObj = attributes.getJSONObject("title")
        val title = titleObj.optString("en")
            ?: titleObj.optString("ja-ro")
            ?: titleObj.keys().asSequence().firstOrNull()?.let { titleObj.getString(it) }
            ?: "Unknown"
        
        // Get alt title
        val altTitles = attributes.optJSONArray("altTitles")
        val altTitle = altTitles?.let { 
            (0 until it.length()).asSequence()
                .mapNotNull { i -> it.optJSONObject(i)?.optString("en") }
                .firstOrNull()
        }
        
        // Get description
        val descObj = attributes.optJSONObject("description")
        val description = descObj?.optString("en") ?: descObj?.let { 
            it.keys().asSequence().firstOrNull()?.let { key -> it.getString(key) }
        }
        
        // Get cover
        var coverUrl: String? = null
        for (i in 0 until relationships.length()) {
            val rel = relationships.getJSONObject(i)
            if (rel.getString("type") == "cover_art") {
                val filename = rel.optJSONObject("attributes")?.optString("fileName")
                if (filename != null) {
                    coverUrl = "https://uploads.mangadex.org/covers/$id/$filename.256.jpg"
                }
                break
            }
        }
        
        // Get author
        var author: String? = null
        for (i in 0 until relationships.length()) {
            val rel = relationships.getJSONObject(i)
            if (rel.getString("type") == "author") {
                author = rel.optJSONObject("attributes")?.optString("name")
                break
            }
        }
        
        // Get tags
        val tagsArray = attributes.optJSONArray("tags") ?: JSONArray()
        val tags = (0 until tagsArray.length()).mapNotNull { i ->
            val tag = tagsArray.getJSONObject(i)
            val tagAttrs = tag.getJSONObject("attributes")
            val nameObj = tagAttrs.getJSONObject("name")
            val tagName = nameObj.optString("en") ?: return@mapNotNull null
            MangaTag(key = tag.getString("id"), title = tagName, source = "mangadex")
        }
        
        // Get state
        val status = attributes.optString("status")
        val state = when (status) {
            "ongoing" -> MangaState.ONGOING
            "completed" -> MangaState.FINISHED
            "hiatus" -> MangaState.PAUSED
            "cancelled" -> MangaState.ABANDONED
            else -> MangaState.UNKNOWN
        }
        
        // Get content rating
        val rating = attributes.optString("contentRating")
        val contentRating = when (rating) {
            "safe" -> ContentRating.SAFE
            "suggestive" -> ContentRating.SUGGESTIVE
            "erotica", "pornographic" -> ContentRating.NSFW
            else -> ContentRating.SAFE
        }
        
        return OnlineManga(
            id = id.hashCode().toLong(),
            sourceId = "mangadex",
            url = "https://mangadex.org/title/$id",
            title = title,
            altTitle = altTitle,
            coverUrl = coverUrl,
            largeCoverUrl = coverUrl?.replace(".256.jpg", ".512.jpg"),
            author = author,
            description = description,
            tags = tags,
            state = state,
            contentRating = contentRating,
            isNsfw = contentRating == ContentRating.NSFW
        )
    }
    
    private fun parseMangaDexChapters(data: JSONArray, mangaId: Long): List<MangaChapter> {
        return (0 until data.length()).mapNotNull { i ->
            try {
                val chapter = data.getJSONObject(i)
                val id = chapter.getString("id")
                val attrs = chapter.getJSONObject("attributes")
                
                val chapterNum = attrs.optString("chapter")
                    .takeIf { it.isNotBlank() }
                    ?.toFloatOrNull() ?: (i + 1).toFloat()
                
                val volume = attrs.optString("volume")
                    .takeIf { it.isNotBlank() }
                    ?.toIntOrNull() ?: 0
                
                val title = attrs.optString("title").takeIf { it.isNotBlank() }
                    ?: "Chapter $chapterNum"
                
                val uploadDate = attrs.optString("publishAt")
                val timestamp = try {
                    java.time.Instant.parse(uploadDate).toEpochMilli()
                } catch (e: Exception) { 0L }
                
                // Get scanlator
                val relationships = chapter.optJSONArray("relationships") ?: JSONArray()
                var scanlator: String? = null
                for (j in 0 until relationships.length()) {
                    val rel = relationships.getJSONObject(j)
                    if (rel.getString("type") == "scanlation_group") {
                        scanlator = rel.optJSONObject("attributes")?.optString("name")
                        break
                    }
                }
                
                MangaChapter(
                    id = id.hashCode().toLong(),
                    mangaId = mangaId,
                    name = title,
                    number = chapterNum,
                    volume = volume,
                    url = "https://mangadex.org/chapter/$id",
                    scanlator = scanlator,
                    uploadDate = timestamp
                )
            } catch (e: Exception) {
                Log.e(TAG, "Failed to parse chapter", e)
                null
            }
        }
    }
}
