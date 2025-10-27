package com.universalmedialibrary.services.metadata.covers

/**
 * Interface for cover image sources
 */
interface CoverSource {
    val sourceName: String
    val priority: Int // Higher = try first
    
    /**
     * Search for cover image
     */
    suspend fun searchCover(
        isbn: String? = null,
        title: String? = null,
        author: String? = null
    ): Result<CoverResult?>
    
    /**
     * Get direct cover URL from source-specific ID
     */
    suspend fun getCoverUrl(sourceId: String): Result<String?>
    
    /**
     * Download cover image data
     */
    suspend fun downloadCover(url: String): Result<ByteArray>
}

/**
 * Cover search result with quality information
 */
data class CoverResult(
    val url: String,
    val width: Int,
    val height: Int,
    val quality: CoverQuality,
    val source: String,
    val sourceId: String? = null
)

enum class CoverQuality(val minSize: Int) {
    THUMBNAIL(300),      // < 300px
    STANDARD(800),       // 300-800px
    HIGH(1400),          // 800-2000px
    ULTRA_HD(2000)       // 2000px+
}
