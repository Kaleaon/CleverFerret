package com.universalmedialibrary.parsers

import java.io.File
import java.io.InputStream

/**
 * Base interface for all document parsers
 * 
 * This interface defines the contract for parsing various document formats
 * and extracting their content, metadata, and structure.
 */
interface DocumentParser {
    
    /**
     * Parse a document from a file path
     * 
     * @param filePath Path to the document file
     * @return ParsedDocument containing the extracted content and metadata
     * @throws ParserException if parsing fails
     */
    suspend fun parse(filePath: String): ParsedDocument
    
    /**
     * Parse a document from an InputStream
     * 
     * @param inputStream InputStream of the document
     * @param fileName Original file name (for format detection)
     * @return ParsedDocument containing the extracted content and metadata
     * @throws ParserException if parsing fails
     */
    suspend fun parse(inputStream: InputStream, fileName: String): ParsedDocument
    
    /**
     * Check if this parser supports the given file format
     * 
     * @param fileName File name with extension
     * @return true if this parser can handle the file format
     */
    fun supports(fileName: String): Boolean
    
    /**
     * Get the list of supported file extensions
     * 
     * @return List of supported extensions (without the dot)
     */
    fun getSupportedExtensions(): List<String>
}

/**
 * Data class representing a parsed document
 */
data class ParsedDocument(
    val content: String,
    val metadata: DocumentMetadata,
    val structure: DocumentStructure? = null
)

/**
 * Document metadata extracted during parsing
 */
data class DocumentMetadata(
    val title: String? = null,
    val author: String? = null,
    val subject: String? = null,
    val keywords: List<String> = emptyList(),
    val creationDate: String? = null,
    val modificationDate: String? = null,
    val pageCount: Int? = null,
    val wordCount: Int? = null,
    val language: String? = null,
    val format: String? = null,
    val customProperties: Map<String, String> = emptyMap()
)

/**
 * Document structure information
 */
data class DocumentStructure(
    val chapters: List<Chapter> = emptyList(),
    val headings: List<Heading> = emptyList(),
    val images: List<ImageInfo> = emptyList(),
    val tables: List<TableInfo> = emptyList()
)

/**
 * Chapter information
 */
data class Chapter(
    val title: String,
    val startPosition: Int,
    val endPosition: Int,
    val level: Int = 1
)

/**
 * Heading information
 */
data class Heading(
    val text: String,
    val level: Int,
    val position: Int
)

/**
 * Image information
 */
data class ImageInfo(
    val description: String? = null,
    val position: Int,
    val width: Int? = null,
    val height: Int? = null
)

/**
 * Table information
 */
data class TableInfo(
    val caption: String? = null,
    val position: Int,
    val rowCount: Int,
    val columnCount: Int
)

/**
 * Exception thrown when parsing fails
 */
class ParserException(
    message: String,
    cause: Throwable? = null
) : Exception(message, cause)