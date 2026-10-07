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

val libraryTypeOptions: List<com.universalmedialibrary.ui.media.screens.LibraryMediaTypeOption> = emptyList()


// MediaNavDestination/NavSection/NavBadge data classes live in MediaNavDestinations.kt (same package).
// Sidebar composables live in MediaSidebar.kt (same package).

@Composable
fun MediaBottomNavigation(
    currentRoute: String,
    onNavigate: (String) -> Unit,
    destinations: List<MediaNavDestination> = MediaNavDestinations.allDestinations,
    bottomBarPreferences: BottomBarPreferences = BottomBarPreferences.Default,
    gearPosition: BottomGearPosition = BottomGearPosition.RIGHT,
    modifier: Modifier = Modifier
) {
    val cs = MaterialTheme.colorScheme
    var showOverflowSheet by remember { mutableStateOf(false) }

    val layout = remember(destinations, bottomBarPreferences) {
        resolveMediaBottomBarLayout(destinations, bottomBarPreferences)
    }

    val primaryDestinations = layout.primaryItems
    val overflowDestinations = layout.overflowItems

    val isOverflowActive = remember(currentRoute, overflowDestinations) {
        overflowDestinations.any { isDestinationSelected(currentRoute = currentRoute, destinationRoute = it.route) }
    }

    val moreDestination = remember {
        MediaNavDestination(
            id = "more_overflow",
            label = "More",
            icon = Icons.Outlined.MoreHoriz,
            selectedIcon = Icons.Filled.MoreHoriz,
            route = "overflow_sheet"
        )
    }

    Surface(
        modifier = modifier
            .fillMaxWidth()
            .height(MediaSizes.BottomBarHeight)
            .windowInsetsPadding(NavigationBarDefaults.windowInsets),
        color = cs.surface,
        tonalElevation = MediaElevation.MD,
        shadowElevation = MediaElevation.LG
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .height(MediaSizes.BottomBarHeight)
                .padding(horizontal = MediaSpacing.XS),
            horizontalArrangement = Arrangement.SpaceEvenly,
            verticalAlignment = Alignment.CenterVertically
        ) {
            primaryDestinations.forEach { destination ->
                Box(modifier = Modifier.weight(1f), contentAlignment = Alignment.Center) {
                    BottomNavItem(
                        destination = destination,
                        enabled = destination.enabled,
                        isSelected = isDestinationSelected(currentRoute = currentRoute, destinationRoute = destination.route),
                        onClick = { if (destination.enabled) onNavigate(destination.route) }
                    )
                }
            }

            Box(modifier = Modifier.weight(1f), contentAlignment = Alignment.Center) {
                BottomNavItem(
                    destination = moreDestination,
                    enabled = true,
                    isSelected = isOverflowActive,
                    onClick = { showOverflowSheet = true }
                )
            }
        }
    }

    if (showOverflowSheet) {
        com.universalmedialibrary.ui.components.MediaNavigationOverflowSheet(
            items = overflowDestinations,
            currentRoute = currentRoute,
            onDismissRequest = { showOverflowSheet = false },
            onItemClick = { destination ->
                if (destination.enabled) {
                    onNavigate(destination.route)
                }
            }
        )
    }
}

@Composable
private fun BottomNavItem(
    destination: MediaNavDestination,
    enabled: Boolean,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    val cs = MaterialTheme.colorScheme
    val iconColor by animateColorAsState(
        targetValue = when {
            !enabled -> cs.onSurfaceVariant.copy(alpha = 0.5f)
            isSelected -> cs.primary
            else -> cs.onSurfaceVariant
        },
        label = "bottom_nav_icon"
    )
    
    val textColor by animateColorAsState(
        targetValue = when {
            !enabled -> cs.onSurfaceVariant.copy(alpha = 0.5f)
            isSelected -> cs.primary
            else -> cs.onSurfaceVariant.copy(alpha = 0.75f)
        },
        label = "bottom_nav_text"
    )
    
    Column(
        modifier = Modifier
            .widthIn(min = MediaSizes.BottomNavMinItemWidth)
            .clickable(enabled = enabled, onClick = onClick)
            .alpha(if (enabled) 1f else 0.55f)
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        // Selection indicator dot
        Box(
            modifier = Modifier
                .size(MediaSizes.IndicatorDot)
                .clip(CircleShape)
                .background(if (isSelected) cs.primary else Color.Transparent)
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.XS))
        
        // Increased icon size from IconMD (24dp) to IconLG (32dp) for better visibility
        Icon(
            imageVector = if (isSelected) destination.selectedIcon else destination.icon,
            contentDescription = destination.label,
            tint = iconColor,
            modifier = Modifier.size(MediaSizes.IconLG)
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.XS))
        
        Text(
            text = destination.label,
            style = MediaTypography.LabelMedium,
            color = textColor,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis
        )
    }
}

// =============================================================================
// RESPONSIVE NAVIGATION SCAFFOLD
// =============================================================================

/**
 * Responsive navigation scaffold that switches between sidebar and bottom nav
 */
@Composable
fun MediaNavigationScaffold(
    currentRoute: String,
    onNavigate: (String) -> Unit,
    userAvatarUrl: String? = null,
    userName: String = "User",
    bottomBarPreferences: BottomBarPreferences = BottomBarPreferences.Default,
    gearPosition: BottomGearPosition = BottomGearPosition.RIGHT,
    modifier: Modifier = Modifier,
    content: @Composable (PaddingValues) -> Unit
) {
    val configuration = LocalConfiguration.current
    val isCompact = configuration.screenWidthDp < 600
    val isMedium = configuration.screenWidthDp in 600..839
    
    var sidebarExpanded by remember { mutableStateOf(!isMedium) }
    
    if (isCompact) {
        // Mobile: Bottom navigation
        Scaffold(
            modifier = modifier,
            containerColor = MediaColors.Background,
            bottomBar = {
                MediaBottomNavigation(
                    currentRoute = currentRoute,
                    onNavigate = onNavigate,
                    bottomBarPreferences = bottomBarPreferences,
                    gearPosition = gearPosition
                )
            },
            content = content
        )
    } else {
        // Tablet/Desktop: Sidebar navigation
        Row(modifier = modifier.fillMaxSize()) {
            MediaSidebar(
                currentRoute = currentRoute,
                onNavigate = onNavigate,
                isExpanded = sidebarExpanded,
                onToggleExpanded = { sidebarExpanded = !sidebarExpanded },
                userAvatarUrl = userAvatarUrl,
                userName = userName
            )
            
            Box(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxHeight()
                    .background(MediaColors.Background)
            ) {
                content(PaddingValues())
            }
        }
    }
}

internal fun isDestinationSelected(currentRoute: String, destinationRoute: String): Boolean {
    // Exact match, plus nested sub-routes (e.g. settings/* should select settings)
    return currentRoute == destinationRoute || currentRoute.startsWith("$destinationRoute/")
}

fun mapLegacyPreferenceIdToMediaRoute(id: String): String = when (id) {
    "home" -> MediaRoutes.HOME
    "enhanced_search" -> MediaRoutes.SEARCH
    "library_details/1", "books" -> MediaRoutes.BOOKS
    "library_details/2", "audiobooks" -> MediaRoutes.AUDIOBOOKS
    "library_details/3", "comics" -> MediaRoutes.COMICS
    "library_details/4", "movies" -> MediaRoutes.MOVIES
    "library_details/5", "tv_shows" -> MediaRoutes.TV_SHOWS
    "library_details/7", "documents" -> MediaRoutes.DOCUMENTS
    "music" -> MediaRoutes.MUSIC
    "podcasts" -> MediaRoutes.PODCASTS
    "radio" -> MediaRoutes.RADIO
    "visualizer" -> MediaRoutes.VISUALIZER
    "ambient" -> MediaRoutes.AMBIENT_SOUNDS
    "webfiction_manager", "web_fiction" -> MediaRoutes.WEB_FICTION
    "opds_catalog", "opds" -> MediaRoutes.OPDS_BROWSER
    "storage_browser", "storage" -> MediaRoutes.FILE_BROWSER
    "collections" -> MediaRoutes.COLLECTIONS
    "settings" -> MediaRoutes.SETTINGS
    else -> id
}

fun resolveMediaBottomBarLayout(
    destinations: List<MediaNavDestination>,
    bottomBarPreferences: BottomBarPreferences
): com.universalmedialibrary.ui.components.BottomBarLayout<MediaNavDestination> {
    val enabledDestinations = destinations.filter { it.enabled }
    if (enabledDestinations.isEmpty()) {
        return com.universalmedialibrary.ui.components.BottomBarLayout(emptyList(), emptyList())
    }

    fun matchesPreferenceId(dest: MediaNavDestination, prefId: String): Boolean {
        if (dest.id == prefId || dest.route == prefId) return true
        val mapped = mapLegacyPreferenceIdToMediaRoute(prefId)
        if (mapped == dest.route || mapped == dest.id) return true
        return false
    }

    val hiddenPrefIds = bottomBarPreferences.hidden
    val visibleDestinations = enabledDestinations.filter { dest ->
        hiddenPrefIds.none { hiddenId -> matchesPreferenceId(dest, hiddenId) }
    }

    val pinnedPrefIds = when {
        bottomBarPreferences.pinned.isNotEmpty() -> bottomBarPreferences.pinned.filter { it !in hiddenPrefIds }
        bottomBarPreferences.order.isNotEmpty() -> bottomBarPreferences.order.filter { it !in hiddenPrefIds }
        else -> listOf("home", "books", "music", "movies")
    }

    val primaryList = mutableListOf<MediaNavDestination>()
    val usedIds = mutableSetOf<String>()

    for (prefId in pinnedPrefIds) {
        if (primaryList.size >= 4) break
        val match = visibleDestinations.firstOrNull { matchesPreferenceId(it, prefId) }
        if (match != null && usedIds.add(match.id)) {
            primaryList.add(match)
        }
    }

    val defaultFallbackPrefIds = listOf("home", "books", "music", "movies", "library_details/1", "library_details/4")
    for (prefId in defaultFallbackPrefIds) {
        if (primaryList.size >= 4) break
        val match = visibleDestinations.firstOrNull { matchesPreferenceId(it, prefId) }
        if (match != null && usedIds.add(match.id)) {
            primaryList.add(match)
        }
    }

    for (dest in visibleDestinations) {
        if (primaryList.size >= 4) break
        if (usedIds.add(dest.id)) {
            primaryList.add(dest)
        }
    }

    val overflowList = visibleDestinations.filter { it.id !in usedIds }
    return com.universalmedialibrary.ui.components.BottomBarLayout(primaryItems = primaryList, overflowItems = overflowList)
}

private fun applyBottomBarPreferencesToMediaDestinations(
    destinations: List<MediaNavDestination>,
    bottomBarPreferences: BottomBarPreferences
): List<MediaNavDestination> {
    return resolveMediaBottomBarLayout(destinations, bottomBarPreferences).primaryItems
}
