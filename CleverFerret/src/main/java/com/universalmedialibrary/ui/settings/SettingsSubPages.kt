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
import androidx.work.*
import com.universalmedialibrary.data.repository.CacheLocation
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode
import com.universalmedialibrary.services.MediaScannerService
import com.universalmedialibrary.services.debug.DebugBugReportService
import com.universalmedialibrary.utils.PermissionsHandler
import com.universalmedialibrary.utils.rememberPermissionsHandler
import com.universalmedialibrary.workers.AutoScanWorker
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
fun SocialIntegrationsSettingsScreen(
    onBack: () -> Unit,
    navController: NavController
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Social Integrations") },
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
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text(
                text = "Connect services to enrich metadata and track listening.",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            ListItem(
                headlineContent = { Text("Last.fm") },
                supportingContent = { Text("Scrobbling & artist metadata") },
                leadingContent = { Icon(Icons.Default.MusicNote, contentDescription = "Last.fm") },
                trailingContent = { Icon(Icons.Default.ChevronRight, contentDescription = "Open Last.fm settings") },
                modifier = Modifier.clickable { navController.navigate("settings/lastfm") }
            )

            ListItem(
                headlineContent = { Text("API Providers") },
                supportingContent = { Text("Goodreads, Google Books, TMDB, etc.") },
                leadingContent = { Icon(Icons.Default.Api, contentDescription = "API Providers") },
                trailingContent = { Icon(Icons.Default.ChevronRight, contentDescription = "Open API settings") },
                modifier = Modifier.clickable { navController.navigate("settings/api") }
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AppearanceSettingsScreen(
    onBack: () -> Unit,
    navController: NavController,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Appearance") },
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
            ListItem(
                headlineContent = { Text("Theme") },
                supportingContent = { Text(uiState.selectedTheme.name.replace("_", " ")) },
                leadingContent = { Icon(Icons.Default.Palette, contentDescription = null) },
                trailingContent = { Icon(Icons.Default.ChevronRight, contentDescription = null) },
                modifier = Modifier.clickable { navController.navigate("theme_showcase") }
            )

            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text("Dark Mode", fontWeight = FontWeight.Medium)
                    Text(
                        "Use dark theme for better reading",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(
                    checked = uiState.darkMode,
                    onCheckedChange = { viewModel.setDarkMode(it) }
                )
            }
        }
    }
}

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
                    leadingContent = { Icon(Icons.Default.Settings, contentDescription = null) },
                    trailingContent = { Icon(Icons.Default.ArrowDropDown, contentDescription = null) },
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
                    leadingContent = { Icon(Icons.Default.PictureInPictureAlt, contentDescription = null) },
                    trailingContent = { Icon(Icons.Default.ArrowDropDown, contentDescription = null) },
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
                leadingContent = { Icon(Icons.Default.ViewCarousel, contentDescription = null) },
                trailingContent = { Icon(Icons.Default.ChevronRight, contentDescription = null) },
                modifier = Modifier.clickable { navController.navigate("settings") }
            )

            ListItem(
                headlineContent = { Text("Theme") },
                supportingContent = { Text("Change palette and dark mode") },
                leadingContent = { Icon(Icons.Default.Palette, contentDescription = null) },
                trailingContent = { Icon(Icons.Default.ChevronRight, contentDescription = null) },
                modifier = Modifier.clickable { navController.navigate("settings/appearance") }
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MetadataSettingsScreen(
    onBack: () -> Unit,
    navController: NavController,
    viewModel: MetadataSettingsViewModel = hiltViewModel()
) {
    val state by viewModel.state.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Metadata") },
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
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text("Auto-fetch metadata", fontWeight = FontWeight.Medium)
                    Text(
                        "Fetch covers and metadata after scanning/import",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(checked = state.autoFetchMetadata, onCheckedChange = viewModel::setAutoFetchMetadata)
            }

            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text("Prefer embedded metadata", fontWeight = FontWeight.Medium)
                    Text(
                        "Use tags/embedded covers when available",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(checked = state.preferEmbeddedMetadata, onCheckedChange = viewModel::setPreferEmbeddedMetadata)
            }

            ListItem(
                headlineContent = { Text("API Providers") },
                supportingContent = { Text("Configure keys and providers") },
                leadingContent = { Icon(Icons.Default.Api, contentDescription = null) },
                trailingContent = { Icon(Icons.Default.ChevronRight, contentDescription = null) },
                modifier = Modifier.clickable { navController.navigate("settings/api") }
            )
        }
    }
}

data class MetadataSettingsState(
    val autoFetchMetadata: Boolean = true,
    val preferEmbeddedMetadata: Boolean = true
)

@HiltViewModel
class MetadataSettingsViewModel @Inject constructor(
    private val settingsRepository: SettingsRepository
) : androidx.lifecycle.ViewModel() {
    private val _state = kotlinx.coroutines.flow.MutableStateFlow(MetadataSettingsState())
    val state: StateFlow<MetadataSettingsState> = _state

    init {
        viewModelScope.launch {
            kotlinx.coroutines.flow.combine(
                settingsRepository.autoFetchMetadataFlow,
                settingsRepository.preferEmbeddedMetadataFlow
            ) { autoFetch, preferEmbedded ->
                MetadataSettingsState(autoFetchMetadata = autoFetch, preferEmbeddedMetadata = preferEmbedded)
            }.collect { _state.value = it }
        }
    }

    fun setAutoFetchMetadata(enabled: Boolean) {
        viewModelScope.launch {
            settingsRepository.setAutoFetchMetadata(enabled)
        }
    }

    fun setPreferEmbeddedMetadata(enabled: Boolean) {
        viewModelScope.launch {
            settingsRepository.setPreferEmbeddedMetadata(enabled)
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AutoScanSettingsScreen(
    onBack: () -> Unit,
    viewModel: AutoScanSettingsViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val state by viewModel.state.collectAsState()
    val scope = rememberCoroutineScope()
    val wm = remember(context) { WorkManager.getInstance(context) }
    val permissions = rememberPermissionsHandler()

    fun rescheduleWork() {
        if (!state.enabled) {
            wm.cancelUniqueWork(AutoScanWorker.UNIQUE_WORK_NAME)
            return
        }

        val constraints = Constraints.Builder()
            .setRequiredNetworkType(if (state.wifiOnly) NetworkType.UNMETERED else NetworkType.CONNECTED)
            .build()

        val request = PeriodicWorkRequestBuilder<AutoScanWorker>(
            state.intervalHours.toLong(),
            TimeUnit.HOURS
        ).setConstraints(constraints)
            .build()

        wm.enqueueUniquePeriodicWork(
            AutoScanWorker.UNIQUE_WORK_NAME,
            ExistingPeriodicWorkPolicy.UPDATE,
            request
        )
    }

    // Keep WorkManager schedule in sync with stored settings.
    LaunchedEffect(state.enabled, state.intervalHours, state.wifiOnly) {
        // Debounce rapid successive changes (toggle + interval edits).
        delay(500)
        rescheduleWork()
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Auto-Scan") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(
                        onClick = { rescheduleWork() }
                    ) {
                        Icon(Icons.Default.Refresh, contentDescription = "Reschedule")
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
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text("Enable periodic scans", fontWeight = FontWeight.Medium)
                    Text(
                        "Automatically scan for new media in the background",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(checked = state.enabled, onCheckedChange = viewModel::setEnabled)
            }

            OutlinedTextField(
                value = state.intervalHours.toString(),
                onValueChange = { raw ->
                    raw.toIntOrNull()?.let { hours ->
                        if (hours >= 1) viewModel.setIntervalHours(hours)
                    }
                },
                label = { Text("Interval (hours)") },
                supportingText = { Text("Minimum 1 hour") },
                leadingIcon = { Icon(Icons.Default.Schedule, contentDescription = null) },
                enabled = state.enabled,
                modifier = Modifier.fillMaxWidth()
            )

            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text("Wi‑Fi only", fontWeight = FontWeight.Medium)
                    Text(
                        "Avoid scanning on metered networks",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(checked = state.wifiOnly, onCheckedChange = viewModel::setWifiOnly, enabled = state.enabled)
            }

            Button(
                onClick = {
                    // Validate storage permissions before starting scan to avoid SecurityException.
                    if (!PermissionsHandler.hasStoragePermissions(context)) {
                        permissions.requestPermissions()
                        Toast.makeText(context, "Storage permissions required to scan.", Toast.LENGTH_SHORT).show()
                        return@Button
                    }

                    val intent = Intent(context, MediaScannerService::class.java).apply {
                        action = MediaScannerService.ACTION_SCAN_ALL
                    }
                    ContextCompat.startForegroundService(context, intent)
                },
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.Search, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Scan now")
            }

            Text(
                text = "Auto-scan uses WorkManager and runs a foreground scan job when scheduled.",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

data class AutoScanSettingsState(
    val enabled: Boolean = false,
    val intervalHours: Int = 24,
    val wifiOnly: Boolean = true
)

@HiltViewModel
class AutoScanSettingsViewModel @Inject constructor(
    private val settingsRepository: SettingsRepository
) : androidx.lifecycle.ViewModel() {
    private val _state = kotlinx.coroutines.flow.MutableStateFlow(AutoScanSettingsState())
    val state: StateFlow<AutoScanSettingsState> = _state

    init {
        viewModelScope.launch {
            kotlinx.coroutines.flow.combine(
                settingsRepository.autoScanEnabledFlow,
                settingsRepository.autoScanIntervalHoursFlow,
                settingsRepository.autoScanWifiOnlyFlow
            ) { enabled, hours, wifiOnly ->
                AutoScanSettingsState(enabled = enabled, intervalHours = hours, wifiOnly = wifiOnly)
            }.collect { _state.value = it }
        }
    }

    fun setEnabled(enabled: Boolean) {
        viewModelScope.launch { settingsRepository.setAutoScanEnabled(enabled) }
    }

    fun setIntervalHours(hours: Int) {
        viewModelScope.launch { settingsRepository.setAutoScanIntervalHours(hours) }
    }

    fun setWifiOnly(enabled: Boolean) {
        viewModelScope.launch { settingsRepository.setAutoScanWifiOnly(enabled) }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PrivacySettingsScreen(
    onBack: () -> Unit,
    viewModel: PrivacySettingsViewModel = hiltViewModel()
) {
    val state by viewModel.state.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Privacy") },
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
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text("Save history", fontWeight = FontWeight.Medium)
                    Text(
                        "Keep reading/listening history on-device",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(checked = state.saveHistory, onCheckedChange = viewModel::setSaveHistory)
            }

            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text("Send analytics", fontWeight = FontWeight.Medium)
                    Text(
                        "Share anonymous usage analytics (disabled by default)",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(checked = state.sendAnalytics, onCheckedChange = viewModel::setSendAnalytics)
            }
        }
    }
}

data class PrivacySettingsState(
    val saveHistory: Boolean = true,
    val sendAnalytics: Boolean = false
)

@HiltViewModel
class PrivacySettingsViewModel @Inject constructor(
    private val settingsRepository: SettingsRepository
) : androidx.lifecycle.ViewModel() {
    private val _state = kotlinx.coroutines.flow.MutableStateFlow(PrivacySettingsState())
    val state: StateFlow<PrivacySettingsState> = _state

    init {
        viewModelScope.launch {
            kotlinx.coroutines.flow.combine(
                settingsRepository.privacySaveHistoryFlow,
                settingsRepository.privacySendAnalyticsFlow
            ) { saveHistory, sendAnalytics ->
                PrivacySettingsState(saveHistory = saveHistory, sendAnalytics = sendAnalytics)
            }.collect { _state.value = it }
        }
    }

    fun setSaveHistory(enabled: Boolean) {
        viewModelScope.launch { settingsRepository.setPrivacySaveHistory(enabled) }
    }

    fun setSendAnalytics(enabled: Boolean) {
        viewModelScope.launch { settingsRepository.setPrivacySendAnalytics(enabled) }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CacheSettingsScreen(
    onBack: () -> Unit,
    viewModel: CacheSettingsViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val state by viewModel.state.collectAsState()
    val scope = rememberCoroutineScope()
    var cacheSizeText by remember { mutableStateOf("…") }
    var availableSpaceText by remember { mutableStateOf("…") }

    // Slider is local to avoid spamming DataStore writes while dragging.
    var sliderMb by remember { mutableStateOf(state.maxCacheSizeMb.coerceIn(512, 10_240)) }
    LaunchedEffect(state.maxCacheSizeMb) {
        sliderMb = state.maxCacheSizeMb.coerceIn(512, 10_240)
    }

    LaunchedEffect(state.cacheLocation) {
        val (sizeBytes, availableMb) = withContext(Dispatchers.IO) {
            val dir = getCacheDirectoryForLocation(context, state.cacheLocation)
            val size = directorySize(dir)
            val available = runCatching {
                android.os.StatFs(dir.path).availableBytes / (1024L * 1024L)
            }.getOrDefault(0L)
            size to available
        }
        cacheSizeText = sizeBytes.toHumanReadable()
        availableSpaceText = "${availableMb} MB"
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Cache") },
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
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Text(
                text = "Cache location",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )

            val externalAvailable = remember(context) { context.externalCacheDir != null }
            SingleChoiceSegmentedButtonRow(modifier = Modifier.fillMaxWidth()) {
                SegmentedButton(
                    selected = state.cacheLocation == CacheLocation.INTERNAL,
                    onClick = { viewModel.setCacheLocation(CacheLocation.INTERNAL) },
                    shape = SegmentedButtonDefaults.itemShape(index = 0, count = 2)
                ) { Text("Local") }

                SegmentedButton(
                    selected = state.cacheLocation == CacheLocation.EXTERNAL,
                    onClick = {
                        if (externalAvailable) viewModel.setCacheLocation(CacheLocation.EXTERNAL)
                        else Toast.makeText(context, "No external/SD cache directory available.", Toast.LENGTH_SHORT).show()
                    },
                    enabled = externalAvailable,
                    shape = SegmentedButtonDefaults.itemShape(index = 1, count = 2)
                ) { Text("SD card") }
            }

            Text(
                text = "Current cache size: $cacheSizeText",
                style = MaterialTheme.typography.bodyMedium
            )

            Text(
                text = "Available space: $availableSpaceText",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Text(
                text = "Max cache size",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )

            val sliderMinMb = 512
            val sliderMaxMb = 10_240
            val stepMb = 256
            val valuesCount = ((sliderMaxMb - sliderMinMb) / stepMb) + 1
            val steps = (valuesCount - 2).coerceAtLeast(0)

            Text(
                text = String.format(
                    Locale.getDefault(),
                    "%.2f GB",
                    sliderMb.toDouble() / 1024.0
                ),
                style = MaterialTheme.typography.bodyMedium
            )

            Slider(
                value = sliderMb.toFloat(),
                onValueChange = { raw ->
                    val snapped = ((raw - sliderMinMb) / stepMb).toInt().coerceAtLeast(0) * stepMb + sliderMinMb
                    sliderMb = snapped.coerceIn(sliderMinMb, sliderMaxMb)
                },
                onValueChangeFinished = { viewModel.setMaxCacheSizeMb(sliderMb) },
                valueRange = sliderMinMb.toFloat()..sliderMaxMb.toFloat(),
                steps = steps
            )
            Text(
                text = "Range: 0.5 GB to 10 GB",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Button(
                onClick = {
                    scope.launch {
                        val newSize = withContext(Dispatchers.IO) {
                            clearCache(context, state.cacheLocation)
                            calculateCacheSize(context, state.cacheLocation).toHumanReadable()
                        }
                        cacheSizeText = newSize
                    }
                },
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.DeleteSweep, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Clear cache")
            }
        }
    }
}

data class CacheSettingsState(
    val maxCacheSizeMb: Int = 500,
    val cacheLocation: CacheLocation = CacheLocation.INTERNAL
)

@HiltViewModel
class CacheSettingsViewModel @Inject constructor(
    private val settingsRepository: SettingsRepository
) : androidx.lifecycle.ViewModel() {
    private val _state = kotlinx.coroutines.flow.MutableStateFlow(CacheSettingsState())
    val state: StateFlow<CacheSettingsState> = _state

    init {
        viewModelScope.launch {
            kotlinx.coroutines.flow.combine(
                settingsRepository.maxCacheSizeMBFlow,
                settingsRepository.cacheLocationFlow
            ) { maxMb, location ->
                CacheSettingsState(maxCacheSizeMb = maxMb, cacheLocation = location)
            }.collect { _state.value = it }
        }
    }

    fun setMaxCacheSizeMb(mb: Int) {
        viewModelScope.launch { settingsRepository.setMaxCacheSizeMB(mb) }
    }

    fun setCacheLocation(location: CacheLocation) {
        viewModelScope.launch { settingsRepository.setCacheLocation(location) }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DownloadsSettingsScreen(
    onBack: () -> Unit,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Downloads") },
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
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text("Auto-download podcast episodes", fontWeight = FontWeight.Medium)
                    Text(
                        "Automatically download new podcast episodes",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(checked = uiState.autoDownloadPodcasts, onCheckedChange = viewModel::setAutoDownload)
            }

            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text("Wi‑Fi only", fontWeight = FontWeight.Medium)
                    Text(
                        "Download only on Wi‑Fi to save data",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(checked = uiState.wifiOnlyDownloads, onCheckedChange = viewModel::setWifiOnlyDownloads)
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CastingSettingsScreen(
    onBack: () -> Unit,
    viewModel: CastingSettingsViewModel = hiltViewModel()
) {
    val state by viewModel.state.collectAsState()
    val context = LocalContext.current

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Casting") },
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
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text("Enable casting", fontWeight = FontWeight.Medium)
                    Text(
                        "Show cast targets and allow casting audio",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(checked = state.enabled, onCheckedChange = viewModel::setEnabled)
            }

            Button(
                onClick = {
                    // Open system Cast settings if present; otherwise open Bluetooth settings as a fallback.
                    val intent = Intent(android.provider.Settings.ACTION_CAST_SETTINGS)
                    runCatching { context.startActivity(intent) }.onFailure {
                        Toast.makeText(
                            context,
                            "Cast settings not available on this device",
                            Toast.LENGTH_SHORT
                        ).show()
                    }
                },
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.Settings, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Open system cast settings")
            }
        }
    }
}

data class CastingSettingsState(val enabled: Boolean = true)

@HiltViewModel
class CastingSettingsViewModel @Inject constructor(
    private val settingsRepository: SettingsRepository
) : androidx.lifecycle.ViewModel() {
    private val _state = kotlinx.coroutines.flow.MutableStateFlow(CastingSettingsState())
    val state: StateFlow<CastingSettingsState> = _state

    init {
        viewModelScope.launch {
            settingsRepository.castingEnabledFlow.collect { enabled ->
                _state.value = CastingSettingsState(enabled = enabled)
            }
        }
    }

    fun setEnabled(enabled: Boolean) {
        viewModelScope.launch { settingsRepository.setCastingEnabled(enabled) }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun FeedbackSettingsScreen(
    onBack: () -> Unit,
    viewModel: FeedbackViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val activity = context as? Activity
    val uiState by viewModel.uiState.collectAsState()
    var description by remember { mutableStateOf("") }
    var includeScreenshot by remember { mutableStateOf(true) }
    var includeLogs by remember { mutableStateOf(true) }
    var githubToken by remember { mutableStateOf("") }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Feedback & Bug Reports") },
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
                text = "Create a detailed bug report (debug builds only) or open the GitHub issue tracker.",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            OutlinedTextField(
                value = description,
                onValueChange = { description = it },
                label = { Text("What went wrong?") },
                modifier = Modifier.fillMaxWidth(),
                minLines = 3
            )

            Row(verticalAlignment = Alignment.CenterVertically) {
                Checkbox(checked = includeScreenshot, onCheckedChange = { includeScreenshot = it })
                Spacer(modifier = Modifier.width(8.dp))
                Text("Include screenshot")
            }

            Row(verticalAlignment = Alignment.CenterVertically) {
                Checkbox(checked = includeLogs, onCheckedChange = { includeLogs = it })
                Spacer(modifier = Modifier.width(8.dp))
                Text("Include logs")
            }

            Button(
                enabled = activity != null && !uiState.isBusy && description.isNotBlank(),
                onClick = {
                    viewModel.createAndSaveReport(
                        activity = activity!!,
                        description = description,
                        includeScreenshot = includeScreenshot,
                        includeLogs = includeLogs
                    )
                },
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.BugReport, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text(if (uiState.isBusy) "Working…" else "Save bug report")
            }

            uiState.savedReportUri?.let { uri ->
                Button(
                    onClick = {
                        val share = Intent(Intent.ACTION_SEND).apply {
                            type = "application/json"
                            putExtra(Intent.EXTRA_STREAM, uri)
                            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                        }
                        context.startActivity(Intent.createChooser(share, "Share bug report"))
                    },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(Icons.Default.Share, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Share saved report")
                }
            }

            OutlinedTextField(
                value = githubToken,
                onValueChange = { githubToken = it },
                label = { Text("GitHub token (optional, to auto-create issue)") },
                visualTransformation = PasswordVisualTransformation(),
                modifier = Modifier.fillMaxWidth()
            )

            Button(
                enabled = activity != null && !uiState.isBusy && description.isNotBlank() && githubToken.isNotBlank(),
                onClick = {
                    val token = githubToken
                    githubToken = ""
                    viewModel.createAndSubmitToGitHub(
                        activity = activity!!,
                        description = description,
                        includeScreenshot = includeScreenshot,
                        includeLogs = includeLogs,
                        githubToken = token
                    )
                },
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.Public, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Create GitHub issue")
            }

            Button(
                onClick = {
                    val uri = Uri.parse("https://github.com/Kaleaon/CleverFerret/issues")
                    context.startActivity(Intent(Intent.ACTION_VIEW, uri))
                },
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.OpenInBrowser, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Open issue tracker")
            }

            uiState.message?.let { msg ->
                Text(
                    text = msg,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.primary
                )
            }

            uiState.error?.let { err ->
                Text(
                    text = err,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.error
                )
            }
        }
    }
}

data class FeedbackUiState(
    val isBusy: Boolean = false,
    val message: String? = null,
    val error: String? = null,
    val savedReportUri: Uri? = null
)

@HiltViewModel
class FeedbackViewModel @Inject constructor(
    private val bugReportService: DebugBugReportService
) : androidx.lifecycle.ViewModel() {
    private val _uiState = kotlinx.coroutines.flow.MutableStateFlow(FeedbackUiState())
    val uiState: StateFlow<FeedbackUiState> = _uiState

    fun createAndSaveReport(
        activity: Activity,
        description: String,
        includeScreenshot: Boolean,
        includeLogs: Boolean
    ) {
        viewModelScope.launch {
            _uiState.value = FeedbackUiState(isBusy = true)
            try {
                val report = bugReportService.createBugReport(
                    activity = activity,
                    userDescription = description,
                    includeScreenshot = includeScreenshot,
                    includeLogs = includeLogs
                )
                val file = bugReportService.saveLocally(report).getOrThrow()
                val uri = FileProvider.getUriForFile(
                    activity,
                    "${activity.packageName}.fileprovider",
                    file
                )
                _uiState.value = FeedbackUiState(
                    isBusy = false,
                    message = "Saved report: ${file.name}",
                    savedReportUri = uri
                )
            } catch (e: Exception) {
                _uiState.value = FeedbackUiState(isBusy = false, error = e.message ?: "Failed to create report")
            }
        }
    }

    fun createAndSubmitToGitHub(
        activity: Activity,
        description: String,
        includeScreenshot: Boolean,
        includeLogs: Boolean,
        githubToken: String
    ) {
        viewModelScope.launch {
            _uiState.value = FeedbackUiState(isBusy = true)
            try {
                val report = bugReportService.createBugReport(
                    activity = activity,
                    userDescription = description,
                    includeScreenshot = includeScreenshot,
                    includeLogs = includeLogs
                )
                val issueUrl = bugReportService.submitToGitHub(report, githubToken).getOrThrow()
                _uiState.value = FeedbackUiState(
                    isBusy = false,
                    message = "Created issue: $issueUrl"
                )
            } catch (e: Exception) {
                _uiState.value = FeedbackUiState(isBusy = false, error = e.message ?: "Failed to create issue")
            }
        }
    }
}

private fun getCacheDirectoryForLocation(
    context: android.content.Context,
    location: CacheLocation
): File {
    // Mirror CacheManager's directory convention ("artwork" subdir) so the UI matches actual caching behavior.
    val base = when (location) {
        CacheLocation.INTERNAL -> context.cacheDir
        CacheLocation.EXTERNAL -> context.externalCacheDir ?: context.cacheDir
    }
    return File(base, "artwork").apply { if (!exists()) mkdirs() }
}

private suspend fun calculateCacheSize(context: android.content.Context, location: CacheLocation): Long {
    return directorySize(getCacheDirectoryForLocation(context, location))
}

private fun directorySize(dir: File): Long {
    if (!dir.exists()) return 0L

    // Iterative traversal to avoid recursion/stack overflow on deep trees.
    val maxDepth = 64
    val maxEntries = 200_000

    var total = 0L
    var entries = 0

    val stack = ArrayDeque<Pair<File, Int>>()
    val visitedDirs = HashSet<String>(256)
    stack.addLast(dir to 0)

    while (stack.isNotEmpty() && entries < maxEntries) {
        val (current, depth) = stack.removeLast()
        entries++

        if (!current.exists()) continue

        if (current.isFile) {
            total += runCatching { current.length() }.getOrDefault(0L)
            continue
        }

        if (depth >= maxDepth) continue

        // Best-effort cycle guard (symlinks/unusual FS layouts).
        val key = runCatching { current.canonicalPath }.getOrElse { current.absolutePath }
        if (!visitedDirs.add(key)) continue

        val children = runCatching { current.listFiles() }.getOrNull() ?: continue
        children.forEach { child ->
            stack.addLast(child to (depth + 1))
        }
    }

    return total
}

private suspend fun clearCache(context: android.content.Context, location: CacheLocation) {
    runCatching { getCacheDirectoryForLocation(context, location).deleteRecursively() }
}

private fun Long.toHumanReadable(): String {
    val kb = 1024.0
    val mb = kb * 1024
    val gb = mb * 1024
    return when {
        this >= gb -> String.format(Locale.getDefault(), "%.2f GB", this / gb)
        this >= mb -> String.format(Locale.getDefault(), "%.2f MB", this / mb)
        this >= kb -> String.format(Locale.getDefault(), "%.2f KB", this / kb)
        else -> "$this B"
    }
}

