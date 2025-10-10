package com.universalmedialibrary.services.network

import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.os.Build
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.channels.awaitClose
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.callbackFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Network Manager
 *
 * Monitors network connectivity and provides utilities for:
 * - WiFi connectivity checking
 * - Network type detection (WiFi, Cellular, Ethernet)
 * - Network state monitoring
 * - Bandwidth estimation
 */
@Singleton
class NetworkManager @Inject constructor(
    @ApplicationContext private val context: Context
) {

    private val connectivityManager = 
        context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager

    /**
     * Check if device is connected to WiFi
     */
    fun isConnectedToWiFi(): Boolean {
        val network = connectivityManager.activeNetwork ?: return false
        val capabilities = connectivityManager.getNetworkCapabilities(network) ?: return false
        
        return capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) ||
               capabilities.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET)
    }

    /**
     * Check if device is connected to cellular network
     */
    fun isConnectedToCellular(): Boolean {
        val network = connectivityManager.activeNetwork ?: return false
        val capabilities = connectivityManager.getNetworkCapabilities(network) ?: return false
        
        return capabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR)
    }

    /**
     * Check if device has any network connection
     */
    fun isConnected(): Boolean {
        val network = connectivityManager.activeNetwork ?: return false
        val capabilities = connectivityManager.getNetworkCapabilities(network) ?: return false
        
        return capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET) &&
               capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED)
    }

    /**
     * Check if device is on a metered connection (cellular or metered WiFi)
     */
    fun isMeteredConnection(): Boolean {
        return connectivityManager.isActiveNetworkMetered
    }

    /**
     * Get current network type
     */
    fun getNetworkType(): NetworkType {
        val network = connectivityManager.activeNetwork ?: return NetworkType.NONE
        val capabilities = connectivityManager.getNetworkCapabilities(network) ?: return NetworkType.NONE
        
        return when {
            capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> NetworkType.WIFI
            capabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) -> NetworkType.CELLULAR
            capabilities.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET) -> NetworkType.ETHERNET
            capabilities.hasTransport(NetworkCapabilities.TRANSPORT_VPN) -> NetworkType.VPN
            else -> NetworkType.OTHER
        }
    }

    /**
     * Get network connection quality
     */
    fun getConnectionQuality(): ConnectionQuality {
        val network = connectivityManager.activeNetwork ?: return ConnectionQuality.NONE
        val capabilities = connectivityManager.getNetworkCapabilities(network) ?: return ConnectionQuality.NONE
        
        val downstreamBandwidth = capabilities.linkDownstreamBandwidthKbps
        
        return when {
            downstreamBandwidth <= 0 -> ConnectionQuality.UNKNOWN
            downstreamBandwidth < 1000 -> ConnectionQuality.POOR
            downstreamBandwidth < 3000 -> ConnectionQuality.MODERATE
            downstreamBandwidth < 10000 -> ConnectionQuality.GOOD
            else -> ConnectionQuality.EXCELLENT
        }
    }

    /**
     * Check if it's safe to download (based on WiFi requirement)
     */
    fun isSafeToDownload(wifiOnly: Boolean): Boolean {
        return if (wifiOnly) {
            isConnectedToWiFi()
        } else {
            isConnected()
        }
    }

    /**
     * Check if it's safe to stream (has sufficient bandwidth)
     */
    fun isSafeToStream(requireHighQuality: Boolean = false): Boolean {
        if (!isConnected()) return false
        
        val quality = getConnectionQuality()
        return if (requireHighQuality) {
            quality == ConnectionQuality.GOOD || quality == ConnectionQuality.EXCELLENT
        } else {
            quality != ConnectionQuality.NONE && quality != ConnectionQuality.POOR
        }
    }

    /**
     * Get estimated download speed in Mbps
     */
    fun getEstimatedDownloadSpeedMbps(): Float {
        val network = connectivityManager.activeNetwork ?: return 0f
        val capabilities = connectivityManager.getNetworkCapabilities(network) ?: return 0f
        
        val downstreamKbps = capabilities.linkDownstreamBandwidthKbps
        return downstreamKbps / 1000f
    }

    /**
     * Monitor network state changes
     */
    fun observeNetworkState(): Flow<NetworkState> = callbackFlow {
        val callback = object : ConnectivityManager.NetworkCallback() {
            override fun onAvailable(network: Network) {
                trySend(NetworkState.Available(getNetworkType()))
            }

            override fun onLost(network: Network) {
                trySend(NetworkState.Lost)
            }

            override fun onCapabilitiesChanged(
                network: Network,
                networkCapabilities: NetworkCapabilities
            ) {
                val isWifi = networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)
                val isCellular = networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR)
                
                val type = when {
                    isWifi -> NetworkType.WIFI
                    isCellular -> NetworkType.CELLULAR
                    else -> NetworkType.OTHER
                }
                
                trySend(NetworkState.Changed(type, networkCapabilities))
            }
        }

        val request = NetworkRequest.Builder()
            .addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
            .build()

        connectivityManager.registerNetworkCallback(request, callback)

        // Send initial state
        if (isConnected()) {
            trySend(NetworkState.Available(getNetworkType()))
        } else {
            trySend(NetworkState.Lost)
        }

        awaitClose {
            connectivityManager.unregisterNetworkCallback(callback)
        }
    }

    /**
     * Check if download should proceed based on settings
     */
    fun shouldAllowDownload(wifiOnly: Boolean, checkMetered: Boolean = true): DownloadDecision {
        if (!isConnected()) {
            return DownloadDecision.NoConnection
        }

        if (wifiOnly && !isConnectedToWiFi()) {
            return DownloadDecision.WifiRequired
        }

        if (checkMetered && isMeteredConnection() && !isConnectedToWiFi()) {
            return DownloadDecision.MeteredConnection
        }

        return DownloadDecision.Allowed
    }
}

/**
 * Network type enumeration
 */
enum class NetworkType {
    WIFI,
    CELLULAR,
    ETHERNET,
    VPN,
    OTHER,
    NONE
}

/**
 * Connection quality levels
 */
enum class ConnectionQuality {
    EXCELLENT,  // > 10 Mbps
    GOOD,       // 3-10 Mbps
    MODERATE,   // 1-3 Mbps
    POOR,       // < 1 Mbps
    UNKNOWN,
    NONE
}

/**
 * Network state for monitoring
 */
sealed class NetworkState {
    data class Available(val type: NetworkType) : NetworkState()
    data class Changed(val type: NetworkType, val capabilities: NetworkCapabilities) : NetworkState()
    object Lost : NetworkState()
}

/**
 * Download decision based on network state
 */
sealed class DownloadDecision {
    object Allowed : DownloadDecision()
    object NoConnection : DownloadDecision()
    object WifiRequired : DownloadDecision()
    object MeteredConnection : DownloadDecision()
}
