// ModernMetadataEditorScreen — generic metadata editor for any media item.
// Hero with cover swap, sectioned form fields (Identification, Authoring,
// Classification, Files), tags chip flow, save / cancel bottom bar.

package com.universalmedialibrary.ui.modern.metadata

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTagChip
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

data class MetadataField(
    val key: String,
    val label: String,
    val value: String,
    val multiline: Boolean = false,
)

data class MetadataSection(val title: String, val fields: List<MetadataField>)

data class ModernMetadataEditorUiState(
    val title: String,
    val subtitle: String,
    val coverHue: Color,
    val sections: List<MetadataSection>,
    val tags: List<String>,
    val unsavedChanges: Boolean = false,
    val autoFetchAvailable: Boolean = true,
)

@OptIn(ExperimentalLayoutApi::class)
@Composable
fun ModernMetadataEditorScreen(
    state: ModernMetadataEditorUiState,
    onBack: () -> Unit,
    onPickCover: () -> Unit,
    onChangeField: (sectionIndex: Int, fieldIndex: Int, newValue: String) -> Unit,
    onAddTag: () -> Unit,
    onRemoveTag: (String) -> Unit,
    onAutoFetch: () -> Unit,
    onSave: () -> Unit,
    onCancel: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Edit metadata",
                onBack = onBack,
                actions = {
                    if (state.autoFetchAvailable) {
                        IconButton(onClick = onAutoFetch) {
                            Icon(Icons.Default.AutoAwesome, contentDescription = "Auto fetch")
                        }
                    }
                },
            )
        },
        bottomBar = {
            Row(
                Modifier
                    .fillMaxWidth()
                    .background(cs.surface)
                    .padding(CFSpacing.lg),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
            ) {
                OutlinedButton(onClick = onCancel) { Text("Cancel") }
                Spacer(Modifier.weight(1f))
                CFMetalButton(
                    text = if (state.unsavedChanges) "Save changes" else "Saved",
                    onClick = onSave,
                    leadingIcon = Icons.Default.Check,
                )
            }
        },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            item {
                Row(
                    Modifier
                        .fillMaxWidth()
                        .padding(CFSpacing.lg),
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.lg),
                    verticalAlignment = Alignment.CenterVertically,
                ) {
                    Box(
                        Modifier
                            .size(width = 96.dp, height = 132.dp)
                            .clip(RoundedCornerShape(8.dp))
                            .background(Brush.linearGradient(listOf(state.coverHue, state.coverHue.copy(alpha = 0.4f))))
                            .clickable(onClick = onPickCover),
                        contentAlignment = Alignment.Center,
                    ) {
                        Icon(Icons.Default.AddPhotoAlternate, contentDescription = "Change cover", tint = Color.White)
                    }
                    Column(Modifier.weight(1f)) {
                        Text(state.title, style = MaterialTheme.typography.titleLarge, maxLines = 2, overflow = TextOverflow.Ellipsis)
                        Text(state.subtitle, style = MaterialTheme.typography.bodyMedium, color = cs.onSurfaceVariant, maxLines = 1)
                    }
                }
            }

            state.sections.forEachIndexed { sIdx, section ->
                item {
                    Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                        CFSectionHeader(section.title)
                        Spacer(Modifier.height(CFSpacing.sm))
                        Column(verticalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
                            section.fields.forEachIndexed { fIdx, field ->
                                OutlinedTextField(
                                    value = field.value,
                                    onValueChange = { onChangeField(sIdx, fIdx, it) },
                                    label = { Text(field.label) },
                                    singleLine = !field.multiline,
                                    minLines = if (field.multiline) 3 else 1,
                                    modifier = Modifier.fillMaxWidth(),
                                )
                            }
                        }
                    }
                }
            }

            item {
                Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                    CFSectionHeader("Tags", actionLabel = "Add", onAction = onAddTag)
                    Spacer(Modifier.height(CFSpacing.sm))
                    FlowRow(horizontalArrangement = Arrangement.spacedBy(CFSpacing.xs), verticalArrangement = Arrangement.spacedBy(CFSpacing.xs)) {
                        state.tags.forEach { tag ->
                            Box(Modifier.clickable { onRemoveTag(tag) }) {
                                CFTagChip(text = "$tag  ✕", selected = true)
                            }
                        }
                    }
                }
            }
        }
    }
}
