package com.universalmedialibrary.services.metadata

import com.universalmedialibrary.services.metadata.sources.EnhancedMetadata
import com.universalmedialibrary.services.metadata.sources.MetadataSource
import com.universalmedialibrary.services.metadata.sources.MetadataSearchResult
import kotlinx.coroutines.*
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Central service for managing metadata from multiple sources
 */
@Singleton
class MetadataService @Inject constructor(
    private val metadataSources: Set<@JvmSuppressWildcards MetadataSource>
) {
    
    /**
     * Search all metadata sources in parallel
     */
    suspend fun searchAll(
        query: String?,
        isbn: String?,
        title: String?,
        author: String?,
        maxResults: Int = 10
    ): Result<List<MetadataSearchResult>> = withContext(Dispatchers.IO) {
        try {
            val results = metadataSources
                .sortedByDescending { it.priority }
                .map { source ->
                    async {
                        source.search(
                            query = query,
                            isbn = isbn,
                            title = title,
                            author = author,
                            maxResults = maxResults
                        ).getOrNull() ?: emptyList()
                    }
                }
                .awaitAll()
                .flatten()
                .distinctBy { "${it.source}:${it.sourceId}" }
                .sortedByDescending { result ->
                    val source = metadataSources.find { it.sourceName == result.source }
                    source?.priority ?: 0
                }
                .take(maxResults)
            
            Result.success(results)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Search a specific source
     */
    suspend fun searchSource(
        sourceName: String,
        query: String?,
        isbn: String?,
        title: String?,
        author: String?,
        maxResults: Int = 10
    ): Result<List<MetadataSearchResult>> = withContext(Dispatchers.IO) {
        try {
            val source = metadataSources.find { it.sourceName == sourceName }
                ?: return@withContext Result.failure(
                    Exception("Source not found: $sourceName")
                )
            
            source.search(query, isbn, title, author, maxResults)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Get detailed metadata from multiple sources
     */
    suspend fun getDetailsFromMultipleSources(
        searchResults: List<MetadataSearchResult>
    ): Result<EnhancedMetadata> = withContext(Dispatchers.IO) {
        try {
            val metadataList = searchResults.map { result ->
                async {
                    val source = metadataSources.find { it.sourceName == result.source }
                    source?.getDetails(result.sourceId)?.getOrNull()
                }
            }.awaitAll().filterNotNull()
            
            if (metadataList.isEmpty()) {
                return@withContext Result.failure(
                    Exception("No metadata found")
                )
            }
            
            // Merge metadata from multiple sources
            val merged = mergeMetadata(metadataList)
            Result.success(merged)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Get details from a specific source
     */
    suspend fun getDetails(
        sourceName: String,
        sourceId: String
    ): Result<EnhancedMetadata?> = withContext(Dispatchers.IO) {
        try {
            val source = metadataSources.find { it.sourceName == sourceName }
                ?: return@withContext Result.failure(
                    Exception("Source not found: $sourceName")
                )
            
            source.getDetails(sourceId)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Get list of available metadata sources
     */
    fun getAvailableSources(): List<String> {
        return metadataSources
            .sortedByDescending { it.priority }
            .map { it.sourceName }
    }
    
    /**
     * Merge metadata from multiple sources, preferring higher quality data
     */
    private fun mergeMetadata(metadataList: List<EnhancedMetadata>): EnhancedMetadata {
        if (metadataList.size == 1) return metadataList[0]
        
        // Use first as base
        val base = metadataList[0]
        
        return EnhancedMetadata(
            title = metadataList.firstNotNullOfOrNull { it.title } ?: base.title,
            authors = metadataList.flatMap { it.authors }.distinct(),
            description = metadataList
                .mapNotNull { it.description }
                .maxByOrNull { it.length }, // Prefer longer descriptions
            isbn = metadataList.firstNotNullOfOrNull { it.isbn } ?: base.isbn,
            publisher = metadataList.firstNotNullOfOrNull { it.publisher } ?: base.publisher,
            publishDate = metadataList.firstNotNullOfOrNull { it.publishDate } ?: base.publishDate,
            pageCount = metadataList.firstNotNullOfOrNull { it.pageCount } ?: base.pageCount,
            language = metadataList.firstNotNullOfOrNull { it.language } ?: base.language,
            rating = metadataList.mapNotNull { it.rating }.average().takeIf { !it.isNaN() }?.toFloat(),
            ratingCount = metadataList.mapNotNull { it.ratingCount }.sum().takeIf { it > 0 },
            reviewCount = metadataList.mapNotNull { it.reviewCount }.sum().takeIf { it > 0 },
            categories = metadataList.flatMap { it.categories }.distinct(),
            genres = metadataList.flatMap { it.genres }.distinct(),
            tags = metadataList.flatMap { it.tags }.distinct(),
            series = metadataList.firstNotNullOfOrNull { it.series } ?: base.series,
            seriesIndex = metadataList.firstNotNullOfOrNull { it.seriesIndex } ?: base.seriesIndex,
            relatedBooks = metadataList.flatMap { it.relatedBooks }.distinctBy { it.isbn ?: it.title },
            awards = metadataList.flatMap { it.awards }.distinct(),
            editions = metadataList.flatMap { it.editions }.distinct(),
            sourceId = base.sourceId,
            source = "Merged",
            coverUrl = metadataList.firstNotNullOfOrNull { it.coverUrl } ?: base.coverUrl
        )
    }
}
