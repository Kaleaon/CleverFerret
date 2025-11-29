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
 * Parser for Rich Text Format (RTF) files using Apache Tika
 * 
 * This parser extracts text content and metadata from RTF documents.
 * RTF is a proprietary document file format developed by Microsoft.
 * 
 * Reference: Apache Tika documentation
 * https://tika.apache.org/
 */
class RtfParser : DocumentParser {
    
    private val tika = Tika()
    
    override suspend fun parse(filePath: String): ParsedDocument = withContext(Dispatchers.IO) {
        try {
            FileInputStream(filePath).use { fis ->
                parseInternal(fis, File(filePath).name)
            }
        } catch (e: Exception) {
            throw ParserException("Failed to parse RTF file: $filePath", e)
        }
    }
    
    override suspend fun parse(inputStream: InputStream, fileName: String): ParsedDocument = 
        withContext(Dispatchers.IO) {
            try {
                parseInternal(inputStream, fileName)
            } catch (e: Exception) {
                throw ParserException("Failed to parse RTF stream: $fileName", e)
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
            throw ParserException("Failed to parse RTF content", e)
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
            pageCount = metadata.get("xmpTPg:NPages")?.toIntOrNull(),
            wordCount = null,
            language = metadata.get("language") ?: metadata.get("dc:language"),
            format = "RTF",
            customProperties = extractCustomProperties(metadata)
        )
    }
    
    private fun extractCustomProperties(metadata: Metadata): Map<String, String> {
        val customProps = mutableMapOf<String, String>()
        
        // Extract all metadata properties that aren't standard
        val standardKeys = setOf(
            "title", "dc:title", "author", "dc:creator", "subject", "dc:subject",
            "keywords", "dc:keywords", "Creation-Date", "dcterms:created",
            "Last-Modified", "dcterms:modified", "xmpTPg:NPages", "language", "dc:language"
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
        // RTF structure extraction is limited without specialized parsing
        // We can identify potential headings using simple heuristics
        
        val headings = mutableListOf<Heading>()
        val lines = content.lines()
        var position = 0
        
        lines.forEach { line ->
            val trimmed = line.trim()
            
            // Simple heuristic: short lines (potential headings)
            if (trimmed.length in 1..100 && trimmed.isNotBlank()) {
                // Check if line might be a heading (all caps, or ends with specific punctuation)
                val isAllCaps = trimmed.all { it.isUpperCase() || !it.isLetter() }
                val endsWithColon = trimmed.endsWith(":")
                
                if (isAllCaps || endsWithColon) {
                    headings.add(Heading(trimmed, 1, position))
                }
            }
            
            position += line.length + 1 // +1 for newline
        }
        
        return DocumentStructure(
            headings = headings,
            images = emptyList(),
            tables = emptyList()
        )
    }
    
    override fun supports(fileName: String): Boolean {
        return fileName.endsWith(".rtf", ignoreCase = true)
    }
    
    override fun getSupportedExtensions(): List<String> {
        return listOf("rtf")
    }
}