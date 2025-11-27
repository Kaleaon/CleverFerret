package com.universalmedialibrary.parsers.impl

import com.universalmedialibrary.parsers.*
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.apache.poi.hwpf.HWPFDocument
import org.apache.poi.hwpf.extractor.WordExtractor
import java.io.File
import java.io.FileInputStream
import java.io.InputStream

/**
 * Parser for legacy Microsoft Word DOC files using Apache POI
 * 
 * This parser extracts text content and metadata from binary DOC files
 * (Office 97-2003 format).
 * 
 * Reference: Apache POI HWPF documentation
 * https://poi.apache.org/components/document/
 */
class DocParser : DocumentParser {
    
    override suspend fun parse(filePath: String): ParsedDocument = withContext(Dispatchers.IO) {
        try {
            FileInputStream(filePath).use { fis ->
                parseInternal(fis, File(filePath).name)
            }
        } catch (e: Exception) {
            throw ParserException("Failed to parse DOC file: $filePath", e)
        }
    }
    
    override suspend fun parse(inputStream: InputStream, fileName: String): ParsedDocument = 
        withContext(Dispatchers.IO) {
            try {
                parseInternal(inputStream, fileName)
            } catch (e: Exception) {
                throw ParserException("Failed to parse DOC stream: $fileName", e)
            }
        }
    
    private fun parseInternal(inputStream: InputStream, fileName: String): ParsedDocument {
        HWPFDocument(inputStream).use { document ->
            // Extract text content
            val content = WordExtractor(document).use { extractor ->
                extractor.text
            }
            
            // Extract metadata
            val metadata = extractMetadata(document, fileName)
            
            // Extract basic structure
            val structure = extractStructure(document, content)
            
            return ParsedDocument(
                content = content,
                metadata = metadata,
                structure = structure
            )
        }
    }
    
    private fun extractMetadata(document: HWPFDocument, fileName: String): DocumentMetadata {
        val summaryInfo = try {
            document.summaryInformation
        } catch (e: Exception) {
            null
        }
        
        val docSummaryInfo = try {
            document.documentSummaryInformation
        } catch (e: Exception) {
            null
        }
        
        return DocumentMetadata(
            title = summaryInfo?.title,
            author = summaryInfo?.author,
            subject = summaryInfo?.subject,
            keywords = summaryInfo?.keywords?.split(",")?.map { it.trim() } ?: emptyList(),
            creationDate = summaryInfo?.createDateTime?.toString(),
            modificationDate = summaryInfo?.lastSaveDateTime?.toString(),
            pageCount = docSummaryInfo?.pageCount,
            wordCount = summaryInfo?.wordCount,
            language = null,
            format = "DOC",
            customProperties = emptyMap()
        )
    }
    
    private fun extractStructure(document: HWPFDocument, content: String): DocumentStructure {
        // Legacy DOC format has limited structure extraction capabilities
        // We can extract basic information like paragraph count
        
        val headings = mutableListOf<Heading>()
        
        try {
            // Try to extract headings from the document
            val range = document.range
            var position = 0
            
            for (i in 0 until range.numParagraphs()) {
                val paragraph = range.getParagraph(i)
                val text = paragraph.text()
                
                // Simple heuristic: short paragraphs in all caps or with specific formatting
                // might be headings
                if (text.length < 100 && text.isNotBlank()) {
                    val isAllCaps = text.all { it.isUpperCase() || !it.isLetter() }
                    if (isAllCaps) {
                        headings.add(Heading(text.trim(), 1, position))
                    }
                }
                
                position += text.length
            }
        } catch (e: Exception) {
            // If structure extraction fails, return empty structure
        }
        
        return DocumentStructure(
            headings = headings,
            images = emptyList(),
            tables = emptyList()
        )
    }
    
    override fun supports(fileName: String): Boolean {
        return fileName.endsWith(".doc", ignoreCase = true) && 
               !fileName.endsWith(".docx", ignoreCase = true)
    }
    
    override fun getSupportedExtensions(): List<String> {
        return listOf("doc")
    }
}