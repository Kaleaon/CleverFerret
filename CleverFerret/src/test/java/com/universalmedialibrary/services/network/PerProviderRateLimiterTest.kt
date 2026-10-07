package com.universalmedialibrary.services.network

import com.google.common.truth.Truth.assertThat
import okhttp3.Interceptor
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.Protocol
import okhttp3.Request
import okhttp3.Response
import okhttp3.ResponseBody.Companion.toResponseBody
import org.junit.Test
import java.util.concurrent.atomic.AtomicInteger

class PerProviderRateLimiterTest {

    private val rateLimiter = PerProviderRateLimiter()

    @Test
    fun `intercept adds User-Agent header if missing`() {
        val request = Request.Builder()
            .url("https://api.themoviedb.org/3/movie/550")
            .build()

        var capturedRequest: Request? = null
        val mockChain = object : Interceptor.Chain {
            override fun request(): Request {
                return request
            }

            override fun proceed(req: Request): Response {
                capturedRequest = req
                return Response.Builder()
                    .request(req)
                    .protocol(Protocol.HTTP_1_1)
                    .code(200)
                    .message("OK")
                    .body("{}".toResponseBody("application/json".toMediaType()))
                    .build()
            }

            override fun connection() = null
            override fun call() = error("not implemented")
            override fun connectTimeoutMillis() = 0
            override fun readTimeoutMillis() = 0
            override fun writeTimeoutMillis() = 0
            override fun withConnectTimeout(timeout: Int, unit: java.util.concurrent.TimeUnit) = this
            override fun withReadTimeout(timeout: Int, unit: java.util.concurrent.TimeUnit) = this
            override fun withWriteTimeout(timeout: Int, unit: java.util.concurrent.TimeUnit) = this
        }

        val response = rateLimiter.intercept(mockChain)

        assertThat(response.code).isEqualTo(200)
        assertThat(capturedRequest?.header("User-Agent")).isEqualTo(PerProviderRateLimiter.USER_AGENT)
    }

    @Test
    fun `intercept retries on 429 response`() {
        val request = Request.Builder()
            .url("https://openlibrary.org/search.json?q=test")
            .build()

        val callCount = AtomicInteger(0)
        val mockChain = object : Interceptor.Chain {
            override fun request(): Request = request

            override fun proceed(req: Request): Response {
                val current = callCount.incrementAndGet()
                val code = if (current == 1) 429 else 200
                return Response.Builder()
                    .request(req)
                    .protocol(Protocol.HTTP_1_1)
                    .code(code)
                    .message(if (code == 429) "Too Many Requests" else "OK")
                    .header("Retry-After", "0")
                    .body("{}".toResponseBody("application/json".toMediaType()))
                    .build()
            }

            override fun connection() = null
            override fun call() = error("not implemented")
            override fun connectTimeoutMillis() = 0
            override fun readTimeoutMillis() = 0
            override fun writeTimeoutMillis() = 0
            override fun withConnectTimeout(timeout: Int, unit: java.util.concurrent.TimeUnit) = this
            override fun withReadTimeout(timeout: Int, unit: java.util.concurrent.TimeUnit) = this
            override fun withWriteTimeout(timeout: Int, unit: java.util.concurrent.TimeUnit) = this
        }

        val response = rateLimiter.intercept(mockChain)

        assertThat(callCount.get()).isEqualTo(2)
        assertThat(response.code).isEqualTo(200)
    }
}
