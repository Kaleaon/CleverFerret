package com.universalmedialibrary.services.contentcreation

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import java.io.File
import java.io.FileOutputStream
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for converting fanfiction stories to EPUB format
 * Supports multiple fanfiction platforms
 */
@Singleton
class FanfictionToEPUBConverter @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    data class Story(
        val title: String,
        val author: String,
        val summary: String,
        val chapters: List<Chapter>,
        val metadata: StoryMetadata
    )
    
    data class Chapter(
        val number: Int,
        val title: String,
        val content: String
    )
    
    data class StoryMetadata(
        val fandom: String? = null,
        val characters: List<String> = emptyList(),
        val rating: String? = null,
        val genre: String? = null,
        val wordCount: Int = 0,
        val publishDate: String? = null,
        val updateDate: String? = null,
        val language: String = "en",
        val status: String? = null
    )
    
    enum class FanfictionSite(val domain: String) {
        FANFICTION_NET("fanfiction.net"),
        ARCHIVE_OF_OUR_OWN("archiveofourown.org"),
        WATTPAD("wattpad.com");
        
        companion object {
            fun fromUrl(url: String): FanfictionSite? {
                return values().find { url.contains(it.domain) }
            }
        }
    }
    
    /**
     * Convert a fanfiction story URL to EPUB
     */
    suspend fun convertStoryToEPUB(
        storyUrl: String,
        outputFileName: String? = null
    ): File? = withContext(Dispatchers.IO) {
        try {
            val site = FanfictionSite.fromUrl(storyUrl)
            if (site == null) {
                return@withContext null
            }
            
            val story = when (site) {
                FanfictionSite.FANFICTION_NET -> fetchFFNetStory(storyUrl)
                FanfictionSite.ARCHIVE_OF_OUR_OWN -> fetchAO3Story(storyUrl)
                FanfictionSite.WATTPAD -> fetchWattpadStory(storyUrl)
            }
            
            if (story == null) {
                return@withContext null
            }
            
            val fileName = outputFileName ?: "${sanitizeFileName(story.title)}.epub"
            val outputFile = File(context.filesDir, fileName)
            
            createEPUB(story, outputFile)
            
            outputFile
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }
    
    /**
     * Fetch story from FanFiction.Net
     */
    private suspend fun fetchFFNetStory(url: String): Story? = withContext(Dispatchers.IO) {
        try {
            val doc = Jsoup.connect(url)
                .userAgent("Mozilla/5.0")
                .timeout(15000)
                .get()
            
            // Extract story info
            val title = doc.select("#profile_top b.xcontrast_txt").first()?.text() ?: "Unknown Title"
            val author = doc.select("#profile_top a[href^='/u/']").first()?.text() ?: "Unknown Author"
            val summary = doc.select("#profile_top div.xcontrast_txt").first()?.text() ?: ""
            
            // Extract metadata
            val metadataText = doc.select("#profile_top span.xgray").text()
            val metadata = parseFFNetMetadata(metadataText)
            
            // Get chapter count
            val chapterSelect = doc.select("select#chap_select").first()
            val chapterCount = chapterSelect?.select("option")?.size ?: 1
            
            // Fetch all chapters
            val chapters = mutableListOf<Chapter>()
            val storyId = extractStoryId(url)
            
            for (i in 1..chapterCount) {
                val chapterUrl = if (i == 1) url else url.replace("/s/$storyId/\\d+/".toRegex(), "/s/$storyId/$i/")
                val chapter = fetchFFNetChapter(chapterUrl, i)
                if (chapter != null) {
                    chapters.add(chapter)
                }
            }
            
            Story(
                title = title,
                author = author,
                summary = summary,
                chapters = chapters,
                metadata = metadata
            )
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }
    
    /**
     * Fetch a single chapter from FanFiction.Net
     */
    private fun fetchFFNetChapter(url: String, chapterNumber: Int): Chapter? {
        return try {
            val doc = Jsoup.connect(url)
                .userAgent("Mozilla/5.0")
                .timeout(15000)
                .get()
            
            val chapterTitle = doc.select("select#chap_select option[selected]").first()?.text()
                ?: "Chapter $chapterNumber"
            
            val content = doc.select("#storytext").first()?.html() ?: ""
            
            Chapter(
                number = chapterNumber,
                title = chapterTitle,
                content = cleanHtml(content)
            )
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Fetch story from Archive of Our Own
     */
    private suspend fun fetchAO3Story(url: String): Story? = withContext(Dispatchers.IO) {
        try {
            // Ensure we have the full work URL
            val fullUrl = if (url.contains("?view_full_work=true")) {
                url
            } else {
                "$url?view_full_work=true"
            }
            
            val doc = Jsoup.connect(fullUrl)
                .userAgent("Mozilla/5.0")
                .timeout(15000)
                .get()
            
            // Extract story info
            val title = doc.select("h2.title").first()?.text() ?: "Unknown Title"
            val author = doc.select("a[rel='author']").first()?.text() ?: "Unknown Author"
            val summary = doc.select(".summary blockquote").first()?.text() ?: ""
            
            // Extract metadata
            val metadata = parseAO3Metadata(doc)
            
            // Extract chapters
            val chapters = mutableListOf<Chapter>()
            val chapterDivs = doc.select("div.chapter")
            
            if (chapterDivs.isEmpty()) {
                // Single chapter work
                val content = doc.select("div.userstuff").first()?.html() ?: ""
                chapters.add(Chapter(
                    number = 1,
                    title = title,
                    content = cleanHtml(content)
                ))
            } else {
                // Multi-chapter work
                chapterDivs.forEachIndexed { index, chapterDiv ->
                    val chapterTitle = chapterDiv.select("h3.title a").first()?.text()
                        ?: "Chapter ${index + 1}"
                    val content = chapterDiv.select("div.userstuff").first()?.html() ?: ""
                    
                    chapters.add(Chapter(
                        number = index + 1,
                        title = chapterTitle,
                        content = cleanHtml(content)
                    ))
                }
            }
            
            Story(
                title = title,
                author = author,
                summary = summary,
                chapters = chapters,
                metadata = metadata
            )
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }
    
    /**
     * Fetch story from Wattpad
     */
    private suspend fun fetchWattpadStory(url: String): Story? = withContext(Dispatchers.IO) {
        try {
            val doc = Jsoup.connect(url)
                .userAgent("Mozilla/5.0")
                .timeout(15000)
                .get()
            
            // Extract story info
            val title = doc.select("h1").first()?.text() ?: "Unknown Title"
            val author = doc.select("a.username").first()?.text() ?: "Unknown Author"
            val summary = doc.select(".description-text").first()?.text() ?: ""
            
            // Get chapter links
            val chapterLinks = doc.select("a.story-part__link")
            val chapters = mutableListOf<Chapter>()
            
            chapterLinks.forEachIndexed { index, link ->
                val chapterUrl = "https://www.wattpad.com" + link.attr("href")
                val chapter = fetchWattpadChapter(chapterUrl, index + 1)
                if (chapter != null) {
                    chapters.add(chapter)
                }
            }
            
            Story(
                title = title,
                author = author,
                summary = summary,
                chapters = chapters,
                metadata = StoryMetadata()
            )
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }
    
    /**
     * Fetch a single chapter from Wattpad
     */
    private fun fetchWattpadChapter(url: String, chapterNumber: Int): Chapter? {
        return try {
            val doc = Jsoup.connect(url)
                .userAgent("Mozilla/5.0")
                .timeout(15000)
                .get()
            
            val chapterTitle = doc.select("h2").first()?.text() ?: "Chapter $chapterNumber"
            val content = doc.select("pre").first()?.html() ?: ""
            
            Chapter(
                number = chapterNumber,
                title = chapterTitle,
                content = cleanHtml(content)
            )
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Parse FanFiction.Net metadata
     */
    private fun parseFFNetMetadata(text: String): StoryMetadata {
        val parts = text.split(" - ")
        return StoryMetadata(
            rating = parts.find { it.startsWith("Rated:") }?.removePrefix("Rated: "),
            language = parts.find { it.matches(Regex("[A-Za-z]+")) && it.length == 2 || it == "English" } ?: "English",
            genre = parts.find { it.contains("/") },
            wordCount = parts.find { it.contains("Words:") }
                ?.replace("Words:", "")
                ?.replace(",", "")
                ?.trim()
                ?.toIntOrNull() ?: 0,
            status = if (text.contains("Complete")) "Complete" else "In Progress"
        )
    }
    
    /**
     * Parse Archive of Our Own metadata
     */
    private fun parseAO3Metadata(doc: org.jsoup.nodes.Document): StoryMetadata {
        val tags = doc.select("dd.fandom a").map { it.text() }
        val characters = doc.select("dd.character a").map { it.text() }
        val rating = doc.select("dd.rating").text()
        val wordCount = doc.select("dd.words").text().replace(",", "").toIntOrNull() ?: 0
        val status = doc.select("dd.status").text()
        
        return StoryMetadata(
            fandom = tags.firstOrNull(),
            characters = characters,
            rating = rating,
            wordCount = wordCount,
            status = status
        )
    }
    
    /**
     * Create EPUB file from story
     */
    private fun createEPUB(story: Story, outputFile: File) {
        ZipOutputStream(FileOutputStream(outputFile)).use { zip ->
            // Add mimetype (must be first and uncompressed)
            zip.setMethod(ZipEntry.STORED)
            val mimetypeEntry = ZipEntry("mimetype")
            val mimetypeContent = "application/epub+zip"
            mimetypeEntry.size = mimetypeContent.length.toLong()
            mimetypeEntry.compressedSize = mimetypeContent.length.toLong()
            mimetypeEntry.crc = getCRC32(mimetypeContent.toByteArray())
            zip.putNextEntry(mimetypeEntry)
            zip.write(mimetypeContent.toByteArray())
            zip.closeEntry()
            
            // Switch to compressed for other files
            zip.setMethod(ZipEntry.DEFLATED)
            
            // Add META-INF/container.xml
            zip.putNextEntry(ZipEntry("META-INF/container.xml"))
            zip.write(createContainerXml().toByteArray())
            zip.closeEntry()
            
            // Add content.opf
            zip.putNextEntry(ZipEntry("OEBPS/content.opf"))
            zip.write(createContentOPF(story).toByteArray())
            zip.closeEntry()
            
            // Add toc.ncx
            zip.putNextEntry(ZipEntry("OEBPS/toc.ncx"))
            zip.write(createTOC(story).toByteArray())
            zip.closeEntry()
            
            // Add title page
            zip.putNextEntry(ZipEntry("OEBPS/title.xhtml"))
            zip.write(createTitlePage(story).toByteArray())
            zip.closeEntry()
            
            // Add each chapter
            story.chapters.forEach { chapter ->
                zip.putNextEntry(ZipEntry("OEBPS/chapter${chapter.number}.xhtml"))
                zip.write(createChapterXHTML(chapter).toByteArray())
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
    
    private fun createContentOPF(story: Story): String {
        val manifest = StringBuilder()
        val spine = StringBuilder()
        
        manifest.append("""
        <item id="ncx" href="toc.ncx" media-type="application/x-dtbncx+xml"/>
        <item id="title" href="title.xhtml" media-type="application/xhtml+xml"/>
        <item id="style" href="style.css" media-type="text/css"/>""")
        
        spine.append("""<itemref idref="title"/>""")
        
        story.chapters.forEach { chapter ->
            val chapterId = "chapter${chapter.number}"
            manifest.append("""
        <item id="$chapterId" href="$chapterId.xhtml" media-type="application/xhtml+xml"/>""")
            spine.append("""
        <itemref idref="$chapterId"/>""")
        }
        
        return """<?xml version="1.0" encoding="UTF-8"?>
<package xmlns="http://www.idpf.org/2007/opf" unique-identifier="uid" version="2.0">
    <metadata xmlns:dc="http://purl.org/dc/elements/1.1/">
        <dc:title>${escapeXml(story.title)}</dc:title>
        <dc:creator>${escapeXml(story.author)}</dc:creator>
        <dc:language>${story.metadata.language}</dc:language>
        <dc:identifier id="uid">fanfic-${System.currentTimeMillis()}</dc:identifier>
        <dc:description>${escapeXml(story.summary)}</dc:description>
    </metadata>
    <manifest>
        $manifest
    </manifest>
    <spine toc="ncx">
        $spine
    </spine>
</package>"""
    }
    
    private fun createTOC(story: Story): String {
        val navPoints = StringBuilder()
        
        navPoints.append("""
        <navPoint id="navpoint-1" playOrder="1">
            <navLabel><text>Title Page</text></navLabel>
            <content src="title.xhtml"/>
        </navPoint>""")
        
        story.chapters.forEach { chapter ->
            navPoints.append("""
        <navPoint id="navpoint-${chapter.number + 1}" playOrder="${chapter.number + 1}">
            <navLabel><text>${escapeXml(chapter.title)}</text></navLabel>
            <content src="chapter${chapter.number}.xhtml"/>
        </navPoint>""")
        }
        
        return """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE ncx PUBLIC "-//NISO//DTD ncx 2005-1//EN" "http://www.daisy.org/z3986/2005/ncx-2005-1.dtd">
<ncx xmlns="http://www.daisy.org/z3986/2005/ncx/" version="2005-1">
    <head>
        <meta name="dtb:uid" content="fanfic-${System.currentTimeMillis()}"/>
        <meta name="dtb:depth" content="1"/>
    </head>
    <docTitle>
        <text>${escapeXml(story.title)}</text>
    </docTitle>
    <navMap>
        $navPoints
    </navMap>
</ncx>"""
    }
    
    private fun createTitlePage(story: Story): String {
        return """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>${escapeXml(story.title)}</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
    <div class="title-page">
        <h1>${escapeXml(story.title)}</h1>
        <h2>by ${escapeXml(story.author)}</h2>
        ${story.metadata.fandom?.let { "<p class=\"fandom\">Fandom: ${escapeXml(it)}</p>" } ?: ""}
        ${if (story.metadata.characters.isNotEmpty()) "<p class=\"characters\">Characters: ${story.metadata.characters.joinToString(", ")}</p>" else ""}
        ${story.metadata.rating?.let { "<p class=\"rating\">Rating: $it</p>" } ?: ""}
        ${story.metadata.wordCount.let { if (it > 0) "<p class=\"wordcount\">Words: $it</p>" else "" }}
        <hr/>
        <div class="summary">
            <h3>Summary</h3>
            <p>${escapeXml(story.summary)}</p>
        </div>
    </div>
</body>
</html>"""
    }
    
    private fun createChapterXHTML(chapter: Chapter): String {
        return """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>${escapeXml(chapter.title)}</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
    <div class="chapter">
        <h1>${escapeXml(chapter.title)}</h1>
        <div class="chapter-content">
            ${chapter.content}
        </div>
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
}

h2 {
    font-size: 1.2em;
    color: #666;
}

h3 {
    font-size: 1.1em;
    color: #333;
}

p {
    margin: 1em 0;
    text-align: justify;
}

.title-page {
    text-align: center;
    padding: 2em 0;
}

.title-page h1 {
    font-size: 2em;
    margin-bottom: 0.3em;
}

.title-page h2 {
    font-style: italic;
    margin-bottom: 2em;
}

.fandom, .characters, .rating, .wordcount {
    font-size: 0.9em;
    color: #666;
    margin: 0.5em 0;
}

.summary {
    text-align: left;
    margin-top: 2em;
    padding: 1em;
    background: #f5f5f5;
}

.chapter-content {
    margin-top: 2em;
}

hr {
    border: none;
    border-top: 1px solid #ccc;
    margin: 2em 0;
}
"""
    
    private fun cleanHtml(html: String): String {
        val doc = Jsoup.parse(html)
        doc.select("script, style").remove()
        
        // Convert to clean HTML
        doc.select("br").append("\\n")
        doc.select("p").prepend("\\n\\n")
        
        return doc.html()
    }
    
    private fun sanitizeFileName(name: String): String {
        return name.replace(Regex("[^a-zA-Z0-9._-]"), "_")
            .take(100) // Limit length
    }
    
    private fun extractStoryId(url: String): String {
        val pattern = "/s/(\\d+)/".toRegex()
        return pattern.find(url)?.groupValues?.get(1) ?: ""
    }
    
    private fun escapeXml(text: String): String {
        return text
            .replace("&", "&")
            .replace("<", "<")
            .replace(">", ">")
            .replace("\"", "&quot;")
            .replace("'", "&apos;")
    }
    
    private fun getCRC32(data: ByteArray): Long {
        val crc = java.util.zip.CRC32()
        crc.update(data)
        return crc.value
    }
}