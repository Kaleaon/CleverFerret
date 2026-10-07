package com.universalmedialibrary.services.pipeline.processors

import com.universalmedialibrary.data.local.entity.MetadataBook
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.MetadataMovie
import com.universalmedialibrary.data.local.entity.MetadataMusicTrack
import com.universalmedialibrary.services.pipeline.CatalogingPipelineContext
import com.universalmedialibrary.services.pipeline.MetadataPipelineProcessor
import com.universalmedialibrary.services.pipeline.PipelineStage
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Stage 2 Processor: Schema Normalization
 *
 * Transforms raw metadata payloads into normalized schema structures ([MetadataCommon],
 * [MetadataBook], [MetadataMusicTrack], [MetadataMovie]) and computes sort titles,
 * creator lists, and field completeness confidence adjustments.
 */
@Singleton
class SchemaNormalizationProcessor @Inject constructor() : MetadataPipelineProcessor {

    override val stage: PipelineStage = PipelineStage.SCHEMA_NORMALIZATION
    override val name: String = "SchemaNormalizationProcessor"

    companion object {
        private const val TITLE_CONFIDENCE_BONUS = 0.05f
        private const val CREATOR_CONFIDENCE_BONUS = 0.10f
        private const val DETAILS_CONFIDENCE_BONUS = 0.05f
        private const val MS_PER_SEC = 1000
        private const val SEC_PER_MIN = 60
    }

    override suspend fun process(context: CatalogingPipelineContext): CatalogingPipelineContext {
        val raw = context.rawMetadata ?: return context
        val file = context.file
        val itemId = context.mediaItem?.itemId ?: 0L

        val rawTitle = raw.title?.trim()?.takeIf { it.isNotBlank() } ?: file.nameWithoutExtension
        val normalizedTitle = normalizeTitle(rawTitle)
        val sortTitle = generateSortTitle(normalizedTitle)

        val common = buildCommonMetadata(itemId, normalizedTitle, sortTitle, raw, context)
        val (bookMeta, musicMeta, movieMeta) = buildTypeSpecificMetadata(itemId, context.mediaType, raw, file)

        val confidenceBonus = calculateCompletenessBonus(normalizedTitle, raw)
        val updatedConfidence = (context.confidenceScore + confidenceBonus).coerceIn(0f, 1.0f)

        return context.copy(
            normalizedCommon = common,
            bookMetadata = bookMeta,
            musicTrackMetadata = musicMeta,
            movieMetadata = movieMeta,
            confidenceScore = updatedConfidence
        )
    }

    private fun buildCommonMetadata(
        itemId: Long,
        title: String,
        sortTitle: String,
        raw: com.universalmedialibrary.services.pipeline.RawMetadata,
        context: CatalogingPipelineContext
    ): MetadataCommon {
        return MetadataCommon(
            itemId = itemId,
            title = title,
            sortTitle = sortTitle,
            originalTitle = null,
            year = raw.year,
            releaseDate = raw.releaseDate,
            rating = null,
            userRating = null,
            communityRating = null,
            summary = raw.summary,
            plot = null,
            tagline = null,
            coverImagePath = raw.coverImagePath,
            backdropImagePath = null,
            language = raw.language,
            country = null,
            lastUpdated = System.currentTimeMillis(),
            metadataSource = context.metadataSource,
            externalId = null,
            isFavorite = false,
            isDownloaded = true,
            isVerified = false
        )
    }

    private fun buildTypeSpecificMetadata(
        itemId: Long,
        mediaType: String,
        raw: com.universalmedialibrary.services.pipeline.RawMetadata,
        file: java.io.File
    ): Triple<MetadataBook?, MetadataMusicTrack?, MetadataMovie?> {
        var bookMeta: MetadataBook? = null
        var musicMeta: MetadataMusicTrack? = null
        var movieMeta: MetadataMovie? = null

        when (mediaType.uppercase()) {
            "BOOK", "DOCUMENT", "COMIC" -> {
                bookMeta = MetadataBook(
                    itemId = itemId,
                    isbn = raw.isbn,
                    publisher = raw.publisher,
                    format = raw.format ?: file.extension.uppercase()
                )
            }
            "MUSIC", "MUSIC_TRACK", "AUDIOBOOK" -> {
                val primaryArtist = raw.creators.firstOrNull() ?: raw.albumArtist
                musicMeta = MetadataMusicTrack(
                    itemId = itemId,
                    album = raw.album,
                    albumArtist = raw.albumArtist ?: primaryArtist,
                    artist = primaryArtist,
                    trackNumber = raw.trackNumber,
                    totalTracks = raw.totalTracks,
                    duration = raw.durationMs
                )
            }
            "MOVIE", "VIDEO" -> {
                val runtimeMin = raw.durationMs?.let { (it / MS_PER_SEC / SEC_PER_MIN).toInt() }
                movieMeta = MetadataMovie(
                    itemId = itemId,
                    runtime = runtimeMin,
                    resolution = raw.resolution
                )
            }
        }
        return Triple(bookMeta, musicMeta, movieMeta)
    }

    private fun calculateCompletenessBonus(
        title: String,
        raw: com.universalmedialibrary.services.pipeline.RawMetadata
    ): Float {
        var bonus = 0f
        if (title.isNotBlank()) bonus += TITLE_CONFIDENCE_BONUS
        if (raw.creators.isNotEmpty() || raw.album != null) bonus += CREATOR_CONFIDENCE_BONUS
        if (raw.year != null || raw.durationMs != null || raw.isbn != null) bonus += DETAILS_CONFIDENCE_BONUS
        return bonus
    }

    private fun normalizeTitle(rawTitle: String): String {
        return rawTitle
            .replace(Regex("""[_\-]+"""), " ")
            .replace(Regex("""\s+"""), " ")
            .trim()
    }

    private fun generateSortTitle(title: String): String {
        val prefixes = listOf("The ", "A ", "An ")
        for (prefix in prefixes) {
            if (title.startsWith(prefix, ignoreCase = true) && title.length > prefix.length) {
                val article = title.substring(0, prefix.length).trim()
                val rest = title.substring(prefix.length).trim()
                return "$rest, $article"
            }
        }
        return title
    }
}
