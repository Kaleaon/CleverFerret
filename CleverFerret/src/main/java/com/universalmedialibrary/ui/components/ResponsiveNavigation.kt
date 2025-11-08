package com.universalmedialibrary.ui.components

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.RowScope
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.rememberScrollState
import androidx.compose.material3.Divider
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ModalDrawerSheet
import androidx.compose.material3.NavigationBar
import androidx.compose.material3.NavigationBarItem
import androidx.compose.material3.NavigationDrawerItem
import androidx.compose.material3.NavigationRail
import androidx.compose.material3.NavigationRailItem
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalConfiguration
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
 * 
 * Displays a horizontal navigation bar at the bottom of the screen with items
 * from the bottom navigation list. Automatically highlights the current destination
 * and handles navigation state restoration.
 * 
 * @param navController The NavController used for navigation between destinations
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
 * 
 * Displays a vertical navigation rail on the left side of the screen with all
 * navigation items. This layout is used for tablets and larger screens to make
 * better use of horizontal space.
 * 
 * @param navController The NavController used for navigation between destinations
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
 * 
 * Provides a responsive navigation scaffold with a scrollable bottom bar that can include
 * a settings gear icon positioned on either the left or right side. The bottom bar visibility
 * can be controlled dynamically to hide during scrolling or other user interactions.
 * 
 * @param navController The NavController used for navigation
 * @param bottomNavItems List of navigation items to display in the bottom bar
 * @param settingsItem The settings navigation item
 * @param gearPosition Position of the settings gear icon (LEFT or RIGHT)
 * @param bottomBarVisible Whether the bottom bar should be visible
 * @param onBottomBarVisibleChange Callback when bottom bar visibility changes
 * @param modifier Modifier to be applied to the scaffold
 * @param topBar Optional top app bar composable
 * @param floatingActionButton Optional FAB composable
 * @param content Main content composable receiving PaddingValues
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

/**
 * A scrollable bottom navigation bar with configurable gear icon position.
 * 
 * Internal composable that creates a horizontally scrollable navigation bar
 * with the settings gear icon positioned according to the gearPosition parameter.
 * 
 * @param navController The NavController for navigation
 * @param items List of navigation items to display
 * @param settingsItem The settings navigation item
 * @param gearPosition Position of the settings gear (LEFT or RIGHT)
 * @param currentDestination Current navigation destination for highlighting
 */
@Composable
private fun ScrollableBottomBar(
    navController: NavController,
    items: List<NavigationItem>,
    settingsItem: NavigationItem,
    gearPosition: BottomGearPosition,
    currentDestination: NavDestination?
) {
    val scrollState = rememberScrollState()

    NavigationBar(
        containerColor = MaterialTheme.colorScheme.surface,
        tonalElevation = 3.dp
    ) {
        if (gearPosition == BottomGearPosition.LEFT) {
            NavigationBarEntry(
                navController = navController,
                item = settingsItem,
                currentDestination = currentDestination
            )
        }

        Row(
            modifier = Modifier
                .weight(1f)
                .horizontalScroll(scrollState),
            horizontalArrangement = Arrangement.spacedBy(4.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            items.forEach { item ->
                NavigationBarEntry(
                    navController = navController,
                    item = item,
                    currentDestination = currentDestination
                )
            }
        }

        if (gearPosition == BottomGearPosition.RIGHT) {
            NavigationBarEntry(
                navController = navController,
                item = settingsItem,
                currentDestination = currentDestination
            )
        }
    }
}

/**
 * A single navigation bar item with selection state and click handling.
 * 
 * Internal composable that renders a navigation bar item with proper selection
 * highlighting and navigation logic including state management.
 * 
 * @param navController The NavController for navigation
 * @param item The navigation item to render
 * @param currentDestination Current destination for selection state
 */
@Composable
private fun RowScope.NavigationBarEntry(
    navController: NavController,
    item: NavigationItem,
    currentDestination: NavDestination?
) {
    val selected = currentDestination.isDestinationSelected(item)

    NavigationBarItem(
        icon = { if (selected) item.selectedIcon() else item.icon() },
        label = { Text(item.label) },
        selected = selected,
        onClick = {
            navController.navigate(item.route) {
                popUpTo(navController.graph.startDestinationId) {
                    saveState = true
                }
                launchSingleTop = true
                restoreState = true
            }
        }
    )
}

/**
 * Navigation drawer content showing all navigation items in a vertical list.
 * 
 * Used in conjunction with a drawer layout to provide access to all navigation
 * destinations. Includes app branding at the top and automatically highlights
 * the current destination.
 * 
 * @param navController The NavController for navigation
 * @param navigationItems List of navigation items to display
 * @param settingsItem The settings navigation item
 * @param onItemClick Callback invoked when any item is clicked (for closing drawer)
 */
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
 * 
 * Automatically selects the appropriate navigation UI based on screen width:
 * - Screens < 600dp: Bottom navigation bar
 * - Screens >= 600dp: Navigation rail on the left
 * 
 * @param navController The NavController for navigation
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

/**
 * Determines if a navigation item matches the current destination.
 * 
 * Checks the destination hierarchy to see if any ancestor matches the item's route
 * or routeMatch. Handles parameterized routes and exact matches.
 * 
 * @param item The navigation item to check
 * @return true if the item matches the current destination, false otherwise
 */
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

/**
 * Helper function to check if the current route matches a navigation item.
 * 
 * @param navController The NavController to get current destination from
 * @param item The navigation item to check against
 * @return true if the current route matches the item, false otherwise
 */
private fun currentRouteMatches(navController: NavController, item: NavigationItem): Boolean {
    val destination = navController.currentDestination
    return destination.isDestinationSelected(item)
}

