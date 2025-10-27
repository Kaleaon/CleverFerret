package com.universalmedialibrary.services.epub

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import java.io.File
import java.io.FileOutputStream
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for creating EPUB files
 */
@Singleton
class EpubCreatorService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    data class EpubChapter(
        val title: String,
        val content: String // HTML content
    )
    
    /**
     * Create an EPUB file for a fanfiction story
     */
    fun createFanfictionEpub(
        title: String,
        author: String,
        chapters: List<EpubChapter>,
        metadata: Map<String, String> = emptyMap(),
        outputPath: String
    ) {
        val outputFile = File(outputPath)
        outputFile.parentFile?.mkdirs()
        
        ZipOutputStream(FileOutputStream(outputFile)).use { zip ->
            // mimetype (must be first and uncompressed)
            zip.setLevel(0)
            zip.putNextEntry(ZipEntry("mimetype"))
            zip.write("application/epub+zip".toByteArray())
            zip.closeEntry()
            zip.setLevel(9)
            
            // META-INF/container.xml
            zip.putNextEntry(ZipEntry("META-INF/container.xml"))
            zip.write(createContainerXml().toByteArray())
            zip.closeEntry()
            
            // OEBPS/content.opf
            zip.putNextEntry(ZipEntry("OEBPS/content.opf"))
            zip.write(createContentOpf(title, author, chapters, metadata).toByteArray())
            zip.closeEntry()
            
            // OEBPS/toc.ncx
            zip.putNextEntry(ZipEntry("OEBPS/toc.ncx"))
            zip.write(createTocNcx(title, chapters).toByteArray())
            zip.closeEntry()
            
            // OEBPS/toc.xhtml (EPUB 3)
            zip.putNextEntry(ZipEntry("OEBPS/toc.xhtml"))
            zip.write(createTocXhtml(title, chapters).toByteArray())
            zip.closeEntry()
            
            // OEBPS/titlepage.xhtml
            zip.putNextEntry(ZipEntry("OEBPS/titlepage.xhtml"))
            zip.write(createTitlePage(title, author, metadata).toByteArray())
            zip.closeEntry()
            
            // OEBPS/chapter files
            chapters.forEachIndexed { index, chapter ->
                zip.putNextEntry(ZipEntry("OEBPS/chapter${index + 1}.xhtml"))
                zip.write(createChapterXhtml(chapter).toByteArray())
                zip.closeEntry()
            }
            
            // OEBPS/stylesheet.css
            zip.putNextEntry(ZipEntry("OEBPS/stylesheet.css"))
            zip.write(createStylesheet().toByteArray())
            zip.closeEntry()
        }
    }
    
    private fun createContainerXml() = """<?xml version="1.0" encoding="UTF-8"?>
<container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
  <rootfiles>
    <rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/>
  </rootfiles>
</container>"""
    
    private fun createContentOpf(
        title: String,
        author: String,
        chapters: List<EpubChapter>,
        metadata: Map<String, String>
    ) = """<?xml version="1.0" encoding="UTF-8"?>
<package xmlns="http://www.idpf.org/2007/opf" version="3.0" unique-identifier="BookID">
  <metadata xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:opf="http://www.idpf.org/2007/opf">
    <dc:title>${escapeXml(title)}</dc:title>
    <dc:creator>${escapeXml(author)}</dc:creator>
    <dc:language>en</dc:language>
    <dc:identifier id="BookID">${java.util.UUID.randomUUID()}</dc:identifier>
    ${metadata.entries.joinToString("\n    ") { 
        "<meta property=\"${it.key}\">${escapeXml(it.value)}</meta>" 
    }}
  </metadata>
  <manifest>
    <item id="toc" href="toc.ncx" media-type="application/x-dtbncx+xml"/>
    <item id="nav" href="toc.xhtml" properties="nav" media-type="application/xhtml+xml"/>
    <item id="titlepage" href="titlepage.xhtml" media-type="application/xhtml+xml"/>
    ${chapters.indices.joinToString("\n    ") { 
        """<item id="chapter${it + 1}" href="chapter${it + 1}.xhtml" media-type="application/xhtml+xml"/>""" 
    }}
    <item id="css" href="stylesheet.css" media-type="text/css"/>
  </manifest>
  <spine toc="toc">
    <itemref idref="titlepage"/>
    ${chapters.indices.joinToString("\n    ") { 
        """<itemref idref="chapter${it + 1}"/>""" 
    }}
  </spine>
</package>"""
    
    private fun createTocNcx(title: String, chapters: List<EpubChapter>) = 
        """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE ncx PUBLIC "-//NISO//DTD ncx 2005-1//EN" "http://www.daisy.org/z3986/2005/ncx-2005-1.dtd">
<ncx xmlns="http://www.daisy.org/z3986/2005/ncx/" version="2005-1">
  <head>
    <meta name="dtb:uid" content="${java.util.UUID.randomUUID()}"/>
  </head>
  <docTitle>
    <text>${escapeXml(title)}</text>
  </docTitle>
  <navMap>
    <navPoint id="titlepage" playOrder="1">
      <navLabel><text>Title Page</text></navLabel>
      <content src="titlepage.xhtml"/>
    </navPoint>
    ${chapters.mapIndexed { index, chapter -> """
    <navPoint id="chapter${index + 1}" playOrder="${index + 2}">
      <navLabel><text>${escapeXml(chapter.title)}</text></navLabel>
      <content src="chapter${index + 1}.xhtml"/>
    </navPoint>"""
    }.joinToString("")}
  </navMap>
</ncx>"""
    
    private fun createTocXhtml(title: String, chapters: List<EpubChapter>) = 
        """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops">
<head>
  <title>Table of Contents</title>
  <link rel="stylesheet" type="text/css" href="stylesheet.css"/>
</head>
<body>
  <nav epub:type="toc">
    <h1>Contents</h1>
    <ol>
      <li><a href="titlepage.xhtml">Title Page</a></li>
      ${chapters.mapIndexed { index, chapter -> 
          """<li><a href="chapter${index + 1}.xhtml">${escapeXml(chapter.title)}</a></li>"""
      }.joinToString("\n      ")}
    </ol>
  </nav>
</body>
</html>"""
    
    private fun createTitlePage(
        title: String,
        author: String,
        metadata: Map<String, String>
    ) = """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>${escapeXml(title)}</title>
  <link rel="stylesheet" type="text/css" href="stylesheet.css"/>
</head>
<body class="titlepage">
  <h1>${escapeXml(title)}</h1>
  <h2>by ${escapeXml(author)}</h2>
  ${metadata["summary"]?.let { 
      """<div class="summary"><p>${escapeXml(it)}</p></div>""" 
  } ?: ""}
  ${metadata["source"]?.let { 
      """<p class="source">Source: ${escapeXml(it)}</p>""" 
  } ?: ""}
  ${metadata["rating"]?.let { 
      """<p class="rating">Rating: ${escapeXml(it)}</p>""" 
  } ?: ""}
  ${metadata["fandoms"]?.let { 
      """<p class="fandoms">Fandom(s): ${escapeXml(it)}</p>""" 
  } ?: ""}
  ${metadata["characters"]?.let { 
      """<p class="characters">Characters: ${escapeXml(it)}</p>""" 
  } ?: ""}
</body>
</html>"""
    
    private fun createChapterXhtml(chapter: EpubChapter) = 
        """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>${escapeXml(chapter.title)}</title>
  <link rel="stylesheet" type="text/css" href="stylesheet.css"/>
</head>
<body>
  <h1>${escapeXml(chapter.title)}</h1>
  <div class="chapter-content">
    ${chapter.content}
  </div>
</body>
</html>"""
    
    private fun createStylesheet() = """
body {
  font-family: Georgia, serif;
  font-size: 1em;
  line-height: 1.6;
  margin: 1em;
}

h1 {
  font-size: 1.5em;
  font-weight: bold;
  margin-top: 1em;
  margin-bottom: 0.5em;
  text-align: center;
}

h2 {
  font-size: 1.2em;
  font-weight: bold;
  margin-top: 0.5em;
  margin-bottom: 0.5em;
  text-align: center;
}

.titlepage {
  text-align: center;
  margin-top: 2em;
}

.summary {
  margin: 2em 1em;
  font-style: italic;
}

.source, .rating, .fandoms, .characters {
  font-size: 0.9em;
  color: #666;
  margin-top: 0.5em;
}

.chapter-content {
  margin-top: 1em;
}

p {
  margin: 0.5em 0;
  text-align: justify;
}
"""
    
    private fun escapeXml(text: String): String {
        return text.replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&apos;")
    }
}
