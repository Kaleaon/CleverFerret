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
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.BugReport
import androidx.compose.material.icons.filled.ChevronRight
import androidx.compose.material.icons.filled.Code
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.ui.components.NavigationItem
import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import com.universalmedialibrary.ui.settings.sections.MiniPlayerBackgroundDialog
import com.universalmedialibrary.ui.settings.sections.PodcastSettingsSection
import com.universalmedialibrary.ui.settings.sections.aboutSection
import com.universalmedialibrary.ui.settings.sections.ambientSoundsSection
import com.universalmedialibrary.ui.settings.sections.apiIntegrationsSection
import com.universalmedialibrary.ui.settings.sections.appearanceSettingsSection
import com.universalmedialibrary.ui.settings.sections.feedbackSection
import com.universalmedialibrary.ui.settings.sections.libraryStorageSection
import com.universalmedialibrary.ui.settings.sections.mediaServersSection
import com.universalmedialibrary.ui.settings.sections.networkStorageSection
import com.universalmedialibrary.ui.settings.sections.notificationsSection
import com.universalmedialibrary.ui.settings.sections.privacySection
import com.universalmedialibrary.ui.settings.sections.readingAudioSection
import com.universalmedialibrary.ui.settings.sections.safetyParentalSection
import com.universalmedialibrary.ui.settings.sections.webContentSection
import com.universalmedialibrary.ui.theme.MetallicCard
import com.universalmedialibrary.ui.theme.MetallicText
import com.universalmedialibrary.ui.theme.MetallicTopAppBar

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AppearanceHubScreen(
    onBack: () -> Unit,
    navController: NavController,
    availableBottomItems: List<NavigationItem>,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    var showThemePicker by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            MetallicTopAppBar(
                title = { Text("Appearance & Customization", fontWeight = FontWeight.Bold) },
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
            navigationSection(
                uiState = uiState,
                viewModel = viewModel,
                navController = navController,
                availableBottomItems = availableBottomItems
            )
        }

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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LibraryHubScreen(
    onBack: () -> Unit,
    navController: NavController,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()

    Scaffold(
        topBar = {
            MetallicTopAppBar(
                title = { Text("Library & Storage", fontWeight = FontWeight.Bold) },
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
            libraryStorageSection(
                uiState = uiState,
                viewModel = viewModel,
                navController = navController
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlaybackHubScreen(
    onBack: () -> Unit,
    navController: NavController,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    var showMiniPlayerBackgroundDialog by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            MetallicTopAppBar(
                title = { Text("Playback & Reader", fontWeight = FontWeight.Bold) },
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
            readingAudioSection(
                uiState = uiState,
                viewModel = viewModel,
                navController = navController,
                onOpenMiniPlayerBackgroundDialog = { showMiniPlayerBackgroundDialog = true }
            )
            item {
                PodcastSettingsSection(
                    uiState = uiState,
                    onAutoDownloadChanged = viewModel::setAutoDownload,
                    onWifiOnlyChanged = viewModel::setWifiOnlyDownloads
                )
            }
            ambientSoundsSection(
                uiState = uiState,
                viewModel = viewModel,
                navController = navController
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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun IntegrationsHubScreen(
    onBack: () -> Unit,
    navController: NavController,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()

    Scaffold(
        topBar = {
            MetallicTopAppBar(
                title = { Text("Integrations & Services", fontWeight = FontWeight.Bold) },
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
            apiIntegrationsSection(
                uiState = uiState,
                viewModel = viewModel,
                navController = navController
            )
            mediaServersSection(
                uiState = uiState,
                viewModel = viewModel,
                navController = navController
            )
            networkStorageSection(
                uiState = uiState,
                viewModel = viewModel,
                navController = navController
            )
            webContentSection(
                uiState = uiState,
                viewModel = viewModel,
                navController = navController
            )
        }
    }
}

@Suppress("LongMethod")
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SystemHubScreen(
    onBack: () -> Unit,
    navController: NavController,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()

    Scaffold(
        topBar = {
            MetallicTopAppBar(
                title = { Text("System & Safety", fontWeight = FontWeight.Bold) },
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
            safetyPrivacySection(
                uiState = uiState,
                viewModel = viewModel,
                navController = navController
            )
            notificationsSection(
                uiState = uiState,
                viewModel = viewModel,
                navController = navController
            )
            aboutSection(
                uiState = uiState,
                viewModel = viewModel,
                navController = navController
            )

            // Developer Settings sub-page item (ONLY accessible in debug builds)
            if (BuildConfig.DEBUG) {
                item {
                    MetallicText(
                        text = "Developer",
                        style = MaterialTheme.typography.titleMedium,
                        modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                    )
                    MetallicCard {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable {
                                    navController.navigate(MediaRoutes.SETTINGS_DEVELOPER)
                                }
                                .padding(16.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(12.dp),
                                modifier = Modifier.weight(1f)
                            ) {
                                Icon(
                                    imageVector = Icons.Default.Code,
                                    contentDescription = "Developer Settings",
                                    tint = MaterialTheme.colorScheme.primary
                                )
                                Column {
                                    Text(
                                        text = "Developer Settings",
                                        style = MaterialTheme.typography.titleSmall,
                                        fontWeight = FontWeight.Medium
                                    )
                                    Text(
                                        text = "Feature flags, experimental overrides, and debug options",
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
            }
        }
    }
}
