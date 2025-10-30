package com.universalmedialibrary.ui.settings

import android.util.Log
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import java.util.Locale
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.preferences.*
import com.universalmedialibrary.data.services.SettingsBackupService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Reading Preferences Screen
 * 
 * Comprehensive user preferences UI for all reading formats:
 * - EPUB (font, theme, layout)
 * - PDF (scroll, fit, spread modes)
 * - Audiobooks (speed, sleep timer)
 * - Comics (reading mode, translation)
 * - Global (screen, brightness, navigation)
 * 
 * All preferences persist across app upgrades via DataStore
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ReadingPreferencesScreen(
    onBack: () -> Unit,
    viewModel: ReadingPreferencesViewModel = hiltViewModel()
) {
    val epubPrefs by viewModel.epubPreferences.collectAsState()
    val pdfPrefs by viewModel.pdfPreferences.collectAsState()
    val audiobookPrefs by viewModel.audiobookPreferences.collectAsState()
    val comicPrefs by viewModel.comicPreferences.collectAsState()
    val globalPrefs by viewModel.globalPreferences.collectAsState()
    
    val snackbarHostState = remember { SnackbarHostState() }
    var showRestoreDialog by remember { mutableStateOf(false) }
    
    // Listen for backup results
    LaunchedEffect(Unit) {
        viewModel.backupResult.collect { result ->
            result.onSuccess { message ->
                snackbarHostState.showSnackbar(message, duration = SnackbarDuration.Long)
            }.onFailure { error ->
                snackbarHostState.showSnackbar(
                    error.message ?: "Operation failed",
                    duration = SnackbarDuration.Long
                )
            }
        }
    }

    Scaffold(
        snackbarHost = { SnackbarHost(snackbarHostState) },
        topBar = {
            TopAppBar(
                title = { Text("Reading Preferences") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.resetToDefaults() }) {
                        Icon(Icons.Default.RestartAlt, "Reset to Defaults")
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
            verticalArrangement = Arrangement.spacedBy(24.dp)
        ) {
            // EPUB Preferences
            PreferenceSection(title = "📖 EPUB Books") {
                // Font size
                SliderPreference(
                    label = "Font Size",
                    value = epubPrefs.fontSize,
                    valueRange = 50f..200f,
                    onValueChange = { viewModel.updateEpubFontSize(it) },
                    valueDisplay = "${epubPrefs.fontSize.toInt()}%"
                )
                
                // Theme
                DropdownPreference(
                    label = "Theme",
                    value = epubPrefs.theme,
                    options = EpubTheme.values().toList(),
                    onValueChange = { viewModel.updateEpubTheme(it) }
                )
                
                // Text align
                DropdownPreference(
                    label = "Text Alignment",
                    value = epubPrefs.textAlign,
                    options = TextAlign.values().toList(),
                    onValueChange = { viewModel.updateTextAlign(it) }
                )
                
                // Line height
                SliderPreference(
                    label = "Line Height",
                    value = epubPrefs.lineHeight,
                    valueRange = 1.0f..2.5f,
                    onValueChange = { viewModel.updateLineHeight(it) },
                    valueDisplay = "${String.format(java.util.Locale.US, "%.1f", epubPrefs.lineHeight)}"
                )
            }

            // PDF Preferences
            PreferenceSection(title = "📄 PDF Documents") {
                DropdownPreference(
                    label = "Scroll Mode",
                    value = pdfPrefs.scrollMode,
                    options = ScrollMode.values().toList(),
                    onValueChange = { viewModel.updateScrollMode(it) }
                )
                
                DropdownPreference(
                    label = "Fit Mode",
                    value = pdfPrefs.fitMode,
                    options = FitMode.values().toList(),
                    onValueChange = { viewModel.updateFitMode(it) }
                )
            }

            // Audiobook Preferences
            PreferenceSection(title = "🎧 Audiobooks") {
                SliderPreference(
                    label = "Playback Speed",
                    value = audiobookPrefs.playbackSpeed,
                    valueRange = 0.5f..2.5f,
                    onValueChange = { viewModel.updatePlaybackSpeed(it) },
                    valueDisplay = "${String.format(Locale.getDefault(), "%.2f", audiobookPrefs.playbackSpeed)}x"
                )
                
                SliderPreference(
                    label = "Sleep Timer",
                    value = audiobookPrefs.sleepTimerMinutes.toFloat(),
                    valueRange = 0f..120f,
                    onValueChange = { viewModel.updateSleepTimer(it.toInt()) },
                    valueDisplay = if (audiobookPrefs.sleepTimerMinutes > 0) 
                        "${audiobookPrefs.sleepTimerMinutes} min" 
                    else 
                        "Off"
                )
            }

            // Comic Preferences
            PreferenceSection(title = "📚 Comics") {
                DropdownPreference(
                    label = "Reading Mode",
                    value = comicPrefs.readingMode,
                    options = ReadingMode.values().toList(),
                    onValueChange = { viewModel.updateComicReadingMode(it) }
                )
                
                SwitchPreference(
                    label = "AI Translation",
                    checked = comicPrefs.translationEnabled,
                    onCheckedChange = { viewModel.updateTranslationEnabled(it) }
                )
            }

            // Global Preferences
            PreferenceSection(title = "⚙️ Global Settings") {
                SwitchPreference(
                    label = "Keep Screen On",
                    checked = globalPrefs.keepScreenOn,
                    onCheckedChange = { viewModel.updateKeepScreenOn(it) }
                )
                
                SwitchPreference(
                    label = "Auto Brightness",
                    checked = globalPrefs.autoBrightness,
                    onCheckedChange = { viewModel.updateAutoBrightness(it) }
                )
                
                SwitchPreference(
                    label = "Volume Key Navigation",
                    checked = globalPrefs.volumeKeyNavigation,
                    onCheckedChange = { viewModel.updateVolumeKeyNav(it) }
                )
            }

            // Backup/Restore Section
            PreferenceSection(title = "💾 Backup & Restore") {
                OutlinedButton(
                    onClick = { viewModel.createBackup() },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(Icons.Default.Backup, null)
                    Spacer(Modifier.width(8.dp))
                    Text("Create Backup Now")
                }
                
                OutlinedButton(
                    onClick = { showRestoreDialog = true },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(Icons.Default.RestorePage, null)
                    Spacer(Modifier.width(8.dp))
                    Text("Restore from Backup")
                }
                
                Text(
                    text = "💡 Backups are created automatically before app upgrades",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@Composable
private fun PreferenceSection(
    title: String,
    content: @Composable ColumnScope.() -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text(
                text = title,
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            content()
        }
    }
}

@Composable
private fun SliderPreference(
    label: String,
    value: Float,
    valueRange: ClosedFloatingPointRange<Float>,
    onValueChange: (Float) -> Unit,
    valueDisplay: String
) {
    Column {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text(text = label, style = MaterialTheme.typography.bodyLarge)
            Text(
                text = valueDisplay,
                style = MaterialTheme.typography.bodyLarge,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.primary
            )
        }
        Slider(
            value = value,
            onValueChange = onValueChange,
            valueRange = valueRange,
            modifier = Modifier.fillMaxWidth()
        )
    }
}

@Composable
private fun <T : Enum<T>> DropdownPreference(
    label: String,
    value: T,
    options: List<T>,
    onValueChange: (T) -> Unit
) {
    var expanded by remember { mutableStateOf(false) }
    
    Column {
        Text(text = label, style = MaterialTheme.typography.bodyLarge)
        Spacer(Modifier.height(4.dp))
        ExposedDropdownMenuBox(
            expanded = expanded,
            onExpandedChange = { expanded = it }
        ) {
            OutlinedTextField(
                value = value.name.lowercase().replace("_", " ").replaceFirstChar { it.uppercase() },
                onValueChange = {},
                readOnly = true,
                trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded) },
                modifier = Modifier
                    .fillMaxWidth()
                    .menuAnchor(),
                colors = ExposedDropdownMenuDefaults.outlinedTextFieldColors()
            )
            ExposedDropdownMenu(
                expanded = expanded,
                onDismissRequest = { expanded = false }
            ) {
                options.forEach { option ->
                    DropdownMenuItem(
                        text = { Text(option.name.lowercase().replace("_", " ").replaceFirstChar { it.uppercase() }) },
                        onClick = {
                            onValueChange(option)
                            expanded = false
                        }
                    )
                }
            }
        }
    }
}

@Composable
private fun SwitchPreference(
    label: String,
    checked: Boolean,
    onCheckedChange: (Boolean) -> Unit
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(text = label, style = MaterialTheme.typography.bodyLarge)
        Switch(
            checked = checked,
            onCheckedChange = onCheckedChange
        )
    }
}

@HiltViewModel
class ReadingPreferencesViewModel @Inject constructor(
    private val preferencesStore: ReadiumPreferencesStore,
    private val settingsBackupService: SettingsBackupService
) : ViewModel() {
    
    // Events for UI feedback
    private val _backupResult = MutableSharedFlow<Result<String>>()
    val backupResult = _backupResult.asSharedFlow()

    val epubPreferences = preferencesStore.epubPreferences
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), EpubPreferences())
    
    val pdfPreferences = preferencesStore.pdfPreferences
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), PdfPreferences())
    
    val audiobookPreferences = preferencesStore.audiobookPreferences
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), AudiobookPreferences())
    
    val comicPreferences = preferencesStore.comicPreferences
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), ComicPreferences())
    
    val globalPreferences = preferencesStore.globalPreferences
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), GlobalPreferences())

    // EPUB preferences
    fun updateEpubFontSize(size: Float) {
        viewModelScope.launch {
            val current = epubPreferences.value
            preferencesStore.saveEpubPreferences(current.copy(fontSize = size))
        }
    }

    fun updateEpubTheme(theme: EpubTheme) {
        viewModelScope.launch {
            val current = epubPreferences.value
            preferencesStore.saveEpubPreferences(current.copy(theme = theme))
        }
    }

    fun updateTextAlign(align: TextAlign) {
        viewModelScope.launch {
            val current = epubPreferences.value
            preferencesStore.saveEpubPreferences(current.copy(textAlign = align))
        }
    }

    fun updateLineHeight(height: Float) {
        viewModelScope.launch {
            val current = epubPreferences.value
            preferencesStore.saveEpubPreferences(current.copy(lineHeight = height))
        }
    }

    // PDF preferences
    fun updateScrollMode(mode: ScrollMode) {
        viewModelScope.launch {
            val current = pdfPreferences.value
            preferencesStore.savePdfPreferences(current.copy(scrollMode = mode))
        }
    }

    fun updateFitMode(mode: FitMode) {
        viewModelScope.launch {
            val current = pdfPreferences.value
            preferencesStore.savePdfPreferences(current.copy(fitMode = mode))
        }
    }

    // Audiobook preferences
    fun updatePlaybackSpeed(speed: Float) {
        viewModelScope.launch {
            val current = audiobookPreferences.value
            preferencesStore.saveAudiobookPreferences(current.copy(playbackSpeed = speed))
        }
    }

    fun updateSleepTimer(minutes: Int) {
        viewModelScope.launch {
            val current = audiobookPreferences.value
            preferencesStore.saveAudiobookPreferences(current.copy(sleepTimerMinutes = minutes))
        }
    }

    // Comic preferences
    fun updateComicReadingMode(mode: ReadingMode) {
        viewModelScope.launch {
            val current = comicPreferences.value
            preferencesStore.saveComicPreferences(current.copy(readingMode = mode))
        }
    }

    fun updateTranslationEnabled(enabled: Boolean) {
        viewModelScope.launch {
            val current = comicPreferences.value
            preferencesStore.saveComicPreferences(current.copy(translationEnabled = enabled))
        }
    }

    // Global preferences
    fun updateKeepScreenOn(enabled: Boolean) {
        viewModelScope.launch {
            val current = globalPreferences.value
            preferencesStore.saveGlobalPreferences(current.copy(keepScreenOn = enabled))
        }
    }

    fun updateAutoBrightness(enabled: Boolean) {
        viewModelScope.launch {
            val current = globalPreferences.value
            preferencesStore.saveGlobalPreferences(current.copy(autoBrightness = enabled))
        }
    }

    fun updateVolumeKeyNav(enabled: Boolean) {
        viewModelScope.launch {
            val current = globalPreferences.value
            preferencesStore.saveGlobalPreferences(current.copy(volumeKeyNavigation = enabled))
        }
    }

    // Backup/Restore
    fun createBackup() {
        viewModelScope.launch {
            try {
                val result = settingsBackupService.exportToStorage()
                
                if (result.isSuccess) {
                    val file = result.getOrNull()
                    _backupResult.emit(Result.success("Backup saved to ${file?.name}"))
                } else {
                    val error = result.exceptionOrNull()?.message ?: "Unknown error"
                    _backupResult.emit(Result.failure(Exception("Backup failed: $error")))
                }
            } catch (e: Exception) {
                _backupResult.emit(Result.failure(e))
            }
        }
    }

    fun restoreFromFile(uri: android.net.Uri) {
        viewModelScope.launch {
            try {
                val result = settingsBackupService.importFromFile(uri)
                
                if (result.isSuccess) {
                    _backupResult.emit(Result.success("Settings restored successfully"))
                } else {
                    val error = result.exceptionOrNull()?.message ?: "Unknown error"
                    _backupResult.emit(Result.failure(Exception("Restore failed: $error")))
                }
            } catch (e: Exception) {
                _backupResult.emit(Result.failure(e))
            }
        }
    }

    fun resetToDefaults() {
        viewModelScope.launch {
            preferencesStore.resetToDefaults()
        }
    }
}
