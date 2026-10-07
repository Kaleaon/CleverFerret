package com.universalmedialibrary.services.pipeline

/**
 * Standardized raw metadata payload produced during Stage 1 (Raw Extraction)
 * before schema normalization and plugin enrichment.
 */
data class RawMetadata(
    val title: String? = null,
    val creators: List<String> = emptyList(),
    val album: String? = null,
    val albumArtist: String? = null,
    val publisher: String? = null,
    val year: Int? = null,
    val releaseDate: Long? = null,
    val language: String? = null,
    val isbn: String? = null,
    val durationMs: Long? = null,
    val resolution: String? = null,
    val format: String? = null,
    val summary: String? = null,
    val coverImagePath: String? = null,
    val trackNumber: Int? = null,
    val totalTracks: Int? = null,
    val confidenceScore: Float = 0.8f,
    val source: String = "RAW_EXTRACTION",
    val rawAttributes: Map<String, String> = emptyMap()
)
