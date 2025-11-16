package com.universalmedialibrary.services.music.hivefy

import com.universalmedialibrary.data.music.hivefy.SaavnLanguage
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import java.io.IOException
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Re-implementation of Hivefy's LatestSaavnFetcher using Jsoup so that we can discover trending
 * playlists/albums per language without relying on the Flutter codebase.
 */
@Singleton
class SaavnHtmlFetcher @Inject constructor(
    private val ioDispatcher: CoroutineDispatcher
) {

    suspend fun fetchFeaturedPlaylistLinks(
        language: SaavnLanguage,
        limit: Int
    ): List<String> = fetchLinks(
        url = "https://www.jiosaavn.com/featured-playlists/${language.slug}",
        hrefPrefix = "/featured/",
        limit = limit
    )

    suspend fun fetchNewAlbumLinks(
        language: SaavnLanguage,
        limit: Int
    ): List<String> = fetchLinks(
        url = "https://www.jiosaavn.com/new-releases/${language.slug}",
        hrefPrefix = "/album/",
        limit = limit
    )

    private suspend fun fetchLinks(
        url: String,
        hrefPrefix: String,
        limit: Int
    ): List<String> = withContext(ioDispatcher) {
        try {
            val document: Document = Jsoup.connect(url)
                .userAgent(USER_AGENT)
                .timeout(12_000)
                .get()

            document
                .select("a[href^=$hrefPrefix]")
                .mapNotNull { element ->
                    val href = element.attr("href")
                    if (href.isNullOrBlank()) null else "https://www.jiosaavn.com$href"
                }
                .distinct()
                .take(limit)
        } catch (ioe: IOException) {
            emptyList()
        } catch (t: Throwable) {
            emptyList()
        }
    }

    private companion object {
        private const val USER_AGENT = "Mozilla/5.0 (Android CleverFerret Hivefy Discovery)"
    }
}
