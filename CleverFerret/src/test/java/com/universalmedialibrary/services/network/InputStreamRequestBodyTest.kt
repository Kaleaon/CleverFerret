package com.universalmedialibrary.services.network

import okhttp3.MediaType.Companion.toMediaType
import okio.Buffer
import org.junit.Assert.assertEquals
import org.junit.Test
import java.io.ByteArrayInputStream

class InputStreamRequestBodyTest {

    @Test
    fun inputStreamRequestBody_streamsDataWithoutBufferingEntireArray() {
        val testData = "Streaming via Okio sources and InputStreamRequestBody".toByteArray(Charsets.UTF_8)
        val mediaType = "application/octet-stream".toMediaType()

        val requestBody = InputStreamRequestBody(
            contentType = mediaType,
            contentLength = testData.size.toLong(),
            inputStreamProvider = { ByteArrayInputStream(testData) }
        )

        assertEquals(testData.size.toLong(), requestBody.contentLength())
        assertEquals(mediaType, requestBody.contentType())

        val sink = Buffer()
        requestBody.writeTo(sink)

        assertEquals("Streaming via Okio sources and InputStreamRequestBody", sink.readUtf8())
    }
}
