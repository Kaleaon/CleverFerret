package com.universalmedialibrary.services.analysis

import com.universalmedialibrary.data.MediaType

/**
 * Represents metadata extracted from a media file.
 *
 * @property title The title of the media.
 * @property author The author of the media.
 * @property description A summary or description of the media.
 * @property publishDate The publication date.
 * @property genre The genre of the media.
 * @property language The language of the media.
 * @property isbn The ISBN, if applicable.
 * @property publisher The publisher, if applicable.
 * @property pageCount The number of pages, if applicable.
 * @property confidence The confidence score of the extraction.
 * @property extractionMethod The method used to extract the metadata.
 * @property additionalData A map of any other extracted data.
 */
data class ExtractedMetadata(
    val title: String?,
    val author: String?,
    val description: String?,
    val publishDate: String?,
    val genre: String?,
    val language: String?,
    val isbn: String?,
    val publisher: String?,
    val pageCount: Int?,
    val confidence: Float = 0.0f,
    val extractionMethod: String,
    val additionalData: Map<String, Any> = emptyMap()
)

/**
 * Represents the classification of a piece of content.
 *
 * @property mediaType The type of the media.
 * @property genre The primary genre.
 * @property subGenre The secondary genre.
 * @property ageRating The recommended age rating.
 * @property contentWarnings A list of content warnings.
 * @property confidence The confidence score of the classification.
 * @property classificationReason The reason for the classification.
 * @property tags A list of relevant tags.
 */
data class ContentClassification(
    val mediaType: MediaType,
    val genre: String?,
    val subGenre: String?,
    val ageRating: String?,
    val contentWarnings: List<String> = emptyList(),
    val confidence: Float = 0.0f,
    val classificationReason: String,
    val tags: List<String> = emptyList()
)

/**
 * Represents a match found in a media archive.
 *
 * @property matchType The type of the match.
 * @property confidence The confidence score of the match.
 * @property sourceArchive The archive where the match was found.
 * @property matchedItem The item that was matched.
 * @property similarityScore The similarity score between the item and the match.
 * @property matchedFields The fields that were matched.
 */
data class ArchiveMatch(
    val matchType: ArchiveMatchType,
    val confidence: Float,
    val sourceArchive: String,
    val matchedItem: ArchiveItem,
    val similarityScore: Float,
    val matchedFields: List<String>
)

/**
 * The type of match found in an archive.
 */
enum class ArchiveMatchType {
    /** An exact match. */
    EXACT_MATCH,
    /** A close, but not exact, match. */
    FUZZY_MATCH,
    /** A partial match. */
    PARTIAL_MATCH,
    /** No match found. */
    NO_MATCH
}

/**
 * Represents an item in a media archive.
 *
 * @property id The unique identifier for the item.
 * @property title The title of the item.
 * @property author The author of the item.
 * @property year The year the item was published.
 * @property isbn The ISBN of the item.
 * @property source The source of the item.
 * @property metadata A map of any other metadata.
 */
data class ArchiveItem(
    val id: String,
    val title: String,
    val author: String?,
    val year: String?,
    val isbn: String?,
    val source: String,
    val metadata: Map<String, Any> = emptyMap()
)

/**
 * The result of a content analysis operation.
 *
 * @property extractedMetadata The metadata extracted from the content.
 * @property classification The classification of the content.
 * @property archiveMatches A list of matches found in archives.
 * @property fingerprint A unique fingerprint of the content.
 * @property processingTime The time it took to process the content, in milliseconds.
 * @property success Whether the analysis was successful.
 * @property errors A list of any errors that occurred during analysis.
 */
data class ContentAnalysisResult(
    val extractedMetadata: ExtractedMetadata?,
    val classification: ContentClassification?,
    val archiveMatches: List<ArchiveMatch>,
    val fingerprint: String?,
    val processingTime: Long,
    val success: Boolean,
    val errors: List<String> = emptyList()
)