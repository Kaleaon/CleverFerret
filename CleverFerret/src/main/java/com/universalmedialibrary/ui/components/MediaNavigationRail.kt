package com.universalmedialibrary.ui.components

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.models.MediaCategory
import com.universalmedialibrary.ui.models.SidebarPosition

/**
 * Media Navigation Rail Component
 * 
 * Vertical navigation rail for media categories with configurable
 * sidebar positioning (left or right).
 */

/**
 * Main Media Navigation Rail
 */
@Composable
fun MediaNavigationRail(
    selectedCategory: MediaCategory,
    onCategorySelected: (MediaCategory) -> Unit,
    onSettingsClick: () -> Unit,
    position: SidebarPosition = SidebarPosition.LEFT,
    modifier: Modifier = Modifier
) {
    NavigationRail(
        modifier = modifier.fillMaxHeight(),
        containerColor = MaterialTheme.colorScheme.surface,
        contentColor = MaterialTheme.colorScheme.onSurface,
        header = {
            // Header with app icon or logo (optional)
            Spacer(modifier = Modifier.height(16.dp))
        }
    ) {
        Spacer(modifier = Modifier.height(8.dp))
        
        // Media category items
        MediaCategory.values().forEach { category ->
            NavigationRailItem(
                icon = {
                    Icon(
                        imageVector = category.icon,
                        contentDescription = category.label
                    )
                },
                label = {
                    Text(
                        text = category.label,
                        style = MaterialTheme.typography.labelSmall
                    )
                },
                selected = selectedCategory == category,
                onClick = { onCategorySelected(category) },
                colors = NavigationRailItemDefaults.colors(
                    selectedIconColor = MaterialTheme.colorScheme.onPrimary,
                    selectedTextColor = MaterialTheme.colorScheme.primary,
                    indicatorColor = MaterialTheme.colorScheme.primary,
                    unselectedIconColor = MaterialTheme.colorScheme.onSurfaceVariant,
                    unselectedTextColor = MaterialTheme.colorScheme.onSurfaceVariant
                )
            )
        }
        
        Spacer(modifier = Modifier.weight(1f))
        
        // Settings button at bottom
        NavigationRailItem(
            icon = {
                Icon(
                    imageVector = Icons.Default.Settings,
                    contentDescription = "Settings"
                )
            },
            label = {
                Text(
                    text = "Settings",
                    style = MaterialTheme.typography.labelSmall
                )
            },
            selected = false,
            onClick = onSettingsClick,
            colors = NavigationRailItemDefaults.colors(
                selectedIconColor = MaterialTheme.colorScheme.onPrimary,
                selectedTextColor = MaterialTheme.colorScheme.primary,
                indicatorColor = MaterialTheme.colorScheme.primary,
                unselectedIconColor = MaterialTheme.colorScheme.onSurfaceVariant,
                unselectedTextColor = MaterialTheme.colorScheme.onSurfaceVariant
            )
        )
        
        Spacer(modifier = Modifier.height(16.dp))
    }
}

/**
 * Compact Media Navigation Rail (icons only, no labels)
 */
@Composable
fun CompactMediaNavigationRail(
    selectedCategory: MediaCategory,
    onCategorySelected: (MediaCategory) -> Unit,
    onSettingsClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    NavigationRail(
        modifier = modifier.fillMaxHeight(),
        containerColor = MaterialTheme.colorScheme.surface,
        contentColor = MaterialTheme.colorScheme.onSurface
    ) {
        Spacer(modifier = Modifier.height(16.dp))
        
        // Media category items (icons only)
        MediaCategory.values().forEach { category ->
            NavigationRailItem(
                icon = {
                    Icon(
                        imageVector = category.icon,
                        contentDescription = category.label
                    )
                },
                selected = selectedCategory == category,
                onClick = { onCategorySelected(category) },
                colors = NavigationRailItemDefaults.colors(
                    selectedIconColor = MaterialTheme.colorScheme.onPrimary,
                    indicatorColor = MaterialTheme.colorScheme.primary,
                    unselectedIconColor = MaterialTheme.colorScheme.onSurfaceVariant
                )
            )
        }
        
        Spacer(modifier = Modifier.weight(1f))
        
        // Settings button at bottom
        NavigationRailItem(
            icon = {
                Icon(
                    imageVector = Icons.Default.Settings,
                    contentDescription = "Settings"
                )
            },
            selected = false,
            onClick = onSettingsClick,
            colors = NavigationRailItemDefaults.colors(
                selectedIconColor = MaterialTheme.colorScheme.onPrimary,
                indicatorColor = MaterialTheme.colorScheme.primary,
                unselectedIconColor = MaterialTheme.colorScheme.onSurfaceVariant
            )
        )
        
        Spacer(modifier = Modifier.height(16.dp))
    }
}
