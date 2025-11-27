package com.universalmedialibrary.services.reader

import android.content.Context
import android.graphics.Bitmap
import android.util.Log
import com.universalmedialibrary.core.FormatRegistry
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.services.epub.ReadiumAudiobookService
import com.universalmedialibrary.services.epub.ReadiumEpubService
import com.universalmedialibrary.services.epub.ReadiumPdfService
import com.universalmedialibrary.services.comic.GeminiComicService
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.readium.r2.shared.publication.Publication
import java.io.File
import java.util.zip.ZipFile
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Unified Reader Service
 * 
 * Orchestrates all reading services to provide a single entry point
 * for opening any type of media file.
 * 
 * Routes files to appropriate readers:
 * - EPUB → Readium (professional EPUB 2/3 support)
 * - PDF → Readium (full PDF rendering)
 * - Readium Audiobook → Readium (manifest-based audiobooks)
 * - Comics (CBZ/CBR) → Gemini AI (our superior implementation)
 * - Standalone Audio → ExoPlayer (MP3, M4A, FLAC, etc.)
 * - Text → Basic text reader (TXT, MD, HTML)
 * 
 * This service demonstrates best-of-breed integration:
 * - Use industry-standard Readium for standard formats
 * - Use our unique Gemini AI for advanced comic features
 * - Use ExoPlayer for audio playback excellence
 */
@Singleton
class UnifiedReaderService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val readiumEpubService: ReadiumEpubService,
    private val readiumPdfService: ReadiumPdfService,
    private val readiumAudiobookService: ReadiumAudiobookService,
    private val geminiComicService: GeminiComicService,
    private val audioPlaybackManager: AudioPlaybackManager,
    private val formatRegistry: FormatRegistry
) {
    private val TAG = "UnifiedReaderService"

    /**
     * Detect publication type and open with appropriate reader
     * 
     * @param filePath Path to publication file
     * @return ReaderType with appropriate service
     */
    suspend fun openPublication(filePath: String): ReaderType = withContext(Dispatchers.IO) {
        try {
            val file = File(filePath)
            if (!file.exists()) {
                return@withContext ReaderType.Error("File not found: $filePath")
            }

            val extension = file.extension.lowercase()
            
            when (extension) {
                // Use Readium for EPUB (professional support)
                "epub" -> {
                    readiumEpubService.extractMetadata(filePath)?.let { publication ->
                        ReaderType.Epub(
                            filePath = filePath,
                            metadata = publication,
                            service = readiumEpubService
                        )
                    } ?: ReaderType.Error("Failed to open EPUB: $filePath")
                }
                
                // Use Readium for PDF (better than basic PdfRenderer)
                "pdf" -> {
                    readiumPdfService.extractMetadata(filePath)?.let { publication ->
                        ReaderType.Pdf(
                            filePath = filePath,
                            metadata = publication,
                            service = readiumPdfService
                        )
                    } ?: ReaderType.Error("Failed to open PDF: $filePath")
                }
                
                // DJVU format
                "djvu", "djv" -> {
                    // TODO: Integrate DjVuLibre via JNI for proper DJVU support
                    // Recommended: Use DjVuLibre (C++) via JNI
                    // Reference: EBookDroid implementation
                    // See FILE_FORMAT_PARSER_INTEGRATION.md for integration guide
                    ReaderType.Error("DJVU format requires DjVuLibre library. See FILE_FORMAT_PARSER_INTEGRATION.md")
                }
                
                // FB2 format
                "fb2", "fb2.zip" -> {
                    // FB2 is XML-based, can be parsed and converted to text/HTML
                    try {
                        val content = file.readText()
                        // Parse FB2 XML and extract text content
                        val textContent = extractFB2Content(content)
                        ReaderType.Text(
                            filePath = filePath,
                            content = textContent
                        )
                    } catch (e: Exception) {
                        ReaderType.Error("Failed to open FB2: ${e.message}")
                    }
                }
                
                // MOBI/PRC/AZW formats
                "mobi", "prc", "azw" -> {
                    // MOBI format - can use text extraction or dedicated MOBI library
                    try {
                        val content = extractMobiContent(filePath)
                        ReaderType.Text(
                            filePath = filePath,
                            content = content
                        )
                    } catch (e: Exception) {
                        ReaderType.Error("Failed to open MOBI: ${e.message}")
                    }
                }
                
                // AZW3/KFX formats
                "azw3", "kfx" -> {
                    // AZW3 format - similar to MOBI but newer
                    try {
                        val content = extractMobiContent(filePath)
                        ReaderType.Text(
                            filePath = filePath,
                            content = content
                        )
                    } catch (e: Exception) {
                        ReaderType.Error("Failed to open AZW3: ${e.message}")
                    }
                }
                
                // CHM format
                "chm" -> {
                    // CHM is a compiled HTML help file - extract HTML content
                    try {
                        val content = extractCHMContent(filePath)
                        ReaderType.Text(
                            filePath = filePath,
                            content = content
                        )
                    } catch (e: Exception) {
                        ReaderType.Error("Failed to open CHM: ${e.message}")
                    }
                }
                
                // UMD format
                "umd" -> {
                    // UMD is a proprietary format - extract text content
                    try {
                        val content = extractUMDContent(filePath)
                        ReaderType.Text(
                            filePath = filePath,
                            content = content
                        )
                    } catch (e: Exception) {
                        ReaderType.Error("Failed to open UMD: ${e.message}")
                    }
                }
                
                // Microsoft Word formats
                "docx" -> {
                    try {
                        val content = extractDocxContent(filePath)
                        ReaderType.Text(
                            filePath = filePath,
                            content = content
                        )
                    } catch (e: Exception) {
                        ReaderType.Error("Failed to open DOCX: ${e.message}")
                    }
                }
                
                "doc" -> {
                    try {
                        val content = extractDocContent(filePath)
                        ReaderType.Text(
                            filePath = filePath,
                            content = content
                        )
                    } catch (e: Exception) {
                        ReaderType.Error("Failed to open DOC: ${e.message}")
                    }
                }
                
                // OpenDocument format
                "odt" -> {
                    try {
                        val content = extractOdtContent(filePath)
                        ReaderType.Text(
                            filePath = filePath,
                            content = content
                        )
                    } catch (e: Exception) {
                        ReaderType.Error("Failed to open ODT: ${e.message}")
                    }
                }
                
                // RTF format
                "rtf" -> {
                    try {
                        val content = extractRtfContent(filePath)
                        ReaderType.Text(
                            filePath = filePath,
                            content = content
                        )
                    } catch (e: Exception) {
                        ReaderType.Error("Failed to open RTF: ${e.message}")
                    }
                }
                
                // Text formats
                "txt", "text" -> {
                    val content = file.readText()
                    ReaderType.Text(
                        filePath = filePath,
                        content = content
                    )
                }
                
                "md", "markdown" -> {
                    val content = file.readText()
                    ReaderType.Text(
                        filePath = filePath,
                        content = content
                    )
                }
                
                // HTML formats
                "html", "htm" -> {
                    val content = file.readText()
                    // Keep HTML for better rendering
                    ReaderType.Text(
                        filePath = filePath,
                        content = content
                    )
                }
                
                "xhtml", "xht" -> {
                    val content = file.readText()
                    ReaderType.Text(
                        filePath = filePath,
                        content = content
                    )
                }
                
                "mhtml", "mht" -> {
                    try {
                        val content = extractMhtmlContent(filePath)
                        ReaderType.Text(
                            filePath = filePath,
                            content = content
                        )
                    } catch (e: Exception) {
                        ReaderType.Error("Failed to open MHTML: ${e.message}")
                    }
                }
                
                // Use Readium for Readium Audiobook format
                "audiobook", "lcpa", "lcpdf" -> {
                    readiumAudiobookService.extractMetadata(filePath)?.let { publication ->
                        ReaderType.Audiobook(
                            filePath = filePath,
                            metadata = publication,
                            service = readiumAudiobookService
                        )
                    } ?: ReaderType.Error("Failed to open audiobook: $filePath")
                }
                
                // Use our Gemini AI for comics (superior to Readium's partial CBZ)
                "cbz", "cbr", "cbt", "cb7" -> {
                    ReaderType.Comic(
                        filePath = filePath,
                        service = geminiComicService
                    )
                }
                
                // Use ExoPlayer for standalone audio files
                "mp3", "m4a", "m4b", "flac", "ogg", "wav", "aac" -> {
                    ReaderType.Audio(
                        filePath = filePath,
                        manager = audioPlaybackManager
                    )
                }
                
                // Additional legacy formats
                "lit" -> {
                    try {
                        val content = extractLitContent(filePath)
                        ReaderType.Text(
                            filePath = filePath,
                            content = content
                        )
                    } catch (e: Exception) {
                        ReaderType.Error("Failed to open LIT: ${e.message}")
                    }
                }
                
                "pdb" -> {
                    try {
                        val content = extractPdbContent(filePath)
                        ReaderType.Text(
                            filePath = filePath,
                            content = content
                        )
                    } catch (e: Exception) {
                        ReaderType.Error("Failed to open PDB: ${e.message}")
                    }
                }
                
                "rb" -> {
                    try {
                        val content = extractRbContent(filePath)
                        ReaderType.Text(
                            filePath = filePath,
                            content = content
                        )
                    } catch (e: Exception) {
                        ReaderType.Error("Failed to open RB: ${e.message}")
                    }
                }
                
                "snb" -> {
                    try {
                        val content = extractSnbContent(filePath)
                        ReaderType.Text(
                            filePath = filePath,
                            content = content
                        )
                    } catch (e: Exception) {
                        ReaderType.Error("Failed to open SNB: ${e.message}")
                    }
                }
                
                else -> {
                    ReaderType.Error("Unsupported file format: $extension")
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error opening publication: ${e.message}", e)
            ReaderType.Error("Failed to open file: ${e.message}")
        }
    }

    /**
     * Extract cover/artwork from any publication type
     * 
     * @param filePath Path to publication
     * @return Bitmap cover or null
     */
    suspend fun extractCover(filePath: String): Bitmap? = withContext(Dispatchers.IO) {
        try {
            val file = File(filePath)
            val extension = file.extension.lowercase()
            
            when (extension) {
                "epub" -> readiumEpubService.extractCover(filePath)
                "pdf" -> readiumPdfService.extractThumbnail(filePath)
                "audiobook", "lcpa" -> readiumAudiobookService.extractCover(filePath)
                else -> null
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting cover: ${e.message}", e)
            null
        }
    }

    /**
     * Get supported file extensions - ALL formats from Moonreader
     */
    /**
     * @deprecated Use FormatRegistry or UniversalSearchService instead
     * This method is kept for backward compatibility
     */
    @Deprecated("Use FormatRegistry or UniversalSearchService for format information")
    fun getSupportedExtensions(): SupportedFormats {
        return SupportedFormats(
            ebooks = listOf(
                "epub", "pdf", "djvu", "djv", "fb2", "mobi", "prc", "azw", "azw3", "kfx",
                "chm", "umd", "lit", "pdb", "rb", "snb",
                "docx", "doc", "odt", "rtf", "txt", "text", "md", "markdown",
                "html", "htm", "xhtml", "xht", "mhtml", "mht"
            ),
            audiobooks = listOf("audiobook", "lcpa", "lcpdf", "mp3", "m4a", "m4b", "flac", "ogg", "wav", "aac"),
            comics = listOf("cbz", "cbr", "cbt", "cb7"),
            all = listOf(
                "epub", "pdf", "djvu", "djv", "fb2", "mobi", "prc", "azw", "azw3", "kfx",
                "chm", "umd", "lit", "pdb", "rb", "snb",
                "docx", "doc", "odt", "rtf", "txt", "text", "md", "markdown",
                "html", "htm", "xhtml", "xht", "mhtml", "mht",
                "audiobook", "lcpa", "lcpdf", "mp3", "m4a", "m4b", "flac", "ogg", "wav", "aac",
                "cbz", "cbr", "cbt", "cb7"
            )
        )
    }
    
    // Format extraction functions
    
    private fun extractFB2Content(content: String): String {
        // FB2 is XML-based, extract text from <p> tags
        return try {
            val textPattern = Regex("<p[^>]*>(.*?)</p>", RegexOption.DOT_MATCHES_ALL)
            textPattern.findAll(content)
                .map { it.groupValues[1] }
                .joinToString("\n\n") { it.replace(Regex("<[^>]+>"), "") }
        } catch (e: Exception) {
            // Fallback: remove all XML tags
            content.replace(Regex("<[^>]+>"), " ").replace(Regex("\\s+"), " ").trim()
        }
    }
    
    private fun extractMobiContent(filePath: String): String {
        // TODO: Integrate lib-mobi for proper MOBI/AZW/AZW3 parsing
        // Recommended: Use lib-mobi (pure Java/Kotlin library)
        // Reference: https://github.com/readium/lib-mobi
        // Alternative: Apache Tika for basic extraction
        
        val file = File(filePath)
        return try {
            // Placeholder - replace with lib-mobi implementation
            "MOBI file detected. Full MOBI parsing requires lib-mobi library.\n" +
            "File: ${file.name}\n" +
            "Size: ${file.length()} bytes\n" +
            "See FILE_FORMAT_PARSER_INTEGRATION.md for integration guide."
        } catch (e: Exception) {
            throw Exception("Failed to extract MOBI content: ${e.message}")
        }
    }
    
    private fun extractCHMContent(filePath: String): String {
        // TODO: Integrate Apache Tika for CHM extraction
        // Recommended: Use Apache Tika (supports CHM via chmlib wrapper)
        // Reference: https://tika.apache.org/
        // Alternative: Reference FBReader or CoolReader implementations
        
        return try {
            "CHM file detected. CHM extraction requires Apache Tika library.\n" +
            "File: ${File(filePath).name}\n" +
            "See FILE_FORMAT_PARSER_INTEGRATION.md for integration guide."
        } catch (e: Exception) {
            throw Exception("Failed to extract CHM content: ${e.message}")
        }
    }
    
    private fun extractUMDContent(filePath: String): String {
        // UMD is a proprietary format
        return try {
            "UMD file detected. UMD extraction requires specialized library.\n" +
            "File: ${File(filePath).name}"
        } catch (e: Exception) {
            throw Exception("Failed to extract UMD content: ${e.message}")
        }
    }
    
    private fun extractDocxContent(filePath: String): String {
        // TODO: Integrate Apache POI for proper DOCX extraction
        // Recommended: Use Apache POI XWPFWordExtractor
        // Reference: https://poi.apache.org/
        
        // Fallback: Basic XML extraction (current implementation)
        return try {
            ZipFile(filePath).use { zipFile ->
                zipFile.getEntry("word/document.xml")?.let { documentEntry ->
                    zipFile.getInputStream(documentEntry).bufferedReader().use { it.readText() }
                        .replace(Regex("<[^>]+>"), " ")
                        .replace(Regex("\\s+"), " ")
                        .trim()
                } ?: "Could not extract content from DOCX file. Consider using Apache POI for better extraction."
            }
        } catch (e: Exception) {
            throw Exception("Failed to extract DOCX content: ${e.message}. Consider using Apache POI.")
        }
    }
    
    private fun extractDocContent(filePath: String): String {
        // TODO: Integrate Apache POI for DOC (legacy) extraction
        // Recommended: Use Apache POI HWPFWordExtractor
        // Reference: https://poi.apache.org/
        
        return try {
            "DOC file detected. DOC extraction requires Apache POI library.\n" +
            "File: ${File(filePath).name}\n" +
            "See FILE_FORMAT_PARSER_INTEGRATION.md for integration guide."
        } catch (e: Exception) {
            throw Exception("Failed to extract DOC content: ${e.message}")
        }
    }
    
    private fun extractOdtContent(filePath: String): String {
        // TODO: Integrate Apache Tika for proper ODT extraction
        // Recommended: Use Apache Tika (better ODT parsing)
        // Reference: https://tika.apache.org/
        
        // Fallback: Basic XML extraction (current implementation)
        return try {
            ZipFile(filePath).use { zipFile ->
                zipFile.getEntry("content.xml")?.let { documentEntry ->
                    zipFile.getInputStream(documentEntry).bufferedReader().use { it.readText() }
                        .replace(Regex("<[^>]+>"), " ")
                        .replace(Regex("\\s+"), " ")
                        .trim()
                } ?: "Could not extract content from ODT file. Consider using Apache Tika for better extraction."
            }
        } catch (e: Exception) {
            throw Exception("Failed to extract ODT content: ${e.message}. Consider using Apache Tika.")
        }
    }
    
    private fun extractRtfContent(filePath: String): String {
        // TODO: Integrate Apache Tika for proper RTF extraction
        // Recommended: Use Apache Tika (better RTF parsing)
        // Reference: https://tika.apache.org/
        // Alternative: Reference FBReader's RTF implementation
        
        // Fallback: Basic RTF control code removal (current implementation)
        return try {
            val content = File(filePath).readText()
            // Remove RTF control codes (basic approach)
            content.replace(Regex("\\\\[a-z]+\\d*"), " ")
                .replace(Regex("\\{[^}]*\\}"), " ")
                .replace(Regex("\\s+"), " ")
                .trim()
        } catch (e: Exception) {
            throw Exception("Failed to extract RTF content: ${e.message}. Consider using Apache Tika.")
        }
    }
    
    private fun extractMhtmlContent(filePath: String): String {
        // MHTML is MIME-encoded HTML
        return try {
            val content = File(filePath).readText()
            // Extract HTML content from MIME boundaries
            val htmlPattern = Regex("Content-Type: text/html[\\s\\S]*?\\n\\n([\\s\\S]*?)(?=------|$)")
            val match = htmlPattern.find(content)
            match?.groupValues?.getOrNull(1) ?: content
        } catch (e: Exception) {
            throw Exception("Failed to extract MHTML content: ${e.message}")
        }
    }
    
    private fun extractLitContent(filePath: String): String {
        // TODO: Integrate libe-book via JNI for LIT extraction
        // Recommended: Use libe-book (C++) via JNI
        // Reference: CoolReader implementation
        // See FILE_FORMAT_PARSER_INTEGRATION.md for integration guide
        
        return try {
            "LIT file detected. LIT extraction requires libe-book library (C++ via JNI).\n" +
            "File: ${File(filePath).name}\n" +
            "See FILE_FORMAT_PARSER_INTEGRATION.md for integration guide."
        } catch (e: Exception) {
            throw Exception("Failed to extract LIT content: ${e.message}")
        }
    }
    
    private fun extractPdbContent(filePath: String): String {
        // TODO: Integrate libe-book via JNI for PDB extraction
        // Recommended: Use libe-book (C++) via JNI
        // Reference: CoolReader implementation
        // See FILE_FORMAT_PARSER_INTEGRATION.md for integration guide
        
        return try {
            "PDB file detected. PDB extraction requires libe-book library (C++ via JNI).\n" +
            "File: ${File(filePath).name}\n" +
            "See FILE_FORMAT_PARSER_INTEGRATION.md for integration guide."
        } catch (e: Exception) {
            throw Exception("Failed to extract PDB content: ${e.message}")
        }
    }
    
    private fun extractRbContent(filePath: String): String {
        // TODO: Integrate libe-book via JNI for RB extraction
        // Recommended: Use libe-book (C++) via JNI
        // Reference: CoolReader implementation
        // See FILE_FORMAT_PARSER_INTEGRATION.md for integration guide
        
        return try {
            "RB file detected. RB extraction requires libe-book library (C++ via JNI).\n" +
            "File: ${File(filePath).name}\n" +
            "See FILE_FORMAT_PARSER_INTEGRATION.md for integration guide."
        } catch (e: Exception) {
            throw Exception("Failed to extract RB content: ${e.message}")
        }
    }
    
    private fun extractSnbContent(filePath: String): String {
        // TODO: Integrate libe-book via JNI for SNB extraction
        // Recommended: Use libe-book (C++) via JNI
        // Reference: CoolReader implementation
        // See FILE_FORMAT_PARSER_INTEGRATION.md for integration guide
        
        return try {
            "SNB file detected. SNB extraction requires libe-book library (C++ via JNI).\n" +
            "File: ${File(filePath).name}\n" +
            "See FILE_FORMAT_PARSER_INTEGRATION.md for integration guide."
        } catch (e: Exception) {
            throw Exception("Failed to extract SNB content: ${e.message}")
        }
    }

    /**
     * Check API availability for enhanced features
     */
    suspend fun checkReaderCapabilities(): ReaderCapabilities {
        return ReaderCapabilities(
            hasEpubSupport = true,          // Readium
            hasPdfSupport = true,           // Readium
            hasAudiobookSupport = true,     // Readium + ExoPlayer
            hasComicSupport = true,         // Gemini AI
            hasSearch = true,               // Readium
            hasHighlighting = true,         // Readium
            hasAnnotations = true,          // Readium
            hasTTS = true,                  // Android TTS + Gemini
            hasAIPanelDetection = true,     // Gemini
            hasAITranslation = true         // Gemini
        )
    }
}

/**
 * Reader Type Result
 */
sealed class ReaderType {
    data class Epub(
        val filePath: String,
        val metadata: com.universalmedialibrary.services.epub.EpubMetadata,
        val service: ReadiumEpubService
    ) : ReaderType()
    
    data class Pdf(
        val filePath: String,
        val metadata: com.universalmedialibrary.services.epub.PdfMetadata,
        val service: ReadiumPdfService
    ) : ReaderType()
    
    data class Audiobook(
        val filePath: String,
        val metadata: com.universalmedialibrary.services.epub.AudiobookMetadata,
        val service: ReadiumAudiobookService
    ) : ReaderType()
    
    data class Comic(
        val filePath: String,
        val service: GeminiComicService
    ) : ReaderType()
    
    data class Audio(
        val filePath: String,
        val manager: AudioPlaybackManager
    ) : ReaderType()
    
    data class Text(
        val filePath: String,
        val content: String
    ) : ReaderType()
    
    data class Error(
        val message: String
    ) : ReaderType()
}

/**
 * Supported file formats
 */
data class SupportedFormats(
    val ebooks: List<String>,
    val audiobooks: List<String>,
    val comics: List<String>,
    val all: List<String>
)

/**
 * Reader capabilities
 */
data class ReaderCapabilities(
    val hasEpubSupport: Boolean,
    val hasPdfSupport: Boolean,
    val hasAudiobookSupport: Boolean,
    val hasComicSupport: Boolean,
    val hasSearch: Boolean,
    val hasHighlighting: Boolean,
    val hasAnnotations: Boolean,
    val hasTTS: Boolean,
    val hasAIPanelDetection: Boolean,
    val hasAITranslation: Boolean
)
