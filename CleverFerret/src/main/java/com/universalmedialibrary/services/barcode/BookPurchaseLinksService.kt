package com.universalmedialibrary.services.barcode

import android.content.Context
import android.content.Intent
import androidx.core.net.toUri
import android.net.Uri
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Book Purchase Links Service
 * 
 * Provides purchase links for books scanned via barcode but not yet in the library.
 * Helps users find and purchase digital copies of scanned books.
 */
@Singleton
class BookPurchaseLinksService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    /**
     * Available platforms for purchasing books
     */
    enum class PurchasePlatform(
        val displayName: String,
        val urlTemplate: String,
        val icon: String
    ) {
        AMAZON_KINDLE(
            "Amazon Kindle",
            "https://www.amazon.com/s?k={ISBN}&i=digital-text",
            "🛒"
        ),
        GOOGLE_PLAY_BOOKS(
            "Google Play Books",
            "https://play.google.com/store/search?q={ISBN}&c=books",
            "📚"
        ),
        APPLE_BOOKS(
            "Apple Books",
            "https://books.apple.com/us/search?term={ISBN}",
            "🍎"
        ),
        KOBO(
            "Kobo",
            "https://www.kobo.com/us/en/search?query={ISBN}",
            "📖"
        ),
        BARNES_NOBLE(
            "Barnes & Noble",
            "https://www.barnesandnoble.com/s/{ISBN}",
            "🏪"
        ),
        GOODREADS(
            "Goodreads",
            "https://www.goodreads.com/search?q={ISBN}",
            "📗"
        ),
        OPEN_LIBRARY(
            "Open Library",
            "https://openlibrary.org/isbn/{ISBN}",
            "📕"
        ),
        INTERNET_ARCHIVE(
            "Internet Archive",
            "https://archive.org/search.php?query={ISBN}",
            "🗄️"
        ),
        PROJECT_GUTENBERG(
            "Project Gutenberg",
            "https://www.gutenberg.org/ebooks/search/?query={TITLE}",
            "📘"
        )
    }
    
    /**
     * Purchase link data
     */
    data class PurchaseLink(
        val platform: PurchasePlatform,
        val url: String,
        val displayName: String
    )
    
    /**
     * Get all available purchase links for a book
     * 
     * @param isbn ISBN-10 or ISBN-13
     * @param title Optional book title for better search results
     * @return List of purchase links
     */
    fun getPurchaseLinks(isbn: String?, title: String? = null): List<PurchaseLink> {
        val links = mutableListOf<PurchaseLink>()
        
        if (isbn != null && isbn.isNotBlank()) {
            // Add ISBN-based links
            links.addAll(
                listOf(
                    PurchasePlatform.AMAZON_KINDLE,
                    PurchasePlatform.GOOGLE_PLAY_BOOKS,
                    PurchasePlatform.APPLE_BOOKS,
                    PurchasePlatform.KOBO,
                    PurchasePlatform.BARNES_NOBLE,
                    PurchasePlatform.GOODREADS,
                    PurchasePlatform.OPEN_LIBRARY,
                    PurchasePlatform.INTERNET_ARCHIVE
                ).map { platform ->
                    PurchaseLink(
                        platform = platform,
                        url = platform.urlTemplate.replace("{ISBN}", isbn),
                        displayName = "${platform.icon} ${platform.displayName}"
                    )
                }
            )
        }
        
        if (title != null && title.isNotBlank()) {
            // Add title-based search for platforms like Project Gutenberg
            links.add(
                PurchaseLink(
                    platform = PurchasePlatform.PROJECT_GUTENBERG,
                    url = PurchasePlatform.PROJECT_GUTENBERG.urlTemplate
                        .replace("{TITLE}", Uri.encode(title)),
                    displayName = "${PurchasePlatform.PROJECT_GUTENBERG.icon} ${PurchasePlatform.PROJECT_GUTENBERG.displayName}"
                )
            )
        }
        
        return links
    }
    
    /**
     * Get free/open source platforms only
     */
    fun getFreeSourceLinks(isbn: String?, title: String?): List<PurchaseLink> {
        val freePlatforms = setOf(
            PurchasePlatform.OPEN_LIBRARY,
            PurchasePlatform.INTERNET_ARCHIVE,
            PurchasePlatform.PROJECT_GUTENBERG
        )
        
        return getPurchaseLinks(isbn, title).filter { 
            it.platform in freePlatforms 
        }
    }
    
    /**
     * Get commercial platforms only
     */
    fun getCommercialLinks(isbn: String?): List<PurchaseLink> {
        val commercialPlatforms = setOf(
            PurchasePlatform.AMAZON_KINDLE,
            PurchasePlatform.GOOGLE_PLAY_BOOKS,
            PurchasePlatform.APPLE_BOOKS,
            PurchasePlatform.KOBO,
            PurchasePlatform.BARNES_NOBLE
        )
        
        return getPurchaseLinks(isbn).filter { 
            it.platform in commercialPlatforms 
        }
    }
    
    /**
     * Open a purchase link in the browser
     * 
     * @param link The purchase link to open
     */
    fun openPurchaseLink(link: PurchaseLink) {
        val intent = Intent(Intent.ACTION_VIEW, link.url.toUri()).apply {
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
        context.startActivity(intent)
    }
    
    /**
     * Create a share intent for the purchase link
     */
    fun createShareIntent(link: PurchaseLink, bookTitle: String?): Intent {
        val shareText = if (bookTitle != null) {
            "Check out \"$bookTitle\" on ${link.platform.displayName}: ${link.url}"
        } else {
            "Check out this book on ${link.platform.displayName}: ${link.url}"
        }
        
        return Intent(Intent.ACTION_SEND).apply {
            type = "text/plain"
            putExtra(Intent.EXTRA_TEXT, shareText)
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
    }
}
