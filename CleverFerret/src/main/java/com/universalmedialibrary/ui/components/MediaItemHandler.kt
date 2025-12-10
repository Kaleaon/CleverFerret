package com.universalmedialibrary.ui.components

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.Article
import androidx.compose.material.icons.filled.*
import androidx.navigation.NavController
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.MediaType
import java.net.URLEncoder
import java.nio.charset.StandardCharsets

/**
 * Handles navigation to appropriate media players based on file type
 */
object MediaItemHandler {

    /**
     * Navigate to appropriate player/reader based on media type and file extension
     */
    fun openMediaItem(navController: NavController, mediaItem: MediaItem) {
        val filePath = mediaItem.filePath
        val encodedPath = URLEncoder.encode(filePath, StandardCharsets.UTF_8.toString())

        // Parse mediaType string to MediaType enum
        val mediaType = try {
            MediaType.valueOf(mediaItem.mediaType)
        } catch (e: IllegalArgumentException) {
            MediaType.UNKNOWN
        }

        when (mediaType) {
            MediaType.BOOK, MediaType.EBOOK -> {
                val extension = filePath.substringAfterLast('.', "").lowercase()
                when (extension) {
                    "epub" -> navController.navigate("epub_reader/$encodedPath")
                    "pdf" -> navController.navigate("pdf_reader/$encodedPath")
                    else -> navController.navigate("epub_reader/$encodedPath") // Default to EPUB reader
                }
            }
            MediaType.MUSIC, MediaType.MUSIC_TRACK, MediaType.MUSIC_ALBUM, MediaType.AUDIOBOOK -> {
                navController.navigate("audio_player/$encodedPath")
            }
            MediaType.MOVIE, MediaType.TV_SHOW, MediaType.DOCUMENTARY -> {
                navController.navigate("video_player/$encodedPath")
            }
            MediaType.COMIC, MediaType.MANGA -> {
                // Use comic reader when available, fallback to PDF reader
                navController.navigate("pdf_reader/$encodedPath")
            }
            else -> {
                // Fallback to book details screen
                navController.navigate("book_details/${mediaItem.itemId}")
            }
        }
    }

    /**
     * Get appropriate icon for media type
     */
    fun getMediaIcon(mediaType: MediaType): androidx.compose.ui.graphics.vector.ImageVector {
        return when (mediaType) {
            MediaType.BOOK, MediaType.EBOOK -> Icons.Default.Book
            MediaType.MUSIC, MediaType.MUSIC_TRACK, MediaType.MUSIC_ALBUM -> Icons.Default.MusicNote
            MediaType.AUDIOBOOK, MediaType.PODCAST, MediaType.PODCAST_EPISODE -> Icons.Default.Headset
            MediaType.MOVIE, MediaType.TV_SHOW, MediaType.DOCUMENTARY -> Icons.Default.Movie
            MediaType.COMIC, MediaType.MANGA -> Icons.Default.Book
            MediaType.MAGAZINE, MediaType.NEWSPAPER -> Icons.AutoMirrored.Filled.Article
            MediaType.DOCUMENT, MediaType.REPORT, MediaType.PRESENTATION -> Icons.Default.Description
            MediaType.ACADEMIC_PAPER, MediaType.JOURNAL -> Icons.Default.School
            MediaType.WEB_FICTION, MediaType.NEWS_ARTICLE -> Icons.Default.Public
            else -> Icons.Default.Help
        }
    }

    /**
     * Get file extension from path
     */
    fun getFileExtension(filePath: String): String {
        return filePath.substringAfterLast('.', "").lowercase()
    }

    /**
     * Check if file is supported
     */
    fun isSupportedFile(filePath: String): Boolean {
        val extension = getFileExtension(filePath)
        return when (extension) {
            in listOf("epub", "pdf", "mobi", "azw", "azw3", "fb2", "txt") -> true
            in listOf("mp3", "m4a", "m4b", "aac", "ogg", "opus", "flac", "wav") -> true
            in listOf("mp4", "mkv", "avi", "mov", "wmv", "webm", "m4v") -> true
            in listOf("cbz", "cbr", "cb7", "cbt") -> true
            else -> false
        }
    }
}
