package com.universalmedialibrary.parsers.impl

import com.universalmedialibrary.parsers.*
import de.m3y.mobi.core.MobiHeader
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.apache.tika.Tika
import org.apache.tika.metadata.Metadata
import org.apache.tika.parser.AutoDetectParser
import org.apache.tika.parser.ParseContext
import org.apache.tika.sax.BodyContentHandler
import java.io.DataInputStream
import java.io.File
import java.io.FileInputStream
import java.io.InputStream
import java.io.BufferedInputStream

/**
 * Parser for MOBI/AZW/AZW3 files using lib-mobi (Pure Java) AND Apache Tika
 * 
 * MOBI is an eBook format developed by Mobipocket and used by Amazon Kindle.
 * AZW and AZW3 are Amazon's proprietary variants of the MOBI format.
 * 
 * This implementation uses:
 * 1. lib-mobi for specialized metadata extraction (better than Tika for Kindle formats)
 * 2. Apache Tika as a fallback/primary engine for text extraction
 * 
 * Libraries:
 * - https://github.com/marcelmay/lib-mobi
 * - Apache Tika
 * 
 * Features:
 * - Pure Java implementation (no JNI required)
 * - Deep Metadata extraction from MOBI/AZW/AZW3 files
 * - Text content extraction via Tika
 */
class MobiParser : DocumentParser {
    
    private val tika = Tika()

    override suspend fun parse(filePath: String): ParsedDocument = withContext(Dispatchers.IO) {
        try {
            // We need to read the file twice: once for lib-mobi (metadata) and once for Tika (content)

            // 1. Extract Metadata using lib-mobi (requires DataInputStream)
            val metadata = FileInputStream(filePath).use { fis ->
                DataInputStream(fis).use { dis ->
                    val header = MobiHeader.read(dis)
                    extractMetadata(header, File(filePath).name)
                }
            }

            // 2. Extract Content using Tika (requires InputStream)
            val content = try {
                FileInputStream(filePath).use { fis ->
                    extractContentWithTika(fis)
                }
            } catch (e: Exception) {
                // Fallback if Tika fails: extract summary info from lib-mobi
                "Failed to extract text content. \n\n" +
                FileInputStream(filePath).use { fis ->
                    DataInputStream(fis).use { dis ->
                        val header = MobiHeader.read(dis)
                        extractContentInfo(header, filePath)
                    }
                }
            }

            return@withContext ParsedDocument(
                content = content,
                metadata = metadata,
                structure = null // Tika structure extraction is limited for binary formats
            )

        } catch (e: Exception) {
            throw ParserException("Failed to parse MOBI file: $filePath", e)
        }
    }
    
    override suspend fun parse(inputStream: InputStream, fileName: String): ParsedDocument = 
        withContext(Dispatchers.IO) {
            try {
                // InputStreams can usually only be read once.
                // We wrap it in a BufferedInputStream and mark it if supported,
                // or we prioritize Tika for content if we can't rewind.

                val bufferedIs = if (inputStream.markSupported()) inputStream else BufferedInputStream(inputStream)
                bufferedIs.mark(Int.MAX_VALUE)

                // 1. Try to read metadata with lib-mobi
                val metadata = try {
                    DataInputStream(bufferedIs).use { dis ->
                        // Note: MobiHeader.read might close the stream, which is problematic.
                        // Ideally we should use a copy or Tika's metadata if we can't reset.
                        // For safety in this generic stream context, let's try Tika first for content
                        // as that's the primary user goal.
                        null
                    }
                } catch (e: Exception) {
                    null
                }

                // Reset stream for content parsing
                try { bufferedIs.reset() } catch (e: Exception) {
                    // If we can't reset, we might be in trouble if we read anything above.
                    // But we set metadata to null above to skip reading, so we should be at start.
                }

                // 2. Extract content with Tika
                val content = extractContentWithTika(bufferedIs)

                // 3. Fallback metadata if lib-mobi wasn't used
                val finalMetadata = metadata ?: DocumentMetadata(
                    title = fileName,
                    format = "MOBI",
                    customProperties = emptyMap()
                )

                return@withContext ParsedDocument(
                    content = content,
                    metadata = finalMetadata,
                    structure = null
                )
            } catch (e: Exception) {
                throw ParserException("Failed to parse MOBI stream: $fileName", e)
            }
        }

    private fun extractContentWithTika(inputStream: InputStream): String {
        val handler = BodyContentHandler(-1) // No limit
        val metadata = Metadata()
        val parser = AutoDetectParser()
        val context = ParseContext()
        
        parser.parse(inputStream, handler, metadata, context)
        return handler.toString()
    }
    
    private fun extractMetadata(header: MobiHeader, fileName: String): DocumentMetadata {
        val exthHeader = header.exthHeader
        
        // MOBI EXTH record type codes
        val EXTH_TITLE = 503
        val EXTH_AUTHOR = 100
        val EXTH_CREATOR = 108
        val EXTH_SUBJECT = 105
        val EXTH_DESCRIPTION = 103
        val EXTH_KEYWORDS = 106
        val EXTH_LANGUAGE = 524
        val EXTH_ISBN = 104
        val EXTH_PUBLISHER = 101
        
        // Extract title
        val title = header.palmDatabaseHeader?.name 
            ?: exthHeader?.getRecordByTypeCode(EXTH_TITLE)?.data
            ?: fileName.substringBeforeLast(".")
        
        // Extract author
        val author = exthHeader?.getRecordByTypeCode(EXTH_AUTHOR)?.data
            ?: exthHeader?.getRecordByTypeCode(EXTH_CREATOR)?.data
        
        // Extract subject/description
        val subject = exthHeader?.getRecordByTypeCode(EXTH_SUBJECT)?.data
            ?: exthHeader?.getRecordByTypeCode(EXTH_DESCRIPTION)?.data
        
        // Extract keywords
        val keywords = exthHeader?.getRecordByTypeCode(EXTH_KEYWORDS)?.data
            ?.split(",")
            ?.map { it.trim() }
            ?: emptyList()
        
        // Extract dates
        val creationDate = header.palmDatabaseHeader?.creationDate?.toString()
        val modificationDate = header.palmDatabaseHeader?.modificationDate?.toString()
        
        // Extract language
        val language = exthHeader?.getRecordByTypeCode(EXTH_LANGUAGE)?.data
        
        // Extract custom properties
        val customProperties = mutableMapOf<String, String>()
        exthHeader?.getRecordByTypeCode(EXTH_ISBN)?.data?.let { customProperties["isbn"] = it }
        exthHeader?.getRecordByTypeCode(EXTH_PUBLISHER)?.data?.let { customProperties["publisher"] = it }
        
        customProperties["mobiType"] = header.mobiType?.toString() ?: "UNKNOWN"
        customProperties["encoding"] = header.encoding?.toString() ?: "UNKNOWN"
        customProperties["encrypted"] = (header.encryptionType > 0).toString()
        
        return DocumentMetadata(
            title = title,
            author = author,
            subject = subject,
            keywords = keywords,
            creationDate = creationDate,
            modificationDate = modificationDate,
            pageCount = null,
            wordCount = null,
            language = language,
            format = determineFormat(fileName, header),
            customProperties = customProperties
        )
    }
    
    private fun extractContentInfo(header: MobiHeader, filePath: String?): String {
        // Fallback method that just describes the file if text extraction fails
        val info = StringBuilder()
        info.appendLine("MOBI/AZW Document (Metadata Only)")
        info.appendLine("=================================")
        info.appendLine("Title: ${header.palmDatabaseHeader?.name}")
        info.appendLine("Format: ${determineFormat(filePath ?: "", header)}")
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
