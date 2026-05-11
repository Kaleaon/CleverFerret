package com.universalmedialibrary.ui.media.navigation.graphs

import android.net.Uri
import androidx.compose.animation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.MenuBook
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.*
import androidx.navigation.compose.*
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.R
import com.universalmedialibrary.ui.media.components.MediaType
import com.universalmedialibrary.ui.media.player.*
import com.universalmedialibrary.ui.media.screens.*
import com.universalmedialibrary.ui.media.viewmodels.*
import com.universalmedialibrary.debug.ui.DebugMenuScreen
import com.universalmedialibrary.ui.components.NavigationItems
import com.universalmedialibrary.ui.components.UiErrorBoundary
import com.universalmedialibrary.ui.main.MainViewModel
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.ui.theme.toCleverFerretTheme
import com.universalmedialibrary.ui.reader.DocumentReaderScreen
import com.universalmedialibrary.ui.reader.EPUBReaderScreen
import kotlinx.coroutines.launch
import java.io.File
import com.universalmedialibrary.ui.media.navigation.MediaRoutes

fun NavGraphBuilder.syncImportRoutes(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit
) {
    composable(MediaRoutes.SYNC) {
        val viewModel: MediaSyncViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        MediaSyncScreen(
            state = state,
            onSyncNow = { viewModel.syncNow() },
            onConfigureService = { service -> viewModel.configureService(service) },
            onBackClick = { navController.popBackStack() }
        )
    }
    
    composable(MediaRoutes.IMPORT_EXPORT) {
        val viewModel: ImportExportViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        ImportExportScreen(
            state = state,
            onImport = { type -> viewModel.startImport(type) },
            onExport = { type -> viewModel.startExport(type) },
            onBackClick = { navController.popBackStack() }
        )
    }
    
    // Enhanced Folder Import Screen with metadata fetching
    composable(MediaRoutes.FOLDER_IMPORT) {
        com.universalmedialibrary.ui.folderimport.FolderImportScreen(
            onBack = { navController.popBackStack() },
            onImportComplete = { 
                navController.popBackStack()
                onShowSnackbar("Import complete!")
            }
        )
    }

    composable(MediaRoutes.FILE_BROWSER) {
        val scope = rememberCoroutineScope()
        val context = LocalContext.current
        
        com.universalmedialibrary.ui.filepicker.EnhancedFileBrowser(
            onFileSelected = { file ->
                // Import the selected file to library
                scope.launch {
                    try {
                        val uri = android.net.Uri.fromFile(file)
                        val mediaType = when {
                            file.extension.lowercase() in listOf("epub", "pdf", "mobi", "azw", "azw3", "fb2", "txt", "rtf", "doc", "docx") -> "BOOK"
                            file.extension.lowercase() in listOf("mp3", "m4a", "m4b", "aac", "ogg", "opus", "flac", "wav", "wma") -> "MUSIC"
                            file.extension.lowercase() in listOf("mp4", "mkv", "avi", "mov", "wmv", "flv", "webm", "m4v") -> "VIDEO"
                            file.extension.lowercase() in listOf("cbz", "cbr", "cb7", "cbt") -> "COMIC"
                            else -> "DOCUMENT"
                        }
                        onShowSnackbar("Importing ${file.name}...")
                        
                        // Navigate to appropriate detail/reader based on type
                        when (mediaType) {
                            "BOOK" -> {
                                // Open book reader directly
                                val encodedUri = java.net.URLEncoder.encode(uri.toString(), "UTF-8")
                                val encodedName = java.net.URLEncoder.encode(file.name, "UTF-8")
                                navController.navigate("document-reader/$encodedUri/$encodedName")
                            }
                            "COMIC" -> {
                                val encodedUri = java.net.URLEncoder.encode(uri.toString(), "UTF-8")
                                val encodedName = java.net.URLEncoder.encode(file.name, "UTF-8")
                                navController.navigate("document-reader/$encodedUri/$encodedName")
                            }
                            "MUSIC", "VIDEO" -> {
                                onShowSnackbar("Added ${file.name} to library")
                            }
                            else -> {
                                val encodedUri = java.net.URLEncoder.encode(uri.toString(), "UTF-8")
                                val encodedName = java.net.URLEncoder.encode(file.name, "UTF-8")
                                navController.navigate("document-reader/$encodedUri/$encodedName")
                            }
                        }
                    } catch (e: Exception) {
                        onShowSnackbar("Error importing file: ${e.message}")
                    }
                }
            },
            onFolderSelected = { folder ->
                // Navigate to enhanced folder import for bulk import
                navController.navigate(MediaRoutes.FOLDER_IMPORT)
            }
        )
    }
    
    // =====================================================================
}
