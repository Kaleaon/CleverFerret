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
    
    // Note: FileInputStream is used as a raw byte stream here. Charset detection
    // is handled internally by Apache Tika during parsing, so no explicit charset
    // is needed at the stream level.
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
            // If Tika fails, provide a helpful error message with diagnostic info
            val content = buildFallbackContent(
                fileName,
                tikaMetadata = metadata,
                errorMessage = e.message ?: e::class.simpleName
            )
            val documentMetadata = buildFallbackMetadata(fileName)
            return ParsedDocument(content, documentMetadata, null)
        }
        
        val content = handler.toString()
        val documentMetadata = extractMetadata(metadata, fileName)
        val structure = extractStructure(content)
        
        return ParsedDocument(
            content = if (content.isBlank()) buildFallbackContent(fileName, tikaMetadata = metadata) else content,
            metadata = documentMetadata,
            structure = structure
        )
    }
    
    private fun buildFallbackContent(
        fileName: String,
        tikaMetadata: Metadata? = null,
        errorMessage: String? = null
    ): String {
        val sb = StringBuilder()
        sb.appendLine("${getFormatName()} Document")
        sb.appendLine("=".repeat(getFormatName().length + 9))
        sb.appendLine()
        sb.appendLine("File: $fileName")
        sb.appendLine("Format: ${getFormatName()}")
        sb.appendLine()
        sb.appendLine("The file was detected as a ${getFormatName()} document, but full content extraction was limited.")

        if (errorMessage != null) {
            sb.appendLine()
            sb.appendLine("Parser diagnostic: $errorMessage")
        }

        if (tikaMetadata != null && tikaMetadata.names().isNotEmpty()) {
            sb.appendLine()
            sb.appendLine("Metadata successfully extracted:")
            tikaMetadata.names().sorted().forEach { name ->
                tikaMetadata.get(name)?.let { value ->
                    sb.appendLine("  $name: $value")
                }
            }
        }

        sb.appendLine()
        sb.appendLine(getFormatSpecificGuidance())

        return sb.toString().trimEnd()
    }

    private fun getFormatSpecificGuidance(): String {
        return when (getFormatName()) {
            "PDB" -> """
                |Note: PDB files can contain various sub-formats (Palm Doc, eReader, Plucker, iSilo, TealDoc).
                |The specific sub-format may not be supported by the current parser.
                |Try converting with Calibre, specifying the input format explicitly if auto-detection fails.
            """.trimMargin()
            "LIT" -> """
                |Note: LIT is a proprietary Microsoft format based on compressed HTML.
                |Conversion tools such as Calibre or ConvertLIT may produce better results.
            """.trimMargin()
            "SNB" -> """
                |Note: SNB is a proprietary Shanda Bambook format.
                |Calibre supports SNB-to-EPUB conversion and may extract more content.
            """.trimMargin()
            "RB" -> """
                |Note: RB is a RocketBook format with limited third-party tool support.
                |Calibre may be able to convert this file to EPUB or PDF.
            """.trimMargin()
            else -> """
                |Consider converting this file to EPUB or PDF using Calibre for better content extraction.
            """.trimMargin()
        }
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
            
            if (trimmed.length in 3..100 && trimmed.isNotBlank()) {
                val letterCount = trimmed.count { it.isLetter() }
                val isAllCaps = letterCount >= 2 && trimmed.all { it.isUpperCase() || !it.isLetter() }
                val endsWithColon = trimmed.endsWith(":") && letterCount >= 2

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