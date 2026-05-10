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

fun LazyListScope.readingAudioSection(
    uiState: SettingsUiState,
    viewModel: SettingsViewModel,
    navController: androidx.navigation.NavController,
) {
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

}
