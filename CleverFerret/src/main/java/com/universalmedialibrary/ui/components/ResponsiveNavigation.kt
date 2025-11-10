package com.universalmedialibrary.ui.components

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.animateColorAsState
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.background
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
import androidx.compose.material3.Divider
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.LocalContentColor
import androidx.compose.material3.ModalDrawerSheet
import androidx.compose.material3.NavigationBar
import androidx.compose.material3.NavigationBarDefaults
import androidx.compose.material3.NavigationBarItem
import androidx.compose.material3.NavigationDrawerItem
import androidx.compose.material3.NavigationRail
import androidx.compose.material3.NavigationRailItem
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.role
import androidx.compose.ui.semantics.selected
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import androidx.navigation.NavDestination
import androidx.navigation.NavDestination.Companion.hierarchy
import androidx.navigation.NavGraph.Companion.findStartDestination
import androidx.navigation.compose.currentBackStackEntryAsState
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * Represents a navigation item for bottom navigation, navigation rail, and drawer destinations.
 */
data class NavigationItem(
    val route: String,
    val label: String,
    val icon: @Composable () -> Unit,
    val selectedIcon: @Composable () -> Unit = icon,
    val routeMatch: String? = null,
    val showInBottomNav: Boolean = true
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
            route = "music",
            label = "Music",
            icon = { Icon(PhosphorIcons.MusicNote, contentDescription = "Music") },
            selectedIcon = { Icon(PhosphorIcons.MusicNoteFill, contentDescription = "Music") }
        ),
        NavigationItem(
            route = "library_details/4",
            label = "Movies",
            icon = { Icon(PhosphorIcons.FilmSlate, contentDescription = "Movies") }
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
            route = "search",
            label = "Search",
            icon = { Icon(PhosphorIcons.MagnifyingGlass, contentDescription = "Search") },
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

/**
 * High-level scaffold that adapts navigation chrome between bottom bar and drawer/rail combos.
 */
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
    content: @Composable (PaddingValues) -> Unit
) {
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentDestination = navBackStackEntry?.destination

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
                    ScrollableBottomBar(
                        navController = navController,
                        items = bottomNavItems,
                        settingsItem = settingsItem,
                        gearPosition = gearPosition,
                        currentDestination = currentDestination
                    )
                }
            },
            content = content
        )
    }
}

@Composable
private fun ScrollableBottomBar(
    navController: NavController,
    items: List<NavigationItem>,
    settingsItem: NavigationItem,
    gearPosition: BottomGearPosition,
    currentDestination: NavDestination?
) {
    val scrollState = rememberScrollState()

    Surface(
        modifier = Modifier.windowInsetsPadding(NavigationBarDefaults.windowInsets),
        color = NavigationBarDefaults.containerColor,
        contentColor = NavigationBarDefaults.contentColor,
        tonalElevation = 3.dp,
        shadowElevation = 0.dp
    ) {
        Box(modifier = Modifier.fillMaxWidth()) {
            Row(
                modifier = Modifier
                    .horizontalScroll(scrollState)
                    .padding(horizontal = 12.dp, vertical = 8.dp),
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                if (gearPosition == BottomGearPosition.LEFT) {
                    ScrollableNavigationBarEntry(
                        navController = navController,
                        item = settingsItem,
                        currentDestination = currentDestination
                    )
                }

                items.forEach { item ->
                    ScrollableNavigationBarEntry(
                        navController = navController,
                        item = item,
                        currentDestination = currentDestination
                    )
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
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun ScrollableNavigationBarEntry(
    navController: NavController,
    item: NavigationItem,
    currentDestination: NavDestination?
) {
    val selected = currentDestination.isDestinationSelected(item)
    val containerColor by animateColorAsState(
        targetValue = if (selected) {
            MaterialTheme.colorScheme.secondaryContainer
        } else {
            Color.Transparent
        },
        label = "bottom_bar_container_color"
    )
    val contentColor by animateColorAsState(
        targetValue = if (selected) {
            MaterialTheme.colorScheme.onSecondaryContainer
        } else {
            MaterialTheme.colorScheme.onSurfaceVariant
        },
        label = "bottom_bar_content_color"
    )
    val interactionSource = remember { MutableInteractionSource() }

    Surface(
        modifier = Modifier
            .widthIn(min = 72.dp)
            .semantics {
                role = Role.Tab
                this.selected = selected
            },
        shape = RoundedCornerShape(18.dp),
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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NavigationDrawerContent(
    navController: NavController,
    navigationItems: List<NavigationItem>,
    settingsItem: NavigationItem = NavigationItems.settingsItem,
    onItemClick: () -> Unit = {}
) {
    ModalDrawerSheet {
        Spacer(Modifier.height(16.dp))
        Text(
            text = "CleverFerret",
            style = MaterialTheme.typography.headlineSmall,
            modifier = Modifier.padding(16.dp)
        )
        Divider()
        Spacer(Modifier.height(8.dp))

        (navigationItems + settingsItem).forEach { item ->
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
                }
            )
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

