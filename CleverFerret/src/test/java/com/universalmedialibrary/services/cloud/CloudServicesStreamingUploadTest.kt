package com.universalmedialibrary.services.cloud

import android.content.Context
import android.net.Uri
import com.universalmedialibrary.data.security.EncryptedCredentialVault
import com.universalmedialibrary.services.network.WebDavClient
import io.mockk.every
import io.mockk.mockk
import okhttp3.Interceptor
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Response
import okhttp3.ResponseBody.Companion.toResponseBody
import okio.Buffer
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import java.io.File
import java.io.FileInputStream

@RunWith(RobolectricTestRunner::class)
class CloudServicesStreamingUploadTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    private lateinit var mockContext: Context
    private lateinit var mockCredentialVault: EncryptedCredentialVault
    private lateinit var testFile: File

    @Before
    fun setUp() {
        mockContext = mockk(relaxed = true)
        mockCredentialVault = mockk(relaxed = true)
        testFile = tempFolder.newFile("sample_media.mp4")
        // Create 256KB test payload
        val content = ByteArray(256 * 1024) { (it % 128).toByte() }
        testFile.writeBytes(content)
    }

    @Test
    fun dropboxService_uploadFile_streamsFileAndEmitsProgress() = kotlinx.coroutines.runBlocking {
        var recordedAuthHeader: String? = null
        var recordedArgsHeader: String? = null
        var recordedContentType: String? = null
        var bytesReceived = 0L

        val interceptor = Interceptor { chain ->
            val req = chain.request()
            recordedAuthHeader = req.header("Authorization")
            recordedArgsHeader = req.header("Dropbox-API-Arg")
            recordedContentType = req.header("Content-Type")

            val sink = Buffer()
            req.body?.writeTo(sink)
            bytesReceived = sink.size

            Response.Builder()
                .request(req)
                .protocol(okhttp3.Protocol.HTTP_1_1)
                .code(200)
                .message("OK")
                .body("""{"id": "dbid:dropbox_file_123"}""".toResponseBody("application/json".toMediaType()))
                .build()
        }

        val okHttpClient = OkHttpClient.Builder()
            .addInterceptor(interceptor)
            .build()

        val service = DropboxService(mockContext, okHttpClient)
        service.authenticate("mock_dropbox_token")

        val progressUpdates = mutableListOf<Float>()
        val resultId = service.uploadFile(
            localPath = testFile.absolutePath,
            fileName = "sample_media.mp4",
            folderPath = "/CleverFerret",
            progressCallback = { progressUpdates.add(it) }
        )

        assertEquals("dbid:dropbox_file_123", resultId)
        assertEquals("Bearer mock_dropbox_token", recordedAuthHeader)
        assertNotNull(recordedArgsHeader)
        assertTrue(recordedArgsHeader!!.contains("sample_media.mp4"))
        assertEquals("application/octet-stream", recordedContentType)
        assertEquals(256 * 1024L, bytesReceived)

        assertTrue("Progress callbacks should be captured", progressUpdates.isNotEmpty())
        assertEquals(1.0f, progressUpdates.last(), 0.001f)
    }

    @Test
    fun oneDriveService_uploadFile_streamsFileAndEmitsProgress() = kotlinx.coroutines.runBlocking {
        var recordedAuthHeader: String? = null
        var recordedUrl: String? = null
        var bytesReceived = 0L

        val interceptor = Interceptor { chain ->
            val req = chain.request()
            recordedAuthHeader = req.header("Authorization")
            recordedUrl = req.url.toString()

            val sink = Buffer()
            req.body?.writeTo(sink)
            bytesReceived = sink.size

            Response.Builder()
                .request(req)
                .protocol(okhttp3.Protocol.HTTP_1_1)
                .code(200)
                .message("OK")
                .body("""{"id": "onedrive_item_456"}""".toResponseBody("application/json".toMediaType()))
                .build()
        }

        val okHttpClient = OkHttpClient.Builder()
            .addInterceptor(interceptor)
            .build()

        val service = OneDriveService(mockContext, okHttpClient, mockCredentialVault)
        service.authenticate("mock_onedrive_token")

        val progressUpdates = mutableListOf<Float>()
        val resultId = service.uploadFile(
            localPath = testFile.absolutePath,
            fileName = "sample_media.mp4",
            folderPath = "/CleverFerret",
            progressCallback = { progressUpdates.add(it) }
        )

        assertEquals("onedrive_item_456", resultId)
        assertEquals("Bearer mock_onedrive_token", recordedAuthHeader)
        assertTrue(recordedUrl!!.contains("sample_media.mp4"))
        assertEquals(256 * 1024L, bytesReceived)

        assertTrue(progressUpdates.isNotEmpty())
        assertEquals(1.0f, progressUpdates.last(), 0.001f)
    }

    @Test
    fun googleDriveService_uploadFile_streamsMultipartAndEmitsProgress() = kotlinx.coroutines.runBlocking {
        var recordedAuthHeader: String? = null
        var recordedContentType: String? = null
        var bytesReceived = 0L

        val interceptor = Interceptor { chain ->
            val req = chain.request()
            recordedAuthHeader = req.header("Authorization")
            recordedContentType = req.body?.contentType()?.toString()

            val sink = Buffer()
            req.body?.writeTo(sink)
            bytesReceived = sink.size

            Response.Builder()
                .request(req)
                .protocol(okhttp3.Protocol.HTTP_1_1)
                .code(200)
                .message("OK")
                .body("""{"id": "gdrive_file_789"}""".toResponseBody("application/json".toMediaType()))
                .build()
        }

        val okHttpClient = OkHttpClient.Builder()
            .addInterceptor(interceptor)
            .build()

        val service = GoogleDriveService(mockContext, okHttpClient, mockCredentialVault)
        service.authenticate("mock_gdrive_token")

        val progressUpdates = mutableListOf<Float>()
        val resultId = service.uploadFile(
            localFile = testFile,
            folderId = "folder_abc",
            progressCallback = { progressUpdates.add(it) }
        )

        assertEquals("gdrive_file_789", resultId)
        assertEquals("Bearer mock_gdrive_token", recordedAuthHeader)
        assertNotNull(recordedContentType)
        assertTrue(recordedContentType!!.contains("multipart/related"))
        assertTrue(bytesReceived > 256 * 1024L) // File bytes + multipart headers

        assertTrue(progressUpdates.isNotEmpty())
        assertEquals(1.0f, progressUpdates.last(), 0.001f)
    }

    @Test
    fun webDavClient_uploadFile_streamsInputStreamAndEmitsProgress() = kotlinx.coroutines.runBlocking {
        var recordedAuthHeader: String? = null
        var bytesReceived = 0L

        val fileUri = Uri.fromFile(testFile)
        every { mockContext.contentResolver.openInputStream(fileUri) } answers { FileInputStream(testFile) }

        val interceptor = Interceptor { chain ->
            val req = chain.request()
            recordedAuthHeader = req.header("Authorization")

            val sink = Buffer()
            req.body?.writeTo(sink)
            bytesReceived = sink.size

            Response.Builder()
                .request(req)
                .protocol(okhttp3.Protocol.HTTP_1_1)
                .code(201)
                .message("Created")
                .body("".toResponseBody("text/plain".toMediaType()))
                .build()
        }

        val okHttpClient = OkHttpClient.Builder()
            .addInterceptor(interceptor)
            .build()

        val client = WebDavClient(mockContext, okHttpClient)
        client.initialize("https://example.com/webdav", "user", "pass")

        val progressUpdates = mutableListOf<Float>()
        val result = client.uploadFile(
            localUri = fileUri,
            remotePath = "/CleverFerret/sample_media.mp4",
            progressCallback = { progressUpdates.add(it) }
        )

        assertTrue(result.isSuccess)
        assertNotNull(recordedAuthHeader)
        assertEquals(256 * 1024L, bytesReceived)

        assertTrue(progressUpdates.isNotEmpty())
        assertEquals(1.0f, progressUpdates.last(), 0.001f)
    }
}
