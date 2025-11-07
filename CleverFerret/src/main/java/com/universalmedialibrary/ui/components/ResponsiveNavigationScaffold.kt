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
 * Responsive Navigation Scaffold that adapts to screen size
 * 
 * This component provides a scaffold structure that switches between
 * bottom navigation (phones) and navigation rail (tablets/desktop)
 * while maintaining proper padding and content areas.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ResponsiveNavigationScaffold(
    navController: NavController,
    topBar: @Composable () -> Unit = {},
    floatingActionButton: @Composable () -> Unit = {},
    content: @Composable (PaddingValues) -> Unit
) {
    val configuration = LocalConfiguration.current
    val screenWidth = configuration.screenWidthDp.dp

    if (screenWidth < 600.dp) {
        // Phone layout - use bottom navigation
        Scaffold(
            topBar = topBar,
            bottomBar = {
                BottomNavigationBar(navController)
            },
            floatingActionButton = floatingActionButton,
            content = content
        )
    } else {
        // Tablet/Desktop layout - use navigation rail
        Row(
            modifier = Modifier.fillMaxSize()
        ) {
            // Navigation Rail on the left
            NavigationRailBar(navController)
            
            // Main content area
            Scaffold(
                topBar = topBar,
                floatingActionButton = floatingActionButton,
                content = { paddingValues ->
                    // Add extra padding for the rail
                    val modifiedPadding = PaddingValues(
                        start = 16.dp,
                        top = paddingValues.calculateTopPadding(),
                        end = paddingValues.calculateEndPadding(),
                        bottom = paddingValues.calculateBottomPadding()
                    )
                    content(modifiedPadding)
                }
            )
        }
    }
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