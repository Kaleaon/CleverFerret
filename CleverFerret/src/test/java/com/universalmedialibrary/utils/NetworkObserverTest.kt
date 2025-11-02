package com.universalmedialibrary.utils

import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import org.junit.Before
import org.junit.Test
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.MockitoAnnotations

/**
 * Unit tests for NetworkObserver.
 */
class NetworkObserverTest {

    @Mock
    private lateinit var context: Context

    @Mock
    private lateinit var connectivityManager: ConnectivityManager

    @Mock
    private lateinit var network: Network

    @Mock
    private lateinit var networkCapabilities: NetworkCapabilities

    private lateinit var networkObserver: NetworkObserver

    @Before
    fun setup() {
        MockitoAnnotations.openMocks(this)
        `when`(context.getSystemService(Context.CONNECTIVITY_SERVICE))
            .thenReturn(connectivityManager)
        networkObserver = NetworkObserver(context)
    }

    @Test
    fun `isConnected returns true when network is available with internet capability`() {
        `when`(connectivityManager.activeNetwork).thenReturn(network)
        `when`(connectivityManager.getNetworkCapabilities(network)).thenReturn(networkCapabilities)
        `when`(networkCapabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET))
            .thenReturn(true)
        `when`(networkCapabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED))
            .thenReturn(true)

        assertTrue(networkObserver.isConnected())
    }

    @Test
    fun `isConnected returns false when network is not available`() {
        `when`(connectivityManager.activeNetwork).thenReturn(null)

        assertFalse(networkObserver.isConnected())
    }

    @Test
    fun `isConnected returns false when network capabilities are null`() {
        `when`(connectivityManager.activeNetwork).thenReturn(network)
        `when`(connectivityManager.getNetworkCapabilities(network)).thenReturn(null)

        assertFalse(networkObserver.isConnected())
    }

    @Test
    fun `getConnectionType returns WiFi when connected via WiFi`() {
        `when`(connectivityManager.activeNetwork).thenReturn(network)
        `when`(connectivityManager.getNetworkCapabilities(network)).thenReturn(networkCapabilities)
        `when`(networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI))
            .thenReturn(true)

        assertEquals(NetworkObserver.ConnectionType.WiFi, networkObserver.getConnectionType())
    }

    @Test
    fun `getConnectionType returns Cellular when connected via cellular`() {
        `when`(connectivityManager.activeNetwork).thenReturn(network)
        `when`(connectivityManager.getNetworkCapabilities(network)).thenReturn(networkCapabilities)
        `when`(networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI))
            .thenReturn(false)
        `when`(networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR))
            .thenReturn(true)

        assertEquals(NetworkObserver.ConnectionType.Cellular, networkObserver.getConnectionType())
    }

    @Test
    fun `getConnectionType returns Ethernet when connected via ethernet`() {
        `when`(connectivityManager.activeNetwork).thenReturn(network)
        `when`(connectivityManager.getNetworkCapabilities(network)).thenReturn(networkCapabilities)
        `when`(networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI))
            .thenReturn(false)
        `when`(networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR))
            .thenReturn(false)
        `when`(networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET))
            .thenReturn(true)

        assertEquals(NetworkObserver.ConnectionType.Ethernet, networkObserver.getConnectionType())
    }

    @Test
    fun `getConnectionType returns None when no network available`() {
        `when`(connectivityManager.activeNetwork).thenReturn(null)

        assertEquals(NetworkObserver.ConnectionType.None, networkObserver.getConnectionType())
    }

    @Test
    fun `isWiFiConnected returns true when connected via WiFi`() {
        `when`(connectivityManager.activeNetwork).thenReturn(network)
        `when`(connectivityManager.getNetworkCapabilities(network)).thenReturn(networkCapabilities)
        `when`(networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI))
            .thenReturn(true)

        assertTrue(networkObserver.isWiFiConnected())
    }

    @Test
    fun `isWiFiConnected returns false when not connected via WiFi`() {
        `when`(connectivityManager.activeNetwork).thenReturn(network)
        `when`(connectivityManager.getNetworkCapabilities(network)).thenReturn(networkCapabilities)
        `when`(networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI))
            .thenReturn(false)

        assertFalse(networkObserver.isWiFiConnected())
    }

    @Test
    fun `isCellularConnected returns true when connected via cellular`() {
        `when`(connectivityManager.activeNetwork).thenReturn(network)
        `when`(connectivityManager.getNetworkCapabilities(network)).thenReturn(networkCapabilities)
        `when`(networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI))
            .thenReturn(false)
        `when`(networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR))
            .thenReturn(true)

        assertTrue(networkObserver.isCellularConnected())
    }

    @Test
    fun `isCellularConnected returns false when not connected via cellular`() {
        `when`(connectivityManager.activeNetwork).thenReturn(network)
        `when`(connectivityManager.getNetworkCapabilities(network)).thenReturn(networkCapabilities)
        `when`(networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI))
            .thenReturn(true)
        `when`(networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR))
            .thenReturn(false)

        assertFalse(networkObserver.isCellularConnected())
    }
}
