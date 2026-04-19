package com.universalmedialibrary.services.storage

import com.universalmedialibrary.data.MediaType

internal class StorageImportClassifier {
    fun determineMediaType(fileName: String): MediaType? {
        val ext = fileName.substringAfterLast('.', "").lowercase()
        return when {
            ext in BOOK_EXTENSIONS -> MediaType.BOOK
            ext in AUDIO_EXTENSIONS -> MediaType.MUSIC
            ext in VIDEO_EXTENSIONS -> MediaType.MOVIE
            ext in COMIC_EXTENSIONS -> MediaType.COMIC
            ext in DOCUMENT_EXTENSIONS -> MediaType.DOCUMENT
            else -> null
        }
    }

    fun determineMediaTypeName(fileName: String): String {
        return determineMediaType(fileName)?.name ?: "OTHER"
    }

    companion object {
        val BOOK_EXTENSIONS = setOf("epub", "pdf", "mobi", "azw", "azw3", "fb2", "txt", "rtf", "doc", "docx")
        val AUDIO_EXTENSIONS = setOf("mp3", "m4a", "m4b", "aac", "ogg", "opus", "flac", "wav", "wma")
        val VIDEO_EXTENSIONS = setOf("mp4", "mkv", "avi", "mov", "wmv", "flv", "webm", "m4v", "mpg", "mpeg")
        val COMIC_EXTENSIONS = setOf("cbz", "cbr", "cb7", "cbt")
        private val DOCUMENT_EXTENSIONS = setOf("pdf", "txt", "rtf", "doc", "docx")
    }
}
