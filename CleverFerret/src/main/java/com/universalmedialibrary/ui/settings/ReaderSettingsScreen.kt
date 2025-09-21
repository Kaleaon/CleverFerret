package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.data.settings.ReaderSettings
import com.universalmedialibrary.data.settings.AutoScrollMode
import com.universalmedialibrary.data.settings.PageAnimation
import com.universalmedialibrary.data.settings.ReaderTheme
import java.util.Locale
import com.universalmedialibrary.ui.theme.CleverFerretProfessionalColors

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ReaderSettingsScreen(
    navController: NavController,
    settingsType: String,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val readerSettings by viewModel.readerSettings.collectAsState()
    
    val (title, description) = when (settingsType) {
        "visual" -> "Visual Controls" to "Customize fonts, margins, and layout"
        "theme" -> "Theming" to "Light/Dark/Other modes"
        "paging" -> "Paging & Navigation" to "Touch and hardware controls"
        "autoscroll" -> "Auto-Scroll" to "Hands-free reading speed and mode"
        else -> "Reader Settings" to "Configure reading experience"
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(title) },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            item {
                Text(
                    text = description,
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            when (settingsType) {
                "visual" -> {
                    item {
                        VisualControlsSection(
                            settings = readerSettings,
                            onSettingsChange = viewModel::updateReaderSettings
                        )
                    }
                }
                "theme" -> {
                    item {
                        ThemeSection(
                            settings = readerSettings,
                            onSettingsChange = viewModel::updateReaderSettings
                        )
                    }
                }
                "paging" -> {
                    item {
                        PagingSection(
                            settings = readerSettings,
                            onSettingsChange = viewModel::updateReaderSettings
                        )
                    }
                }
                "autoscroll" -> {
                    item {
                        AutoScrollSection(
                            settings = readerSettings,
                            onSettingsChange = viewModel::updateReaderSettings
                        )
                    }
                }
            }
        }
    }
}

@Composable
fun VisualControlsSection(
    settings: ReaderSettings,
    onSettingsChange: (ReaderSettings) -> Unit
) {
    Column(
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        SettingsGroupCard("Font Settings") {
            // Font Size
            SliderSetting(
                title = "Font Size",
                value = settings.fontSize,
                range = 8f..32f,
                onValueChange = { onSettingsChange(settings.copy(fontSize = it)) },
                valueDisplay = "${'$'}{settings.fontSize.toInt()}sp"
            )
            
            // Line Spacing
            SliderSetting(
                title = "Line Spacing",
                value = settings.lineSpacing,
                range = 1.0f..3.0f,
                onValueChange = { onSettingsChange(settings.copy(lineSpacing = it)) },
                valueDisplay = "${'$'}{String.format(Locale.getDefault(), \"%.1f\", settings.lineSpacing)}x"
            )
        }
        
        SettingsGroupCard("Margins") {
            SliderSetting(
                title = "Horizontal Margin",
                value = settings.marginHorizontal,
                range = 0f..48f,
                onValueChange = { onSettingsChange(settings.copy(marginHorizontal = it)) },
                valueDisplay = "${'$'}{settings.marginHorizontal.toInt()}dp"
            )
            SliderSetting(
                title = "Vertical Margin",
                value = settings.marginVertical,
                range = 0f..48f,
                onValueChange = { onSettingsChange(settings.copy(marginVertical = it)) },
                valueDisplay = "${'$'}{settings.marginVertical.toInt()}dp"
            )
        }
        
        SettingsGroupCard("Display") {
            SwitchSetting(
                title = "Keep Screen On",
                subtitle = "Prevent screen from turning off while reading",
                checked = settings.keepScreenOn,
                onCheckedChange = { onSettingsChange(settings.copy(keepScreenOn = it)) }
            )
            SwitchSetting(
                title = "Fullscreen Mode",
                subtitle = "Hide system bars while reading",
                checked = settings.fullScreenMode,
                onCheckedChange = { onSettingsChange(settings.copy(fullScreenMode = it)) }
            )
            SwitchSetting(
                title = "Show Page Numbers",
                subtitle = "Display current page indicator",
                checked = settings.showPageNumbers,
                onCheckedChange = { onSettingsChange(settings.copy(showPageNumbers = it)) }
            )
            SwitchSetting(
                title = "Show Progress Bar",
                subtitle = "Display reading progress",
                checked = settings.showProgressBar,
                onCheckedChange = { onSettingsChange(settings.copy(showProgressBar = it)) }
            )
        }
    }
}

@Composable
fun ThemeSection(
    settings: ReaderSettings,
    onSettingsChange: (ReaderSettings) -> Unit
) {
    Column(
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        SettingsGroupCard("Theme Mode") {
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                ReaderTheme.values().forEach { theme ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(vertical = 4.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        RadioButton(
                            selected = settings.theme == theme,
                            onClick = { onSettingsChange(settings.copy(theme = theme)) }
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(text = theme.name)
                    }
                }
            }
        }
    }
}

@Composable
fun PagingSection(
    settings: ReaderSettings,
    onSettingsChange: (ReaderSettings) -> Unit
) {
    Column(
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        SettingsGroupCard("Touch Controls") {
            SwitchSetting(
                title = "Tap to Turn",
                subtitle = "Tap screen edges to turn pages",
                checked = settings.tapToTurn,
                onCheckedChange = { onSettingsChange(settings.copy(tapToTurn = it)) }
            )
            SwitchSetting(
                title = "Swipe to Turn",
                subtitle = "Swipe horizontally to turn pages",
                checked = settings.swipeToTurn,
                onCheckedChange = { onSettingsChange(settings.copy(swipeToTurn = it)) }
            )
            SwitchSetting(
                title = "Volume Key Navigation",
                subtitle = "Use volume keys to turn pages",
                checked = settings.volumeKeyNavigation,
                onCheckedChange = { onSettingsChange(settings.copy(volumeKeyNavigation = it)) }
            )
            SwitchSetting(
                title = "Enable Gestures",
                subtitle = "Use gesture-based navigation",
                checked = settings.enableGestures,
                onCheckedChange = { onSettingsChange(settings.copy(enableGestures = it)) }
            )
        }
        
        SettingsGroupCard("Page Turn Animation") {
            val animations = PageAnimation.values()
            Column {
                animations.forEach { anim ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(vertical = 4.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        RadioButton(
                            selected = settings.pageAnimation == anim,
                            onClick = { onSettingsChange(settings.copy(pageAnimation = anim)) }
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(text = anim.name)
                    }
                }
            }
        }
    }
}

@Composable
fun AutoScrollSection(
    settings: ReaderSettings,
    onSettingsChange: (ReaderSettings) -> Unit
) {
    Column(
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        SettingsGroupCard("Auto-Scroll") {
            SliderSetting(
                title = "Scroll Speed",
                value = settings.autoScrollSpeed,
                range = 10f..100f,
                onValueChange = { onSettingsChange(settings.copy(autoScrollSpeed = it)) },
                valueDisplay = "${'$'}{settings.autoScrollSpeed.toInt()} px/s"
            )
            
            // Scroll Mode
            Column {
                Text(
                    text = "Scroll Mode",
                    style = MaterialTheme.typography.titleSmall,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
                AutoScrollMode.values().forEach { mode ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(vertical = 4.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        RadioButton(
                            selected = settings.autoScrollMode == mode,
                            onClick = { onSettingsChange(settings.copy(autoScrollMode = mode)) }
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(text = mode.name)
                    }
                }
            }
        }
    }
}

@Composable
fun SettingsGroupCard(
    title: String,
    content: @Composable ColumnScope.() -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = title,
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.primary,
                modifier = Modifier.padding(bottom = 12.dp)
            )
            content()
        }
    }
}

@Composable
fun SwitchSetting(
    title: String,
    subtitle: String,
    checked: Boolean,
    onCheckedChange: (Boolean) -> Unit
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = title,
                style = MaterialTheme.typography.bodyLarge
            )
            Text(
                text = subtitle,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
        Switch(
            checked = checked,
            onCheckedChange = onCheckedChange
        )
    }
}

@Composable
fun SliderSetting(
    title: String,
    value: Float,
    range: ClosedFloatingPointRange<Float>,
    onValueChange: (Float) -> Unit,
    valueDisplay: String
) {
    Column {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = title,
                style = MaterialTheme.typography.bodyLarge
            )
            Text(
                text = valueDisplay,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.primary
            )
        }
        Slider(
            value = value,
            onValueChange = onValueChange,
            valueRange = range,
            modifier = Modifier.fillMaxWidth()
        )
    }
}