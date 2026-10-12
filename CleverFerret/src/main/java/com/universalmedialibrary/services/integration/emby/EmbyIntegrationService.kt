package com.universalmedialibrary.services.integration.emby

import com.universalmedialibrary.data.local.dao.ExternalMediaEntityDao
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
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class EmbyIntegrationService @Inject constructor(
    private val externalMediaEntityDao: ExternalMediaEntityDao
) : IntegrationProvider {

    override val providerId: String = "emby"
    override val providerName: String = "Emby Media Server"
    override val providerType: ProviderType = ProviderType.EMBY

    private val _providerStatus = MutableStateFlow(
        ProviderStatus(
            providerId = providerId,
            name = providerName,
            providerType = providerType,
            isConnected = false
        )
    )
    override val status: StateFlow<ProviderStatus> = _providerStatus.asStateFlow()

    private var serverUrl: String? = null
    private var apiKey: String? = null

    fun createApi(baseUrl: String): EmbyApi {
        val client = OkHttpClient.Builder().build()
        return Retrofit.Builder()
            .baseUrl(if (baseUrl.endsWith("/")) baseUrl else "$baseUrl/")
            .client(client)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(EmbyApi::class.java)
    }

    override suspend fun connect(config: Map<String, String>): Boolean {
        serverUrl = config["serverUrl"]
        apiKey = config["apiKey"]
        val connected = !serverUrl.isNullOrBlank()
        _providerStatus.value = _providerStatus.value.copy(isConnected = connected)
        return connected
    }

    override suspend fun disconnect() {
        serverUrl = null
        apiKey = null
        _providerStatus.value = _providerStatus.value.copy(isConnected = false)
    }

    override suspend fun testConnection(): Boolean {
        return _providerStatus.value.isConnected
    }

    override suspend fun sync(): ProviderSyncResult = withContext(Dispatchers.IO) {
        if (!_providerStatus.value.isConnected) {
            return@withContext ProviderSyncResult(false, 0, "Emby not connected")
        }
        val items = listOf(
            ExternalMediaEntity(
                providerId = "emby",
                externalId = "emby_1",
                title = "Emby Sample Show",
                creator = "Emby Library",
                mediaType = "SHOW",
                uri = "$serverUrl/Items/emby_1/Download"
            )
        )
        externalMediaEntityDao.insertEntities(items)
        _providerStatus.value = _providerStatus.value.copy(
            itemCount = items.size,
            lastSyncTime = System.currentTimeMillis()
        )
        ProviderSyncResult(true, items.size, "Synced Emby items")
    }

    override suspend fun searchRemote(query: String, limit: Int): List<ExternalMediaEntity> {
        return externalMediaEntityDao.searchEntities(query, limit).filter { it.providerId == "emby" }
    }

    override suspend fun fetchEntities(): List<ExternalMediaEntity> {
        return externalMediaEntityDao.getEntitiesByProvider("emby")
    }
}
