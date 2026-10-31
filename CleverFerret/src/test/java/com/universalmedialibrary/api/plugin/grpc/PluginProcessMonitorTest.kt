package com.universalmedialibrary.api.plugin.grpc

import com.universalmedialibrary.api.plugin.HealthStatus
import com.universalmedialibrary.api.plugin.PluginHealth
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import java.util.concurrent.atomic.AtomicBoolean

class PluginProcessMonitorTest {

    private lateinit var processMonitor: PluginProcessMonitor
    private val healthUpdates = mutableListOf<Pair<String, PluginHealth>>()
    private val restartTriggered = AtomicBoolean(false)

    @Before
    fun setUp() {
        healthUpdates.clear()
        restartTriggered.set(false)

        processMonitor = PluginProcessMonitor(
            onHealthChanged = { pluginId, health ->
                healthUpdates.add(pluginId to health)
            },
            onRestartRequested = { pluginId ->
                restartTriggered.set(true)
                true
            }
        )
    }

    @Test
    fun `onProcessDied updates health status to UNHEALTHY and triggers restart`() = runBlocking {
        val pluginId = "test_remote_plugin"
        processMonitor.onProcessDied(pluginId)

        val currentHealth = processMonitor.getHealthStatus(pluginId)
        assertEquals(HealthStatus.UNHEALTHY, currentHealth.status)
        assertTrue(currentHealth.message?.contains("crashed or disconnected") == true)

        // Wait brief time for auto-restart coroutine delay
        kotlinx.coroutines.delay(RESTART_DELAY_MS)
        assertTrue("Expected auto-restart callback to be triggered", restartTriggered.get())
    }

    companion object {
        private const val RESTART_DELAY_MS = 1200L
    }
}
