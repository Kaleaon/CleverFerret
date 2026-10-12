package com.universalmedialibrary.api.plugin

import com.universalmedialibrary.api.plugin.grpc.DummyLocalMetadataPlugin
import com.universalmedialibrary.api.plugin.grpc.PluginIPCBridgeBinder
import com.universalmedialibrary.api.plugin.grpc.PluginProcessMonitor
import com.universalmedialibrary.api.plugin.grpc.RemoteMetadataProviderProxy
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import java.util.concurrent.ConcurrentHashMap

class PluginRegistryImplRemoteTest {

    private lateinit var registry: PluginRegistryImpl
    private lateinit var dummyPlugin: DummyLocalMetadataPlugin
    private lateinit var binderBridge: PluginIPCBridgeBinder
    private lateinit var processMonitor: PluginProcessMonitor
    private lateinit var remoteProxy: RemoteMetadataProviderProxy

    @Before
    fun setUp() {
        registry = PluginRegistryImpl()
        dummyPlugin = DummyLocalMetadataPlugin()

        val hostedPlugins = ConcurrentHashMap<String, Plugin>()
        hostedPlugins[dummyPlugin.id] = dummyPlugin
        binderBridge = PluginIPCBridgeBinder(hostedPlugins)

        processMonitor = PluginProcessMonitor(
            onHealthChanged = { _, _ -> },
            onRestartRequested = { true }
        )

        remoteProxy = RemoteMetadataProviderProxy(
            id = dummyPlugin.id,
            name = dummyPlugin.name,
            version = dummyPlugin.version,
            description = dummyPlugin.description,
            author = dummyPlugin.author,
            supportedMediaTypes = setOf(MediaType.BOOK),
            ipcBridge = binderBridge,
            processMonitor = processMonitor
        )
    }

    @Test
    fun `PluginRegistryImpl transparently registers and routes queries to remote proxy plugin`() = runBlocking {
        registry.registerRemotePlugin(remoteProxy, packageName = "com.universalmedialibrary.test")

        val providers = registry.getMetadataProviders()
        assertEquals(1, providers.size)
        assertEquals(dummyPlugin.id, providers[0].id)

        val query = MetadataQuery(title = "Dune", mediaType = MediaType.BOOK)
        val searchResults = registry.searchAllProviders(query)

        assertEquals(1, searchResults.size)
        assertEquals("Dune", searchResults[0].title)
    }

    @Test
    fun `AggregatedMetadataService transparently queries remote proxy plugin`() = runBlocking {
        registry.registerPlugin(remoteProxy)
        val aggregatedService = AggregatedMetadataService(registry)

        val query = MetadataQuery(title = "Dune", mediaType = MediaType.BOOK)
        val searchResults = aggregatedService.search(query)

        assertEquals(1, searchResults.size)
        assertEquals("Dune", searchResults[0].title)
    }

    @Test
    fun `healthCheckAll includes status of out-of-process plugins`() = runBlocking {
        registry.registerPlugin(remoteProxy)

        val healthMap = registry.healthCheckAll()
        assertTrue(healthMap.containsKey(dummyPlugin.id))
        assertEquals(HealthStatus.HEALTHY, healthMap[dummyPlugin.id]?.status)
    }
}
