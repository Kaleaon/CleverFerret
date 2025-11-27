package com.universalmedialibrary.core

import com.universalmedialibrary.core.FormatRegistry.FormatInfo
import com.universalmedialibrary.core.TagRegistry.UnifiedTagInfo
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Universal search service that provides centralized search across:
 * - File formats
 * - Tags
 * - Media metadata
 * - Services and capabilities
 * 
 * This is the single entry point for all search functionality in the application.
 */
@Singleton
class UniversalSearchService @Inject constructor(
    private val formatRegistry: FormatRegistry,
    private val tagRegistry: TagRegistry
) {
    
    /**
     * Search result type
     */
    sealed class SearchResult {
        data class FormatResult(val format: FormatInfo) : SearchResult()
        data class TagResult(val tag: UnifiedTagInfo) : SearchResult()
    }
    
    /**
     * Search across all searchable entities
     * 
     * @param query Search query
     * @param includeFormats Whether to include formats in results
     * @param includeTags Whether to include tags in results
     * @param formatCategory Optional format category filter
     * @param tagSource Optional tag source filter
     * @return Flow of combined search results
     */
    fun searchAll(
        query: String,
        includeFormats: Boolean = true,
        includeTags: Boolean = true,
        formatCategory: FormatRegistry.FormatCategory? = null,
        tagSource: TagRegistry.TagSource? = null
    ): Flow<List<SearchResult>> {
        val formatResults = if (includeFormats) {
            val formats = if (formatCategory != null) {
                formatRegistry.getFormatsByCategory(formatCategory)
            } else {
                formatRegistry.searchFormats(query)
            }
            formats.map { SearchResult.FormatResult(it) }
        } else {
            emptyList()
        }
        
        return if (includeTags) {
            tagRegistry.searchTags(query, source = tagSource).map { tags ->
                val tagResults = tags.map { SearchResult.TagResult(it) }
                (formatResults + tagResults).sortedBy {
                    when (it) {
                        is SearchResult.FormatResult -> it.format.displayName
                        is SearchResult.TagResult -> it.tag.displayName
                    }
                }
            }
        } else {
            kotlinx.coroutines.flow.flowOf(formatResults)
        }
    }
    
    /**
     * Search formats only
     */
    fun searchFormats(query: String, category: FormatRegistry.FormatCategory? = null): List<FormatInfo> {
        return if (category != null) {
            formatRegistry.getFormatsByCategory(category)
                .filter { format ->
                    query.lowercase() in format.displayName.lowercase() ||
                    query.lowercase() in format.description.lowercase() ||
                    format.extensions.any { query.lowercase() in it.lowercase() }
                }
        } else {
            formatRegistry.searchFormats(query)
        }
    }
    
    /**
     * Search tags only
     */
    fun searchTags(
        query: String,
        category: com.universalmedialibrary.services.webfiction.TagCategory? = null,
        source: TagRegistry.TagSource? = null
    ): Flow<List<UnifiedTagInfo>> {
        return tagRegistry.searchTags(query, category, source)
    }
    
    /**
     * Get all supported formats
     */
    fun getAllFormats(): List<FormatInfo> = formatRegistry.getAllFormats()
    
    /**
     * Get all readable formats
     */
    fun getReadableFormats(): List<FormatInfo> = formatRegistry.getReadableFormats()
    
    /**
     * Get formats by category
     */
    fun getFormatsByCategory(category: FormatRegistry.FormatCategory): List<FormatInfo> {
        return formatRegistry.getFormatsByCategory(category)
    }
    
    /**
     * Get format by extension
     */
    fun getFormatByExtension(extension: String): FormatInfo? {
        return formatRegistry.getFormatByExtension(extension)
    }
    
    /**
     * Get format by MIME type
     */
    fun getFormatByMimeType(mimeType: String): FormatInfo? {
        return formatRegistry.getFormatByMimeType(mimeType)
    }
    
    /**
     * Check if extension is supported
     */
    fun isFormatSupported(extension: String): Boolean {
        return formatRegistry.isSupported(extension)
    }
    
    /**
     * Check if extension is readable
     */
    fun isFormatReadable(extension: String): Boolean {
        return formatRegistry.isReadable(extension)
    }
    
    /**
     * Get all supported extensions
     */
    fun getAllExtensions(): List<String> = formatRegistry.getAllExtensions()
    
    /**
     * Get all supported MIME types
     */
    fun getAllMimeTypes(): List<String> = formatRegistry.getAllMimeTypes()
    
    /**
     * Get popular tags
     */
    fun getPopularTags(limit: Int = 50): Flow<List<UnifiedTagInfo>> {
        return tagRegistry.getPopularTags(limit)
    }
    
    /**
     * Get recent tags
     */
    fun getRecentTags(limit: Int = 20): Flow<List<UnifiedTagInfo>> {
        return tagRegistry.getRecentTags(limit)
    }
}
