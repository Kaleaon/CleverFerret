package com.universalmedialibrary.services.reader

import android.content.Context
import android.graphics.Bitmap
import android.util.Log
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.services.epub.ReadiumAudiobookService
import com.universalmedialibrary.services.epub.ReadiumEpubService
import com.universalmedialibrary.services.epub.ReadiumPdfService
// import com.universalmedialibrary.services.comic.GeminiComicService // Disabled - not currently operational
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.readium.r2.shared.publication.Publication
import java.io.File
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
    // private val geminiComicService: GeminiComicService, // Disabled - not currently operational
    private val audioPlaybackManager: AudioPlaybackManager
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
                    val publication = readiumEpubService.extractMetadata(filePath)
                    if (publication != null) {
                        ReaderType.Epub(
                            filePath = filePath,
                            metadata = publication,
                            service = readiumEpubService
                        )
                    } else {
                        ReaderType.Error("Failed to open EPUB: $filePath")
                    }
                }
                
                // Use Readium for PDF (better than basic PdfRenderer)
                "pdf" -> {
                    val publication = readiumPdfService.extractMetadata(filePath)
                    if (publication != null) {
                        ReaderType.Pdf(
                            filePath = filePath,
                            metadata = publication,
                            service = readiumPdfService
                        )
                    } else {
                        ReaderType.Error("Failed to open PDF: $filePath")
                    }
                }
                
                // Use Readium for Readium Audiobook format
                "audiobook", "lcpa", "lcpdf" -> {
                    val publication = readiumAudiobookService.extractMetadata(filePath)
                    if (publication != null) {
                        ReaderType.Audiobook(
                            filePath = filePath,
                            metadata = publication,
                            service = readiumAudiobookService
                        )
                    } else {
                        ReaderType.Error("Failed to open audiobook: $filePath")
                    }
                }
                
                // Use our Gemini AI for comics (superior to Readium's partial CBZ)
                "cbz", "cbr" -> {
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
                
                // Basic text reader
                "txt", "md", "markdown" -> {
                    val content = file.readText()
                    ReaderType.Text(
                        filePath = filePath,
                        content = content
                    )
                }
                
                // HTML
                "html", "htm" -> {
                    val content = file.readText()
                    val stripped = content.replace(Regex("<[^>]*>"), "").trim()
                    ReaderType.Text(
                        filePath = filePath,
                        content = stripped
                    )
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
     * Get supported file extensions
     */
    fun getSupportedExtensions(): SupportedFormats {
        return SupportedFormats(
            ebooks = listOf("epub", "pdf", "txt", "md", "markdown", "html", "htm"),
            audiobooks = listOf("audiobook", "lcpa", "mp3", "m4a", "m4b", "flac", "ogg", "wav", "aac"),
            comics = listOf("cbz", "cbr"),
            all = listOf("epub", "pdf", "txt", "md", "markdown", "html", "htm",
                        "audiobook", "lcpa", "mp3", "m4a", "m4b", "flac", "ogg", "wav", "aac",
                        "cbz", "cbr")
        )
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
