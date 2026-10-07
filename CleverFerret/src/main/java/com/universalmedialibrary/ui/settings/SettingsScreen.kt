package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.ChevronRight
import androidx.compose.material.icons.filled.Cloud
import androidx.compose.material.icons.filled.Folder
import androidx.compose.material.icons.filled.Palette
import androidx.compose.material.icons.filled.Security
import androidx.compose.material.icons.filled.Tune
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.RadioButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.ui.components.NavigationItem
import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import com.universalmedialibrary.ui.theme.MetallicCard
import com.universalmedialibrary.ui.theme.MetallicTopAppBar

/**
 * Main Settings Landing Screen
 *
 * Presents 2-level category landing hubs for settings:
 * - Appearance & Customization
 * - Library & Storage
 * - Playback & Reader
 * - Integrations & Services
 * - System & Safety
 */
@Suppress("LongMethod")
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SettingsScreen(
    onBack: () -> Unit,
    navController: NavController,
    availableBottomItems: List<NavigationItem>,
    viewModel: SettingsViewModel = hiltViewModel()
) {
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
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            item {
                SettingsCategoryHubCard(
                    title = "Appearance & Customization",
                    description = "Themes, dark mode, display options, navigation layout",
                    icon = Icons.Default.Palette,
                    onClick = { navController.navigate(MediaRoutes.SETTINGS_HUB_APPEARANCE) }
                )
            }
            item {
                SettingsCategoryHubCard(
                    title = "Library & Storage",
                    description = "Storage organizer, auto-scan, downloads, cache, import & export",
                    icon = Icons.Default.Folder,
                    onClick = { navController.navigate(MediaRoutes.SETTINGS_HUB_LIBRARY) }
                )
            }
            item {
                SettingsCategoryHubCard(
                    title = "Playback & Reader",
                    description = "Reader preferences, audio effects & profiles, podcasts, TTS, ambient sounds",
                    icon = Icons.Default.Tune,
                    onClick = { navController.navigate(MediaRoutes.SETTINGS_HUB_PLAYBACK) }
                )
            }
            item {
                SettingsCategoryHubCard(
                    title = "Integrations & Services",
                    description = "API providers, media servers, cloud storage, web content, social",
                    icon = Icons.Default.Cloud,
                    onClick = { navController.navigate(MediaRoutes.SETTINGS_HUB_INTEGRATIONS) }
                )
            }
            item {
                SettingsCategoryHubCard(
                    title = "System & Safety",
                    description = "Safety & parental controls, privacy, notifications, feedback, about",
                    icon = Icons.Default.Security,
                    onClick = { navController.navigate(MediaRoutes.SETTINGS_HUB_SYSTEM) }
                )
            }
        }
    }
}

@Composable
private fun SettingsCategoryHubCard(
    title: String,
    description: String,
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    onClick: () -> Unit
) {
    MetallicCard {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .clickable(onClick = onClick)
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row(
                modifier = Modifier.weight(1f),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Icon(
                    imageVector = icon,
                    contentDescription = title,
                    tint = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.size(28.dp)
                )
                Column {
                    Text(
                        text = title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    Spacer(modifier = Modifier.height(4.dp))
                    Text(
                        text = description,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
            Icon(
                imageVector = Icons.Default.ChevronRight,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

internal data class BottomBarEditorItem(
    val item: NavigationItem,
    val visible: Boolean
)

internal fun <T> MutableList<T>.move(fromIndex: Int, toIndex: Int) {
    if (fromIndex == toIndex) return
    val element = removeAt(fromIndex)
    val targetIndex = if (toIndex > fromIndex) toIndex - 1 else toIndex
    add(targetIndex.coerceIn(0, size), element)
}

internal fun persistPreferences(
    items: List<BottomBarEditorItem>,
    onOrderChanged: (List<String>, Set<String>) -> Unit
) {
    val order = items.map { it.item.preferenceId }
    val hidden = items.filterNot { it.visible }.map { it.item.preferenceId }.toSet()
    onOrderChanged(order, hidden)
}

@Composable
internal fun GearPositionOption(
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
