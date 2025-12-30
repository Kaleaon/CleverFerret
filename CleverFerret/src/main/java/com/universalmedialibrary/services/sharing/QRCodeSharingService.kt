package com.universalmedialibrary.services.sharing

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Color
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.LifecycleOwner
import com.google.gson.Gson
import com.google.zxing.BarcodeFormat
import com.google.zxing.WriterException
import com.google.zxing.qrcode.QRCodeWriter
import com.universalmedialibrary.services.media.MediaLibraryService
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.io.BufferedReader
import java.io.InputStreamReader
import java.io.OutputStreamWriter
import java.net.ServerSocket
import java.net.Socket
import java.net.URLEncoder
import java.util.*
import javax.inject.Inject
import javax.inject.Singleton

/**
 * QR Code Sharing Service for CleverFerret
 * 
 * Provides comprehensive QR code based sharing capabilities:
 * - QR code generation for playlists
 * - Local HTTP server for media serving
 * - Cross-device synchronization
 * - Android device compatibility
 * - WiFi Direct support
 */
@Singleton
class QRCodeSharingService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaLibraryService: MediaLibraryService
) : DefaultLifecycleObserver {
    
    private val gson = Gson()
    private var httpServer: HttpServer? = null
    private var currentShareId: String? = null
    
    private val _isSharing = MutableStateFlow(false)
    val isSharing: Flow<Boolean> = _isSharing.asStateFlow()
    
    private val _shareUrl = MutableStateFlow<String?>(null)
    val shareUrl: Flow<String?> = _shareUrl.asStateFlow()
    
    private val _qrCode = MutableStateFlow<Bitmap?>(null)
    val qrCode: Flow<Bitmap?> = _qrCode.asStateFlow()
    
    private val _connectedDevices = MutableStateFlow<List<ConnectedDevice>>(emptyList())
    val connectedDevices: Flow<List<ConnectedDevice>> = _connectedDevices.asStateFlow()

    companion object {
        private const val SERVER_PORT = 8080
        private const val QR_SIZE = 512
    }

    /**
     * Start sharing a playlist
     */
    suspend fun startSharing(
        playlist: MediaPlaylist,
        shareName: String = playlist.name
    ): ShareResult = withContext(Dispatchers.IO) {
        try {
            // Generate unique share ID
            val shareId = generateShareId()
            currentShareId = shareId
            
            // Start HTTP server
            val server = HttpServer(SERVER_PORT, shareId, playlist)
            if (!server.start()) {
                return@withContext ShareResult(false, "Failed to start server")
            }
            httpServer = server
            
            // Get local IP address
            val localIp = getLocalIpAddress()
            val encodedName = URLEncoder.encode(shareName, "UTF-8")
            val shareUrl = "http://$localIp:$SERVER_PORT/share/$shareId?name=$encodedName"
            
            _shareUrl.value = shareUrl
            _isSharing.value = true
            
            // Generate QR code
            val qrBitmap = generateQRCode(shareUrl)
            _qrCode.value = qrBitmap
            
            // Register share with sharing service
            registerShare(shareId, playlist, shareUrl)
            
            ShareResult(true, shareUrl, qrBitmap)
        } catch (e: Exception) {
            e.printStackTrace()
            ShareResult(false, e.message ?: "Unknown error")
        }
    }

    /**
     * Start sharing individual media item
     */
    suspend fun shareMediaItem(
        mediaItem: MediaItem
    ): ShareResult = withContext(Dispatchers.IO) {
        try {
            val shareId = generateShareId()
            currentShareId = shareId
            
            // Create temporary playlist with single item
            val tempPlaylist = MediaPlaylist(
                id = shareId,
                name = "Shared: ${mediaItem.title}",
                items = listOf(mediaItem),
                createdAt = System.currentTimeMillis()
            )
            
            val server = HttpServer(SERVER_PORT, shareId, tempPlaylist)
            if (!server.start()) {
                return@withContext ShareResult(false, "Failed to start server")
            }
            httpServer = server
            
            val localIp = getLocalIpAddress()
            val shareUrl = "http://$localIp:$SERVER_PORT/share/$shareId"
            
            _shareUrl.value = shareUrl
            _isSharing.value = true
            
            val qrBitmap = generateQRCode(shareUrl)
            _qrCode.value = qrBitmap
            
            registerShare(shareId, tempPlaylist, shareUrl)
            
            ShareResult(true, shareUrl, qrBitmap)
        } catch (e: Exception) {
            e.printStackTrace()
            ShareResult(false, e.message ?: "Unknown error")
        }
    }

    /**
     * Share currently playing media
     */
    suspend fun shareCurrentlyPlaying(): ShareResult {
        val streamItem = mediaLibraryService.getCurrentlyPlaying()
        return if (streamItem != null) {
            // Convert StreamMediaItem to local MediaItem
            val localItem = MediaItem(
                id = streamItem.id,
                title = streamItem.title,
                artist = streamItem.artist,
                album = streamItem.album,
                duration = streamItem.duration,
                mimeType = streamItem.mimeType,
                url = streamItem.url,
                thumbnailUrl = streamItem.thumbnailUrl
            )
            shareMediaItem(localItem)
        } else {
            ShareResult(false, "No media currently playing")
        }
    }

    /**
     * Stop sharing
     */
    fun stopSharing() {
        httpServer?.stop()
        httpServer = null
        currentShareId = null
        
        _isSharing.value = false
        _shareUrl.value = null
        _qrCode.value = null
        _connectedDevices.value = emptyList()
    }

    /**
     * Generate QR code for any URL
     */
    fun generateQRCode(text: String, size: Int = QR_SIZE): Bitmap {
        val writer = QRCodeWriter()
        try {
            val bitMatrix = writer.encode(text, BarcodeFormat.QR_CODE, size, size)
            val bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.RGB_565)
            
            for (x in 0 until size) {
                for (y in 0 until size) {
                    bitmap.setPixel(x, y, if (bitMatrix[x, y]) Color.BLACK else Color.WHITE)
                }
            }
            
            return bitmap
        } catch (e: WriterException) {
            throw RuntimeException("Failed to generate QR code", e)
        }
    }

    /**
     * Receive shared content from QR code
     */
    suspend fun receiveFromQRCode(url: String): ReceiveResult = withContext(Dispatchers.IO) {
        try {
            // Parse share URL
            val shareId = extractShareId(url)
            if (shareId == null) {
                return@withContext ReceiveResult(false, "Invalid share URL")
            }
            
            // Download shared content
            val playlist = downloadSharedContent(url)
            if (playlist == null) {
                return@withContext ReceiveResult(false, "Failed to download shared content")
            }
            
            // Import to local library
            val importedItems = mutableListOf<MediaItem>()
            playlist.items.forEach { item ->
                if (importMediaItem(item)) {
                    importedItems.add(item)
                }
            }
            
            ReceiveResult(
                success = true,
                playlist = playlist,
                importedCount = importedItems.size
            )
        } catch (e: Exception) {
            e.printStackTrace()
            ReceiveResult(false, e.message ?: "Unknown error")
        }
    }

    /**
     * Get sharing statistics
     */
    fun getSharingStatistics(): SharingStatistics {
        return SharingStatistics(
            isCurrentlySharing = _isSharing.value,
            currentShareUrl = _shareUrl.value,
            connectedDeviceCount = _connectedDevices.value.size,
            shareId = currentShareId
        )
    }

    private fun generateShareId(): String {
        return UUID.randomUUID().toString().substring(0, 8)
    }

    private fun getLocalIpAddress(): String {
        return try {
            val interfaces = java.net.NetworkInterface.getNetworkInterfaces()
            for (intf in interfaces) {
                if (intf.isUp && !intf.isLoopback) {
                    val addresses = intf.inetAddresses
                    for (addr in addresses) {
                        if (!addr.isLoopbackAddress && addr.isSiteLocalAddress) {
                            return addr.hostAddress
                        }
                    }
                }
            }
            "127.0.0.1"
        } catch (e: Exception) {
            "127.0.0.1"
        }
    }

    private fun registerShare(shareId: String, playlist: MediaPlaylist, url: String) {
        // Register with external sharing service if needed
        // This could sync with cloud services or update app statistics
    }

    private suspend fun downloadSharedContent(url: String): MediaPlaylist? = withContext(Dispatchers.IO) {
        try {
            val connection = java.net.URL(url).openConnection() as java.net.HttpURLConnection
            connection.requestMethod = "GET"
            connection.connectTimeout = 10000
            connection.readTimeout = 30000
            
            if (connection.responseCode == 200) {
                val response = connection.inputStream.bufferedReader().use { it.readText() }
                gson.fromJson(response, MediaPlaylist::class.java)
            } else {
                null
            }
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }

    private suspend fun importMediaItem(item: MediaItem): Boolean = withContext(Dispatchers.IO) {
        try {
            // Convert local MediaItem to StreamMediaItem for the library service
            val streamItem = com.universalmedialibrary.services.media.StreamMediaItem(
                id = item.id,
                title = item.title,
                artist = item.artist,
                album = item.album,
                duration = item.duration,
                mimeType = item.mimeType,
                url = item.url,
                thumbnailUrl = item.thumbnailUrl
            )
            mediaLibraryService.addMediaItem(streamItem)
        } catch (e: Exception) {
            e.printStackTrace()
            false
        }
    }

    private fun extractShareId(url: String): String? {
        return try {
            val pattern = "/share/([a-f0-9-]+)".toRegex()
            pattern.find(url)?.groupValues?.get(1)
        } catch (e: Exception) {
            null
        }
    }

    override fun onDestroy(owner: LifecycleOwner) {
        stopSharing()
    }

    /**
     * HTTP Server for serving shared content
     */
    inner class HttpServer(
        private val port: Int,
        private val shareId: String,
        private val playlist: MediaPlaylist
    ) {
        private var serverSocket: ServerSocket? = null
        private var isRunning = false

        fun start(): Boolean {
            return try {
                serverSocket = ServerSocket(port)
                isRunning = true
                Thread { runServer() }.start()
                true
            } catch (e: Exception) {
                e.printStackTrace()
                false
            }
        }

        fun stop() {
            isRunning = false
            serverSocket?.close()
        }

        private fun runServer() {
            while (isRunning) {
                try {
                    val client = serverSocket?.accept() ?: break
                    Thread { handleClient(client) }.start()
                } catch (e: Exception) {
                    if (isRunning) e.printStackTrace()
                }
            }
        }

        private fun handleClient(client: Socket) {
            try {
                val reader = BufferedReader(InputStreamReader(client.inputStream))
                val writer = OutputStreamWriter(client.outputStream)
                
                // Read HTTP request
                val requestLine = reader.readLine() ?: return
                val parts = requestLine.split(" ")
                if (parts.size < 2) return
                
                val path = parts[1]
                
                when {
                    path.startsWith("/share/") && path.contains(shareId) -> {
                        // Serve playlist data
                        val jsonResponse = gson.toJson(playlist)
                        
                        writer.apply {
                            write("HTTP/1.1 200 OK\r\n")
                            write("Content-Type: application/json\r\n")
                            write("Content-Length: ${jsonResponse.length}\r\n")
                            write("Access-Control-Allow-Origin: *\r\n")
                            write("\r\n")
                            write(jsonResponse)
                            flush()
                        }
                        
                        // Track connected device
                        val device = ConnectedDevice(
                            id = client.inetAddress.hostAddress,
                            address = client.inetAddress.hostAddress,
                            connectedAt = System.currentTimeMillis(),
                            userAgent = "HTTP Client"
                        )
                        updateConnectedDevices(device)
                    }
                    else -> {
                        // 404 Not Found
                        writer.apply {
                            write("HTTP/1.1 404 Not Found\r\n")
                            write("\r\n")
                            flush()
                        }
                    }
                }
                
            } catch (e: Exception) {
                e.printStackTrace()
            } finally {
                client.close()
            }
        }

        private fun updateConnectedDevices(device: ConnectedDevice) {
            val current = _connectedDevices.value.toMutableList()
            val existingIndex = current.indexOfFirst { it.id == device.id }
            
            if (existingIndex >= 0) {
                current[existingIndex] = device
            } else {
                current.add(device)
            }
            
            _connectedDevices.value = current.take(10) // Keep last 10 connections
        }
    }
}

/**
 * Data classes for sharing operations
 */
data class ShareResult(
    val success: Boolean,
    val message: String? = null,
    val qrCode: Bitmap? = null,
    val shareUrl: String? = null
)

data class ReceiveResult(
    val success: Boolean,
    val message: String? = null,
    val playlist: MediaPlaylist? = null,
    val importedCount: Int = 0
)

data class ConnectedDevice(
    val id: String,
    val address: String,
    val connectedAt: Long,
    val userAgent: String
)

data class SharingStatistics(
    val isCurrentlySharing: Boolean,
    val currentShareUrl: String?,
    val connectedDeviceCount: Int,
    val shareId: String?
)

data class MediaPlaylist(
    val id: String,
    val name: String,
    val items: List<MediaItem>,
    val createdAt: Long,
    val description: String? = null
)

data class MediaItem(
    val id: String,
    val title: String,
    val artist: String? = null,
    val album: String? = null,
    val duration: Long? = null,
    val mimeType: String,
    val url: String,
    val thumbnailUrl: String? = null
)

enum class SharingMode {
    IDLE,
    SHARING,
    RECEIVING
}