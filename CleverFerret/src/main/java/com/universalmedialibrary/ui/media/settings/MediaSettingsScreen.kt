package com.universalmedialibrary.ui.media.settings

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.api.plugin.*
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric Settings Screen
 * 
 * A beautiful, modular settings interface that allows users to:
 * - Configure API providers and their capabilities
 * - Manage integrations (Plex, Jellyfin, Calibre, etc.)
 * - Customize appearance and themes
 * - Configure playback preferences
 * - Manage parental controls
 * - View storage and cache
 */

/**
 * Overloaded MediaSettingsScreen that handles navigation via route strings
 * and provides default state. Used by navigation system.
 */
@Composable
fun MediaSettingsScreen(
    onNavigateToSubScreen: (String) -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    // Use default state - in production this would come from a ViewModel
    val state = remember {
        SettingsState(
            configuredProviders = 0,
            libraryFolders = 0,
            currentTheme = "Classic Dark",
            textSize = "Medium",
            ttsProvider = "System Default",
            appLockEnabled = false,
            parentalControlsEnabled = false,
            storageUsed = "0 MB",
            cacheSize = "0 MB",
            appVersion = BuildConfig.VERSION_NAME
        )
    }
    
    MediaSettingsScreen(
        state = state,
        onNavigateToSection = { section ->
            onNavigateToSubScreen(section.toRoute())
        },
        onBackClick = onBackClick,
        modifier = modifier
    )
}

/**
 * Convert SettingsSection to navigation route
 */
private fun SettingsSection.toRoute(): String {
    return when (this) {
        SettingsSection.API_PROVIDERS -> "settings/api"
        SettingsSection.MEDIA_SERVERS -> "settings/media-servers"
        SettingsSection.CLOUD_STORAGE -> "settings/cloud"
        SettingsSection.SOCIAL -> "settings/social"
        SettingsSection.LIBRARY_FOLDERS -> "file-browser"
        SettingsSection.AUTO_SCAN -> "settings/auto-scan"
        SettingsSection.METADATA -> "settings/metadata"
        SettingsSection.THEME -> "settings/appearance"
        SettingsSection.DISPLAY -> "settings/display"
        SettingsSection.TEXT_SIZE -> "settings/text-size"
        SettingsSection.AUDIO -> "settings/playback"
        SettingsSection.TTS -> "settings/tts"
        SettingsSection.READER -> "settings/reader"
        SettingsSection.CASTING -> "settings/casting"
        SettingsSection.APP_LOCK -> "settings/security"
        SettingsSection.PARENTAL_CONTROLS -> "settings/parental"
        SettingsSection.PRIVACY -> "settings/privacy"
        SettingsSection.STORAGE -> "settings/storage"
        SettingsSection.CACHE -> "settings/cache"
        SettingsSection.DOWNLOADS -> "settings/downloads"
        SettingsSection.ABOUT -> "settings/about"
        SettingsSection.FEEDBACK -> "settings/feedback"
        SettingsSection.DEBUG_MENU -> "debug"
    }
}

@Composable
fun MediaSettingsScreen(
    state: SettingsState,
    onNavigateToSection: (SettingsSection) -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .fillMaxSize()
            .background(MediaColors.Background)
    ) {
        // Top Bar
        SettingsTopBar(
            title = "Settings",
            onBackClick = onBackClick
        )
        
        // Settings sections
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(MediaSpacing.ScreenHorizontal),
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            // API & Integrations Section
            item {
                SettingsSectionHeader(title = "API & Integrations")
            }
            
            item {
                SettingsCard {
                    SettingsItem(
                        icon = Icons.Outlined.Api,
                        iconColor = MediaColors.AccentPrimary,
                        title = "API Providers",
                        subtitle = "${state.configuredProviders} providers configured",
                        onClick = { onNavigateToSection(SettingsSection.API_PROVIDERS) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.Dns,
                        iconColor = MediaColors.MediaTypes.Movie,
                        title = "Media Servers",
                        subtitle = "Plex, Jellyfin, Emby, Calibre",
                        onClick = { onNavigateToSection(SettingsSection.MEDIA_SERVERS) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.Cloud,
                        iconColor = MediaColors.MediaTypes.Music,
                        title = "Cloud Storage",
                        subtitle = "Google Drive, Dropbox, OneDrive",
                        onClick = { onNavigateToSection(SettingsSection.CLOUD_STORAGE) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.Share,
                        iconColor = MediaColors.MediaTypes.Book,
                        title = "Social Integrations",
                        subtitle = "Goodreads, Last.fm, Trakt",
                        onClick = { onNavigateToSection(SettingsSection.SOCIAL) }
                    )
                }
            }
            
            // Library Section
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.LG))
                SettingsSectionHeader(title = "Library")
            }
            
            item {
                SettingsCard {
                    SettingsItem(
                        icon = Icons.Outlined.Folder,
                        iconColor = MediaColors.AccentSecondary,
                        title = "Library Folders",
                        subtitle = "${state.libraryFolders} folders configured",
                        onClick = { onNavigateToSection(SettingsSection.LIBRARY_FOLDERS) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.Refresh,
                        iconColor = MediaColors.Info,
                        title = "Auto-Scan Settings",
                        subtitle = "Scan interval, file types",
                        onClick = { onNavigateToSection(SettingsSection.AUTO_SCAN) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.Tag,
                        iconColor = MediaColors.Warning,
                        title = "Metadata Preferences",
                        subtitle = "Auto-fetch, preferred sources",
                        onClick = { onNavigateToSection(SettingsSection.METADATA) }
                    )
                }
            }
            
            // Appearance Section
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.LG))
                SettingsSectionHeader(title = "Appearance")
            }
            
            item {
                SettingsCard {
                    SettingsItem(
                        icon = Icons.Outlined.Palette,
                        iconColor = MediaColors.AccentPrimary,
                        title = "Theme",
                        subtitle = state.currentTheme,
                        onClick = { onNavigateToSection(SettingsSection.THEME) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.GridView,
                        iconColor = MediaColors.AccentSecondary,
                        title = "Display Options",
                        subtitle = "Grid size, card style",
                        onClick = { onNavigateToSection(SettingsSection.DISPLAY) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.TextFields,
                        iconColor = MediaColors.AccentTertiary,
                        title = "Text Size",
                        subtitle = state.textSize,
                        onClick = { onNavigateToSection(SettingsSection.TEXT_SIZE) }
                    )
                }
            }
            
            // Playback Section
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.LG))
                SettingsSectionHeader(title = "Playback")
            }
            
            item {
                SettingsCard {
                    SettingsItem(
                        icon = Icons.Outlined.Headphones,
                        iconColor = MediaColors.MediaTypes.Audiobook,
                        title = "Audio Settings",
                        subtitle = "Equalizer, effects, ReplayGain",
                        onClick = { onNavigateToSection(SettingsSection.AUDIO) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.RecordVoiceOver,
                        iconColor = MediaColors.MediaTypes.Podcast,
                        title = "Text-to-Speech",
                        subtitle = state.ttsProvider,
                        onClick = { onNavigateToSection(SettingsSection.TTS) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.MenuBook,
                        iconColor = MediaColors.MediaTypes.Book,
                        title = "Reader Settings",
                        subtitle = "Font, margins, brightness",
                        onClick = { onNavigateToSection(SettingsSection.READER) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.Cast,
                        iconColor = MediaColors.MediaTypes.Movie,
                        title = "Casting",
                        subtitle = "Chromecast, DLNA settings",
                        onClick = { onNavigateToSection(SettingsSection.CASTING) }
                    )
                }
            }
            
            // Privacy & Security Section
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.LG))
                SettingsSectionHeader(title = "Privacy & Security")
            }
            
            item {
                SettingsCard {
                    SettingsItem(
                        icon = Icons.Outlined.Lock,
                        iconColor = MediaColors.Error,
                        title = "App Lock",
                        subtitle = if (state.appLockEnabled) "Enabled" else "Disabled",
                        onClick = { onNavigateToSection(SettingsSection.APP_LOCK) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.ChildCare,
                        iconColor = MediaColors.Warning,
                        title = "Parental Controls",
                        subtitle = if (state.parentalControlsEnabled) "Enabled" else "Disabled",
                        onClick = { onNavigateToSection(SettingsSection.PARENTAL_CONTROLS) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.History,
                        iconColor = MediaColors.TextSecondary,
                        title = "Privacy",
                        subtitle = "History, analytics, data",
                        onClick = { onNavigateToSection(SettingsSection.PRIVACY) }
                    )
                }
            }
            
            // Storage Section
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.LG))
                SettingsSectionHeader(title = "Storage")
            }
            
            item {
                SettingsCard {
                    SettingsItem(
                        icon = Icons.Outlined.Storage,
                        iconColor = MediaColors.Info,
                        title = "Storage Usage",
                        subtitle = state.storageUsed,
                        onClick = { onNavigateToSection(SettingsSection.STORAGE) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.DeleteSweep,
                        iconColor = MediaColors.Error,
                        title = "Clear Cache",
                        subtitle = state.cacheSize,
                        onClick = { onNavigateToSection(SettingsSection.CACHE) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.Download,
                        iconColor = MediaColors.Success,
                        title = "Download Settings",
                        subtitle = "Download location, quality",
                        onClick = { onNavigateToSection(SettingsSection.DOWNLOADS) }
                    )
                }
            }
            
            // About Section
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.LG))
                SettingsSectionHeader(title = "About")
            }
            
            item {
                SettingsCard {
                    SettingsItem(
                        icon = Icons.Outlined.Info,
                        iconColor = MediaColors.AccentPrimary,
                        title = "About CleverFerret",
                        subtitle = "Version ${state.appVersion}",
                        onClick = { onNavigateToSection(SettingsSection.ABOUT) }
                    )
                    SettingsDivider()
                    SettingsItem(
                        icon = Icons.Outlined.BugReport,
                        iconColor = MediaColors.Warning,
                        title = "Report an Issue",
                        subtitle = "Send feedback or bug reports",
                        onClick = { onNavigateToSection(SettingsSection.FEEDBACK) }
                    )
                }
            }
            
            // Debug Section (only visible in debug builds)
            if (BuildConfig.SHOW_DEBUG_MENU) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.LG))
                    SettingsSectionHeader(title = "Developer")
                }
                
                item {
                    SettingsCard {
                        SettingsItem(
                            icon = Icons.Outlined.Code,
                            iconColor = Color(0xFF4CAF50),
                            title = "Debug Menu",
                            subtitle = "Crash reports, logs, feature flags",
                            onClick = { onNavigateToSection(SettingsSection.DEBUG_MENU) }
                        )
                        SettingsDivider()
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(MediaSpacing.MD),
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Column {
                                Text(
                                    text = "Build Info",
                                    style = MediaTypography.BodySmall,
                                    color = MediaColors.TextSecondary
                                )
                                Text(
                                    text = "Git: ${BuildConfig.GIT_COMMIT}",
                                    style = MediaTypography.LabelSmall,
                                    color = MediaColors.TextTertiary
                                )
                            }
                            Surface(
                                shape = RoundedCornerShape(4.dp),
                                color = Color(0xFF4CAF50).copy(alpha = 0.2f)
                            ) {
                                Text(
                                    text = "DEBUG",
                                    modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                                    style = MediaTypography.LabelSmall,
                                    fontWeight = FontWeight.Bold,
                                    color = Color(0xFF4CAF50)
                                )
                            }
                        }
                    }
                }
            }
            
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.Huge))
            }
        }
    }
}

// =============================================================================
// API PROVIDERS SETTINGS
// =============================================================================

@Composable
fun ApiProvidersSettingsScreen(
    state: ApiProvidersState,
    onProviderClick: (ApiProvider) -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .fillMaxSize()
            .background(MediaColors.Background)
    ) {
        SettingsTopBar(
            title = "API Providers",
            onBackClick = onBackClick
        )
        
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(MediaSpacing.ScreenHorizontal),
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            // Group providers by category
            val providersByCategory = state.allProviders.groupBy { provider ->
                when {
                    provider.supportedCapabilities.any { 
                        it in listOf(ApiCapability.BOOK_METADATA, ApiCapability.AUDIOBOOK_METADATA) 
                    } -> "Books & Audiobooks"
                    provider.supportedCapabilities.any { 
                        it in listOf(ApiCapability.MOVIE_METADATA, ApiCapability.TV_METADATA) 
                    } -> "Movies & TV"
                    provider.supportedCapabilities.any { 
                        it in listOf(ApiCapability.MUSIC_METADATA, ApiCapability.SCROBBLING) 
                    } -> "Music"
                    provider.supportedCapabilities.any { 
                        it == ApiCapability.PODCAST_METADATA 
                    } -> "Podcasts"
                    provider.supportedCapabilities.any { 
                        it in listOf(ApiCapability.LIBRARY_SYNC, ApiCapability.VIDEO_STREAM) 
                    } -> "Media Servers"
                    provider.supportedCapabilities.any { 
                        it in listOf(ApiCapability.TTS, ApiCapability.TRANSLATION) 
                    } -> "AI & Cloud Services"
                    else -> "Other"
                }
            }
            
            providersByCategory.forEach { (category, providers) ->
                item {
                    SettingsSectionHeader(title = category)
                }
                
                item {
                    SettingsCard {
                        providers.forEachIndexed { index, provider ->
                            val isConfigured = provider.id in state.configuredProviderIds
                            
                            ApiProviderItem(
                                provider = provider,
                                isConfigured = isConfigured,
                                onClick = { onProviderClick(provider) }
                            )
                            
                            if (index < providers.size - 1) {
                                SettingsDivider()
                            }
                        }
                    }
                }
                
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.MD))
                }
            }
        }
    }
}

@Composable
private fun ApiProviderItem(
    provider: ApiProvider,
    isConfigured: Boolean,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(MediaSpacing.MD),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Provider icon placeholder
        Surface(
            shape = RoundedCornerShape(MediaCorners.SM),
            color = if (isConfigured) MediaColors.Success.copy(alpha = 0.15f) 
                   else MediaColors.BackgroundSurface,
            modifier = Modifier.size(48.dp)
        ) {
            Icon(
                imageVector = if (isConfigured) Icons.Filled.CheckCircle else Icons.Outlined.Api,
                contentDescription = null,
                modifier = Modifier.padding(MediaSpacing.SM),
                tint = if (isConfigured) MediaColors.Success else MediaColors.TextSecondary
            )
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Text(
                    text = provider.name,
                    style = MediaTypography.BodyLarge,
                    color = MediaColors.TextPrimary,
                    fontWeight = FontWeight.Medium
                )
                
                if (provider.requiresApiKey || provider.requiresOAuth) {
                    Spacer(modifier = Modifier.width(MediaSpacing.SM))
                    Surface(
                        shape = RoundedCornerShape(MediaCorners.XS),
                        color = MediaColors.Warning.copy(alpha = 0.15f)
                    ) {
                        Text(
                            text = if (provider.requiresOAuth) "OAuth" else "API Key",
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.Warning,
                            modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 2.dp)
                        )
                    }
                }
                
                if (!provider.isFree) {
                    Spacer(modifier = Modifier.width(MediaSpacing.XS))
                    Surface(
                        shape = RoundedCornerShape(MediaCorners.XS),
                        color = MediaColors.AccentPrimary.copy(alpha = 0.15f)
                    ) {
                        Text(
                            text = "Premium",
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.AccentPrimary,
                            modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 2.dp)
                        )
                    }
                }
            }
            
            Text(
                text = provider.description,
                style = MediaTypography.BodySmall,
                color = MediaColors.TextSecondary
            )
            
            // Show capabilities count
            Text(
                text = "${provider.supportedCapabilities.size} capabilities",
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextTertiary
            )
        }
        
        Icon(
            imageVector = Icons.Default.ChevronRight,
            contentDescription = null,
            tint = MediaColors.TextTertiary
        )
    }
}

// =============================================================================
// PROVIDER CONFIGURATION SCREEN
// =============================================================================

@Composable
fun ProviderConfigurationScreen(
    provider: ApiProvider,
    configuration: ApiConfiguration?,
    onSave: (ApiConfiguration) -> Unit,
    onDelete: () -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    var apiKey by remember { mutableStateOf(configuration?.apiKey ?: "") }
    var serverUrl by remember { mutableStateOf(configuration?.serverUrl ?: "") }
    var enabledCapabilities by remember { 
        mutableStateOf(configuration?.enabledCapabilities ?: provider.supportedCapabilities) 
    }
    var isEnabled by remember { mutableStateOf(configuration?.isEnabled ?: true) }
    var showApiKey by remember { mutableStateOf(false) }
    
    Column(
        modifier = modifier
            .fillMaxSize()
            .background(MediaColors.Background)
    ) {
        SettingsTopBar(
            title = provider.name,
            onBackClick = onBackClick,
            actions = {
                if (configuration != null) {
                    IconButton(onClick = onDelete) {
                        Icon(
                            imageVector = Icons.Default.Delete,
                            contentDescription = "Delete",
                            tint = MediaColors.Error
                        )
                    }
                }
            }
        )
        
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(MediaSpacing.ScreenHorizontal),
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            // Provider info
            item {
                Surface(
                    shape = RoundedCornerShape(MediaCorners.Card),
                    color = MediaColors.BackgroundElevated
                ) {
                    Column(
                        modifier = Modifier.padding(MediaSpacing.MD)
                    ) {
                        Text(
                            text = provider.description,
                            style = MediaTypography.BodyMedium,
                            color = MediaColors.TextSecondary
                        )
                        
                        Spacer(modifier = Modifier.height(MediaSpacing.SM))
                        
                        Text(
                            text = provider.website,
                            style = MediaTypography.BodySmall,
                            color = MediaColors.AccentPrimary
                        )
                    }
                }
            }
            
            // Enable/Disable toggle
            item {
                SettingsCard {
                    SettingsToggleItem(
                        title = "Enable ${provider.name}",
                        subtitle = "Use this provider for configured capabilities",
                        isChecked = isEnabled,
                        onCheckedChange = { isEnabled = it }
                    )
                }
            }
            
            // Credentials section
            if (provider.requiresApiKey || provider.requiresOAuth || provider.id in listOf("plex", "jellyfin", "emby", "calibre")) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.MD))
                    SettingsSectionHeader(title = "Credentials")
                }
                
                item {
                    SettingsCard {
                        if (provider.requiresApiKey) {
                            Column(modifier = Modifier.padding(MediaSpacing.MD)) {
                                Text(
                                    text = "API Key",
                                    style = MediaTypography.LabelMedium,
                                    color = MediaColors.TextSecondary
                                )
                                
                                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                                
                                OutlinedTextField(
                                    value = apiKey,
                                    onValueChange = { apiKey = it },
                                    modifier = Modifier.fillMaxWidth(),
                                    placeholder = { Text("Enter your API key") },
                                    visualTransformation = if (showApiKey) 
                                        VisualTransformation.None 
                                    else 
                                        PasswordVisualTransformation(),
                                    trailingIcon = {
                                        IconButton(onClick = { showApiKey = !showApiKey }) {
                                            Icon(
                                                imageVector = if (showApiKey) 
                                                    Icons.Default.VisibilityOff 
                                                else 
                                                    Icons.Default.Visibility,
                                                contentDescription = null
                                            )
                                        }
                                    },
                                    colors = OutlinedTextFieldDefaults.colors(
                                        focusedBorderColor = MediaColors.AccentPrimary,
                                        unfocusedBorderColor = MediaColors.Border
                                    ),
                                    shape = RoundedCornerShape(MediaCorners.SM)
                                )
                            }
                        }
                        
                        if (provider.id in listOf("plex", "jellyfin", "emby", "calibre")) {
                            if (provider.requiresApiKey) {
                                SettingsDivider()
                            }
                            
                            Column(modifier = Modifier.padding(MediaSpacing.MD)) {
                                Text(
                                    text = "Server URL",
                                    style = MediaTypography.LabelMedium,
                                    color = MediaColors.TextSecondary
                                )
                                
                                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                                
                                OutlinedTextField(
                                    value = serverUrl,
                                    onValueChange = { serverUrl = it },
                                    modifier = Modifier.fillMaxWidth(),
                                    placeholder = { Text("https://your-server.com") },
                                    colors = OutlinedTextFieldDefaults.colors(
                                        focusedBorderColor = MediaColors.AccentPrimary,
                                        unfocusedBorderColor = MediaColors.Border
                                    ),
                                    shape = RoundedCornerShape(MediaCorners.SM)
                                )
                            }
                        }
                    }
                }
            }
            
            // Capabilities section
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.MD))
                SettingsSectionHeader(title = "Capabilities")
                
                Text(
                    text = "Select which features to use from ${provider.name}",
                    style = MediaTypography.BodySmall,
                    color = MediaColors.TextTertiary,
                    modifier = Modifier.padding(top = MediaSpacing.XS)
                )
            }
            
            // Group capabilities by category
            val capabilitiesByCategory = provider.supportedCapabilities.groupBy { it.category }
            
            capabilitiesByCategory.forEach { (category, capabilities) ->
                item {
                    Text(
                        text = category.displayName,
                        style = MediaTypography.LabelMedium,
                        color = MediaColors.TextSecondary,
                        modifier = Modifier.padding(top = MediaSpacing.MD, bottom = MediaSpacing.XS)
                    )
                }
                
                item {
                    SettingsCard {
                        capabilities.forEachIndexed { index, capability ->
                            SettingsToggleItem(
                                title = capability.displayName,
                                subtitle = capability.description,
                                isChecked = capability in enabledCapabilities,
                                onCheckedChange = { checked ->
                                    enabledCapabilities = if (checked) {
                                        enabledCapabilities + capability
                                    } else {
                                        enabledCapabilities - capability
                                    }
                                }
                            )
                            
                            if (index < capabilities.size - 1) {
                                SettingsDivider()
                            }
                        }
                    }
                }
            }
            
            // Save button
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.LG))
                
                Button(
                    onClick = {
                        onSave(
                            ApiConfiguration(
                                providerId = provider.id,
                                apiKey = apiKey.takeIf { it.isNotBlank() },
                                serverUrl = serverUrl.takeIf { it.isNotBlank() },
                                enabledCapabilities = enabledCapabilities,
                                isEnabled = isEnabled
                            )
                        )
                    },
                    modifier = Modifier.fillMaxWidth(),
                    colors = ButtonDefaults.buttonColors(
                        containerColor = MediaColors.AccentPrimary
                    ),
                    shape = RoundedCornerShape(MediaCorners.Button)
                ) {
                    Text(
                        text = "Save Configuration",
                        style = MediaTypography.LabelLarge,
                        modifier = Modifier.padding(vertical = MediaSpacing.SM)
                    )
                }
            }
            
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.Huge))
            }
        }
    }
}

// =============================================================================
// SETTINGS COMPONENTS
// =============================================================================

@Composable
private fun SettingsTopBar(
    title: String,
    onBackClick: () -> Unit,
    actions: @Composable RowScope.() -> Unit = {}
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MediaColors.BackgroundElevated
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .statusBarsPadding()
                .padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.SM),
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(onClick = onBackClick) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = MediaColors.TextPrimary
                )
            }
            
            Text(
                text = title,
                style = MediaTypography.TitleMedium,
                color = MediaColors.TextPrimary,
                modifier = Modifier.weight(1f)
            )
            
            actions()
        }
    }
}

@Composable
private fun SettingsSectionHeader(title: String) {
    Text(
        text = title.uppercase(),
        style = MediaTypography.LabelSmall,
        color = MediaColors.TextTertiary,
        fontWeight = FontWeight.SemiBold,
        letterSpacing = MediaTypography.LabelSmall.letterSpacing * 1.5f,
        modifier = Modifier.padding(start = MediaSpacing.SM, top = MediaSpacing.MD)
    )
}

@Composable
private fun SettingsCard(
    content: @Composable ColumnScope.() -> Unit
) {
    Surface(
        shape = RoundedCornerShape(MediaCorners.Card),
        color = MediaColors.BackgroundElevated
    ) {
        Column(content = content)
    }
}

@Composable
private fun SettingsItem(
    icon: ImageVector,
    iconColor: Color,
    title: String,
    subtitle: String,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(MediaSpacing.MD),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Surface(
            shape = CircleShape,
            color = iconColor.copy(alpha = 0.15f),
            modifier = Modifier.size(40.dp)
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                modifier = Modifier.padding(MediaSpacing.SM),
                tint = iconColor
            )
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = title,
                style = MediaTypography.BodyLarge,
                color = MediaColors.TextPrimary
            )
            Text(
                text = subtitle,
                style = MediaTypography.BodySmall,
                color = MediaColors.TextSecondary
            )
        }
        
        Icon(
            imageVector = Icons.Default.ChevronRight,
            contentDescription = null,
            tint = MediaColors.TextTertiary
        )
    }
}

@Composable
private fun SettingsToggleItem(
    title: String,
    subtitle: String,
    isChecked: Boolean,
    onCheckedChange: (Boolean) -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable { onCheckedChange(!isChecked) }
            .padding(MediaSpacing.MD),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = title,
                style = MediaTypography.BodyLarge,
                color = MediaColors.TextPrimary
            )
            Text(
                text = subtitle,
                style = MediaTypography.BodySmall,
                color = MediaColors.TextSecondary
            )
        }
        
        Switch(
            checked = isChecked,
            onCheckedChange = onCheckedChange,
            colors = SwitchDefaults.colors(
                checkedThumbColor = MediaColors.AccentPrimary,
                checkedTrackColor = MediaColors.AccentPrimary.copy(alpha = 0.5f)
            )
        )
    }
}

@Composable
private fun SettingsDivider() {
    HorizontalDivider(
        color = MediaColors.Divider,
        modifier = Modifier.padding(start = 72.dp)
    )
}

// =============================================================================
// STATE MODELS
// =============================================================================

enum class SettingsSection {
    API_PROVIDERS,
    MEDIA_SERVERS,
    CLOUD_STORAGE,
    SOCIAL,
    LIBRARY_FOLDERS,
    AUTO_SCAN,
    METADATA,
    THEME,
    DISPLAY,
    TEXT_SIZE,
    AUDIO,
    TTS,
    READER,
    CASTING,
    APP_LOCK,
    PARENTAL_CONTROLS,
    PRIVACY,
    STORAGE,
    CACHE,
    DOWNLOADS,
    ABOUT,
    FEEDBACK,
    DEBUG_MENU
}

data class SettingsState(
    val configuredProviders: Int = 0,
    val libraryFolders: Int = 0,
    val currentTheme: String = "Classic Dark",
    val textSize: String = "Medium",
    val ttsProvider: String = "System Default",
    val appLockEnabled: Boolean = false,
    val parentalControlsEnabled: Boolean = false,
    val storageUsed: String = "0 MB",
    val cacheSize: String = "0 MB",
    val appVersion: String = "1.0.0"
)

data class ApiProvidersState(
    val allProviders: List<ApiProvider> = ApiProviderRegistry.allProviders,
    val configuredProviderIds: Set<String> = emptySet()
)
