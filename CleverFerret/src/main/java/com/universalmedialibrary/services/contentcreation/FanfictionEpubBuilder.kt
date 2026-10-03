package com.universalmedialibrary.services.contentcreation

import org.json.JSONArray
import org.json.JSONObject
import java.io.File
import java.util.zip.CRC32

internal fun parseFicHubStory(meta: JSONObject?, info: String?, url: String): Story {
    val title = meta?.optString("title").takeIf { !it.isNullOrBlank() }
        ?: parseInfoField(info, "Title")
        ?: "Unknown Title"
    val author = meta?.optString("author").takeIf { !it.isNullOrBlank() }
        ?: parseInfoField(info, "Author")
        ?: "Unknown Author"
    val summary = meta?.optString("description").takeIf { !it.isNullOrBlank() }
        ?: meta?.optString("summary").orEmpty()

    val chapterCount = listOf(
        meta?.optInt("chapters", -1),
        meta?.optInt("chapterCount", -1),
        meta?.optInt("numChapters", -1)
    ).firstOrNull { it != null && it > 0 } ?: 0

    val chapters = if (chapterCount > 0) {
        (1..chapterCount).map { Chapter(it, "Chapter $it", "") }
    } else {
        emptyList()
    }

    val metadata = StoryMetadata(
        fandom = meta?.optString("fandom").takeIf { !it.isNullOrBlank() },
        characters = meta?.optJSONArray("characters").toStringList(),
        rating = meta?.optString("rating").takeIf { !it.isNullOrBlank() },
        genre = meta?.optString("genre").takeIf { !it.isNullOrBlank() },
        wordCount = meta?.optInt("words", 0) ?: 0,
        publishDate = meta?.optString("published").takeIf { !it.isNullOrBlank() },
        updateDate = meta?.optString("updated").takeIf { !it.isNullOrBlank() },
        language = meta?.optString("language").takeIf { !it.isNullOrBlank() } ?: "en",
        status = meta?.optString("status").takeIf { !it.isNullOrBlank() }
    )

    return Story(
        title = title,
        author = author,
        summary = summary,
        chapters = chapters,
        metadata = metadata
    )
}

internal fun parseInfoField(info: String?, field: String): String? {
    if (info.isNullOrBlank()) return null
    val regex = Regex("$field:\\s*([^\\n]+)", RegexOption.IGNORE_CASE)
    return regex.find(info)?.groupValues?.getOrNull(1)?.trim()?.takeIf { it.isNotBlank() }
}

internal fun downloadEpub(epubUrl: String, outputFile: File): Boolean {
    return try {
        val request = Request.Builder()
            .url(epubUrl)
            .header("User-Agent", "CleverFerret/1.0 (FicHub)")
            .get()
            .build()
        httpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) return false
            response.body?.byteStream()?.use { input ->
                FileOutputStream(outputFile).use { output ->
                    input.copyTo(output)
                }
            } ?: return false
        }
        true
    } catch (e: Exception) {
        ErrorLogger.logWarning("FanfictionEpubConversionService", "Failed to download FicHub EPUB", e)
        false
    }
}

internal fun fetchFFNetChapter(url: String, chapterNumber: Int): Chapter? {
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
        ErrorLogger.logWarning("FanfictionEpubConversionService", "Error fetching FFNet chapter $chapterNumber", e)
        null
    }
}

internal fun fetchWattpadChapter(url: String, chapterNumber: Int): Chapter? {
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
        ErrorLogger.logWarning("FanfictionEpubConversionService", "Error fetching Wattpad chapter $chapterNumber", e)
        null
    }
}

internal fun fetchRoyalRoadChapter(url: String, chapterNumber: Int): Chapter? {
    return try {
        val doc = Jsoup.connect(url)
            .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")
            .timeout(15000)
            .get()

        val chapterTitle = doc.select("h1.font-white").first()?.text()
            ?: doc.select(".chapter-title").first()?.text()
            ?: "Chapter $chapterNumber"
        val content = doc.select(".chapter-content").first()?.html() ?: ""

        if (content.isEmpty()) {
            return null
        }

        Chapter(
            number = chapterNumber,
            title = chapterTitle,
            content = cleanHtml(content)
        )
    } catch (e: Exception) {
        ErrorLogger.logWarning("FanfictionEpubConversionService", "Error fetching Royal Road chapter $chapterNumber", e)
        null
    }
}

internal fun parseFFNetMetadata(text: String): StoryMetadata {
    val parts = text.split(" - ")
    val commonLanguages = setOf("English", "Spanish", "French", "German", "Italian", "Portuguese", "Russian", "Chinese", "Japanese")
    return StoryMetadata(
        rating = parts.find { it.startsWith("Rated:") }?.removePrefix("Rated: "),
        language = parts.find { 
            (it.matches(Regex("[A-Za-z]+")) && it.length == 2) || it in commonLanguages 
        } ?: "English",
        genre = parts.find { it.contains("/") },
        wordCount = parts.find { it.contains("Words:") }
            ?.replace("Words:", "")
            ?.replace(",", "")
            ?.trim()
            ?.toIntOrNull() ?: 0,
        status = if (text.contains("Complete")) "Complete" else "In Progress"
    )
}

internal fun parseAO3Metadata(doc: org.jsoup.nodes.Document): StoryMetadata {
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

internal fun createEPUB(story: Story, outputFile: File) {
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

internal fun createContainerXml(): String = """<?xml version="1.0" encoding="UTF-8"?>
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

internal fun createContentOPF(story: Story): String {
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

internal fun createTOC(story: Story): String {
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

internal fun createTitlePage(story: Story): String {
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

internal fun createChapterXHTML(chapter: Chapter): String {
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

internal fun createStylesheet(): String = """
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
    doc.select("br").append("\n")
    doc.select("p").prepend("\n\n")

    return doc.html()
}

internal fun cleanHtml(html: String): String {
    val doc = Jsoup.parse(html)
    doc.select("script, style").remove()

    // Convert to clean HTML
    doc.select("br").append("\n")
    doc.select("p").prepend("\n\n")

    return doc.html()
}

internal fun sanitizeFileName(name: String): String {
    return name.replace(Regex("[^a-zA-Z0-9._-]"), "_")
        .take(100) // Limit length
}

internal fun extractStoryId(url: String): String? {
    val pattern = "/s/(\\d+)".toRegex()
    return pattern.find(url)?.groupValues?.get(1)
}

internal fun escapeXml(text: String): String {
    return text
        .replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
        .replace("\"", "&quot;")
        .replace("'", "&apos;")
}

internal fun getCRC32(data: ByteArray): Long {
    val crc = java.util.zip.CRC32()
    crc.update(data)
    return crc.value
}

