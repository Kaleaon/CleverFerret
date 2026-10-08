package com.universalmedialibrary.api.plugin.grpc

import android.content.ComponentName
import android.content.ServiceConnection
import android.os.IBinder
import android.util.Log
import com.universalmedialibrary.api.plugin.HealthStatus
import com.universalmedialibrary.api.plugin.PluginHealth
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.atomic.AtomicInteger

/**
 * Monitors remote plugin process health, detects IPC disconnections / process crashes,
 * updates [PluginHealth] status, and coordinates automatic process restart attempts.
 */
class PluginProcessMonitor(
    private val onHealthChanged: (pluginId: String, health: PluginHealth) -> Unit,
    private val onRestartRequested: suspend (pluginId: String) -> Boolean = { true }
) : IBinder.DeathRecipient, ServiceConnection {

    companion object {
        private const val TAG = "PluginProcessMonitor"
        const val MAX_RESTART_RETRIES = 3
        const val INITIAL_RESTART_DELAY_MS = 1000L
    }

    private val scope = CoroutineScope(Dispatchers.Default + SupervisorJob())
    private val monitoredBinders = ConcurrentHashMap<String, IBinder>()
    private val healthStatusMap = ConcurrentHashMap<String, PluginHealth>()
    private val restartAttempts = ConcurrentHashMap<String, AtomicInteger>()

    fun monitorBinder(pluginId: String, binder: IBinder) {
        try {
            binder.linkToDeath({
                onProcessDied(pluginId)
            }, 0)
            monitoredBinders[pluginId] = binder
            val healthyState = PluginHealth(
                status = HealthStatus.HEALTHY,
                message = "Remote process active and responsive",
                lastCheck = System.currentTimeMillis()
            )
            healthStatusMap[pluginId] = healthyState
            onHealthChanged(pluginId, healthyState)
            Log.i(TAG, "Successfully linked death recipient for plugin $pluginId")
        } catch (e: Exception) {
            Log.e(TAG, "Failed to link death recipient for plugin $pluginId", e)
            val unhealthyState = PluginHealth(
                status = HealthStatus.UNHEALTHY,
                message = "Failed to establish IPC death recipient: ${e.message}",
                lastCheck = System.currentTimeMillis()
            )
            healthStatusMap[pluginId] = unhealthyState
            onHealthChanged(pluginId, unhealthyState)
        }
    }

    fun unmonitorBinder(pluginId: String) {
        monitoredBinders.remove(pluginId)
        healthStatusMap.remove(pluginId)
        restartAttempts.remove(pluginId)
        Log.i(TAG, "Unmonitored process binder for plugin $pluginId")
    }

    override fun binderDied() {
        Log.w(TAG, "Generic binderDied callback triggered")
        monitoredBinders.forEach { (pluginId, _) ->
            onProcessDied(pluginId)
        }
    }

    fun onProcessDied(pluginId: String) {
        Log.e(TAG, "Remote process death detected for plugin: $pluginId")
        val deadState = PluginHealth(
            status = HealthStatus.UNHEALTHY,
            message = "Remote plugin process crashed or disconnected unexpectedly",
            lastCheck = System.currentTimeMillis(),
            details = mapOf("crashedAt" to System.currentTimeMillis().toString())
        )
        healthStatusMap[pluginId] = deadState
        onHealthChanged(pluginId, deadState)

        // Attempt automatic process restart
        scheduleAutoRestart(pluginId)
    }

    private fun scheduleAutoRestart(pluginId: String) {
        val attempts = restartAttempts.getOrPut(pluginId) { AtomicInteger(0) }
        val currentAttempt = attempts.incrementAndGet()

        if (currentAttempt > MAX_RESTART_RETRIES) {
            Log.w(TAG, "Exceeded maximum restart retries ($MAX_RESTART_RETRIES) for plugin $pluginId")
            val degradedState = PluginHealth(
                status = HealthStatus.DEGRADED,
                message = "Auto-restart failed after $MAX_RESTART_RETRIES attempts",
                lastCheck = System.currentTimeMillis()
            )
            healthStatusMap[pluginId] = degradedState
            onHealthChanged(pluginId, degradedState)
            return
        }

        val backoffDelay = INITIAL_RESTART_DELAY_MS * currentAttempt
        Log.i(TAG, "Scheduling auto-restart attempt $currentAttempt for plugin $pluginId in ${backoffDelay}ms")

        scope.launch {
            delay(backoffDelay)
            try {
                val success = onRestartRequested(pluginId)
                if (success) {
                    Log.i(TAG, "Successfully restarted remote process for plugin $pluginId")
                    attempts.set(0)
                } else {
                    Log.w(TAG, "Restart attempt $currentAttempt returned false for plugin $pluginId")
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error during auto-restart attempt $currentAttempt for plugin $pluginId", e)
            }
        }
    }

    fun getHealthStatus(pluginId: String): PluginHealth {
        return healthStatusMap[pluginId] ?: PluginHealth(
            status = HealthStatus.UNKNOWN,
            message = "Plugin process state unmonitored"
        )
    }

    override fun onServiceConnected(name: ComponentName?, service: IBinder?) {
        val pluginId = name?.shortClassName ?: "unknown"
        if (service != null) {
            monitorBinder(pluginId, service)
        }
    }

    override fun onServiceDisconnected(name: ComponentName?) {
        val pluginId = name?.shortClassName ?: "unknown"
        onProcessDied(pluginId)
    }

    override fun onBindingDied(name: ComponentName?) {
        val pluginId = name?.shortClassName ?: "unknown"
        onProcessDied(pluginId)
    }
}
