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
    private val comicReaderEngine: ComicReaderEngine
) {

    /**
     * Create a reader engine for the specified book format
     */
    fun createReaderEngine(format: BookFormat): ReaderEngine {
        return when (format) {
            BookFormat.EPUB -> epubReaderEngine
            BookFormat.PDF, BookFormat.DJVU -> pdfReaderEngine
            BookFormat.CBZ, BookFormat.CBR, BookFormat.CBT, BookFormat.CB7 -> comicReaderEngine
            BookFormat.MOBI, BookFormat.AZW3, BookFormat.FB2, BookFormat.TXT, BookFormat.RTF, BookFormat.HTML -> epubReaderEngine // Use Epub engine as fallback/converter for reflowable formats
            BookFormat.PRC, BookFormat.AZW, BookFormat.KFX, BookFormat.CHM, BookFormat.UMD, BookFormat.LIT, BookFormat.PDB, BookFormat.RB, BookFormat.SNB,
            BookFormat.DOCX, BookFormat.DOC, BookFormat.ODT, BookFormat.MD, BookFormat.HTM, BookFormat.XHTML, BookFormat.MHTML -> epubReaderEngine // Use Epub engine as fallback for legacy formats
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
            "mobi" -> BookFormat.MOBI
            "azw3" -> BookFormat.AZW3
            "djvu" -> BookFormat.DJVU
            "fb2" -> BookFormat.FB2
            "txt" -> BookFormat.TXT
            "rtf" -> BookFormat.RTF
            "cbt" -> BookFormat.CBT
            "cb7" -> BookFormat.CB7
            "html" -> BookFormat.HTML
            "htm" -> BookFormat.HTM
            "prc" -> BookFormat.PRC
            "azw" -> BookFormat.AZW
            "kfx" -> BookFormat.KFX
            "chm" -> BookFormat.CHM
            "umd" -> BookFormat.UMD
            "lit" -> BookFormat.LIT
            "pdb" -> BookFormat.PDB
            "rb" -> BookFormat.RB
            "snb" -> BookFormat.SNB
            "docx" -> BookFormat.DOCX
            "doc" -> BookFormat.DOC
            "odt" -> BookFormat.ODT
            "md" -> BookFormat.MD
            "xhtml" -> BookFormat.XHTML
            "mhtml" -> BookFormat.MHTML
            else -> BookFormat.UNKNOWN
        }
    }

    /**
     * Check if format is supported
     */
    fun isFormatSupported(format: BookFormat): Boolean {
        return when (format) {
            BookFormat.EPUB, BookFormat.PDF, BookFormat.CBZ, BookFormat.CBR,
            BookFormat.MOBI, BookFormat.AZW3, BookFormat.DJVU, BookFormat.FB2,
            BookFormat.TXT, BookFormat.RTF, BookFormat.CBT, BookFormat.CB7, BookFormat.HTML,
            BookFormat.PRC, BookFormat.AZW, BookFormat.KFX, BookFormat.CHM, BookFormat.UMD,
            BookFormat.LIT, BookFormat.PDB, BookFormat.RB, BookFormat.SNB,
            BookFormat.DOCX, BookFormat.DOC, BookFormat.ODT, BookFormat.MD, BookFormat.HTM, BookFormat.XHTML, BookFormat.MHTML -> true
            BookFormat.UNKNOWN -> false
        }
    }

    /**
     * Get supported file extensions
     */
    fun getSupportedExtensions(): Set<String> {
        return setOf(
            "epub", "pdf",
            "cbz", "cbr", "cbt", "cb7",
            "mobi", "azw3",
            "djvu", "fb2",
            "txt", "rtf",
            "html", "htm",
            "prc", "azw", "kfx",
            "chm", "umd", "lit",
            "pdb", "rb", "snb",
            "docx", "doc", "odt",
            "md",
            "xhtml", "mhtml"
        )
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
            BookFormat.MOBI -> "Mobipocket eBook"
            BookFormat.AZW3 -> "Kindle eBook (AZW3)"
            BookFormat.DJVU -> "DjVu Document"
            BookFormat.FB2 -> "FictionBook (FB2)"
            BookFormat.TXT -> "Plain Text"
            BookFormat.RTF -> "Rich Text Format"
            BookFormat.CBT -> "Comic Book Archive (CBT)"
            BookFormat.CB7 -> "Comic Book Archive (CB7)"
            BookFormat.HTML -> "HTML Document"
            BookFormat.PRC -> "Palm Resource (PRC)"
            BookFormat.AZW -> "Kindle eBook (AZW)"
            BookFormat.KFX -> "Kindle Format (KFX)"
            BookFormat.CHM -> "Compiled HTML Help (CHM)"
            BookFormat.UMD -> "Universal Media Disc (UMD)"
            BookFormat.LIT -> "Microsoft Reader (LIT)"
            BookFormat.PDB -> "Palm Database (PDB)"
            BookFormat.RB -> "Rocket eBook (RB)"
            BookFormat.SNB -> "SNB eBook"
            BookFormat.DOCX -> "Word Document (DOCX)"
            BookFormat.DOC -> "Word Document (DOC)"
            BookFormat.ODT -> "OpenDocument Text"
            BookFormat.MD -> "Markdown"
            BookFormat.HTM -> "HTML Document"
            BookFormat.XHTML -> "XHTML Document"
            BookFormat.MHTML -> "MHTML Document"
            BookFormat.UNKNOWN -> "Unknown Format"
        }
    }
}
