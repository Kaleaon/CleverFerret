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
                leadingContent = { Icon(Icons.Default.Palette, contentDescription = "Theme") },
                trailingContent = { Icon(Icons.Default.ChevronRight, contentDescription = "Open theme settings") },
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

