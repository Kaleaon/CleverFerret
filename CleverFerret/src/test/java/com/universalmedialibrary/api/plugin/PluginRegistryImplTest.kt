package com.universalmedialibrary.api.plugin

import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.withTimeoutOrNull
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import kotlin.system.measureNanoTime

@OptIn(ExperimentalCoroutinesApi::class)
class PluginRegistryImplTest {

    private lateinit var registry: PluginRegistryImpl

    @Before
    fun setUp() {
        registry = PluginRegistryImpl()
        registry.hostApiVersion = "1.0.0"
    }

    private class TestPlugin(
        override val manifest: PluginManifest,
        override val category: PluginCategory = PluginCategory.METADATA_PROVIDER,
        override var isEnabled: Boolean = true,
        override val configurationOptions: List<ConfigurationOption> = emptyList(),
        private val initResult: Result<Unit> = Result.success(Unit)
    ) : Plugin {
        var initialized = false
        var shutdownCalled = false

        override suspend fun initialize(): Result<Unit> {
            initialized = true
            return initResult
        }

        override suspend fun shutdown() {
            shutdownCalled = true
        }

        override suspend fun healthCheck(): PluginHealth {
            return PluginHealth(HealthStatus.HEALTHY, "OK")
        }
    }

    @Test
    fun `test register valid plugin succeeds and initializes`() = runBlocking {
        val manifest = PluginManifest(
            id = "test-plugin-1",
            name = "Test Metadata Plugin",
            version = "1.0.0",
            minHostVersion = "1.0.0",
            maxHostVersion = "2.0.0",
            requiredCapabilities = setOf(PluginCapability.SEARCH_BY_TITLE),
            author = "CleverFerret",
            description = "Test plugin description"
        )
        val plugin = TestPlugin(manifest = manifest)

        registry.registerPlugin(plugin)

        assertEquals(1, registry.getAllPlugins().size)
        assertEquals(plugin, registry.getPlugin("test-plugin-1"))
        
        // Property delegation tests
        assertEquals("test-plugin-1", plugin.id)
        assertEquals("Test Metadata Plugin", plugin.name)
        assertEquals("1.0.0", plugin.version)
        assertEquals("CleverFerret", plugin.author)
        assertEquals("Test plugin description", plugin.description)
        assertEquals(setOf(PluginCapability.SEARCH_BY_TITLE), plugin.capabilities)

        // Wait brief moment for async initialization coroutine
        val registeredEvent = withTimeoutOrNull(1000) {
            registry.events.first { it is PluginEvent.PluginRegistered }
        }
        assertNotNull(registeredEvent)
        assertTrue(plugin.initialized)
    }

    @Test
    fun `test register plugin with incompatible minHostVersion is rejected`() = runBlocking {
        val manifest = PluginManifest(
            id = "outdated-plugin",
            name = "Outdated Plugin",
            version = "1.0.0",
            minHostVersion = "2.0.0", // Host is 1.0.0, so this requires host >= 2.0.0
            author = "External Dev"
        )
        val plugin = TestPlugin(manifest = manifest)

        var callbackRejectedReason: String? = null
        registry.addLifecycleCallback(object : PluginLifecycleCallback {
            override fun onPluginRegistered(plugin: Plugin) {}
            override fun onPluginUnregistered(pluginId: String) {}
            override fun onPluginEnabled(plugin: Plugin) {}
            override fun onPluginDisabled(plugin: Plugin) {}
            override fun onPluginError(pluginId: String, error: Throwable) {}
            override fun onPluginRejected(pluginId: String, reason: String) {
                callbackRejectedReason = reason
            }
        })

        registry.registerPlugin(plugin)

        assertNull(registry.getPlugin("outdated-plugin"))
        assertEquals(0, registry.getAllPlugins().size)
        assertFalse(plugin.initialized)

        val rejectedEvent = withTimeoutOrNull(1000) {
            registry.events.first { it is PluginEvent.PluginRejected }
        } as? PluginEvent.PluginRejected

        assertNotNull(rejectedEvent)
        assertEquals("outdated-plugin", rejectedEvent?.pluginId)
        assertTrue(rejectedEvent?.reason?.contains("minimum required host version is '2.0.0'") == true)
        assertEquals(rejectedEvent?.reason, callbackRejectedReason)
    }

    @Test
    fun `test register plugin exceeding maxHostVersion is rejected`() = runBlocking {
        registry.hostApiVersion = "2.1.0"
        val manifest = PluginManifest(
            id = "legacy-plugin",
            name = "Legacy Plugin",
            version = "1.0.0",
            minHostVersion = "1.0.0",
            maxHostVersion = "2.0.0" // Host is 2.1.0, exceeding max
        )
        val plugin = TestPlugin(manifest = manifest)

        registry.registerPlugin(plugin)

        assertNull(registry.getPlugin("legacy-plugin"))
        assertFalse(plugin.initialized)

        val rejectedEvent = withTimeoutOrNull(1000) {
            registry.events.first { it is PluginEvent.PluginRejected }
        } as? PluginEvent.PluginRejected

        assertNotNull(rejectedEvent)
        assertEquals("legacy-plugin", rejectedEvent?.pluginId)
        assertTrue(rejectedEvent?.reason?.contains("maximum supported host version is '2.0.0'") == true)
    }

    @Test
    fun `test register plugin with blank manifest metadata is rejected`() = runBlocking {
        val manifest = PluginManifest(
            id = "",
            name = "   ",
            version = "1.0.0",
            minHostVersion = "1.0.0"
        )
        val plugin = TestPlugin(manifest = manifest)

        registry.registerPlugin(plugin)

        assertEquals(0, registry.getAllPlugins().size)

        val rejectedEvent = withTimeoutOrNull(1000) {
            registry.events.first { it is PluginEvent.PluginRejected }
        } as? PluginEvent.PluginRejected

        assertNotNull(rejectedEvent)
        assertTrue(rejectedEvent?.reason?.contains("ID cannot be blank") == true)
    }

    @Test
    fun `test register plugin with invalid minHostVersion range is rejected`() = runBlocking {
        val manifest = PluginManifest(
            id = "invalid-range-plugin",
            name = "Invalid Range Plugin",
            version = "1.0.0",
            minHostVersion = "3.0.0",
            maxHostVersion = "2.0.0"
        )
        val plugin = TestPlugin(manifest = manifest)

        registry.registerPlugin(plugin)

        assertNull(registry.getPlugin("invalid-range-plugin"))

        val rejectedEvent = withTimeoutOrNull(1000) {
            registry.events.first { it is PluginEvent.PluginRejected }
        } as? PluginEvent.PluginRejected

        assertNotNull(rejectedEvent)
        assertTrue(rejectedEvent?.reason?.contains("minHostVersion '3.0.0' is greater than maxHostVersion '2.0.0'") == true)
    }

    @Test
    fun `test pre-flight validation latency guardrail`() {
        val manifest = PluginManifest(
            id = "perf-plugin",
            name = "Perf Test Plugin",
            version = "1.2.3",
            minHostVersion = "1.0.0",
            maxHostVersion = "2.0.0"
        )

        // Warm up JIT and class loading
        repeat(10) {
            PluginManifestValidator.validate(manifest, "1.5.0")
        }

        val elapsedNanos = measureNanoTime {
            PluginManifestValidator.validate(manifest, "1.5.0")
        }

        val elapsedMillis = elapsedNanos / 1_000_000.0
        assertTrue("Pre-flight validation took $elapsedMillis ms, which exceeds the 2ms limit", elapsedMillis < 2.0)
    }
}
