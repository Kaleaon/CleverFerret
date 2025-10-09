package com.universalmedialibrary.ui.bookshelf

import android.graphics.Bitmap
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.List
import androidx.compose.material.icons.filled.*
import androidx.compose.ui.graphics.vector.ImageVector

/**
 * View mode options for bookshelf display
 */
enum class ViewMode(val displayName: String, val icon: ImageVector) {
    GRID_SMALL("Grid (Small)", Icons.Default.GridView),
    GRID_LARGE("Grid (Large)", Icons.Default.GridView),
    LIST("List", Icons.AutoMirrored.Filled.List),
    COMFORTABLE("Comfortable", Icons.Default.ViewAgenda),
    COVER_FLOW("Cover Flow", Icons.Default.ViewCarousel);

    companion object {
        // Legacy aliases for backwards compatibility
        val GRID = GRID_LARGE
    }
}

/**
 * Sort options for bookshelf
 */
enum class SortOption(val displayName: String, val icon: ImageVector) {
    TITLE_ASC("Title (A-Z)", Icons.Default.SortByAlpha),
    TITLE_DESC("Title (Z-A)", Icons.Default.SortByAlpha),
    AUTHOR_ASC("Author (A-Z)", Icons.Default.Person),
    AUTHOR_DESC("Author (Z-A)", Icons.Default.Person),
    DATE_ADDED_NEW("Date Added (Newest)", Icons.Default.Schedule),
    DATE_ADDED_OLD("Date Added (Oldest)", Icons.Default.Schedule),
    RATING_HIGH("Rating (High)", Icons.Default.Star),
    RATING_LOW("Rating (Low)", Icons.Default.Star),
    RATING("Rating", Icons.Default.Star),
    RECENTLY_READ("Recently Read", Icons.Default.History),
    PROGRESS("Progress", Icons.Default.TrendingUp),
    FILE_SIZE("File Size", Icons.Default.Storage);

    companion object {
        // Legacy aliases for backwards compatibility
        val TITLE = TITLE_ASC
        val AUTHOR = AUTHOR_ASC
        val DATE_ADDED = DATE_ADDED_NEW
    }
}

/**
 * Data class for book shortcuts
 */
data class BookShortcut(
    val id: Long,
    val title: String,
    val coverIcon: android.graphics.drawable.Icon? = null
)
