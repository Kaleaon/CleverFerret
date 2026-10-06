package com.universalmedialibrary.services.network

import okhttp3.Interceptor
import okhttp3.Response
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.atomic.AtomicLong
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Thread-safe rate limiter component enforcing per-provider minimum delays and HTTP 429 backoff retry logic.
 */
@Singleton
class PerProviderRateLimiter @Inject constructor() : Interceptor {

    companion object {
        const val USER_AGENT = "CleverFerret/1.0 (Android; Universal Media Library)"

        // Default minimum delays between consecutive requests to external provider hostnames (in milliseconds)
        private val PROVIDER_DELAYS_MS = mapOf(
            "api.themoviedb.org" to 200L,       // TMDB: ~5 req/s
            "openlibrary.org" to 300L,          // OpenLibrary: ~3 req/s
            "webservice.fanart.tv" to 300L,     // Fanart.tv: ~3 req/s
            "fanart.tv" to 300L,
            "musicbrainz.org" to 1100L,         // MusicBrainz: 1 req/sec
            "googleapis.com" to 200L,           // Google Books: ~5 req/s
            "omdbapi.com" to 200L               // OMDb: ~5 req/s
        )

        private const val DEFAULT_DELAY_MS = 100L
        private const val MAX_RETRIES = 2
    }

    private val lastRequestTimestamps = ConcurrentHashMap<String, AtomicLong>()
    private val hostLocks = ConcurrentHashMap<String, Any>()

    override fun intercept(chain: Interceptor.Chain): Response {
        val request = chain.request()
        val host = request.url.host

        // Add standard User-Agent header if missing
        val requestBuilder = request.newBuilder()
        if (request.header("User-Agent") == null) {
            requestBuilder.header("User-Agent", USER_AGENT)
        }

        // Throttle request rate per provider
        throttleForHost(host)

        var response = chain.proceed(requestBuilder.build())

        // Handle HTTP 429 Too Many Requests with exponential backoff & retry
        var retryCount = 0
        while (response.code == 429 && retryCount < MAX_RETRIES) {
            response.close()
            retryCount++

            val retryAfterSeconds = response.header("Retry-After")?.toLongOrNull() ?: (1L shl retryCount)
            val backoffMs = retryAfterSeconds * 1000L

            try {
                Thread.sleep(backoffMs)
            } catch (_: InterruptedException) {
            }

            throttleForHost(host)
            response = chain.proceed(requestBuilder.build())
        }

        return response
    }

    private fun throttleForHost(host: String) {
        val minDelay = getMinDelayForHost(host)
        val lock = hostLocks.computeIfAbsent(host) { Any() }
        val lastTimeRef = lastRequestTimestamps.computeIfAbsent(host) { AtomicLong(0L) }

        synchronized(lock) {
            val now = System.currentTimeMillis()
            val timeSinceLast = now - lastTimeRef.get()
            if (timeSinceLast < minDelay) {
                try {
                    Thread.sleep(minDelay - timeSinceLast)
                } catch (_: InterruptedException) {
                }
            }
            lastTimeRef.set(System.currentTimeMillis())
        }
    }

    private fun getMinDelayForHost(host: String): Long {
        for ((providerHost, delay) in PROVIDER_DELAYS_MS) {
            if (host.contains(providerHost, ignoreCase = true)) {
                return delay
            }
        }
        return DEFAULT_DELAY_MS
    }
}
