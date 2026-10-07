// ModernVisualizerScreen — full-bleed audio visualizer with a slide-up
// preset / parameter sheet. The actual visualizer rendering is supplied
// by the caller as `surface` so this screen stays test-friendly.

package com.universalmedialibrary.ui.modern.visualizer

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.theme.CFSpacing

data class UiVisualizerPreset(
    val id: String,
    val name: String,
    val description: String,
    val accent: Color,
    val active: Boolean = false,
)

data class UiVisualizerParam(
    val key: String,
    val label: String,
    val value: Float,
    val min: Float = 0f,
    val max: Float = 1f,
)

data class ModernVisualizerUiState(
    val activePresetName: String,
    val presets: List<UiVisualizerPreset>,
    val parameters: List<UiVisualizerParam>,
    val sheetExpanded: Boolean = false,
    val running: Boolean = true,
)

@Composable
fun ModernVisualizerScreen(
    state: ModernVisualizerUiState,
    onBack: () -> Unit,
    onTogglePlay: () -> Unit,
    onPickPreset: (UiVisualizerPreset) -> Unit,
    onChangeParam: (UiVisualizerParam, Float) -> Unit,
    onToggleSheet: () -> Unit,
    surface: @Composable BoxScope.() -> Unit,
) {
    Box(Modifier.fillMaxSize().background(Color.Black)) {
        surface()

        // Top overlay
        Row(
            Modifier
                .fillMaxWidth()
                .background(Brush.verticalGradient(listOf(Color.Black.copy(alpha = 0.55f), Color.Transparent)))
                .padding(CFSpacing.md),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            IconButton(onClick = onBack) { Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back", tint = Color.White) }
            Text(
                state.activePresetName,
                style = MaterialTheme.typography.titleMedium,
                color = Color.White,
                fontWeight = FontWeight.Black,
                modifier = Modifier.weight(1f).padding(start = CFSpacing.sm),
            )
            IconButton(onClick = onTogglePlay) {
                Icon(
                    if (state.running) Icons.Default.Pause else Icons.Default.PlayArrow,
                    contentDescription = "Play/Pause",
                    tint = Color.White,
                )
            }
        }

        // Bottom sheet
        Column(
            Modifier
                .align(Alignment.BottomCenter)
                .fillMaxWidth()
                .clip(RoundedCornerShape(topStart = 16.dp, topEnd = 16.dp))
                .background(MaterialTheme.colorScheme.surface)
                .padding(CFSpacing.md),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
        ) {
            // Drag handle / toggle
            Box(
                Modifier
                    .align(Alignment.CenterHorizontally)
                    .clickable(onClick = onToggleSheet)
                    .padding(8.dp),
            ) {
                Box(
                    Modifier
                        .width(40.dp)
                        .height(4.dp)
                        .clip(RoundedCornerShape(2.dp))
                        .background(MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.5f)),
                )
            }
            Text("Presets", style = MaterialTheme.typography.titleSmall)
            LazyRow(horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
                items(state.presets) { preset -> PresetTile(preset, onClick = { onPickPreset(preset) }) }
            }
            if (state.sheetExpanded) {
                Text("Parameters", style = MaterialTheme.typography.titleSmall, modifier = Modifier.padding(top = CFSpacing.sm))
                LazyColumn(
                    modifier = Modifier.heightIn(max = 240.dp),
                    verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
                ) {
                    items(state.parameters) { param -> ParamRow(param, onChange = { onChangeParam(param, it) }) }
                }
            }
        }
    }
}

@Composable
private fun PresetTile(preset: UiVisualizerPreset, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Column(
        Modifier
            .width(120.dp)
            .clip(RoundedCornerShape(10.dp))
            .background(if (preset.active) cs.primaryContainer.copy(alpha = 0.4f) else cs.surface)
            .border(1.dp, if (preset.active) cs.primary else cs.outline.copy(alpha = 0.3f), RoundedCornerShape(10.dp))
            .clickable(onClick = onClick)
            .padding(CFSpacing.sm),
    ) {
        Box(
            Modifier
                .fillMaxWidth()
                .height(40.dp)
                .clip(RoundedCornerShape(6.dp))
                .background(Brush.linearGradient(listOf(preset.accent, preset.accent.copy(alpha = 0.4f)))),
        )
        Spacer(Modifier.height(4.dp))
        Text(preset.name, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
        Text(preset.description, style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant, maxLines = 1, overflow = TextOverflow.Ellipsis)
    }
}

@Composable
private fun ParamRow(param: UiVisualizerParam, onChange: (Float) -> Unit) {
    val cs = MaterialTheme.colorScheme
    Column {
        Row {
            Text(param.label, modifier = Modifier.weight(1f), style = MaterialTheme.typography.bodyMedium)
            Text("%.2f".format(param.value), style = MaterialTheme.typography.labelMedium, color = cs.onSurfaceVariant)
        }
        Slider(
            value = param.value.coerceIn(param.min, param.max),
            onValueChange = onChange,
            valueRange = param.min..param.max,
        )
    }
}
