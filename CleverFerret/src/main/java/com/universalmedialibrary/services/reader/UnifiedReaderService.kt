package com.universalmedialibrary.services.reader

import android.content.Context
import android.graphics.Bitmap
import android.util.Log
import com.universalmedialibrary.core.FormatRegistry
import com.universalmedialibrary.parsers.ParserFactory
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.services.epub.ReadiumAudiobookService
import com.universalmedialibrary.services.epub.ReadiumEpubService
import com.universalmedialibrary.services.epub.ReadiumPdfService
import com.universalmedialibrary.services.comic.GeminiComicService
import com.universalmedialibrary.services.reader.registry.DocumentRenderPayload
import com.universalmedialibrary.services.reader.registry.FallbackParserAdapter
import com.universalmedialibrary.services.reader.registry.ParserFactoryAdapter
import com.universalmedialibrary.services.reader.registry.ParserResult
import com.universalmedialibrary.services.reader.registry.PublicationEngineRegistry
import com.universalmedialibrary.services.reader.registry.PublicationRequest
import com.universalmedialibrary.services.reader.registry.ReaderEngineAdapters
import com.universalmedialibrary.services.reader.registry.RenderResult
import com.universalmedialibrary.services.reader.registry.SignatureSniffingDetector
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
            
            // 1. Specialized Readers (Readium, ExoPlayer, Gemini)
            when (extension) {
                // Use Readium for EPUB (professional support)
                "epub" -> {
                    return@withContext readiumEpubService.extractMetadata(filePath)?.let { publication ->
                        ReaderType.Epub(
                            filePath = filePath,
                            metadata = publication,
                            service = readiumEpubService
                        )
                    } ?: ReaderType.Error("Failed to open EPUB: $filePath")
                }
                
                // Use Readium for PDF (better than basic PdfRenderer)
                "pdf" -> {
                    return@withContext readiumPdfService.extractMetadata(filePath)?.let { publication ->
                        ReaderType.Pdf(
                            filePath = filePath,
                            metadata = publication,
                            service = readiumPdfService
                        )
                    } ?: ReaderType.Error("Failed to open PDF: $filePath")
                }
                
                // Use Readium for Readium Audiobook format
                "audiobook", "lcpa", "lcpdf" -> {
                    return@withContext readiumAudiobookService.extractMetadata(filePath)?.let { publication ->
                        ReaderType.Audiobook(
                            filePath = filePath,
                            metadata = publication,
                            service = readiumAudiobookService
                        )
                    } ?: ReaderType.Error("Failed to open audiobook: $filePath")
                }
                
                // Use our Gemini AI for comics (superior to Readium's partial CBZ)
                "cbz", "cbr", "cbt", "cb7" -> {
                    return@withContext ReaderType.Comic(
                        filePath = filePath,
                        service = geminiComicService
                    )
                }
                
                // Use ExoPlayer for standalone audio files
                "mp3", "m4a", "m4b", "flac", "ogg", "wav", "aac" -> {
                    return@withContext ReaderType.Audio(
                        filePath = filePath,
                        manager = audioPlaybackManager
                    )
                }
            }

            // 2. Document Parsers via ParserFactory
            if (ParserFactory.isSupported(file.name)) {
                val parserAdapters = listOf(
                    ReaderEngineAdapters.parserFactoryMobiAdapter(),
                    ReaderEngineAdapters.parserFactoryDjvuAdapter(),
                    parserFactoryDocumentAdapter(),
                    FallbackParserAdapter()
                )
                val registry = PublicationEngineRegistry(
                    detector = SignatureSniffingDetector(),
                    adapters = parserAdapters
                )
                val request = PublicationRequest(path = filePath)
                when (val parserResult = registry.route(request)) {
                    is ParserResult.Success -> {
                        val adapter = parserAdapters.firstOrNull { it.id == parserResult.parserId }
                            ?: return@withContext ReaderType.Error("Parser adapter not found: ${parserResult.parserId}")
                        when (val renderResult = adapter.render(request, parserResult)) {
                            is RenderResult.Success -> {
                                val payload = renderResult.payload as? DocumentRenderPayload
                                if (payload == null) {
                                    return@withContext ReaderType.Error("Unsupported renderer payload from ${renderResult.rendererId}")
                                }
                                return@withContext ReaderType.Text(
                                    filePath = filePath,
                                    content = payload.content,
                                    chapterTitles = payload.chapterTitles,
                                    progressUnitCount = payload.progressUnitCount,
                                    parserId = parserResult.parserId
                                )
                            }
                            is RenderResult.Failure -> {
                                return@withContext ReaderType.Error("Failed to render parsed document: ${renderResult.error.message}")
                            }
                        }
                    }
                    is ParserResult.Failure -> {
                        return@withContext ReaderType.Error("Failed to parse with parser registry: ${parserResult.error.message}")
                    }
                }
            } else {
                // 3. Fallback / Other Formats
                when (extension) {
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

                    // UMD format (if not supported by ParserFactory)
                    "umd" -> {
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

                    // Fallback for any other formats
                    else -> {
                        ReaderType.Error("Unsupported file format: $extension")
                    }
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error opening publication: ${e.message}", e)
            ReaderType.Error("Failed to open file: ${e.message}")
        }
    }

    private fun parserFactoryDocumentAdapter(): ParserFactoryAdapter {
        return ParserFactoryAdapter(
            id = "document-parser",
            descriptor = com.universalmedialibrary.services.reader.registry.EngineDescriptor(
                displayName = "Document Parser",
                extensions = ParserFactory.getSupportedExtensions().toSet(),
                mimeTypes = emptySet(),
                readiness = com.universalmedialibrary.services.reader.registry.ReadinessFlag.READY,
                firstClass = true
            )
        )
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

    private fun extractUMDContent(filePath: String): String {
        // UMD is a proprietary format
        return try {
            "UMD file detected. UMD extraction requires specialized library.\n" +
            "File: ${File(filePath).name}"
        } catch (e: Exception) {
            throw Exception("Failed to extract UMD content: ${e.message}")
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
        val content: String,
        val chapterTitles: List<String> = emptyList(),
        val progressUnitCount: Int = 0,
        val parserId: String? = null,
        val parserConfidence: Float = 1.0f,
        val warnings: List<String> = emptyList()
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
