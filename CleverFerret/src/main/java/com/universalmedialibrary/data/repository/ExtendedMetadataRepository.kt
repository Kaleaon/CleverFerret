package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.ExtendedMetadataDao
import com.universalmedialibrary.data.local.entity.ExtendedMetadata
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for accessing and managing extended (custom) metadata.
 */
@Singleton
class ExtendedMetadataRepository @Inject constructor(
    private val dao: ExtendedMetadataDao
) {
    fun getMetadata(itemId: Long): Flow<List<ExtendedMetadata>> = dao.getExtendedMetadata(itemId)

    suspend fun getMetadataSync(itemId: Long): List<ExtendedMetadata> = dao.getExtendedMetadataSync(itemId)

    suspend fun setMetadata(itemId: Long, key: String, value: String, type: String = "STRING") {
        dao.insert(ExtendedMetadata(itemId, key, value, type))
    }

    suspend fun deleteMetadata(itemId: Long, key: String) {
        dao.delete(itemId, key)
    }

    fun getAllAvailableKeys(): Flow<List<String>> = dao.getAllKeys()
}
