package com.universalmedialibrary.services.network

import okhttp3.MediaType
import okhttp3.RequestBody
import okio.BufferedSink
import okio.source
import java.io.InputStream
import java.io.IOException

/**
 * Non-buffering streaming [RequestBody] implementation for OkHttp.
 *
 * Streams bytes directly from an [InputStream] into OkHttp's [BufferedSink] using Okio sources
 * without reading the entire payload into a byte array in JVM heap memory.
 */
class InputStreamRequestBody(
    private val contentType: MediaType?,
    private val contentLength: Long = -1L,
    private val inputStreamProvider: () -> InputStream?
) : RequestBody() {

    override fun contentType(): MediaType? = contentType

    override fun contentLength(): Long = contentLength

    @Throws(IOException::class)
    override fun writeTo(sink: BufferedSink) {
        val inputStream = inputStreamProvider()
            ?: throw IOException("Cannot open InputStream for request body")
        inputStream.use { stream ->
            stream.source().use { source ->
                sink.writeAll(source)
            }
        }
    }
}
