package com.universalmedialibrary.ui.components

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import androidx.navigation.NavDestination.Companion.hierarchy
import androidx.navigation.compose.currentBackStackEntryAsState
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * Responsive Navigation Component for Android
 * 
 * Adapts navigation based on screen size:
 * - Phone (< 600dp): BottomNavigation for thumb-friendly access
 * - Tablet/Desktop (>= 600dp): NavigationRail for desktop-like experience
 * 
 * Matches PWA implementation for consistent UX across platforms
 */

data class NavigationItem(
    val route: String,
    val label: String,
    val icon: @Composable () -> Unit,
    val selectedIcon: @Composable () -> Unit = icon,
    val showInBottomNav: Boolean = false
)

object NavigationItems {
    val items = listOf(
        NavigationItem(
            route = "home",
            label = "Home",
            icon = { Icon(PhosphorIcons.House, contentDescription = "Home") },
            selectedIcon = { Icon(PhosphorIcons.HouseFill, contentDescription = "Home") },
            showInBottomNav = true
        ),
        NavigationItem(
            route = "library_details/1",
            label = "Books",
            icon = { Icon(PhosphorIcons.Book, contentDescription = "Books") },
            selectedIcon = { Icon(PhosphorIcons.BookFill, contentDescription = "Books") },
            showInBottomNav = true
        ),
        NavigationItem(
            route = "library_details/3",
            label = "Comics",
            icon = { Icon(PhosphorIcons.Books, contentDescription = "Comics") },
            showInBottomNav = true
        ),
        NavigationItem(
            route = "library_details/2",
            label = "Audiobooks",
            icon = { Icon(PhosphorIcons.Headphones, contentDescription = "Audiobooks") },
            showInBottomNav = true
        ),
        NavigationItem(
            route = "music",
            label = "Music",
            icon = { Icon(PhosphorIcons.MusicNote, contentDescription = "Music") },
            selectedIcon = { Icon(PhosphorIcons.MusicNoteFill, contentDescription = "Music") },
            showInBottomNav = true
        ),
        NavigationItem(
            route = "library_details/4",
            label = "Movies",
            icon = { Icon(PhosphorIcons.FilmSlate, contentDescription = "Movies") },
            showInBottomNav = true
        ),
        NavigationItem(
            route = "library_details/5",
            label = "TV Shows",
            icon = { Icon(PhosphorIcons.Television, contentDescription = "TV Shows") },
            showInBottomNav = true
        ),
        NavigationItem(
            route = "radio",
            label = "Radio",
            icon = { Icon(PhosphorIcons.Radio, contentDescription = "Radio") },
            showInBottomNav = true
        ),
        NavigationItem(
            route = "visualizer",
            label = "Visualizer",
            icon = { Icon(PhosphorIcons.Equalizer, contentDescription = "Visualizer") },
            selectedIcon = { Icon(PhosphorIcons.Equalizer, contentDescription = "Visualizer") },
            showInBottomNav = true
        ),
        NavigationItem(
            route = "ambient",
            label = "Ambient",
            icon = { Icon(PhosphorIcons.Nature, contentDescription = "Ambient") },
            selectedIcon = { Icon(PhosphorIcons.Nature, contentDescription = "Ambient") },
            showInBottomNav = true
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

    val bottomNavItems = items.filter { it.showInBottomNav }
}

/**
 * Bottom navigation bar for phone screens
 */
@Composable
fun BottomNavigationBar(navController: NavController) {
    val bottomNavItems = NavigationItems.bottomNavItems
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentDestination = navBackStackEntry?.destination

    NavigationBar(
        modifier = Modifier.fillMaxWidth()
    ) {
        bottomNavItems.forEach { item ->
            NavigationBarItem(
                icon = { item.icon() },
                label = { Text(item.label) },
                selected = currentDestination?.hierarchy?.any { it.route == item.route } == true,
                onClick = {
                    navController.navigate(item.route) {
                        // Pop up to the start destination of the graph to
                        // avoid building up a large stack of destinations
                        // on the back stack as users select items
                        popUpTo(navController.graph.findStartDestination().id) {
                            saveState = true
                        }
                        // Avoid multiple copies of the same destination when
                        // reselecting the same item
                        launchSingleTop = true
                        // Restore state when reselecting a previously selected item
                        restoreState = true
                    }
                }
            )
        }
    }
}

/**
 * Navigation rail for tablet/desktop screens
 */
@Composable
fun NavigationRailBar(navController: NavController) {
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentDestination = navBackStackEntry?.destination

    NavigationRail(
        modifier = Modifier.fillMaxHeight()
    ) {
        NavigationItems.items.forEach { item ->
            NavigationRailItem(
                icon = { item.icon() },
                label = { Text(item.label) },
                selected = currentDestination?.hierarchy?.any { it.route == item.route } == true,
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
 * Responsive navigation that switches between bottom nav and rail based on screen size
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