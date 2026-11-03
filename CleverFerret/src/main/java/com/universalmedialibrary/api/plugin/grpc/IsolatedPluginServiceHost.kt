package com.universalmedialibrary.api.plugin.grpc

import android.app.Service
import android.content.Intent
import android.os.IBinder
import android.util.Log
import com.universalmedialibrary.api.plugin.Plugin
import java.util.concurrent.ConcurrentHashMap

/**
 * Android Bound Service bridge hosting out-of-process gRPC / IPC plugin instances.
 * Configured in AndroidManifest.xml to execute in isolated process boundaries.
 */
class IsolatedPluginServiceHost : Service() {

    companion object {
        private const val TAG = "IsolatedPluginServiceHost"
        val activePlugins = ConcurrentHashMap<String, Plugin>()

        fun registerHostedPlugin(plugin: Plugin) {
            activePlugins[plugin.id] = plugin
            Log.i(TAG, "Registered hosted plugin ${plugin.id}")
        }

        fun unregisterHostedPlugin(pluginId: String) {
            activePlugins.remove(pluginId)
            Log.i(TAG, "Unregistered hosted plugin $pluginId")
        }
    }

    private val binder = PluginIPCBridgeBinder(activePlugins)

    override fun onCreate() {
        super.onCreate()
        Log.i(TAG, "IsolatedPluginServiceHost created in process pid=${android.os.Process.myPid()}")
    }

    override fun onBind(intent: Intent?): IBinder {
        Log.i(TAG, "Binding client to IsolatedPluginServiceHost (intent action=${intent?.action})")
        return binder
    }

    override fun onUnbind(intent: Intent?): Boolean {
        Log.i(TAG, "Unbinding client from IsolatedPluginServiceHost")
        return super.onUnbind(intent)
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.i(TAG, "IsolatedPluginServiceHost destroyed")
    }
}
