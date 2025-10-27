package com.universalmedialibrary.services.network

import android.content.Context
import android.net.Uri
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.Credentials
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.w3c.dom.Element
import java.io.InputStream
import javax.inject.Inject
import javax.inject.Singleton
import javax.xml.parsers.DocumentBuilderFactory

/**
 * WebDAV Client for cloud storage access
 * Supports Nextcloud, ownCloud, and other WebDAV-compatible services
 */
@Singleton
class WebDavClient @Inject constructor(
    @ApplicationContext private val context: Context,
    private val okHttpClient: OkHttpClient
) {
    private var baseUrl: String = ""
    private var credentials: String = ""

    /**
     * Initialize WebDAV client with server details
     */
    fun initialize(serverUrl: String, username: String, password: String) {
        baseUrl = serverUrl.trimEnd('/')
        credentials = Credentials.basic(username, password)
    }

    /**
     * List files and directories at the given path
     */
    suspend fun listFiles(path: String = "/"): Result<List<WebDavFile>> = withContext(Dispatchers.IO) {
        try {
            val url = "$baseUrl${path.ensureStartsWithSlash()}"
            
            val requestBody = """
                <?xml version="1.0" encoding="utf-8"?>
                <d:propfind xmlns:d="DAV:">
                    <d:prop>
                        <d:displayname/>
                        <d:getcontentlength/>
                        <d:getlastmodified/>
                        <d:resourcetype/>
                        <d:getcontenttype/>
                    </d:prop>
                </d:propfind>
            """.trimIndent().toRequestBody("application/xml".toMediaType())
            
            val request = Request.Builder()
                .url(url)
                .method("PROPFIND", requestBody)
                .header("Authorization", credentials)
                .header("Depth", "1")
                .build()
            
            okHttpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) {
                    return@withContext Result.failure(
                        Exception("WebDAV request failed: ${response.code} ${response.message}")
                    )
                }
                
                val responseBody = response.body?.string() ?: return@withContext Result.failure(
                    Exception("Empty response body")
                )
                
                val files = parseWebDavResponse(responseBody, path)
                Result.success(files)
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Download a file from WebDAV server
     */
    suspend fun downloadFile(remotePath: String): Result<InputStream> = withContext(Dispatchers.IO) {
        try {
            val url = "$baseUrl${remotePath.ensureStartsWithSlash()}"
            
            val request = Request.Builder()
                .url(url)
                .header("Authorization", credentials)
                .build()
            
            okHttpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) {
                    return@withContext Result.failure(
                        Exception("Download failed: ${response.code} ${response.message}")
                    )
                }
                
                val inputStream = response.body?.byteStream() ?: return@withContext Result.failure(
                    Exception("Empty response body")
                )
                
                Result.success(inputStream)
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Upload a file to WebDAV server
     */
    suspend fun uploadFile(localUri: Uri, remotePath: String): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            val url = "$baseUrl${remotePath.ensureStartsWithSlash()}"
            
            val inputStream = context.contentResolver.openInputStream(localUri)
                ?: return@withContext Result.failure(
                    Exception("Cannot open input stream for: $localUri")
                )
            
            val bytes = inputStream.use { it.readBytes() }
            val requestBody = bytes.toRequestBody("application/octet-stream".toMediaType())
            
            val request = Request.Builder()
                .url(url)
                .put(requestBody)
                .header("Authorization", credentials)
                .build()
            
            okHttpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) {
                    return@withContext Result.failure(
                        Exception("Upload failed: ${response.code} ${response.message}")
                    )
                }
                
                Result.success(Unit)
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Create a directory on WebDAV server
     */
    suspend fun createDirectory(path: String): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            val url = "$baseUrl${path.ensureStartsWithSlash()}"
            
            val request = Request.Builder()
                .url(url)
                .method("MKCOL", null)
                .header("Authorization", credentials)
                .build()
            
            okHttpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful && response.code != 405) { // 405 means already exists
                    return@withContext Result.failure(
                        Exception("Create directory failed: ${response.code} ${response.message}")
                    )
                }
                
                Result.success(Unit)
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Delete a file or directory from WebDAV server
     */
    suspend fun delete(path: String): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            val url = "$baseUrl${path.ensureStartsWithSlash()}"
            
            val request = Request.Builder()
                .url(url)
                .delete()
                .header("Authorization", credentials)
                .build()
            
            okHttpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) {
                    return@withContext Result.failure(
                        Exception("Delete failed: ${response.code} ${response.message}")
                    )
                }
                
                Result.success(Unit)
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Move or rename a file/directory
     */
    suspend fun move(sourcePath: String, destinationPath: String): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            val sourceUrl = "$baseUrl${sourcePath.ensureStartsWithSlash()}"
            val destinationUrl = "$baseUrl${destinationPath.ensureStartsWithSlash()}"
            
            val request = Request.Builder()
                .url(sourceUrl)
                .method("MOVE", null)
                .header("Authorization", credentials)
                .header("Destination", destinationUrl)
                .build()
            
            okHttpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) {
                    return@withContext Result.failure(
                        Exception("Move failed: ${response.code} ${response.message}")
                    )
                }
                
                Result.success(Unit)
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Copy a file/directory
     */
    suspend fun copy(sourcePath: String, destinationPath: String): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            val sourceUrl = "$baseUrl${sourcePath.ensureStartsWithSlash()}"
            val destinationUrl = "$baseUrl${destinationPath.ensureStartsWithSlash()}"
            
            val request = Request.Builder()
                .url(sourceUrl)
                .method("COPY", null)
                .header("Authorization", credentials)
                .header("Destination", destinationUrl)
                .build()
            
            okHttpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) {
                    return@withContext Result.failure(
                        Exception("Copy failed: ${response.code} ${response.message}")
                    )
                }
                
                Result.success(Unit)
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Parse WebDAV PROPFIND response XML
     */
    private fun parseWebDavResponse(xml: String, requestPath: String): List<WebDavFile> {
        val files = mutableListOf<WebDavFile>()
        
        try {
            val factory = DocumentBuilderFactory.newInstance()
            factory.isNamespaceAware = true
            val builder = factory.newDocumentBuilder()
            val document = builder.parse(xml.byteInputStream())
            
            val responses = document.getElementsByTagNameNS("DAV:", "response")
            
            for (i in 0 until responses.length) {
                val response = responses.item(i) as Element
                
                val href = response.getElementsByTagNameNS("DAV:", "href")
                    .item(0)?.textContent ?: continue
                
                // Skip the parent directory itself
                if (href.trimEnd('/') == requestPath.trimEnd('/')) continue
                
                val propstat = response.getElementsByTagNameNS("DAV:", "propstat").item(0) as? Element
                    ?: continue
                
                val prop = propstat.getElementsByTagNameNS("DAV:", "prop").item(0) as? Element
                    ?: continue
                
                val displayName = prop.getElementsByTagNameNS("DAV:", "displayname")
                    .item(0)?.textContent ?: href.substringAfterLast('/')
                
                val contentLength = prop.getElementsByTagNameNS("DAV:", "getcontentlength")
                    .item(0)?.textContent?.toLongOrNull() ?: 0L
                
                val lastModified = prop.getElementsByTagNameNS("DAV:", "getlastmodified")
                    .item(0)?.textContent ?: ""
                
                val resourceType = prop.getElementsByTagNameNS("DAV:", "resourcetype")
                    .item(0) as? Element
                
                val isDirectory = resourceType?.getElementsByTagNameNS("DAV:", "collection")
                    ?.length ?: 0 > 0
                
                val contentType = prop.getElementsByTagNameNS("DAV:", "getcontenttype")
                    .item(0)?.textContent
                
                files.add(
                    WebDavFile(
                        name = displayName,
                        path = href,
                        isDirectory = isDirectory,
                        size = contentLength,
                        lastModified = lastModified,
                        contentType = contentType
                    )
                )
            }
        } catch (e: Exception) {
            // Return empty list on parse error
        }
        
        return files
    }

    private fun String.ensureStartsWithSlash(): String {
        return if (startsWith("/")) this else "/$this"
    }
}

/**
 * Data class representing a WebDAV file or directory
 */
data class WebDavFile(
    val name: String,
    val path: String,
    val isDirectory: Boolean,
    val size: Long,
    val lastModified: String,
    val contentType: String? = null
)

/**
 * WebDAV configuration
 */
data class WebDavConfig(
    val name: String,
    val serverUrl: String,
    val username: String,
    val password: String,
    val basePath: String = "/"
)