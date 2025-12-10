package com.universalmedialibrary.ui.plex.navigation

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
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.plex.theme.*

/**
 * Plex-Style Navigation System
 * 
 * A beautiful, collapsible sidebar navigation inspired by Plex's design.
 * Features:
 * - Collapsible sidebar (full width ↔ icon-only)
 * - Sections with dividers
 * - Hover states and animations
 * - User profile section
 * - Quick actions
 * - Media type badges with colors
 */

// =============================================================================
// NAVIGATION DATA MODEL
// =============================================================================

/**
 * Navigation destination
 */
data class PlexNavDestination(
    val id: String,
    val label: String,
    val icon: ImageVector,
    val selectedIcon: ImageVector = icon,
    val route: String,
    val section: NavSection = NavSection.LIBRARY,
    val badge: NavBadge? = null,
    val mediaTypeColor: Color? = null,
    val enabled: Boolean = true
)

/**
 * Navigation sections for grouping
 */
enum class NavSection(val title: String, val order: Int) {
    HOME("", 0),
    LIBRARY("Library", 1),
    DISCOVER("Discover", 2),
    DOWNLOADS("Downloads", 3),
    SETTINGS("Settings", 4)
}

/**
 * Badge to display on navigation item
 */
data class NavBadge(
    val count: Int = 0,
    val text: String? = null,
    val color: Color = PlexColors.AccentPrimary
)

/**
 * Default navigation destinations for CleverFerret
 */
object PlexNavDestinations {
    
    val home = PlexNavDestination(
        id = "home",
        label = "Home",
        icon = Icons.Outlined.Home,
        selectedIcon = Icons.Filled.Home,
        route = "home",
        section = NavSection.HOME
    )
    
    // Library Section
    val books = PlexNavDestination(
        id = "books",
        label = "Books",
        icon = Icons.Outlined.MenuBook,
        selectedIcon = Icons.Filled.MenuBook,
        route = "library_details/1",
        section = NavSection.LIBRARY,
        mediaTypeColor = PlexColors.MediaTypes.Book
    )
    
    val audiobooks = PlexNavDestination(
        id = "audiobooks",
        label = "Audiobooks",
        icon = Icons.Outlined.Headphones,
        selectedIcon = Icons.Filled.Headphones,
        route = "library_details/2",
        section = NavSection.LIBRARY,
        mediaTypeColor = PlexColors.MediaTypes.Audiobook
    )
    
    val comics = PlexNavDestination(
        id = "comics",
        label = "Comics",
        icon = Icons.Outlined.AutoStories,
        selectedIcon = Icons.Filled.AutoStories,
        route = "library_details/3",
        section = NavSection.LIBRARY,
        mediaTypeColor = PlexColors.MediaTypes.Comic
    )
    
    val movies = PlexNavDestination(
        id = "movies",
        label = "Movies",
        icon = Icons.Outlined.Movie,
        selectedIcon = Icons.Filled.Movie,
        route = "library_details/4",
        section = NavSection.LIBRARY,
        mediaTypeColor = PlexColors.MediaTypes.Movie
    )
    
    val tvShows = PlexNavDestination(
        id = "tv_shows",
        label = "TV Shows",
        icon = Icons.Outlined.Tv,
        selectedIcon = Icons.Filled.Tv,
        route = "library_details/5",
        section = NavSection.LIBRARY,
        mediaTypeColor = PlexColors.MediaTypes.TvShow
    )
    
    val music = PlexNavDestination(
        id = "music",
        label = "Music",
        icon = Icons.Outlined.MusicNote,
        selectedIcon = Icons.Filled.MusicNote,
        route = "music",
        section = NavSection.LIBRARY,
        mediaTypeColor = PlexColors.MediaTypes.Music
    )
    
    val podcasts = PlexNavDestination(
        id = "podcasts",
        label = "Podcasts",
        icon = Icons.Outlined.Podcasts,
        selectedIcon = Icons.Filled.Podcasts,
        route = "podcasts",
        section = NavSection.LIBRARY,
        mediaTypeColor = PlexColors.MediaTypes.Podcast
    )
    
    val radio = PlexNavDestination(
        id = "radio",
        label = "Radio",
        icon = Icons.Outlined.Radio,
        selectedIcon = Icons.Filled.Radio,
        route = "radio",
        section = NavSection.LIBRARY,
        mediaTypeColor = PlexColors.MediaTypes.Radio
    )
    
    val documents = PlexNavDestination(
        id = "documents",
        label = "Documents",
        icon = Icons.Outlined.Description,
        selectedIcon = Icons.Filled.Description,
        route = "library_details/7",
        section = NavSection.LIBRARY,
        mediaTypeColor = PlexColors.MediaTypes.Document
    )
    
    // Discover Section
    val webFiction = PlexNavDestination(
        id = "web_fiction",
        label = "Web Fiction",
        icon = Icons.Outlined.Language,
        selectedIcon = Icons.Filled.Language,
        route = "webfiction_manager",
        section = NavSection.DISCOVER,
        mediaTypeColor = PlexColors.MediaTypes.Fanfiction
    )
    
    val opds = PlexNavDestination(
        id = "opds",
        label = "OPDS Catalogs",
        icon = Icons.Outlined.CloudDownload,
        selectedIcon = Icons.Filled.CloudDownload,
        route = "opds_catalog",
        section = NavSection.DISCOVER
    )
    
    val freeAudiobooks = PlexNavDestination(
        id = "free_audiobooks",
        label = "Free Audiobooks",
        icon = Icons.Outlined.HeadsetMic,
        selectedIcon = Icons.Filled.HeadsetMic,
        route = "free_audiobooks",
        section = NavSection.DISCOVER
    )
    
    val hivefy = PlexNavDestination(
        id = "hivefy",
        label = "Hivefy Music",
        icon = Icons.Outlined.GraphicEq,
        selectedIcon = Icons.Filled.GraphicEq,
        route = "hivefy_music",
        section = NavSection.DISCOVER,
        mediaTypeColor = PlexColors.MediaTypes.Music
    )
    
    val ambient = PlexNavDestination(
        id = "ambient",
        label = "Ambient Sounds",
        icon = Icons.Outlined.Spa,
        selectedIcon = Icons.Filled.Spa,
        route = "ambient",
        section = NavSection.DISCOVER
    )
    
    // Downloads Section
    val downloads = PlexNavDestination(
        id = "downloads",
        label = "Downloads",
        icon = Icons.Outlined.Download,
        selectedIcon = Icons.Filled.Download,
        route = "fanfiction_download",
        section = NavSection.DOWNLOADS
    )
    
    val storage = PlexNavDestination(
        id = "storage",
        label = "Storage",
        icon = Icons.Outlined.Storage,
        selectedIcon = Icons.Filled.Storage,
        route = "storage_browser",
        section = NavSection.DOWNLOADS
    )
    
    // Settings Section
    val collections = PlexNavDestination(
        id = "collections",
        label = "Collections",
        icon = Icons.Outlined.Collections,
        selectedIcon = Icons.Filled.Collections,
        route = "collections",
        section = NavSection.SETTINGS
    )
    
    val statistics = PlexNavDestination(
        id = "statistics",
        label = "Statistics",
        icon = Icons.Outlined.BarChart,
        selectedIcon = Icons.Filled.BarChart,
        route = "reading_statistics",
        section = NavSection.SETTINGS
    )
    
    val settings = PlexNavDestination(
        id = "settings",
        label = "Settings",
        icon = Icons.Outlined.Settings,
        selectedIcon = Icons.Filled.Settings,
        route = "settings",
        section = NavSection.SETTINGS
    )
    
    /**
     * All navigation destinations
     */
    val allDestinations = listOf(
        home,
        books, audiobooks, comics, movies, tvShows, music, podcasts, radio, documents,
        webFiction, opds, freeAudiobooks, hivefy, ambient,
        downloads, storage,
        collections, statistics, settings
    )
    
    /**
     * Primary destinations shown on bottom bar (mobile)
     */
    val primaryDestinations = listOf(home, books, music, podcasts, settings)
    
    /**
     * Get destinations grouped by section
     */
    fun getDestinationsBySection(): Map<NavSection, List<PlexNavDestination>> {
        return allDestinations.groupBy { it.section }
            .toSortedMap(compareBy { it.order })
    }
}

// =============================================================================
// SIDEBAR NAVIGATION
// =============================================================================

/**
 * Plex-style collapsible sidebar
 */
@Composable
fun PlexSidebar(
    currentRoute: String,
    onNavigate: (String) -> Unit,
    isExpanded: Boolean,
    onToggleExpanded: () -> Unit,
    userAvatarUrl: String? = null,
    userName: String = "User",
    modifier: Modifier = Modifier
) {
    val sidebarWidth by animateDpAsState(
        targetValue = if (isExpanded) PlexSizes.SidebarWidth else PlexSizes.SidebarCollapsedWidth,
        animationSpec = tween(durationMillis = PlexAnimations.Duration.Normal),
        label = "sidebar_width"
    )
    
    val destinationsBySection = remember { PlexNavDestinations.getDestinationsBySection() }
    
    Surface(
        modifier = modifier
            .width(sidebarWidth)
            .fillMaxHeight(),
        color = PlexColors.Background,
        tonalElevation = PlexElevation.SM
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(vertical = PlexSpacing.MD)
        ) {
            // Logo / Collapse Toggle
            SidebarHeader(
                isExpanded = isExpanded,
                onToggleExpanded = onToggleExpanded
            )
            
            Spacer(modifier = Modifier.height(PlexSpacing.LG))
            
            // User Profile
            SidebarUserProfile(
                avatarUrl = userAvatarUrl,
                userName = userName,
                isExpanded = isExpanded
            )
            
            Spacer(modifier = Modifier.height(PlexSpacing.LG))
            
            HorizontalDivider(
                color = PlexColors.Divider,
                modifier = Modifier.padding(horizontal = PlexSpacing.MD)
            )
            
            Spacer(modifier = Modifier.height(PlexSpacing.MD))
            
            // Navigation Items
            LazyColumn(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxWidth(),
                verticalArrangement = Arrangement.spacedBy(PlexSpacing.XXS)
            ) {
                destinationsBySection.forEach { (section, destinations) ->
                    // Section Header (only in expanded mode)
                    if (section != NavSection.HOME && isExpanded) {
                        item {
                            SidebarSectionHeader(
                                title = section.title,
                                modifier = Modifier.padding(
                                    start = PlexSpacing.LG,
                                    top = PlexSpacing.MD,
                                    bottom = PlexSpacing.SM
                                )
                            )
                        }
                    }
                    
                    // Destinations in this section
                    items(destinations) { destination ->
                        SidebarNavItem(
                            destination = destination,
                            isSelected = currentRoute.startsWith(destination.route.split("/").first()),
                            isExpanded = isExpanded,
                            onClick = { onNavigate(destination.route) }
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.MD))
            
            // Quick Actions at bottom
            SidebarQuickActions(
                isExpanded = isExpanded,
                onSearch = { /* Navigate to search */ },
                onNotifications = { /* Show notifications */ }
            )
        }
    }
}

@Composable
private fun SidebarHeader(
    isExpanded: Boolean,
    onToggleExpanded: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = PlexSpacing.MD),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = if (isExpanded) Arrangement.SpaceBetween else Arrangement.Center
    ) {
        if (isExpanded) {
            // App Logo/Name
            Text(
                text = "CleverFerret",
                style = PlexTypography.TitleSmall,
                color = PlexColors.AccentPrimary,
                fontWeight = FontWeight.Bold
            )
        }
        
        // Collapse/Expand button
        IconButton(
            onClick = onToggleExpanded,
            modifier = Modifier.size(PlexSizes.IconLG)
        ) {
            Icon(
                imageVector = if (isExpanded) Icons.Default.ChevronLeft else Icons.Default.Menu,
                contentDescription = if (isExpanded) "Collapse sidebar" else "Expand sidebar",
                tint = PlexColors.TextSecondary
            )
        }
    }
}

@Composable
private fun SidebarUserProfile(
    avatarUrl: String?,
    userName: String,
    isExpanded: Boolean
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = PlexSpacing.MD),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = if (isExpanded) Arrangement.Start else Arrangement.Center
    ) {
        // Avatar
        Box(
            modifier = Modifier
                .size(if (isExpanded) 40.dp else 32.dp)
                .clip(CircleShape)
                .background(PlexColors.BackgroundSurface),
            contentAlignment = Alignment.Center
        ) {
            if (avatarUrl != null) {
                AsyncImage(
                    model = avatarUrl,
                    contentDescription = "User avatar",
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
                )
            } else {
                Icon(
                    imageVector = Icons.Default.Person,
                    contentDescription = null,
                    tint = PlexColors.TextSecondary,
                    modifier = Modifier.size(20.dp)
                )
            }
        }
        
        AnimatedVisibility(
            visible = isExpanded,
            enter = fadeIn() + expandHorizontally(),
            exit = fadeOut() + shrinkHorizontally()
        ) {
            Column(
                modifier = Modifier.padding(start = PlexSpacing.SM)
            ) {
                Text(
                    text = userName,
                    style = PlexTypography.LabelLarge,
                    color = PlexColors.TextPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    text = "Local Library",
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.TextTertiary
                )
            }
        }
    }
}

@Composable
private fun SidebarSectionHeader(
    title: String,
    modifier: Modifier = Modifier
) {
    Text(
        text = title.uppercase(),
        style = PlexTypography.LabelSmall,
        color = PlexColors.TextTertiary,
        fontWeight = FontWeight.SemiBold,
        letterSpacing = PlexTypography.LabelSmall.letterSpacing * 1.5f,
        modifier = modifier
    )
}

@Composable
private fun SidebarNavItem(
    destination: PlexNavDestination,
    isSelected: Boolean,
    isExpanded: Boolean,
    onClick: () -> Unit
) {
    val interactionSource = remember { MutableInteractionSource() }
    val isHovered by interactionSource.collectIsHoveredAsState()
    
    val backgroundColor by animateColorAsState(
        targetValue = when {
            isSelected -> PlexColors.AccentPrimary.copy(alpha = 0.15f)
            isHovered -> PlexColors.BackgroundHover
            else -> Color.Transparent
        },
        animationSpec = tween(durationMillis = PlexAnimations.Duration.Fast),
        label = "nav_item_bg"
    )
    
    val iconColor by animateColorAsState(
        targetValue = when {
            isSelected -> PlexColors.AccentPrimary
            else -> destination.mediaTypeColor ?: PlexColors.TextSecondary
        },
        label = "nav_item_icon"
    )
    
    val textColor by animateColorAsState(
        targetValue = if (isSelected) PlexColors.TextPrimary else PlexColors.TextSecondary,
        label = "nav_item_text"
    )
    
    val contentPadding = if (isExpanded) {
        PaddingValues(horizontal = PlexSpacing.MD, vertical = PlexSpacing.SM)
    } else {
        PaddingValues(PlexSpacing.SM)
    }
    
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = PlexSpacing.SM)
            .clickable(
                interactionSource = interactionSource,
                indication = null,
                onClick = onClick,
                enabled = destination.enabled
            ),
        shape = RoundedCornerShape(PlexCorners.SM),
        color = backgroundColor
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(contentPadding),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = if (isExpanded) Arrangement.Start else Arrangement.Center
        ) {
            // Selection indicator
            if (isSelected && isExpanded) {
                Box(
                    modifier = Modifier
                        .width(3.dp)
                        .height(24.dp)
                        .background(
                            PlexColors.AccentPrimary,
                            RoundedCornerShape(PlexCorners.Full)
                        )
                )
                Spacer(modifier = Modifier.width(PlexSpacing.SM))
            }
            
            // Icon
            Icon(
                imageVector = if (isSelected) destination.selectedIcon else destination.icon,
                contentDescription = destination.label,
                tint = iconColor,
                modifier = Modifier.size(PlexSizes.IconMD)
            )
            
            // Label (only in expanded mode)
            AnimatedVisibility(
                visible = isExpanded,
                enter = fadeIn() + expandHorizontally(),
                exit = fadeOut() + shrinkHorizontally()
            ) {
                Row(
                    modifier = Modifier.padding(start = PlexSpacing.SM),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = destination.label,
                        style = PlexTypography.BodyMedium,
                        color = textColor,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                        modifier = Modifier.weight(1f, fill = false)
                    )
                    
                    // Badge
                    destination.badge?.let { badge ->
                        Spacer(modifier = Modifier.width(PlexSpacing.SM))
                        NavItemBadge(badge = badge)
                    }
                }
            }
        }
    }
}

@Composable
private fun NavItemBadge(badge: NavBadge) {
    Surface(
        shape = RoundedCornerShape(PlexCorners.Full),
        color = badge.color.copy(alpha = 0.2f)
    ) {
        Text(
            text = badge.text ?: badge.count.toString(),
            style = PlexTypography.Badge,
            color = badge.color,
            modifier = Modifier.padding(horizontal = PlexSpacing.SM, vertical = PlexSpacing.XXS)
        )
    }
}

@Composable
private fun SidebarQuickActions(
    isExpanded: Boolean,
    onSearch: () -> Unit,
    onNotifications: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = PlexSpacing.MD),
        horizontalArrangement = if (isExpanded) Arrangement.SpaceEvenly else Arrangement.Center
    ) {
        QuickActionButton(
            icon = Icons.Default.Search,
            label = "Search",
            showLabel = isExpanded,
            onClick = onSearch
        )
        
        if (isExpanded) {
            QuickActionButton(
                icon = Icons.Default.Notifications,
                label = "Notifications",
                showLabel = isExpanded,
                onClick = onNotifications
            )
        }
    }
}

@Composable
private fun QuickActionButton(
    icon: ImageVector,
    label: String,
    showLabel: Boolean,
    onClick: () -> Unit
) {
    IconButton(
        onClick = onClick,
        modifier = Modifier.size(40.dp)
    ) {
        Icon(
            imageVector = icon,
            contentDescription = label,
            tint = PlexColors.TextSecondary
        )
    }
}

// =============================================================================
// BOTTOM NAVIGATION (Mobile)
// =============================================================================

/**
 * Plex-style bottom navigation for mobile
 */
@Composable
fun PlexBottomNavigation(
    currentRoute: String,
    onNavigate: (String) -> Unit,
    destinations: List<PlexNavDestination> = PlexNavDestinations.primaryDestinations,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier.fillMaxWidth(),
        color = PlexColors.BackgroundElevated,
        tonalElevation = PlexElevation.MD,
        shadowElevation = PlexElevation.LG
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .height(PlexSizes.BottomBarHeight)
                .padding(horizontal = PlexSpacing.SM),
            horizontalArrangement = Arrangement.SpaceEvenly,
            verticalAlignment = Alignment.CenterVertically
        ) {
            destinations.forEach { destination ->
                BottomNavItem(
                    destination = destination,
                    isSelected = currentRoute.startsWith(destination.route.split("/").first()),
                    onClick = { onNavigate(destination.route) }
                )
            }
        }
    }
}

@Composable
private fun BottomNavItem(
    destination: PlexNavDestination,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    val iconColor by animateColorAsState(
        targetValue = if (isSelected) PlexColors.AccentPrimary else PlexColors.TextSecondary,
        label = "bottom_nav_icon"
    )
    
    val textColor by animateColorAsState(
        targetValue = if (isSelected) PlexColors.AccentPrimary else PlexColors.TextTertiary,
        label = "bottom_nav_text"
    )
    
    Column(
        modifier = Modifier
            .clickable(onClick = onClick)
            .padding(PlexSpacing.SM),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        // Selection indicator dot
        Box(
            modifier = Modifier
                .size(4.dp)
                .clip(CircleShape)
                .background(if (isSelected) PlexColors.AccentPrimary else Color.Transparent)
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.XS))
        
        Icon(
            imageVector = if (isSelected) destination.selectedIcon else destination.icon,
            contentDescription = destination.label,
            tint = iconColor,
            modifier = Modifier.size(PlexSizes.IconMD)
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.XS))
        
        Text(
            text = destination.label,
            style = PlexTypography.LabelSmall,
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
fun PlexNavigationScaffold(
    currentRoute: String,
    onNavigate: (String) -> Unit,
    userAvatarUrl: String? = null,
    userName: String = "User",
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
            containerColor = PlexColors.Background,
            bottomBar = {
                PlexBottomNavigation(
                    currentRoute = currentRoute,
                    onNavigate = onNavigate
                )
            },
            content = content
        )
    } else {
        // Tablet/Desktop: Sidebar navigation
        Row(modifier = modifier.fillMaxSize()) {
            PlexSidebar(
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
                    .background(PlexColors.Background)
            ) {
                content(PaddingValues())
            }
        }
    }
}
