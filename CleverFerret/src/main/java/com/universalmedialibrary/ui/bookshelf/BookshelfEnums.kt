package com.universalmedialibrary.ui.bookshelf

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.automirrored.filled.*
import androidx.compose.ui.graphics.vector.ImageVector

enum class ViewMode(val displayName: String, val icon: ImageVector) {
    GRID("Grid", Icons.Default.GridView),
    LIST("List", Icons.AutoMirrored.Filled.List),
    COVER_FLOW("Cover Flow", Icons.Default.ViewCarousel)
}

enum class SortOption(val displayName: String, val icon: ImageVector) {
    TITLE("Title", Icons.Default.SortByAlpha),
    AUTHOR("Author", Icons.Default.Person),
    DATE_ADDED("Date Added", Icons.Default.Schedule),
    RATING("Rating", Icons.Default.Star),
    RECENTLY_READ("Recently Read", Icons.Default.History)
}