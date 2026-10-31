package com.universalmedialibrary.services.network

import okhttp3.MediaType
import okhttp3.RequestBody
import okio.Buffer
import okio.BufferedSink
import okio.ForwardingSink
import okio.Sink
import okio.buffer
import java.io.IOException

/**
 * OkHttp [RequestBody] decorator that wraps an outgoing request body with an Okio [CountingSink]
 * to report upload progress callbacks during data transmission.
 */
class ProgressRequestBody(
    private val delegate: RequestBody,
    private val onProgress: (bytesWritten: Long, contentLength: Long, progress: Float) -> Unit
) : RequestBody() {

    override fun contentType(): MediaType? = delegate.contentType()

    override fun contentLength(): Long = delegate.contentLength()

    @Throws(IOException::class)
    override fun writeTo(sink: BufferedSink) {
        onProgress(0L, contentLength(), 0f)
        val countingSink = CountingSink(sink)
        val bufferedSink = countingSink.buffer()
        delegate.writeTo(bufferedSink)
        bufferedSink.flush()
    }

    private inner class CountingSink(delegate: Sink) : ForwardingSink(delegate) {
        private var bytesWritten = 0L
        private val totalBytes = contentLength()

        @Throws(IOException::class)
        override fun write(source: Buffer, byteCount: Long) {
            super.write(source, byteCount)
            bytesWritten += byteCount
            val progress = if (totalBytes > 0) {
                (bytesWritten.toFloat() / totalBytes.toFloat()).coerceIn(0f, 1f)
            } else {
                0f
            }
            onProgress(bytesWritten, totalBytes, progress)
        }
    }
}

/**
 * Extension function to wrap a [RequestBody] with progress callbacks.
 */
fun RequestBody.withProgress(
    onProgress: (bytesWritten: Long, contentLength: Long, progress: Float) -> Unit
): ProgressRequestBody = ProgressRequestBody(this, onProgress)

/**
 * Extension function to wrap a [RequestBody] with a simple percentage progress callback.
 */
fun RequestBody.withProgressCallback(
    progressCallback: ((Float) -> Unit)?
): RequestBody {
    if (progressCallback == null) return this
    return ProgressRequestBody(this) { _, _, progress ->
        progressCallback(progress)
    }
}
