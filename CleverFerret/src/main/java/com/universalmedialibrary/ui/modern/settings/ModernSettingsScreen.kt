// ModernSettingsScreen — top-level settings list with grouped sections.
// Uses CFSettingsRow for each entry; supports a header card for the active
// theme (tap to open the theme picker).

package com.universalmedialibrary.ui.modern.settings

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
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFSettingsRow
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class SettingsEntry(
    val id: String,
    val title: String,
    val subtitle: String? = null,
    val icon: ImageVector,
)

data class SettingsGroup(val title: String, val entries: List<SettingsEntry>)

data class ModernSettingsUiState(
    val activeThemeName: String,
    val groups: List<SettingsGroup>,
)

object DefaultSettingsGroups {
    val DEFAULT = listOf(
        SettingsGroup(
            "Library", listOf(
                SettingsEntry("libraries", "Manage libraries", "Calibre · OPDS · local · cloud", Icons.Default.LibraryBooks),
                SettingsEntry("import",    "Import & export",  "Bring in or back up your collection",   Icons.Default.SwapVert),
                SettingsEntry("storage",   "Storage organizer","Auto-sort downloads by format",         Icons.Default.Folder),
                SettingsEntry("opds",      "OPDS feeds",       "Subscribed catalogs",                    Icons.Default.Public),
            ),
        ),
        SettingsGroup(
            "Playback & reading", listOf(
                SettingsEntry("reader",   "Reader",          "Fonts, layout, TTS",                Icons.Default.MenuBook),
                SettingsEntry("audio",    "Audio effects",   "EQ · spatial · DSP",                Icons.Default.GraphicEq),
                SettingsEntry("profiles", "Audio profiles",  "Per-headphone presets",             Icons.Default.Headphones),
                SettingsEntry("playlist", "Playlists",       "Smart rules and ordering",          Icons.Default.QueueMusic),
                SettingsEntry("tts",      "Text-to-speech",  "Voices and providers",              Icons.Default.RecordVoiceOver),
            ),
        ),
        SettingsGroup(
            "Connections", listOf(
                SettingsEntry("plex",     "Plex / Jellyfin", "Media server pairing",              Icons.Default.Cast),
                SettingsEntry("network",  "Network storage", "SMB · NFS · WebDAV",                Icons.Default.Storage),
                SettingsEntry("lastfm",   "Last.fm",         "Scrobbling",                        Icons.Default.MusicNote),
                SettingsEntry("api",      "Web API",         "Local HTTP server",                 Icons.Default.Api),
            ),
        ),
        SettingsGroup(
            "Privacy & device", listOf(
                SettingsEntry("security", "Security & PIN",  "Lock and biometrics",               Icons.Default.Lock),
                SettingsEntry("parental", "Parental",        "Content filtering",                  Icons.Default.ChildCare),
                SettingsEntry("backup",   "Backup",          "Export device state",                Icons.Default.Backup),
                SettingsEntry("about",    "About",           "Version, licenses, contributors",    Icons.Default.Info),
            ),
        ),
    )
}

@Composable
fun ModernSettingsScreen(
    state: ModernSettingsUiState,
    onBack: () -> Unit,
    onOpenThemePicker: () -> Unit,
    onSelectEntry: (SettingsEntry) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = { CFTopBar(title = "Settings", onBack = onBack) },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            modifier = Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(
                start = CFSpacing.lg, end = CFSpacing.lg,
                top = CFSpacing.md, bottom = CFSpacing.xxl,
            ),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            item {
                ActiveThemeCard(
                    themeName = state.activeThemeName,
                    onOpenThemePicker = onOpenThemePicker,
                )
            }

            state.groups.forEach { group ->
                item {
                    Text(
                        group.title.uppercase(),
                        style = MaterialTheme.typography.labelMedium,
                        color = cs.onSurfaceVariant,
                        modifier = Modifier.padding(top = CFSpacing.sm, start = CFSpacing.sm),
                    )
                    Spacer(Modifier.height(CFSpacing.xs))
                    Column(
                        Modifier
                            .clip(RoundedCornerShape(14.dp))
                            .background(cs.surface)
                            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp)),
                    ) {
                        group.entries.forEachIndexed { idx, entry ->
                            CFSettingsRow(
                                icon = entry.icon,
                                title = entry.title,
                                subtitle = entry.subtitle,
                                onClick = { onSelectEntry(entry) },
                            )
                            if (idx != group.entries.lastIndex) {
                                HorizontalDivider(
                                    color = cs.outline.copy(alpha = 0.2f),
                                    modifier = Modifier.padding(start = 64.dp),
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun ActiveThemeCard(themeName: String, onOpenThemePicker: () -> Unit) {
    val tokens = LocalCFTokens.current
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(16.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.4f), RoundedCornerShape(16.dp))
            .clickable(onClick = onOpenThemePicker)
            .padding(CFSpacing.lg),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.lg),
    ) {
        Box(
            Modifier
                .size(56.dp)
                .clip(RoundedCornerShape(14.dp))
                .background(tokens.metal.brush()),
        )
        Column(Modifier.weight(1f)) {
            Text(
                "Active theme",
                style = MaterialTheme.typography.labelMedium,
                color = cs.onSurfaceVariant,
            )
            Text(
                themeName,
                style = MaterialTheme.typography.titleLarge.copy(
                    brush = tokens.metal.brush(),
                    fontWeight = FontWeight.Black,
                ),
            )
        }
        Icon(Icons.Default.ChevronRight, contentDescription = null, tint = cs.onSurfaceVariant)
    }
}
