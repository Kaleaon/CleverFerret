package com.universalmedialibrary.services.cloud

import android.content.Context
import android.net.Uri
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import com.universalmedialibrary.services.network.WebDavClient
import java.io.File
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
    @ApplicationContext private val context: Context,
    private val webDavClient: WebDavClient
) {
    
    private val _isAuthenticated = MutableStateFlow(false)
    val isAuthenticated: Flow<Boolean> = _isAuthenticated.asStateFlow()
    
    private val _syncProgress = MutableStateFlow(0f)
    val syncProgress: Flow<Float> = _syncProgress.asStateFlow()
    
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
                    serverUrl = credentials.url
                    username = credentials.username
                    password = credentials.password
                    webDavClient.initialize(credentials.url, credentials.username, credentials.password)
                    _isAuthenticated.value = true
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
                this@WebDavService.serverUrl = url
                this@WebDavService.username = username
                this@WebDavService.password = password
                webDavClient.initialize(url, username, password)
                
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
        serverUrl = null
        username = null
        password = null
        clearCredentials()
        _isAuthenticated.value = false
    }

    /**
     * Upload file to WebDAV
     */
    suspend fun uploadFile(
        localPath: String,
        remotePath: String,
        progressCallback: ((Float) -> Unit)? = null
    ): Boolean {
        return withContext(Dispatchers.IO) {
            if (!isConfigured()) return@withContext false
            progressCallback?.invoke(0f)
            val uri = Uri.fromFile(File(localPath))
            val result = webDavClient.uploadFile(uri, remotePath)
            progressCallback?.invoke(if (result.isSuccess) 1f else 0f)
            result.isSuccess
        }
    }

    /**
     * Download file from WebDAV
     */
    suspend fun downloadFile(
        remotePath: String,
        localPath: String,
        progressCallback: ((Float) -> Unit)? = null
    ): Boolean {
        return withContext(Dispatchers.IO) {
            if (!isConfigured()) return@withContext false
            progressCallback?.invoke(0f)
            val result = webDavClient.downloadFile(remotePath)
            if (result.isSuccess) {
                val inputStream = result.getOrNull()
                if (inputStream != null) {
                    File(localPath).outputStream().use { out ->
                        inputStream.copyTo(out)
                    }
                    progressCallback?.invoke(1f)
                    true
                } else {
                    progressCallback?.invoke(0f)
                    false
                }
            } else {
                progressCallback?.invoke(0f)
                false
            }
        }
    }

    /**
     * List files in directory
     */
    suspend fun listFiles(remotePath: String = APP_FOLDER): List<WebDavFile> {
        return withContext(Dispatchers.IO) {
            if (!isConfigured()) return@withContext emptyList()
            webDavClient.listFiles(remotePath).getOrElse { emptyList() }.map { file ->
                WebDavFile(
                    name = file.displayName,
                    path = file.path,
                    isDirectory = file.isDirectory,
                    size = file.size,
                    lastModified = file.lastModified
                )
            }
        }
    }

    /**
     * Delete file from WebDAV
     */
    suspend fun deleteFile(remotePath: String): Boolean {
        return withContext(Dispatchers.IO) {
            if (!isConfigured()) return@withContext false
            webDavClient.delete(remotePath).isSuccess
        }
    }

    /**
     * Create directory on WebDAV
     */
    suspend fun createDirectory(remotePath: String): Boolean {
        return withContext(Dispatchers.IO) {
            if (!isConfigured()) return@withContext false
            webDavClient.createDirectory(remotePath).isSuccess
        }
    }

    /**
     * Sync media with WebDAV
     */
    suspend fun syncMedia(): SyncResult {
        return withContext(Dispatchers.IO) {
            if (!isConfigured()) {
                return@withContext SyncResult(
                    success = false,
                    error = "WebDAV credentials not configured"
                )
            }
            val listing = webDavClient.listFiles(APP_FOLDER)
            if (listing.isSuccess) {
                SyncResult(success = true, error = null)
            } else {
                SyncResult(success = false, error = listing.exceptionOrNull()?.message)
            }
        }
    }

    /**
     * Get storage usage (WebDAV does not expose usage universally; returns null when unavailable)
     */
    suspend fun getStorageUsage(): StorageUsage? {
        return withContext(Dispatchers.IO) {
            null
        }
    }

    private fun isConfigured(): Boolean {
        return !serverUrl.isNullOrBlank() && !username.isNullOrBlank() && !password.isNullOrBlank()
    }

    private fun getStoredCredentials(): WebDavCredentials? {
        val prefs = context.getSharedPreferences("webdav_prefs", Context.MODE_PRIVATE)
        val url = prefs.getString("server_url", null)
        val user = prefs.getString("username", null)
        val pass = prefs.getString("password", null)
        
        return if (url != null && user != null && pass != null) {
            WebDavCredentials(url, user, pass)
        } else {
            null
        }
    }

    private fun storeCredentials(url: String, username: String, password: String) {
        val prefs = context.getSharedPreferences("webdav_prefs", Context.MODE_PRIVATE)
        prefs.edit()
            .putString("server_url", url)
            .putString("username", username)
            .putString("password", password)
            .apply()
    }

    private fun clearCredentials() {
        val prefs = context.getSharedPreferences("webdav_prefs", Context.MODE_PRIVATE)
        prefs.edit()
            .remove("server_url")
            .remove("username")
            .remove("password")
            .apply()
    }
}

/**
 * Data class for WebDAV files
 */
data class WebDavFile(
    val name: String,
    val path: String,
    val size: Long,
    val isDirectory: Boolean,
    val modifiedTime: Long,
    val contentType: String? = null
)

/**
 * Data class for WebDAV credentials
 */
data class WebDavCredentials(
    val url: String,
    val username: String,
    val password: String
)
