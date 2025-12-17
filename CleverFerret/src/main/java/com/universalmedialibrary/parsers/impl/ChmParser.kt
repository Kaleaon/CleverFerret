package com.universalmedialibrary.parsers.impl

import com.universalmedialibrary.parsers.*
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.apache.tika.Tika
import org.apache.tika.metadata.Metadata
import org.apache.tika.parser.AutoDetectParser
import org.apache.tika.parser.ParseContext
import org.apache.tika.sax.BodyContentHandler
import java.io.File
import java.io.FileInputStream
import java.io.InputStream

/**
 * Parser for Compiled HTML Help (CHM) files using Apache Tika
 * 
 * CHM is a proprietary online help format developed by Microsoft.
 * It consists of a collection of HTML pages, an index, and other navigation tools.
 * 
 * Apache Tika uses chmlib internally to parse CHM files.
 * 
 * Reference: Apache Tika CHM parser
 * https://tika.apache.org/
 */
class ChmParser : DocumentParser {
    
    private val tika = Tika()
    
    override suspend fun parse(filePath: String): ParsedDocument = withContext(Dispatchers.IO) {
        try {
            FileInputStream(filePath).use { fis ->
                parseInternal(fis, File(filePath).name)
            }
        } catch (e: Exception) {
            throw ParserException("Failed to parse CHM file: $filePath", e)
        }
    }
    
    override suspend fun parse(inputStream: InputStream, fileName: String): ParsedDocument = 
        withContext(Dispatchers.IO) {
            try {
                parseInternal(inputStream, fileName)
            } catch (e: Exception) {
                throw ParserException("Failed to parse CHM stream: $fileName", e)
            }
        }
    
    private fun parseInternal(inputStream: InputStream, fileName: String): ParsedDocument {
        val metadata = Metadata()
        val handler = BodyContentHandler(-1) // -1 means no limit on content length
        val parser = AutoDetectParser()
        val context = ParseContext()
        
        try {
            parser.parse(inputStream, handler, metadata, context)
        } catch (e: Exception) {
            throw ParserException("Failed to parse CHM content", e)
        }
        
        val content = handler.toString()
        val documentMetadata = extractMetadata(metadata, fileName)
        val structure = extractStructure(content)
        
        return ParsedDocument(
            content = content,
            metadata = documentMetadata,
            structure = structure
        )
    }
    
    private fun extractMetadata(metadata: Metadata, fileName: String): DocumentMetadata {
        return DocumentMetadata(
            title = metadata.get("title") ?: metadata.get("dc:title"),
            author = metadata.get("author") ?: metadata.get("dc:creator"),
            subject = metadata.get("subject") ?: metadata.get("dc:subject"),
            keywords = (metadata.get("keywords") ?: metadata.get("dc:keywords"))
                ?.split(",")
                ?.map { it.trim() } 
                ?: emptyList(),
            creationDate = metadata.get("Creation-Date") ?: metadata.get("dcterms:created"),
            modificationDate = metadata.get("Last-Modified") ?: metadata.get("dcterms:modified"),
            pageCount = null, // CHM doesn't have traditional pages
            wordCount = null,
            language = metadata.get("language") ?: metadata.get("dc:language"),
            format = "CHM",
            customProperties = extractCustomProperties(metadata)
        )
    }
    
    private fun extractCustomProperties(metadata: Metadata): Map<String, String> {
        val customProps = mutableMapOf<String, String>()
        
        // Extract all metadata properties that aren't standard
        val standardKeys = setOf(
            "title", "dc:title", "author", "dc:creator", "subject", "dc:subject",
            "keywords", "dc:keywords", "Creation-Date", "dcterms:created",
            "Last-Modified", "dcterms:modified", "language", "dc:language"
        )
        
        metadata.names().forEach { name ->
            if (name !in standardKeys) {
                metadata.get(name)?.let { value ->
                    customProps[name] = value
                }
            }
        }
        
        return customProps
    }
    
    private fun extractStructure(content: String): DocumentStructure {
        // CHM files are HTML-based, so we can look for HTML heading tags
        val headings = mutableListOf<Heading>()
        
        // Simple regex-based heading extraction
        val headingRegex = Regex("<h([1-6])[^>]*>([^<]+)</h[1-6]>", RegexOption.IGNORE_CASE)
        
        headingRegex.findAll(content).forEach { match ->
            val level = match.groupValues[1].toIntOrNull() ?: 1
            val text = match.groupValues[2].trim()
            val position = match.range.first
            
            headings.add(Heading(text, level, position))
        }
        
        return DocumentStructure(
            headings = headings,
            images = emptyList(),
            tables = emptyList()
        )
    }
    
    override fun supports(fileName: String): Boolean {
        return fileName.endsWith(".chm", ignoreCase = true)
    }
    
    override fun getSupportedExtensions(): List<String> {
        return listOf("chm")
    }
}