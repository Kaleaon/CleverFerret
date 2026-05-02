// ModernAudioPackImportScreen — pick a sound pack archive, preview the
// included samples, and confirm import. Used to bring third-party
// soundscape packs into the local library.

package com.universalmedialibrary.ui.modern.ambient

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

data class UiPackSample(
    val id: String,
    val name: String,
    val durationLabel: String,
    val sizeLabel: String,
    val accent: Color,
    val previewing: Boolean = false,
)

data class ModernAudioPackImportUiState(
    val packName: String?,
    val packAuthor: String?,
    val packDescription: String?,
    val sourcePath: String?,
    val samples: List<UiPackSample> = emptyList(),
    val isReading: Boolean = false,
    val isImporting: Boolean = false,
    val errorMessage: String? = null,
)

@Composable
fun ModernAudioPackImportScreen(
    state: ModernAudioPackImportUiState,
    onBack: () -> Unit,
    onPickFile: () -> Unit,
    onPreviewSample: (UiPackSample) -> Unit,
    onConfirmImport: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = { CFTopBar(title = "Import sound pack", onBack = onBack) },
        bottomBar = {
            if (state.samples.isNotEmpty()) {
                Row(
                    Modifier
                        .fillMaxWidth()
                        .background(cs.surface)
                        .padding(CFSpacing.lg),
                    verticalAlignment = Alignment.CenterVertically,
                ) {
                    Text(
                        "${state.samples.size} samples",
                        style = MaterialTheme.typography.labelMedium,
                        color = cs.onSurfaceVariant,
                        modifier = Modifier.weight(1f),
                    )
                    CFMetalButton(
                        text = if (state.isImporting) "Importing..." else "Import",
                        onClick = onConfirmImport,
                        leadingIcon = Icons.Default.Check,
                    )
                }
            }
        },
        containerColor = cs.background,
    ) { padding ->
        when {
            state.isReading -> Box(Modifier.fillMaxSize().padding(padding), contentAlignment = Alignment.Center) {
                CircularProgressIndicator(color = cs.primary)
            }
            state.errorMessage != null -> Box(Modifier.fillMaxSize().padding(padding)) {
                CFEmptyState(
                    icon = Icons.Default.ErrorOutline,
                    title = "Couldn't read pack",
                    body = state.errorMessage,
                    actionLabel = "Try again",
                    onAction = onPickFile,
                )
            }
            state.samples.isEmpty() -> Box(Modifier.fillMaxSize().padding(padding)) {
                CFEmptyState(
                    icon = Icons.Default.LibraryMusic,
                    title = "Pick a sound pack",
                    body = "Choose a .zip / .audiopack archive containing samples to import.",
                    actionLabel = "Pick file",
                    onAction = onPickFile,
                )
            }
            else -> LazyColumn(
                Modifier.fillMaxSize().padding(padding),
                contentPadding = PaddingValues(bottom = CFSpacing.xxl),
                verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
            ) {
                item {
                    Column(
                        Modifier
                            .fillMaxWidth()
                            .padding(horizontal = CFSpacing.lg)
                            .clip(RoundedCornerShape(16.dp))
                            .background(cs.surface)
                            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(16.dp))
                            .padding(CFSpacing.lg),
                        verticalArrangement = Arrangement.spacedBy(4.dp),
                    ) {
                        Text(state.packName ?: "Untitled pack", style = MaterialTheme.typography.titleLarge, fontWeight = FontWeight.Black)
                        state.packAuthor?.let { Text(it, style = MaterialTheme.typography.bodyMedium, color = cs.onSurfaceVariant) }
                        state.packDescription?.let {
                            Spacer(Modifier.height(CFSpacing.xs))
                            Text(it, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 4, overflow = TextOverflow.Ellipsis)
                        }
                        state.sourcePath?.let {
                            Spacer(Modifier.height(CFSpacing.xs))
                            Text("Source: $it", style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant, maxLines = 1, overflow = TextOverflow.Ellipsis)
                        }
                    }
                }
                items(state.samples) { sample -> SampleRow(sample, onPreview = { onPreviewSample(sample) }) }
            }
        }
    }
}

@Composable
private fun SampleRow(sample: UiPackSample, onPreview: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(10.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(10.dp))
            .clickable(onClick = onPreview)
            .padding(CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(
            Modifier
                .size(40.dp)
                .clip(CircleShape)
                .background(sample.accent),
            contentAlignment = Alignment.Center,
        ) {
            Icon(if (sample.previewing) Icons.Default.Pause else Icons.Default.PlayArrow, contentDescription = null, tint = Color.White)
        }
        Column(Modifier.weight(1f)) {
            Text(sample.name, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
            Text("${sample.durationLabel} · ${sample.sizeLabel}", style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant)
        }
    }
}
