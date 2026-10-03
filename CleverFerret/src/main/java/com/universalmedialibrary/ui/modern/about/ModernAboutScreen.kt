// ModernAboutScreen — version, build info, links, contributors, licenses.
// Replaces both the standalone About and AboutLibraries screens; the
// licenses list is supplied as already-rendered entries so the existing
// aboutlibraries pipeline can hand them in.

package com.universalmedialibrary.ui.modern.about

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
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class AboutLink(val label: String, val url: String, val icon: ImageVector)

data class AboutLicense(
    val name: String,
    val version: String,
    val licenseId: String,
    val author: String? = null,
)

data class ModernAboutUiState(
    val versionName: String,
    val versionCode: Int,
    val buildLabel: String,        // "release · 7d2cb1a"
    val tagline: String = "Universal Media Library",
    val links: List<AboutLink>,
    val contributors: List<String>,
    val licenses: List<AboutLicense>,
)

@Composable
fun ModernAboutScreen(
    state: ModernAboutUiState,
    onBack: () -> Unit,
    onOpenLink: (AboutLink) -> Unit,
    onOpenLicense: (AboutLicense) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = { CFTopBar(title = "About", onBack = onBack) },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            item {
                Column(
                    Modifier.fillMaxWidth().padding(CFSpacing.xl),
                    horizontalAlignment = Alignment.CenterHorizontally,
                ) {
                    Box(
                        Modifier
                            .size(96.dp)
                            .clip(CircleShape)
                            .background(tokens.metal.brush()),
                        contentAlignment = Alignment.Center,
                    ) {
                        Text("CF", style = MaterialTheme.typography.displayMedium, color = cs.onPrimary, fontWeight = FontWeight.Black)
                    }
                    Spacer(Modifier.height(CFSpacing.md))
                    Text(
                        "CleverFerret",
                        style = MaterialTheme.typography.headlineMedium.copy(
                            brush = tokens.metal.brush(),
                            fontWeight = FontWeight.Black,
                        ),
                    )
                    Text(state.tagline, style = MaterialTheme.typography.bodyMedium, color = cs.onSurfaceVariant)
                    Spacer(Modifier.height(CFSpacing.sm))
                    Text(
                        "v${state.versionName} (${state.versionCode}) · ${state.buildLabel}",
                        style = MaterialTheme.typography.labelSmall,
                        color = cs.onSurfaceVariant,
                    )
                }
            }

            item {
                Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                    CFSectionHeader("Links")
                    Spacer(Modifier.height(CFSpacing.sm))
                    Column(
                        Modifier
                            .fillMaxWidth()
                            .clip(RoundedCornerShape(14.dp))
                            .background(cs.surface)
                            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp)),
                    ) {
                        state.links.forEachIndexed { idx, link ->
                            Row(
                                Modifier
                                    .fillMaxWidth()
                                    .clickable { onOpenLink(link) }
                                    .padding(CFSpacing.lg),
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                            ) {
                                Icon(link.icon, contentDescription = null, tint = cs.primary)
                                Text(link.label, modifier = Modifier.weight(1f), style = MaterialTheme.typography.bodyLarge)
                                Icon(Icons.Default.OpenInNew, contentDescription = null, tint = cs.onSurfaceVariant)
                            }
                            if (idx != state.links.lastIndex) {
                                HorizontalDivider(color = cs.outline.copy(alpha = 0.2f), modifier = Modifier.padding(start = 56.dp))
                            }
                        }
                    }
                }
            }

            if (state.contributors.isNotEmpty()) {
                item {
                    Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                        CFSectionHeader("Contributors", "${state.contributors.size}")
                        Spacer(Modifier.height(CFSpacing.sm))
                        Text(
                            state.contributors.joinToString(" · "),
                            style = MaterialTheme.typography.bodyMedium,
                            color = cs.onSurfaceVariant,
                        )
                    }
                }
            }

            if (state.licenses.isNotEmpty()) {
                item { CFSectionHeader("Open-source licenses", "${state.licenses.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
                items(state.licenses) { lic ->
                    Row(
                        Modifier
                            .fillMaxWidth()
                            .padding(horizontal = CFSpacing.lg)
                            .clip(RoundedCornerShape(10.dp))
                            .clickable { onOpenLicense(lic) }
                            .padding(CFSpacing.sm),
                        verticalAlignment = Alignment.CenterVertically,
                    ) {
                        Column(Modifier.weight(1f)) {
                            Text(lic.name, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
                            Text(
                                "v${lic.version}${lic.author?.let { " · $it" } ?: ""}",
                                style = MaterialTheme.typography.bodySmall,
                                color = cs.onSurfaceVariant,
                                maxLines = 1,
                            )
                        }
                        Text(lic.licenseId, style = MaterialTheme.typography.labelSmall, color = cs.primary)
                    }
                }
            }
        }
    }
}
