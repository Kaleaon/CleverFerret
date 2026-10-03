package com.universalmedialibrary.services.opds

import com.universalmedialibrary.data.local.dao.OPDSCatalogDao
import com.universalmedialibrary.data.local.entity.OPDSCatalog
import com.universalmedialibrary.services.ingestion.IngestionPipeline
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * OPDS Catalog Service
 *
 * Provides both catalog management (Room database) and remote feed access via [OPDSClient].
 * Default catalogs are seeded on first use to give new installations immediate access to free books.
 */
@Singleton
class OPDSCatalogService @Inject constructor(
    private val catalogDao: OPDSCatalogDao,
    private val opdsClient: OPDSClient,
    private val ingestionPipeline: IngestionPipeline
) {

    private val defaultCatalogs: List<OPDSCatalog> by lazy {
        val now = System.currentTimeMillis()
        listOf(
            OPDSCatalog(
                name = "Project Gutenberg",
                url = "https://www.gutenberg.org/ebooks.opds/",
                description = "70,000+ public domain ebooks curated by Project Gutenberg.",
                iconUrl = "https://www.gutenberg.org/gutenberg-512.png",
                isDefault = true,
                isEnabled = true,
                opdsVersion = "1.2",
                searchUrl = "https://www.gutenberg.org/ebooks/search.opds/?query={query}",
                createdAt = now,
                updatedAt = now
            ),
            OPDSCatalog(
                name = "Standard Ebooks",
                url = "https://standardebooks.org/opds/all",
                description = "Hand-crafted public domain editions with modern typography.",
                iconUrl = "https://standardebooks.org/images/logos/se-logo-128.png",
                isDefault = true,
                isEnabled = true,
                opdsVersion = "1.2",
                searchUrl = "https://standardebooks.org/opds/search?query={query}",
                createdAt = now,
                updatedAt = now
            ),
            OPDSCatalog(
                name = "Internet Archive Books",
                url = "https://archive.org/services/opds",
                description = "Millions of digitized books from libraries and archives worldwide.",
                iconUrl = "https://archive.org/images/glogo.png",
                isDefault = true,
                isEnabled = true,
                opdsVersion = "1.1",
                searchUrl = "https://archive.org/services/opds?search={query}",
                createdAt = now,
                updatedAt = now
            )
        )
    }

    suspend fun ensureDefaultCatalogs() = withContext(Dispatchers.IO) {
        val existing = catalogDao.getAllCatalogsOnce()
        val existingByUrl = existing.associateBy { it.url.lowercase() }

        defaultCatalogs.forEach { defaultCatalog ->
            val match = existingByUrl[defaultCatalog.url.lowercase()]
            if (match == null) {
                catalogDao.insertCatalog(defaultCatalog.copy(id = 0))
            } else {
                if (!match.isDefault ||
                    match.description != defaultCatalog.description ||
                    match.searchUrl != defaultCatalog.searchUrl ||
                    match.iconUrl != defaultCatalog.iconUrl
                ) {
                    catalogDao.updateCatalog(
                        match.copy(
                            name = defaultCatalog.name,
                            description = defaultCatalog.description,
                            iconUrl = defaultCatalog.iconUrl,
                            isDefault = true,
                            searchUrl = defaultCatalog.searchUrl,
                            opdsVersion = defaultCatalog.opdsVersion,
                            isEnabled = match.isEnabled || defaultCatalog.isEnabled,
                            updatedAt = System.currentTimeMillis()
                        )
                    )
                }
            }
        }
    }

    suspend fun browseCatalog(catalog: OPDSCatalog): Result<OPDSFeed> = withContext(Dispatchers.IO) {
        ensureDefaultCatalogs()
        runCatching {
            ingestionPipeline.execute(
                sourceId = "opds:${catalog.url.lowercase()}",
                authenticate = { Unit },
                fetchPage = { _, _ -> opdsClient.fetchFeed(catalog.url) },
                parse = { it },
                deduplicate = { feed ->
                    feed.copy(entries = feed.entries.distinctBy { "${it.title}:${it.acquisitionLinks.firstOrNull()?.href.orEmpty()}" })
                },
                enrichMetadata = { it },
                persist = { feed ->
                    if (catalog.id != 0L) {
                        catalogDao.updateLastAccessed(catalog.id, System.currentTimeMillis())
                    }
                    feed
                },
                nextIncrementalToken = { System.currentTimeMillis().toString() }
            ).result
        }
    }

    suspend fun searchCatalog(catalog: OPDSCatalog, query: String): Result<OPDSFeed> = withContext(Dispatchers.IO) {
        ensureDefaultCatalogs()
        if (catalog.searchUrl.isNullOrBlank()) {
            return@withContext Result.failure(
                IllegalStateException("${catalog.name} does not support search.")
            )
        }

        runCatching {
            val searchUrl = opdsClient.buildSearchUrl(catalog.searchUrl!!, query)
            ingestionPipeline.execute(
                sourceId = "opds-search:${catalog.url.lowercase()}",
                authenticate = { Unit },
                fetchPage = { _, _ -> opdsClient.fetchFeed(searchUrl) },
                parse = { it },
                deduplicate = { feed ->
                    feed.copy(entries = feed.entries.distinctBy { "${it.title}:${it.acquisitionLinks.firstOrNull()?.href.orEmpty()}" })
                },
                enrichMetadata = { it },
                persist = { it },
                nextIncrementalToken = { System.currentTimeMillis().toString() }
            ).result
        }
    }

    suspend fun fetchUrl(url: String): OPDSFeed = withContext(Dispatchers.IO) {
        ingestionPipeline.execute(
            sourceId = "opds-direct:${url.lowercase()}",
            authenticate = { Unit },
            fetchPage = { _, _ -> opdsClient.fetchFeed(url) },
            parse = { it },
            deduplicate = { feed ->
                feed.copy(entries = feed.entries.distinctBy { "${it.title}:${it.acquisitionLinks.firstOrNull()?.href.orEmpty()}" })
            },
            enrichMetadata = { it },
            persist = { it },
            nextIncrementalToken = { System.currentTimeMillis().toString() }
        ).result
    }

    fun buildSearchUrl(template: String, query: String): String {
        return opdsClient.buildSearchUrl(template, query)
    }

    fun getAllCatalogs(): Flow<List<OPDSCatalog>> {
        return catalogDao.getAllCatalogs()
    }

    suspend fun addCatalog(catalog: OPDSCatalog): Long {
        val now = System.currentTimeMillis()
        return catalogDao.insertCatalog(
            catalog.copy(
                id = 0,
                isDefault = false,
                createdAt = now,
                updatedAt = now
            )
        )
    }

    suspend fun deleteCatalog(catalog: OPDSCatalog) {
        catalogDao.deleteCatalog(catalog)
    }
}

data class OPDSFeed(
    val title: String,
    val entries: List<OPDSEntry> = emptyList(),
    val navigation: List<OPDSLink> = emptyList()
)

data class OPDSEntry(
    val title: String,
    val authors: List<String> = emptyList(),
    val summary: String? = null,
    val published: String? = null,
    val updated: String? = null,
    val language: String? = null,
    val coverUrl: String? = null,
    val acquisitionLinks: List<OPDSLink> = emptyList(),
    val navigationLinks: List<OPDSLink> = emptyList()
)

data class OPDSLink(
    val href: String,
    val title: String? = null,
    val rel: List<String> = emptyList(),
    val type: String? = null
)
