package com.universalmedialibrary.ui.settings

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.NavController
import com.universalmedialibrary.ui.reader.ReaderSettingsScreen as MasterReaderSettingsScreen

/**
 * Wrapper for the consolidated ReaderSettingsScreen.
 * This ensures backward compatibility with the Settings navigation graph.
 *
 * @param settingsType Optional parameter to highlight/scroll to specific section (currently unused, shows full settings)
 */
@Composable
fun ReaderSettingsScreen(
    navController: NavController,
    settingsType: String,
    viewModel: SettingsViewModel? = null // Deprecated, using ReaderSettingsViewModel internally in Master screen
) {
    // We delegate completely to the master screen in com.universalmedialibrary.ui.reader
    // The master screen uses its own HiltViewModel (ReaderSettingsViewModel)
    MasterReaderSettingsScreen(
        mediaId = null, // Global settings
        onNavigateBack = { navController.navigateUp() }
    )
}
