package com.universalmedialibrary.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.universalmedialibrary.ui.screens.*
import com.universalmedialibrary.ui.settings.*
import com.universalmedialibrary.ui.organization.*

/**
 * Sealed class representing all navigation destinations in the app
 */
sealed class CleverFerretDestination(val route: String) {
    object Main : CleverFerretDestination("main")
    object Library : CleverFerretDestination("library")
    object ApiSettings : CleverFerretDestination("api_settings")
    object ReaderSettings : CleverFerretDestination("reader_settings")
    object SecuritySettings : CleverFerretDestination("security_settings")
    object GeneralSettings : CleverFerretDestination("general_settings")
    object IntegrationSettings : CleverFerretDestination("integration_settings")
    object APIKeysManager : CleverFerretDestination("api_keys_manager")
    object GeminiApiSettings : CleverFerretDestination("gemini_api_settings")
    object FileOrganization : CleverFerretDestination("file_organization")
    object PlexCalibreIntegration : CleverFerretDestination("plex_calibre_integration")
    object NotificationSettings : CleverFerretDestination("notification_settings")
    object AboutSettings : CleverFerretDestination("about_settings")
}

/**
 * Main navigation component for CleverFerret app
 * Implements proper navigation between all screens
 */
@Composable
fun CleverFerretNavigation(
    navController: NavHostController = rememberNavController(),
    startDestination: String = CleverFerretDestination.Main.route
) {
    NavHost(
        navController = navController,
        startDestination = startDestination
    ) {
        // Main screen with tab navigation
        composable(CleverFerretDestination.Main.route) {
            MainScreen(
                onNavigateToApiSettings = {
                    navController.navigate(CleverFerretDestination.ApiSettings.route)
                },
                onNavigateToReaderSettings = {
                    navController.navigate(CleverFerretDestination.ReaderSettings.route)
                },
                onNavigateToSecuritySettings = {
                    navController.navigate(CleverFerretDestination.SecuritySettings.route)
                },
                onNavigateToGeneralSettings = {
                    navController.navigate(CleverFerretDestination.GeneralSettings.route)
                },
                onNavigateToIntegrationSettings = {
                    navController.navigate(CleverFerretDestination.IntegrationSettings.route)
                },
                onNavigateToPlexCalibre = {
                    navController.navigate(CleverFerretDestination.PlexCalibreIntegration.route)
                },
                onNavigateToFileOrganization = {
                    navController.navigate(CleverFerretDestination.FileOrganization.route)
                }
            )
        }

        // API Settings Screen
        composable(CleverFerretDestination.ApiSettings.route) {
            ApiSettingsScreen(
                onNavigateBack = { navController.navigateUp() },
                onNavigateToAPIKeysManager = {
                    navController.navigate(CleverFerretDestination.APIKeysManager.route)
                },
                onNavigateToGeminiSettings = {
                    navController.navigate(CleverFerretDestination.GeminiApiSettings.route)
                }
            )
        }

        // Reader Settings Screen
        composable(CleverFerretDestination.ReaderSettings.route) {
            ReaderSettingsScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // Security Settings Screen
        composable(CleverFerretDestination.SecuritySettings.route) {
            SecuritySettingsScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // General Settings Screen
        composable(CleverFerretDestination.GeneralSettings.route) {
            GeneralSettingsScreen(
                onNavigateBack = { navController.navigateUp() },
                onNavigateToNotifications = {
                    navController.navigate(CleverFerretDestination.NotificationSettings.route)
                },
                onNavigateToAbout = {
                    navController.navigate(CleverFerretDestination.AboutSettings.route)
                }
            )
        }

        // Integration Settings Screen
        composable(CleverFerretDestination.IntegrationSettings.route) {
            IntegrationSettingsScreen(
                onNavigateBack = { navController.navigateUp() },
                onNavigateToPlexCalibre = {
                    navController.navigate(CleverFerretDestination.PlexCalibreIntegration.route)
                }
            )
        }

        // API Keys Manager Screen
        composable(CleverFerretDestination.APIKeysManager.route) {
            APIKeysManagerScreen(
                navController = navController
            )
        }

        // Gemini AI Settings Screen
        composable(CleverFerretDestination.GeminiApiSettings.route) {
            GeminiApiSettingsScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // File Organization Screen
        composable(CleverFerretDestination.FileOrganization.route) {
            FileOrganizationScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // Plex & Calibre Integration Screen
        composable(CleverFerretDestination.PlexCalibreIntegration.route) {
            PlexCalibreIntegrationScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // Notification Settings Screen
        composable(CleverFerretDestination.NotificationSettings.route) {
            NotificationSettingsScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // About Settings Screen
        composable(CleverFerretDestination.AboutSettings.route) {
            AboutSettingsScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }
    }
}