package com.universalmedialibrary.ui.components

import androidx.navigation.NavController
import com.universalmedialibrary.data.local.model.MediaItem
import com.universalmedialibrary.data.local.model.MediaType
import java.net.URLEncoder
import java.nio.charset.StandardCharsets

/**
 * A utility object for handling media item interactions, such as opening files
 * and determining appropriate icons or properties based on media type.
 */
object MediaItemHandler {

    /**
     * Navigates to the appropriate player or reader screen based on the media item's type.
     * The file path is URL-encoded to be safely passed as a navigation argument.
     *
     * @param navController The NavController used for navigation.
     * @param mediaItem The media item to open.
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
     * Returns the appropriate Material Design icon for a given media type.
     *
     * @param mediaType The type of the media.
     * @return An [ImageVector] representing the icon.
     */
    fun getMediaIcon(mediaType: MediaType): androidx.compose.ui.graphics.vector.ImageVector {
        return when (mediaType) {
            MediaType.BOOK -> androidx.compose.material.icons.Icons.Default.Book
            MediaType.AUDIO -> androidx.compose.material.icons.Icons.Default.MusicNote
            MediaType.VIDEO -> androidx.compose.material.icons.Icons.Default.Movie
            MediaType.COMIC -> androidx.compose.material.icons.Icons.Default.Book
            else -> androidx.compose.material.icons.Icons.Default.Help
        }
    }

    /**
     * Extracts the file extension from a file path.
     *
     * @param filePath The full path to the file.
     * @return The lowercase file extension without the dot.
     */
    fun getFileExtension(filePath: String): String {
        return filePath.substringAfterLast('.', "").lowercase()
    }

    /**
     * Checks if a file is of a supported media type based on its extension.
     *
     * @param filePath The full path to the file.
     * @return `true` if the file extension is supported, `false` otherwise.
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