package com.universalmedialibrary.ui.reader

import android.graphics.Bitmap
import android.net.Uri
import androidx.activity.compose.BackHandler
import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.ArrowForward
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Rect
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.ui.viewer.common.ComicSettings
import com.universalmedialibrary.ui.viewer.common.FitMode
import com.universalmedialibrary.ui.viewer.common.ReadingDirection
import com.universalmedialibrary.ui.viewer.common.ReadingMode
import com.universalmedialibrary.ui.viewer.common.ViewerSettings
import kotlinx.coroutines.delay
import kotlin.math.abs
import kotlin.math.max
import kotlin.math.min

@OptIn(ExperimentalMaterial3Api::class)
@Composable
internal fun ComicReaderSettingsSheet(
    settings: ViewerSettings,
    comicSettings: ComicSettings,
    onDismiss: () -> Unit,
    onSettingsChanged: (ViewerSettings) -> Unit,
    onComicSettingsChanged: (ComicSettings) -> Unit
) {
    ModalBottomSheet(onDismissRequest = onDismiss) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text("Comic Reader Settings", style = MaterialTheme.typography.headlineSmall)
            Spacer(modifier = Modifier.height(16.dp))

            Text("Reading Mode", style = MaterialTheme.typography.titleMedium)
            Row(horizontalArrangement = Arrangement.spacedBy(8.dp), modifier = Modifier.fillMaxWidth()) {
                ReadingMode.values().forEach { mode ->
                    FilterChip(
                        selected = comicSettings.readingMode == mode,
                        onClick = { onComicSettingsChanged(comicSettings.copy(readingMode = mode)) },
                        label = { Text(mode.name.replace("_", " ")) }
                    )
                }
            }

            Spacer(modifier = Modifier.height(12.dp))
            Text("Reading Direction", style = MaterialTheme.typography.titleMedium)
            Row(horizontalArrangement = Arrangement.spacedBy(8.dp), modifier = Modifier.fillMaxWidth()) {
                ReadingDirection.values().forEach { direction ->
                    FilterChip(
                        selected = comicSettings.readingDirection == direction,
                        onClick = { onComicSettingsChanged(comicSettings.copy(readingDirection = direction)) },
                        label = { Text(direction.name.replace("_", " ")) }
                    )
                }
            }

            Spacer(modifier = Modifier.height(12.dp))
            Text("Fit Mode", style = MaterialTheme.typography.titleMedium)
            Row(horizontalArrangement = Arrangement.spacedBy(8.dp), modifier = Modifier.fillMaxWidth()) {
                FitMode.values().forEach { mode ->
                    FilterChip(
                        selected = comicSettings.fitMode == mode,
                        onClick = { onComicSettingsChanged(comicSettings.copy(fitMode = mode)) },
                        label = { Text(mode.name.replace("_", " ")) }
                    )
                }
            }

            Spacer(modifier = Modifier.height(12.dp))
            Text("Zoom Limit: ${String.format("%.1f", comicSettings.maxZoom)}x", style = MaterialTheme.typography.titleMedium)
            Slider(
                value = comicSettings.maxZoom,
                onValueChange = { onComicSettingsChanged(comicSettings.copy(maxZoom = it)) },
                valueRange = 1.5f..6f,
                steps = 9
            )

            Spacer(modifier = Modifier.height(12.dp))
            Text("Reader Comfort", style = MaterialTheme.typography.titleMedium)
            SettingToggleRow(
                title = "Night Mode",
                checked = settings.nightMode,
                onCheckedChange = { onSettingsChanged(settings.copy(nightMode = it)) }
            )
            SettingToggleRow(
                title = "Blue Light Filter",
                checked = settings.blueLightFilter,
                onCheckedChange = { onSettingsChanged(settings.copy(blueLightFilter = it)) }
            )
            SettingToggleRow(
                title = "Keep Screen On",
                checked = settings.keepScreenOn,
                onCheckedChange = { onSettingsChanged(settings.copy(keepScreenOn = it)) }
            )

            Spacer(modifier = Modifier.height(12.dp))
            Text("Panel Navigation", style = MaterialTheme.typography.titleMedium)
            SettingToggleRow(
                title = "Panel Detection",
                checked = comicSettings.panelDetection,
                onCheckedChange = { onComicSettingsChanged(comicSettings.copy(panelDetection = it)) }
            )
            SettingToggleRow(
                title = "Panel-by-Panel Mode",
                checked = comicSettings.panelByPanelMode,
                onCheckedChange = { onComicSettingsChanged(comicSettings.copy(panelByPanelMode = it)) }
            )
            SettingToggleRow(
                title = "Show Panel Borders",
                checked = comicSettings.showPanelBorders,
                onCheckedChange = { onComicSettingsChanged(comicSettings.copy(showPanelBorders = it)) }
            )

            Spacer(modifier = Modifier.height(16.dp))
            Button(onClick = onDismiss, modifier = Modifier.fillMaxWidth()) {
                Text("Done")
            }
        }
    }
}
