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
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric Navigation System
 * 
 * A beautiful, collapsible sidebar navigation inspired by premium media apps's design.
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
data class MediaNavDestination(
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
    val color: Color = MediaColors.AccentPrimary
)

/**
 * Default navigation destinations for CleverFerret
 */
object MediaNavDestinations {
    
    val home = MediaNavDestination(
        id = "home",
        label = "Home",
        icon = Icons.Outlined.Home,
        selectedIcon = Icons.Filled.Home,
        route = MediaRoutes.HOME,
        section = NavSection.HOME
    )

    val search = MediaNavDestination(
        id = "search",
        label = "Search",
        icon = Icons.Outlined.Search,
        selectedIcon = Icons.Filled.Search,
        route = MediaRoutes.SEARCH,
        section = NavSection.HOME
    )

    val discover = MediaNavDestination(
        id = "discover",
        label = "Discover",
        icon = Icons.Outlined.Explore,
        selectedIcon = Icons.Filled.Explore,
        route = MediaRoutes.DISCOVER,
        section = NavSection.DISCOVER
    )
    
    // Library Section
    val books = MediaNavDestination(
        id = "books",
        label = "Books",
        icon = Icons.Outlined.MenuBook,
        selectedIcon = Icons.Filled.MenuBook,
        route = MediaRoutes.BOOKS,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Book
    )
    
    val audiobooks = MediaNavDestination(
        id = "audiobooks",
        label = "Audiobooks",
        icon = Icons.Outlined.Headphones,
        selectedIcon = Icons.Filled.Headphones,
        route = MediaRoutes.AUDIOBOOKS,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Audiobook
    )
    
    val comics = MediaNavDestination(
        id = "comics",
        label = "Comics",
        icon = Icons.Outlined.AutoStories,
        selectedIcon = Icons.Filled.AutoStories,
        route = MediaRoutes.COMICS,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Comic
    )
    
    val movies = MediaNavDestination(
        id = "movies",
        label = "Movies",
        icon = Icons.Outlined.Movie,
        selectedIcon = Icons.Filled.Movie,
        route = MediaRoutes.MOVIES,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Movie
    )
    
    val tvShows = MediaNavDestination(
        id = "tv_shows",
        label = "TV Shows",
        icon = Icons.Outlined.Tv,
        selectedIcon = Icons.Filled.Tv,
        route = MediaRoutes.TV_SHOWS,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.TvShow
    )
    
    val music = MediaNavDestination(
        id = "music",
        label = "Music",
        icon = Icons.Outlined.MusicNote,
        selectedIcon = Icons.Filled.MusicNote,
        route = MediaRoutes.MUSIC,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Music
    )
    
    val podcasts = MediaNavDestination(
        id = "podcasts",
        label = "Podcasts",
        icon = Icons.Outlined.Podcasts,
        selectedIcon = Icons.Filled.Podcasts,
        route = MediaRoutes.PODCASTS,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Podcast
    )
    
    val radio = MediaNavDestination(
        id = "radio",
        label = "Radio",
        icon = Icons.Outlined.Radio,
        selectedIcon = Icons.Filled.Radio,
        route = MediaRoutes.RADIO,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Radio
    )
    
    val documents = MediaNavDestination(
        id = "documents",
        label = "Documents",
        icon = Icons.Outlined.Description,
        selectedIcon = Icons.Filled.Description,
        route = MediaRoutes.DOCUMENTS,
        section = NavSection.LIBRARY,
        mediaTypeColor = MediaColors.MediaTypes.Document
    )
    
    // Discover Section
    val webFiction = MediaNavDestination(
        id = "web_fiction",
        label = "Web Fiction",
        icon = Icons.Outlined.Language,
        selectedIcon = Icons.Filled.Language,
        route = MediaRoutes.WEB_FICTION,
        section = NavSection.DISCOVER,
        mediaTypeColor = MediaColors.MediaTypes.Fanfiction
    )
    
    val opds = MediaNavDestination(
        id = "opds",
        label = "OPDS Catalogs",
        icon = Icons.Outlined.CloudDownload,
        selectedIcon = Icons.Filled.CloudDownload,
        route = MediaRoutes.OPDS_BROWSER,
        section = NavSection.DISCOVER
    )
    
    val freeAudiobooks = MediaNavDestination(
        id = "free_audiobooks",
        label = "Free Audiobooks",
        icon = Icons.Outlined.HeadsetMic,
        selectedIcon = Icons.Filled.HeadsetMic,
        route = MediaRoutes.DISCOVER,
        section = NavSection.DISCOVER,
        enabled = false
    )
    
    val hivefy = MediaNavDestination(
        id = "hivefy",
        label = "Hivefy Music",
        icon = Icons.Outlined.GraphicEq,
        selectedIcon = Icons.Filled.GraphicEq,
        route = MediaRoutes.DISCOVER,
        section = NavSection.DISCOVER,
        mediaTypeColor = MediaColors.MediaTypes.Music,
        enabled = false
    )
    
    val ambient = MediaNavDestination(
        id = "ambient",
        label = "Ambient Sounds",
        icon = Icons.Outlined.Spa,
        selectedIcon = Icons.Filled.Spa,
        route = MediaRoutes.AMBIENT_SOUNDS,
        section = NavSection.DISCOVER
    )

    val visualizer = MediaNavDestination(
        id = "visualizer",
        label = "Visualizer",
        icon = Icons.Outlined.Equalizer,
        selectedIcon = Icons.Filled.Equalizer,
        route = MediaRoutes.VISUALIZER,
        section = NavSection.DISCOVER
    )
    
    // Downloads Section
    val downloads = MediaNavDestination(
        id = "downloads",
        label = "Downloads",
        icon = Icons.Outlined.Download,
        selectedIcon = Icons.Filled.Download,
        route = MediaRoutes.DISCOVER,
        section = NavSection.DOWNLOADS,
        enabled = false
    )
    
    val storage = MediaNavDestination(
        id = "storage",
        label = "Storage",
        icon = Icons.Outlined.Storage,
        selectedIcon = Icons.Filled.Storage,
        route = MediaRoutes.FILE_BROWSER,
        section = NavSection.DOWNLOADS
    )

    val sync = MediaNavDestination(
        id = "sync",
        label = "Sync",
        icon = Icons.Outlined.Sync,
        selectedIcon = Icons.Filled.Sync,
        route = MediaRoutes.SYNC,
        section = NavSection.DOWNLOADS
    )

    val importExport = MediaNavDestination(
        id = "import_export",
        label = "Import/Export",
        icon = Icons.Outlined.ImportExport,
        selectedIcon = Icons.Filled.ImportExport,
        route = MediaRoutes.IMPORT_EXPORT,
        section = NavSection.DOWNLOADS
    )
    
    // Settings Section
    val collections = MediaNavDestination(
        id = "collections",
        label = "Collections",
        icon = Icons.Outlined.Collections,
        selectedIcon = Icons.Filled.Collections,
        route = MediaRoutes.COLLECTIONS,
        section = NavSection.SETTINGS
    )
    
    val statistics = MediaNavDestination(
        id = "statistics",
        label = "Statistics",
        icon = Icons.Outlined.BarChart,
        selectedIcon = Icons.Filled.BarChart,
        route = MediaRoutes.DISCOVER,
        section = NavSection.SETTINGS,
        enabled = false
    )
    
    val settings = MediaNavDestination(
        id = "settings",
        label = "Settings",
        icon = Icons.Outlined.Settings,
        selectedIcon = Icons.Filled.Settings,
        route = MediaRoutes.SETTINGS,
        section = NavSection.SETTINGS
    )
    
    /**
     * All navigation destinations
     */
    val allDestinations = listOf(
        home,
        search,
        books, audiobooks, comics, movies, tvShows, music, podcasts, radio, documents,
        discover, webFiction, opds, freeAudiobooks, hivefy, ambient, visualizer,
        downloads, storage, sync, importExport,
        collections, statistics, settings
    )
    
    /**
     * Primary destinations shown on bottom bar (mobile)
     */
    // On phones the bar is horizontally scrollable, so we can expose all major segments.
    val primaryDestinations = listOf(
        home,
        discover,
        search,
        books,
        music,
        podcasts,
        radio,
        audiobooks,
        comics,
        movies,
        tvShows,
        webFiction,
        opds,
        ambient,
        visualizer,
        collections,
        sync,
        importExport,
        settings
    )
    
    /**
     * Get destinations grouped by section
     */
    fun getDestinationsBySection(): Map<NavSection, List<MediaNavDestination>> {
        return allDestinations.groupBy { it.section }
            .toSortedMap(compareBy { it.order })
    }
}

// =============================================================================
// SIDEBAR NAVIGATION
// =============================================================================

/**
 * Clean media-centric collapsible sidebar
 */
@Composable
fun MediaSidebar(
    currentRoute: String,
    onNavigate: (String) -> Unit,
    isExpanded: Boolean,
    onToggleExpanded: () -> Unit,
    userAvatarUrl: String? = null,
    userName: String = "User",
    modifier: Modifier = Modifier
) {
    val sidebarWidth by animateDpAsState(
        targetValue = if (isExpanded) MediaSizes.SidebarWidth else MediaSizes.SidebarCollapsedWidth,
        animationSpec = tween(durationMillis = MediaAnimations.Duration.Normal),
        label = "sidebar_width"
    )
    
    val destinationsBySection = remember { MediaNavDestinations.getDestinationsBySection() }
    
    Surface(
        modifier = modifier
            .width(sidebarWidth)
            .fillMaxHeight(),
        color = MediaColors.Background,
        tonalElevation = MediaElevation.SM
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(vertical = MediaSpacing.MD)
        ) {
            // Logo / Collapse Toggle
            SidebarHeader(
                isExpanded = isExpanded,
                onToggleExpanded = onToggleExpanded
            )
            
            Spacer(modifier = Modifier.height(MediaSpacing.LG))
            
            // User Profile
            SidebarUserProfile(
                avatarUrl = userAvatarUrl,
                userName = userName,
                isExpanded = isExpanded
            )
            
            Spacer(modifier = Modifier.height(MediaSpacing.LG))
            
            HorizontalDivider(
                color = MediaColors.Divider,
                modifier = Modifier.padding(horizontal = MediaSpacing.MD)
            )
            
            Spacer(modifier = Modifier.height(MediaSpacing.MD))
            
            // Navigation Items
            LazyColumn(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxWidth(),
                verticalArrangement = Arrangement.spacedBy(MediaSpacing.XXS)
            ) {
                destinationsBySection.forEach { (section, destinations) ->
                    // Section Header (only in expanded mode)
                    if (section != NavSection.HOME && isExpanded) {
                        item {
                            SidebarSectionHeader(
                                title = section.title,
                                modifier = Modifier.padding(
                                    start = MediaSpacing.LG,
                                    top = MediaSpacing.MD,
                                    bottom = MediaSpacing.SM
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
            
            Spacer(modifier = Modifier.height(MediaSpacing.MD))
            
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
            .padding(horizontal = MediaSpacing.MD),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = if (isExpanded) Arrangement.SpaceBetween else Arrangement.Center
    ) {
        if (isExpanded) {
            // App Logo/Name
            Text(
                text = "CleverFerret",
                style = MediaTypography.TitleSmall,
                color = MediaColors.AccentPrimary,
                fontWeight = FontWeight.Bold
            )
        }
        
        // Collapse/Expand button
        IconButton(
            onClick = onToggleExpanded,
            modifier = Modifier.size(MediaSizes.IconLG)
        ) {
            Icon(
                imageVector = if (isExpanded) Icons.Default.ChevronLeft else Icons.Default.Menu,
                contentDescription = if (isExpanded) "Collapse sidebar" else "Expand sidebar",
                tint = MediaColors.TextSecondary
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
            .padding(horizontal = MediaSpacing.MD),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = if (isExpanded) Arrangement.Start else Arrangement.Center
    ) {
        // Avatar
        Box(
            modifier = Modifier
                .size(if (isExpanded) 40.dp else 32.dp)
                .clip(CircleShape)
                .background(MediaColors.BackgroundSurface),
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
                    tint = MediaColors.TextSecondary,
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
                modifier = Modifier.padding(start = MediaSpacing.SM)
            ) {
                Text(
                    text = userName,
                    style = MediaTypography.LabelLarge,
                    color = MediaColors.TextPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    text = "Local Library",
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextTertiary
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
        style = MediaTypography.LabelSmall,
        color = MediaColors.TextTertiary,
        fontWeight = FontWeight.SemiBold,
        letterSpacing = MediaTypography.LabelSmall.letterSpacing * 1.5f,
        modifier = modifier
    )
}

@Composable
private fun SidebarNavItem(
    destination: MediaNavDestination,
    isSelected: Boolean,
    isExpanded: Boolean,
    onClick: () -> Unit
) {
    val interactionSource = remember { MutableInteractionSource() }
    val isHovered by interactionSource.collectIsHoveredAsState()
    
    val backgroundColor by animateColorAsState(
        targetValue = when {
            isSelected -> MediaColors.AccentPrimary.copy(alpha = 0.15f)
            isHovered -> MediaColors.BackgroundHover
            else -> Color.Transparent
        },
        animationSpec = tween(durationMillis = MediaAnimations.Duration.Fast),
        label = "nav_item_bg"
    )
    
    val iconColor by animateColorAsState(
        targetValue = when {
            isSelected -> MediaColors.AccentPrimary
            else -> destination.mediaTypeColor ?: MediaColors.TextSecondary
        },
        label = "nav_item_icon"
    )
    
    val textColor by animateColorAsState(
        targetValue = if (isSelected) MediaColors.TextPrimary else MediaColors.TextSecondary,
        label = "nav_item_text"
    )
    
    val contentPadding = if (isExpanded) {
        PaddingValues(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM)
    } else {
        PaddingValues(MediaSpacing.SM)
    }
    
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.SM)
            .clickable(
                interactionSource = interactionSource,
                indication = null,
                onClick = onClick,
                enabled = destination.enabled
            ),
        shape = RoundedCornerShape(MediaCorners.SM),
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
                            MediaColors.AccentPrimary,
                            RoundedCornerShape(MediaCorners.Full)
                        )
                )
                Spacer(modifier = Modifier.width(MediaSpacing.SM))
            }
            
            // Icon
            Icon(
                imageVector = if (isSelected) destination.selectedIcon else destination.icon,
                contentDescription = destination.label,
                tint = iconColor,
                modifier = Modifier.size(MediaSizes.IconMD)
            )
            
            // Label (only in expanded mode)
            AnimatedVisibility(
                visible = isExpanded,
                enter = fadeIn() + expandHorizontally(),
                exit = fadeOut() + shrinkHorizontally()
            ) {
                Row(
                    modifier = Modifier.padding(start = MediaSpacing.SM),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = destination.label,
                        style = MediaTypography.BodyMedium,
                        color = textColor,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                        modifier = Modifier.weight(1f, fill = false)
                    )
                    
                    // Badge
                    destination.badge?.let { badge ->
                        Spacer(modifier = Modifier.width(MediaSpacing.SM))
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
        shape = RoundedCornerShape(MediaCorners.Full),
        color = badge.color.copy(alpha = 0.2f)
    ) {
        Text(
            text = badge.text ?: badge.count.toString(),
            style = MediaTypography.Badge,
            color = badge.color,
            modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.XXS)
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
            .padding(horizontal = MediaSpacing.MD),
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
            tint = MediaColors.TextSecondary
        )
    }
}

// =============================================================================
// BOTTOM NAVIGATION (Mobile)
// =============================================================================

/**
 * Clean media-centric bottom navigation for mobile
 */
@Composable
fun MediaBottomNavigation(
    currentRoute: String,
    onNavigate: (String) -> Unit,
    destinations: List<MediaNavDestination> = MediaNavDestinations.primaryDestinations,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier.fillMaxWidth(),
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.MD,
        shadowElevation = MediaElevation.LG
    ) {
        val scrollState = rememberScrollState()
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .height(MediaSizes.BottomBarHeight)
                .horizontalScroll(scrollState)
                .padding(horizontal = MediaSpacing.SM),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM),
            verticalAlignment = Alignment.CenterVertically
        ) {
            destinations.forEach { destination ->
                BottomNavItem(
                    destination = destination,
                    isSelected = currentRoute.startsWith(destination.route.split("/").first()),
                    onClick = { if (destination.enabled) onNavigate(destination.route) }
                )
            }
        }
    }
}

@Composable
private fun BottomNavItem(
    destination: MediaNavDestination,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    val iconColor by animateColorAsState(
        targetValue = if (isSelected) MediaColors.AccentPrimary else MediaColors.TextSecondary,
        label = "bottom_nav_icon"
    )
    
    val textColor by animateColorAsState(
        targetValue = if (isSelected) MediaColors.AccentPrimary else MediaColors.TextTertiary,
        label = "bottom_nav_text"
    )
    
    Column(
        modifier = Modifier
            .clickable(onClick = onClick)
            .padding(MediaSpacing.SM),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        // Selection indicator dot
        Box(
            modifier = Modifier
                .size(4.dp)
                .clip(CircleShape)
                .background(if (isSelected) MediaColors.AccentPrimary else Color.Transparent)
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.XS))
        
        Icon(
            imageVector = if (isSelected) destination.selectedIcon else destination.icon,
            contentDescription = destination.label,
            tint = iconColor,
            modifier = Modifier.size(MediaSizes.IconMD)
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.XS))
        
        Text(
            text = destination.label,
            style = MediaTypography.LabelSmall,
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
                    onNavigate = onNavigate
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
