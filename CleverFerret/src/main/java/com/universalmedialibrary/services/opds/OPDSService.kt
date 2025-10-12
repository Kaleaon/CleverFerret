package com.universalmedialibrary.services.opds

import android.content.Context
import android.util.Log
import com.universalmedialibrary.data.local.dao.OPDSCatalogDao
import com.universalmedialibrary.data.local.entity.OPDSCatalog
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * OPDS Catalog Service
 * 
 * Basic OPDS support for catalog management
 * Full browse/download features will be enabled in v1.1.0
 */
@Singleton
class OPDSService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val catalogDao: OPDSCatalogDao
) {
    private val TAG = "OPDSService"

    suspend fun browseCatalog(catalogUrl: String): Result<OPDSFeed> = withContext(Dispatchers.IO) {
        Log.w(TAG, "OPDS browsing will be fully enabled in v1.1.0")
        Result.failure(Exception("OPDS browsing currently limited"))
    }

    suspend fun searchCatalog(catalogUrl: String, query: String): Result<OPDSFeed> = withContext(Dispatchers.IO) {
        Log.w(TAG, "OPDS search will be fully enabled in v1.1.0")
        Result.failure(Exception("OPDS search currently limited"))
    }

    fun getAllCatalogs(): Flow<List<OPDSCatalog>> {
        return catalogDao.getAllCatalogs()
    }

    suspend fun addCatalog(catalog: OPDSCatalog): Long {
        return catalogDao.insert(catalog)
    }

    suspend fun deleteCatalog(catalog: OPDSCatalog) {
        catalogDao.delete(catalog)
    }

    suspend fun updateLastAccessed(catalogId: Long, timestamp: Long) {
        catalogDao.updateLastAccessed(catalogId, timestamp)
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
    val acquisitionLinks: List<OPDSLink> = emptyList()
)

data class OPDSLink(
    val href: String,
    val title: String? = null,
    val rel: List<String> = emptyList()
)
