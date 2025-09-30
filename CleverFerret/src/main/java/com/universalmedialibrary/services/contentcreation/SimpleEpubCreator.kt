package com.universalmedialibrary.services.contentcreation

import java.io.File
import java.io.FileOutputStream
import java.io.InputStream
import java.io.OutputStream
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
import java.text.SimpleDateFormat
import java.util.*

/**
 * Simple EPUB creator for generating valid EPUB files
 *
 * This creates minimal but valid EPUB files following the EPUB 3.0 specification
 */
class SimpleEpubCreator {

    data class Chapter(
        val title: String,
        val content: String,
        val id: String = title.replace(Regex("[^a-zA-Z0-9]"), "_").lowercase()
    )

    data class EpubMetadata(
        val title: String,
        val author: String,
        val description: String = "",
        val language: String = "en",
        val publisher: String = "CleverFerret",
        val date: String = SimpleDateFormat("yyyy-MM-dd", Locale.US).format(Date()),
        val identifier: String = "urn:uuid:${UUID.randomUUID()}"
    )

    fun createEpub(outputFile: File, metadata: EpubMetadata, chapters: List<Chapter>) {
        ZipOutputStream(FileOutputStream(outputFile)).use { zip ->
            // 1. Add mimetype (must be first and uncompressed)
            addMimetype(zip)

            // 2. Add META-INF/container.xml
            addContainerXml(zip)

            // 3. Add content.opf (package document)
            addContentOpf(zip, metadata, chapters)

            // 4. Add toc.ncx (navigation)
            addTocNcx(zip, metadata, chapters)

            // 5. Add toc.xhtml (EPUB 3 navigation)
            addTocXhtml(zip, chapters)

            // 6. Add CSS stylesheet
            addStylesheet(zip)

            // 7. Add chapters
            chapters.forEach { chapter ->
                addChapter(zip, chapter)
            }
        }
    }

    private fun addMimetype(zip: ZipOutputStream) {
        val entry = ZipEntry("mimetype")
        entry.method = ZipEntry.STORED
        entry.size = 20
        entry.crc = 0x2CAB616F // Pre-calculated CRC for "application/epub+zip"
        zip.putNextEntry(entry)
        zip.write("application/epub+zip".toByteArray())
        zip.closeEntry()
    }

    private fun addContainerXml(zip: ZipOutputStream) {
        val containerXml = """<?xml version="1.0" encoding="UTF-8"?>
<container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
  <rootfiles>
    <rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/>
  </rootfiles>
</container>"""

        zip.putNextEntry(ZipEntry("META-INF/container.xml"))
        zip.write(containerXml.toByteArray())
        zip.closeEntry()
    }

    private fun addContentOpf(zip: ZipOutputStream, metadata: EpubMetadata, chapters: List<Chapter>) {
        val manifest = chapters.joinToString("\n    ") { chapter ->
            """<item id="${chapter.id}" href="${chapter.id}.xhtml" media-type="application/xhtml+xml"/>"""
        }

        val spine = chapters.joinToString("\n    ") { chapter ->
            """<itemref idref="${chapter.id}"/>"""
        }

        val contentOpf = """<?xml version="1.0" encoding="UTF-8"?>
<package version="3.0" xmlns="http://www.idpf.org/2007/opf" unique-identifier="uid">
  <metadata xmlns:dc="http://purl.org/dc/elements/1.1/">
    <dc:identifier id="uid">${metadata.identifier}</dc:identifier>
    <dc:title>${escapeXml(metadata.title)}</dc:title>
    <dc:creator>${escapeXml(metadata.author)}</dc:creator>
    <dc:language>${metadata.language}</dc:language>
    <dc:publisher>${escapeXml(metadata.publisher)}</dc:publisher>
    <dc:date>${metadata.date}</dc:date>
    <dc:description>${escapeXml(metadata.description)}</dc:description>
    <meta property="dcterms:modified">${SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.US).apply { timeZone = TimeZone.getTimeZone("UTC") }.format(Date())}</meta>
  </metadata>
  <manifest>
    <item id="ncx" href="toc.ncx" media-type="application/x-dtbncx+xml"/>
    <item id="nav" href="nav.xhtml" media-type="application/xhtml+xml" properties="nav"/>
    <item id="css" href="stylesheet.css" media-type="text/css"/>
    $manifest
  </manifest>
  <spine toc="ncx">
    <itemref idref="nav"/>
    $spine
  </spine>
  <guide>
    <reference type="toc" title="Table of Contents" href="nav.xhtml"/>
  </guide>
</package>"""

        zip.putNextEntry(ZipEntry("OEBPS/content.opf"))
        zip.write(contentOpf.toByteArray())
        zip.closeEntry()
    }

    private fun addTocNcx(zip: ZipOutputStream, metadata: EpubMetadata, chapters: List<Chapter>) {
        val navPoints = chapters.mapIndexed { index, chapter ->
            """
    <navPoint id="navpoint-${index + 1}" playOrder="${index + 1}">
      <navLabel>
        <text>${escapeXml(chapter.title)}</text>
      </navLabel>
      <content src="${chapter.id}.xhtml"/>
    </navPoint>"""
        }.joinToString("")

        val tocNcx = """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE ncx PUBLIC "-//NISO//DTD ncx 2005-1//EN" "http://www.daisy.org/z3986/2005/ncx-2005-1.dtd">
<ncx version="2005-1" xmlns="http://www.daisy.org/z3986/2005/ncx/">
  <head>
    <meta name="dtb:uid" content="${metadata.identifier}"/>
    <meta name="dtb:depth" content="1"/>
    <meta name="dtb:totalPageCount" content="0"/>
    <meta name="dtb:maxPageNumber" content="0"/>
  </head>
  <docTitle>
    <text>${escapeXml(metadata.title)}</text>
  </docTitle>
  <navMap>$navPoints
  </navMap>
</ncx>"""

        zip.putNextEntry(ZipEntry("OEBPS/toc.ncx"))
        zip.write(tocNcx.toByteArray())
        zip.closeEntry()
    }

    private fun addTocXhtml(zip: ZipOutputStream, chapters: List<Chapter>) {
        val tocItems = chapters.joinToString("\n        ") { chapter ->
            """<li><a href="${chapter.id}.xhtml">${escapeXml(chapter.title)}</a></li>"""
        }

        val tocXhtml = """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops">
<head>
  <title>Table of Contents</title>
  <meta charset="utf-8"/>
  <link rel="stylesheet" type="text/css" href="stylesheet.css"/>
</head>
<body>
  <nav epub:type="toc">
    <h1>Table of Contents</h1>
    <ol>
      $tocItems
    </ol>
  </nav>
</body>
</html>"""

        zip.putNextEntry(ZipEntry("OEBPS/nav.xhtml"))
        zip.write(tocXhtml.toByteArray())
        zip.closeEntry()
    }

    private fun addStylesheet(zip: ZipOutputStream) {
        val css = """body {
  font-family: serif;
  line-height: 1.6;
  margin: 2em;
}

h1, h2, h3, h4, h5, h6 {
  font-family: sans-serif;
  color: #333;
  margin-top: 1.5em;
  margin-bottom: 0.5em;
}

p {
  margin: 1em 0;
  text-align: justify;
}

nav ol {
  list-style-type: none;
  padding-left: 0;
}

nav li {
  margin: 0.5em 0;
}

nav a {
  text-decoration: none;
  color: #0066cc;
}

nav a:hover {
  text-decoration: underline;
}

hr {
  border: none;
  border-top: 1px solid #ccc;
  margin: 2em 0;
}

.source-info {
  font-style: italic;
  font-size: 0.9em;
  color: #666;
  margin-bottom: 2em;
  padding-bottom: 1em;
  border-bottom: 1px solid #eee;
}

.chapter-title {
  font-size: 1.5em;
  margin-bottom: 1em;
  padding-bottom: 0.5em;
  border-bottom: 2px solid #333;
}"""

        zip.putNextEntry(ZipEntry("OEBPS/stylesheet.css"))
        zip.write(css.toByteArray())
        zip.closeEntry()
    }

    private fun addChapter(zip: ZipOutputStream, chapter: Chapter) {
        val chapterXhtml = """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>${escapeXml(chapter.title)}</title>
  <meta charset="utf-8"/>
  <link rel="stylesheet" type="text/css" href="stylesheet.css"/>
</head>
<body>
  <h1 class="chapter-title">${escapeXml(chapter.title)}</h1>
  ${chapter.content}
</body>
</html>"""

        zip.putNextEntry(ZipEntry("OEBPS/${chapter.id}.xhtml"))
        zip.write(chapterXhtml.toByteArray())
        zip.closeEntry()
    }

    private fun escapeXml(text: String): String {
        return text
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&apos;")
    }
}
