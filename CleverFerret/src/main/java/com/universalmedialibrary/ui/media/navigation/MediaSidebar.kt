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
                            isSelected = isDestinationSelected(currentRoute = currentRoute, destinationRoute = destination.route),
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
internal fun SidebarHeader(
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
internal fun SidebarUserProfile(
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
                .size(if (isExpanded) MediaSizes.IconAvatarExpanded else MediaSizes.IconAvatarCollapsed)
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
                    contentDescription = "Media image",
                    tint = MediaColors.TextSecondary,
                    modifier = Modifier.size(MediaSizes.IconSM)
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
internal fun SidebarSectionHeader(
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
internal fun SidebarNavItem(
    destination: MediaNavDestination,
    isSelected: Boolean,
    isExpanded: Boolean,
    onClick: () -> Unit
) {
    val interactionSource = remember { MutableInteractionSource() }
    val isHovered by interactionSource.collectIsHoveredAsState()
    val isEnabled = destination.enabled
    
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
            !isEnabled -> MediaColors.TextTertiary
            isSelected -> MediaColors.AccentPrimary
            else -> MediaColors.TextSecondary
        },
        label = "nav_item_icon"
    )
    
    val textColor by animateColorAsState(
        targetValue = when {
            !isEnabled -> MediaColors.TextTertiary
            isSelected -> MediaColors.TextPrimary
            else -> MediaColors.TextSecondary
        },
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
                enabled = isEnabled
            ),
        shape = RoundedCornerShape(MediaCorners.SM),
        color = backgroundColor
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .alpha(if (isEnabled) 1f else 0.55f)
                .padding(contentPadding),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = if (isExpanded) Arrangement.Start else Arrangement.Center
        ) {
            // Selection indicator
            if (isSelected && isExpanded) {
                Box(
                    modifier = Modifier
                        .width(MediaSizes.SidebarSelectionIndicatorWidth)
                        .height(MediaSizes.SidebarSelectionIndicatorHeight)
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
                    
                    if (!isEnabled) {
                        Spacer(modifier = Modifier.width(MediaSpacing.SM))
                        Text(
                            text = "Soon",
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                    }

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
internal fun NavItemBadge(badge: NavBadge) {
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
internal fun SidebarQuickActions(
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
internal fun QuickActionButton(
    icon: ImageVector,
    label: String,
    showLabel: Boolean,
    onClick: () -> Unit
) {
    IconButton(
        onClick = onClick,
        modifier = Modifier.size(MediaSizes.IconAvatarExpanded)
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

