package com.universalmedialibrary.parsers

import com.universalmedialibrary.parsers.impl.*
import java.io.File

/**
 * Factory for creating appropriate document parsers based on file format
 * 
 * This factory automatically detects the file format and returns the appropriate
 * parser implementation. It supports various document formats including:
 * - Microsoft Office (DOCX, DOC)
 * - OpenDocument (ODT)
 * - Rich Text Format (RTF)
 * - Compiled HTML Help (CHM)
 * - MOBI/AZW (via JNI or conversion)
 * - DJVU (via JNI)
 * - Legacy formats (LIT, SNB, RB, PDB via JNI)
 *
 * Confirmed: Apache POI and Tika dependencies are integrated for these parsers.
 */
object ParserFactory {
    data class ParserCapability(
        val parserId: String,
        val extensions: Set<String>,
        val supportsHeadings: Boolean,
        val supportsParagraphs: Boolean,
        val supportsTables: Boolean,
        val baselineConfidence: Float
    )

    data class ParserRegistration(
        val parser: DocumentParser,
        val capability: ParserCapability
    )

    data class ParserSelection(
        val parser: DocumentParser,
        val capability: ParserCapability
    )

    private val registrations: List<ParserRegistration> by lazy {
        listOf(
            register(DocxParser(), "docx-parser", setOf("docx"), headings = true, paragraphs = true, tables = true, baselineConfidence = 0.95f),
            register(DocParser(), "doc-parser", setOf("doc"), headings = true, paragraphs = true, tables = true, baselineConfidence = 0.90f),
            register(RtfParser(), "rtf-parser", setOf("rtf"), headings = true, paragraphs = true, tables = false, baselineConfidence = 0.82f),
            register(ChmParser(), "chm-parser", setOf("chm"), headings = true, paragraphs = true, tables = false, baselineConfidence = 0.76f),
            register(OdtParser(), "odt-parser", setOf("odt"), headings = true, paragraphs = true, tables = true, baselineConfidence = 0.88f),
            register(MobiParser(), "mobi-parser", setOf("mobi", "prc", "azw", "azw3"), headings = false, paragraphs = true, tables = false, baselineConfidence = 0.70f),
            register(LitParser(), "lit-parser", setOf("lit"), headings = false, paragraphs = true, tables = false, baselineConfidence = 0.58f),
            register(SnbParser(), "snb-parser", setOf("snb"), headings = false, paragraphs = true, tables = false, baselineConfidence = 0.56f),
            register(RbParser(), "rb-parser", setOf("rb"), headings = false, paragraphs = true, tables = false, baselineConfidence = 0.54f),
            register(PdbParser(), "pdb-parser", setOf("pdb"), headings = false, paragraphs = true, tables = false, baselineConfidence = 0.52f),
            register(DjvuParser(), "djvu-parser", setOf("djvu", "djv"), headings = false, paragraphs = true, tables = false, baselineConfidence = 0.50f)
        )
    }

    private fun register(
        parser: DocumentParser,
        parserId: String,
        extensions: Set<String>,
        headings: Boolean,
        paragraphs: Boolean,
        tables: Boolean,
        baselineConfidence: Float
    ): ParserRegistration = ParserRegistration(
        parser = parser,
        capability = ParserCapability(
            parserId = parserId,
            extensions = extensions,
            supportsHeadings = headings,
            supportsParagraphs = paragraphs,
            supportsTables = tables,
            baselineConfidence = baselineConfidence
        )
    )
    
    /**
     * Get the appropriate parser for a given file
     * 
     * @param filePath Path to the file
     * @return DocumentParser that can handle the file format
     * @throws UnsupportedFormatException if no parser supports the format
     */
    fun getParser(filePath: String): DocumentParser {
        val fileName = File(filePath).name
        return getParserForFileName(fileName)
    }
    
    /**
     * Get the appropriate parser for a given file name
     * 
     * @param fileName Name of the file (with extension)
     * @return DocumentParser that can handle the file format
     * @throws UnsupportedFormatException if no parser supports the format
     */
    fun getParserForFileName(fileName: String): DocumentParser {
        return selectParser(fileName).parser
    }

    fun selectParser(fileName: String): ParserSelection {
        val registration = registrations.firstOrNull { it.parser.supports(fileName) }
            ?: throw UnsupportedFormatException("No parser found for file: $fileName")
        return ParserSelection(registration.parser, registration.capability)
    }
    
    /**
     * Check if a file format is supported
     * 
     * @param fileName Name of the file (with extension)
     * @return true if the format is supported
     */
    fun isSupported(fileName: String): Boolean {
        return registrations.any { it.parser.supports(fileName) }
    }
    
    /**
     * Get all supported file extensions
     * 
     * @return List of all supported extensions (without the dot)
     */
    fun getSupportedExtensions(): List<String> {
        return registrations.flatMap { it.parser.getSupportedExtensions() }.distinct()
    }
    
    /**
     * Get a map of extensions to their parser types
     * 
     * @return Map of extension to parser class name
     */
    fun getExtensionParserMap(): Map<String, String> {
        return registrations.flatMap { registration ->
            registration.parser.getSupportedExtensions().map { ext ->
                ext to registration.capability.parserId
            }
        }.toMap()
    }

    fun getCapabilities(): List<ParserCapability> = registrations.map { it.capability }
}

/**
 * Exception thrown when an unsupported file format is encountered
 */
class UnsupportedFormatException(message: String) : Exception(message)
