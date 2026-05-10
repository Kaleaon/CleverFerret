package com.universalmedialibrary.ui.settings.sections

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

import com.universalmedialibrary.ui.settings.SettingsUiState
import com.universalmedialibrary.ui.settings.SettingsViewModel
import androidx.compose.foundation.lazy.LazyListScope

fun LazyListScope.navigationSection(
    uiState: SettingsUiState,
    viewModel: SettingsViewModel,
    navController: androidx.navigation.NavController,
) {
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

}
