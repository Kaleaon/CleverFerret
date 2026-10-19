package com.universalmedialibrary.services.fanfiction.adapters

import com.universalmedialibrary.services.fanfiction.FanfictionSiteAdapter
import okhttp3.OkHttpClient
import okhttp3.Request
import org.jsoup.Jsoup
import org.jsoup.nodes.Document

/**
 * Base abstract class for fanfiction site adapters.
 * Provides shared networking and parsing utilities including document fetching and word counting.
 */
abstract class BaseFanfictionAdapter(
    protected val httpClient: OkHttpClient
) : FanfictionSiteAdapter {

    /**
     * Fetches an HTML document from the given URL using OkHttpClient and parses it with Jsoup.
     */
    @Suppress("TooGenericExceptionThrown")
    protected open suspend fun fetchDocument(url: String): Document {
        val request = Request.Builder()
            .url(url)
            .header("User-Agent", "CleverFerret/1.0 (Android)")
            .build()

        return httpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                throw Exception("HTTP error: ${response.code}")
            }
            Jsoup.parse(response.body?.string() ?: "")
        }
    }

    /**
     * Counts the number of words in the given text string.
     */
    protected open fun countWords(text: String): Int {
        return text.split(Regex("\\s+")).count { it.isNotBlank() }
    }
}
