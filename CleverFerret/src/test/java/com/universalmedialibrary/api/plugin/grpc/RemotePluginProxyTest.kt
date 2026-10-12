package com.universalmedialibrary.api.plugin.grpc

import com.universalmedialibrary.api.plugin.HealthStatus
import com.universalmedialibrary.api.plugin.MediaMetadata
import com.universalmedialibrary.api.plugin.MediaType
import com.universalmedialibrary.api.plugin.MetadataProviderPlugin
import com.universalmedialibrary.api.plugin.MetadataQuery
import com.universalmedialibrary.api.plugin.MetadataSearchResult
import com.universalmedialibrary.api.plugin.Plugin
import com.universalmedialibrary.api.plugin.PluginCategory
import com.universalmedialibrary.api.plugin.PluginHealth
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import java.util.concurrent.ConcurrentHashMap

class RemotePluginProxyTest {

    private lateinit var mockRemotePlugin: DummyLocalMetadataPlugin
    private lateinit var binderBridge: PluginIPCBridgeBinder
    private lateinit var processMonitor: PluginProcessMonitor
    private lateinit var metadataProxy: RemoteMetadataProviderProxy
    private lateinit var contentProxy: RemoteContentSourceProxy

    @Before
    fun setUp() {
        mockRemotePlugin = DummyLocalMetadataPlugin()
        val hostedPlugins = ConcurrentHashMap<String, Plugin>()
        hostedPlugins[mockRemotePlugin.id] = mockRemotePlugin
        binderBridge = PluginIPCBridgeBinder(hostedPlugins)

        processMonitor = PluginProcessMonitor(
            onHealthChanged = { _, _ -> },
            onRestartRequested = { true }
        )

        metadataProxy = RemoteMetadataProviderProxy(
            id = mockRemotePlugin.id,
            name = mockRemotePlugin.name,
            version = mockRemotePlugin.version,
            description = mockRemotePlugin.description,
            author = mockRemotePlugin.author,
            supportedMediaTypes = setOf(MediaType.BOOK, MediaType.EBOOK),
            ipcBridge = binderBridge,
            processMonitor = processMonitor,
            callTimeoutMs = 1000L
        )

        contentProxy = RemoteContentSourceProxy(
            id = mockRemotePlugin.id,
            name = mockRemotePlugin.name,
            version = mockRemotePlugin.version,
            description = mockRemotePlugin.description,
            author = mockRemotePlugin.author,
            supportedMediaTypes = setOf(MediaType.BOOK),
            supportedFormats = setOf("epub", "pdf"),
            ipcBridge = binderBridge,
            processMonitor = processMonitor,
            callTimeoutMs = 1000L
        )
    }

    @Test
    fun `metadata search proxied over IPC returns remote results`() = runBlocking {
        val query = MetadataQuery(title = "Dune", mediaType = MediaType.BOOK)
        val result = metadataProxy.search(query)

        assertTrue("Expected search success over IPC", result.isSuccess)
        val searchResults = result.getOrThrow()
        assertEquals(1, searchResults.size)
        assertEquals("Dune", searchResults[0].title)
    }

    @Test
    fun `fetchDetails proxied over IPC returns remote metadata`() = runBlocking {
        val result = metadataProxy.fetchDetails("dune_123", MediaType.BOOK)

        assertTrue("Expected fetchDetails success over IPC", result.isSuccess)
        val metadata = result.getOrThrow()
        assertEquals("Dune", metadata.title)
        assertEquals("Frank Herbert", metadata.authors.firstOrNull()?.name)
    }

    @Test
    fun `fetchCoverArt proxied over IPC returns cover URL`() = runBlocking {
        val result = metadataProxy.fetchCoverArt("dune_123")

        assertTrue("Expected fetchCoverArt success over IPC", result.isSuccess)
        assertEquals("https://example.com/dune.jpg", result.getOrThrow())
    }

    @Test
    fun `remote plugin crash or exception does not crash host process`() = runBlocking {
        mockRemotePlugin.shouldCrash = true

        val query = MetadataQuery(title = "CrashTest")
        val result = metadataProxy.search(query)

        assertFalse("Expected failure when remote plugin throws exception", result.isSuccess)
        assertNotNull(result.exceptionOrNull())
        
        // Host process remains alive and healthy
        val health = processMonitor.getHealthStatus(mockRemotePlugin.id)
        assertEquals(HealthStatus.UNHEALTHY, health.status)
    }

    @Test
    fun `RPC timeout enforces execution time limit`() = runBlocking {
        mockRemotePlugin.delayMs = OVER_TIMEOUT_DELAY_MS // Exceeds 1000ms proxy timeout

        val query = MetadataQuery(title = "SlowTest")
        val result = metadataProxy.search(query)

        assertFalse("Expected timeout failure for slow remote execution", result.isSuccess)
        assertTrue(result.exceptionOrNull() is Exception)
    }

    companion object {
        private const val OVER_TIMEOUT_DELAY_MS = 2000L
    }
}

class DummyLocalMetadataPlugin : MetadataProviderPlugin {
    override val id: String = "dummy_provider"
    override val name: String = "Dummy Metadata Provider"
    override val version: String = "1.0.0"
    override val description: String = "Test plugin"
    override val author: String = "Unit Test"
    override val category: PluginCategory = PluginCategory.METADATA_PROVIDER
    override var isEnabled: Boolean = true
    override val capabilities: Set<com.universalmedialibrary.api.plugin.PluginCapability> = emptySet()
    override val configurationOptions: List<com.universalmedialibrary.api.plugin.ConfigurationOption> = emptyList()
    override val supportedMediaTypes: Set<MediaType> = setOf(MediaType.BOOK)

    var shouldCrash = false
    var delayMs = 0L

    override suspend fun initialize(): Result<Unit> = Result.success(Unit)
    override suspend fun shutdown() {}
    override suspend fun healthCheck(): PluginHealth = PluginHealth(status = HealthStatus.HEALTHY)

    override suspend fun search(query: MetadataQuery): Result<List<MetadataSearchResult>> {
        if (delayMs > 0) delay(delayMs)
        if (shouldCrash) throw RuntimeException("Simulated plugin process crash")
        return Result.success(
            listOf(
                MetadataSearchResult(
                    id = "dune_123",
                    providerId = id,
                    title = "Dune",
                    authors = listOf("Frank Herbert"),
                    mediaType = MediaType.BOOK
                )
            )
        )
    }

    override suspend fun fetchDetails(id: String, mediaType: MediaType): Result<MediaMetadata> {
        if (shouldCrash) throw RuntimeException("Simulated plugin process crash")
        return Result.success(
            MediaMetadata(
                id = id,
                providerId = this.id,
                title = "Dune",
                authors = listOf(com.universalmedialibrary.api.plugin.PersonInfo("Frank Herbert")),
                mediaType = mediaType
            )
        )
    }

    override suspend fun fetchCoverArt(id: String, size: CoverSize): Result<String> {
        if (shouldCrash) throw RuntimeException("Simulated plugin process crash")
        return Result.success("https://example.com/dune.jpg")
    }

    override suspend fun fetchRecommendations(id: String, limit: Int): Result<List<MetadataSearchResult>> {
        return search(MetadataQuery())
    }
}
