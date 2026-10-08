package com.universalmedialibrary.services.integration.yaacc

import com.universalmedialibrary.data.local.dao.ExternalMediaEntityDao
import com.universalmedialibrary.data.local.dao.YaaccServerDao
import com.universalmedialibrary.data.local.entity.ExternalMediaEntity
import com.universalmedialibrary.services.integration.IntegrationProvider
import com.universalmedialibrary.services.integration.ProviderStatus
import com.universalmedialibrary.services.integration.ProviderSyncResult
import com.universalmedialibrary.services.integration.ProviderType
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * YAACC (UPnP/DLNA) Integration Provider Adapter
 */
@Singleton
class YaaccIntegrationAdapter @Inject constructor(
    private val yaaccServerDao: YaaccServerDao,
    private val externalMediaEntityDao: ExternalMediaEntityDao
) : IntegrationProvider {

    override val providerId: String = "yaacc"
    override val providerName: String = "YAACC DLNA/UPnP"
    override val providerType: ProviderType = ProviderType.YAACC

    private val _providerStatus = MutableStateFlow(
        ProviderStatus(
            providerId = providerId,
            name = providerName,
            providerType = providerType,
            isConnected = false
        )
    )
    override val status: StateFlow<ProviderStatus> = _providerStatus.asStateFlow()

    override suspend fun connect(config: Map<String, String>): Boolean = withContext(Dispatchers.IO) {
        val serverCount = yaaccServerDao.getServerCount()
        val connected = serverCount > 0
        _providerStatus.value = _providerStatus.value.copy(
            isConnected = connected,
            itemCount = serverCount
        )
        connected
    }

    override suspend fun disconnect() {
        _providerStatus.value = _providerStatus.value.copy(isConnected = false)
    }

    override suspend fun testConnection(): Boolean = withContext(Dispatchers.IO) {
        yaaccServerDao.getServerCount() > 0
    }

    override suspend fun sync(): ProviderSyncResult = withContext(Dispatchers.IO) {
        val servers = yaaccServerDao.getAllServers()
        var itemsSynced = 0
        for (server in servers) {
            val entity = ExternalMediaEntity(
                providerId = "yaacc",
                externalId = server.udn,
                title = server.name,
                creator = server.manufacturer ?: "DLNA/UPnP",
                mediaType = "DLNA_SERVER",
                uri = server.locationUrl,
                lastSyncedAt = System.currentTimeMillis()
            )
            externalMediaEntityDao.insertEntity(entity)
            itemsSynced++
        }
        _providerStatus.value = _providerStatus.value.copy(
            itemCount = itemsSynced,
            lastSyncTime = System.currentTimeMillis()
        )
        ProviderSyncResult(true, itemsSynced, "Synced $itemsSynced YAACC servers")
    }

    override suspend fun searchRemote(query: String, limit: Int): List<ExternalMediaEntity> {
        return externalMediaEntityDao.searchEntities(query, limit).filter { it.providerId == "yaacc" }
    }

    override suspend fun fetchEntities(): List<ExternalMediaEntity> {
        return externalMediaEntityDao.getEntitiesByProvider("yaacc")
    }
}
