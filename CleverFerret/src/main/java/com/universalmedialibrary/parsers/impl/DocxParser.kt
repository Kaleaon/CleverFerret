package com.universalmedialibrary.parsers.impl

import com.universalmedialibrary.parsers.*
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.apache.poi.xwpf.usermodel.XWPFDocument
import org.apache.poi.xwpf.extractor.XWPFWordExtractor
import java.io.File
import java.io.FileInputStream
import java.io.InputStream

/**
 * Parser for Microsoft Word DOCX files using Apache POI
 * 
 * This parser extracts text content, metadata, and document structure
 * from DOCX (Office Open XML) documents.
 * 
 * Reference: Apache POI documentation
 * https://poi.apache.org/components/document/
 */
class DocxParser : DocumentParser {
    
    override suspend fun parse(filePath: String): ParsedDocument = withContext(Dispatchers.IO) {
        try {
            FileInputStream(filePath).use { fis ->
                parseInternal(fis, File(filePath).name)
            }
        } catch (e: Exception) {
            throw ParserException("Failed to parse DOCX file: $filePath", e)
        }
    }
    
    override suspend fun parse(inputStream: InputStream, fileName: String): ParsedDocument = 
        withContext(Dispatchers.IO) {
            try {
                parseInternal(inputStream, fileName)
            } catch (e: Exception) {
                throw ParserException("Failed to parse DOCX stream: $fileName", e)
            }
        }
    
    private fun parseInternal(inputStream: InputStream, fileName: String): ParsedDocument {
        XWPFDocument(inputStream).use { document ->
            // Extract text content
            val content = XWPFWordExtractor(document).use { extractor ->
                extractor.text
            }
            
            // Extract metadata
            val metadata = extractMetadata(document, fileName)
            
            // Extract structure
            val structure = extractStructure(document)
            
            return ParsedDocument(
                content = content,
                metadata = metadata,
                structure = structure
            )
        }
    }
    
    private fun extractMetadata(document: XWPFDocument, fileName: String): DocumentMetadata {
        val coreProps = document.properties?.coreProperties
        val extendedProps = document.properties?.extendedProperties
        
        return DocumentMetadata(
            title = coreProps?.title,
            author = coreProps?.creator,
            subject = coreProps?.subject,
            keywords = coreProps?.keywords?.split(",")?.map { it.trim() } ?: emptyList(),
            creationDate = coreProps?.created?.toString(),
            modificationDate = coreProps?.modified?.toString(),
            pageCount = extendedProps?.pages,
            wordCount = extendedProps?.let { 
                try { 
                    it.underlyingProperties?.words 
                } catch (e: Exception) { 
                    null 
                }
            },
            language = coreProps?.contentType,
            format = "DOCX",
            customProperties = extractCustomProperties(document)
        )
    }
    
    private fun extractCustomProperties(document: XWPFDocument): Map<String, String> {
        val customProps = mutableMapOf<String, String>()
        try {
            val customProperties = document.properties?.customProperties
            customProperties?.underlyingProperties?.let { props ->
                // Extract custom properties if available
                // This is a simplified version - full implementation would iterate through all properties
            }
        } catch (e: Exception) {
            // Ignore errors in custom properties extraction
        }
        return customProps
    }
    
    private fun extractStructure(document: XWPFDocument): DocumentStructure {
        val headings = mutableListOf<Heading>()
        val images = mutableListOf<ImageInfo>()
        val tables = mutableListOf<TableInfo>()
        
        var position = 0
        
        // Extract headings from paragraphs
        document.paragraphs.forEach { paragraph ->
            val style = paragraph.style
            val text = paragraph.text
            
            // Check if paragraph is a heading
            if (style != null && style.startsWith("Heading", ignoreCase = true)) {
                val level = style.replace("Heading", "").trim().toIntOrNull() ?: 1
                headings.add(Heading(text, level, position))
            }
            
            position += text.length + 1 // +1 for newline
        }
        
        // Extract images
        document.allPictures.forEachIndexed { index, picture ->
            images.add(ImageInfo(
                description = "Image ${index + 1}",
                position = -1, // Position tracking would require more complex logic
                width = picture.pictureData?.let { 
                    try { 
                        // Width extraction if available
                        null 
                    } catch (e: Exception) { 
                        null 
                    }
                },
                height = null
            ))
        }
        
        // Extract tables
        document.tables.forEachIndexed { index, table ->
            tables.add(TableInfo(
                caption = "Table ${index + 1}",
                position = -1, // Position tracking would require more complex logic
                rowCount = table.rows.size,
                columnCount = table.rows.firstOrNull()?.tableCells?.size ?: 0
            ))
        }
        
        return DocumentStructure(
            headings = headings,
            images = images,
            tables = tables
        )
    }
    
    override fun supports(fileName: String): Boolean {
        return fileName.endsWith(".docx", ignoreCase = true)
    }
    
    override fun getSupportedExtensions(): List<String> {
        return listOf("docx")
    }
}