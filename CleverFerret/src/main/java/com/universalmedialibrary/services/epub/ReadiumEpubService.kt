package com.universalmedialibrary.services.epub

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.readium.r2.shared.publication.Publication
import org.readium.r2.shared.util.Try
import org.readium.r2.shared.util.asset.AssetRetriever
import org.readium.r2.shared.util.http.DefaultHttpClient
import org.readium.r2.streamer.Streamer
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Readium EPUB Service
 * 
 * Modern EPUB parsing service using Readium Kotlin Toolkit
 * Provides:
 * - EPUB 2 & 3 support
 * - Cover artwork extraction
 * - Metadata parsing (title, author, publisher, etc.)
 * - Table of contents (TOC) extraction
 * - Resource access (images, fonts, etc.)
 * 
 * Replaces the old epublib dependency with a modern, well-maintained solution
 */
@Singleton
class ReadiumEpubService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val TAG = "ReadiumEpubService"
    
    // Readium Streamer for opening publications
    private val streamer: Streamer by lazy {
        Streamer(
            context = context,
            assetRetriever = AssetRetriever(
                context = context,
                httpClient = DefaultHttpClient()
            )
        )
    }

    /**
     * Extract cover image from EPUB file
     * 
     * @param epubPath Path to EPUB file
     * @return Bitmap of cover image or null if not found
     */
    suspend fun extractCover(epubPath: String): Bitmap? = withContext(Dispatchers.IO) {
        try {
            val file = File(epubPath)
            if (!file.exists()) {
                Log.e(TAG, "EPUB file not found: $epubPath")
                return@withContext null
            }

            // Open the EPUB with Readium
            val asset = streamer.assetRetriever.retrieve(file)
            if (asset !is Try.Success) {
                Log.e(TAG, "Failed to retrieve asset: ${epubPath}")
                return@withContext null
            }

            val publication = streamer.open(asset.value, allowUserInteraction = false)
            if (publication !is Try.Success) {
                Log.e(TAG, "Failed to open EPUB: ${epubPath}")
                return@withContext null
            }

            // Get cover from publication
            val pub = publication.value
            val coverBitmap = extractCoverFromPublication(pub)
            
            // Clean up
            pub.close()
            
            coverBitmap
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting EPUB cover: ${e.message}", e)
            null
        }
    }

    /**
     * Extract metadata from EPUB file
     * 
     * @param epubPath Path to EPUB file
     * @return EpubMetadata or null if failed
     */
    suspend fun extractMetadata(epubPath: String): EpubMetadata? = withContext(Dispatchers.IO) {
        try {
            val file = File(epubPath)
            if (!file.exists()) {
                Log.e(TAG, "EPUB file not found: $epubPath")
                return@withContext null
            }

            val asset = streamer.assetRetriever.retrieve(file)
            if (asset !is Try.Success) {
                Log.e(TAG, "Failed to retrieve asset for metadata")
                return@withContext null
            }

            val publication = streamer.open(asset.value, allowUserInteraction = false)
            if (publication !is Try.Success) {
                Log.e(TAG, "Failed to open EPUB for metadata")
                return@withContext null
            }

            val pub = publication.value
            val metadata = extractMetadataFromPublication(pub)
            
            pub.close()
            
            metadata
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting EPUB metadata: ${e.message}", e)
            null
        }
    }

    /**
     * Get table of contents from EPUB
     * 
     * @param epubPath Path to EPUB file
     * @return List of TOC items or empty list if failed
     */
    suspend fun extractTableOfContents(epubPath: String): List<TocItem> = withContext(Dispatchers.IO) {
        try {
            val file = File(epubPath)
            if (!file.exists()) {
                Log.e(TAG, "EPUB file not found: $epubPath")
                return@withContext emptyList()
            }

            val asset = streamer.assetRetriever.retrieve(file)
            if (asset !is Try.Success) {
                return@withContext emptyList()
            }

            val publication = streamer.open(asset.value, allowUserInteraction = false)
            if (publication !is Try.Success) {
                return@withContext emptyList()
            }

            val pub = publication.value
            val toc = extractTocFromPublication(pub)
            
            pub.close()
            
            toc
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting TOC: ${e.message}", e)
            emptyList()
        }
    }

    /**
     * Extract cover bitmap from opened publication
     */
    private suspend fun extractCoverFromPublication(publication: Publication): Bitmap? {
        return try {
            // Try to get cover link from metadata
            val coverLink = publication.coverLink
            
            if (coverLink != null) {
                // Get the cover resource
                val resource = publication.get(coverLink.url())
                if (resource is Try.Success) {
                    val bytes = resource.value.read().getOrNull()
                    if (bytes != null) {
                        return BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
                    }
                }
            }

            // Fallback: try to find cover in metadata images
            val images = publication.images
            if (images.isNotEmpty()) {
                // Try first image
                val firstImage = images.first()
                val resource = publication.get(firstImage.url())
                if (resource is Try.Success) {
                    val bytes = resource.value.read().getOrNull()
                    if (bytes != null) {
                        return BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
                    }
                }
            }

            null
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting cover from publication: ${e.message}", e)
            null
        }
    }

    /**
     * Extract metadata from opened publication
     */
    private fun extractMetadataFromPublication(publication: Publication): EpubMetadata {
        val metadata = publication.metadata
        
        return EpubMetadata(
            title = metadata.title ?: "Unknown",
            authors = metadata.authors.map { it.name },
            publisher = metadata.publisher?.name,
            publishedDate = metadata.published?.toString(),
            description = metadata.description,
            subjects = metadata.subjects.map { it.name },
            language = metadata.languages.firstOrNull(),
            identifier = metadata.identifier,
            rights = metadata.rights,
            numberOfPages = publication.positions().size
        )
    }

    /**
     * Extract table of contents from opened publication
     */
    private fun extractTocFromPublication(publication: Publication): List<TocItem> {
        return publication.tableOfContents.map { link ->
            TocItem(
                title = link.title ?: "Untitled",
                href = link.url().toString(),
                children = link.children.map { child ->
                    TocItem(
                        title = child.title ?: "Untitled",
                        href = child.url().toString()
                    )
                }
            )
        }
    }
}

/**
 * EPUB Metadata
 */
data class EpubMetadata(
    val title: String,
    val authors: List<String> = emptyList(),
    val publisher: String? = null,
    val publishedDate: String? = null,
    val description: String? = null,
    val subjects: List<String> = emptyList(),
    val language: String? = null,
    val identifier: String? = null,
    val rights: String? = null,
    val numberOfPages: Int = 0
)

/**
 * Table of Contents Item
 */
data class TocItem(
    val title: String,
    val href: String,
    val children: List<TocItem> = emptyList()
)
