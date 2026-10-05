package com.universalmedialibrary.services.metadata

import com.universalmedialibrary.data.repository.APIKeyRepository
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Centralized API client manager for external metadata services (MusicBrainz, Google Books,
 * Open Library, TMDB, OMDb). Enforces strict rate limiting for MusicBrainz (max 1 req/sec)
 * and applies uniform User-Agent headers across all requests.
 */
@Singleton
class CentralizedMetadataApiClient @Inject constructor(
    private val apiKeyRepository: APIKeyRepository
) {
    companion object {
        const val USER_AGENT = "CleverFerret/1.0 (Android; Universal Media Library)"
        private const val MUSICBRAINZ_DELAY_MS = 1100L
    }

    @Volatile
    private var lastMusicBrainzRequestTime = 0L

    private val rateLimitingInterceptor = Interceptor { chain ->
        val request = chain.request()
        val requestBuilder = request.newBuilder()
            .header("User-Agent", USER_AGENT)

        if (request.url.host.contains("musicbrainz.org")) {
            synchronized(this) {
                val now = System.currentTimeMillis()
                val timeSinceLast = now - lastMusicBrainzRequestTime
                if (timeSinceLast < MUSICBRAINZ_DELAY_MS) {
                    try {
                        Thread.sleep(MUSICBRAINZ_DELAY_MS - timeSinceLast)
                    } catch (_: InterruptedException) {
                    }
                }
                lastMusicBrainzRequestTime = System.currentTimeMillis()
            }
        }

        chain.proceed(requestBuilder.build())
    }

    val okHttpClient: OkHttpClient = OkHttpClient.Builder()
        .connectTimeout(15, TimeUnit.SECONDS)
        .readTimeout(15, TimeUnit.SECONDS)
        .addInterceptor(rateLimitingInterceptor)
        .addInterceptor(HttpLoggingInterceptor().apply {
            level = HttpLoggingInterceptor.Level.BASIC
        })
        .build()

    val googleBooksApi: GoogleBooksApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://www.googleapis.com/books/v1/")
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(GoogleBooksApi::class.java)
    }

    val openLibraryApi: OpenLibraryApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://openlibrary.org/")
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(OpenLibraryApi::class.java)
    }

    val tmdbApi: TMDBApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://api.themoviedb.org/3/")
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(TMDBApi::class.java)
    }

    val omdbApi: OMDbApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://www.omdbapi.com/")
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(OMDbApi::class.java)
    }

    val musicBrainzApi: MusicBrainzApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://musicbrainz.org/ws/2/")
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(MusicBrainzApi::class.java)
    }
}
