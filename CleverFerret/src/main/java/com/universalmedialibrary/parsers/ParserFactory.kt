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
 */
object ParserFactory {
    
    private val parsers: List<DocumentParser> by lazy {
        listOf(
            DocxParser(),
            DocParser(),
            RtfParser(),
            ChmParser(),
            OdtParser()
            // JNI-based parsers will be added in Phase 5-7
            // MobiParser(),
            // DjvuParser(),
            // LitParser(),
            // SnbParser(),
            // RbParser(),
            // PdbParser()
        )
    }
    
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
        return parsers.firstOrNull { it.supports(fileName) }
            ?: throw UnsupportedFormatException("No parser found for file: $fileName")
    }
    
    /**
     * Check if a file format is supported
     * 
     * @param fileName Name of the file (with extension)
     * @return true if the format is supported
     */
    fun isSupported(fileName: String): Boolean {
        return parsers.any { it.supports(fileName) }
    }
    
    /**
     * Get all supported file extensions
     * 
     * @return List of all supported extensions (without the dot)
     */
    fun getSupportedExtensions(): List<String> {
        return parsers.flatMap { it.getSupportedExtensions() }.distinct()
    }
    
    /**
     * Get a map of extensions to their parser types
     * 
     * @return Map of extension to parser class name
     */
    fun getExtensionParserMap(): Map<String, String> {
        return parsers.flatMap { parser ->
            parser.getSupportedExtensions().map { ext ->
                ext to parser::class.simpleName.orEmpty()
            }
        }.toMap()
    }
}

/**
 * Exception thrown when an unsupported file format is encountered
 */
class UnsupportedFormatException(message: String) : Exception(message)