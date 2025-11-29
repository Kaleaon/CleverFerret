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
 * Parser for OpenDocument Text (ODT) files using Apache Tika
 * 
 * ODT is an open standard document format used by LibreOffice, OpenOffice,
 * and other office suites. It's part of the OpenDocument Format (ODF) family.
 * 
 * Reference: Apache Tika ODF parser
 * https://tika.apache.org/
 */
class OdtParser : DocumentParser {
    
    private val tika = Tika()
    
    override suspend fun parse(filePath: String): ParsedDocument = withContext(Dispatchers.IO) {
        try {
            FileInputStream(filePath).use { fis ->
                parseInternal(fis, File(filePath).name)
            }
        } catch (e: Exception) {
            throw ParserException("Failed to parse ODT file: $filePath", e)
        }
    }
    
    override suspend fun parse(inputStream: InputStream, fileName: String): ParsedDocument = 
        withContext(Dispatchers.IO) {
            try {
                parseInternal(inputStream, fileName)
            } catch (e: Exception) {
                throw ParserException("Failed to parse ODT stream: $fileName", e)
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
            throw ParserException("Failed to parse ODT content", e)
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
            author = metadata.get("author") ?: metadata.get("dc:creator") ?: metadata.get("meta:initial-creator"),
            subject = metadata.get("subject") ?: metadata.get("dc:subject"),
            keywords = (metadata.get("keywords") ?: metadata.get("meta:keyword"))
                ?.split(",")
                ?.map { it.trim() } 
                ?: emptyList(),
            creationDate = metadata.get("Creation-Date") ?: metadata.get("meta:creation-date"),
            modificationDate = metadata.get("Last-Modified") ?: metadata.get("dcterms:modified") ?: metadata.get("dc:date"),
            pageCount = metadata.get("meta:page-count")?.toIntOrNull() ?: metadata.get("xmpTPg:NPages")?.toIntOrNull(),
            wordCount = metadata.get("meta:word-count")?.toIntOrNull(),
            language = metadata.get("language") ?: metadata.get("dc:language"),
            format = "ODT",
            customProperties = extractCustomProperties(metadata)
        )
    }
    
    private fun extractCustomProperties(metadata: Metadata): Map<String, String> {
        val customProps = mutableMapOf<String, String>()
        
        // Extract all metadata properties that aren't standard
        val standardKeys = setOf(
            "title", "dc:title", "author", "dc:creator", "meta:initial-creator",
            "subject", "dc:subject", "keywords", "meta:keyword",
            "Creation-Date", "meta:creation-date", "Last-Modified", "dcterms:modified", "dc:date",
            "meta:page-count", "xmpTPg:NPages", "meta:word-count",
            "language", "dc:language"
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
        // ODT structure extraction using simple heuristics
        val headings = mutableListOf<Heading>()
        val lines = content.lines()
        var position = 0
        
        lines.forEach { line ->
            val trimmed = line.trim()
            
            // Simple heuristic: short lines that might be headings
            if (trimmed.length in 1..100 && trimmed.isNotBlank()) {
                // Check if line might be a heading
                val isAllCaps = trimmed.all { it.isUpperCase() || !it.isLetter() }
                val endsWithColon = trimmed.endsWith(":")
                val isShortAndBold = trimmed.length < 50 // Simplified check
                
                if (isAllCaps || endsWithColon || isShortAndBold) {
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
        return fileName.endsWith(".odt", ignoreCase = true)
    }
    
    override fun getSupportedExtensions(): List<String> {
        return listOf("odt")
    }
}