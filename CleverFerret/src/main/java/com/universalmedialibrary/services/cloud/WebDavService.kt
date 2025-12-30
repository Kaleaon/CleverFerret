package com.universalmedialibrary.services.cloud

import android.content.Context
import com.github.sardine.SardineFactory
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.InputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * WebDAV Integration Service for CleverFerret
 * 
 * Provides WebDAV protocol support for various cloud storage providers:
 * - OwnCloud/NextCloud
 * - Box WebDAV
 * - Generic WebDAV servers
 * - File synchronization
 */
@Singleton
class WebDavService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    private val _isAuthenticated = MutableStateFlow(false)
    val isAuthenticated: Flow<Boolean> = _isAuthenticated.asStateFlow()
    
    private val _syncProgress = MutableStateFlow(0f)
    val syncProgress: Flow<Float> = _syncProgress.asStateFlow()
    
    private var sardine: com.github.sardine.Sardine? = null
    private var serverUrl: String? = null
    private var username: String? = null
    private var password: String? = null
    
    companion object {
        const val APP_FOLDER = "/CleverFerret"
    }

    /**
     * Initialize WebDAV service
     */
    suspend fun initialize(): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                val credentials = getStoredCredentials()
                if (credentials != null) {
                    connect(
                        credentials.url,
                        credentials.username,
                        credentials.password
                    )
                    true
                } else {
                    false
                }
            } catch (e: Exception) {
                e.printStackTrace()
                false
            }
        }
    }

    /**
     * Connect to WebDAV server
     */
    suspend fun connect(
        url: String,
        username: String,
        password: String
    ): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                sardine = SardineFactory.begin(username, password)
                
                // Test connection
                sardine?.exists(url)
                
                this@WebDavService.serverUrl = url
                this@WebDavService.username = username
                this@WebDavService.password = password
                
                storeCredentials(url, username, password)
                _isAuthenticated.value = true
                true
            } catch (e: Exception) {
                e.printStackTrace()
                false
            }
        }
    }

    /**
     * Disconnect from WebDAV server
     */
    fun disconnect() {
        sardine = null
        serverUrl = null
        username = null
        password = null
        clearStoredCredentials()
        _isAuthenticated.value = false
    }

    /**
     * Upload file to WebDAV server
     */
    suspend fun uploadFile(
        localPath: String,
        fileName: String,
        remotePath: String = APP_FOLDER
    ): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                val client = sardine ?: return@withContext false
                val file = File(localPath)
                
                // Ensure folder exists
                ensureFolderExists(remotePath)
                
                val remoteUrl = "$serverUrl$remotePath/$fileName"
                val inputStream = FileInputStream(file)
                
                client.put(remoteUrl, inputStream, file.length(), getMimeType(fileName))
                inputStream.close()
                
                true
            } catch (e: Exception) {
                e.printStackTrace()
                false
            }
        }
    }

    /**
     * Download file from WebDAV server
     */
    suspend fun downloadFile(
        remotePath: String,
        localPath: String,
        progressCallback: ((Float) -> Unit)? = null
    ): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                val client = sardine ?: return@withContext false
                val remoteUrl = "$serverUrl$remotePath"
                
                if (!client.exists(remoteUrl)) {
                    return@withContext false
                }
                
                val inputStream: InputStream = client.get(remoteUrl)
                val outputStream = FileOutputStream(localPath)
                
                val buffer = ByteArray(8192)
                var bytesRead: Int
                val fileSize = client.getFileSize(remoteUrl)
                var totalRead = 0L
                
                while (inputStream.read(buffer).also { bytesRead = it } != -1) {
                    outputStream.write(buffer, 0, bytesRead)
                    totalRead += bytesRead
                    
                    progressCallback?.invoke(
                        if (fileSize > 0) totalRead.toFloat() / fileSize.toFloat() else 0f
                    )
                }
                
                inputStream.close()
                outputStream.close()
                
                true
            } catch (e: Exception) {
                e.printStackTrace()
                false
            }
        }
    }

    /**
     * List files in folder
     */
    suspend fun listFiles(remotePath: String = APP_FOLDER): List<WebDavFile> {
        return withContext(Dispatchers.IO) {
            try {
                val client = sardine ?: return@withContext emptyList()
                val files = mutableListOf<WebDavFile>()
                
                ensureFolderExists(remotePath)
                val remoteUrl = "$serverUrl$remotePath/"
                
                val resources = client.list(remoteUrl, 1)
                resources.drop(1).forEach { resource ->
                    if (resource.path != remotePath) { // Skip parent directory
                        val fileName = resource.path.substringAfterLast("/")
                        files.add(WebDavFile(
                            name = fileName,
                            path = resource.path,
                            size = resource.contentLength,
                            isDirectory = resource.contentType == "httpd/unix-directory",
                            modifiedTime = resource.modified.time,
                            etag = resource.etag
                        ))
                    }
                }
                
                files.sortedWith(compareBy<WebDavFile> { !it.isDirectory }.thenBy { it.name.lowercase() })
            } catch (e: Exception) {
                e.printStackTrace()
                emptyList()
            }
        }
    }

    /**
     * Delete file from WebDAV server
     */
    suspend fun deleteFile(remotePath: String): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                val client = sardine ?: return@withContext false
                val remoteUrl = "$serverUrl$remotePath"
                client.delete(remoteUrl)
                true
            } catch (e: Exception) {
                e.printStackTrace()
                false
            }
        }
    }

    /**
     * Sync media with WebDAV server
     */
    suspend fun syncMedia(): SyncResult {
        return withContext(Dispatchers.IO) {
            try {
                val startTime = System.currentTimeMillis()
                _syncProgress.value = 0f
                
                val localFiles = getLocalMediaFiles()
                val webDavFiles = listFiles()
                
                var uploadedCount = 0
                var downloadedCount = 0
                var conflictCount = 0
                
                localFiles.forEachIndexed { index, localFile ->
                    _syncProgress.value = index.toFloat() / localFiles.size.toFloat()
                    
                    val webDavFile = webDavFiles.find { it.name == localFile.name && !it.isDirectory }
                    
                    when {
                        webDavFile == null -> {
                            // Upload new file
                            if (uploadFile(localFile.path, localFile.name)) {
                                uploadedCount++
                            }
                        }
                        webDavFile.modifiedTime < localFile.lastModified -> {
                            // Local file is newer, upload
                            if (uploadFile(localFile.path, localFile.name)) {
                                uploadedCount++
                            }
                        }
                        webDavFile.modifiedTime > localFile.lastModified -> {
                            // WebDAV file is newer, download
                            val downloadPath = getDownloadPath(localFile.name)
                            val remotePath = webDavFile.path
                            if (downloadFile(remotePath, downloadPath)) {
                                downloadedCount++
                            } else {
                                conflictCount++
                            }
                        }
                    }
                }
                
                _syncProgress.value = 1f
                
                SyncResult(
                    success = true,
                    uploadedCount = uploadedCount,
                    downloadedCount = downloadedCount,
                    conflictCount = conflictCount,
                    duration = System.currentTimeMillis() - startTime
                )
            } catch (e: Exception) {
                e.printStackTrace()
                SyncResult(false, error = e.message ?: "Unknown error")
            }
        }
    }

    /**
     * Get server capabilities
     */
    suspend fun getServerCapabilities(): WebDavCapabilities? {
        return withContext(Dispatchers.IO) {
            try {
                val client = sardine ?: return@withContext null
                val remoteUrl = "$serverUrl/"
                
                // Check for common WebDAV capabilities
                val options = client.options(remoteUrl)
                val supportedMethods = options.allowedMethods.toSet()
                
                WebDavCapabilities(
                    supportsLocking = supportedMethods.contains("LOCK"),
                    supportsPartialContent = supportedMethods.contains("GET"),
                    supportsPropfind = supportedMethods.contains("PROPFIND"),
                    supportsMove = supportedMethods.contains("MOVE"),
                    supportsCopy = supportedMethods.contains("COPY")
                )
            } catch (e: Exception) {
                e.printStackTrace()
                null
            }
        }
    }

    /**
     * Get storage usage (if server supports quota)
     */
    suspend fun getStorageUsage(): StorageUsage? {
        return withContext(Dispatchers.IO) {
            try {
                // WebDAV servers may not provide quota information
                // This would be server-specific implementation
                null
            } catch (e: Exception) {
                e.printStackTrace()
                null
            }
        }
    }

    private suspend fun ensureFolderExists(path: String) {
        try {
            val client = sardine ?: return
            val remoteUrl = "$serverUrl$path/"
            
            if (!client.exists(remoteUrl)) {
                client.createDirectory(remoteUrl)
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    private fun getMimeType(fileName: String): String {
        return when {
            fileName.endsWith(".mp3") -> "audio/mpeg"
            fileName.endsWith(".mp4") -> "video/mp4"
            fileName.endsWith(".pdf") -> "application/pdf"
            fileName.endsWith(".epub") -> "application/epub+zip"
            fileName.endsWith(".cbz") -> "application/x-cbz"
            else -> "application/octet-stream"
        }
    }

    private data class WebDavCredentials(
        val url: String,
        val username: String,
        val password: String
    )

    private fun getStoredCredentials(): WebDavCredentials? {
        // Implementation would retrieve from secure storage
        return null
    }

    private fun storeCredentials(url: String, username: String, password: String) {
        // Implementation would store in secure storage
    }

    private fun clearStoredCredentials() {
        // Implementation would clear from secure storage
    }

    private suspend fun getLocalMediaFiles(): List<LocalMediaFile> {
        // Implementation would scan local media directories
        return emptyList()
    }

    private fun getDownloadPath(fileName: String): String {
        return "${context.getExternalFilesDir(null)}/downloads/$fileName"
    }
}

/**
 * Data classes for WebDAV operations
 */
data class WebDavFile(
    val name: String,
    val path: String,
    val size: Long,
    val isDirectory: Boolean,
    val modifiedTime: Long,
    val etag: String?
)

data class WebDavCapabilities(
    val supportsLocking: Boolean,
    val supportsPartialContent: Boolean,
    val supportsPropfind: Boolean,
    val supportsMove: Boolean,
    val supportsCopy: Boolean
)