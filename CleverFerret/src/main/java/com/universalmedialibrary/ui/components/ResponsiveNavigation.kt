package com.universalmedialibrary.ui.components

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.Alignment
import androidx.compose.foundation.gestures.awaitEachGesture
import androidx.compose.foundation.gestures.awaitFirstDown
import androidx.compose.ui.input.pointer.AwaitPointerEventScope
import androidx.compose.ui.input.pointer.PointerEventPass
import androidx.compose.ui.input.pointer.PointerInputChange
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.input.pointer.positionChange
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import androidx.navigation.NavDestination
import androidx.navigation.NavDestination.Companion.hierarchy
import androidx.navigation.compose.currentBackStackEntryAsState
import com.universalmedialibrary.data.settings.BottomGearPosition

data class NavigationItem(
    val route: String,
    val label: String,
    val icon: @Composable () -> Unit,
    val selectedIcon: @Composable () -> Unit = icon,
    val routeMatch: String? = null
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
@Composable
fun ResponsiveNavigationScaffold(
    navController: NavController,
    bottomNavItems: List<NavigationItem>,
    settingsItem: NavigationItem,
    gearPosition: BottomGearPosition,
    bottomBarVisible: Boolean,
    onBottomBarVisibleChange: (Boolean) -> Unit,
    modifier: Modifier = Modifier,
    topBar: @Composable () -> Unit = {},
    floatingActionButton: @Composable () -> Unit = {},
    content: @Composable (PaddingValues) -> Unit
) {
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentDestination = navBackStackEntry?.destination

    val density = LocalDensity.current
    val gestureThreshold = with(density) { 96.dp.toPx() }

    Box(
        modifier = modifier
            .fillMaxSize()
            .bottomBarGestureDetector(
                isVisible = bottomBarVisible,
                onHide = { onBottomBarVisibleChange(false) },
                onShow = { onBottomBarVisibleChange(true) },
                hideThreshold = gestureThreshold,
                showThreshold = gestureThreshold
            )
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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NavigationDrawerContent(
    navController: NavController,
    navigationItems: List<NavigationItem>,
    settingsItem: NavigationItem,
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
            NavigationDrawerItem(
                icon = { item.icon() },
                label = { Text(item.label) },
                selected = currentRouteMatches(navController, item),
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

private fun Modifier.bottomBarGestureDetector(
    isVisible: Boolean,
    onHide: () -> Unit,
    onShow: () -> Unit,
    hideThreshold: Float,
    showThreshold: Float
): Modifier = pointerInput(isVisible, hideThreshold, showThreshold) {
    awaitEachGesture {
        awaitFirstDown(requireUnconsumed = false)
        var pointerCount = 1
        var cumulativeTwoFingerDelta = 0f
        var cumulativeSingleFingerDelta = 0f
        var hideTriggered = false
        var showTriggered = false

        do {
            val event = awaitPointerEvent()
            val changes = event.changes.filter { it.pressed }
            pointerCount = changes.size

            if (pointerCount >= 2) {
                val averageDelta = changes.map { it.positionChange().y }.average().toFloat()
                cumulativeTwoFingerDelta += averageDelta
                if (!hideTriggered && isVisible && cumulativeTwoFingerDelta > hideThreshold) {
                    hideTriggered = true
                    onHide()
                }
            } else if (pointerCount == 1) {
                val delta = changes.firstOrNull()?.positionChange()?.y ?: 0f
                cumulativeSingleFingerDelta += delta
                if (!showTriggered && !isVisible && cumulativeSingleFingerDelta < -showThreshold) {
                    showTriggered = true
                    onShow()
                }
            }
        } while (changes.any { it.pressed })
    }
}
