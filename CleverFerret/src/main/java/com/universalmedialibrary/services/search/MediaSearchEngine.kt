package com.universalmedialibrary.services.search

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Abstract base class for media search engines
 */
abstract class MediaSearchEngine {
    
    /**
     * Search for media items based on request
     */
    abstract suspend fun search(searchRequest: SearchRequest): List<UniversalSearchResult>
    
    /**
     * Get suggestions for search queries
     */
    abstract suspend fun getSuggestions(query: String): List<String>
    
    /**
     * Get supported media types
     */
    abstract fun getSupportedMediaTypes(): List<String>
}

/**
 * Book search engine implementation
 * Searches for books, audiobooks, and comics in the media library
 */
@Singleton
class BookSearchEngine @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) : MediaSearchEngine() {
    
    override suspend fun search(searchRequest: SearchRequest): List<UniversalSearchResult> {
        val query = searchRequest.query
        val mediaTypes = getSupportedMediaTypes()
        
        val items = mediaItemDao.searchMediaItems(
            query = "%$query%",
            mediaTypes = mediaTypes,
            minRating = null,
            maxRating = null,
            isFavorite = null,
            limit = searchRequest.limit
        )
        
        return items.map { item ->
            val metadata = metadataDao.getMetadataCommonByItemId(item.itemId)
            UniversalSearchResult(
                id = item.itemId.toString(),
                title = metadata?.title ?: item.fileName.substringBeforeLast('.'),
                subtitle = null, // Author info would come from People table
                description = metadata?.summary,
                mediaType = item.mediaType,
                thumbnailUrl = metadata?.coverImagePath,
                score = calculateRelevanceScore(query, metadata?.title ?: item.fileName),
                metadata = mapOf(
                    "filePath" to item.filePath,
                    "fileSize" to item.fileSize.toString()
                ),
                tags = emptyList()
            )
        }
    }
    
    override suspend fun getSuggestions(query: String): List<String> {
        if (query.length < 2) return emptyList()
        val results = metadataDao.searchByTitle(query).take(5)
        return results.map { it.title }
    }
    
    override fun getSupportedMediaTypes(): List<String> {
        return listOf("BOOK", "AUDIOBOOK", "COMIC")
    }
    
    private fun calculateRelevanceScore(query: String, title: String): Double {
        val lowerQuery = query.lowercase()
        val lowerTitle = title.lowercase()
        return when {
            lowerTitle == lowerQuery -> 100.0
            lowerTitle.startsWith(lowerQuery) -> 80.0
            lowerTitle.contains(lowerQuery) -> 50.0
            else -> 10.0
        }
    }
}

/**
 * Audio search engine implementation
 * Searches for music tracks, podcasts, and radio content
 */
@Singleton
class AudioSearchEngine @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) : MediaSearchEngine() {
    
    override suspend fun search(searchRequest: SearchRequest): List<UniversalSearchResult> {
        val query = searchRequest.query
        val mediaTypes = getSupportedMediaTypes()
        
        val items = mediaItemDao.searchMediaItems(
            query = "%$query%",
            mediaTypes = mediaTypes,
            minRating = null,
            maxRating = null,
            isFavorite = null,
            limit = searchRequest.limit
        )
        
        return items.map { item ->
            val metadata = metadataDao.getMetadataCommonByItemId(item.itemId)
            UniversalSearchResult(
                id = item.itemId.toString(),
                title = metadata?.title ?: item.fileName.substringBeforeLast('.'),
                subtitle = null, // Artist info would come from People table
                description = metadata?.summary,
                mediaType = item.mediaType,
                thumbnailUrl = metadata?.coverImagePath,
                score = calculateRelevanceScore(query, metadata?.title ?: item.fileName),
                metadata = mapOf(
                    "filePath" to item.filePath,
                    "fileSize" to item.fileSize.toString()
                ),
                tags = emptyList()
            )
        }
    }
    
    override suspend fun getSuggestions(query: String): List<String> {
        if (query.length < 2) return emptyList()
        val results = metadataDao.searchByTitle(query).take(5)
        return results.map { it.title }
    }
    
    override fun getSupportedMediaTypes(): List<String> {
        return listOf("MUSIC_TRACK", "PODCAST_EPISODE", "RADIO")
    }
    
    private fun calculateRelevanceScore(query: String, title: String): Double {
        val lowerQuery = query.lowercase()
        val lowerTitle = title.lowercase()
        return when {
            lowerTitle == lowerQuery -> 100.0
            lowerTitle.startsWith(lowerQuery) -> 80.0
            lowerTitle.contains(lowerQuery) -> 50.0
            else -> 10.0
        }
    }
}

/**
 * Video search engine implementation
 * Searches for movies, TV shows, and video files
 */
@Singleton
class VideoSearchEngine @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) : MediaSearchEngine() {
    
    override suspend fun search(searchRequest: SearchRequest): List<UniversalSearchResult> {
        val query = searchRequest.query
        val mediaTypes = getSupportedMediaTypes()
        
        val items = mediaItemDao.searchMediaItems(
            query = "%$query%",
            mediaTypes = mediaTypes,
            minRating = null,
            maxRating = null,
            isFavorite = null,
            limit = searchRequest.limit
        )
        
        return items.map { item ->
            val metadata = metadataDao.getMetadataCommonByItemId(item.itemId)
            UniversalSearchResult(
                id = item.itemId.toString(),
                title = metadata?.title ?: item.fileName.substringBeforeLast('.'),
                subtitle = metadata?.year?.toString(),
                description = metadata?.summary,
                mediaType = item.mediaType,
                thumbnailUrl = metadata?.coverImagePath,
                score = calculateRelevanceScore(query, metadata?.title ?: item.fileName),
                metadata = mapOf(
                    "filePath" to item.filePath,
                    "fileSize" to item.fileSize.toString(),
                    "year" to (metadata?.year?.toString() ?: "")
                ),
                tags = emptyList()
            )
        }
    }
    
    override suspend fun getSuggestions(query: String): List<String> {
        if (query.length < 2) return emptyList()
        val results = metadataDao.searchByTitle(query).take(5)
        return results.map { it.title }
    }
    
    override fun getSupportedMediaTypes(): List<String> {
        return listOf("MOVIE", "TV_SHOW", "VIDEO")
    }
    
    private fun calculateRelevanceScore(query: String, title: String): Double {
        val lowerQuery = query.lowercase()
        val lowerTitle = title.lowercase()
        return when {
            lowerTitle == lowerQuery -> 100.0
            lowerTitle.startsWith(lowerQuery) -> 80.0
            lowerTitle.contains(lowerQuery) -> 50.0
            else -> 10.0
        }
    }
}

/**
 * Document search engine implementation
 * Searches for documents, PDFs, and text files
 */
@Singleton
class DocumentSearchEngine @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) : MediaSearchEngine() {
    
    override suspend fun search(searchRequest: SearchRequest): List<UniversalSearchResult> {
        val query = searchRequest.query
        val mediaTypes = getSupportedMediaTypes()
        
        val items = mediaItemDao.searchMediaItems(
            query = "%$query%",
            mediaTypes = mediaTypes,
            minRating = null,
            maxRating = null,
            isFavorite = null,
            limit = searchRequest.limit
        )
        
        return items.map { item ->
            val metadata = metadataDao.getMetadataCommonByItemId(item.itemId)
            UniversalSearchResult(
                id = item.itemId.toString(),
                title = metadata?.title ?: item.fileName.substringBeforeLast('.'),
                subtitle = null,
                description = metadata?.summary,
                mediaType = item.mediaType,
                thumbnailUrl = metadata?.coverImagePath,
                score = calculateRelevanceScore(query, metadata?.title ?: item.fileName),
                metadata = mapOf(
                    "filePath" to item.filePath,
                    "fileSize" to item.fileSize.toString()
                ),
                tags = emptyList()
            )
        }
    }
    
    override suspend fun getSuggestions(query: String): List<String> {
        if (query.length < 2) return emptyList()
        val results = metadataDao.searchByTitle(query).take(5)
        return results.map { it.title }
    }
    
    override fun getSupportedMediaTypes(): List<String> {
        return listOf("DOCUMENT", "PDF", "TEXT")
    }
    
    private fun calculateRelevanceScore(query: String, title: String): Double {
        val lowerQuery = query.lowercase()
        val lowerTitle = title.lowercase()
        return when {
            lowerTitle == lowerQuery -> 100.0
            lowerTitle.startsWith(lowerQuery) -> 80.0
            lowerTitle.contains(lowerQuery) -> 50.0
            else -> 10.0
        }
    }
}