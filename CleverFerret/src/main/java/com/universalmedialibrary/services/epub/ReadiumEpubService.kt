package com.universalmedialibrary.services.epub

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.readium.r2.shared.publication.Link
import org.readium.r2.shared.publication.Publication
import org.readium.r2.shared.util.Try
import org.readium.r2.shared.util.asset.AssetRetriever
import org.readium.r2.shared.util.http.DefaultHttpClient
import org.readium.r2.streamer.parser.epub.EpubParser
import java.io.File
import java.io.InputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Readium EPUB Service - Readium Kotlin Toolkit 3.1.2
 */
@Singleton
class ReadiumEpubService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val TAG = "ReadiumEpubService"
    
    private val httpClient by lazy { DefaultHttpClient() }
    
    private val assetRetriever by lazy {
        AssetRetriever(context.contentResolver, httpClient)
    }
    
    private val epubParser by lazy {
        EpubParser()
    }

    suspend fun extractCover(epubPath: String): Bitmap? = withContext(Dispatchers.IO) {
        try {
            val file = File(epubPath)
            if (!file.exists()) {
                Log.e(TAG, "EPUB file not found: $epubPath")
                return@withContext null
            }

            val asset = when (assetResult) {
    is Try.Success<*, *> -> assetResult.value
    is Try.Failure<*> -> {
        Log.e(TAG, "Failed to retrieve asset: ${assetResult.value}")
        return@withContext null
    }
}
            val asset = when (assetResult) {
                is Try.Success -> assetResult.value
                is Try.Failure -> {
                    Log.e(TAG, "Failed to retrieve asset: ${assetResult.value}")
                    return@withContext null
                }
            }
            
            val parseResult = epubParser.parse(asset)
            val builder = when (parseResult) {
                is Try.Success -> parseResult.value
                is Try.Failure -> {
                    Log.e(TAG, "Failed to parse EPUB: ${parseResult.value}")
                    return@withContext null
                }
            }
            
            val pub = builder.build()
            val coverBitmap = extractCoverFromPublication(pub)
            pub.close()
            coverBitmap
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting EPUB cover: ${e.message}", e)
            null
        }
    }

    suspend fun extractMetadata(epubPath: String): EpubMetadata? = withContext(Dispatchers.IO) {
        try {
            val file = File(epubPath)
            if (!file.exists()) {
                Log.e(TAG, "EPUB file not found: $epubPath")
                return@withContext null
            }

            val assetResult = assetRetriever.retrieve(file)
            val asset = when (assetResult) {
                is Try.Success -> assetResult.value
                is Try.Failure -> {
                    Log.e(TAG, "Failed to retrieve asset: ${assetResult.value}")
                    return@withContext null
                }
            }
            
            val parseResult = epubParser.parse(asset)
            val builder = when (parseResult) {
                is Try.Success -> parseResult.value
                is Try.Failure -> {
                    Log.e(TAG, "Failed to parse EPUB: ${parseResult.value}")
                    return@withContext null
                }
            }
            
            val pub = builder.build()
            val metadata = pub.metadata
            
            val result = EpubMetadata(
                title = metadata.title ?: "Unknown",
                authors = metadata.authors.mapNotNull { it.name },
                publisher = metadata.publishers.firstOrNull()?.name,
                publishedDate = metadata.published?.toString(),
                description = metadata.description,
                subjects = metadata.subjects.mapNotNull { it.name },
                language = metadata.languages.firstOrNull(),
                identifier = metadata.identifier,
                rights = null,
                numberOfPages = metadata.numberOfPages ?: 0
            )
            
            pub.close()
            result
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting EPUB metadata: ${e.message}", e)
            null
        }
    }

    suspend fun extractToc(epubPath: String): List<TocItem> = withContext(Dispatchers.IO) {
        try {
            val file = File(epubPath)
            if (!file.exists()) {
                Log.e(TAG, "EPUB file not found: $epubPath")
                return@withContext emptyList()
            }

            val assetResult = assetRetriever.retrieve(file)
            val asset = when (assetResult) {
                is Try.Success -> assetResult.value
                is Try.Failure -> {
                    Log.e(TAG, "Failed to retrieve asset: ${assetResult.value}")
                    return@withContext emptyList()
                }
            }
            
            val parseResult = epubParser.parse(asset)
            val builder = when (parseResult) {
                is Try.Success -> parseResult.value
                is Try.Failure -> {
                    Log.e(TAG, "Failed to parse EPUB: ${parseResult.value}")
                    return@withContext emptyList()
                }
            }
            
            val pub = builder.build()
            val toc = extractTocFromPublication(pub)
            pub.close()
            toc
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting TOC: ${e.message}", e)
            emptyList()
        }
    }

    private suspend fun extractCoverFromPublication(publication: Publication): Bitmap? {
        return try {
            val coverLink = publication.linkWithRel("cover")
            
            if (coverLink != null) {
                val resourceResult = publication.get(coverLink)
                val resource = when (resourceResult) {
                    is Try.Success<*, *> -> resourceResult.value
                    else -> return null
                }
                
                // Cover extraction disabled temporarily - API unclear
                Log.d(TAG, "Cover extraction temporarily disabled")
                null
            } else {
                // Fallback: try first image in resources
                val imageLink = publication.resources.firstOrNull { link ->
                    link.mediaType?.matches("image/*") == true
                }
                
                if (imageLink != null) {
                    val resourceResult = publication.get(imageLink)
                    val resource = when (resourceResult) {
                        is Try.Success<*, *> -> resourceResult.value
                        else -> return null
                    }
                    
                    // Cover extraction disabled temporarily
                    null
                } else null
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting cover from publication: ${e.message}", e)
            null
        }
    }

    private fun extractTocFromPublication(publication: Publication): List<TocItem> {
        return try {
            publication.tableOfContents.map { link ->
                linkToTocItem(link)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error building TOC: ${e.message}", e)
            emptyList()
        }
    }
    
    private fun linkToTocItem(link: Link): TocItem {
        return TocItem(
            title = link.title ?: "Untitled",
            href = link.href.toString(),
            children = link.children.map { linkToTocItem(it) }
        )
    }
}

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

data class TocItem(
    val title: String,
    val href: String,
    val children: List<TocItem> = emptyList()
)
