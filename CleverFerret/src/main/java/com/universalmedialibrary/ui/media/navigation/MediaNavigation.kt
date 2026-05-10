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


// MediaNavDestination/NavSection/NavBadge data classes live in MediaNavDestinations.kt (same package).
// Sidebar composables live in MediaSidebar.kt (same package).

@Composable
fun MediaBottomNavigation(
    currentRoute: String,
    onNavigate: (String) -> Unit,
    destinations: List<MediaNavDestination> = MediaNavDestinations.primaryDestinations,
    bottomBarPreferences: BottomBarPreferences = BottomBarPreferences.Default,
    gearPosition: BottomGearPosition = BottomGearPosition.RIGHT,
    modifier: Modifier = Modifier
) {
    val cs = MaterialTheme.colorScheme
    Surface(
        modifier = modifier
            .fillMaxWidth()
            .height(MediaSizes.BottomBarHeight)
            .windowInsetsPadding(NavigationBarDefaults.windowInsets),
        color = cs.surface,
        tonalElevation = MediaElevation.MD,
        shadowElevation = MediaElevation.LG
    ) {
        val scrollState = rememberScrollState()
        val effectiveDestinations = remember(destinations, bottomBarPreferences) {
            applyBottomBarPreferencesToMediaDestinations(destinations, bottomBarPreferences)
        }
        
        // ===================================================================================
        // Navigation scroll behavior:
        // Start scrolled to the LEFT (beginning) so users see Home and primary items first
        // Users can scroll right to discover more navigation options
        // ===================================================================================
        
        val showLeftFade by remember { derivedStateOf { scrollState.value > 0 } }
        val showRightFade by remember { derivedStateOf { scrollState.value < scrollState.maxValue } }

        // Keep the gear a full-height square "end-cap" so it aligns with the bar and feels tappable.
        val gearOuterPadding = MediaSpacing.XS
        val gearSlotSize = MediaSizes.BottomBarHeight
        val gearSize = gearSlotSize - (gearOuterPadding * 2)
        val scrollContentPadding = when (gearPosition) {
            BottomGearPosition.LEFT -> PaddingValues(start = gearSlotSize, end = MediaSpacing.None)
            BottomGearPosition.RIGHT -> PaddingValues(start = MediaSpacing.None, end = gearSlotSize)
        }

        Box(
            modifier = Modifier
                .fillMaxWidth()
                .heightIn(min = MediaSizes.BottomBarHeight)
        ) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(MediaSizes.BottomBarHeight)
                    .horizontalScroll(scrollState)
                    .padding(scrollContentPadding)
                    .padding(horizontal = MediaSpacing.SM),
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                effectiveDestinations.forEach { destination ->
                    BottomNavItem(
                        destination = destination,
                        enabled = destination.enabled,
                        isSelected = isDestinationSelected(currentRoute = currentRoute, destinationRoute = destination.route),
                        onClick = { if (destination.enabled) onNavigate(destination.route) }
                    )
                }
            }

            // Subtle edge fades to hint that the bar scrolls.
            if (showLeftFade) {
                Box(
                    modifier = Modifier
                        .fillMaxHeight()
                        .width(MediaSizes.BottomNavFadeWidth)
                        .align(Alignment.CenterStart)
                        .background(
                            Brush.horizontalGradient(
                                colors = listOf(cs.surface, Color.Transparent)
                            )
                        )
                )
            }
            if (showRightFade) {
                Box(
                    modifier = Modifier
                        .fillMaxHeight()
                        .width(MediaSizes.BottomNavFadeWidth)
                        .align(Alignment.CenterEnd)
                        .background(
                            Brush.horizontalGradient(
                                colors = listOf(Color.Transparent, cs.surface)
                            )
                        )
                )
            }

            // ===================================================================================
            // FIX: Settings gear was floating randomly due to padding applied after alignment
            // SOLUTION: Use wrapper Box with alignment, then apply padding inside the box
            // This ensures the gear stays fixed at the edge regardless of scroll position
            // ===================================================================================
            // Persistent settings gear overlay (not part of scroll row).
            // Draw this AFTER fades so it stays crisp and never looks "dimmed".
            // Position is fixed at the edge, with padding applied inside the box to ensure consistent placement.
            Box(
                modifier = Modifier
                    .align(
                        if (gearPosition == BottomGearPosition.LEFT) {
                            Alignment.CenterStart
                        } else {
                            Alignment.CenterEnd
                        }
                    )
                    .padding(gearOuterPadding),
                contentAlignment = Alignment.Center
            ) {
                Surface(
                    modifier = Modifier.size(gearSize),
                    shape = RoundedCornerShape(MediaCorners.XS),
                    color = cs.surfaceVariant,
                    tonalElevation = MediaElevation.SM,
                    shadowElevation = MediaElevation.None,
                    onClick = { onNavigate(MediaRoutes.SETTINGS) }
                ) {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = Icons.Outlined.Settings,
                            contentDescription = "Settings",
                            tint = cs.onSurfaceVariant
                        )
                    }
                }
            }
            // ===================================================================================
        }
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

private fun isDestinationSelected(currentRoute: String, destinationRoute: String): Boolean {
    // Exact match, plus nested sub-routes (e.g. settings/* should select settings)
    return currentRoute == destinationRoute || currentRoute.startsWith("$destinationRoute/")
}

private fun applyBottomBarPreferencesToMediaDestinations(
    destinations: List<MediaNavDestination>,
    bottomBarPreferences: BottomBarPreferences
): List<MediaNavDestination> {
    if (bottomBarPreferences == BottomBarPreferences.Default) return destinations

    // The existing bottom bar editor stores preference IDs as legacy route strings.
    // Map the most important legacy IDs to the media-centric routes.
    fun mapLegacyPreferenceIdToMediaRoute(id: String): String? = when (id) {
        "home" -> MediaRoutes.HOME
        "enhanced_search" -> MediaRoutes.SEARCH
        "library_details/1" -> MediaRoutes.LIBRARY_ROOT
        "library_details/2" -> MediaRoutes.LIBRARY_ROOT
        "library_details/3" -> MediaRoutes.LIBRARY_ROOT
        "library_details/4" -> MediaRoutes.LIBRARY_ROOT
        "library_details/5" -> MediaRoutes.LIBRARY_ROOT
        "library_details/7" -> MediaRoutes.LIBRARY_ROOT
        "music" -> MediaRoutes.LIBRARY_ROOT
        "podcasts" -> MediaRoutes.LIBRARY_ROOT
        "radio" -> MediaRoutes.LIBRARY_ROOT
        "visualizer" -> MediaRoutes.VISUALIZER
        "ambient" -> MediaRoutes.AMBIENT_SOUNDS
        "webfiction_manager" -> MediaRoutes.WEB_FICTION
        "opds_catalog" -> MediaRoutes.OPDS_BROWSER
        "storage_browser" -> MediaRoutes.FILE_BROWSER
        "collections" -> MediaRoutes.COLLECTIONS
        "settings" -> MediaRoutes.SETTINGS
        else -> null
    }

    val hiddenRoutes = bottomBarPreferences.hidden.mapNotNull(::mapLegacyPreferenceIdToMediaRoute).toSet()
    val orderedRoutes = bottomBarPreferences.order.mapNotNull(::mapLegacyPreferenceIdToMediaRoute)

    val byRoute = destinations.associateBy { it.route }
    val selected = LinkedHashSet<MediaNavDestination>()

    // Apply ordering
    orderedRoutes.forEach { route ->
        val dest = byRoute[route]
        if (dest != null && dest.route !in hiddenRoutes) selected.add(dest)
    }

    // Append remaining (preserve the "everything is reachable" behavior)
    destinations.forEach { dest ->
        if (dest.route !in hiddenRoutes) selected.add(dest)
    }

    return selected.toList()
}
