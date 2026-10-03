package com.universalmedialibrary.ui.components

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.animateColorAsState
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.detectVerticalDragGestures
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.widthIn
import androidx.compose.foundation.layout.windowInsetsPadding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.LibraryBooks
import androidx.compose.material.icons.automirrored.filled.List
import androidx.compose.material.icons.filled.BarChart
import androidx.compose.material.icons.filled.Collections
import androidx.compose.material.icons.filled.Download
import androidx.compose.material.icons.filled.GraphicEq
import androidx.compose.material.icons.filled.Language
import androidx.compose.material.icons.filled.LibraryMusic
import androidx.compose.material.icons.filled.Menu
import androidx.compose.material.icons.filled.Public
import androidx.compose.material.icons.filled.Sell
import androidx.compose.material.icons.filled.Storage
import androidx.compose.material3.DrawerValue
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.LocalContentColor
import androidx.compose.material3.ModalDrawerSheet
import androidx.compose.material3.ModalNavigationDrawer
import androidx.compose.material3.NavigationBar
import androidx.compose.material3.contentColorFor
import androidx.compose.material3.NavigationBarDefaults
import androidx.compose.material3.NavigationBarItem
import androidx.compose.material3.NavigationDrawerItem
import androidx.compose.material3.NavigationRail
import androidx.compose.material3.NavigationRailItem
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.rememberDrawerState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import kotlinx.coroutines.launch
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.role
import androidx.compose.ui.semantics.selected
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import androidx.navigation.NavDestination
import androidx.navigation.NavDestination.Companion.hierarchy
import androidx.navigation.NavGraph.Companion.findStartDestination
import androidx.navigation.compose.currentBackStackEntryAsState
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode
import com.universalmedialibrary.ui.icons.PhosphorIcons
import com.universalmedialibrary.ui.theme.LocalIsAncientArchitect

data class NavigationItem(
    val route: String,
    val label: String,
    val icon: @Composable () -> Unit,
    val selectedIcon: @Composable () -> Unit = icon,
    val routeMatch: String? = null,
    val showInBottomNav: Boolean = true,
    val preferenceId: String = route
)

/**
 * Canonical list of app destinations consumed by navigation scaffolds.
 */
object NavigationItems {
    val items: List<NavigationItem> = listOf(
        NavigationItem(
            route = "home",
            label = "Home",
            icon = { Icon(PhosphorIcons.House, contentDescription = "Home") },
            selectedIcon = { Icon(PhosphorIcons.HouseFill, contentDescription = "Home") }
        ),
        NavigationItem(
            route = "library_details/1",
            label = "Books",
            icon = { Icon(PhosphorIcons.Book, contentDescription = "Books") },
            selectedIcon = { Icon(PhosphorIcons.BookFill, contentDescription = "Books") }
        ),
        NavigationItem(
            route = "library_details/3",
            label = "Comics",
            icon = { Icon(PhosphorIcons.Books, contentDescription = "Comics") }
        ),
        NavigationItem(
            route = "library_details/2",
            label = "Audiobooks",
            icon = { Icon(PhosphorIcons.Headphones, contentDescription = "Audiobooks") }
        ),
        NavigationItem(
            route = "free_audiobooks",
            label = "Free Audiobooks",
            icon = { Icon(PhosphorIcons.Headphones, contentDescription = "Free Audiobooks") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "music",
            label = "Music",
            icon = { Icon(PhosphorIcons.MusicNote, contentDescription = "Music") },
            selectedIcon = { Icon(PhosphorIcons.MusicNoteFill, contentDescription = "Music") }
        ),
        NavigationItem(
            route = "free_music",
            label = "Free Music",
            icon = { Icon(Icons.Filled.LibraryMusic, contentDescription = "Free Music") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "hivefy_music",
            label = "Hivefy",
            icon = { Icon(Icons.Filled.GraphicEq, contentDescription = "Hivefy") },
            showInBottomNav = true
        ),
        NavigationItem(
            route = "library_details/4",
            label = "Movies",
            icon = { Icon(PhosphorIcons.FilmSlate, contentDescription = "Movies") }
        ),
        NavigationItem(
            route = "free_media",
            label = "Free Media",
            icon = { Icon(Icons.Filled.Collections, contentDescription = "Free Media") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "library_details/5",
            label = "TV Shows",
            icon = { Icon(PhosphorIcons.Television, contentDescription = "TV Shows") }
        ),
        NavigationItem(
            route = "radio",
            label = "Radio",
            icon = { Icon(PhosphorIcons.Radio, contentDescription = "Radio") }
        ),
        NavigationItem(
            route = "visualizer",
            label = "Visualizer",
            icon = { Icon(PhosphorIcons.Equalizer, contentDescription = "Visualizer") }
        ),
        NavigationItem(
            route = "ambient",
            label = "Ambient",
            icon = { Icon(PhosphorIcons.Nature, contentDescription = "Ambient") }
        ),
        NavigationItem(
            route = "webfiction_manager",
            label = "Web Fiction",
            icon = { Icon(Icons.Filled.Language, contentDescription = "Web Fiction") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "story_manager",
            label = "Story Manager",
            icon = { Icon(Icons.AutoMirrored.Filled.List, contentDescription = "Story Manager") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "podcasts",
            label = "Podcasts",
            icon = { Icon(PhosphorIcons.Microphone, contentDescription = "Podcasts") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "library_details/7",
            label = "Documents",
            icon = { Icon(PhosphorIcons.FileText, contentDescription = "Documents") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "collections",
            label = "Collections",
            icon = { Icon(PhosphorIcons.Stack, contentDescription = "Collections") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "fanfiction_download",
            label = "Downloads",
            icon = { Icon(Icons.Filled.Download, contentDescription = "Downloads") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "storage_browser",
            label = "Storage",
            icon = { Icon(Icons.Filled.Storage, contentDescription = "Storage") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "opds_catalog",
            label = "OPDS",
            icon = { Icon(Icons.AutoMirrored.Filled.LibraryBooks, contentDescription = "OPDS") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "reading_statistics",
            label = "Statistics",
            icon = { Icon(Icons.Filled.BarChart, contentDescription = "Statistics") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "enhanced_search",
            label = "Search",
            icon = { Icon(PhosphorIcons.MagnifyingGlass, contentDescription = "Search") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "tag_explorer",
            label = "Tag Explorer",
            icon = { Icon(Icons.Filled.Sell, contentDescription = "Tag Explorer") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "settings",
            label = "Settings",
            icon = { Icon(PhosphorIcons.Gear, contentDescription = "Settings") },
            selectedIcon = { Icon(PhosphorIcons.GearFill, contentDescription = "Settings") },
            showInBottomNav = false
        )
    )

    val bottomNavItems: List<NavigationItem> = items.filter { it.showInBottomNav }
    val settingsItem: NavigationItem = items.first { it.route == "settings" }
    
    /** All navigation items available for drawer, including those hidden from bottom bar */
    val drawerItems: List<NavigationItem> = items
}

