package com.universalmedialibrary.ui.media.screens

import android.provider.Settings
import androidx.compose.animation.*
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.*
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.interaction.collectIsDraggedAsState
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.pager.*
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.material3.pulltorefresh.PullToRefreshBox
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.*
import androidx.compose.runtime.snapshotFlow
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.isTraversalGroup
import androidx.compose.ui.semantics.role
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.semantics.traversalIndex
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.platform.testTag
import coil.compose.AsyncImage
import com.universalmedialibrary.R
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.navigation.HomeSectionRouteContract
import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlin.math.roundToInt

/**
 * State holder for the home screen
 */
data class MediaHomeState(
    val isLoading: Boolean = false,
    val error: String? = null,
    val featuredItems: List<MediaItem> = emptyList(),
    val continueItems: List<MediaItem> = emptyList(),
    val recentBooks: List<MediaItem> = emptyList(),
    val recentAudiobooks: List<MediaItem> = emptyList(),
    val recentComics: List<MediaItem> = emptyList(),
    val recentMusic: List<MediaItem> = emptyList(),
    val recentPodcasts: List<MediaItem> = emptyList(),
    val recentVideos: List<MediaItem> = emptyList(),
    val recentFanfiction: List<MediaItem> = emptyList(),
    val collections: List<HomeCollection> = emptyList(),
    val libraryStats: HomeLibraryStats = HomeLibraryStats(),
    val lastOpenedCategory: String? = null
    val quickAccessItems: List<QuickAccessItem> = defaultQuickAccessItems
)

data class HomeLibraryStats(
    val totalBooks: Int = 0,
    val totalAudiobooks: Int = 0,
    val totalComics: Int = 0,
    val totalMusic: Int = 0,
    val totalPodcasts: Int = 0,
    val totalVideos: Int = 0,
    val totalFanfiction: Int = 0
)

data class HomeCollection(
    val id: String,
    val name: String,
    val itemCount: Int,
    val icon: androidx.compose.ui.graphics.vector.ImageVector,
    val color: Color
)

data class QuickAccessItem(
    val id: String,
    val label: String,
    val icon: androidx.compose.ui.graphics.vector.ImageVector,
    val color: Color,
    val isFavorite: Boolean = false
)

val defaultQuickAccessItems = listOf(
    QuickAccessItem(MediaRoutes.BOOKS, "Books", Icons.Default.MenuBook, MediaColors.AccentPrimary),
    QuickAccessItem(MediaRoutes.AUDIOBOOKS, "Audiobooks", Icons.Default.Headphones, MediaColors.AccentPrimary),
    QuickAccessItem(MediaRoutes.COMICS, "Comics", Icons.Default.AutoStories, MediaColors.AccentPrimary),
    QuickAccessItem(MediaRoutes.MUSIC, "Music", Icons.Default.MusicNote, MediaColors.AccentPrimary),
    QuickAccessItem(MediaRoutes.PODCASTS, "Podcasts", Icons.Default.Podcasts, MediaColors.AccentPrimary),
    QuickAccessItem(MediaRoutes.RADIO, "Radio", Icons.Default.Radio, MediaColors.AccentPrimary),
    QuickAccessItem(MediaRoutes.MOVIES, "Movies", Icons.Default.Movie, MediaColors.AccentPrimary),
    QuickAccessItem(MediaRoutes.TV_SHOWS, "TV Shows", Icons.Default.Tv, MediaColors.AccentPrimary),
    QuickAccessItem(MediaRoutes.WEB_FICTION, "Web Fiction", Icons.Default.Language, MediaColors.AccentPrimary),
    QuickAccessItem(MediaRoutes.DOCUMENTS, "Documents", Icons.Default.Description, MediaColors.AccentPrimary),
    QuickAccessItem(MediaRoutes.OPDS_BROWSER, "OPDS", Icons.Default.CloudDownload, MediaColors.AccentPrimary),
    QuickAccessItem(MediaRoutes.AMBIENT_SOUNDS, "Ambient", Icons.Default.Spa, MediaColors.AccentPrimary),
    QuickAccessItem(MediaRoutes.COLLECTIONS, "Collections", Icons.Default.Collections, MediaColors.AccentPrimary)
)

