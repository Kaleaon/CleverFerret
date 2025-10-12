package com.universalmedialibrary.services.opds

import android.content.Context
import android.util.Log
import com.universalmedialibrary.data.local.dao.OPDSCatalogDao
import com.universalmedialibrary.data.local.entity.OPDSCatalog
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.coroutines.flow.Flow
import org.readium.r2.opds.OPDS1Parser
import org.readium.r2.opds.OPDS2Parser
import org.readium.r2.shared.util.Try
import org.readium.r2.shared.util.http.DefaultHttpClient
import org.readium.r2.shared.util.http.HttpRequest
import javax.inject.Inject
import javax.inject.Singleton

/**
 * OPDS Catalog Service
 * 
 * Provides comprehensive OPDS (Open Publication Distribution System) support
 * for browsing and downloading books from online catalogs.
 * 
 * OPDS enables:
 * - Browsing thousands of free books from various sources
 * - Searching across catalogs
 * - Downloading books directly to the library
 * - Supporting both OPDS 1.2 and OPDS 2.0
 * 
 * Popular OPDS catalogs:
 * - Project Gutenberg (70,000+ free books)
 * - Internet Archive (20+ million items)
 * - Standard Ebooks (curated collection)
 * - Feedbooks (50,000+ books)
 * - And many more!
 * 
 * Based on Readium's OPDS parser: https://readium.org/kotlin-toolkit/
 */
@Singleton
class OPDSService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val catalogDao: OPDSCatalogDao
) {
    private val TAG = "OPDSService"
    
    // Readium OPDS parser and HTTP client
    private val httpClient by lazy { DefaultHttpClient() }
    private val opds1Parser by lazy { OPDS1Parser() }
    private val opds2Parser by lazy { OPDS2Parser() }

    /**
     * Browse an OPDS catalog
     * 
     * @param catalogUrl URL of the OPDS feed
     * @return Result containing OPDSFeed or error
     */
    suspend fun browseCatalog(catalogUrl: String): Result<OPDSFeed> = withContext(Dispatchers.IO) {
        try {
            Log.d(TAG, "Browsing catalog: $catalogUrl")
            
            // Fetch the feed
            val url = org.readium.r2.shared.util.Url(catalogUrl) ?: run {
                return@withContext Result.failure(Exception("Invalid URL: $catalogUrl"))
            }
            
            val request = HttpRequest(url)
            val response = httpClient.fetch(request)
            
            when (response) {
                is Try.Success -> {
                    val httpResponse = response.value
                    val body = httpResponse.body
                    
                    when (body) {
                        is Try.Success -> {
                            val feedData = body.value
                            
                            // Try OPDS 2 first, then OPDS 1
                            val feed = tryParseOPDS2(feedData) ?: tryParseOPDS1(feedData)
                            
                            if (feed != null) {
                                Result.success(feed)
                            } else {
                                Result.failure(Exception("Failed to parse OPDS feed"))
                            }
                        }
                        is Try.Failure -> {
                            Log.e(TAG, "Failed to read response body: ${body.value}")
                            Result.failure(Exception("Failed to read feed: ${body.value}"))
                        }
                    }
                }
                is Try.Failure -> {
                    Log.e(TAG, "HTTP request failed: ${response.value}")
                    Result.failure(Exception("Failed to fetch feed: ${response.value}"))
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error browsing catalog: ${e.message}", e)
            Result.failure(e)
        }
    }

    /**
     * Search a catalog
     * 
     * @param catalogUrl Base catalog URL
     * @param query Search query
     * @return Result containing search results
     */
    suspend fun searchCatalog(catalogUrl: String, query: String): Result<OPDSFeed> = withContext(Dispatchers.IO) {
        try {
            // Most OPDS feeds use a search template, but for simplicity we'll append query params
            val searchUrl = if (catalogUrl.contains("?")) {
                "$catalogUrl&q=$query"
            } else {
                "$catalogUrl?q=$query"
            }
            
            browseCatalog(searchUrl)
        } catch (e: Exception) {
            Log.e(TAG, "Error searching catalog: ${e.message}", e)
            Result.failure(e)
        }
    }

    private fun tryParseOPDS2(data: ByteArray): OPDSFeed? {
        return try {
            val parseResult = opds2Parser.parse(data, null)
            when (parseResult) {
                is Try.Success -> {
                    val feed = parseResult.value
                    OPDSFeed(
                        title = feed.metadata.title ?: "Catalog",
                        entries = feed.publications.map { pub ->
                            OPDSEntry(
                                title = pub.metadata.title ?: "Unknown",
                                authors = pub.metadata.authors.map { it.name.orEmpty() },
                                summary = pub.metadata.description,
                                published = pub.metadata.published?.toString(),
                                updated = pub.metadata.modified?.toString(),
                                language = pub.metadata.languages.firstOrNull()?.code,
                                coverUrl = pub.images.firstOrNull()?.url()?.toString(),
                                acquisitionLinks = pub.links
                                    .filter { it.rels.contains("http://opds-spec.org/acquisition") }
                                    .map { link ->
                                        OPDSLink(
                                            href = link.url().toString(),
                                            title = link.title,
                                            rel = link.rels
                                        )
                                    }
                            )
                        },
                        navigation = feed.navigation.map { link ->
                            OPDSLink(
                                href = link.url().toString(),
                                title = link.title,
                                rel = link.rels
                            )
                        }
                    )
                }
                is Try.Failure -> null
            }
        } catch (e: Exception) {
            Log.d(TAG, "Not an OPDS 2 feed: ${e.message}")
            null
        }
    }

    private fun tryParseOPDS1(data: ByteArray): OPDSFeed? {
        return try {
            val parseResult = opds1Parser.parse(data, null)
            when (parseResult) {
                is Try.Success -> {
                    val feed = parseResult.value
                    OPDSFeed(
                        title = feed.metadata.title ?: "Catalog",
                        entries = feed.publications.map { pub ->
                            OPDSEntry(
                                title = pub.metadata.title ?: "Unknown",
                                authors = pub.metadata.authors.map { it.name.orEmpty() },
                                summary = pub.metadata.description,
                                published = pub.metadata.published?.toString(),
                                updated = pub.metadata.modified?.toString(),
                                language = pub.metadata.languages.firstOrNull()?.code,
                                coverUrl = pub.images.firstOrNull()?.url()?.toString(),
                                acquisitionLinks = pub.links
                                    .filter { it.rels.any { rel -> rel.contains("acquisition") } }
                                    .map { link ->
                                        OPDSLink(
                                            href = link.url().toString(),
                                            title = link.title,
                                            rel = link.rels
                                        )
                                    }
                            )
                        },
                        navigation = feed.navigation.map { link ->
                            OPDSLink(
                                href = link.url().toString(),
                                title = link.title,
                                rel = link.rels
                            )
                        }
                    )
                }
                is Try.Failure -> null
            }
        } catch (e: Exception) {
            Log.d(TAG, "Not an OPDS 1 feed: ${e.message}")
            null
        }
    }

    /**
     * Get all saved catalogs from database
     */
    fun getAllCatalogs(): Flow<List<OPDSCatalog>> {
        return catalogDao.getAllCatalogs()
    }

    /**
     * Add a new catalog
     */
    suspend fun addCatalog(catalog: OPDSCatalog): Long {
        return catalogDao.insert(catalog)
    }

    /**
     * Delete a catalog
     */
    suspend fun deleteCatalog(catalog: OPDSCatalog) {
        catalogDao.delete(catalog)
    }

    /**
     * Update catalog last accessed time
     */
    suspend fun updateLastAccessed(catalogId: Long, timestamp: Long) {
        catalogDao.updateLastAccessed(catalogId, timestamp)
    }
}

/**
 * OPDS Feed representation
 */
data class OPDSFeed(
    val title: String,
    val entries: List<OPDSEntry> = emptyList(),
    val navigation: List<OPDSLink> = emptyList()
)

/**
 * OPDS Entry (book or collection)
 */
data class OPDSEntry(
    val title: String,
    val authors: List<String> = emptyList(),
    val summary: String? = null,
    val published: String? = null,
    val updated: String? = null,
    val language: String? = null,
    val coverUrl: String? = null,
    val acquisitionLinks: List<OPDSLink> = emptyList()
)

/**
 * OPDS Link
 */
data class OPDSLink(
    val href: String,
    val title: String? = null,
    val rel: List<String> = emptyList()
)
