package com.universalmedialibrary.services.ebook

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import com.universalmedialibrary.services.reader.core.BookSource
import com.universalmedialibrary.services.reader.core.Locator
import com.universalmedialibrary.services.reader.core.ReaderEngine
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.io.File
import java.io.RandomAccessFile
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.zip.Inflater
import javax.inject.Inject

/**
 * MOBI/AZW Reader Engine
 * 
 * Supports Amazon Kindle formats (MOBI, AZW, AZW3, PRC)
 * - MOBI 7/8 parsing
 * - HTML content extraction
 * - Image extraction
 * - Metadata parsing
 * - DRM-free books only
 * 
 * Note: This is a basic implementation. For full AZW3/KF8 support,
 * consider using a dedicated library like jmobi or calibre's ebook-convert.
 */
class MobiReaderEngine @Inject constructor() : ReaderEngine {

    override val bookId: String get() = currentBookId

    private var currentBookId: String = ""
    private var mobiFile: File? = null
    private var htmlContent: String = ""
    private var chapters: List<MobiChapter> = emptyList()
    private var currentChapterIndex: Int = 0
    private var images: Map<Int, ByteArray> = emptyMap()
    private var metadata: MobiMetadata? = null

    private val _currentLocator = MutableStateFlow(
        Locator(href = "", locations = emptyMap())
    )
    override val currentLocator: Flow<Locator> = _currentLocator.asStateFlow()

    override suspend fun open(context: Context, source: BookSource): Result<Unit> {
        return withContext(Dispatchers.IO) {
            try {
                val file = when (source) {
                    is BookSource.File -> {
                        when (source.uri.scheme) {
                            "file" -> File(source.uri.path!!)
                            "content" -> {
                                val extension = source.uri.toString().substringAfterLast(".")
                                val tempFile = File(
                                    context.cacheDir,
                                    "temp_mobi_${System.currentTimeMillis()}.$extension"
                                )
                                context.contentResolver.openInputStream(source.uri)?.use { input ->
                                    tempFile.outputStream().use { output ->
                                        input.copyTo(output)
                                    }
                                }
                                tempFile
                            }
                            else -> return@withContext Result.failure(
                                IllegalArgumentException("Unsupported URI scheme")
                            )
                        }
                    }
                    is BookSource.Stream -> {
                        return@withContext Result.failure(
                            UnsupportedOperationException("Stream sources not yet implemented")
                        )
                    }
                }

                if (!file.exists()) {
                    return@withContext Result.failure(
                        IllegalArgumentException("MOBI file not found")
                    )
                }

                mobiFile = file
                currentBookId = file.absolutePath

                // Parse MOBI file
                val parsed = parseMobiFile(file)
                htmlContent = parsed.htmlContent
                chapters = parsed.chapters
                images = parsed.images
                metadata = parsed.metadata

                if (chapters.isEmpty()) {
                    // Create a single chapter from full content
                    chapters = listOf(
                        MobiChapter(
                            index = 0,
                            title = metadata?.title ?: "Chapter 1",
                            htmlContent = htmlContent,
                            startOffset = 0
                        )
                    )
                }

                currentChapterIndex = 0
                updateCurrentLocator(0)

                Result.success(Unit)

            } catch (e: Exception) {
                close()
                Result.failure(e)
            }
        }
    }

    override suspend fun goTo(locator: Locator): Result<Unit> {
        return try {
            val chapterIndex = locator.locations["chapterIndex"] as? Int ?: 0

            if (chapterIndex in chapters.indices) {
                currentChapterIndex = chapterIndex
                updateCurrentLocator(chapterIndex)
                Result.success(Unit)
            } else {
                Result.failure(IndexOutOfBoundsException("Chapter index out of bounds"))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    override suspend fun next(): Boolean {
        return if (currentChapterIndex < chapters.size - 1) {
            currentChapterIndex++
            updateCurrentLocator(currentChapterIndex)
            true
        } else {
            false
        }
    }

    override suspend fun previous(): Boolean {
        return if (currentChapterIndex > 0) {
            currentChapterIndex--
            updateCurrentLocator(currentChapterIndex)
            true
        } else {
            false
        }
    }

    override suspend fun search(query: String): List<Locator> {
        val results = mutableListOf<Locator>()
        
        chapters.forEachIndexed { index, chapter ->
            if (chapter.htmlContent.contains(query, ignoreCase = true)) {
                results.add(
                    Locator(
                        href = "chapter_$index",
                        locations = mapOf("chapterIndex" to index),
                        text = chapter.title
                    )
                )
            }
        }
        
        return results
    }

    override suspend fun close() {
        mobiFile = null
        htmlContent = ""
        chapters = emptyList()
        images = emptyMap()
        metadata = null
        currentBookId = ""
        currentChapterIndex = 0
    }

    /**
     * Get current chapter HTML content
     */
    fun getCurrentChapterHtml(): String {
        return chapters.getOrNull(currentChapterIndex)?.htmlContent ?: ""
    }

    /**
     * Get current chapter info
     */
    fun getCurrentChapter(): MobiChapter? {
        return chapters.getOrNull(currentChapterIndex)
    }

    /**
     * Get all chapters
     */
    fun getAllChapters(): List<MobiChapter> {
        return chapters
    }

    /**
     * Get book metadata
     */
    fun getMetadata(): MobiMetadata? {
        return metadata
    }

    /**
     * Get image by index
     */
    fun getImage(index: Int): Bitmap? {
        val imageData = images[index] ?: return null
        return BitmapFactory.decodeByteArray(imageData, 0, imageData.size)
    }

    /**
     * Parse MOBI file structure
     */
    private fun parseMobiFile(file: File): ParsedMobi {
        RandomAccessFile(file, "r").use { raf ->
            // Read PDB header
            val header = readPDBHeader(raf)
            
            // Read MOBI header
            val mobiHeader = readMobiHeader(raf, header)
            
            // Extract HTML content
            val html = extractHtmlContent(raf, header, mobiHeader)
            
            // Extract images
            val imgs = extractImages(raf, header, mobiHeader)
            
            // Extract metadata
            val meta = extractMetadata(mobiHeader)
            
            // Parse chapters (simplified - use HTML structure)
            val chaps = parseChaptersFromHtml(html)
            
            return ParsedMobi(
                htmlContent = html,
                chapters = chaps,
                images = imgs,
                metadata = meta
            )
        }
    }

    private fun readPDBHeader(raf: RandomAccessFile): PDBHeader {
        raf.seek(0)
        val name = ByteArray(32)
        raf.read(name)
        
        raf.seek(60)
        val type = ByteArray(4)
        raf.read(type)
        
        raf.seek(76)
        val numRecords = raf.readUnsignedShort()
        
        // Read record info list
        val records = mutableListOf<RecordInfo>()
        for (i in 0 until numRecords) {
            val offset = raf.readInt()
            val attributes = raf.read()
            val id = ByteArray(3)
            raf.read(id)
            records.add(RecordInfo(offset, attributes.toByte(), id))
        }
        
        return PDBHeader(String(name).trim { it <= ' ' }, String(type), numRecords, records)
    }

    private fun readMobiHeader(raf: RandomAccessFile, pdbHeader: PDBHeader): MobiHeader {
        if (pdbHeader.records.isEmpty()) {
            throw IllegalArgumentException("No records found in MOBI file")
        }
        
        val record0Offset = pdbHeader.records[0].offset
        raf.seek(record0Offset.toLong())
        
        // Skip PalmDOC header (16 bytes)
        raf.skipBytes(16)
        
        // Read MOBI header identifier
        val identifier = ByteArray(4)
        raf.read(identifier)
        val mobiIdentifier = String(identifier)
        
        if (mobiIdentifier != "MOBI") {
            throw IllegalArgumentException("Not a valid MOBI file")
        }
        
        // Read header length
        val headerLength = raf.readInt()
        
        // Read MOBI type
        val mobiType = raf.readInt()
        
        // Read encoding
        val encoding = raf.readInt()
        
        // Skip to full name offset and length
        raf.seek(record0Offset + 84L)
        val fullNameOffset = raf.readInt()
        val fullNameLength = raf.readInt()
        
        // Read title if available
        var title = "Unknown"
        if (fullNameOffset > 0 && fullNameLength > 0) {
            raf.seek(record0Offset + fullNameOffset.toLong())
            val titleBytes = ByteArray(fullNameLength)
            raf.read(titleBytes)
            title = String(titleBytes, charset(if (encoding == 65001) "UTF-8" else "CP1252"))
        }
        
        return MobiHeader(
            identifier = mobiIdentifier,
            headerLength = headerLength,
            mobiType = mobiType,
            encoding = encoding,
            title = title
        )
    }

    private fun extractHtmlContent(raf: RandomAccessFile, pdbHeader: PDBHeader, mobiHeader: MobiHeader): String {
        val htmlBuilder = StringBuilder()
        
        // Read text records (typically records 1 to numTextRecords)
        // For simplicity, read first 10 records as text
        val numTextRecords = minOf(10, pdbHeader.records.size - 1)
        
        for (i in 1..numTextRecords) {
            if (i >= pdbHeader.records.size) break
            
            val recordOffset = pdbHeader.records[i].offset
            val nextOffset = if (i + 1 < pdbHeader.records.size) {
                pdbHeader.records[i + 1].offset
            } else {
                raf.length().toInt()
            }
            
            val recordSize = nextOffset - recordOffset
            if (recordSize <= 0 || recordSize > 1000000) continue
            
            raf.seek(recordOffset.toLong())
            val recordData = ByteArray(recordSize)
            raf.read(recordData)
            
            // Try to decompress (PalmDOC compression)
            val decompressed = try {
                decompressPalmDOC(recordData)
            } catch (e: Exception) {
                recordData
            }
            
            val text = String(
                decompressed,
                charset(if (mobiHeader.encoding == 65001) "UTF-8" else "CP1252")
            )
            htmlBuilder.append(text)
        }
        
        return htmlBuilder.toString()
    }

    private fun extractImages(raf: RandomAccessFile, pdbHeader: PDBHeader, mobiHeader: MobiHeader): Map<Int, ByteArray> {
        val imageMap = mutableMapOf<Int, ByteArray>()
        
        // Images typically start after text records
        // For simplicity, check last 10 records for image signatures
        val startIndex = maxOf(0, pdbHeader.records.size - 10)
        
        for (i in startIndex until pdbHeader.records.size) {
            val recordOffset = pdbHeader.records[i].offset
            val nextOffset = if (i + 1 < pdbHeader.records.size) {
                pdbHeader.records[i + 1].offset
            } else {
                raf.length().toInt()
            }
            
            val recordSize = nextOffset - recordOffset
            if (recordSize <= 0 || recordSize > 5000000) continue
            
            raf.seek(recordOffset.toLong())
            val signature = ByteArray(4)
            raf.read(signature)
            
            // Check for image signatures (JPEG: FFD8, PNG: 8950, GIF: 4749)
            val isImage = (signature[0] == 0xFF.toByte() && signature[1] == 0xD8.toByte()) ||
                          (signature[0] == 0x89.toByte() && signature[1] == 0x50.toByte()) ||
                          (signature[0] == 0x47.toByte() && signature[1] == 0x49.toByte())
            
            if (isImage) {
                raf.seek(recordOffset.toLong())
                val imageData = ByteArray(recordSize)
                raf.read(imageData)
                imageMap[i] = imageData
            }
        }
        
        return imageMap
    }

    private fun extractMetadata(mobiHeader: MobiHeader): MobiMetadata {
        return MobiMetadata(
            title = mobiHeader.title,
            author = null, // Would need EXTH header parsing
            publisher = null,
            language = null,
            isbn = null
        )
    }

    private fun parseChaptersFromHtml(html: String): List<MobiChapter> {
        // Simple chapter detection based on HTML headings or page breaks
        val chapters = mutableListOf<MobiChapter>()
        
        // Split by <mbp:pagebreak/> or chapter markers
        val chapterMarkers = listOf("<mbp:pagebreak/>", "<h1", "<h2")
        var lastIndex = 0
        var chapterNum = 0
        
        chapterMarkers.forEach { marker ->
            var index = html.indexOf(marker, lastIndex)
            while (index != -1) {
                if (index > lastIndex) {
                    val chapterContent = html.substring(lastIndex, index)
                    if (chapterContent.trim().isNotEmpty()) {
                        chapters.add(
                            MobiChapter(
                                index = chapterNum++,
                                title = "Chapter ${chapterNum}",
                                htmlContent = chapterContent,
                                startOffset = lastIndex
                            )
                        )
                    }
                    lastIndex = index
                }
                index = html.indexOf(marker, index + marker.length)
            }
        }
        
        // Add remaining content as last chapter
        if (lastIndex < html.length) {
            chapters.add(
                MobiChapter(
                    index = chapterNum,
                    title = "Chapter ${chapterNum + 1}",
                    htmlContent = html.substring(lastIndex),
                    startOffset = lastIndex
                )
            )
        }
        
        // If no chapters found, treat entire book as one chapter
        if (chapters.isEmpty()) {
            chapters.add(
                MobiChapter(
                    index = 0,
                    title = metadata?.title ?: "Book",
                    htmlContent = html,
                    startOffset = 0
                )
            )
        }
        
        return chapters
    }

    private fun decompressPalmDOC(data: ByteArray): ByteArray {
        val output = mutableListOf<Byte>()
        var i = 0
        
        while (i < data.size) {
            val c = data[i].toInt() and 0xFF
            
            when {
                c == 0 -> {
                    // Null byte, skip
                    i++
                }
                c in 1..8 -> {
                    // Copy next c bytes literally
                    for (j in 0 until c) {
                        if (i + 1 + j < data.size) {
                            output.add(data[i + 1 + j])
                        }
                    }
                    i += c + 1
                }
                c < 0x80 -> {
                    // Single literal byte
                    output.add(c.toByte())
                    i++
                }
                c in 0x80..0xBF -> {
                    // LZ77 back-reference
                    if (i + 1 < data.size) {
                        val next = data[i + 1].toInt() and 0xFF
                        val distance = ((c shl 8) or next) and 0x3FFF
                        val length = (next and 0x07) + 3
                        
                        val startPos = output.size - distance
                        for (j in 0 until length) {
                            if (startPos + j >= 0 && startPos + j < output.size) {
                                output.add(output[startPos + j])
                            }
                        }
                        i += 2
                    } else {
                        i++
                    }
                }
                else -> {
                    // Space + next byte
                    output.add(' '.code.toByte())
                    output.add((c xor 0x80).toByte())
                    i++
                }
            }
        }
        
        return output.toByteArray()
    }

    private fun updateCurrentLocator(chapterIndex: Int) {
        val chapter = chapters.getOrNull(chapterIndex)
        
        _currentLocator.value = Locator(
            href = chapter?.let { "chapter_${it.index}" } ?: "",
            locations = mapOf(
                "chapterIndex" to chapterIndex,
                "chapterNumber" to chapterIndex + 1,
                "totalChapters" to chapters.size
            ),
            text = chapter?.title ?: ""
        )
    }

    private fun RandomAccessFile.readUnsignedShort(): Int {
        val ch1 = read()
        val ch2 = read()
        return (ch1 shl 8) + ch2
    }

    private fun RandomAccessFile.readInt(): Int {
        val bytes = ByteArray(4)
        read(bytes)
        return ByteBuffer.wrap(bytes).order(ByteOrder.BIG_ENDIAN).int
    }

    // Data classes
    private data class PDBHeader(
        val name: String,
        val type: String,
        val numRecords: Int,
        val records: List<RecordInfo>
    )

    private data class RecordInfo(
        val offset: Int,
        val attributes: Byte,
        val id: ByteArray
    )

    private data class MobiHeader(
        val identifier: String,
        val headerLength: Int,
        val mobiType: Int,
        val encoding: Int,
        val title: String
    )

    private data class ParsedMobi(
        val htmlContent: String,
        val chapters: List<MobiChapter>,
        val images: Map<Int, ByteArray>,
        val metadata: MobiMetadata
    )

    data class MobiChapter(
        val index: Int,
        val title: String,
        val htmlContent: String,
        val startOffset: Int
    )

    data class MobiMetadata(
        val title: String,
        val author: String?,
        val publisher: String?,
        val language: String?,
        val isbn: String?
    )
}
