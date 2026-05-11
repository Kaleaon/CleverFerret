package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

internal fun getQuickFiltersForMediaType(mediaType: MediaType): List<LibraryFilter> {
    return when (mediaType) {
        MediaType.BOOK, MediaType.COMIC, MediaType.FANFICTION -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.UNREAD,
            LibraryFilter.IN_PROGRESS,
            LibraryFilter.COMPLETED,
            LibraryFilter.FAVORITES
        )
        MediaType.AUDIOBOOK -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.UNPLAYED,
            LibraryFilter.IN_PROGRESS,
            LibraryFilter.COMPLETED,
            LibraryFilter.FAVORITES
        )
        MediaType.MUSIC -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.RECENTLY_PLAYED,
            LibraryFilter.FAVORITES,
            LibraryFilter.DOWNLOADED
        )
        MediaType.PODCAST -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.UNPLAYED,
            LibraryFilter.IN_PROGRESS,
            LibraryFilter.DOWNLOADED
        )
        MediaType.MOVIE, MediaType.TV_SHOW -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.UNWATCHED,
            LibraryFilter.IN_PROGRESS,
            LibraryFilter.FAVORITES
        )
        else -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.FAVORITES,
            LibraryFilter.RECENT
        )
    }
}
