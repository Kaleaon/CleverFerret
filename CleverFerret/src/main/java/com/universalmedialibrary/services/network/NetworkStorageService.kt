package com.universalmedialibrary.services.network

import android.content.Context
import android.net.Uri
import dagger.hilt.android.qualifiers.ApplicationContext
import jcifs.CIFSContext
import jcifs.config.PropertyConfiguration
import jcifs.context.BaseContext
import jcifs.smb.NtlmPasswordAuthenticator
import jcifs.smb.SmbFile
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.InputStream
import java.io.OutputStream
import java.util.Properties
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Network Storage Service for SMB/CIFS file access
 * Supports Windows shares, NAS devices, and Samba servers
 */
@Singleton
class NetworkStorageService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private var cifsContext: CIFSContext? = null

    /**
     * Initialize SMB context with authentication
     */
    fun initialize(
        domain: String = "",
        username: String,
        password: String
    ) {
        val properties = Properties().apply {
            setProperty("jcifs.smb.client.minVersion", "SMB202")
            setProperty("jcifs.smb.client.maxVersion", "SMB311")
            setProperty("jcifs.resolveOrder", "DNS")
        }

        val config = PropertyConfiguration(properties)
        val baseContext = BaseContext(config)
        
        val auth = NtlmPasswordAuthenticator(domain, username, password)
        cifsContext = baseContext.withCredentials(auth)
    }

    /**
     * List files in a network directory
     */
    suspend fun listFiles(smbUrl: String): Result<List<NetworkFile>> = withContext(Dispatchers.IO) {
        try {
            val context = cifsContext ?: return@withContext Result.failure(
                IllegalStateException("SMB context not initialized")
            )
            
            val smbFile = SmbFile(smbUrl, context)
            
            if (!smbFile.exists()) {
                return@withContext Result.failure(
                    IllegalStateException("Path does not exist: $smbUrl")
                )
            }
            
            if (!smbFile.isDirectory) {
                return@withContext Result.failure(
                    IllegalStateException("Path is not a directory: $smbUrl")
                )
            }
            
            val files = smbFile.listFiles()?.map { file ->
                NetworkFile(
                    name = file.name,
                    path = file.path,
                    url = file.url.toString(),
                    isDirectory = file.isDirectory,
                    size = if (file.isFile) file.length() else 0L,
                    lastModified = file.lastModified()
                )
            } ?: emptyList()
            
            Result.success(files)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Open input stream for reading a network file
     */
    suspend fun openInputStream(smbUrl: String): Result<InputStream> = withContext(Dispatchers.IO) {
        try {
            val context = cifsContext ?: return@withContext Result.failure(
                IllegalStateException("SMB context not initialized")
            )
            
            val smbFile = SmbFile(smbUrl, context)
            
            if (!smbFile.exists()) {
                return@withContext Result.failure(
                    IllegalStateException("File does not exist: $smbUrl")
                )
            }
            
            if (!smbFile.isFile) {
                return@withContext Result.failure(
                    IllegalStateException("Path is not a file: $smbUrl")
                )
            }
            
            Result.success(smbFile.inputStream)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Open output stream for writing to a network file
     */
    suspend fun openOutputStream(smbUrl: String): Result<OutputStream> = withContext(Dispatchers.IO) {
        try {
            val context = cifsContext ?: return@withContext Result.failure(
                IllegalStateException("SMB context not initialized")
            )
            
            val smbFile = SmbFile(smbUrl, context)
            Result.success(smbFile.outputStream)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Check if a network path exists
     */
    suspend fun exists(smbUrl: String): Result<Boolean> = withContext(Dispatchers.IO) {
        try {
            val context = cifsContext ?: return@withContext Result.failure(
                IllegalStateException("SMB context not initialized")
            )
            
            val smbFile = SmbFile(smbUrl, context)
            Result.success(smbFile.exists())
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Get file metadata
     */
    suspend fun getFileInfo(smbUrl: String): Result<NetworkFile> = withContext(Dispatchers.IO) {
        try {
            val context = cifsContext ?: return@withContext Result.failure(
                IllegalStateException("SMB context not initialized")
            )
            
            val smbFile = SmbFile(smbUrl, context)
            
            if (!smbFile.exists()) {
                return@withContext Result.failure(
                    IllegalStateException("File does not exist: $smbUrl")
                )
            }
            
            val fileInfo = NetworkFile(
                name = smbFile.name,
                path = smbFile.path,
                url = smbFile.url.toString(),
                isDirectory = smbFile.isDirectory,
                size = if (smbFile.isFile) smbFile.length() else 0L,
                lastModified = smbFile.lastModified()
            )
            
            Result.success(fileInfo)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Create a directory on the network
     */
    suspend fun createDirectory(smbUrl: String): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            val context = cifsContext ?: return@withContext Result.failure(
                IllegalStateException("SMB context not initialized")
            )
            
            val smbFile = SmbFile(smbUrl, context)
            smbFile.mkdirs()
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Delete a file or directory from the network
     */
    suspend fun delete(smbUrl: String): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            val context = cifsContext ?: return@withContext Result.failure(
                IllegalStateException("SMB context not initialized")
            )
            
            val smbFile = SmbFile(smbUrl, context)
            
            if (!smbFile.exists()) {
                return@withContext Result.failure(
                    IllegalStateException("File does not exist: $smbUrl")
                )
            }
            
            smbFile.delete()
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Copy a file from network to local storage
     */
    suspend fun downloadFile(
        smbUrl: String,
        localUri: Uri,
        progressCallback: ((Long, Long) -> Unit)? = null
    ): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            val inputStream = openInputStream(smbUrl).getOrThrow()
            val outputStream = context.contentResolver.openOutputStream(localUri)
                ?: return@withContext Result.failure(
                    IllegalStateException("Cannot open output stream for: $localUri")
                )
            
            val fileInfo = getFileInfo(smbUrl).getOrThrow()
            val totalSize = fileInfo.size
            var bytesRead = 0L
            
            inputStream.use { input ->
                outputStream.use { output ->
                    val buffer = ByteArray(8192)
                    var read: Int
                    
                    while (input.read(buffer).also { read = it } != -1) {
                        output.write(buffer, 0, read)
                        bytesRead += read
                        progressCallback?.invoke(bytesRead, totalSize)
                    }
                }
            }
            
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Copy a file from local storage to network
     */
    suspend fun uploadFile(
        localUri: Uri,
        smbUrl: String,
        progressCallback: ((Long, Long) -> Unit)? = null
    ): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            val inputStream = context.contentResolver.openInputStream(localUri)
                ?: return@withContext Result.failure(
                    IllegalStateException("Cannot open input stream for: $localUri")
                )
            
            val outputStream = openOutputStream(smbUrl).getOrThrow()
            
            val totalSize = context.contentResolver.query(localUri, null, null, null, null)?.use { cursor ->
                val sizeIndex = cursor.getColumnIndex(android.provider.OpenableColumns.SIZE)
                cursor.moveToFirst()
                cursor.getLong(sizeIndex)
            } ?: 0L
            
            var bytesRead = 0L
            
            inputStream.use { input ->
                outputStream.use { output ->
                    val buffer = ByteArray(8192)
                    var read: Int
                    
                    while (input.read(buffer).also { read = it } != -1) {
                        output.write(buffer, 0, read)
                        bytesRead += read
                        progressCallback?.invoke(bytesRead, totalSize)
                    }
                }
            }
            
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}

/**
 * Data class representing a network file or directory
 */
data class NetworkFile(
    val name: String,
    val path: String,
    val url: String,
    val isDirectory: Boolean,
    val size: Long,
    val lastModified: Long
)

/**
 * Network storage configuration
 */
data class NetworkStorageConfig(
    val name: String,
    val serverAddress: String,
    val shareName: String,
    val domain: String = "",
    val username: String,
    val password: String,
    val port: Int = 445
) {
    /**
     * Generate SMB URL from configuration
     */
    fun toSmbUrl(path: String = ""): String {
        val cleanPath = path.trimStart('/')
        return "smb://$serverAddress:$port/$shareName/$cleanPath"
    }
}