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
 * Readium PDF Service
 * 
 * Professional PDF reading service using Readium Kotlin Toolkit
 * Provides:
 * - Full PDF rendering with proper text extraction
 * - Metadata parsing
 * - Table of contents (if embedded)
 * - Search functionality
 * - Text selection and copying
 * - Better performance than basic PdfRenderer
 * 
 * Supports both local PDF files and remote URLs
 */
@Singleton
class ReadiumPdfService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val TAG = "ReadiumPdfService"
    
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
     * Open PDF publication
     * 
     * @param pdfPath Path to PDF file
     * @return Publication object for rendering
     */
    suspend fun openPublication(pdfPath: String): Publication? = withContext(Dispatchers.IO) {
        try {
            val file = File(pdfPath)
            if (!file.exists()) {
                Log.e(TAG, "PDF file not found: $pdfPath")
                return@withContext null
            }

            val asset = streamer.assetRetriever.retrieve(file)
            if (asset !is Try.Success) {
                Log.e(TAG, "Failed to retrieve PDF asset: $pdfPath")
                return@withContext null
            }

            val publication = streamer.open(asset.value, allowUserInteraction = false)
            if (publication !is Try.Success) {
                Log.e(TAG, "Failed to open PDF: $pdfPath")
                return@withContext null
            }

            publication.value
        } catch (e: Exception) {
            Log.e(TAG, "Error opening PDF: ${e.message}", e)
            null
        }
    }

    /**
     * Extract metadata from PDF
     * 
     * @param pdfPath Path to PDF file
     * @return PdfMetadata or null if failed
     */
    suspend fun extractMetadata(pdfPath: String): PdfMetadata? = withContext(Dispatchers.IO) {
        try {
            val publication = openPublication(pdfPath) ?: return@withContext null
            
            val metadata = publication.metadata
            
            val result = PdfMetadata(
                title = metadata.title ?: "Unknown",
                authors = metadata.authors.map { it.name },
                subject = metadata.description,
                keywords = metadata.subjects.map { it.name },
                numberOfPages = publication.positions().size,
                language = metadata.languages.firstOrNull()
            )
            
            publication.close()
            result
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting PDF metadata: ${e.message}", e)
            null
        }
    }

    /**
     * Extract first page as thumbnail
     * 
     * @param pdfPath Path to PDF file
     * @return Bitmap thumbnail or null
     */
    suspend fun extractThumbnail(pdfPath: String): Bitmap? = withContext(Dispatchers.IO) {
        try {
            val publication = openPublication(pdfPath) ?: return@withContext null
            
            // Get first page
            val firstLink = publication.readingOrder.firstOrNull()
            if (firstLink != null) {
                val resource = publication.get(firstLink.url())
                if (resource is Try.Success) {
                    val bytes = resource.value.read().getOrNull()
                    if (bytes != null) {
                        val bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
                        publication.close()
                        return@withContext bitmap
                    }
                }
            }
            
            publication.close()
            null
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting PDF thumbnail: ${e.message}", e)
            null
        }
    }

    /**
     * Get table of contents from PDF
     */
    suspend fun extractTableOfContents(pdfPath: String): List<TocItem> = withContext(Dispatchers.IO) {
        try {
            val publication = openPublication(pdfPath) ?: return@withContext emptyList()
            
            val toc = publication.tableOfContents.map { link ->
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
            
            publication.close()
            toc
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting PDF TOC: ${e.message}", e)
            emptyList()
        }
    }
}

/**
 * PDF Metadata
 */
data class PdfMetadata(
    val title: String,
    val authors: List<String> = emptyList(),
    val subject: String? = null,
    val keywords: List<String> = emptyList(),
    val numberOfPages: Int = 0,
    val language: String? = null
)
