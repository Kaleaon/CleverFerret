package com.universalmedialibrary.services.metadata.sources

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Goodreads metadata source (using web scraping - API is deprecated)
 */
@Singleton
class GoodreadsMetadataSource @Inject constructor(
    private val httpClient: OkHttpClient
) : MetadataSource {
    
    override val sourceName = "Goodreads"
    override val priority = 10 // Highest - best book database
    override val supportedTypes = listOf(MediaType.BOOK, MediaType.EBOOK)
    
    override suspend fun search(
        query: String?,
        isbn: String?,
        title: String?,
        author: String?,
        maxResults: Int
    ): Result<List<MetadataSearchResult>> = withContext(Dispatchers.IO) {
        try {
            val searchQuery = buildSearchQuery(query, isbn, title, author)
            val url = "https://www.goodreads.com/search?q=$searchQuery"
            
            val doc = fetchDocument(url)
            val results = mutableListOf<MetadataSearchResult>()
            
            doc.select("tr[itemtype='http://schema.org/Book']").take(maxResults).forEach { row ->
                val bookTitle = row.select("a.bookTitle span[itemprop=name]").text()
                val bookAuthor = row.select("a.authorName span[itemprop=name]").text()
                val bookLink = row.select("a.bookTitle").attr("href")
                val bookId = extractBookId(bookLink)
                
                val coverImg = row.select("img.bookCover").attr("src")
                
                if (bookId != null && bookTitle.isNotBlank()) {
                    results.add(
                        MetadataSearchResult(
                            sourceId = bookId,
                            title = bookTitle,
                            authors = listOf(bookAuthor),
                            description = null,
                            coverUrl = enhanceCoverUrl(coverImg),
                            isbn = null,
                            publishDate = null,
                            source = sourceName
                        )
                    )
                }
            }
            
            Result.success(results)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    override suspend fun getDetails(sourceId: String): Result<EnhancedMetadata?> = 
        withContext(Dispatchers.IO) {
            try {
                val url = "https://www.goodreads.com/book/show/$sourceId"
                val doc = fetchDocument(url)
                
                val title = doc.select("h1[data-testid='bookTitle']").text()
                    .ifBlank { doc.select("h1.Text__title1").text() }
                
                val authors = doc.select("span[data-testid='name']").map { it.text() }
                    .ifEmpty { doc.select("a.ContributorLink").map { it.text() } }
                
                val description = doc.select("div[data-testid='description'] span").html()
                    .ifBlank { doc.select("div.DetailsLayoutRightParagraph span").html() }
                
                val ratingText = doc.select("div.RatingStatistics__rating").text()
                val rating = ratingText.toFloatOrNull()
                
                val ratingCountText = doc.select("span[data-testid='ratingsCount']").text()
                val ratingCount = ratingCountText.replace(Regex("[^0-9]"), "").toIntOrNull()
                
                val reviewCountText = doc.select("span[data-testid='reviewsCount']").text()
                val reviewCount = reviewCountText.replace(Regex("[^0-9]"), "").toIntOrNull()
                
                val genres = doc.select("div[data-testid='genresList'] a, span.BookPageMetadataSection__genreButton")
                    .map { it.text() }
                    .filter { it.isNotBlank() }
                
                val pageCountText = doc.select("p[data-testid='pagesFormat']").text()
                val pageCount = Regex("(\\d+)\\s+pages").find(pageCountText)
                    ?.groupValues?.get(1)?.toIntOrNull()
                
                val metadata = EnhancedMetadata(
                    title = title,
                    authors = authors,
                    description = description,
                    rating = rating,
                    ratingCount = ratingCount,
                    reviewCount = reviewCount,
                    categories = genres,
                    genres = genres,
                    pageCount = pageCount,
                    sourceId = sourceId,
                    source = sourceName,
                    coverUrl = extractCoverUrl(doc)
                )
                
                Result.success(metadata)
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    
    private suspend fun fetchDocument(url: String): Document {
        val request = Request.Builder()
            .url(url)
            .header("User-Agent", "Mozilla/5.0 (Android)")
            .build()
        
        return httpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                throw Exception("HTTP error: ${response.code}")
            }
            Jsoup.parse(response.body?.string() ?: "")
        }
    }
    
    private fun buildSearchQuery(
        query: String?,
        isbn: String?,
        title: String?,
        author: String?
    ): String {
        return when {
            !query.isNullOrBlank() -> URLEncoder.encode(query, "UTF-8")
            !isbn.isNullOrBlank() -> URLEncoder.encode(isbn, "UTF-8")
            !title.isNullOrBlank() && !author.isNullOrBlank() -> 
                URLEncoder.encode("$title $author", "UTF-8")
            !title.isNullOrBlank() -> URLEncoder.encode(title, "UTF-8")
            !author.isNullOrBlank() -> URLEncoder.encode(author, "UTF-8")
            else -> ""
        }
    }
    
    private fun extractBookId(bookLink: String): String? {
        return Regex("/show/(\\d+)").find(bookLink)?.groupValues?.get(1)
    }
    
    private fun enhanceCoverUrl(coverUrl: String): String {
        // Goodreads serves low-res covers by default
        // Replace size parameter for better quality
        return coverUrl
            .replace("._SX\\d+_".toRegex(), "._SX1000_")
            .replace("._SY\\d+_".toRegex(), "._SY1000_")
    }
    
    private fun extractCoverUrl(doc: Document): String? {
        return doc.select("img.ResponsiveImage").firstOrNull()?.attr("src")
            ?.let { enhanceCoverUrl(it) }
    }
}
