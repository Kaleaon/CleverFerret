package com.universalmedialibrary.ui.media.navigation

import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import androidx.navigation.NavGraphBuilder
import androidx.navigation.compose.composable
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.ui.components.NavigationItems
import com.universalmedialibrary.ui.main.MainViewModel
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.toCleverFerretTheme

internal fun NavGraphBuilder.addSettingsRoutes(navController: NavController) {
    composable(MediaRoutes.SETTINGS) {
        com.universalmedialibrary.ui.settings.SettingsScreen(
            onBack = { navController.popBackStack() },
            navController = navController,
            availableBottomItems = NavigationItems.items
        )
    }

    // --- Category Landing Hub Sub-Pages ---
    composable(MediaRoutes.SETTINGS_HUB_APPEARANCE) {
        com.universalmedialibrary.ui.settings.AppearanceHubScreen(
            onBack = { navController.popBackStack() },
            navController = navController,
            availableBottomItems = NavigationItems.items
        )
    }

    composable(MediaRoutes.SETTINGS_HUB_LIBRARY) {
        com.universalmedialibrary.ui.settings.LibraryHubScreen(
            onBack = { navController.popBackStack() },
            navController = navController
        )
    }

    composable(MediaRoutes.SETTINGS_HUB_PLAYBACK) {
        com.universalmedialibrary.ui.settings.PlaybackHubScreen(
            onBack = { navController.popBackStack() },
            navController = navController
        )
    }

    composable(MediaRoutes.SETTINGS_HUB_INTEGRATIONS) {
        com.universalmedialibrary.ui.settings.IntegrationsHubScreen(
            onBack = { navController.popBackStack() },
            navController = navController
        )
    }

    composable(MediaRoutes.SETTINGS_HUB_SYSTEM) {
        com.universalmedialibrary.ui.settings.SystemHubScreen(
            onBack = { navController.popBackStack() },
            navController = navController
        )
    }

    // --- Developer Settings (Debug builds only) ---
    if (BuildConfig.DEBUG) {
        composable(MediaRoutes.SETTINGS_DEVELOPER) {
            com.universalmedialibrary.ui.settings.FeatureFlagsSettingsScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }
        composable(MediaRoutes.SETTINGS_FEATURES) {
            com.universalmedialibrary.ui.settings.FeatureFlagsSettingsScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }
    }

    // --- Specific Detail Settings Pages ---
    composable(MediaRoutes.SETTINGS_API) {
        com.universalmedialibrary.ui.settings.APISettingsScreen(
            onNavigateBack = { navController.popBackStack() }
        )
    }

    composable(MediaRoutes.SETTINGS_APPEARANCE) {
        com.universalmedialibrary.ui.settings.AppearanceSettingsScreen(
            onBack = { navController.popBackStack() },
            navController = navController
        )
    }

    composable("settings/social") {
        com.universalmedialibrary.ui.settings.SocialIntegrationsSettingsScreen(
            onBack = { navController.popBackStack() },
            navController = navController
        )
    }

    composable("settings/metadata") {
        com.universalmedialibrary.ui.settings.MetadataSettingsScreen(
            onBack = { navController.popBackStack() },
            navController = navController
        )
    }

    composable("settings/auto-scan") {
        com.universalmedialibrary.ui.settings.AutoScanSettingsScreen(
            onBack = { navController.popBackStack() }
        )
    }

    composable("settings/display") {
        com.universalmedialibrary.ui.settings.DisplaySettingsScreen(
            onBack = { navController.popBackStack() },
            navController = navController
        )
    }

    composable("settings/downloads") {
        com.universalmedialibrary.ui.settings.DownloadsSettingsScreen(
            onBack = { navController.popBackStack() }
        )
    }

    composable("settings/cache") {
        com.universalmedialibrary.ui.settings.CacheSettingsScreen(
            onBack = { navController.popBackStack() }
        )
    }

    composable("settings/privacy") {
        com.universalmedialibrary.ui.settings.PrivacySettingsScreen(
            onBack = { navController.popBackStack() }
        )
    }

    composable("settings/casting") {
        com.universalmedialibrary.ui.settings.CastingSettingsScreen(
            onBack = { navController.popBackStack() }
        )
    }

    composable("settings/feedback") {
        com.universalmedialibrary.ui.settings.FeedbackSettingsScreen(
            onBack = { navController.popBackStack() }
        )
    }

    composable("theme_showcase") {
        val mainViewModel: MainViewModel = hiltViewModel()
        val selectedTheme by mainViewModel.selectedTheme.collectAsState(CleverFerretTheme.NAVY_GOLD)

        com.universalmedialibrary.ui.screens.ThemeShowcaseScreen(
            currentTheme = selectedTheme,
            onThemeSelected = { newTheme ->
                mainViewModel.setTheme(newTheme)
            },
            onNavigateBack = { navController.popBackStack() }
        )
    }

    composable("advanced_effects_showcase") {
        com.universalmedialibrary.ui.screens.AdvancedEffectsShowcaseScreen()
    }

    composable("settings/import_sorter") {
        com.universalmedialibrary.ui.settings.ImportSorterScreen(
            onBack = { navController.popBackStack() }
        )
    }

    composable("settings/import_history") {
        com.universalmedialibrary.ui.settings.ImportHistoryScreen(
            onBack = { navController.popBackStack() }
        )
    }

    composable("settings/import_export") {
        com.universalmedialibrary.ui.settings.ImportExportScreen(
            onNavigateBack = { navController.popBackStack() }
        )
    }

    composable(MediaRoutes.SETTINGS_MEDIA_SERVERS) {
        com.universalmedialibrary.ui.settings.MediaServerSettingsScreen(
            onBack = { navController.popBackStack() }
        )
    }

    composable(MediaRoutes.SETTINGS_NETWORK_STORAGE) {
        com.universalmedialibrary.ui.settings.NetworkStorageSettingsScreen(
            onBack = { navController.popBackStack() }
        )
    }

    composable(MediaRoutes.SETTINGS_PLAYBACK) {
        val vm: com.universalmedialibrary.ui.settings.AudioEffectsViewModel = hiltViewModel()
        com.universalmedialibrary.ui.settings.AudioEffectsSettingsScreen(
            viewModel = vm,
            onNavigateBack = { navController.popBackStack() },
            onNavigateToShowcase = { navController.navigate("advanced_effects_showcase") }
        )
    }

    composable("settings/audio_profiles") {
        com.universalmedialibrary.ui.settings.AudioProfilesScreen(
            onNavigateBack = { navController.popBackStack() }
        )
    }

    composable("settings/lastfm") {
        com.universalmedialibrary.ui.settings.LastFmSettingsScreen(
            onNavigateBack = { navController.popBackStack() }
        )
    }

    composable(MediaRoutes.SETTINGS_TTS_PROVIDER) {
        com.universalmedialibrary.ui.settings.TtsProviderSettingsScreen(
            onBack = { navController.popBackStack() }
        )
    }

    composable(MediaRoutes.SETTINGS_PARENTAL) {
        com.universalmedialibrary.ui.settings.ParentalControlsScreen(
            navController = navController
        )
    }

    composable(MediaRoutes.SETTINGS_STORAGE) {
        com.universalmedialibrary.ui.settings.StorageOrganizerScreen(
            onBack = { navController.popBackStack() }
        )
    }

    composable(MediaRoutes.SETTINGS_READER) {
        com.universalmedialibrary.ui.settings.ReaderSettingsScreen(
            navController = navController,
            settingsType = "visual"
        )
    }

    composable(MediaRoutes.SETTINGS_SECURITY) {
        com.universalmedialibrary.ui.settings.SecuritySettingsScreen(
            navController = navController
        )
    }

    composable(MediaRoutes.SETTINGS_ABOUT) {
        com.universalmedialibrary.ui.settings.AboutScreen(
            navController = navController
        )
    }

    composable(MediaRoutes.SETTINGS_PAYWALL_THEMES) {
        com.universalmedialibrary.ui.settings.paywall.ThemePaywallSubpage(
            onNavigateBack = { navController.popBackStack() }
        )
    }

    composable(MediaRoutes.SETTINGS_PAYWALL_SCANNER) {
        com.universalmedialibrary.ui.settings.paywall.ScannerPaywallSubpage(
            onNavigateBack = { navController.popBackStack() }
        )
    }

    composable(MediaRoutes.SETTINGS_PAYWALL_CLOUD) {
        com.universalmedialibrary.ui.settings.paywall.CloudPaywallSubpage(
            onNavigateBack = { navController.popBackStack() }
        )
    }

    composable("ambient/theme_manager") {
        com.universalmedialibrary.ui.ambient.ThemeManagerScreen(
            onBack = { navController.popBackStack() }
        )
    }

    composable("ambient/import") {
        com.universalmedialibrary.ui.ambient.AudioPackImportScreen(
            onBack = { navController.popBackStack() }
        )
    }

    composable("fanfiction_hub") {
        com.universalmedialibrary.ui.webfiction.UnifiedFanfictionHubScreen(
            navController = navController
        )
    }
}
