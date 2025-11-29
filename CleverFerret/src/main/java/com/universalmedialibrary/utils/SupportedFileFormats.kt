package com.universalmedialibrary.utils

import java.io.File

/**
 * Comprehensive File Format Support
 * Ensures ALL file types readable by Moonreader are supported in Clever Ferret
 * 
 * Based on Moonreader's supported formats:
 * - EPUB, PDF, FB2, MOBI, AZW3, PRC, CHM, UMD
 * - DOCX, ODT, RTF, TXT, MD
 * - HTML, HTM, MHTML, XHTML
 * - CBZ, CBR, CBT, CB7
 * - DJVU
 * - Plus additional formats for completeness
 */

/**
 * All supported book/document formats
 */
enum class SupportedBookFormat(
    val extensions: List<String>,
    val mimeTypes: List<String>,
    val displayName: String,
    val description: String
) {
    // Standard eBook formats
    EPUB(
        extensions = listOf("epub"),
        mimeTypes = listOf("application/epub+zip", "application/epub"),
        displayName = "EPUB",
        description = "Electronic Publication format"
    ),
    
    PDF(
        extensions = listOf("pdf"),
        mimeTypes = listOf("application/pdf"),
        displayName = "PDF",
        description = "Portable Document Format"
    ),
    
    DJVU(
        extensions = listOf("djvu", "djv"),
        mimeTypes = listOf("image/vnd.djvu", "image/x-djvu"),
        displayName = "DJVU",
        description = "DjVu document format"
    ),
    
    // FictionBook formats
    FB2(
        extensions = listOf("fb2", "fb2.zip"),
        mimeTypes = listOf("application/x-fictionbook+xml", "application/fb2"),
        displayName = "FB2",
        description = "FictionBook 2.0 format"
    ),
    
    // Amazon formats
    MOBI(
        extensions = listOf("mobi", "prc", "azw"),
        mimeTypes = listOf("application/x-mobipocket-ebook", "application/vnd.amazon.mobi8-ebook"),
        displayName = "MOBI/PRC",
        description = "Mobipocket eBook format"
    ),
    
    AZW3(
        extensions = listOf("azw3", "kfx"),
        mimeTypes = listOf("application/vnd.amazon.ebook"),
        displayName = "AZW3/KFX",
        description = "Amazon Kindle format"
    ),
    
    // Microsoft formats
    DOCX(
        extensions = listOf("docx"),
        mimeTypes = listOf("application/vnd.openxmlformats-officedocument.wordprocessingml.document"),
        displayName = "DOCX",
        description = "Microsoft Word document"
    ),
    
    DOC(
        extensions = listOf("doc"),
        mimeTypes = listOf("application/msword"),
        displayName = "DOC",
        description = "Microsoft Word document (legacy)"
    ),
    
    RTF(
        extensions = listOf("rtf"),
        mimeTypes = listOf("application/rtf", "text/rtf"),
        displayName = "RTF",
        description = "Rich Text Format"
    ),
    
    // OpenDocument formats
    ODT(
        extensions = listOf("odt"),
        mimeTypes = listOf("application/vnd.oasis.opendocument.text"),
        displayName = "ODT",
        description = "OpenDocument Text"
    ),
    
    // Text formats
    TXT(
        extensions = listOf("txt", "text"),
        mimeTypes = listOf("text/plain"),
        displayName = "TXT",
        description = "Plain text file"
    ),
    
    MD(
        extensions = listOf("md", "markdown"),
        mimeTypes = listOf("text/markdown", "text/x-markdown"),
        displayName = "Markdown",
        description = "Markdown text file"
    ),
    
    // Web formats
    HTML(
        extensions = listOf("html", "htm"),
        mimeTypes = listOf("text/html"),
        displayName = "HTML",
        description = "HyperText Markup Language"
    ),
    
    XHTML(
        extensions = listOf("xhtml", "xht"),
        mimeTypes = listOf("application/xhtml+xml", "text/xhtml+xml"),
        displayName = "XHTML",
        description = "Extensible HyperText Markup Language"
    ),
    
    MHTML(
        extensions = listOf("mhtml", "mht"),
        mimeTypes = listOf("message/rfc822", "multipart/related"),
        displayName = "MHTML",
        description = "MIME HTML archive"
    ),
    
    // Compiled HTML Help
    CHM(
        extensions = listOf("chm"),
        mimeTypes = listOf("application/vnd.ms-htmlhelp", "application/x-chm"),
        displayName = "CHM",
        description = "Compiled HTML Help"
    ),
    
    // Universal Media Disc
    UMD(
        extensions = listOf("umd"),
        mimeTypes = listOf("application/x-umd"),
        displayName = "UMD",
        description = "Universal Media Disc eBook"
    ),
    
    // Comic/Archive formats
    CBZ(
        extensions = listOf("cbz"),
        mimeTypes = listOf("application/x-cbz", "application/zip"),
        displayName = "CBZ",
        description = "Comic Book ZIP archive"
    ),
    
    CBR(
        extensions = listOf("cbr"),
        mimeTypes = listOf("application/x-cbr", "application/x-rar-compressed"),
        displayName = "CBR",
        description = "Comic Book RAR archive"
    ),
    
    CBT(
        extensions = listOf("cbt"),
        mimeTypes = listOf("application/x-cbt", "application/x-tar"),
        displayName = "CBT",
        description = "Comic Book TAR archive"
    ),
    
    CB7(
        extensions = listOf("cb7"),
        mimeTypes = listOf("application/x-cb7", "application/x-7z-compressed"),
        displayName = "CB7",
        description = "Comic Book 7Z archive"
    ),
    
    // Additional formats
    LIT(
        extensions = listOf("lit"),
        mimeTypes = listOf("application/x-ms-reader"),
        displayName = "LIT",
        description = "Microsoft Reader format"
    ),
    
    PDB(
        extensions = listOf("pdb", "prc"),
        mimeTypes = listOf("application/vnd.palm", "application/x-palm-database"),
        displayName = "PDB",
        description = "Palm Database format"
    ),
    
    RB(
        extensions = listOf("rb"),
        mimeTypes = listOf("application/x-ruby"),
        displayName = "RB",
        description = "Rocket eBook format"
    ),
    
    SNB(
        extensions = listOf("snb"),
        mimeTypes = listOf("application/x-snb"),
        displayName = "SNB",
        description = "Sony Reader format"
    );
    
    companion object {
        /**
         * Get format from file extension
         */
        fun fromExtension(extension: String): SupportedBookFormat? {
            val ext = extension.lowercase()
            return values().find { it.extensions.contains(ext) }
        }
        
        /**
         * Get format from file
         */
        fun fromFile(file: File): SupportedBookFormat? {
            return fromExtension(file.extension)
        }
        
        /**
         * Get format from MIME type
         */
        fun fromMimeType(mimeType: String): SupportedBookFormat? {
            val mime = mimeType.lowercase()
            return values().find { it.mimeTypes.any { mt -> mt.lowercase() == mime } }
        }
        
        /**
         * Check if extension is supported
         */
        fun isSupported(extension: String): Boolean {
            return fromExtension(extension) != null
        }
        
        /**
         * Get all supported extensions
         */
        fun allExtensions(): List<String> {
            return values().flatMap { it.extensions }
        }
        
        /**
         * Get all supported MIME types
         */
        fun allMimeTypes(): List<String> {
            return values().flatMap { it.mimeTypes }
        }
        
        /**
         * Get formats by category
         */
        fun getEbookFormats(): List<SupportedBookFormat> = listOf(
            EPUB, PDF, DJVU, FB2, MOBI, AZW3, CHM, UMD, LIT, PDB, RB, SNB
        )
        
        fun getDocumentFormats(): List<SupportedBookFormat> = listOf(
            DOCX, DOC, RTF, ODT, TXT, MD
        )
        
        fun getWebFormats(): List<SupportedBookFormat> = listOf(
            HTML, XHTML, MHTML
        )
        
        fun getComicFormats(): List<SupportedBookFormat> = listOf(
            CBZ, CBR, CBT, CB7
        )
        
        fun getAllFormats(): List<SupportedBookFormat> = values().toList()
    }
}

/**
 * File format detection utility
 */
object FileFormatDetector {
    /**
     * Detect format from file
     */
    fun detectFormat(file: File): SupportedBookFormat? {
        return SupportedBookFormat.fromFile(file)
    }
    
    /**
     * Check if file is readable
     */
    fun isReadable(file: File): Boolean {
        return SupportedBookFormat.fromFile(file) != null
    }
    
    /**
     * Get readable files from directory
     */
    fun getReadableFiles(directory: File): List<File> {
        if (!directory.exists() || !directory.isDirectory) {
            return emptyList()
        }
        
        return directory.listFiles()?.filter { file ->
            file.isFile && isReadable(file)
        } ?: emptyList()
    }
    
    /**
     * Get format display name
     */
    fun getFormatDisplayName(file: File): String {
        return SupportedBookFormat.fromFile(file)?.displayName ?: "Unknown"
    }
}
