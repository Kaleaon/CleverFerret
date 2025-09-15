package com.universalmedialibrary.services.contentcreation

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import java.io.File
import java.io.FileOutputStream
import java.text.SimpleDateFormat
import java.util.*
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for converting news articles to EPUB format
 */
@Singleton
class NewsToEPUBConverter @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    data class NewsSource(
        val name: String,
        val url: String,
        val selector: String, // CSS selector for article content
        val titleSelector: String,
        val authorSelector: String? = null,
        val dateSelector: String? = null
    )
    
    data class Article(
        val title: String,
        val content: String,
        val author: String? = null,
        val publishDate: String? = null,
        val url: String
    )
    
    // Predefined news sources with their selectors
    private val newsSources = listOf(
        NewsSource(
            name = "BBC News",
            url = "https://www.bbc.com/news",
            selector = "article[role='main']",
            titleSelector = "h1",
            authorSelector = ".ssrcss-68pt20-Text-TextContributorName",
            dateSelector = "time"
        ),
        NewsSource(
            name = "Reuters",
            url = "https://www.reuters.com",
            selector = "div[class*='article-body']",
            titleSelector = "h1",
            authorSelector = "a[class*='author']",
            dateSelector = "time"
        ),
        NewsSource(
            name = "TechCrunch",
            url = "https://techcrunch.com",
            selector = "div.content",
            titleSelector = "h1.article__title",
            authorSelector = "a.article__byline__author",
            dateSelector = "time.article__byline__date"
        )
    )
    
    /**
     * Fetch and convert news articles to EPUB
     */
    suspend fun convertNewsToEPUB(
        sourceUrl: String,
        articleLimit: Int = 10,
        outputFileName: String? = null
    ): File? = withContext(Dispatchers.IO) {
        try {
            val articles = fetchArticles(sourceUrl, articleLimit)
            if (articles.isEmpty()) {
                return@withContext null
            }
            
            val fileName = outputFileName ?: "news_${System.currentTimeMillis()}.epub"
            val outputFile = File(context.filesDir, fileName)
            
            createEPUB(articles, outputFile)
            
            outputFile
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }
    
    /**
     * Fetch articles from a news source
     */
    private suspend fun fetchArticles(
        sourceUrl: String,
        limit: Int
    ): List<Article> = withContext(Dispatchers.IO) {
        val articles = mutableListOf<Article>()
        
        try {
            val doc = Jsoup.connect(sourceUrl)
                .userAgent("Mozilla/5.0")
                .timeout(10000)
                .get()
            
            // Find article links
            val articleLinks = doc.select("a[href*='/news/'], a[href*='/article/']")
                .map { it.attr("abs:href") }
                .distinct()
                .take(limit)
            
            // Fetch each article
            articleLinks.forEach { link ->
                try {
                    val article = fetchArticle(link)
                    if (article != null) {
                        articles.add(article)
                    }
                } catch (e: Exception) {
                    // Skip failed articles
                }
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
        
        articles
    }
    
    /**
     * Fetch a single article
     */
    private fun fetchArticle(url: String): Article? {
        return try {
            val doc = Jsoup.connect(url)
                .userAgent("Mozilla/5.0")
                .timeout(10000)
                .get()
            
            // Extract title
            val title = doc.select("h1").first()?.text() ?: "Untitled"
            
            // Extract main content
            val contentSelectors = listOf(
                "article", 
                "main", 
                "[role='main']",
                ".article-content",
                ".post-content",
                ".entry-content"
            )
            
            var content = ""
            for (selector in contentSelectors) {
                val element = doc.select(selector).first()
                if (element != null) {
                    // Clean up content
                    element.select("script, style, nav, aside, .advertisement").remove()
                    content = element.text()
                    break
                }
            }
            
            if (content.isEmpty()) {
                content = doc.select("p").joinToString("\n\n") { it.text() }
            }
            
            // Extract author
            val author = doc.select("[rel='author'], .author, .byline").first()?.text()
            
            // Extract date
            val date = doc.select("time, .date, .published").first()?.text()
            
            Article(
                title = title,
                content = content,
                author = author,
                publishDate = date,
                url = url
            )
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Create EPUB file from articles
     */
    private fun createEPUB(articles: List<Article>, outputFile: File) {
        ZipOutputStream(FileOutputStream(outputFile)).use { zip ->
            // Add mimetype (must be first and uncompressed)
            zip.setMethod(ZipEntry.STORED)
            val mimetypeEntry = ZipEntry("mimetype")
            mimetypeEntry.size = 20
            mimetypeEntry.compressedSize = 20
            mimetypeEntry.crc = 0x2CAB616F // CRC for "application/epub+zip"
            zip.putNextEntry(mimetypeEntry)
            zip.write("application/epub+zip".toByteArray())
            zip.closeEntry()
            
            // Switch to compressed for other files
            zip.setMethod(ZipEntry.DEFLATED)
            
            // Add META-INF/container.xml
            zip.putNextEntry(ZipEntry("META-INF/container.xml"))
            zip.write(createContainerXml().toByteArray())
            zip.closeEntry()
            
            // Add content.opf
            zip.putNextEntry(ZipEntry("OEBPS/content.opf"))
            zip.write(createContentOPF(articles).toByteArray())
            zip.closeEntry()
            
            // Add toc.ncx
            zip.putNextEntry(ZipEntry("OEBPS/toc.ncx"))
            zip.write(createTOC(articles).toByteArray())
            zip.closeEntry()
            
            // Add cover page
            zip.putNextEntry(ZipEntry("OEBPS/cover.xhtml"))
            zip.write(createCoverPage().toByteArray())
            zip.closeEntry()
            
            // Add each article as a chapter
            articles.forEachIndexed { index, article ->
                zip.putNextEntry(ZipEntry("OEBPS/chapter${index + 1}.xhtml"))
                zip.write(createChapterXHTML(article, index + 1).toByteArray())
                zip.closeEntry()
            }
            
            // Add stylesheet
            zip.putNextEntry(ZipEntry("OEBPS/style.css"))
            zip.write(createStylesheet().toByteArray())
            zip.closeEntry()
        }
    }
    
    private fun createContainerXml(): String = """<?xml version="1.0" encoding="UTF-8"?>
<container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
    <rootfiles>
        <rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/>
    </rootfiles>
</container>"""
    
    private fun createContentOPF(articles: List<Article>): String {
        val dateFormat = SimpleDateFormat("yyyy-MM-dd", Locale.US)
        val date = dateFormat.format(Date())
        
        val manifest = StringBuilder()
        val spine = StringBuilder()
        
        manifest.append("""<item id="ncx" href="toc.ncx" media-type="application/x-dtbncx+xml"/>
        <item id="cover" href="cover.xhtml" media-type="application/xhtml+xml"/>
        <item id="style" href="style.css" media-type="text/css"/>""")
        
        spine.append("""<itemref idref="cover"/>""")
        
        articles.forEachIndexed { index, _ ->
            val chapterId = "chapter${index + 1}"
            manifest.append("""
        <item id="$chapterId" href="$chapterId.xhtml" media-type="application/xhtml+xml"/>""")
            spine.append("""
        <itemref idref="$chapterId"/>""")
        }
        
        return """<?xml version="1.0" encoding="UTF-8"?>
<package xmlns="http://www.idpf.org/2007/opf" unique-identifier="uid" version="2.0">
    <metadata xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:opf="http://www.idpf.org/2007/opf">
        <dc:title>News Collection - $date</dc:title>
        <dc:creator>CleverFerret News Aggregator</dc:creator>
        <dc:language>en</dc:language>
        <dc:identifier id="uid">news-${System.currentTimeMillis()}</dc:identifier>
        <dc:date>$date</dc:date>
        <meta name="cover" content="cover-image"/>
    </metadata>
    <manifest>
        $manifest
    </manifest>
    <spine toc="ncx">
        $spine
    </spine>
</package>"""
    }
    
    private fun createTOC(articles: List<Article>): String {
        val navPoints = StringBuilder()
        
        navPoints.append("""
        <navPoint id="navpoint-1" playOrder="1">
            <navLabel><text>Cover</text></navLabel>
            <content src="cover.xhtml"/>
        </navPoint>""")
        
        articles.forEachIndexed { index, article ->
            navPoints.append("""
        <navPoint id="navpoint-${index + 2}" playOrder="${index + 2}">
            <navLabel><text>${article.title}</text></navLabel>
            <content src="chapter${index + 1}.xhtml"/>
        </navPoint>""")
        }
        
        return """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE ncx PUBLIC "-//NISO//DTD ncx 2005-1//EN" "http://www.daisy.org/z3986/2005/ncx-2005-1.dtd">
<ncx xmlns="http://www.daisy.org/z3986/2005/ncx/" version="2005-1">
    <head>
        <meta name="dtb:uid" content="news-${System.currentTimeMillis()}"/>
        <meta name="dtb:depth" content="1"/>
        <meta name="dtb:totalPageCount" content="0"/>
        <meta name="dtb:maxPageNumber" content="0"/>
    </head>
    <docTitle>
        <text>News Collection</text>
    </docTitle>
    <navMap>
        $navPoints
    </navMap>
</ncx>"""
    }
    
    private fun createCoverPage(): String {
        val dateFormat = SimpleDateFormat("MMMM dd, yyyy", Locale.US)
        val date = dateFormat.format(Date())
        
        return """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>News Collection</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
    <div class="cover">
        <h1>News Collection</h1>
        <h2>$date</h2>
        <p>Curated by CleverFerret</p>
    </div>
</body>
</html>"""
    }
    
    private fun createChapterXHTML(article: Article, chapterNum: Int): String {
        val content = article.content
            .split("\n")
            .filter { it.isNotBlank() }
            .joinToString("") { "<p>$it</p>" }
        
        return """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>${article.title}</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
    <div class="chapter">
        <h1>${article.title}</h1>
        ${article.author?.let { "<p class=\"author\">By $it</p>" } ?: ""}
        ${article.publishDate?.let { "<p class=\"date\">$it</p>" } ?: ""}
        <p class=\"source\">Source: ${article.url}</p>
        <hr/>
        $content
    </div>
</body>
</html>"""
    }
    
    private fun createStylesheet(): String = """
body {
    font-family: Georgia, serif;
    line-height: 1.6;
    margin: 1em;
}

h1 {
    font-size: 1.5em;
    margin-bottom: 0.5em;
    color: #333;
}

h2 {
    font-size: 1.2em;
    color: #666;
}

p {
    margin: 1em 0;
    text-align: justify;
}

.cover {
    text-align: center;
    padding: 3em 0;
}

.cover h1 {
    font-size: 2em;
    margin-bottom: 0.5em;
}

.author {
    font-style: italic;
    color: #666;
}

.date {
    color: #999;
    font-size: 0.9em;
}

.source {
    color: #999;
    font-size: 0.8em;
    margin-bottom: 2em;
}

hr {
    border: none;
    border-top: 1px solid #ccc;
    margin: 2em 0;
}
"""
}