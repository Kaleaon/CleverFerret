package com.universalmedialibrary.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.components.*
import com.universalmedialibrary.ui.media.components.CanonicalMediaCard
import com.universalmedialibrary.ui.theme.*
import com.universalmedialibrary.ui.modern.components.CFLayoutSelection
import com.universalmedialibrary.ui.media.theme.MediaSpacing
import com.universalmedialibrary.ui.modern.components.CFLayoutPicker

/**
 * Theme Showcase Screen
 * 
 * Displays all 15 themes with live previews of components
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ThemeShowcaseScreen(
    currentTheme: CleverFerretTheme,
    onThemeSelected: (CleverFerretTheme) -> Unit,
    onNavigateBack: () -> Unit,
    modifier: Modifier = Modifier,
    layoutSelection: CFLayoutSelection? = null
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Theme Gallery") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    Text(
                        text = "${CleverFerretTheme.entries.size} Themes",
                        style = MaterialTheme.typography.labelLarge,
                        modifier = Modifier.padding(end = MediaSpacing.LG)
                    )
                }
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(MediaSpacing.LG),
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.XL)
        ) {
            layoutSelection?.let { selection -> item { CFLayoutPicker(selection.current, selection.onSelect) } }
            // Theme selector
            item { CurrentThemeDetails(currentTheme, onThemeSelected) }
            
            // Component previews (only for Ancient Architect themes)
            if (currentTheme.isAncientArchitect()) {
                item { ThemePreviewHeading() }
                
                // Button previews
                item { ThemeButtonPreview() }
                
                // Card previews
                item { ThemeCardPreview() }
                
                // Notification previews
                item { ThemeNotificationPreview() }
                
                // Navigation rail preview
                item { ThemeRailPreview() }
            }
            
            // Theme gallery
            item { ThemeGalleryHeading() }
            
            item { ThemeGallerySelector(currentTheme, onThemeSelected) }
        }
    }
}

@Composable
private fun PreviewSection(
    title: String,
    modifier: Modifier = Modifier,
    content: @Composable () -> Unit
) {
    Card(
        modifier = modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier.padding(MediaSpacing.LG),
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            Text(
                text = title,
                style = MaterialTheme.typography.titleMedium
            )
            content()
        }
    }
}

@Composable
private fun InfoRow(
    label: String,
    value: String,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(
            text = label,
            style = MaterialTheme.typography.labelMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Text(
            text = value,
            style = MaterialTheme.typography.bodyMedium
        )
    }
}

@Composable
private fun CurrentThemeDetails(currentTheme: CleverFerretTheme, onThemeSelected: (CleverFerretTheme) -> Unit) {
    Card {
        Column(
            modifier = Modifier.padding(MediaSpacing.LG),
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.LG)
        ) {
            Text(
                text = "Current Theme",
                style = MaterialTheme.typography.titleLarge
            )

            CompactThemeSelector(
                currentTheme = currentTheme,
                onThemeSelected = onThemeSelected
            )

            val config = currentTheme.getConfig()

            // Theme info
            Column(
                verticalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
            ) {
                InfoRow("Category", config.category.name.replace('_', ' '))
                InfoRow("Description", config.description)

                if (currentTheme.isAncientArchitect()) {
                    HorizontalDivider(modifier = Modifier.padding(vertical = MediaSpacing.SM))
                    Text(
                        text = "Special Features",
                        style = MaterialTheme.typography.titleSmall
                    )
                    if (config.hasGeometricPatterns) {
                        InfoRow("✓", "Geometric Patterns")
                    }
                    if (config.hasMetallicShimmer) {
                        InfoRow("✓", "Metallic Shimmer")
                    }
                    if (config.hasCrystalGlow) {
                        InfoRow("✓", "Crystal Glow Effects")
                    }
                }
            }
        }
    }
}

@Composable
private fun ThemePreviewHeading() {
    Text(
        text = "Component Previews",
        style = MaterialTheme.typography.headlineSmall,
        modifier = Modifier.padding(top = MediaSpacing.SM)
    )
}

@Composable
private fun ThemeButtonPreview() {
    PreviewSection(title = "Buttons") {
        Column(
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            AncientArchitectPrimaryButton(
                onClick = {},
                modifier = Modifier.fillMaxWidth()
            ) {
                Text("Primary Button")
            }

            AncientArchitectSecondaryButton(
                onClick = {},
                modifier = Modifier.fillMaxWidth()
            ) {
                Text("Secondary Button")
            }

            Row(
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
            ) {
                AncientArchitectIconButton(onClick = {}) {
                    Icon(Icons.Default.Favorite, contentDescription = "Favorite")
                }
                AncientArchitectIconButton(onClick = {}) {
                    Icon(Icons.Default.Star, contentDescription = "Star")
                }
                AncientArchitectIconButton(onClick = {}) {
                    Icon(Icons.Default.Settings, contentDescription = "Settings")
                }
            }
        }
    }
}

@Composable
private fun ThemeCardPreview() {
    PreviewSection(title = "Cards") {
        CanonicalMediaCard(
            title = "Canonical Media Card",
            subtitle = "With unified design system tokens and theme integration",
            onClick = {},
            modifier = Modifier.fillMaxWidth()
        )
    }
}

@Composable
private fun ThemeNotificationPreview() {
    PreviewSection(title = "Notifications") {
        Column(
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            AncientArchitectNotification(
                message = "This is an info notification",
                type = NotificationType.INFO,
                title = "Information",
                dismissible = false
            )

            AncientArchitectNotification(
                message = "Operation completed successfully",
                type = NotificationType.SUCCESS,
                dismissible = false
            )
        }
    }
}

@Composable
private fun ThemeRailPreview() {
    PreviewSection(title = "Navigation Rail") {
        Row(
            modifier = Modifier.height(ThemeRailPreviewHeight)
        ) {
            AncientArchitectNavigationRailWithItems(
                selectedIndex = 0,
                items = listOf(
                    RailNavigationItem(Icons.Default.Home, "Home"),
                    RailNavigationItem(Icons.Default.Search, "Search"),
                    RailNavigationItem(Icons.Default.Favorite, "Favorites"),
                    RailNavigationItem(Icons.Default.Settings, "Settings")
                ),
                onItemSelected = {}
            )

            Spacer(modifier = Modifier.width(MediaSpacing.LG))

            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(MediaSpacing.LG),
                verticalArrangement = Arrangement.Center
            ) {
                Text(
                    text = "Stone pillar navigation with hexagonal icons",
                    style = MaterialTheme.typography.bodyMedium
                )
            }
        }
    }
}

@Composable
private fun ThemeGalleryHeading() {
    Text(
        text = "All Available Themes",
        style = MaterialTheme.typography.headlineSmall,
        modifier = Modifier.padding(top = MediaSpacing.LG)
    )
}

@Composable
private fun ThemeGallerySelector(currentTheme: CleverFerretTheme, onThemeSelected: (CleverFerretTheme) -> Unit) {
    ThemeSelector(
        currentTheme = currentTheme,
        onThemeSelected = onThemeSelected,
        showCategories = true
    )
}

private val ThemeRailPreviewHeight = 300.dp
