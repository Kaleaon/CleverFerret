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
import com.universalmedialibrary.ui.settings.sections.notificationsSection
import com.universalmedialibrary.ui.settings.sections.libraryStorageSection
import com.universalmedialibrary.ui.settings.sections.navigationSection
import com.universalmedialibrary.ui.settings.sections.apiIntegrationsSection
import com.universalmedialibrary.ui.settings.sections.webContentSection
import com.universalmedialibrary.ui.settings.sections.readingAudioSection
import com.universalmedialibrary.ui.settings.sections.ambientSoundsSection
import com.universalmedialibrary.ui.settings.sections.safetyPrivacySection
import com.universalmedialibrary.ui.settings.sections.mediaServersSection
import com.universalmedialibrary.ui.settings.sections.networkStorageSection
import com.universalmedialibrary.ui.settings.sections.aboutSection

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

                notificationsSection(uiState = uiState, viewModel = viewModel, navController = navController)
                libraryStorageSection(uiState = uiState, viewModel = viewModel, navController = navController)
                navigationSection(uiState = uiState, viewModel = viewModel, navController = navController)
                apiIntegrationsSection(uiState = uiState, viewModel = viewModel, navController = navController)
                webContentSection(uiState = uiState, viewModel = viewModel, navController = navController)
                readingAudioSection(uiState = uiState, viewModel = viewModel, navController = navController)
                ambientSoundsSection(uiState = uiState, viewModel = viewModel, navController = navController)
                safetyPrivacySection(uiState = uiState, viewModel = viewModel, navController = navController)
                mediaServersSection(uiState = uiState, viewModel = viewModel, navController = navController)
                networkStorageSection(uiState = uiState, viewModel = viewModel, navController = navController)
                aboutSection(uiState = uiState, viewModel = viewModel, navController = navController)
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
