package com.universalmedialibrary.services.network

import okhttp3.MediaType.Companion.toMediaType
import okhttp3.RequestBody.Companion.toRequestBody
import okio.Buffer
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.ByteArrayInputStream

class ProgressRequestBodyTest {

    @Test
    fun progressRequestBody_emitsProgressUpdatesCorrectly() {
        val payload = ByteArray(1024 * 64) { (it % 256).toByte() }
        val delegate = payload.toRequestBody("application/octet-stream".toMediaType())

        val progressValues = mutableListOf<Float>()
        val bytesWrittenList = mutableListOf<Long>()

        val progressRequestBody = delegate.withProgress { bytesWritten, contentLength, progress ->
            bytesWrittenList.add(bytesWritten)
            progressValues.add(progress)
            assertEquals(65536L, contentLength)
        }

        assertEquals(65536L, progressRequestBody.contentLength())
        assertEquals("application/octet-stream".toMediaType(), progressRequestBody.contentType())

        val sink = Buffer()
        progressRequestBody.writeTo(sink)

        assertEquals(65536L, sink.size)
        assertTrue(progressValues.isNotEmpty())
        assertEquals(0f, progressValues.first(), 0.1f)
        assertEquals(1.0f, progressValues.last(), 0.001f)
        assertEquals(65536L, bytesWrittenList.last())
    }

    @Test
    fun withProgressCallback_invokesFloatCallback() {
        val payload = "Hello OkHttp Direct File Streaming".toByteArray()
        val delegate = payload.toRequestBody("text/plain".toMediaType())

        val percentages = mutableListOf<Float>()
        val progressRequestBody = delegate.withProgressCallback { percentages.add(it) }

        val sink = Buffer()
        progressRequestBody.writeTo(sink)

        assertEquals("Hello OkHttp Direct File Streaming", sink.readUtf8())
        assertTrue(percentages.isNotEmpty())
        assertEquals(1.0f, percentages.last(), 0.001f)
    }
}
