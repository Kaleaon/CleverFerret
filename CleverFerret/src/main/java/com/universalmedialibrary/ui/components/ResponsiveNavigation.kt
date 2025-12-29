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

/**
 * Represents a navigation item for bottom navigation, navigation rail, and drawer destinations.
 */
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

/**
 * Standard bottom navigation bar used on compact width devices.
 */
@Composable
fun BottomNavigationBar(navController: NavController) {
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentDestination = navBackStackEntry?.destination

    NavigationBar(modifier = Modifier.fillMaxWidth()) {
        NavigationItems.bottomNavItems.forEach { item ->
            val selected = currentDestination.isDestinationSelected(item)
            NavigationBarItem(
                icon = { if (selected) item.selectedIcon() else item.icon() },
                label = { Text(item.label) },
                selected = selected,
                onClick = {
                    navController.navigate(item.route) {
                        popUpTo(navController.graph.findStartDestination().id) {
                            saveState = true
                        }
                        launchSingleTop = true
                        restoreState = true
                    }
                }
            )
        }
    }
}

/**
 * Navigation rail shown on medium and expanded width devices.
 */
@Composable
fun NavigationRailBar(navController: NavController) {
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentDestination = navBackStackEntry?.destination
    val isAncientArchitect = LocalIsAncientArchitect.current

    if (isAncientArchitect) {
        AncientArchitectNavigationRail(modifier = Modifier.fillMaxHeight()) {
            NavigationItems.items.forEach { item ->
                val selected = currentDestination.isDestinationSelected(item)
                AncientArchitectNavigationRailItem(
                    selected = selected,
                    onClick = {
                        navController.navigate(item.route) {
                            popUpTo(navController.graph.findStartDestination().id) {
                                saveState = true
                            }
                            launchSingleTop = true
                            restoreState = true
                        }
                    },
                    icon = { if (selected) item.selectedIcon() else item.icon() },
                    label = { Text(item.label) }
                )
            }
        }
    } else {
        NavigationRail(modifier = Modifier.fillMaxHeight()) {
            NavigationItems.items.forEach { item ->
                val selected = currentDestination.isDestinationSelected(item)
                NavigationRailItem(
                    icon = { if (selected) item.selectedIcon() else item.icon() },
                    label = { Text(item.label) },
                    selected = selected,
                    onClick = {
                        navController.navigate(item.route) {
                            popUpTo(navController.graph.findStartDestination().id) {
                                saveState = true
                            }
                            launchSingleTop = true
                            restoreState = true
                        }
                    }
                )
            }
        }
    }
}

/**
 * High-level scaffold that adapts navigation chrome between bottom bar and drawer/rail combos.
 * Now includes a navigation drawer accessible via hamburger menu in the top-left corner.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ResponsiveNavigationScaffold(
    navController: NavController,
    bottomNavItems: List<NavigationItem> = NavigationItems.bottomNavItems,
    settingsItem: NavigationItem = NavigationItems.settingsItem,
    gearPosition: BottomGearPosition = BottomGearPosition.RIGHT,
    bottomBarVisible: Boolean = true,
    onBottomBarVisibleChange: (Boolean) -> Unit = {},
    modifier: Modifier = Modifier,
    topBar: @Composable () -> Unit = {},
    floatingActionButton: @Composable () -> Unit = {},
    debugButton: @Composable (() -> Unit)? = null,
    mediaControlsState: MediaControlsState? = null,
    miniPlayerBackgroundMode: MiniPlayerBackgroundMode = MiniPlayerBackgroundMode.THEME,
    mediaControlActions: MediaControlActions = MediaControlActions(),
    content: @Composable (PaddingValues) -> Unit
) {
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentDestination = navBackStackEntry?.destination
    val drawerState = rememberDrawerState(initialValue = DrawerValue.Closed)
    val scope = rememberCoroutineScope()

    ModalNavigationDrawer(
        drawerState = drawerState,
        drawerContent = {
            NavigationDrawerContent(
                navController = navController,
                navigationItems = NavigationItems.drawerItems,
                onItemClick = {
                    scope.launch { drawerState.close() }
                }
            )
        }
    ) {
        Box(
            modifier = modifier.fillMaxSize()
        ) {
            Scaffold(
                topBar = topBar,
                floatingActionButton = floatingActionButton,
                bottomBar = {
                    AnimatedVisibility(
                        visible = bottomBarVisible,
                        enter = fadeIn() + slideInVertically(initialOffsetY = { it }),
                        exit = fadeOut() + slideOutVertically(targetOffsetY = { it })
                    ) {
                        BottomBarWithMediaControls(
                            navController = navController,
                            items = bottomNavItems,
                            settingsItem = settingsItem,
                            gearPosition = gearPosition,
                            currentDestination = currentDestination,
                            mediaControlsState = mediaControlsState,
                            miniPlayerBackgroundMode = miniPlayerBackgroundMode,
                            mediaControlActions = mediaControlActions,
                            debugButton = debugButton
                        )
                    }
                },
                content = content
            )
            
            // Hamburger menu button in top-left corner - uses FilledTonalIconButton for proper touch handling
            androidx.compose.material3.FilledTonalIconButton(
                onClick = { scope.launch { drawerState.open() } },
                modifier = Modifier
                    .align(Alignment.TopStart)
                    .padding(start = 8.dp, top = 8.dp)
                    .size(48.dp)
            ) {
                Icon(
                    imageVector = Icons.Filled.Menu,
                    contentDescription = "Open navigation menu"
                )
            }
        }
    }
}

@Composable
private fun BottomBarWithMediaControls(
    navController: NavController,
    items: List<NavigationItem>,
    settingsItem: NavigationItem,
    gearPosition: BottomGearPosition,
    currentDestination: NavDestination?,
    mediaControlsState: MediaControlsState?,
    miniPlayerBackgroundMode: MiniPlayerBackgroundMode,
    mediaControlActions: MediaControlActions,
    debugButton: @Composable (() -> Unit)? = null
) {
    var controlsExpanded by rememberSaveable { mutableStateOf(false) }
    val controlsAvailable = mediaControlsState?.isVisible == true

    LaunchedEffect(controlsAvailable) {
        if (!controlsAvailable) {
            controlsExpanded = false
        }
    }

    val bottomBarModifier = if (controlsAvailable) {
        Modifier.pointerInput(controlsExpanded) {
            detectVerticalDragGestures(
                onVerticalDrag = { change, dragAmount ->
                    when {
                        dragAmount < -16 -> {
                            controlsExpanded = true
                            change.consume()
                        }
                        dragAmount > 16 && controlsExpanded -> {
                            controlsExpanded = false
                            change.consume()
                        }
                    }
                }
            )
        }
    } else {
        Modifier
    }

    Column(
        modifier = Modifier
            .fillMaxWidth(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Bottom
    ) {
        if (controlsAvailable) {
            val handleModifier = Modifier
                .padding(top = 4.dp, bottom = if (controlsExpanded) 8.dp else 4.dp)
                .pointerInput(Unit) {
                    detectVerticalDragGestures(
                        onVerticalDrag = { change, dragAmount ->
                            when {
                                dragAmount < -14 -> {
                                    controlsExpanded = true
                                    change.consume()
                                }
                                dragAmount > 14 -> {
                                    controlsExpanded = false
                                    change.consume()
                                }
                            }
                        }
                    )
                }
                .clickable { controlsExpanded = !controlsExpanded }

            Box(
                modifier = handleModifier,
                contentAlignment = Alignment.Center
            ) {
                Box(
                    modifier = Modifier
                        .size(width = 48.dp, height = 5.dp)
                        .background(
                            color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.4f),
                            shape = RoundedCornerShape(2.5.dp)
                        )
                )
            }

            MediaControlsBar(
                isVisible = controlsExpanded,
                title = mediaControlsState.title,
                artist = mediaControlsState.artist,
                isPlaying = mediaControlsState.isPlaying,
                isCasting = mediaControlsState.isCasting,
                castDeviceName = mediaControlsState.castDeviceName,
                albumArtUrl = mediaControlsState.albumArtUrl,
                backgroundMode = miniPlayerBackgroundMode,
                onPlayPause = mediaControlActions.onPlayPause,
                onSkipNext = mediaControlActions.onSkipNext,
                onSkipPrevious = mediaControlActions.onSkipPrevious,
                onClick = mediaControlActions.onOpenPlayer,
                modifier = Modifier.fillMaxWidth()
            )

            Spacer(modifier = Modifier.height(8.dp))
        }

        ScrollableBottomBar(
            navController = navController,
            items = items,
            settingsItem = settingsItem,
            gearPosition = gearPosition,
            currentDestination = currentDestination,
            debugButton = debugButton,
            modifier = bottomBarModifier
        )
    }
}

@Composable
private fun ScrollableBottomBar(
    navController: NavController,
    items: List<NavigationItem>,
    settingsItem: NavigationItem,
    gearPosition: BottomGearPosition,
    currentDestination: NavDestination?,
    debugButton: @Composable (() -> Unit)? = null,
    modifier: Modifier = Modifier
) {
    val scrollState = rememberScrollState()

    Surface(
        modifier = modifier.windowInsetsPadding(NavigationBarDefaults.windowInsets),
        color = NavigationBarDefaults.containerColor,
        contentColor = MaterialTheme.colorScheme.contentColorFor(NavigationBarDefaults.containerColor),
        tonalElevation = 3.dp,
        shadowElevation = 0.dp
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 12.dp, vertical = 8.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Debug button on the left side (if provided)
            debugButton?.invoke()
            
            if (gearPosition == BottomGearPosition.LEFT) {
                ScrollableNavigationBarEntry(
                    navController = navController,
                    item = settingsItem,
                    currentDestination = currentDestination
                )
            }

            Row(
                modifier = Modifier
                    .weight(1f)
                    .horizontalScroll(scrollState),
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                items.forEach { item ->
                    ScrollableNavigationBarEntry(
                        navController = navController,
                        item = item,
                        currentDestination = currentDestination
                    )
                }
            }

            if (gearPosition == BottomGearPosition.RIGHT) {
                ScrollableNavigationBarEntry(
                    navController = navController,
                    item = settingsItem,
                    currentDestination = currentDestination
                )
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun ScrollableNavigationBarEntry(
    navController: NavController,
    item: NavigationItem,
    currentDestination: NavDestination?
) {
    val isSettingsItem = item.route == "settings"
    val selected = currentDestination.isDestinationSelected(item)
    val containerColor by animateColorAsState(
        targetValue = when {
            isSettingsItem && selected -> MaterialTheme.colorScheme.primary
            isSettingsItem -> MaterialTheme.colorScheme.surfaceVariant
            selected -> MaterialTheme.colorScheme.secondaryContainer
            else -> Color.Transparent
        },
        label = "bottom_bar_container_color"
    )
    val contentColor by animateColorAsState(
        targetValue = when {
            isSettingsItem && selected -> MaterialTheme.colorScheme.onPrimary
            isSettingsItem -> MaterialTheme.colorScheme.onSurfaceVariant
            selected -> MaterialTheme.colorScheme.onSecondaryContainer
            else -> MaterialTheme.colorScheme.onSurfaceVariant
        },
        label = "bottom_bar_content_color"
    )
    val interactionSource = remember { MutableInteractionSource() }

    val surfaceModifier = if (isSettingsItem) {
        Modifier.size(56.dp)
    } else {
        Modifier.widthIn(min = 72.dp)
    }

    Surface(
        modifier = surfaceModifier
            .semantics {
                role = Role.Tab
                this.selected = selected
                contentDescription = item.label
            },
        shape = if (isSettingsItem) RoundedCornerShape(12.dp) else RoundedCornerShape(18.dp),
        color = containerColor,
        contentColor = contentColor,
        tonalElevation = 0.dp,
        shadowElevation = 0.dp,
        interactionSource = interactionSource,
        onClick = {
            navController.navigate(item.route) {
                popUpTo(navController.graph.startDestinationId) {
                    saveState = true
                }
                launchSingleTop = true
                restoreState = true
            }
        }
    ) {
        CompositionLocalProvider(LocalContentColor provides contentColor) {
            if (isSettingsItem) {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    if (selected) item.selectedIcon() else item.icon()
                }
            } else {
                Column(
                    modifier = Modifier
                        .padding(horizontal = 12.dp, vertical = 8.dp),
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    Box(
                        modifier = Modifier
                            .size(24.dp),
                        contentAlignment = Alignment.Center
                    ) {
                        if (selected) item.selectedIcon() else item.icon()
                    }
                    Text(
                        text = item.label,
                        style = MaterialTheme.typography.labelSmall,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NavigationDrawerContent(
    navController: NavController,
    navigationItems: List<NavigationItem>,
    onItemClick: () -> Unit = {}
) {
    val scrollState = rememberScrollState()
    
    ModalDrawerSheet(
        modifier = Modifier.width(280.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxHeight()
                .verticalScroll(scrollState)
        ) {
            Spacer(Modifier.height(16.dp))
            Text(
                text = "CleverFerret",
                style = MaterialTheme.typography.headlineSmall,
                modifier = Modifier.padding(16.dp),
                color = MaterialTheme.colorScheme.primary
            )
            HorizontalDivider(modifier = Modifier.padding(horizontal = 16.dp))
            Spacer(Modifier.height(8.dp))

            navigationItems.forEach { item ->
                val selected = currentRouteMatches(navController, item)
                NavigationDrawerItem(
                    icon = { if (selected) item.selectedIcon() else item.icon() },
                    label = { Text(item.label) },
                    selected = selected,
                    onClick = {
                        onItemClick()
                        navController.navigate(item.route) {
                            popUpTo(navController.graph.findStartDestination().id) {
                                saveState = true
                            }
                            launchSingleTop = true
                            restoreState = true
                        }
                    },
                    modifier = Modifier.padding(horizontal = 12.dp)
                )
            }
            
            Spacer(modifier = Modifier.height(16.dp))
        }
    }
}

/**
 * Convenience composable that switches between bottom navigation and navigation rail.
 */
@Composable
fun ResponsiveNavigation(navController: NavController) {
    val configuration = LocalConfiguration.current
    val screenWidth = configuration.screenWidthDp.dp

    if (screenWidth < 600.dp) {
        BottomNavigationBar(navController)
    } else {
        Row(modifier = Modifier.fillMaxSize()) {
            NavigationRailBar(navController)
            Spacer(modifier = Modifier.width(16.dp))
        }
    }
}

private fun NavDestination?.isDestinationSelected(item: NavigationItem): Boolean {
    val candidates = buildList {
        add(item.route)
        item.routeMatch?.let { add(it) }
    }

    return this?.hierarchy?.any { destination ->
        val route = destination.route
        candidates.any { candidate ->
            when {
                candidate.contains("{") -> route == candidate
                route == candidate -> true
                else -> route?.startsWith(candidate) == true
            }
        }
    } == true
}

private fun currentRouteMatches(navController: NavController, item: NavigationItem): Boolean {
    val destination = navController.currentDestination
    return destination.isDestinationSelected(item)
}

