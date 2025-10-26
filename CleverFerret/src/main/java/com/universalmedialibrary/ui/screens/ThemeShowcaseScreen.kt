package com.universalmedialibrary.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.components.*
import com.universalmedialibrary.ui.theme.*

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
    modifier: Modifier = Modifier
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Theme Gallery") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    Text(
                        text = "${CleverFerretTheme.entries.size} Themes",
                        style = MaterialTheme.typography.labelLarge,
                        modifier = Modifier.padding(end = 16.dp)
                    )
                }
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(24.dp)
        ) {
            // Theme selector
            item {
                Card {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        verticalArrangement = Arrangement.spacedBy(16.dp)
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
                            verticalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            InfoRow("Category", config.category.name.replace('_', ' '))
                            InfoRow("Description", config.description)
                            
                            if (currentTheme.isAncientArchitect()) {
                                Divider(modifier = Modifier.padding(vertical = 8.dp))
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
            
            // Component previews (only for Ancient Architect themes)
            if (currentTheme.isAncientArchitect()) {
                item {
                    Text(
                        text = "Component Previews",
                        style = MaterialTheme.typography.headlineSmall,
                        modifier = Modifier.padding(top = 8.dp)
                    )
                }
                
                // Button previews
                item {
                    PreviewSection(title = "Buttons") {
                        Column(
                            verticalArrangement = Arrangement.spacedBy(12.dp)
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
                                horizontalArrangement = Arrangement.spacedBy(12.dp)
                            ) {
                                AncientArchitectIconButton(onClick = {}) {
                                    Icon(Icons.Default.Favorite, contentDescription = null)
                                }
                                AncientArchitectIconButton(onClick = {}) {
                                    Icon(Icons.Default.Star, contentDescription = null)
                                }
                                AncientArchitectIconButton(onClick = {}) {
                                    Icon(Icons.Default.Settings, contentDescription = null)
                                }
                            }
                        }
                    }
                }
                
                // Card previews
                item {
                    PreviewSection(title = "Cards") {
                        AncientArchitectCard(
                            onClick = {},
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Column(
                                modifier = Modifier.padding(16.dp),
                                verticalArrangement = Arrangement.spacedBy(8.dp)
                            ) {
                                Text(
                                    text = "Ancient Architect Card",
                                    style = MaterialTheme.typography.titleMedium
                                )
                                Text(
                                    text = "With stepped borders and geometric patterns",
                                    style = MaterialTheme.typography.bodySmall
                                )
                            }
                        }
                    }
                }
                
                // Notification previews
                item {
                    PreviewSection(title = "Notifications") {
                        Column(
                            verticalArrangement = Arrangement.spacedBy(12.dp)
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
                
                // Navigation rail preview
                item {
                    PreviewSection(title = "Navigation Rail") {
                        Row(
                            modifier = Modifier.height(300.dp)
                        ) {
                            AncientArchitectNavigationRailWithItems(
                                selectedIndex = 0,
                                items = listOf(
                                    NavigationItem(Icons.Default.Home, "Home"),
                                    NavigationItem(Icons.Default.Search, "Search"),
                                    NavigationItem(Icons.Default.Favorite, "Favorites"),
                                    NavigationItem(Icons.Default.Settings, "Settings")
                                ),
                                onItemSelected = {}
                            )
                            
                            Spacer(modifier = Modifier.width(16.dp))
                            
                            Column(
                                modifier = Modifier
                                    .fillMaxSize()
                                    .padding(16.dp),
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
            }
            
            // Theme gallery
            item {
                Text(
                    text = "All Available Themes",
                    style = MaterialTheme.typography.headlineSmall,
                    modifier = Modifier.padding(top = 16.dp)
                )
            }
            
            item {
                ThemeSelector(
                    currentTheme = currentTheme,
                    onThemeSelected = onThemeSelected,
                    showCategories = true
                )
            }
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
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
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
