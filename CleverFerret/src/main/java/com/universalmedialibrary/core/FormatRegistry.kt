package com.universalmedialibrary.core

import com.universalmedialibrary.utils.SupportedBookFormat
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Centralized registry for all file formats supported by the application.
 * 
 * Provides unified search and discovery of file formats across:
 * - Books/Documents (EPUB, PDF, DOCX, etc.)
 * - Audio (MP3, M4A, FLAC, etc.)
 * - Video (MP4, MKV, AVI, etc.)
 * - Comics (CBZ, CBR, CBT, CB7)
 * - Images (PNG, JPG, WEBP, etc.)
 * 
 * All formats are searchable by:
 * - Extension
 * - MIME type
 * - Display name
 * - Description
 * - Category
 */
@Singleton
class FormatRegistry @Inject constructor() {
    
    /**
     * Format information for a file type
     */
    data class FormatInfo(
        val extension: String,
        val extensions: List<String>,
        val mimeTypes: List<String>,
        val displayName: String,
        val description: String,
        val category: FormatCategory,
        val isReadable: Boolean = true,
        val isWritable: Boolean = false,
        val readerService: String? = null // Service that handles this format
    )
    
    /**
     * Format categories for organization
     */
    enum class FormatCategory {
        EBOOK,      // EPUB, MOBI, PDF, etc.
        DOCUMENT,   // DOCX, ODT, RTF, etc.
        AUDIO,      // MP3, M4A, FLAC, etc.
        VIDEO,      // MP4, MKV, AVI, etc.
        COMIC,      // CBZ, CBR, CBT, CB7
        IMAGE,      // PNG, JPG, WEBP, etc.
        ARCHIVE,    // ZIP, RAR, 7Z, etc.
        TEXT,       // TXT, MD, HTML, etc.
        OTHER
    }
    
    /**
     * All registered formats indexed by extension
     */
    private val formatsByExtension = mutableMapOf<String, FormatInfo>()
    
    /**
     * All registered formats indexed by MIME type
     */
    private val formatsByMimeType = mutableMapOf<String, FormatInfo>()
    
    /**
     * All registered formats by category
     */
    private val formatsByCategory = mutableMapOf<FormatCategory, MutableList<FormatInfo>>()
    
    init {
        registerAllFormats()
    }
    
    /**
     * Register all supported formats
     */
    private fun registerAllFormats() {
        // Register book formats from SupportedBookFormat enum
        SupportedBookFormat.values().forEach { format ->
            format.extensions.forEach { ext ->
                val formatInfo = FormatInfo(
                    extension = ext,
                    extensions = format.extensions,
                    mimeTypes = format.mimeTypes,
                    displayName = format.displayName,
                    description = format.description,
                    category = when (format) {
                        SupportedBookFormat.EPUB, SupportedBookFormat.PDF, SupportedBookFormat.DJVU,
                        SupportedBookFormat.FB2, SupportedBookFormat.MOBI, SupportedBookFormat.AZW3,
                        SupportedBookFormat.CHM, SupportedBookFormat.UMD, SupportedBookFormat.LIT,
                        SupportedBookFormat.PDB, SupportedBookFormat.RB, SupportedBookFormat.SNB -> FormatCategory.EBOOK
                        SupportedBookFormat.DOCX, SupportedBookFormat.DOC, SupportedBookFormat.ODT, SupportedBookFormat.RTF -> FormatCategory.DOCUMENT
                        SupportedBookFormat.TXT, SupportedBookFormat.MD -> FormatCategory.TEXT
                        SupportedBookFormat.HTML, SupportedBookFormat.XHTML, SupportedBookFormat.MHTML -> FormatCategory.TEXT
                        SupportedBookFormat.CBZ, SupportedBookFormat.CBR, SupportedBookFormat.CBT, SupportedBookFormat.CB7 -> FormatCategory.COMIC
                    },
                    isReadable = true,
                    readerService = when (format) {
                        SupportedBookFormat.EPUB -> "ReadiumEpubService"
                        SupportedBookFormat.PDF -> "ReadiumPdfService"
                        SupportedBookFormat.CBZ, SupportedBookFormat.CBR, SupportedBookFormat.CBT, SupportedBookFormat.CB7 -> "GeminiComicService"
                        else -> "UnifiedReaderService"
                    }
                )
                formatsByExtension[ext.lowercase()] = formatInfo
                format.mimeTypes.forEach { mime ->
                    formatsByMimeType[mime.lowercase()] = formatInfo
                }
                formatsByCategory.getOrPut(formatInfo.category) { mutableListOf() }.add(formatInfo)
            }
        }
        
        // Register audio formats
        registerAudioFormats()
        
        // Register video formats
        registerVideoFormats()
        
        // Register image formats
        registerImageFormats()
    }
    
    /**
     * Register audio formats
     */
    private fun registerAudioFormats() {
        val audioFormats = listOf(
            FormatInfo("mp3", listOf("mp3"), listOf("audio/mpeg", "audio/mp3"), "MP3", "MPEG Audio Layer 3", FormatCategory.AUDIO, readerService = "ExoPlayerService"),
            FormatInfo("m4a", listOf("m4a"), listOf("audio/mp4", "audio/x-m4a"), "M4A", "MPEG-4 Audio", FormatCategory.AUDIO, readerService = "ExoPlayerService"),
            FormatInfo("m4b", listOf("m4b"), listOf("audio/mp4", "audio/x-m4b"), "M4B", "MPEG-4 Audio Book", FormatCategory.AUDIO, readerService = "ExoPlayerService"),
            FormatInfo("flac", listOf("flac"), listOf("audio/flac", "audio/x-flac"), "FLAC", "Free Lossless Audio Codec", FormatCategory.AUDIO, readerService = "ExoPlayerService"),
            FormatInfo("ogg", listOf("ogg", "oga"), listOf("audio/ogg", "audio/vorbis"), "OGG", "Ogg Vorbis", FormatCategory.AUDIO, readerService = "ExoPlayerService"),
            FormatInfo("wav", listOf("wav"), listOf("audio/wav", "audio/wave"), "WAV", "Waveform Audio", FormatCategory.AUDIO, readerService = "ExoPlayerService"),
            FormatInfo("aac", listOf("aac"), listOf("audio/aac"), "AAC", "Advanced Audio Coding", FormatCategory.AUDIO, readerService = "ExoPlayerService"),
            FormatInfo("opus", listOf("opus"), listOf("audio/opus"), "Opus", "Opus Audio", FormatCategory.AUDIO, readerService = "ExoPlayerService"),
            FormatInfo("audiobook", listOf("audiobook", "lcpa", "lcpdf"), listOf("application/audiobook+zip"), "Audiobook", "Readium Audiobook", FormatCategory.AUDIO, readerService = "ReadiumAudiobookService")
        )
        
        audioFormats.forEach { format ->
            format.extensions.forEach { ext ->
                formatsByExtension[ext.lowercase()] = format
            }
            format.mimeTypes.forEach { mime ->
                formatsByMimeType[mime.lowercase()] = format
            }
            formatsByCategory.getOrPut(format.category) { mutableListOf() }.add(format)
        }
    }
    
    /**
     * Register video formats
     */
    private fun registerVideoFormats() {
        val videoFormats = listOf(
            FormatInfo("mp4", listOf("mp4"), listOf("video/mp4"), "MP4", "MPEG-4 Video", FormatCategory.VIDEO, readerService = "ExoPlayerService"),
            FormatInfo("mkv", listOf("mkv"), listOf("video/x-matroska"), "MKV", "Matroska Video", FormatCategory.VIDEO, readerService = "ExoPlayerService"),
            FormatInfo("avi", listOf("avi"), listOf("video/x-msvideo"), "AVI", "Audio Video Interleave", FormatCategory.VIDEO, readerService = "ExoPlayerService"),
            FormatInfo("webm", listOf("webm"), listOf("video/webm"), "WebM", "WebM Video", FormatCategory.VIDEO, readerService = "ExoPlayerService"),
            FormatInfo("mov", listOf("mov"), listOf("video/quicktime"), "MOV", "QuickTime Video", FormatCategory.VIDEO, readerService = "ExoPlayerService"),
            FormatInfo("m4v", listOf("m4v"), listOf("video/x-m4v"), "M4V", "MPEG-4 Video", FormatCategory.VIDEO, readerService = "ExoPlayerService")
        )
        
        videoFormats.forEach { format ->
            format.extensions.forEach { ext ->
                formatsByExtension[ext.lowercase()] = format
            }
            format.mimeTypes.forEach { mime ->
                formatsByMimeType[mime.lowercase()] = format
            }
            formatsByCategory.getOrPut(format.category) { mutableListOf() }.add(format)
        }
    }
    
    /**
     * Register image formats
     */
    private fun registerImageFormats() {
        val imageFormats = listOf(
            FormatInfo("png", listOf("png"), listOf("image/png"), "PNG", "Portable Network Graphics", FormatCategory.IMAGE),
            FormatInfo("jpg", listOf("jpg", "jpeg"), listOf("image/jpeg"), "JPEG", "Joint Photographic Experts Group", FormatCategory.IMAGE),
            FormatInfo("webp", listOf("webp"), listOf("image/webp"), "WebP", "WebP Image", FormatCategory.IMAGE),
            FormatInfo("gif", listOf("gif"), listOf("image/gif"), "GIF", "Graphics Interchange Format", FormatCategory.IMAGE),
            FormatInfo("bmp", listOf("bmp"), listOf("image/bmp"), "BMP", "Bitmap Image", FormatCategory.IMAGE),
            FormatInfo("svg", listOf("svg"), listOf("image/svg+xml"), "SVG", "Scalable Vector Graphics", FormatCategory.IMAGE)
        )
        
        imageFormats.forEach { format ->
            format.extensions.forEach { ext ->
                formatsByExtension[ext.lowercase()] = format
            }
            format.mimeTypes.forEach { mime ->
                formatsByMimeType[mime.lowercase()] = format
            }
            formatsByCategory.getOrPut(format.category) { mutableListOf() }.add(format)
        }
    }
    
    /**
     * Search formats by query (searches extension, display name, description)
     */
    fun searchFormats(query: String): List<FormatInfo> {
        val lowerQuery = query.lowercase().trim()
        if (lowerQuery.isEmpty()) return getAllFormats()
        
        return formatsByExtension.values.distinctBy { it.extension }.filter { format ->
            format.extension.lowercase().contains(lowerQuery) ||
            format.displayName.lowercase().contains(lowerQuery) ||
            format.description.lowercase().contains(lowerQuery) ||
            format.extensions.any { it.lowercase().contains(lowerQuery) } ||
            format.mimeTypes.any { it.lowercase().contains(lowerQuery) }
        }
    }
    
    /**
     * Get format by extension
     */
    fun getFormatByExtension(extension: String): FormatInfo? {
        return formatsByExtension[extension.lowercase()]
    }
    
    /**
     * Get format by MIME type
     */
    fun getFormatByMimeType(mimeType: String): FormatInfo? {
        return formatsByMimeType[mimeType.lowercase()]
    }
    
    /**
     * Get all formats in a category
     */
    fun getFormatsByCategory(category: FormatCategory): List<FormatInfo> {
        return formatsByCategory[category]?.distinctBy { it.extension } ?: emptyList()
    }
    
    /**
     * Get all readable formats
     */
    fun getReadableFormats(): List<FormatInfo> {
        return formatsByExtension.values.distinctBy { it.extension }.filter { it.isReadable }
    }
    
    /**
     * Get all formats
     */
    fun getAllFormats(): List<FormatInfo> {
        return formatsByExtension.values.distinctBy { it.extension }.toList()
    }
    
    /**
     * Check if extension is supported
     */
    fun isSupported(extension: String): Boolean {
        return formatsByExtension.containsKey(extension.lowercase())
    }
    
    /**
     * Check if extension is readable
     */
    fun isReadable(extension: String): Boolean {
        return getFormatByExtension(extension)?.isReadable ?: false
    }
    
    /**
     * Get all supported extensions
     */
    fun getAllExtensions(): List<String> {
        return formatsByExtension.keys.toList()
    }
    
    /**
     * Get all supported MIME types
     */
    fun getAllMimeTypes(): List<String> {
        return formatsByMimeType.keys.toList()
    }
}
