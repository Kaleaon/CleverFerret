package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.data.settings.BottomBarPreferences
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.ui.components.NavigationItem
import com.universalmedialibrary.ui.components.orderedForEditor
import com.universalmedialibrary.ui.theme.*
import org.burnoutcrew.reorderable.detectReorderAfterLongPress
import org.burnoutcrew.reorderable.rememberReorderableLazyListState
import org.burnoutcrew.reorderable.reorderable

/**
 * Settings Screen with metallic theme
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SettingsScreen(
    onBack: () -> Unit,
    navController: NavController,
    availableBottomItems: List<NavigationItem>,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    var showThemePicker by remember { mutableStateOf(false) }
    var showMiniPlayerBackgroundDialog by remember { mutableStateOf(false) }

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

                  // Navigation Section
                  item {
                      MetallicText(
                          text = "Navigation",
                          style = MaterialTheme.typography.titleMedium,
                          modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                      )
                  }

                  item {
                      MetallicCard {
                          Column(
                              modifier = Modifier
                                  .fillMaxWidth()
                                  .padding(vertical = 12.dp),
                              verticalArrangement = Arrangement.spacedBy(12.dp)
                          ) {
                              Text(
                                  text = "Settings Gear Position",
                                  style = MaterialTheme.typography.titleSmall,
                                  fontWeight = FontWeight.Medium,
                                  modifier = Modifier.padding(horizontal = 16.dp)
                              )
                              Text(
                                  text = "Pick the side for the bottom gear so it stays thumb-accessible.",
                                  style = MaterialTheme.typography.bodySmall,
                                  color = MaterialTheme.colorScheme.onSurfaceVariant,
                                  modifier = Modifier.padding(horizontal = 16.dp)
                              )

                              Row(
                                  modifier = Modifier
                                      .fillMaxWidth()
                                      .padding(horizontal = 16.dp),
                                  horizontalArrangement = Arrangement.spacedBy(16.dp),
                                  verticalAlignment = Alignment.CenterVertically
                              ) {
                                  GearPositionOption(
                                      label = "Left",
                                      position = BottomGearPosition.LEFT,
                                      current = uiState.bottomGearPosition,
                                      onSelect = viewModel::setBottomGearPosition
                                  )
                                  GearPositionOption(
                                      label = "Right",
                                      position = BottomGearPosition.RIGHT,
                                      current = uiState.bottomGearPosition,
                                      onSelect = viewModel::setBottomGearPosition
                                  )
                              }
                          }
                      }
                  }

                    item {
                        BottomBarPreferencesCard(
                            availableItems = availableBottomItems,
                            preferences = uiState.bottomBarPreferences,
                            onOrderChanged = { order, hidden ->
                                viewModel.updateBottomBarPreferences(order, hidden)
                            },
                            onReset = viewModel::resetBottomBarPreferences
                        )
                    }

                    // Debug Bug Report Button toggle (only in debug builds)
                    if (com.universalmedialibrary.BuildConfig.DEBUG) {
                        item {
                            val showBugButton by viewModel.showDebugBugButton.collectAsState()
                            MetallicCard {
                                Row(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(16.dp),
                                    horizontalArrangement = Arrangement.SpaceBetween,
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Column(modifier = Modifier.weight(1f)) {
                                        Text(
                                            text = "Debug Bug Report Button",
                                            style = MaterialTheme.typography.titleSmall,
                                            fontWeight = FontWeight.Medium
                                        )
                                        Text(
                                            text = "Show bug report button in bottom bar for quick bug reporting",
                                            style = MaterialTheme.typography.bodySmall,
                                            color = MaterialTheme.colorScheme.onSurfaceVariant
                                        )
                                    }
                                    Switch(
                                        checked = showBugButton,
                                        onCheckedChange = { viewModel.setShowDebugBugButton(it) }
                                    )
                                }
                            }
                        }
                    }

                // API & Integrations Section
                item {
                    MetallicText(
                        text = "API & Integrations",
                        style = MaterialTheme.typography.titleMedium,
                        modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                    )
                }

                item {
                    MetallicCard(
                        onClick = { navController.navigate("settings/api") }
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
                                    text = "API Keys & Services",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = "Manage Gemini, ComicVine, Last.fm and other API keys",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            Icon(
                                imageVector = Icons.Default.Key,
                                contentDescription = "API Settings"
                            )
                        }
                    }
                }

                // Web Content Section
                item {
                    MetallicText(
                        text = "Web Content",
                        style = MaterialTheme.typography.titleMedium,
                        modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                    )
                }

                item {
                    MetallicCard(
                        onClick = { navController.navigate("web_comic_downloader") }
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
                                    text = "Web Comic Downloader",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = "Search ComicVine and download web comics",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            Icon(
                                imageVector = Icons.Default.CloudDownload,
                                contentDescription = "Web Comic Downloader"
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

                item {
                    MetallicCard(
                        onClick = { navController.navigate("settings/audio_effects") }
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
                                    text = "Audio Effects",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = "Equalizer, bass boost, reverb, and ReplayGain",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            Icon(
                                imageVector = Icons.Default.GraphicEq,
                                contentDescription = "Audio Effects"
                            )
                        }
                    }
                }

                item {
                    MetallicCard(
                        onClick = { navController.navigate("settings/audio_profiles") }
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
                                    text = "Audio Profiles",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = "Per-device audio settings (headphones, car, speakers)",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            Icon(
                                imageVector = Icons.Default.Headphones,
                                contentDescription = "Audio Profiles"
                            )
                        }
                    }
                }

                  item {
                      MetallicCard(
                          onClick = { showMiniPlayerBackgroundDialog = true }
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
                                      text = "Mini Player Background",
                                      style = MaterialTheme.typography.titleSmall,
                                      fontWeight = FontWeight.Medium
                                  )
                                  Text(
                                      text = uiState.miniPlayerBackgroundMode.displayName,
                                      style = MaterialTheme.typography.bodySmall,
                                      color = MaterialTheme.colorScheme.onSurfaceVariant
                                  )
                                  Text(
                                      text = uiState.miniPlayerBackgroundMode.description,
                                      style = MaterialTheme.typography.bodySmall,
                                      color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.7f)
                                  )
                              }
                              Icon(
                                  imageVector = Icons.Default.Palette,
                                  contentDescription = "Mini Player Background"
                              )
                          }
                      }
                  }

                item {
                    MetallicCard(
                        onClick = { navController.navigate("settings/lastfm") }
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
                                    text = "Last.fm Scrobbling",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = "Track listening history and get recommendations",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            Icon(
                                imageVector = Icons.Default.MusicNote,
                                contentDescription = "Last.fm Settings"
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

          if (showMiniPlayerBackgroundDialog) {
              MiniPlayerBackgroundDialog(
                  currentMode = uiState.miniPlayerBackgroundMode,
                  onSelect = { mode ->
                      viewModel.setMiniPlayerBackgroundMode(mode)
                      showMiniPlayerBackgroundDialog = false
                  },
                  onDismiss = { showMiniPlayerBackgroundDialog = false }
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

@Composable
private fun BottomBarPreferencesCard(
    availableItems: List<NavigationItem>,
    preferences: BottomBarPreferences,
    onOrderChanged: (List<String>, Set<String>) -> Unit,
    onReset: () -> Unit
) {
    MetallicCard {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(vertical = 12.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = "Bottom Bar Items",
                        style = MaterialTheme.typography.titleSmall,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = "Reorder and hide shortcuts to match how you use the app.",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                TextButton(
                    onClick = onReset,
                    enabled = preferences != BottomBarPreferences.Default
                ) {
                    Text("Reset")
                }
            }

            if (availableItems.isEmpty()) {
                Text(
                    text = "Add a library to unlock bottom bar customization.",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    modifier = Modifier.padding(horizontal = 16.dp)
                )
            } else {
                BottomBarPreferencesEditor(
                    availableItems = availableItems,
                    preferences = preferences,
                    onOrderChanged = onOrderChanged
                )
            }
        }
    }
}

@Composable
private fun BottomBarPreferencesEditor(
    availableItems: List<NavigationItem>,
    preferences: BottomBarPreferences,
    onOrderChanged: (List<String>, Set<String>) -> Unit
) {
    val orderedItems = remember(availableItems, preferences) {
        availableItems.orderedForEditor(preferences)
    }
    val editorItems = remember(orderedItems, preferences) {
        mutableStateListOf<BottomBarEditorItem>().apply {
            orderedItems.forEach { item ->
                add(
                    BottomBarEditorItem(
                        item = item,
                        visible = item.preferenceId !in preferences.hidden
                    )
                )
            }
        }
    }

    val reorderState = rememberReorderableLazyListState(onMove = { from, to ->
        editorItems.move(from.index, to.index)
        persistPreferences(editorItems, onOrderChanged)
    })

    LazyColumn(
        modifier = Modifier
            .fillMaxWidth()
            .heightIn(max = 320.dp)
            .reorderable(reorderState),
        state = reorderState.listState,
        verticalArrangement = Arrangement.spacedBy(8.dp),
        userScrollEnabled = editorItems.size > 3
    ) {
        items(editorItems, key = { it.item.preferenceId }) { editorItem ->
            BottomBarEditorRow(
                editorItem = editorItem,
                modifier = Modifier
                    .fillMaxWidth()
                    .detectReorderAfterLongPress(reorderState),
                onVisibilityToggle = { visible ->
                    val index = editorItems.indexOfFirst { it.item.preferenceId == editorItem.item.preferenceId }
                    if (index != -1) {
                        editorItems[index] = editorItems[index].copy(visible = visible)
                        persistPreferences(editorItems, onOrderChanged)
                    }
                }
            )
        }
    }
}

@Composable
private fun BottomBarEditorRow(
    editorItem: BottomBarEditorItem,
    modifier: Modifier = Modifier,
    onVisibilityToggle: (Boolean) -> Unit
) {
    Surface(
        modifier = modifier,
        shape = RoundedCornerShape(18.dp),
        tonalElevation = 0.dp,
        color = MaterialTheme.colorScheme.surfaceVariant
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 12.dp, vertical = 8.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Box(
                modifier = Modifier
                    .size(40.dp)
                    .clip(RoundedCornerShape(12.dp))
                    .background(MaterialTheme.colorScheme.surface),
                contentAlignment = Alignment.Center
            ) {
                if (editorItem.visible) {
                    editorItem.item.selectedIcon()
                } else {
                    editorItem.item.icon()
                }
            }

            Column(
                modifier = Modifier.weight(1f),
                verticalArrangement = Arrangement.spacedBy(2.dp)
            ) {
                Text(
                    text = editorItem.item.label,
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = if (editorItem.visible) FontWeight.Medium else FontWeight.Normal
                )
                if (!editorItem.visible) {
                    Text(
                        text = "Hidden",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            Switch(
                checked = editorItem.visible,
                onCheckedChange = onVisibilityToggle
            )

            Icon(
                imageVector = Icons.Default.DragHandle,
                contentDescription = "Drag to reorder",
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

private data class BottomBarEditorItem(
    val item: NavigationItem,
    val visible: Boolean
)

private fun <T> MutableList<T>.move(fromIndex: Int, toIndex: Int) {
    if (fromIndex == toIndex) return
    val element = removeAt(fromIndex)
    val targetIndex = if (toIndex > fromIndex) toIndex - 1 else toIndex
    add(targetIndex.coerceIn(0, size), element)
}

private fun persistPreferences(
    items: List<BottomBarEditorItem>,
    onOrderChanged: (List<String>, Set<String>) -> Unit
) {
    val order = items.map { it.item.preferenceId }
    val hidden = items.filterNot { it.visible }.map { it.item.preferenceId }.toSet()
    onOrderChanged(order, hidden)
}

@Composable
private fun MiniPlayerBackgroundDialog(
    currentMode: com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode,
    onSelect: (com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode) -> Unit,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Mini Player Background") },
        text = {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 8.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode.values().forEach { mode ->
                    val isSelected = mode == currentMode
                    Surface(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clip(MaterialTheme.shapes.medium)
                            .clickable { onSelect(mode) },
                        tonalElevation = if (isSelected) 2.dp else 0.dp,
                        color = if (isSelected)
                            MaterialTheme.colorScheme.primaryContainer
                        else
                            MaterialTheme.colorScheme.surfaceVariant
                    ) {
                        Column(
                            modifier = Modifier.padding(16.dp),
                            verticalArrangement = Arrangement.spacedBy(4.dp)
                        ) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(8.dp)
                            ) {
                                Icon(
                                    imageVector = when (mode) {
                                        com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode.THEME -> Icons.Default.ColorLens
                                        com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode.ALBUM_ART_SLIVER -> Icons.Default.Image
                                        com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode.VISUALIZER -> Icons.Default.GraphicEq
                                    },
                                    contentDescription = null
                                )
                                Text(
                                    text = mode.displayName,
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = if (isSelected) FontWeight.Bold else FontWeight.Medium
                                )
                            }
                            Text(
                                text = mode.description,
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
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

@Composable
private fun GearPositionOption(
    label: String,
    position: BottomGearPosition,
    current: BottomGearPosition,
    onSelect: (BottomGearPosition) -> Unit
) {
    Row(
        modifier = Modifier
            .clip(RoundedCornerShape(24.dp))
            .clickable { onSelect(position) }
            .padding(horizontal = 12.dp, vertical = 8.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        RadioButton(
            selected = current == position,
            onClick = { onSelect(position) }
        )
        Text(label, style = MaterialTheme.typography.bodyMedium)
    }
}
