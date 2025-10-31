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
            route = "library_details/2",
            label = "Audiobooks",
            icon = { Icon(PhosphorIcons.Headphones, contentDescription = "Audiobooks") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "library_details/3",
            label = "Comics",
            icon = { Icon(PhosphorIcons.Books, contentDescription = "Comics") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "library_details/4",
            label = "Movies",
            icon = { Icon(PhosphorIcons.FilmSlate, contentDescription = "Movies") },
            showInBottomNav = false
        ),
        NavigationItem(
            route = "music",
            label = "Music",
            icon = { Icon(PhosphorIcons.MusicNote, contentDescription = "Music") },
            selectedIcon = { Icon(PhosphorIcons.MusicNoteFill, contentDescription = "Music") },
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
            route = "radio",
            label = "Radio",
            icon = { Icon(PhosphorIcons.Radio, contentDescription = "Radio") },
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
            showInBottomNav = true
        ),
        NavigationItem(
            route = "settings",
            label = "Settings",
            icon = { Icon(PhosphorIcons.Gear, contentDescription = "Settings") },
            selectedIcon = { Icon(PhosphorIcons.GearFill, contentDescription = "Settings") },
            showInBottomNav = true
        )
    )

    val bottomNavItems = items.filter { it.showInBottomNav }
}

/**
 * Responsive Navigation Scaffold
 * Automatically switches between BottomNavigation and NavigationRail
 */
@Composable
fun ResponsiveNavigationScaffold(
    navController: NavController,
    modifier: Modifier = Modifier,
    topBar: @Composable () -> Unit = {},
    floatingActionButton: @Composable () -> Unit = {},
    content: @Composable (PaddingValues) -> Unit
) {
    val configuration = LocalConfiguration.current
    val isCompact = configuration.screenWidthDp < 600
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentDestination = navBackStackEntry?.destination

    if (isCompact) {
        // Phone: Bottom Navigation
        Scaffold(
            modifier = modifier,
            topBar = topBar,
            bottomBar = {
                NavigationBar(
                    containerColor = MaterialTheme.colorScheme.surface,
                    tonalElevation = 3.dp
                ) {
                    NavigationItems.bottomNavItems.forEach { item ->
                        val selected = currentDestination?.hierarchy?.any {
                            it.route?.startsWith(item.route) == true
                        } == true

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
                }
            },
            floatingActionButton = floatingActionButton,
            content = content
        )
    } else {
        // Tablet/Desktop: Navigation Rail
        Row(modifier = modifier.fillMaxSize()) {
            NavigationRail(
                containerColor = MaterialTheme.colorScheme.surface,
                contentColor = MaterialTheme.colorScheme.onSurface,
                modifier = Modifier.fillMaxHeight()
            ) {
                Spacer(Modifier.height(16.dp))
                
                NavigationItems.items.forEach { item ->
                    val selected = currentDestination?.hierarchy?.any {
                        it.route?.startsWith(item.route) == true
                    } == true

                    NavigationRailItem(
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
                        },
                        alwaysShowLabel = false
                    )
                }
            }

            Scaffold(
                topBar = topBar,
                floatingActionButton = floatingActionButton,
                content = content,
                modifier = Modifier.fillMaxSize()
            )
        }
    }
}

/**
 * Navigation Drawer for additional items (can be accessed via hamburger menu)
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NavigationDrawerContent(
    navController: NavController,
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
        
        NavigationItems.items.forEach { item ->
            NavigationDrawerItem(
                icon = { item.icon() },
                label = { Text(item.label) },
                selected = false,
                onClick = {
                    navController.navigate(item.route)
                    onItemClick()
                },
                modifier = Modifier.padding(horizontal = 12.dp, vertical = 4.dp)
            )
        }
    }
}
