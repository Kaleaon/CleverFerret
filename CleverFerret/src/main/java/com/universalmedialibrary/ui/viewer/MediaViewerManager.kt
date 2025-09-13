package com.universalmedialibrary.ui.viewer

import android.content.Context
import android.net.Uri
import android.webkit.MimeTypeMap
import org.apache.tika.Tika
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Central manager for determining the appropriate viewer for different media types
 */
@Singleton
class MediaViewerManager @Inject constructor() {
    
    private val tika = Tika()
    
    enum class MediaType {
        VIDEO,
        AUDIO, 
        EBOOK,
        DOCUMENT,
        COMIC,
        IMAGE,
        UNSUPPORTED
    }
    
    enum class VideoFormat {
        MP4, MKV, AVI, MOV, WEBM, FLV, WMV, M4V, _3GP, TS, M2TS, UNSUPPORTED
    }
    
    enum class DocumentFormat {
        PDF, EPUB, MOBI, AZW, TXT, HTML, RTF, DOC, DOCX, UNSUPPORTED
    }
    
    enum class ComicFormat {
        CBZ, CBR, PDF_COMIC, IMAGE_FOLDER, UNSUPPORTED
    }
    
    data class MediaInfo(
        val type: MediaType,
        val mimeType: String,
        val extension: String,
        val videoFormat: VideoFormat? = null,
        val documentFormat: DocumentFormat? = null,
        val comicFormat: ComicFormat? = null,
        val supportsAdvancedFeatures: Boolean = false
    )
    
    fun analyzeMedia(context: Context, uri: Uri): MediaInfo {
        val mimeType = getMimeType(context, uri)
        val extension = getFileExtension(uri)
        
        return when {
            isVideo(mimeType, extension) -> {
                MediaInfo(
                    type = MediaType.VIDEO,
                    mimeType = mimeType,
                    extension = extension,
                    videoFormat = getVideoFormat(extension),
                    supportsAdvancedFeatures = supportsAdvancedVideoFeatures(extension)
                )
            }
            isAudio(mimeType, extension) -> {
                MediaInfo(
                    type = MediaType.AUDIO,
                    mimeType = mimeType,
                    extension = extension
                )
            }
            isEbook(mimeType, extension) -> {
                MediaInfo(
                    type = MediaType.EBOOK,
                    mimeType = mimeType,
                    extension = extension,
                    documentFormat = getDocumentFormat(extension),
                    supportsAdvancedFeatures = supportsAdvancedDocumentFeatures(extension)
                )
            }
            isDocument(mimeType, extension) -> {
                MediaInfo(
                    type = MediaType.DOCUMENT,
                    mimeType = mimeType,
                    extension = extension,
                    documentFormat = getDocumentFormat(extension)
                )
            }
            isComic(mimeType, extension) -> {
                MediaInfo(
                    type = MediaType.COMIC,
                    mimeType = mimeType,
                    extension = extension,
                    comicFormat = getComicFormat(extension),
                    supportsAdvancedFeatures = true
                )
            }
            isImage(mimeType, extension) -> {
                MediaInfo(
                    type = MediaType.IMAGE,
                    mimeType = mimeType,
                    extension = extension
                )
            }
            else -> {
                MediaInfo(
                    type = MediaType.UNSUPPORTED,
                    mimeType = mimeType,
                    extension = extension
                )
            }
        }
    }
    
    private fun getMimeType(context: Context, uri: Uri): String {
        return context.contentResolver.getType(uri) 
            ?: MimeTypeMap.getSingleton().getMimeTypeFromExtension(getFileExtension(uri))
            ?: "application/octet-stream"
    }
    
    private fun getFileExtension(uri: Uri): String {
        return uri.toString().substringAfterLast('.', "").lowercase()
    }
    
    private fun isVideo(mimeType: String, extension: String): Boolean {
        return mimeType.startsWith("video/") || extension in listOf(
            "mp4", "mkv", "avi", "mov", "webm", "flv", "wmv", "m4v", "3gp", "ts", "m2ts"
        )
    }
    
    private fun isAudio(mimeType: String, extension: String): Boolean {
        return mimeType.startsWith("audio/") || extension in listOf(
            "mp3", "aac", "ogg", "flac", "wav", "m4a", "wma", "opus"
        )
    }
    
    private fun isEbook(mimeType: String, extension: String): Boolean {
        return extension in listOf("epub", "mobi", "azw", "azw3", "fb2") ||
               mimeType in listOf("application/epub+zip", "application/x-mobipocket-ebook")
    }
    
    private fun isDocument(mimeType: String, extension: String): Boolean {
        return extension in listOf("pdf", "txt", "html", "htm", "rtf", "doc", "docx") ||
               mimeType.startsWith("text/") ||
               mimeType in listOf("application/pdf", "application/msword", 
                                "application/vnd.openxmlformats-officedocument.wordprocessingml.document")
    }
    
    private fun isComic(mimeType: String, extension: String): Boolean {
        return extension in listOf("cbz", "cbr", "cb7") ||
               mimeType in listOf("application/vnd.comicbook+zip", "application/vnd.comicbook-rar")
    }
    
    private fun isImage(mimeType: String, extension: String): Boolean {
        return mimeType.startsWith("image/") || extension in listOf(
            "jpg", "jpeg", "png", "gif", "bmp", "webp", "tiff", "svg"
        )
    }
    
    private fun getVideoFormat(extension: String): VideoFormat {
        return when (extension) {
            "mp4" -> VideoFormat.MP4
            "mkv" -> VideoFormat.MKV
            "avi" -> VideoFormat.AVI
            "mov" -> VideoFormat.MOV
            "webm" -> VideoFormat.WEBM
            "flv" -> VideoFormat.FLV
            "wmv" -> VideoFormat.WMV
            "m4v" -> VideoFormat.M4V
            "3gp" -> VideoFormat._3GP
            "ts" -> VideoFormat.TS
            "m2ts" -> VideoFormat.M2TS
            else -> VideoFormat.UNSUPPORTED
        }
    }
    
    private fun getDocumentFormat(extension: String): DocumentFormat {
        return when (extension) {
            "pdf" -> DocumentFormat.PDF
            "epub" -> DocumentFormat.EPUB
            "mobi" -> DocumentFormat.MOBI
            "azw", "azw3" -> DocumentFormat.AZW
            "txt" -> DocumentFormat.TXT
            "html", "htm" -> DocumentFormat.HTML
            "rtf" -> DocumentFormat.RTF
            "doc" -> DocumentFormat.DOC
            "docx" -> DocumentFormat.DOCX
            else -> DocumentFormat.UNSUPPORTED
        }
    }
    
    private fun getComicFormat(extension: String): ComicFormat {
        return when (extension) {
            "cbz" -> ComicFormat.CBZ
            "cbr" -> ComicFormat.CBR
            "pdf" -> ComicFormat.PDF_COMIC
            else -> ComicFormat.UNSUPPORTED
        }
    }
    
    private fun supportsAdvancedVideoFeatures(extension: String): Boolean {
        return extension in listOf("mp4", "mkv", "webm", "mov", "m4v")
    }
    
    private fun supportsAdvancedDocumentFeatures(extension: String): Boolean {
        return extension in listOf("pdf", "epub")
    }
}