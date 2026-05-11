package com.universalmedialibrary.ui.media.navigation

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.*
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsHoveredAsState
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.Dp
import coil.compose.AsyncImage
import com.universalmedialibrary.data.settings.BottomBarPreferences
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.ui.media.theme.*

data class MediaNavDestination(
    val id: String,
    val label: String,
    val icon: ImageVector,
    val selectedIcon: ImageVector = icon,
    val route: String,
    val section: NavSection = NavSection.LIBRARY,
    val badge: NavBadge? = null,
    val mediaTypeColor: Color? = null,
    val enabled: Boolean = true
)

/**
 * Navigation sections for grouping
 */
enum class NavSection(val title: String, val order: Int) {
    HOME("", 0),
    LIBRARY("Library", 1),
    DISCOVER("Discover", 2),
    DOWNLOADS("Downloads", 3),
    SETTINGS("Settings", 4)
}

/**
 * Badge to display on navigation item
 */
data class NavBadge(
    val count: Int = 0,
    val text: String? = null,
    val color: Color = MediaColors.AccentPrimary
)

/**
 * Default navigation destinations for CleverFerret
 */
object MediaNavDestinations {
    
    val home = MediaNavDestination(
        id = "home",
        label = "Home",
        icon = Icons.Outlined.Home,
        selectedIcon = Icons.Filled.Home,
        route = MediaRoutes.HOME,
        section = NavSection.HOME
    )

    val search = MediaNavDestination(
        id = "search",
        label = "Search",
        icon = Icons.Outlined.Search,
        selectedIcon = Icons.Filled.Search,
        route = MediaRoutes.SEARCH,
        section = NavSection.HOME
    )

    val discover = MediaNavDestination(
        id = "discover",
        label = "Discover",
        icon = Icons.Outlined.Explore,
        selectedIcon = Icons.Filled.Explore,
        route = MediaRoutes.DISCOVER,
        section = NavSection.DISCOVER
    )

    val library = MediaNavDestination(
        id = "library",
        label = "Library",
        icon = Icons.Outlined.VideoLibrary,
        selectedIcon = Icons.Filled.VideoLibrary,
        route = MediaRoutes.LIBRARY_ROOT,
        section = NavSection.LIBRARY
    )
    
    // Library Section
    val books = MediaNavDestination(
        id = "books",
        label = "Books",
        icon = Icons.Outlined.MenuBook,
        selectedIcon = Icons.Filled.MenuBook,
        route = MediaRoutes.BOOKS,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Book
    )
    
    val audiobooks = MediaNavDestination(
        id = "audiobooks",
        label = "Audiobooks",
        icon = Icons.Outlined.Headphones,
        selectedIcon = Icons.Filled.Headphones,
        route = MediaRoutes.AUDIOBOOKS,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Audiobook
    )
    
    val comics = MediaNavDestination(
        id = "comics",
        label = "Comics",
        icon = Icons.Outlined.AutoStories,
        selectedIcon = Icons.Filled.AutoStories,
        route = MediaRoutes.COMICS,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Comic
    )
    
    val movies = MediaNavDestination(
        id = "movies",
        label = "Movies",
        icon = Icons.Outlined.Movie,
        selectedIcon = Icons.Filled.Movie,
        route = MediaRoutes.MOVIES,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Movie
    )
    
    val tvShows = MediaNavDestination(
        id = "tv_shows",
        label = "TV Shows",
        icon = Icons.Outlined.Tv,
        selectedIcon = Icons.Filled.Tv,
        route = MediaRoutes.TV_SHOWS,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.TvShow
    )
    
    val music = MediaNavDestination(
        id = "music",
        label = "Music",
        icon = Icons.Outlined.MusicNote,
        selectedIcon = Icons.Filled.MusicNote,
        route = MediaRoutes.MUSIC,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Music
    )
    
    val podcasts = MediaNavDestination(
        id = "podcasts",
        label = "Podcasts",
        icon = Icons.Outlined.Podcasts,
        selectedIcon = Icons.Filled.Podcasts,
        route = MediaRoutes.PODCASTS,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Podcast
    )
    
    val radio = MediaNavDestination(
        id = "radio",
        label = "Radio",
        icon = Icons.Outlined.Radio,
        selectedIcon = Icons.Filled.Radio,
        route = MediaRoutes.RADIO,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Radio
    )
    
    val documents = MediaNavDestination(
        id = "documents",
        label = "Documents",
        icon = Icons.Outlined.Description,
        selectedIcon = Icons.Filled.Description,
        route = MediaRoutes.DOCUMENTS,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Document
    )
    
    // Discover Section
    val webFiction = MediaNavDestination(
        id = "web_fiction",
        label = "Web Fiction",
        icon = Icons.Outlined.Language,
        selectedIcon = Icons.Filled.Language,
        route = MediaRoutes.WEB_FICTION,
        section = NavSection.DISCOVER,
        mediaTypeColor = MediaColors.MediaTypes.Fanfiction
    )
    
    val opds = MediaNavDestination(
        id = "opds",
        label = "OPDS Catalogs",
        icon = Icons.Outlined.CloudDownload,
        selectedIcon = Icons.Filled.CloudDownload,
        route = MediaRoutes.OPDS_BROWSER,
        section = NavSection.DISCOVER
    )
    
    val freeAudiobooks = MediaNavDestination(
        id = "free_audiobooks",
        label = "Free Audiobooks",
        icon = Icons.Outlined.HeadsetMic,
        selectedIcon = Icons.Filled.HeadsetMic,
        route = MediaRoutes.DISCOVER,
        section = NavSection.DISCOVER,
        enabled = false
    )
    
    val hivefy = MediaNavDestination(
        id = "hivefy",
        label = "Hivefy Music",
        icon = Icons.Outlined.GraphicEq,
        selectedIcon = Icons.Filled.GraphicEq,
        route = MediaRoutes.DISCOVER,
        section = NavSection.DISCOVER,
        mediaTypeColor = MediaColors.MediaTypes.Music,
        enabled = false
    )
    
    val ambient = MediaNavDestination(
        id = "ambient",
        label = "Ambient Sounds",
        icon = Icons.Outlined.Spa,
        selectedIcon = Icons.Filled.Spa,
        route = MediaRoutes.AMBIENT_SOUNDS,
        section = NavSection.DISCOVER
    )

    val visualizer = MediaNavDestination(
        id = "visualizer",
        label = "Visualizer",
        icon = Icons.Outlined.Equalizer,
        selectedIcon = Icons.Filled.Equalizer,
        route = MediaRoutes.VISUALIZER,
        section = NavSection.DISCOVER
    )
    
    val landseek = MediaNavDestination(
        id = "landseek",
        label = "Work with Landseek",
        icon = Icons.Outlined.Public,
        selectedIcon = Icons.Filled.Public,
        route = MediaRoutes.LANDSEEK,
        section = NavSection.DISCOVER
    )
    
    // Downloads Section
    val downloads = MediaNavDestination(
        id = "downloads",
        label = "Downloads",
        icon = Icons.Outlined.Download,
        selectedIcon = Icons.Filled.Download,
        route = MediaRoutes.DISCOVER,
        section = NavSection.DOWNLOADS,
        enabled = false
    )
    
    val storage = MediaNavDestination(
        id = "storage",
        label = "Storage",
        icon = Icons.Outlined.Storage,
        selectedIcon = Icons.Filled.Storage,
        route = MediaRoutes.FILE_BROWSER,
        section = NavSection.DOWNLOADS
    )

    val sync = MediaNavDestination(
        id = "sync",
        label = "Sync",
        icon = Icons.Outlined.Sync,
        selectedIcon = Icons.Filled.Sync,
        route = MediaRoutes.SYNC,
        section = NavSection.DOWNLOADS
    )

    val importExport = MediaNavDestination(
        id = "import_export",
        label = "Import/Export",
        icon = Icons.Outlined.ImportExport,
        selectedIcon = Icons.Filled.ImportExport,
        route = MediaRoutes.IMPORT_EXPORT,
        section = NavSection.DOWNLOADS
    )
    
    // Settings Section
    val collections = MediaNavDestination(
        id = "collections",
        label = "Collections",
        icon = Icons.Outlined.Collections,
        selectedIcon = Icons.Filled.Collections,
        route = MediaRoutes.COLLECTIONS,
        section = NavSection.SETTINGS
    )
    
    val statistics = MediaNavDestination(
        id = "statistics",
        label = "Statistics",
        icon = Icons.Outlined.BarChart,
        selectedIcon = Icons.Filled.BarChart,
        route = MediaRoutes.DISCOVER,
        section = NavSection.SETTINGS,
        enabled = false
    )
    
    val settings = MediaNavDestination(
        id = "settings",
        label = "Settings",
        icon = Icons.Outlined.Settings,
        selectedIcon = Icons.Filled.Settings,
        route = MediaRoutes.SETTINGS,
        section = NavSection.SETTINGS
    )
    
    /**
     * All navigation destinations
     */
    val allDestinations = listOf(
        home,
        search,
        library,
        books, audiobooks, comics, movies, tvShows, music, podcasts, radio, documents,
        discover, webFiction, opds, freeAudiobooks, hivefy, ambient, visualizer, landseek,
        downloads, storage, sync, importExport,
        collections, statistics, settings
    )
    
    /**
     * Primary destinations shown on bottom bar (mobile)
     */
    // On phones the bar is horizontally scrollable, so we can expose all major segments.
    val primaryDestinations = listOf(
        home,
        library,
        discover,
        search,
        webFiction,
        opds,
        ambient,
        visualizer,
        landseek,
        collections,
        sync,
        importExport
    )
    
    /**
     * Get destinations grouped by section
     */
    fun getDestinationsBySection(): Map<NavSection, List<MediaNavDestination>> {
        return allDestinations.groupBy { it.section }
            .toSortedMap(compareBy { it.order })
    }
}

