package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.ui.theme.*

/**
 * Settings Screen with metallic theme
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SettingsScreen(
    onBack: () -> Unit,
    navController: androidx.navigation.NavController,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    var showThemePicker by remember { mutableStateOf(false) }

    CleverFerretTheme(palette = uiState.selectedTheme, darkTheme = uiState.darkMode) {
        Scaffold(
            topBar = {
                MetallicTopAppBar(
                    title = {
                        Text(
                            "Settings",
                            fontWeight = FontWeight.Bold
                        )
                    },
                    navigationIcon = {
                        IconButton(onClick = onBack) {
                            Icon(Icons.Default.ArrowBack, "Back")
                        }
                    }
                )
            }
        ) { paddingValues ->
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                // Appearance Section
                item {
                    MetallicText(
                        text = "Appearance",
                        style = MaterialTheme.typography.titleMedium,
                        modifier = Modifier.padding(vertical = 8.dp)
                    )
                }

                item {
                    MetallicCard {
                        Column {
                            // Theme selector
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(vertical = 8.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Column(modifier = Modifier.weight(1f)) {
                                    Text(
                                        text = "Theme",
                                        style = MaterialTheme.typography.titleSmall,
                                        fontWeight = FontWeight.Medium
                                    )
                                    Text(
                                        text = uiState.selectedTheme.name.replace("_", " "),
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }

                                Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                                    MetallicButton(
                                        text = "Gallery",
                                        onClick = { navController.navigate("theme_showcase") }
                                    )
                                    MetallicButton(
                                        text = "Change",
                                        onClick = { showThemePicker = true }
                                    )
                                }
                            }

                            MetallicDivider()

                            // Dark mode toggle
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(vertical = 8.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Column(modifier = Modifier.weight(1f)) {
                                    Text(
                                        text = "Dark Mode",
                                        style = MaterialTheme.typography.titleSmall,
                                        fontWeight = FontWeight.Medium
                                    )
                                    Text(
                                        text = "Use dark theme for better reading",
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }

                                Switch(
                                    checked = uiState.darkMode,
                                    onCheckedChange = { viewModel.setDarkMode(it) }
                                )
                            }
                        }
                    }
                }

                // Podcasts Section
                item {
                    MetallicText(
                        text = "Podcasts",
                        style = MaterialTheme.typography.titleMedium,
                        modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                    )
                }

                item {
                    MetallicCard {
                        Column {
                            // Auto-download
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(vertical = 8.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Column(modifier = Modifier.weight(1f)) {
                                    Text(
                                        text = "Auto-Download Episodes",
                                        style = MaterialTheme.typography.titleSmall,
                                        fontWeight = FontWeight.Medium
                                    )
                                    Text(
                                        text = "Automatically download new episodes",
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }

                                Switch(
                                    checked = uiState.autoDownloadPodcasts,
                                    onCheckedChange = { viewModel.setAutoDownload(it) }
                                )
                            }

                            MetallicDivider()

                            // WiFi only
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(vertical = 8.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Column(modifier = Modifier.weight(1f)) {
                                    Text(
                                        text = "WiFi Only Downloads",
                                        style = MaterialTheme.typography.titleSmall,
                                        fontWeight = FontWeight.Medium
                                    )
                                    Text(
                                        text = "Download only on WiFi to save data",
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }

                                Switch(
                                    checked = uiState.wifiOnlyDownloads,
                                    onCheckedChange = { viewModel.setWifiOnlyDownloads(it) }
                                )
                            }
                        }
                    }
                }

                // Notifications Section
                item {
                    MetallicText(
                        text = "Notifications",
                        style = MaterialTheme.typography.titleMedium,
                        modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                    )
                }

                item {
                    MetallicCard {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(vertical = 8.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Column(modifier = Modifier.weight(1f)) {
                                Text(
                                    text = "Enable Notifications",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = "Get notified about new content",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }

                            Switch(
                                checked = uiState.notificationsEnabled,
                                onCheckedChange = { viewModel.setNotificationsEnabled(it) }
                            )
                        }
                    }
                }

                   // Reading & Audio Section
                item {
                    MetallicText(
                        text = "Reading & Audio",
                        style = MaterialTheme.typography.titleMedium,
                        modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                    )
                }

                item {
                    MetallicCard(
                        onClick = { navController.navigate("settings/tts_provider") }
                    ) {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(16.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Column(modifier = Modifier.weight(1f)) {
                                Text(
                                    text = "Text-to-Speech Provider",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = "Choose between Android TTS, Gemini, and more",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            Icon(
                                imageVector = Icons.Default.RecordVoiceOver,
                                contentDescription = "TTS Settings"
                            )
                        }
                    }
                }

                // Ambient Sounds Section
                item {
                    MetallicText(
                        text = "Ambient Sounds",
                        style = MaterialTheme.typography.titleMedium,
                        modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                    )
                }

                item {
                    MetallicCard(
                        onClick = { navController.navigate("ambient/theme_manager") }
                    ) {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(16.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Column(modifier = Modifier.weight(1f)) {
                                Text(
                                    text = "Manage Sound Themes",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = "Enable/disable themed collections (sci-fi, medieval, fantasy, etc.)",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            Icon(
                                imageVector = Icons.Default.Category,
                                contentDescription = "Theme Manager"
                            )
                        }
                    }
                }

                item {
                    MetallicCard(
                        onClick = { navController.navigate("ambient/import") }
                    ) {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(16.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Column(modifier = Modifier.weight(1f)) {
                                Text(
                                    text = "Import Custom Sounds",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = "Add your own ambient sound collections from ZIP files",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            Icon(
                                imageVector = Icons.Default.FileUpload,
                                contentDescription = "Import Sounds"
                            )
                        }
                    }
                }

                // Safety & Privacy Section
                   item {
                       MetallicText(
                           text = "Safety & Privacy",
                           style = MaterialTheme.typography.titleMedium,
                           modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                       )
                   }

                   item {
                       MetallicCard(
                           onClick = { navController.navigate("settings/parental_controls") }
                       ) {
                           Row(
                               modifier = Modifier
                                   .fillMaxWidth()
                                   .padding(16.dp),
                               horizontalArrangement = Arrangement.SpaceBetween,
                               verticalAlignment = Alignment.CenterVertically
                           ) {
                               Column(modifier = Modifier.weight(1f)) {
                                   Text(
                                       text = "Parental Controls",
                                       style = MaterialTheme.typography.titleSmall,
                                       fontWeight = FontWeight.Medium
                                   )
                                   Text(
                                       text = "Content filtering and safety settings",
                                       style = MaterialTheme.typography.bodySmall,
                                       color = MaterialTheme.colorScheme.onSurfaceVariant
                                   )
                               }
                               Icon(
                                   imageVector = Icons.Default.ChevronRight,
                                   contentDescription = "Navigate"
                               )
                           }
                       }
                   }

                // Media Servers Section
                   item {
                       MetallicText(
                           text = "Media Servers",
                           style = MaterialTheme.typography.titleMedium,
                           modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                       )
                   }

                   item {
                       MetallicCard(
                           onClick = { navController.navigate("settings/media_servers") }
                       ) {
                           Row(
                               modifier = Modifier
                                   .fillMaxWidth()
                                   .padding(16.dp),
                               horizontalArrangement = Arrangement.SpaceBetween,
                               verticalAlignment = Alignment.CenterVertically
                           ) {
                               Column(modifier = Modifier.weight(1f)) {
                                   Text(
                                       text = "Media Servers",
                                       style = MaterialTheme.typography.titleSmall,
                                       fontWeight = FontWeight.Medium
                                   )
                                   Text(
                                       text = "Configure Jellyfin, Plex, and Emby",
                                       style = MaterialTheme.typography.bodySmall,
                                       color = MaterialTheme.colorScheme.onSurfaceVariant
                                   )
                               }
                               Icon(
                                   imageVector = Icons.Default.ChevronRight,
                                   contentDescription = "Navigate"
                               )
                           }
                       }
                   }

                   // Network Storage Section
                   item {
                       MetallicText(
                           text = "Network Storage",
                           style = MaterialTheme.typography.titleMedium,
                           modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                       )
                   }

                   item {
                       MetallicCard(
                           onClick = { navController.navigate("settings/network_storage") }
                       ) {
                           Row(
                               modifier = Modifier
                                   .fillMaxWidth()
                                   .padding(16.dp),
                               horizontalArrangement = Arrangement.SpaceBetween,
                               verticalAlignment = Alignment.CenterVertically
                           ) {
                               Column(modifier = Modifier.weight(1f)) {
                                   Text(
                                       text = "Network Storage",
                                       style = MaterialTheme.typography.titleSmall,
                                       fontWeight = FontWeight.Medium
                                   )
                                   Text(
                                       text = "Configure SMB/CIFS and WebDAV",
                                       style = MaterialTheme.typography.bodySmall,
                                       color = MaterialTheme.colorScheme.onSurfaceVariant
                                   )
                               }
                               Icon(
                                   imageVector = Icons.Default.ChevronRight,
                                   contentDescription = "Navigate"
                               )
                           }
                       }
                   }

                // About Section
                item {
                    MetallicText(
                        text = "About",
                        style = MaterialTheme.typography.titleMedium,
                        modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                    )
                }

                item {
                    MetallicCard {
                        Column(
                            modifier = Modifier.padding(vertical = 8.dp)
                        ) {
                            Text(
                                text = "CleverFerret",
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.Bold
                            )
                            Spacer(modifier = Modifier.height(4.dp))
                            Text(
                                text = "Universal Media Library",
                                style = MaterialTheme.typography.bodyMedium
                            )
                            Text(
                                text = "Version 1.0",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                }
            }
        }

        // Theme picker dialog
        if (showThemePicker) {
            ThemePickerDialog(
                currentTheme = uiState.selectedTheme,
                onDismiss = { showThemePicker = false },
                onSelect = { theme ->
                    viewModel.setTheme(theme)
                    showThemePicker = false
                }
            )
        }
    }
}

@Composable
private fun ThemePickerDialog(
    currentTheme: ThemePalette,
    onDismiss: () -> Unit,
    onSelect: (ThemePalette) -> Unit
) {
    // Show enhanced theme picker with all available themes
    // Note: Only the 6 original themes can be persisted with current ViewModel
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { 
            Row(
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text("Select Theme") 
                Text(
                    text = "15 Available",
                    style = MaterialTheme.typography.labelMedium,
                    color = MaterialTheme.colorScheme.primary
                )
            }
        },
        text = {
            LazyColumn(
                modifier = Modifier.heightIn(max = 500.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                // Show all CleverFerretTheme options grouped by category
                CleverFerretTheme.entries.groupBy { it.getConfig().category }.forEach { (category, themes) ->
                    item {
                        Text(
                            text = category.name.replace('_', ' '),
                            style = MaterialTheme.typography.titleSmall,
                            color = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.padding(top = 8.dp, bottom = 4.dp)
                        )
                    }
                    
                    items(themes.size) { index ->
                        val theme = themes[index]
                        val config = theme.getConfig()
                        val isSelected = theme.name == currentTheme.toCleverFerretTheme().name
                        
                        Card(
                            onClick = { 
                                // Convert CleverFerretTheme to ThemePalette
                                onSelect(theme.toThemePalette())
                            },
                            colors = CardDefaults.cardColors(
                                containerColor = if (isSelected)
                                    MaterialTheme.colorScheme.primaryContainer
                                else
                                    MaterialTheme.colorScheme.surfaceVariant
                            )
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(12.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Column(modifier = Modifier.weight(1f)) {
                                    Text(
                                        text = config.displayName,
                                        fontWeight = if (isSelected) FontWeight.Bold else FontWeight.Medium,
                                        style = MaterialTheme.typography.bodyMedium
                                    )
                                    Text(
                                        text = config.description,
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                    
                                    // Show special features for Ancient Architect themes
                                    if (theme.isAncientArchitect()) {
                                        Row(
                                            horizontalArrangement = Arrangement.spacedBy(4.dp),
                                            modifier = Modifier.padding(top = 4.dp)
                                        ) {
                                            Icon(
                                                Icons.Default.Star,
                                                contentDescription = null,
                                                modifier = Modifier.size(14.dp),
                                                tint = MaterialTheme.colorScheme.primary
                                            )
                                            Text(
                                                text = "Special",
                                                style = MaterialTheme.typography.labelSmall,
                                                color = MaterialTheme.colorScheme.primary
                                            )
                                        }
                                    }
                                }
                                if (isSelected) {
                                    Icon(
                                        Icons.Default.Check,
                                        "Selected",
                                        tint = MaterialTheme.colorScheme.primary
                                    )
                                }
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        }
    )
}
