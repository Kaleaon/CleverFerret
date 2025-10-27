package com.universalmedialibrary.services.metadata.covers

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.withContext
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for finding and downloading high-quality cover images
 */
@Singleton
class CoverService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val appleBooksCoverSource: AppleBooksCoverSource,
    private val amazonCoverSource: AmazonCoverSource,
    private val googleBooksCoverSource: GoogleBooksCoverSource
) {
    
    private val sources = listOf(
        appleBooksCoverSource,
        amazonCoverSource,
        googleBooksCoverSource
    ).sortedByDescending { it.priority }
    
    /**
     * Find the best available cover from all sources
     */
    suspend fun findBestCover(
        isbn: String?,
        title: String?,
        author: String?
    ): Result<CoverResult?> = withContext(Dispatchers.IO) {
        try {
            // Try all sources in parallel
            val results = sources.map { source ->
                async {
                    try {
                        source.searchCover(isbn, title, author).getOrNull()
                    } catch (e: Exception) {
                        null
                    }
                }
            }.awaitAll().filterNotNull()
            
            // Return highest quality result
            val best = results.maxByOrNull { 
                it.quality.ordinal * 1000 + it.width + it.height 
            }
            
            Result.success(best)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Download and save cover to local storage
     */
    suspend fun downloadAndSaveCover(
        coverResult: CoverResult,
        bookId: String
    ): Result<String> = withContext(Dispatchers.IO) {
        try {
            // Find the source (handle Amazon's domain-specific naming)
            val source = sources.find { 
                coverResult.source == it.sourceName || 
                coverResult.source.startsWith(it.sourceName + " (")
            } ?: return@withContext Result.failure(
                    Exception("Source ${coverResult.source} not found")
                )
            
            // Download cover
            val imageData = source.downloadCover(coverResult.url).getOrThrow()
            
            // Save to file
            val coversDir = File(context.filesDir, "covers")
            coversDir.mkdirs()
            
            val coverFile = File(coversDir, "$bookId.jpg")
            coverFile.writeBytes(imageData)
            
            Result.success(coverFile.absolutePath)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Get cover quality from dimensions
     */
    fun getCoverQuality(width: Int, height: Int): CoverQuality {
        val size = maxOf(width, height)
        return when {
            size >= CoverQuality.ULTRA_HD.minSize -> CoverQuality.ULTRA_HD
            size >= CoverQuality.HIGH.minSize -> CoverQuality.HIGH
            size >= CoverQuality.STANDARD.minSize -> CoverQuality.STANDARD
            else -> CoverQuality.THUMBNAIL
        }
    }
}
