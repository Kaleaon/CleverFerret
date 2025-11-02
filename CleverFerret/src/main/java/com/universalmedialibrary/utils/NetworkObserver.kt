package com.universalmedialibrary.utils

import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.channels.awaitClose
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.callbackFlow
import kotlinx.coroutines.flow.distinctUntilChanged
import kotlinx.coroutines.launch
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Network connectivity observer that monitors network state changes.
 * 
 * Provides real-time network status updates using Android's ConnectivityManager.
 * Useful for pausing/resuming network operations and showing network status in UI.
 * 
 * Inspired by Myne's NetworkObserver with enhancements for CleverFerret's needs.
 * 
 * @property context Application context for accessing system services
 */
@Singleton
class NetworkObserver @Inject constructor(
    @ApplicationContext private val context: Context
) {
    /**
     * Network connection status states.
     */
    enum class Status {
        /** Network is available and connected */
        Available,
        /** Network connection is being lost */
        Losing,
        /** Network connection has been lost */
        Lost,
        /** Network is unavailable */
        Unavailable
    }

    /**
     * Network connection type for more detailed status.
     */
    enum class ConnectionType {
        /** Connected via WiFi */
        WiFi,
        /** Connected via cellular data */
        Cellular,
        /** Connected via ethernet */
        Ethernet,
        /** No connection */
        None
    }

    private val connectivityManager =
        context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager

    /**
     * Observe network status changes as a Flow.
     * 
     * Returns a cold Flow that emits network status updates. The Flow is distinct,
     * meaning consecutive duplicate statuses are filtered out.
     * 
     * @return Flow of network Status updates
     */
    fun observe(): Flow<Status> {
        return callbackFlow {
            val callback = object : ConnectivityManager.NetworkCallback() {
                override fun onAvailable(network: Network) {
                    super.onAvailable(network)
                    launch { send(Status.Available) }
                }

                override fun onLosing(network: Network, maxMsToLive: Int) {
                    super.onLosing(network, maxMsToLive)
                    launch { send(Status.Losing) }
                }

                override fun onLost(network: Network) {
                    super.onLost(network)
                    launch { send(Status.Lost) }
                }

                override fun onUnavailable() {
                    super.onUnavailable()
                    launch { send(Status.Unavailable) }
                }
            }

            connectivityManager.registerDefaultNetworkCallback(callback)
            
            awaitClose {
                connectivityManager.unregisterNetworkCallback(callback)
            }
        }.distinctUntilChanged()
    }

    /**
     * Check if device currently has network connectivity.
     * 
     * @return true if network is available, false otherwise
     */
    fun isConnected(): Boolean {
        val network = connectivityManager.activeNetwork ?: return false
        val capabilities = connectivityManager.getNetworkCapabilities(network) ?: return false
        
        return capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET) &&
                capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED)
    }

    /**
     * Get the current connection type.
     * 
     * @return ConnectionType indicating how device is connected
     */
    fun getConnectionType(): ConnectionType {
        val network = connectivityManager.activeNetwork ?: return ConnectionType.None
        val capabilities = connectivityManager.getNetworkCapabilities(network)
            ?: return ConnectionType.None

        return when {
            capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> ConnectionType.WiFi
            capabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) -> ConnectionType.Cellular
            capabilities.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET) -> ConnectionType.Ethernet
            else -> ConnectionType.None
        }
    }

    /**
     * Check if device is connected via WiFi.
     * Useful for determining whether to sync large files.
     * 
     * @return true if connected via WiFi
     */
    fun isWiFiConnected(): Boolean {
        return getConnectionType() == ConnectionType.WiFi
    }

    /**
     * Check if device is connected via cellular data.
     * Useful for warning users about data usage.
     * 
     * @return true if connected via cellular
     */
    fun isCellularConnected(): Boolean {
        return getConnectionType() == ConnectionType.Cellular
    }

    /**
     * Observe network type changes (WiFi, Cellular, etc.).
     * 
     * @return Flow of ConnectionType updates
     */
    fun observeConnectionType(): Flow<ConnectionType> {
        return callbackFlow {
            val callback = object : ConnectivityManager.NetworkCallback() {
                override fun onCapabilitiesChanged(
                    network: Network,
                    networkCapabilities: NetworkCapabilities
                ) {
                    super.onCapabilitiesChanged(network, networkCapabilities)
                    val type = when {
                        networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> 
                            ConnectionType.WiFi
                        networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) -> 
                            ConnectionType.Cellular
                        networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET) -> 
                            ConnectionType.Ethernet
                        else -> ConnectionType.None
                    }
                    launch { send(type) }
                }

                override fun onLost(network: Network) {
                    super.onLost(network)
                    launch { send(ConnectionType.None) }
                }
            }

            val request = NetworkRequest.Builder()
                .addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                .build()

            connectivityManager.registerNetworkCallback(request, callback)
            
            // Send initial state
            launch { send(getConnectionType()) }

            awaitClose {
                connectivityManager.unregisterNetworkCallback(callback)
            }
        }.distinctUntilChanged()
    }
}
