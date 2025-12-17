package com.universalmedialibrary.ui.components

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Close
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog
import androidx.compose.ui.window.DialogProperties
import com.universalmedialibrary.ui.models.*
import com.universalmedialibrary.ui.theme.MetallicThemeVariant

/**
 * Comprehensive Settings Dialog
 * 
 * 7-tab settings interface with all app configuration options:
 * 1. API Keys
 * 2. E-Reader
 * 3. Audiobooks
 * 4. Metadata
 * 5. Cloud Sync
 * 6. Interface
 * 7. Import
 */

@Composable
fun SettingsDialog(
    settings: AppSettings,
    onSettingsChange: (AppSettings) -> Unit,
    onDismiss: () -> Unit,
    modifier: Modifier = Modifier
) {
    var selectedTab by remember { mutableStateOf(0) }
    
    val tabs = listOf(
        "API Keys",
        "E-Reader",
        "Audiobooks",
        "Metadata",
        "Cloud Sync",
        "Interface",
        "Import"
    )
    
    Dialog(
        onDismissRequest = onDismiss,
        properties = DialogProperties(
            usePlatformDefaultWidth = false
        )
    ) {
        Surface(
            modifier = modifier
                .fillMaxSize()
                .padding(16.dp),
            shape = MaterialTheme.shapes.large,
            color = MaterialTheme.colorScheme.surface,
            tonalElevation = 6.dp
        ) {
            Column(
                modifier = Modifier.fillMaxSize()
            ) {
                // Header
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Settings",
                        style = MaterialTheme.typography.headlineMedium,
                        fontWeight = FontWeight.Bold
                    )
                    
                    IconButton(onClick = onDismiss) {
                        Icon(
                            imageVector = Icons.Default.Close,
                            contentDescription = "Close"
                        )
                    }
                }
                
                // Tabs
                ScrollableTabRow(
                    selectedTabIndex = selectedTab,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    tabs.forEachIndexed { index, title ->
                        Tab(
                            selected = selectedTab == index,
                            onClick = { selectedTab = index },
                            text = { Text(title) }
                        )
                    }
                }
                
                HorizontalDivider()
                
                // Tab Content
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(16.dp)
                ) {
                    when (selectedTab) {
                        0 -> ApiKeysTab(
                            apiKeys = settings.apiKeys,
                            onApiKeysChange = { onSettingsChange(settings.copy(apiKeys = it)) }
                        )
                        1 -> ReaderTab(
                            readerSettings = settings.reader,
                            onReaderSettingsChange = { onSettingsChange(settings.copy(reader = it)) }
                        )
                        2 -> AudiobookTab(
                            audiobookSettings = settings.audiobook,
                            onAudiobookSettingsChange = { onSettingsChange(settings.copy(audiobook = it)) }
                        )
                        3 -> MetadataTab(
                            metadataSettings = settings.metadata,
                            onMetadataSettingsChange = { onSettingsChange(settings.copy(metadata = it)) }
                        )
                        4 -> CloudSyncTab(
                            cloudSyncSettings = settings.cloudSync,
                            onCloudSyncSettingsChange = { onSettingsChange(settings.copy(cloudSync = it)) }
                        )
                        5 -> InterfaceTab(
                            interfaceSettings = settings.interface_,
                            onInterfaceSettingsChange = { onSettingsChange(settings.copy(interface_ = it)) }
                        )
                        6 -> ImportTab(
                            importSettings = settings.import,
                            onImportSettingsChange = { onSettingsChange(settings.copy(import = it)) }
                        )
                    }
                }
            }
        }
    }
}

// Tab 1: API Keys
@Composable
private fun ApiKeysTab(
    apiKeys: ApiKeys,
    onApiKeysChange: (ApiKeys) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        PasswordTextField(
            value = apiKeys.tmdbKey,
            onValueChange = { onApiKeysChange(apiKeys.copy(tmdbKey = it)) },
            label = "TMDB API Key",
            hint = "For movie metadata"
        )
        
        PasswordTextField(
            value = apiKeys.googleBooksKey,
            onValueChange = { onApiKeysChange(apiKeys.copy(googleBooksKey = it)) },
            label = "Google Books API Key",
            hint = "For book metadata"
        )
        
        PasswordTextField(
            value = apiKeys.comicVineKey,
            onValueChange = { onApiKeysChange(apiKeys.copy(comicVineKey = it)) },
            label = "ComicVine API Key",
            hint = "For comic metadata"
        )
        
        PasswordTextField(
            value = apiKeys.spotifyClientId,
            onValueChange = { onApiKeysChange(apiKeys.copy(spotifyClientId = it)) },
            label = "Spotify Client ID",
            hint = "For music metadata"
        )
        
        PasswordTextField(
            value = apiKeys.spotifyClientSecret,
            onValueChange = { onApiKeysChange(apiKeys.copy(spotifyClientSecret = it)) },
            label = "Spotify Client Secret",
            hint = "For music metadata"
        )
        
        OutlinedTextField(
            value = apiKeys.musicBrainzUserAgent,
            onValueChange = { onApiKeysChange(apiKeys.copy(musicBrainzUserAgent = it)) },
            label = { Text("MusicBrainz User Agent") },
            supportingText = { Text("For music metadata") },
            modifier = Modifier.fillMaxWidth()
        )
    }
}

// Tab 2: E-Reader Settings
@Composable
private fun ReaderTab(
    readerSettings: ReaderSettings,
    onReaderSettingsChange: (ReaderSettings) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text("Font Size: ${readerSettings.fontSize.toInt()}sp", style = MaterialTheme.typography.labelLarge)
        Slider(
            value = readerSettings.fontSize,
            onValueChange = { onReaderSettingsChange(readerSettings.copy(fontSize = it)) },
            valueRange = 10f..32f,
            steps = 21
        )
        
        DropdownSettingField(
            label = "Font Family",
            value = readerSettings.fontFamily.displayName,
            options = FontFamily.values().map { it.displayName },
            onValueChange = { displayName ->
                FontFamily.values().find { it.displayName == displayName }?.let { fontFamily ->
                    onReaderSettingsChange(readerSettings.copy(fontFamily = fontFamily))
                }
            }
        )
        
        DropdownSettingField(
            label = "Theme",
            value = readerSettings.theme.displayName,
            options = ReaderTheme.values().map { it.displayName },
            onValueChange = { displayName ->
                ReaderTheme.values().find { it.displayName == displayName }?.let { theme ->
                    onReaderSettingsChange(readerSettings.copy(theme = theme))
                }
            }
        )
        
        DropdownSettingField(
            label = "Page Animation",
            value = readerSettings.pageAnimation.displayName,
            options = PageAnimation.values().map { it.displayName },
            onValueChange = { displayName ->
                PageAnimation.values().find { it.displayName == displayName }?.let { animation ->
                    onReaderSettingsChange(readerSettings.copy(pageAnimation = animation))
                }
            }
        )
        
        SettingSwitch(
            label = "Hyphenation",
            checked = readerSettings.hyphenation,
            onCheckedChange = { onReaderSettingsChange(readerSettings.copy(hyphenation = it)) }
        )
        
        SettingSwitch(
            label = "Keep Screen On",
            checked = readerSettings.keepScreenOn,
            onCheckedChange = { onReaderSettingsChange(readerSettings.copy(keepScreenOn = it)) }
        )
        
        // Screen Timeout Setting (only show when Keep Screen On is enabled)
        if (readerSettings.keepScreenOn) {
            DropdownSettingField(
                label = "Screen Timeout",
                value = when (readerSettings.screenTimeoutMinutes) {
                    0 -> "System default"
                    1 -> "1 minute"
                    2 -> "2 minutes"
                    5 -> "5 minutes"
                    10 -> "10 minutes"
                    15 -> "15 minutes"
                    30 -> "30 minutes"
                    60 -> "60 minutes"
                    else -> "${readerSettings.screenTimeoutMinutes} minutes"
                },
                options = listOf(
                    "System default", "1 minute", "2 minutes", "5 minutes",
                    "10 minutes", "15 minutes", "30 minutes", "60 minutes"
                ),
                onValueChange = { displayValue ->
                    val minutes = when (displayValue) {
                        "System default" -> 0
                        "1 minute" -> 1
                        "2 minutes" -> 2
                        "5 minutes" -> 5
                        "10 minutes" -> 10
                        "15 minutes" -> 15
                        "30 minutes" -> 30
                        "60 minutes" -> 60
                        else -> 5
                    }
                    onReaderSettingsChange(readerSettings.copy(screenTimeoutMinutes = minutes))
                }
            )
        }
        
        SettingSwitch(
            label = "Volume Keys Navigation",
            checked = readerSettings.volumeKeysNavigation,
            onCheckedChange = { onReaderSettingsChange(readerSettings.copy(volumeKeysNavigation = it)) }
        )
    }
}

// Tab 3: Audiobook Settings
@Composable
private fun AudiobookTab(
    audiobookSettings: AudiobookSettings,
    onAudiobookSettingsChange: (AudiobookSettings) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text("Playback Speed: ${audiobookSettings.playbackSpeed}x", style = MaterialTheme.typography.labelLarge)
        Slider(
            value = audiobookSettings.playbackSpeed,
            onValueChange = { onAudiobookSettingsChange(audiobookSettings.copy(playbackSpeed = it)) },
            valueRange = 0.5f..3.0f,
            steps = 24
        )
        
        OutlinedTextField(
            value = audiobookSettings.sleepTimerMinutes.toString(),
            onValueChange = { 
                it.toIntOrNull()?.let { minutes ->
                    onAudiobookSettingsChange(audiobookSettings.copy(sleepTimerMinutes = minutes))
                }
            },
            label = { Text("Sleep Timer (minutes)") },
            modifier = Modifier.fillMaxWidth()
        )
        
        SettingSwitch(
            label = "Auto-Play Next Chapter",
            checked = audiobookSettings.autoPlay,
            onCheckedChange = { onAudiobookSettingsChange(audiobookSettings.copy(autoPlay = it)) }
        )
        
        SettingSwitch(
            label = "Skip Silence",
            checked = audiobookSettings.skipSilence,
            onCheckedChange = { onAudiobookSettingsChange(audiobookSettings.copy(skipSilence = it)) }
        )
        
        SettingSwitch(
            label = "Remember Position",
            checked = audiobookSettings.rememberPosition,
            onCheckedChange = { onAudiobookSettingsChange(audiobookSettings.copy(rememberPosition = it)) }
        )
    }
}

// Tab 4: Metadata Settings
@Composable
private fun MetadataTab(
    metadataSettings: MetadataSettings,
    onMetadataSettingsChange: (MetadataSettings) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        SettingSwitch(
            label = "Enable OCR",
            description = "Extract text from images",
            checked = metadataSettings.ocrEnabled,
            onCheckedChange = { onMetadataSettingsChange(metadataSettings.copy(ocrEnabled = it)) }
        )
        
        SettingSwitch(
            label = "Enable NER",
            description = "Named Entity Recognition",
            checked = metadataSettings.nerEnabled,
            onCheckedChange = { onMetadataSettingsChange(metadataSettings.copy(nerEnabled = it)) }
        )
        
        SettingSwitch(
            label = "Auto-Fetch Metadata",
            checked = metadataSettings.autoFetchMetadata,
            onCheckedChange = { onMetadataSettingsChange(metadataSettings.copy(autoFetchMetadata = it)) }
        )
        
        SettingSwitch(
            label = "Auto-Download Covers",
            checked = metadataSettings.autoDownloadCovers,
            onCheckedChange = { onMetadataSettingsChange(metadataSettings.copy(autoDownloadCovers = it)) }
        )
        
        SettingSwitch(
            label = "Comparison View",
            checked = metadataSettings.comparisonViewEnabled,
            onCheckedChange = { onMetadataSettingsChange(metadataSettings.copy(comparisonViewEnabled = it)) }
        )
        
        SettingSwitch(
            label = "Prefer Local Metadata",
            checked = metadataSettings.preferLocalMetadata,
            onCheckedChange = { onMetadataSettingsChange(metadataSettings.copy(preferLocalMetadata = it)) }
        )
    }
}

// Tab 5: Cloud Sync Settings
@Composable
private fun CloudSyncTab(
    cloudSyncSettings: CloudSyncSettings,
    onCloudSyncSettingsChange: (CloudSyncSettings) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        SettingSwitch(
            label = "Enable Cloud Sync",
            checked = cloudSyncSettings.enabled,
            onCheckedChange = { onCloudSyncSettingsChange(cloudSyncSettings.copy(enabled = it)) }
        )
        
        DropdownSettingField(
            label = "Cloud Provider",
            value = cloudSyncSettings.provider.displayName,
            options = CloudProvider.values().map { it.displayName },
            onValueChange = { displayName ->
                CloudProvider.values().find { it.displayName == displayName }?.let { provider ->
                    onCloudSyncSettingsChange(cloudSyncSettings.copy(provider = provider))
                }
            }
        )
        
        SettingSwitch(
            label = "WiFi Only",
            checked = cloudSyncSettings.syncOnWifiOnly,
            onCheckedChange = { onCloudSyncSettingsChange(cloudSyncSettings.copy(syncOnWifiOnly = it)) }
        )
        
        SettingSwitch(
            label = "Sync Metadata",
            checked = cloudSyncSettings.syncMetadata,
            onCheckedChange = { onCloudSyncSettingsChange(cloudSyncSettings.copy(syncMetadata = it)) }
        )
        
        SettingSwitch(
            label = "Sync Progress",
            checked = cloudSyncSettings.syncProgress,
            onCheckedChange = { onCloudSyncSettingsChange(cloudSyncSettings.copy(syncProgress = it)) }
        )
        
        SettingSwitch(
            label = "Auto Sync",
            checked = cloudSyncSettings.autoSync,
            onCheckedChange = { onCloudSyncSettingsChange(cloudSyncSettings.copy(autoSync = it)) }
        )
    }
}

// Tab 6: Interface Settings
@Composable
private fun InterfaceTab(
    interfaceSettings: InterfaceSettings,
    onInterfaceSettingsChange: (InterfaceSettings) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        DropdownSettingField(
            label = "Sidebar Position",
            value = interfaceSettings.sidebarPosition.displayName,
            options = SidebarPosition.values().map { it.displayName },
            onValueChange = { displayName ->
                SidebarPosition.values().find { it.displayName == displayName }?.let { position ->
                    onInterfaceSettingsChange(interfaceSettings.copy(sidebarPosition = position))
                }
            }
        )
        
        Text("Grid Columns: ${interfaceSettings.gridColumns}", style = MaterialTheme.typography.labelLarge)
        Slider(
            value = interfaceSettings.gridColumns.toFloat(),
            onValueChange = { onInterfaceSettingsChange(interfaceSettings.copy(gridColumns = it.toInt())) },
            valueRange = 2f..6f,
            steps = 3
        )
        
        DropdownSettingField(
            label = "Metallic Theme",
            value = interfaceSettings.metallicTheme.name.replace("_", " "),
            options = MetallicThemeVariant.values().map { it.name.replace("_", " ") },
            onValueChange = { displayName ->
                MetallicThemeVariant.values().find { it.name.replace("_", " ") == displayName }?.let { theme ->
                    onInterfaceSettingsChange(interfaceSettings.copy(metallicTheme = theme))
                }
            }
        )
        
        SettingSwitch(
            label = "Enable Shimmer Effects",
            checked = interfaceSettings.enableShimmerEffects,
            onCheckedChange = { onInterfaceSettingsChange(interfaceSettings.copy(enableShimmerEffects = it)) }
        )
        
        SettingSwitch(
            label = "Dynamic Colors",
            checked = interfaceSettings.dynamicColors,
            onCheckedChange = { onInterfaceSettingsChange(interfaceSettings.copy(dynamicColors = it)) }
        )
        
        SettingSwitch(
            label = "Dark Mode",
            checked = interfaceSettings.darkMode,
            onCheckedChange = { onInterfaceSettingsChange(interfaceSettings.copy(darkMode = it)) }
        )
        
        SettingSwitch(
            label = "Animations Enabled",
            checked = interfaceSettings.animationsEnabled,
            onCheckedChange = { onInterfaceSettingsChange(interfaceSettings.copy(animationsEnabled = it)) }
        )
    }
}

// Tab 7: Import Settings
@Composable
private fun ImportTab(
    importSettings: ImportSettings,
    onImportSettingsChange: (ImportSettings) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        OutlinedTextField(
            value = importSettings.calibreDatabasePath,
            onValueChange = { onImportSettingsChange(importSettings.copy(calibreDatabasePath = it)) },
            label = { Text("Calibre Database Path") },
            modifier = Modifier.fillMaxWidth()
        )
        
        OutlinedTextField(
            value = importSettings.calibreLibraryRoot,
            onValueChange = { onImportSettingsChange(importSettings.copy(calibreLibraryRoot = it)) },
            label = { Text("Calibre Library Root") },
            modifier = Modifier.fillMaxWidth()
        )
        
        SettingSwitch(
            label = "Import Metadata",
            checked = importSettings.importMetadata,
            onCheckedChange = { onImportSettingsChange(importSettings.copy(importMetadata = it)) }
        )
        
        SettingSwitch(
            label = "Import Covers",
            checked = importSettings.importCovers,
            onCheckedChange = { onImportSettingsChange(importSettings.copy(importCovers = it)) }
        )
        
        SettingSwitch(
            label = "Import Series",
            checked = importSettings.importSeries,
            onCheckedChange = { onImportSettingsChange(importSettings.copy(importSeries = it)) }
        )
        
        SettingSwitch(
            label = "Import Tags",
            checked = importSettings.importTags,
            onCheckedChange = { onImportSettingsChange(importSettings.copy(importTags = it)) }
        )
    }
}

// Helper Components

@Composable
private fun PasswordTextField(
    value: String,
    onValueChange: (String) -> Unit,
    label: String,
    hint: String,
    modifier: Modifier = Modifier
) {
    var passwordVisible by remember { mutableStateOf(false) }
    
    OutlinedTextField(
        value = value,
        onValueChange = onValueChange,
        label = { Text(label) },
        supportingText = { Text(hint) },
        visualTransformation = if (passwordVisible) VisualTransformation.None else PasswordVisualTransformation(),
        modifier = modifier.fillMaxWidth()
    )
}

@Composable
private fun SettingSwitch(
    label: String,
    checked: Boolean,
    onCheckedChange: (Boolean) -> Unit,
    description: String? = null,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = label,
                style = MaterialTheme.typography.bodyLarge
            )
            if (description != null) {
                Text(
                    text = description,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
        
        Switch(
            checked = checked,
            onCheckedChange = onCheckedChange
        )
    }
}

@Composable
private fun DropdownSettingField(
    label: String,
    value: String,
    options: List<String>,
    onValueChange: (String) -> Unit,
    modifier: Modifier = Modifier
) {
    var expanded by remember { mutableStateOf(false) }
    
    ExposedDropdownMenuBox(
        expanded = expanded,
        onExpandedChange = { expanded = !expanded },
        modifier = modifier.fillMaxWidth()
    ) {
        OutlinedTextField(
            value = value,
            onValueChange = {},
            readOnly = true,
            label = { Text(label) },
            trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded = expanded) },
            modifier = Modifier
                .fillMaxWidth()
                .menuAnchor()
        )
        
        ExposedDropdownMenu(
            expanded = expanded,
            onDismissRequest = { expanded = false }
        ) {
            options.forEach { option ->
                DropdownMenuItem(
                    text = { Text(option) },
                    onClick = {
                        onValueChange(option)
                        expanded = false
                    }
                )
            }
        }
    }
}
