package com.universalmedialibrary.services.comic

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.jsoup.Jsoup
import java.io.File
import java.io.FileOutputStream
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class WebComicScraperService @Inject constructor(
    private val httpClient: OkHttpClient
) {

    suspend fun downloadComicFromUrl(url: String, outputDir: File): Result<File> = withContext(Dispatchers.IO) {
        try {
            val request = Request.Builder()
                .url(url)
                .header("User-Agent", "CleverFerret/1.0")
                .build()

            val html = httpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) throw Exception("Failed to fetch page: ${response.code}")
                response.body?.string() ?: ""
            }

            val doc = Jsoup.parse(html, url)
            val imageUrls = extractImageUrls(url, doc)

            if (imageUrls.isEmpty()) throw Exception("No comic images found on page")

            // Create a CBZ file or directory of images
            // For simplicity, we'll download images to a directory first
            if (!outputDir.exists()) outputDir.mkdirs()

            // Clean filename from URL
            val comicName = url.substringAfterLast("/").filter { it.isLetterOrDigit() || it == '-' || it == '_' }
                .ifEmpty { "comic_${System.currentTimeMillis()}" }
            
            val downloadedFiles = mutableListOf<File>()

            imageUrls.forEachIndexed { index, imageUrl ->
                val imageRequest = Request.Builder().url(imageUrl).build()
                httpClient.newCall(imageRequest).execute().use { response ->
                    if (response.isSuccessful) {
                        val ext = imageUrl.substringAfterLast(".", "jpg").take(3)
                        val file = File(outputDir, "${comicName}_${index + 1}.$ext")
                        FileOutputStream(file).use { output ->
                            response.body?.byteStream()?.copyTo(output)
                        }
                        downloadedFiles.add(file)
                    }
                }
            }
            
            if (downloadedFiles.isEmpty()) throw Exception("Failed to download any images")

            // Return the first file or directory - in a real app we might zip them into a CBZ
            Result.success(downloadedFiles.first())
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    private fun extractImageUrls(url: String, doc: org.jsoup.nodes.Document): List<String> {
        val images = mutableListOf<String>()

        when {
            url.contains("xkcd.com") -> {
                // XKCD: <div id="comic"><img src="..."></div>
                doc.select("#comic img").first()?.absUrl("src")?.let { images.add(it) }
            }
            url.contains("questionablecontent.net") -> {
                // QC: <img id="strip" src="...">
                doc.select("#strip").first()?.absUrl("src")?.let { images.add(it) }
            }
            url.contains("schlockmercenary.com") -> {
                // Schlock Mercenary: <div class="strip-images"><img src="..."></div>
                // Often has multiple images for one strip
                doc.select(".strip-images img").forEach { 
                    it.absUrl("src").takeIf { src -> src.isNotEmpty() }?.let { src -> images.add(src) }
                }
            }
            url.contains("oglaf.com") -> {
                // Oglaf: <img id="strip" src="...">
                doc.select("#strip").first()?.absUrl("src")?.let { images.add(it) }
            }
            else -> {
                // Generic fallback
                // Try Open Graph image
                doc.select("meta[property=og:image]").attr("content").takeIf { it.isNotEmpty() }?.let { 
                    images.add(it) 
                    return images // If OG image found, it's likely the main content
                }

                // Try finding largest image by area (heuristic)
                // This is risky but better than nothing for unknown sites
                // For now, let's stick to known selectors or simple <img> finding if it looks like a comic
                // Look for common comic IDs/Classes
                val commonSelectors = listOf("#comic img", "#strip img", ".comic img", ".strip img", "img#comic", "img#strip")
                for (selector in commonSelectors) {
                    doc.select(selector).first()?.absUrl("src")?.let { 
                        images.add(it)
                        return images
                    }
                }
            }
        }
        return images
    }
}
