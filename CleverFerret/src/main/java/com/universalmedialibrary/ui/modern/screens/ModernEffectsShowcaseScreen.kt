// ModernEffectsShowcaseScreen — design-system showcase. Renders every
// reusable component (chips, buttons, cards, settings rows, empty
// states, mini-player, format tile, hero card) inside the active
// CFTheme so designers / contributors can verify that a new palette
// adopts cleanly. Replaces both AdvancedEffectsShowcase and
// ThemeShowcase since each section is theme-aware.

package com.universalmedialibrary.ui.modern.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.CircleShape
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
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.*
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

@Composable
fun ModernEffectsShowcaseScreen(onBack: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = { CFTopBar(title = "Showcase", onBack = onBack) },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(CFSpacing.lg),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.xl),
        ) {
            item { CFSectionHeader("Active palette: ${tokens.displayName}", "Layout: ${tokens.layout.name}") }

            item {
                ShowcaseSection("Wordmark") {
                    Text(
                        "CleverFerret",
                        style = MaterialTheme.typography.displaySmall.copy(
                            brush = tokens.metal.brush(),
                            fontWeight = FontWeight.Black,
                        ),
                    )
                }
            }

            item {
                ShowcaseSection("Buttons") {
                    Row(horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm), verticalAlignment = Alignment.CenterVertically) {
                        CFMetalButton(text = "Resume", onClick = {}, leadingIcon = Icons.Default.PlayArrow)
                        OutlinedButton(onClick = {}) { Text("Outlined") }
                        TextButton(onClick = {}) { Text("Text") }
                    }
                }
            }

            item {
                ShowcaseSection("Chips") {
                    Row(horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
                        MetalChip(text = "METAL")
                        CFTagChip(text = "Tag")
                        CFTagChip(text = "Selected", selected = true)
                    }
                }
            }

            item {
                ShowcaseSection("Settings rows") {
                    Column(
                        Modifier
                            .clip(RoundedCornerShape(14.dp))
                            .background(cs.surface)
                            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp)),
                    ) {
                        CFSettingsRow(icon = Icons.Default.Cast, title = "Plex", subtitle = "Living Room · 84 movies", onClick = {})
                        HorizontalDivider(color = cs.outline.copy(alpha = 0.2f), modifier = Modifier.padding(start = 64.dp))
                        CFSettingsRow(icon = Icons.Default.Lock, title = "Security", subtitle = "PIN + biometric", onClick = {})
                    }
                }
            }

            item {
                ShowcaseSection("Empty state") {
                    CFEmptyState(
                        icon = Icons.Default.LibraryBooks,
                        title = "Looks empty here",
                        body = "Use this state when a list has nothing yet.",
                        actionLabel = "Take action",
                        onAction = {},
                    )
                }
            }

            item {
                ShowcaseSection("Surface gradient samples") {
                    Row(horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
                        Swatch(label = "background", color = cs.background)
                        Swatch(label = "surface", color = cs.surface)
                        Swatch(label = "surfaceVar", color = cs.surfaceVariant)
                        Swatch(label = "primary", color = cs.primary)
                        Swatch(label = "secondary", color = cs.secondary)
                    }
                }
            }

            item {
                ShowcaseSection("Metal brush") {
                    Box(
                        Modifier
                            .fillMaxWidth()
                            .height(64.dp)
                            .clip(RoundedCornerShape(12.dp))
                            .background(tokens.metal.brush()),
                    )
                }
            }

            item {
                ShowcaseSection("Hero card") {
                    Row(
                        Modifier
                            .fillMaxWidth()
                            .clip(RoundedCornerShape(16.dp))
                            .background(Brush.linearGradient(listOf(cs.surfaceVariant, cs.surface)))
                            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(16.dp))
                            .padding(CFSpacing.lg),
                        horizontalArrangement = Arrangement.spacedBy(CFSpacing.lg),
                    ) {
                        Box(
                            Modifier
                                .size(width = 80.dp, height = 110.dp)
                                .clip(RoundedCornerShape(8.dp))
                                .background(Brush.linearGradient(listOf(Color(0xFF1B3A5C), Color(0xFF1B3A5C).copy(alpha = 0.5f)))),
                        )
                        Column(Modifier.weight(1f), verticalArrangement = Arrangement.spacedBy(4.dp)) {
                            MetalChip(text = "RESUME")
                            Text("The Three-Body Problem", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Black)
                            Text("Liu Cixin", style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant)
                            LinearProgressIndicator(progress = { 0.42f }, modifier = Modifier.fillMaxWidth().height(3.dp).clip(RoundedCornerShape(2.dp)), color = cs.primary, trackColor = cs.onSurface.copy(alpha = 0.12f))
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun ShowcaseSection(title: String, content: @Composable ColumnScope.() -> Unit) {
    Column(verticalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
        Text(title.uppercase(), style = MaterialTheme.typography.labelMedium, color = MaterialTheme.colorScheme.onSurfaceVariant)
        content()
    }
}

@Composable
private fun Swatch(label: String, color: Color) {
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Box(
            Modifier
                .size(48.dp)
                .clip(CircleShape)
                .background(color)
                .border(1.dp, color.copy(alpha = 0.6f), CircleShape),
        )
        Text(label, style = MaterialTheme.typography.labelSmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
    }
}
