// ModernPreferencesScreen — generic preferences host. One screen replaces:
//   AudioEffectsSettings, AudioProfiles, PlaylistSettings, ReaderSettings,
//   ReadingPreferences, TtsProviderSettings, NetworkStorageSettings,
//   OpdsSettings, SecuritySettings, ParentalControls, APISettings,
//   LastFmSettings, StorageOrganizer, ImportExport, ComicTranslationSettings,
//   GallerySettings, MediaServerSettings, etc.
//
// Each existing settings screen passes its title + a list of PrefSection
// containing PrefItems (toggle, slider, dropdown, text, action, info).

package com.universalmedialibrary.ui.modern.preferences

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ChevronRight
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

/** A single preference row. */
sealed class PrefItem {
    abstract val id: String
    abstract val title: String
    abstract val subtitle: String?
    abstract val icon: ImageVector?
    abstract val enabled: Boolean

    data class Toggle(
        override val id: String,
        override val title: String,
        override val subtitle: String? = null,
        override val icon: ImageVector? = null,
        override val enabled: Boolean = true,
        val checked: Boolean,
    ) : PrefItem()

    data class Slider(
        override val id: String,
        override val title: String,
        override val subtitle: String? = null,
        override val icon: ImageVector? = null,
        override val enabled: Boolean = true,
        val value: Float,
        val min: Float = 0f,
        val max: Float = 1f,
        val displayValue: String? = null,
    ) : PrefItem()

    data class Dropdown(
        override val id: String,
        override val title: String,
        override val subtitle: String? = null,
        override val icon: ImageVector? = null,
        override val enabled: Boolean = true,
        val selectedLabel: String,
        val options: List<String>,
    ) : PrefItem()

    data class TextEntry(
        override val id: String,
        override val title: String,
        override val subtitle: String? = null,
        override val icon: ImageVector? = null,
        override val enabled: Boolean = true,
        val value: String,
        val placeholder: String = "",
        val secret: Boolean = false,
    ) : PrefItem()

    data class Action(
        override val id: String,
        override val title: String,
        override val subtitle: String? = null,
        override val icon: ImageVector? = null,
        override val enabled: Boolean = true,
        val destructive: Boolean = false,
    ) : PrefItem()

    data class Info(
        override val id: String,
        override val title: String,
        override val subtitle: String? = null,
        override val icon: ImageVector? = null,
        override val enabled: Boolean = true,
        val value: String,
    ) : PrefItem()
}

data class PrefSection(val title: String?, val items: List<PrefItem>)

data class ModernPreferencesUiState(
    val title: String,
    val sections: List<PrefSection>,
)

@Composable
fun ModernPreferencesScreen(
    state: ModernPreferencesUiState,
    onBack: () -> Unit,
    onToggle: (PrefItem.Toggle, Boolean) -> Unit,
    onSlide: (PrefItem.Slider, Float) -> Unit,
    onPickOption: (PrefItem.Dropdown) -> Unit,
    onChangeText: (PrefItem.TextEntry, String) -> Unit,
    onAction: (PrefItem.Action) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = { CFTopBar(title = state.title, onBack = onBack) },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(horizontal = CFSpacing.lg, vertical = CFSpacing.md),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            state.sections.forEach { section ->
                item {
                    Column {
                        section.title?.let {
                            CFSectionHeader(it)
                            Spacer(Modifier.height(CFSpacing.sm))
                        }
                        Column(
                            Modifier
                                .fillMaxWidth()
                                .clip(RoundedCornerShape(14.dp))
                                .background(cs.surface)
                                .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp)),
                        ) {
                            section.items.forEachIndexed { idx, item ->
                                PrefRow(
                                    item = item,
                                    onToggle = onToggle,
                                    onSlide = onSlide,
                                    onPickOption = onPickOption,
                                    onChangeText = onChangeText,
                                    onAction = onAction,
                                )
                                if (idx != section.items.lastIndex) {
                                    HorizontalDivider(color = cs.outline.copy(alpha = 0.2f), modifier = Modifier.padding(start = if (item.icon != null) 64.dp else CFSpacing.lg))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun PrefRow(
    item: PrefItem,
    onToggle: (PrefItem.Toggle, Boolean) -> Unit,
    onSlide: (PrefItem.Slider, Float) -> Unit,
    onPickOption: (PrefItem.Dropdown) -> Unit,
    onChangeText: (PrefItem.TextEntry, String) -> Unit,
    onAction: (PrefItem.Action) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .let {
                when (item) {
                    is PrefItem.Action   -> it.clickable(enabled = item.enabled) { onAction(item) }
                    is PrefItem.Dropdown -> it.clickable(enabled = item.enabled) { onPickOption(item) }
                    else                 -> it
                }
            }
            .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.md),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        item.icon?.let {
            Box(
                Modifier
                    .size(40.dp)
                    .clip(RoundedCornerShape(10.dp))
                    .background(cs.surfaceVariant),
                contentAlignment = Alignment.Center,
            ) {
                Icon(
                    it,
                    contentDescription = null,
                    tint = if (item is PrefItem.Action && item.destructive) cs.error else cs.primary,
                )
            }
        }
        Column(Modifier.weight(1f)) {
            Text(
                item.title,
                style = MaterialTheme.typography.titleSmall,
                color = if (item is PrefItem.Action && item.destructive) cs.error else cs.onSurface,
                fontWeight = if (item is PrefItem.Action && item.destructive) FontWeight.Black else FontWeight.SemiBold,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
            )
            item.subtitle?.let {
                Text(it, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 2, overflow = TextOverflow.Ellipsis)
            }
            when (item) {
                is PrefItem.Slider -> {
                    Spacer(Modifier.height(4.dp))
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Slider(
                            value = item.value.coerceIn(item.min, item.max),
                            onValueChange = { onSlide(item, it) },
                            valueRange = item.min..item.max,
                            enabled = item.enabled,
                            modifier = Modifier.weight(1f),
                        )
                        Text(
                            item.displayValue ?: "%.2f".format(item.value),
                            style = MaterialTheme.typography.labelMedium,
                            color = cs.onSurfaceVariant,
                            modifier = Modifier.padding(start = CFSpacing.sm),
                        )
                    }
                }
                is PrefItem.TextEntry -> {
                    Spacer(Modifier.height(4.dp))
                    OutlinedTextField(
                        value = item.value,
                        onValueChange = { onChangeText(item, it) },
                        placeholder = { Text(item.placeholder) },
                        singleLine = true,
                        enabled = item.enabled,
                        modifier = Modifier.fillMaxWidth(),
                        visualTransformation = if (item.secret) androidx.compose.ui.text.input.PasswordVisualTransformation() else androidx.compose.ui.text.input.VisualTransformation.None,
                    )
                }
                else -> Unit
            }
        }
        when (item) {
            is PrefItem.Toggle   -> Switch(checked = item.checked, onCheckedChange = { onToggle(item, it) }, enabled = item.enabled)
            is PrefItem.Dropdown -> {
                Text(item.selectedLabel, style = MaterialTheme.typography.labelMedium, color = cs.primary)
                Icon(Icons.Default.ChevronRight, contentDescription = null, tint = cs.onSurfaceVariant)
            }
            is PrefItem.Action   -> Icon(Icons.Default.ChevronRight, contentDescription = null, tint = cs.onSurfaceVariant)
            is PrefItem.Info     -> Text(item.value, style = MaterialTheme.typography.labelMedium, color = cs.onSurfaceVariant)
            else -> Unit
        }
    }
}
