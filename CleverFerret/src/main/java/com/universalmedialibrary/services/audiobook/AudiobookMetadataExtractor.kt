package com.universalmedialibrary.services.audiobook

import kotlin.time.Duration

/**
 * Interface for extracting metadata from audiobook files
 */
interface AudiobookMetadataExtractor {
    val supportedFormats: List<String>
    
    /**
     * Extract metadata from audiobook file
     */
    suspend fun extractMetadata(filePath: String): Result<AudiobookMetadata>
    
    /**
     * Extract chapter information
     */
    suspend fun extractChapters(filePath: String): Result<List<AudioChapter>>
    
    /**
     * Extract cover art
     */
    suspend fun extractCoverArt(filePath: String): Result<ByteArray?>
}

/**
 * Complete audiobook metadata
 */
data class AudiobookMetadata(
    val title: String,
    val author: String? = null,
    val narrator: String? = null,
    val description: String? = null,
    val genre: String? = null,
    val publisher: String? = null,
    val publishDate: String? = null,
    val duration: Duration,
    val bitrate: Int? = null,
    val sampleRate: Int? = null,
    val codec: String? = null,
    val chapters: List<AudioChapter> = emptyList(),
    val coverArt: ByteArray? = null,
    val language: String = "en",
    val isbn: String? = null,
    val asin: String? = null
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as AudiobookMetadata
        return title == other.title && author == other.author
    }
    
    override fun hashCode(): Int {
        var result = title.hashCode()
        result = 31 * result + (author?.hashCode() ?: 0)
        return result
    }
}
