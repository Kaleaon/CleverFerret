package com.universalmedialibrary.ui.components

import androidx.navigation.NavController
import com.universalmedialibrary.data.local.model.MediaItem
import com.universalmedialibrary.data.local.model.MediaType
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
        
        when (mediaItem.type) {
            MediaType.BOOK -> {
                val extension = filePath.substringAfterLast('.', "").lowercase()
                when (extension) {
                    "epub" -> navController.navigate("epub_reader/$encodedPath")
                    "pdf" -> navController.navigate("pdf_reader/$encodedPath")
                    else -> navController.navigate("epub_reader/$encodedPath") // Default to EPUB reader
                }
            }
            MediaType.AUDIO -> {
                navController.navigate("audio_player/$encodedPath")
            }
            MediaType.VIDEO -> {
                navController.navigate("video_player/$encodedPath")
            }
            MediaType.COMIC -> {
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
            MediaType.BOOK -> androidx.compose.material.icons.Icons.Default.Book
            MediaType.AUDIO -> androidx.compose.material.icons.Icons.Default.MusicNote
            MediaType.VIDEO -> androidx.compose.material.icons.Icons.Default.Movie
            MediaType.COMIC -> androidx.compose.material.icons.Icons.Default.Book
            else -> androidx.compose.material.icons.Icons.Default.QuestionMark
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