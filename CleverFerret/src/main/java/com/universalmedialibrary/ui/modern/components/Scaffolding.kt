// CleverFerret modern UI · scaffolding components shared across screens.
// CFTopBar, CFSectionHeader, CFShelfRow, CFGridSection, CFEmptyState.
// All read tokens from CFTheme/LocalCFTokens — no hard-coded colors here.

package com.universalmedialibrary.ui.modern.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

/**
 * Wordmark + back button + trailing icons. Wordmark uses the metal brush
 * so it picks up the active palette automatically.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CFTopBar(
    title: String,
    onBack: (() -> Unit)? = null,
    actions: @Composable RowScope.() -> Unit = {},
) {
    val tokens = LocalCFTokens.current
    TopAppBar(
        title = {
            Text(
                title,
                style = MaterialTheme.typography.titleLarge.copy(
                    brush = tokens.metal.brush(),
                    fontWeight = FontWeight.Black,
                ),
            )
        },
        navigationIcon = {
            if (onBack != null) {
                IconButton(onClick = onBack) {
                    Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                }
            }
        },
        actions = actions,
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = MaterialTheme.colorScheme.background,
            titleContentColor = MaterialTheme.colorScheme.onBackground,
        ),
    )
}

/**
 * Reusable shelf header (title + optional subtitle + optional "See all" action).
 */
@Composable
fun CFSectionHeader(
    title: String,
    subtitle: String? = null,
    actionLabel: String? = null,
    onAction: (() -> Unit)? = null,
    modifier: Modifier = Modifier,
) {
    Row(
        modifier.fillMaxWidth(),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Column(Modifier.weight(1f)) {
            Text(title, style = MaterialTheme.typography.titleLarge)
            subtitle?.let {
                Text(
                    it,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                )
            }
        }
        if (actionLabel != null && onAction != null) {
            TextButton(onClick = onAction) { Text(actionLabel) }
        }
    }
}

/**
 * Filled metal pill button — used for big CTAs (Resume, Play, Continue).
 */
@Composable
fun CFMetalButton(
    text: String,
    onClick: () -> Unit,
    leadingIcon: ImageVector? = null,
    enabled: Boolean = true,
    modifier: Modifier = Modifier,
) {
    val tokens = LocalCFTokens.current
    val cs = MaterialTheme.colorScheme
    Box(
        modifier
            .clip(CircleShape)
            .background(if (enabled) tokens.metal.brush() else Brush.linearGradient(listOf(cs.onSurface.copy(alpha = 0.12f), cs.onSurface.copy(alpha = 0.12f))))
            .clickable(enabled = enabled, onClick = onClick)
            .padding(horizontal = 20.dp, vertical = 12.dp),
    ) {
        Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(8.dp)) {
            if (leadingIcon != null) {
                Icon(leadingIcon, contentDescription = null, tint = if (enabled) cs.onPrimary else cs.onSurface.copy(alpha = 0.38f))
            }
            Text(
                text,
                style = MaterialTheme.typography.labelLarge,
                color = if (enabled) cs.onPrimary else cs.onSurface.copy(alpha = 0.38f),
                fontWeight = FontWeight.Black,
            )
        }
    }
}

/**
 * Tonal outlined chip used for filters / tags / metadata pills.
 */
@Composable
fun CFTagChip(text: String, modifier: Modifier = Modifier, selected: Boolean = false) {
    val cs = MaterialTheme.colorScheme
    val bg = if (selected) cs.primaryContainer else cs.surfaceVariant
    val fg = if (selected) cs.onPrimaryContainer else cs.onSurfaceVariant
    Box(
        modifier
            .clip(CircleShape)
            .background(bg)
            .border(1.dp, cs.outline.copy(alpha = 0.4f), CircleShape)
            .padding(horizontal = 12.dp, vertical = 6.dp),
    ) {
        Text(text, style = MaterialTheme.typography.labelMedium, color = fg)
    }
}

/**
 * Sectioned settings row — leading icon, title, subtitle, optional trailing.
 */
@Composable
fun CFSettingsRow(
    icon: ImageVector,
    title: String,
    subtitle: String? = null,
    onClick: () -> Unit,
    trailing: @Composable (() -> Unit)? = null,
    modifier: Modifier = Modifier,
) {
    val cs = MaterialTheme.colorScheme
    Row(
        modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(12.dp))
            .clickable(onClick = onClick)
            .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.md),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(
            Modifier
                .size(40.dp)
                .clip(RoundedCornerShape(10.dp))
                .background(cs.surfaceVariant),
            contentAlignment = Alignment.Center,
        ) {
            Icon(icon, contentDescription = null, tint = cs.primary)
        }
        Column(Modifier.weight(1f)) {
            Text(title, style = MaterialTheme.typography.titleSmall)
            subtitle?.let {
                Text(
                    it,
                    style = MaterialTheme.typography.bodySmall,
                    color = cs.onSurfaceVariant,
                )
            }
        }
        trailing?.invoke()
    }
}

/**
 * Empty-state column — illustration glyph + title + body + optional CTA.
 */
@Composable
fun CFEmptyState(
    icon: ImageVector,
    title: String,
    body: String,
    actionLabel: String? = null,
    onAction: (() -> Unit)? = null,
    modifier: Modifier = Modifier,
) {
    val cs = MaterialTheme.colorScheme
    Column(
        modifier
            .fillMaxWidth()
            .padding(CFSpacing.xl),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(CFSpacing.md, Alignment.CenterVertically),
    ) {
        Box(
            Modifier
                .size(72.dp)
                .clip(CircleShape)
                .background(cs.surfaceVariant),
            contentAlignment = Alignment.Center,
        ) { Icon(icon, contentDescription = null, tint = cs.onSurfaceVariant) }
        Text(title, style = MaterialTheme.typography.titleLarge)
        Text(
            body,
            style = MaterialTheme.typography.bodyMedium,
            color = cs.onSurfaceVariant,
        )
        if (actionLabel != null && onAction != null) {
            CFMetalButton(actionLabel, onAction)
        }
    }
}
