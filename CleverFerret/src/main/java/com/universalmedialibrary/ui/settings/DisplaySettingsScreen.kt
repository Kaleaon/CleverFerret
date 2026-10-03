package com.universalmedialibrary.ui.settings

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.widget.Toast
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import androidx.core.content.FileProvider
import androidx.core.content.ContextCompat
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.viewModelScope
import androidx.navigation.NavController
import com.universalmedialibrary.data.repository.CacheLocation
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode
import com.universalmedialibrary.services.MediaScannerService
import com.universalmedialibrary.services.debug.DebugBugReportService
import com.universalmedialibrary.utils.PermissionsHandler
import com.universalmedialibrary.utils.rememberPermissionsHandler
import com.universalmedialibrary.jobs.WorkScheduler
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import javax.inject.Inject
import java.util.Locale
import java.util.concurrent.TimeUnit

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DisplaySettingsScreen(
    onBack: () -> Unit,
    navController: NavController,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    var showGearMenu by remember { mutableStateOf(false) }
    var showMiniPlayerMenu by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Display Options") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .verticalScroll(rememberScrollState())
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text(
                text = "Navigation & mini-player",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )

            // Bottom gear position
            Box {
                ListItem(
                    headlineContent = { Text("Bottom gear position") },
                    supportingContent = { Text(uiState.bottomGearPosition.name.lowercase().replaceFirstChar { it.uppercase() }) },
                    leadingContent = { Icon(Icons.Default.Settings, contentDescription = "Gear position") },
                    trailingContent = { Icon(Icons.Default.ArrowDropDown, contentDescription = "Select position") },
                    modifier = Modifier.clickable { showGearMenu = true }
                )
                DropdownMenu(expanded = showGearMenu, onDismissRequest = { showGearMenu = false }) {
                    BottomGearPosition.entries.forEach { pos ->
                        DropdownMenuItem(
                            text = { Text(pos.name.lowercase().replaceFirstChar { it.uppercase() }) },
                            onClick = {
                                showGearMenu = false
                                viewModel.setBottomGearPosition(pos)
                            }
                        )
                    }
                }
            }

            // Mini-player background mode
            Box {
                ListItem(
                    headlineContent = { Text("Mini-player background") },
                    supportingContent = { Text(uiState.miniPlayerBackgroundMode.name.lowercase().replaceFirstChar { it.uppercase() }) },
                    leadingContent = { Icon(Icons.Default.PictureInPictureAlt, contentDescription = "Mini-player") },
                    trailingContent = { Icon(Icons.Default.ArrowDropDown, contentDescription = "Select mode") },
                    modifier = Modifier.clickable { showMiniPlayerMenu = true }
                )
                DropdownMenu(expanded = showMiniPlayerMenu, onDismissRequest = { showMiniPlayerMenu = false }) {
                    MiniPlayerBackgroundMode.entries.forEach { mode ->
                        DropdownMenuItem(
                            text = { Text(mode.name.lowercase().replaceFirstChar { it.uppercase() }) },
                            onClick = {
                                showMiniPlayerMenu = false
                                viewModel.setMiniPlayerBackgroundMode(mode)
                            }
                        )
                    }
                }
            }

            ListItem(
                headlineContent = { Text("Customize bottom bar") },
                supportingContent = { Text("Reorder/hide items") },
                leadingContent = { Icon(Icons.Default.ViewCarousel, contentDescription = "Bottom bar") },
                trailingContent = { Icon(Icons.Default.ChevronRight, contentDescription = "Open customization") },
                modifier = Modifier.clickable { navController.navigate("settings") }
            )

            ListItem(
                headlineContent = { Text("Theme") },
                supportingContent = { Text("Change palette and dark mode") },
                leadingContent = { Icon(Icons.Default.Palette, contentDescription = "Theme") },
                trailingContent = { Icon(Icons.Default.ChevronRight, contentDescription = "Open theme settings") },
                modifier = Modifier.clickable { navController.navigate("settings/appearance") }
            )
        }
    }
}
