package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
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
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
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
                item {
                    AppearanceSettingsSection(
                        uiState = uiState,
                        navController = navController,
                        onOpenThemePicker = { showThemePicker = true },
                        onDarkModeChanged = viewModel::setDarkMode,
                        onReduceMotionChanged = viewModel::setReduceMotion
                    )
                }

                item {
                    PodcastSettingsSection(
                        uiState = uiState,
                        onAutoDownloadChanged = viewModel::setAutoDownload,
                        onWifiOnlyChanged = viewModel::setWifiOnlyDownloads
                    )
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

                // Library & Storage Section
                item {
                    MetallicText(
                        text = "Library & Storage",
                        style = MaterialTheme.typography.titleMedium,
                        modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                    )
                }
                
                // Quick Import - Add Media to Library
                item {
                    MetallicCard(
                        onClick = { navController.navigate(com.universalmedialibrary.ui.media.navigation.MediaRoutes.FOLDER_IMPORT) }
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
                                    text = "Import Media to Library",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = "Import files or folders with auto-sorting and metadata from Open Library & Google Books",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            Icon(
                                imageVector = Icons.Default.FileDownload,
                                contentDescription = "Import Media"
                            )
                        }
                    }
                }

                item {
                    MetallicCard(
                        onClick = { navController.navigate("settings/import_sorter") }
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
                                    text = "Import Sorter (Input → Output)",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = "Scan an input folder and sort everything into an output folder with subfolders + metadata.",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            Icon(
                                imageVector = Icons.Default.FolderCopy,
                                contentDescription = "Import Sorter"
                            )
                        }
                    }
                }

                item {
                    MetallicCard(
                        onClick = { navController.navigate("settings/import_history") }
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
                                    text = "Import History / Undo",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = "Review past imports and undo the last move/copy if needed.",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            Icon(
                                imageVector = Icons.Default.History,
                                contentDescription = "Import History"
                            )
                        }
                    }
                }

                item {
                    MetallicCard(
                        onClick = { viewModel.showOnboardingTipsAgain() }
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
                                    text = "Show onboarding tips again",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = "Restore the Home welcome tips if you dismissed them.",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            Icon(
                                imageVector = Icons.Default.TipsAndUpdates,
                                contentDescription = "Show onboarding tips"
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
                        onClick = { navController.navigate("fanfiction_hub") }
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
                                    text = "Fanfiction & Web Fiction Hub",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = "Discover, download, and manage fanfiction, web comics, and stories",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            Icon(
                                imageVector = Icons.AutoMirrored.Filled.MenuBook,
                                contentDescription = "Fanfiction Hub"
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
