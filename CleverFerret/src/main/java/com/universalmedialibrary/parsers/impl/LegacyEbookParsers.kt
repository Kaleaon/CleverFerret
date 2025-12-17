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
 * Base class for legacy eBook format parsers using Apache Tika
 * 
 * This implementation uses Apache Tika for parsing legacy eBook formats,
 * providing a pure Java/Kotlin solution without requiring JNI.
 * 
 * Apache Tika has built-in support for many legacy formats through
 * its extensive parser library.
 */
abstract class LegacyEbookParser : DocumentParser {
    
    private val tika = Tika()
    protected abstract fun getFormatName(): String
    
    override suspend fun parse(filePath: String): ParsedDocument = withContext(Dispatchers.IO) {
        try {
            FileInputStream(filePath).use { fis ->
                parseInternal(fis, File(filePath).name)
            }
        } catch (e: Exception) {
            throw ParserException(
                "Failed to parse ${getFormatName()} file: $filePath. " +
                "Note: Some legacy formats may have limited support in Apache Tika.", 
                e
            )
        }
    }
    
    override suspend fun parse(inputStream: InputStream, fileName: String): ParsedDocument = 
        withContext(Dispatchers.IO) {
            try {
                parseInternal(inputStream, fileName)
            } catch (e: Exception) {
                throw ParserException(
                    "Failed to parse ${getFormatName()} stream: $fileName. " +
                    "Note: Some legacy formats may have limited support in Apache Tika.", 
                    e
                )
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
            // If Tika fails, provide a helpful error message
            val content = buildFallbackContent(fileName)
            val documentMetadata = buildFallbackMetadata(fileName)
            return ParsedDocument(content, documentMetadata, null)
        }
        
        val content = handler.toString()
        val documentMetadata = extractMetadata(metadata, fileName)
        val structure = extractStructure(content)
        
        return ParsedDocument(
            content = if (content.isBlank()) buildFallbackContent(fileName) else content,
            metadata = documentMetadata,
            structure = structure
        )
    }
    
    private fun buildFallbackContent(fileName: String): String {
        return """
            ${getFormatName()} Document
            ${"=".repeat(getFormatName().length + 9)}
            
            File: $fileName
            Format: ${getFormatName()}
            
            Note: This legacy format has limited support in the current parser.
            
            The ${getFormatName()} format is a legacy eBook format that may require
            specialized tools for full content extraction.
            
            Recommendations:
            1. Try converting the file to EPUB or PDF using Calibre
            2. Use a dedicated ${getFormatName()} reader application
            3. Check if the file is corrupted or encrypted
            
            For better support of legacy formats, consider:
            - Using Calibre's ebook-convert tool to convert to modern formats
            - Installing format-specific reader applications
            - Checking for updated versions of this parser
        """.trimIndent()
    }
    
    private fun buildFallbackMetadata(fileName: String): DocumentMetadata {
        return DocumentMetadata(
            title = fileName.substringBeforeLast("."),
            author = null,
            subject = null,
            keywords = emptyList(),
            creationDate = null,
            modificationDate = null,
            pageCount = null,
            wordCount = null,
            language = null,
            format = getFormatName(),
            customProperties = mapOf(
                "parserNote" to "Limited support - consider converting to modern format"
            )
        )
    }
    
    private fun extractMetadata(metadata: Metadata, fileName: String): DocumentMetadata {
        return DocumentMetadata(
            title = metadata.get("title") ?: metadata.get("dc:title") 
                ?: fileName.substringBeforeLast("."),
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
            format = getFormatName(),
            customProperties = extractCustomProperties(metadata)
        )
    }
    
    private fun extractCustomProperties(metadata: Metadata): Map<String, String> {
        val customProps = mutableMapOf<String, String>()
        
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
    
    private fun extractStructure(content: String): DocumentStructure? {
        if (content.isBlank()) return null
        
        val headings = mutableListOf<Heading>()
        val lines = content.lines()
        var position = 0
        
        lines.forEach { line ->
            val trimmed = line.trim()
            
            if (trimmed.length in 1..100 && trimmed.isNotBlank()) {
                val isAllCaps = trimmed.all { it.isUpperCase() || !it.isLetter() }
                val endsWithColon = trimmed.endsWith(":")
                
                if (isAllCaps || endsWithColon) {
                    headings.add(Heading(trimmed, 1, position))
                }
            }
            
            position += line.length + 1
        }
        
        return if (headings.isEmpty()) null else DocumentStructure(headings = headings)
    }
}

/**
 * Parser for Microsoft Reader LIT files
 * 
 * LIT is a proprietary eBook format developed by Microsoft for its Microsoft Reader application.
 * The format is based on CHM (Compiled HTML Help) format.
 * 
 * Implementation: Uses Apache Tika for parsing
 * Note: LIT format support in Tika may be limited. Consider converting to EPUB for better results.
 */
class LitParser : LegacyEbookParser() {
    
    override fun getFormatName(): String = "LIT"
    
    override fun supports(fileName: String): Boolean {
        return fileName.endsWith(".lit", ignoreCase = true)
    }
    
    override fun getSupportedExtensions(): List<String> {
        return listOf("lit")
    }
}

/**
 * Parser for Shanda Bambook SNB files
 * 
 * SNB is an eBook format used by Shanda Bambook devices.
 * 
 * Implementation: Uses Apache Tika for parsing
 * Note: SNB format support may be limited. Consider converting to EPUB for better results.
 */
class SnbParser : LegacyEbookParser() {
    
    override fun getFormatName(): String = "SNB"
    
    override fun supports(fileName: String): Boolean {
        return fileName.endsWith(".snb", ignoreCase = true)
    }
    
    override fun getSupportedExtensions(): List<String> {
        return listOf("snb")
    }
}

/**
 * Parser for RocketBook RB files
 * 
 * RB is an eBook format used by the RocketBook eReader.
 * 
 * Implementation: Uses Apache Tika for parsing
 * Note: RB format support may be limited. Consider converting to EPUB for better results.
 */
class RbParser : LegacyEbookParser() {
    
    override fun getFormatName(): String = "RB"
    
    override fun supports(fileName: String): Boolean {
        return fileName.endsWith(".rb", ignoreCase = true)
    }
    
    override fun getSupportedExtensions(): List<String> {
        return listOf("rb")
    }
}

/**
 * Parser for Palm Database PDB files
 * 
 * PDB is a database format used by Palm OS devices.
 * Various eBook formats use PDB as a container, including:
 * - Palm Doc (AportisDoc)
 * - eReader (Palm Reader)
 * - Plucker
 * - iSilo
 * - TealDoc
 * 
 * Implementation: Uses Apache Tika for parsing
 * Note: PDB format support depends on the specific eBook format inside.
 * Consider converting to EPUB for better results.
 */
class PdbParser : LegacyEbookParser() {
    
    override fun getFormatName(): String = "PDB"
    
    override fun supports(fileName: String): Boolean {
        return fileName.endsWith(".pdb", ignoreCase = true)
    }
    
    override fun getSupportedExtensions(): List<String> {
        return listOf("pdb")
    }
}