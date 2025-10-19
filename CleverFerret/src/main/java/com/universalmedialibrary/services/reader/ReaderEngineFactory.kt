package com.universalmedialibrary.services.reader

import com.universalmedialibrary.services.epub.EpubReaderEngine
import com.universalmedialibrary.services.reader.core.ReaderEngine
import com.universalmedialibrary.services.reader.model.BookFormat
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Factory for creating appropriate reader engines based on book format.
 *
 * This factory provides a unified entry point for creating reader engines
 * that implement the ReaderEngine interface, ensuring consistent behavior
 * across different book formats.
 */
@Singleton
class ReaderEngineFactory @Inject constructor(
    private val epubReaderEngine: EpubReaderEngine,
    private val pdfReaderEngine: PdfReaderEngine,
    private val comicReaderEngine: ComicReaderEngine,
    private val mobiReaderEngine: com.universalmedialibrary.services.ebook.MobiReaderEngine
) {

    /**
     * Create a reader engine for the specified book format
     */
    fun createReaderEngine(format: BookFormat): ReaderEngine {
        return when (format) {
            BookFormat.EPUB -> epubReaderEngine
            BookFormat.PDF -> pdfReaderEngine
            BookFormat.CBZ, BookFormat.CBR -> comicReaderEngine
            BookFormat.MOBI, BookFormat.AZW, BookFormat.AZW3 -> mobiReaderEngine
            BookFormat.UNKNOWN -> throw IllegalArgumentException("Cannot create reader for unknown format")
        }
    }

    /**
     * Determine book format from file extension
     */
    fun detectBookFormat(filename: String): BookFormat {
        val extension = filename.substringAfterLast(".", "").lowercase()

        return when (extension) {
            "epub" -> BookFormat.EPUB
            "pdf" -> BookFormat.PDF
            "cbz" -> BookFormat.CBZ
            "cbr" -> BookFormat.CBR
            "mobi", "prc" -> BookFormat.MOBI
            "azw" -> BookFormat.AZW
            "azw3", "kfx" -> BookFormat.AZW3
            else -> BookFormat.UNKNOWN
        }
    }

    /**
     * Check if format is supported
     */
    fun isFormatSupported(format: BookFormat): Boolean {
        return when (format) {
            BookFormat.EPUB, BookFormat.PDF, BookFormat.CBZ, BookFormat.CBR,
            BookFormat.MOBI, BookFormat.AZW, BookFormat.AZW3 -> true
            BookFormat.UNKNOWN -> false
        }
    }

    /**
     * Get supported file extensions
     */
    fun getSupportedExtensions(): Set<String> {
        return setOf("epub", "pdf", "cbz", "cbr", "mobi", "azw", "azw3", "prc", "kfx")
    }

    /**
     * Get format display name
     */
    fun getFormatDisplayName(format: BookFormat): String {
        return when (format) {
            BookFormat.EPUB -> "EPUB eBook"
            BookFormat.PDF -> "PDF Document"
            BookFormat.CBZ -> "Comic Book Archive (CBZ)"
            BookFormat.CBR -> "Comic Book Archive (CBR)"
            BookFormat.MOBI -> "MOBI eBook (Kindle)"
            BookFormat.AZW -> "AZW eBook (Kindle)"
            BookFormat.AZW3 -> "AZW3 eBook (Kindle Format 8)"
            BookFormat.UNKNOWN -> "Unknown Format"
        }
    }
}
