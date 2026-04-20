package com.universalmedialibrary.core.network

import android.content.Context
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringSetPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

private val Context.trustedDevicesStore by preferencesDataStore(name = "trusted_audio_devices")

@Singleton
class LanDiscoveryService @Inject constructor(
    private val trustedDeviceStore: DataStoreTrustedDeviceStore
) {
    private val _discoveredDevices = MutableStateFlow<List<DiscoveredLanDevice>>(emptyList())
    val discoveredDevices: StateFlow<List<DiscoveredLanDevice>> = _discoveredDevices.asStateFlow()

    /**
     * mDNS/zeroconf discovery hook. In production this is fed by platform NSD/JmDNS results.
     */
    fun updateDiscoveredDevices(devices: List<DiscoveredLanDevice>) {
        _discoveredDevices.value = devices.distinctBy { it.deviceId }
    }

    suspend fun trustDevice(deviceId: String) {
        trustedDeviceStore.addTrustedDevice(deviceId)
    }

    suspend fun untrustDevice(deviceId: String) {
        trustedDeviceStore.removeTrustedDevice(deviceId)
    }

    fun trustedDeviceIds(): Flow<Set<String>> = trustedDeviceStore.trustedDeviceIds()

    fun discoveredTrustedDevices(): Flow<List<DiscoveredLanDevice>> =
        trustedDeviceIds().map { trusted ->
            _discoveredDevices.value.filter { it.deviceId in trusted }
        }
}

data class DiscoveredLanDevice(
    val deviceId: String,
    val deviceName: String,
    val host: String,
    val port: Int,
    val serviceType: LanServiceType,
    val latencyMs: Int = 0,
    val isReachable: Boolean = true
)

enum class LanServiceType {
    SNAPCAST_SERVER,
    SNAPCAST_CLIENT
}

interface TrustedDeviceStore {
    fun trustedDeviceIds(): Flow<Set<String>>
    suspend fun addTrustedDevice(deviceId: String)
    suspend fun removeTrustedDevice(deviceId: String)
}

@Singleton
class DataStoreTrustedDeviceStore @Inject constructor(
    private val context: Context
) : TrustedDeviceStore {

    private val trustedKey: Preferences.Key<Set<String>> = stringSetPreferencesKey("trusted_device_ids")

    override fun trustedDeviceIds(): Flow<Set<String>> =
        context.trustedDevicesStore.data.map { prefs -> prefs[trustedKey] ?: emptySet() }

    override suspend fun addTrustedDevice(deviceId: String) {
        context.trustedDevicesStore.edit { prefs ->
            val updated = (prefs[trustedKey] ?: emptySet()) + deviceId
            prefs[trustedKey] = updated
        }
    }

    override suspend fun removeTrustedDevice(deviceId: String) {
        context.trustedDevicesStore.edit { prefs ->
            val updated = (prefs[trustedKey] ?: emptySet()) - deviceId
            prefs[trustedKey] = updated
        }
    }
}
