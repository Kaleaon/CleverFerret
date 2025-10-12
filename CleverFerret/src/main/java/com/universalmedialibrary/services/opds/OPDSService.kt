package com.universalmedialibrary.services.opds

import android.content.Context
import android.util.Log
import com.universalmedialibrary.data.local.dao.OPDSCatalogDao
import com.universalmedialibrary.data.local.entity.OPDSCatalog
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.readium.r2.opds.*
import org.readium.r2.shared.publication.*
import org.readium.r2.shared.util.http.DefaultHttpClient
import org.readium.r2.shared.util.Try
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
    
    // Readium OPDS parser
    private val httpClient = DefaultHttpClient()
    private val opdsParser = OPDS1Parser()
    private val opds2Parser = OPDS2Parser()

    /**
     * Initialize default OPDS catalogs
     * Called on first app launch
     */
    suspend fun initializeDefaultCatalogs() = withContext(Dispatchers.IO) {
        try {
            val existingCount = catalogDao.getCatalogCount()
            if (existingCount > 0) {
                Log.d(TAG, "Default catalogs already initialized")
                return@withContext
            }

            val defaultCatalogs = getDefaultCatalogs()
            catalogDao.insertCatalogs(defaultCatalogs)
            
            Log.i(TAG, "✅ Initialized ${defaultCatalogs.size} default OPDS catalogs")
        } catch (e: Exception) {
            Log.e(TAG, "Failed to initialize default catalogs: ${e.message}", e)
        }
    }

    /**
     * Get default OPDS catalogs
     */
    private fun getDefaultCatalogs(): List<OPDSCatalog> {
        return listOf(
            // Project Gutenberg - 70,000+ free books
            OPDSCatalog(
                name = "Project Gutenberg",
                url = "https://m.gutenberg.org/ebooks.opds/",
                description = "70,000+ free ebooks from Project Gutenberg",
                iconUrl = "https://www.gutenberg.org/gutenberg/favicon.ico",
                isDefault = true,
                opdsVersion = "1.2",
                searchUrl = "https://m.gutenberg.org/ebooks.opds/?query={searchTerms}"
            ),
            
            // Internet Archive - Millions of items
            OPDSCatalog(
                name = "Internet Archive",
                url = "https://bookserver.archive.org/catalog/",
                description = "20+ million free books, movies, music from Internet Archive",
                iconUrl = "https://archive.org/favicon.ico",
                isDefault = true,
                opdsVersion = "1.2"
            ),
            
            // Standard Ebooks - High-quality public domain
            OPDSCatalog(
                name = "Standard Ebooks",
                url = "https://standardebooks.org/opds",
                description = "High-quality, carefully formatted public domain ebooks",
                iconUrl = "https://standardebooks.org/images/logo.svg",
                isDefault = true,
                opdsVersion = "1.2",
                searchUrl = "https://standardebooks.org/opds/search?query={searchTerms}"
            ),
            
            // Feedbooks - Public domain + original fiction
            OPDSCatalog(
                name = "Feedbooks",
                url = "https://catalog.feedbooks.com/catalog/public_domain.atom",
                description = "50,000+ public domain books in multiple languages",
                iconUrl = "https://www.feedbooks.com/favicon.ico",
                isDefault = true,
                opdsVersion = "1.2"
            ),
            
            // OPDS Test Catalog (for development)
            OPDSCatalog(
                name = "Readium Test Catalog",
                url = "https://test.opds.io/2.0/home.json",
                description = "Readium OPDS test catalog for testing",
                iconUrl = null,
                isDefault = true,
                opdsVersion = "2.0"
            )
        )
    }

    /**
     * Fetch OPDS feed from catalog
     * 
     * @param catalog OPDS catalog to fetch from
     * @return OPDSFeedResult containing publications
     */
    suspend fun fetchFeed(catalog: OPDSCatalog): OPDSFeedResult = withContext(Dispatchers.IO) {
        try {
            // Update access time
            catalogDao.updateAccessTime(catalog.id)
            
            // Fetch feed based on OPDS version
            val result = when (catalog.opdsVersion) {
                "2.0" -> fetchOPDS2Feed(catalog.url)
                else -> fetchOPDS1Feed(catalog.url)
            }
            
            // Log result safely
            when (result) {
                is OPDSFeedResult.Success -> {
                    Log.d(TAG, "✅ Fetched feed from ${catalog.name}: ${result.publications.size} items")
                }
                is OPDSFeedResult.Error -> {
                    Log.e(TAG, "❌ Failed to fetch feed from ${catalog.name}: ${result.message}")
                }
            }
            
            result
        } catch (e: Exception) {
            Log.e(TAG, "Failed to fetch feed from ${catalog.name}: ${e.message}", e)
            OPDSFeedResult.Error(e.message ?: "Unknown error")
        }
    }

    /**
     * Fetch OPDS 1.2 feed (Atom-based)
     */
    private suspend fun fetchOPDS1Feed(url: String): OPDSFeedResult {
        return try {
            // Fetch feed XML
            val response = httpClient.get(url)
            if (response !is Try.Success) {
                return OPDSFeedResult.Error("Failed to fetch feed")
            }
            
            val xmlData = response.value.body
            val feed = opdsParser.parse(xmlData, url)
            
            if (feed !is Try.Success) {
                return OPDSFeedResult.Error("Failed to parse OPDS 1.2 feed")
            }
            
            // Extract publications
            val publications = feed.value.publications.map { pub ->
                OPDSPublication(
                    title = pub.metadata.title ?: "Unknown",
                    authors = pub.metadata.authors.map { it.name },
                    identifier = pub.metadata.identifier,
                    publisher = pub.metadata.publisher?.name,
                    description = pub.metadata.description,
                    language = pub.metadata.languages.firstOrNull(),
                    publishedDate = pub.metadata.published?.toString(),
                    coverUrl = pub.images.firstOrNull()?.href?.toString(),
                    downloadLinks = pub.links.filter { it.rels.contains("http://opds-spec.org/acquisition") }
                        .map { link ->
                            DownloadLink(
                                url = link.href.toString(),
                                type = link.type ?: "application/epub+zip",
                                title = link.title
                            )
                        },
                    navigationLinks = pub.links.filter { !it.rels.contains("http://opds-spec.org/acquisition") }
                        .map { link ->
                            NavigationLink(
                                url = link.href.toString(),
                                title = link.title ?: "Link",
                                rel = link.rels.firstOrNull() ?: ""
                            )
                        }
                )
            }
            
            // Extract navigation links from feed
            val navigation = feed.value.navigation.map { link ->
                NavigationLink(
                    url = link.href.toString(),
                    title = link.title ?: "Link",
                    rel = link.rels.firstOrNull() ?: ""
                )
            }
            
            OPDSFeedResult.Success(
                title = feed.value.metadata.title ?: "Catalog",
                publications = publications,
                navigation = navigation
            )
        } catch (e: Exception) {
            Log.e(TAG, "Error parsing OPDS 1.2 feed: ${e.message}", e)
            OPDSFeedResult.Error(e.message ?: "Parse error")
        }
    }

    /**
     * Fetch OPDS 2.0 feed (JSON-based)
     */
    private suspend fun fetchOPDS2Feed(url: String): OPDSFeedResult {
        return try {
            // Fetch feed JSON
            val response = httpClient.get(url)
            if (response !is Try.Success) {
                return OPDSFeedResult.Error("Failed to fetch feed")
            }
            
            val jsonData = response.value.body
            val feed = opds2Parser.parse(jsonData, url)
            
            if (feed !is Try.Success) {
                return OPDSFeedResult.Error("Failed to parse OPDS 2.0 feed")
            }
            
            // Similar processing as OPDS 1.2
            val publications = feed.value.publications.map { pub ->
                OPDSPublication(
                    title = pub.metadata.title ?: "Unknown",
                    authors = pub.metadata.authors.map { it.name },
                    identifier = pub.metadata.identifier,
                    publisher = pub.metadata.publisher?.name,
                    description = pub.metadata.description,
                    language = pub.metadata.languages.firstOrNull(),
                    publishedDate = pub.metadata.published?.toString(),
                    coverUrl = pub.images.firstOrNull()?.href?.toString(),
                    downloadLinks = pub.links.filter { it.rels.contains("http://opds-spec.org/acquisition") }
                        .map { link ->
                            DownloadLink(
                                url = link.href.toString(),
                                type = link.type ?: "application/epub+zip",
                                title = link.title
                            )
                        },
                    navigationLinks = emptyList()
                )
            }
            
            OPDSFeedResult.Success(
                title = feed.value.metadata.title ?: "Catalog",
                publications = publications,
                navigation = emptyList()
            )
        } catch (e: Exception) {
            Log.e(TAG, "Error parsing OPDS 2.0 feed: ${e.message}", e)
            OPDSFeedResult.Error(e.message ?: "Parse error")
        }
    }

    /**
     * Search OPDS catalog
     * 
     * @param catalog Catalog to search
     * @param query Search query
     * @return Search results
     */
    suspend fun searchCatalog(catalog: OPDSCatalog, query: String): OPDSFeedResult {
        if (catalog.searchUrl == null) {
            return OPDSFeedResult.Error("Catalog does not support search")
        }
        
        // Build search URL
        val searchUrl = catalog.searchUrl.replace("{searchTerms}", query)
        
        // Fetch search results
        return when (catalog.opdsVersion) {
            "2.0" -> fetchOPDS2Feed(searchUrl)
            else -> fetchOPDS1Feed(searchUrl)
        }
    }

    /**
     * Add custom OPDS catalog
     * 
     * @param name Catalog name
     * @param url Catalog URL
     * @param username Optional auth username
     * @param password Optional auth password
     * @return Catalog ID or null if failed
     */
    suspend fun addCustomCatalog(
        name: String,
        url: String,
        username: String? = null,
        password: String? = null
    ): Long? = withContext(Dispatchers.IO) {
        try {
            // Validate URL by attempting to fetch - try both versions
            val testResult1 = fetchOPDS1Feed(url)
            val testResult = if (testResult1 is OPDSFeedResult.Error) {
                fetchOPDS2Feed(url)
            } else {
                testResult1
            }
            
            if (testResult is OPDSFeedResult.Error) {
                Log.w(TAG, "Failed to validate catalog URL: ${testResult.message}")
                return@withContext null
            }
            
            // Detect OPDS version from successful probe
            val opdsVersion = when (testResult) {
                is OPDSFeedResult.Success -> if (testResult1 is OPDSFeedResult.Success) "1.2" else "2.0"
                else -> "1.2"
            }
            
            // Create catalog
            val catalog = OPDSCatalog(
                name = name,
                url = url,
                username = username,
                password = password,
                isDefault = false,
                opdsVersion = opdsVersion
            )
            
            val id = catalogDao.insertCatalog(catalog)
            Log.i(TAG, "✅ Added custom catalog: $name (ID: $id)")
            id
        } catch (e: Exception) {
            Log.e(TAG, "Failed to add custom catalog: ${e.message}", e)
            null
        }
    }

    /**
     * Remove catalog
     */
    suspend fun removeCatalog(catalog: OPDSCatalog): Boolean {
        return try {
            if (catalog.isDefault) {
                Log.w(TAG, "Cannot remove default catalog: ${catalog.name}")
                return false
            }
            catalogDao.deleteCatalog(catalog)
            Log.i(TAG, "✅ Removed catalog: ${catalog.name}")
            true
        } catch (e: Exception) {
            Log.e(TAG, "Failed to remove catalog: ${e.message}", e)
            false
        }
    }
}

/**
 * OPDS Feed Result
 */
sealed class OPDSFeedResult {
    data class Success(
        val title: String,
        val publications: List<OPDSPublication>,
        val navigation: List<NavigationLink>
    ) : OPDSFeedResult()
    
    data class Error(val message: String) : OPDSFeedResult()
}

/**
 * OPDS Publication
 */
data class OPDSPublication(
    val title: String,
    val authors: List<String> = emptyList(),
    val identifier: String? = null,
    val publisher: String? = null,
    val description: String? = null,
    val language: String? = null,
    val publishedDate: String? = null,
    val coverUrl: String? = null,
    val downloadLinks: List<DownloadLink> = emptyList(),
    val navigationLinks: List<NavigationLink> = emptyList()
)

/**
 * Download Link
 */
data class DownloadLink(
    val url: String,
    val type: String,
    val title: String? = null
)

/**
 * Navigation Link
 */
data class NavigationLink(
    val url: String,
    val title: String,
    val rel: String
)
