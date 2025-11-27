package com.universalmedialibrary.parsers.impl

import com.universalmedialibrary.parsers.*
import de.m3y.mobi.core.MobiHeader
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.DataInputStream
import java.io.File
import java.io.FileInputStream
import java.io.InputStream

/**
 * Parser for MOBI/AZW/AZW3 files using lib-mobi (Pure Java)
 * 
 * MOBI is an eBook format developed by Mobipocket and used by Amazon Kindle.
 * AZW and AZW3 are Amazon's proprietary variants of the MOBI format.
 * 
 * This implementation uses the lib-mobi Java library for parsing MOBI files,
 * eliminating the need for JNI and native code.
 * 
 * Library: https://github.com/marcelmay/lib-mobi
 * License: Apache 2.0
 * 
 * Features:
 * - Pure Java implementation (no JNI required)
 * - Metadata extraction from MOBI/AZW/AZW3 files
 * - EXTH header parsing
 * - Support for encrypted and unencrypted files
 * 
 * Note: This parser extracts metadata and basic information.
 * For full text extraction, consider using Apache Tika or converting to EPUB.
 */
class MobiParser : DocumentParser {
    
    override suspend fun parse(filePath: String): ParsedDocument = withContext(Dispatchers.IO) {
        try {
            FileInputStream(filePath).use { fis ->
                DataInputStream(fis).use { dis ->
                    parseInternal(dis, File(filePath).name, filePath)
                }
            }
        } catch (e: Exception) {
            throw ParserException("Failed to parse MOBI file: $filePath", e)
        }
    }
    
    override suspend fun parse(inputStream: InputStream, fileName: String): ParsedDocument = 
        withContext(Dispatchers.IO) {
            try {
                DataInputStream(inputStream).use { dis ->
                    parseInternal(dis, fileName, null)
                }
            } catch (e: Exception) {
                throw ParserException("Failed to parse MOBI stream: $fileName", e)
            }
        }
    
    private fun parseInternal(
        dataInputStream: DataInputStream, 
        fileName: String,
        filePath: String?
    ): ParsedDocument {
        // Read MOBI header
        val header = MobiHeader.read(dataInputStream)
        
        // Extract metadata
        val metadata = extractMetadata(header, fileName)
        
        // Extract basic content information
        val content = extractContentInfo(header, filePath)
        
        return ParsedDocument(
            content = content,
            metadata = metadata,
            structure = null // Structure extraction not supported by lib-mobi
        )
    }
    
    private fun extractMetadata(header: MobiHeader, fileName: String): DocumentMetadata {
        val exthHeader = header.exthHeader
        
        // Extract title from Palm Database Header or EXTH
        val title = header.palmDatabaseHeader?.name 
            ?: exthHeader?.getRecordByTypeCode(MobiHeader.Exth.RecordType.TITLE)?.data
            ?: fileName.substringBeforeLast(".")
        
        // Extract author
        val author = exthHeader?.getRecordByTypeCode(MobiHeader.Exth.RecordType.AUTHOR)?.data
            ?: exthHeader?.getRecordByTypeCode(MobiHeader.Exth.RecordType.CREATOR)?.data
        
        // Extract subject/description
        val subject = exthHeader?.getRecordByTypeCode(MobiHeader.Exth.RecordType.SUBJECT)?.data
            ?: exthHeader?.getRecordByTypeCode(MobiHeader.Exth.RecordType.DESCRIPTION)?.data
        
        // Extract keywords
        val keywords = exthHeader?.getRecordByTypeCode(MobiHeader.Exth.RecordType.KEYWORDS)?.data
            ?.split(",")
            ?.map { it.trim() }
            ?: emptyList()
        
        // Extract dates
        val creationDate = header.palmDatabaseHeader?.creationDate?.toString()
        val modificationDate = header.palmDatabaseHeader?.modificationDate?.toString()
        
        // Extract language
        val language = exthHeader?.getRecordByTypeCode(MobiHeader.Exth.RecordType.LANGUAGE)?.data
        
        // Extract ISBN
        val isbn = exthHeader?.getRecordByTypeCode(MobiHeader.Exth.RecordType.ISBN)?.data
        
        // Extract publisher
        val publisher = exthHeader?.getRecordByTypeCode(MobiHeader.Exth.RecordType.PUBLISHER)?.data
        
        // Build custom properties
        val customProperties = mutableMapOf<String, String>()
        
        isbn?.let { customProperties["isbn"] = it }
        publisher?.let { customProperties["publisher"] = it }
        
        // Add MOBI-specific metadata
        customProperties["mobiType"] = header.mobiType?.name ?: "UNKNOWN"
        customProperties["encoding"] = header.encoding?.name ?: "UNKNOWN"
        customProperties["compression"] = header.compression?.name ?: "UNKNOWN"
        customProperties["hasExth"] = header.hasExth.toString()
        
        // Add encryption info
        if (header.encryptionType > 0) {
            customProperties["encrypted"] = "true"
            customProperties["encryptionType"] = header.encryptionType.toString()
        }
        
        return DocumentMetadata(
            title = title,
            author = author,
            subject = subject,
            keywords = keywords,
            creationDate = creationDate,
            modificationDate = modificationDate,
            pageCount = null, // MOBI doesn't have traditional pages
            wordCount = null,
            language = language,
            format = determineFormat(fileName, header),
            customProperties = customProperties
        )
    }
    
    private fun extractContentInfo(header: MobiHeader, filePath: String?): String {
        val info = StringBuilder()
        
        info.appendLine("MOBI/AZW Document")
        info.appendLine("=================")
        info.appendLine()
        
        // Add basic information
        header.palmDatabaseHeader?.name?.let {
            info.appendLine("Title: $it")
        }
        
        info.appendLine("Format: ${determineFormat(filePath ?: "", header)}")
        info.appendLine("MOBI Type: ${header.mobiType?.name ?: "UNKNOWN"}")
        info.appendLine("Encoding: ${header.encoding?.name ?: "UNKNOWN"}")
        info.appendLine("Text Length: ${header.textLength} bytes")
        info.appendLine("Record Count: ${header.recordCount}")
        
        if (header.encryptionType > 0) {
            info.appendLine("Encryption: Yes (Type ${header.encryptionType})")
            info.appendLine()
            info.appendLine("Note: This file is encrypted and cannot be fully read without DRM removal.")
        }
        
        info.appendLine()
        info.appendLine("Note: Full text extraction from MOBI files requires additional processing.")
        info.appendLine("Consider using Apache Tika or converting to EPUB for complete text extraction.")
        
        // Add EXTH information if available
        if (header.hasExth && header.exthHeader != null) {
            info.appendLine()
            info.appendLine("Extended Metadata:")
            info.appendLine("------------------")
            
            header.exthHeader.records.forEach { record ->
                val typeLabel = record.typeLabel ?: "UNKNOWN"
                val data = record.data
                if (data != null && data.isNotEmpty() && !data.contains("\u0000")) {
                    info.appendLine("$typeLabel: $data")
                }
            }
        }
        
        return info.toString()
    }
    
    private fun determineFormat(fileName: String, header: MobiHeader): String {
        val extension = fileName.substringAfterLast(".", "").lowercase()
        
        return when {
            extension == "azw3" -> "AZW3"
            extension == "azw" -> "AZW"
            extension == "prc" -> "PRC"
            header.mobiType?.name?.contains("KF8") == true -> "AZW3/KF8"
            else -> "MOBI"
        }
    }
    
    override fun supports(fileName: String): Boolean {
        val lowerName = fileName.lowercase()
        return lowerName.endsWith(".mobi") || 
               lowerName.endsWith(".azw") || 
               lowerName.endsWith(".azw3") ||
               lowerName.endsWith(".prc")
    }
    
    override fun getSupportedExtensions(): List<String> {
        return listOf("mobi", "azw", "azw3", "prc")
    }
}