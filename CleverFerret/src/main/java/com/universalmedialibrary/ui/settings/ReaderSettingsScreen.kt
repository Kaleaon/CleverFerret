package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import com.universalmedialibrary.ui.icons.PhosphorIcons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.data.local.entity.ReaderSettings
import com.universalmedialibrary.data.local.entity.ReaderSettingsEntity
import com.universalmedialibrary.data.local.entity.AutoScrollMode
import com.universalmedialibrary.data.local.entity.ReadingTheme
import java.util.Locale
import androidx.compose.foundation.layout.ColumnScope

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
                        Icon(PhosphorIcons.ArrowLeft, contentDescription = "Back")
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
                value = settings.fontSize.toFloat(),
                range = 8f..32f,
                onValueChange = { onSettingsChange(settings.copy(fontSize = it.toInt())) },
                valueDisplay = "${'$'}{settings.fontSize}sp"
            )

            // Line Height (formerly Line Spacing)
            SliderSetting(
                title = "Line Height",
                value = settings.lineHeight,
                range = 1.0f..3.0f,
                onValueChange = { onSettingsChange(settings.copy(lineHeight = it)) },
                valueDisplay = "${'$'}{String.format(Locale.getDefault(), \"%.1f\", settings.lineHeight)}x"
            )
        }

        SettingsGroupCard("Margins") {
            SliderSetting(
                title = "Left Margin",
                value = settings.marginLeft.toFloat(),
                range = 0f..48f,
                onValueChange = { onSettingsChange(settings.copy(marginLeft = it.toInt())) },
                valueDisplay = "${'$'}{settings.marginLeft}dp"
            )
            SliderSetting(
                title = "Right Margin",
                value = settings.marginRight.toFloat(),
                range = 0f..48f,
                onValueChange = { onSettingsChange(settings.copy(marginRight = it.toInt())) },
                valueDisplay = "${'$'}{settings.marginRight}dp"
            )
            SliderSetting(
                title = "Top Margin",
                value = settings.marginTop.toFloat(),
                range = 0f..48f,
                onValueChange = { onSettingsChange(settings.copy(marginTop = it.toInt())) },
                valueDisplay = "${'$'}{settings.marginTop}dp"
            )
            SliderSetting(
                title = "Bottom Margin",
                value = settings.marginBottom.toFloat(),
                range = 0f..48f,
                onValueChange = { onSettingsChange(settings.copy(marginBottom = it.toInt())) },
                valueDisplay = "${'$'}{settings.marginBottom}dp"
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
                checked = settings.enablePageNumbers,
                onCheckedChange = { onSettingsChange(settings.copy(enablePageNumbers = it)) }
            )
            SwitchSetting(
                title = "Show Progress Bar",
                subtitle = "Display reading progress",
                checked = settings.enableProgressIndicator,
                onCheckedChange = { onSettingsChange(settings.copy(enableProgressIndicator = it)) }
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
                listOf("Auto", "Light", "Dark", "Sepia").forEach { themeName ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(vertical = 4.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        RadioButton(
                            selected = settings.theme == themeName,
                            onClick = { onSettingsChange(settings.copy(theme = themeName)) }
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(text = themeName)
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
                checked = settings.tapToTurnPages,
                onCheckedChange = { onSettingsChange(settings.copy(tapToTurnPages = it)) }
            )
            SwitchSetting(
                title = "Swipe to Turn",
                subtitle = "Swipe horizontally to turn pages",
                checked = settings.swipeToTurnPages,
                onCheckedChange = { onSettingsChange(settings.copy(swipeToTurnPages = it)) }
            )
            SwitchSetting(
                title = "Volume Key Navigation",
                subtitle = "Use volume keys to turn pages",
                checked = settings.volumeKeysToTurnPages,
                onCheckedChange = { onSettingsChange(settings.copy(volumeKeysToTurnPages = it)) }
            )
            SwitchSetting(
                title = "Enable Gestures",
                subtitle = "Use gesture-based navigation",
                checked = settings.enableGestures,
                onCheckedChange = { onSettingsChange(settings.copy(enableGestures = it)) }
            )
        }

        SettingsGroupCard("Page Turn Animation") {
            val animations = listOf("None", "Slide", "Fade", "Curl")
            Column {
                animations.forEach { animName ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(vertical = 4.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        RadioButton(
                            selected = settings.pageAnimation == animName,
                            onClick = { onSettingsChange(settings.copy(pageAnimation = animName)) }
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(text = animName)
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
                value = settings.autoScrollSpeed.toFloat(),
                range = 10f..100f,
                onValueChange = { onSettingsChange(settings.copy(autoScrollSpeed = it.toInt())) },
                valueDisplay = "${'$'}{settings.autoScrollSpeed} px/s"
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
                            selected = settings.autoScrollMode == mode.name,
                            onClick = { onSettingsChange(settings.copy(autoScrollMode = mode.name)) }
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
