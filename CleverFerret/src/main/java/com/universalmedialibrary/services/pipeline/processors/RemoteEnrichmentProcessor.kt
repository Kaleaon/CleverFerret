package com.universalmedialibrary.services.pipeline.processors

import com.universalmedialibrary.api.plugin.CoverSize
import com.universalmedialibrary.api.plugin.MediaType as PluginMediaType
import com.universalmedialibrary.api.plugin.MetadataQuery
import com.universalmedialibrary.api.plugin.PluginRegistry
import com.universalmedialibrary.services.pipeline.CatalogingPipelineContext
import com.universalmedialibrary.services.pipeline.MetadataPipelineProcessor
import com.universalmedialibrary.services.pipeline.PipelineStage
import kotlinx.coroutines.withTimeoutOrNull
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Stage 3 Processor: Remote Provider Enrichment
 *
 * Integrates with [PluginRegistry] to query enabled metadata provider plugins for missing
 * metadata fields, descriptions, cover art URLs, and external identifiers.
 * Enforces a strict 5-second per-provider timeout limit and falls back gracefully to local metadata.
 */
@Singleton
class RemoteEnrichmentProcessor @Inject constructor(
    private val pluginRegistry: PluginRegistry
) : MetadataPipelineProcessor {

    override val stage: PipelineStage = PipelineStage.REMOTE_ENRICHMENT
    override val name: String = "RemoteEnrichmentProcessor"

    companion object {
        const val PROVIDER_TIMEOUT_MS = 5000L
        private const val ENRICHMENT_CONFIDENCE_BOOST = 0.15f
        private const val SEARCH_LIMIT = 5
        private const val YEAR_CHARS_COUNT = 4
    }

    override suspend fun process(context: CatalogingPipelineContext): CatalogingPipelineContext {
        val common = context.normalizedCommon ?: return context
        val targetMediaType = mapToPluginMediaType(context.mediaType)

        val providers = try {
            pluginRegistry.getMetadataProviders().filter { targetMediaType in it.supportedMediaTypes }
        } catch (_: Exception) {
            emptyList()
        }

        if (providers.isEmpty()) return context

        val primaryCreator = context.rawMetadata?.creators?.firstOrNull()
            ?: context.musicTrackMetadata?.artist

        val query = MetadataQuery(
            title = common.title,
            author = primaryCreator,
            isbn = context.bookMetadata?.isbn,
            mediaType = targetMediaType,
            limit = SEARCH_LIMIT
        )

        var enrichedCommon = common
        var enrichedBook = context.bookMetadata
        val enrichments = context.pluginEnrichments.toMutableMap()
        var updatedSource = context.metadataSource
        var confidenceBoost = 0f

        for (provider in providers) {
            try {
                val searchResult = withTimeoutOrNull(PROVIDER_TIMEOUT_MS) {
                    provider.search(query).getOrNull()?.firstOrNull()
                } ?: continue

                val details = withTimeoutOrNull(PROVIDER_TIMEOUT_MS) {
                    provider.fetchDetails(searchResult.id, targetMediaType).getOrNull()
                }

                enrichedCommon = applyCommonEnrichment(enrichedCommon, searchResult, details)
                enrichedBook = applyBookEnrichment(enrichedBook, details)

                enrichments[provider.id] = searchResult.id
                updatedSource = "$updatedSource + ${provider.name}"
                confidenceBoost += ENRICHMENT_CONFIDENCE_BOOST

                // Limit enrichment to first successful provider
                break
            } catch (_: Exception) {
                // Ignore provider error and fallback to local metadata
            }
        }

        val updatedConfidence = (context.confidenceScore + confidenceBoost).coerceIn(0f, 1.0f)

        return context.copy(
            normalizedCommon = enrichedCommon,
            bookMetadata = enrichedBook,
            pluginEnrichments = enrichments,
            confidenceScore = updatedConfidence,
            metadataSource = updatedSource
        )
    }

    private fun applyCommonEnrichment(
        common: com.universalmedialibrary.data.local.entity.MetadataCommon,
        searchResult: com.universalmedialibrary.api.plugin.MetadataSearchResult,
        details: com.universalmedialibrary.api.plugin.MediaMetadata?
    ): com.universalmedialibrary.data.local.entity.MetadataCommon {
        val coverUrl = searchResult.coverUrl
            ?: details?.coverUrls?.get(com.universalmedialibrary.api.plugin.CoverSize.LARGE)
            ?: details?.coverUrls?.get(com.universalmedialibrary.api.plugin.CoverSize.MEDIUM)

        var updated = common
        if (updated.summary.isNullOrBlank() && !details?.description.isNullOrBlank()) {
            updated = updated.copy(summary = details?.description)
        }
        if (updated.year == null && details?.publishDate != null) {
            val year = details.publishDate?.take(YEAR_CHARS_COUNT)?.toIntOrNull()
            if (year != null) updated = updated.copy(year = year)
        }
        if (updated.rating == null && details?.rating != null) {
            updated = updated.copy(rating = details.rating.average)
        }
        if (updated.coverImagePath.isNullOrBlank() && !coverUrl.isNullOrBlank()) {
            updated = updated.copy(coverImagePath = coverUrl)
        }
        return updated
    }

    private fun applyBookEnrichment(
        book: com.universalmedialibrary.data.local.entity.MetadataBook?,
        details: com.universalmedialibrary.api.plugin.MediaMetadata?
    ): com.universalmedialibrary.data.local.entity.MetadataBook? {
        if (book == null || details == null) return book
        var updated = book
        if (updated.isbn.isNullOrBlank() && !details.isbn.isNullOrBlank()) {
            updated = updated.copy(isbn = details.isbn)
        }
        if (updated.publisher.isNullOrBlank() && !details.publisher.isNullOrBlank()) {
            updated = updated.copy(publisher = details.publisher)
        }
        return updated
    }

    private fun mapToPluginMediaType(mediaTypeStr: String): PluginMediaType {
        return when (mediaTypeStr.uppercase()) {
            "BOOK" -> PluginMediaType.BOOK
            "COMIC" -> PluginMediaType.COMIC
            "MUSIC", "MUSIC_TRACK" -> PluginMediaType.MUSIC_TRACK
            "AUDIOBOOK" -> PluginMediaType.AUDIOBOOK
            "MOVIE", "VIDEO" -> PluginMediaType.MOVIE
            "DOCUMENT" -> PluginMediaType.DOCUMENT
            else -> PluginMediaType.DOCUMENT
        }
    }
}
