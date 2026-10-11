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
import androidx.compose.ui.graphics.SolidColor
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.accessibility.headingSemantics
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFLayoutStandard
import com.universalmedialibrary.ui.modern.theme.LocalCFLayout
import com.universalmedialibrary.ui.modern.theme.CFLayout
import com.universalmedialibrary.ui.modern.theme.cfContrastInk

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
    modifier: Modifier = Modifier,
) {
    TopAppBar(
        modifier = modifier,
        title = {
            Text(
                title,
                modifier = Modifier.headingSemantics(),
                style = MaterialTheme.typography.titleLarge.copy(
                    brush = SolidColor(MaterialTheme.colorScheme.onBackground),
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
            Text(title, modifier = Modifier.headingSemantics(), style = MaterialTheme.typography.titleLarge)
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
    val cs = MaterialTheme.colorScheme
    val standard = LocalCFLayoutStandard.current
    Button(onClick = onClick, enabled = enabled,
        modifier = modifier.heightIn(min = CFActionTarget),
        shape = RoundedCornerShape((standard?.corners?.control ?: CF_ACTION_CORNER).dp),
        colors = ButtonDefaults.buttonColors(containerColor = cs.primary, contentColor = cfContrastInk(cs.primary))) {
        if (leadingIcon != null && LocalCFLayout.current != CFLayout.Lcars) {
            Icon(leadingIcon, contentDescription = null)
            Spacer(Modifier.width(CFActionGap))
        }
        Text(text, fontWeight = FontWeight.SemiBold)
    }
}

/**
 * Tonal outlined chip used for filters / tags / metadata pills.
 */
@Composable
fun CFTagChip(text: String, modifier: Modifier = Modifier, selected: Boolean = false) {
    val cs = MaterialTheme.colorScheme
    val sweep = LocalCFLayout.current == CFLayout.Lcars
    val bg = if (sweep) cs.primary else if (selected) cs.primaryContainer else cs.surfaceVariant
    val fg = if (sweep) cfContrastInk(bg) else if (selected) cs.onPrimaryContainer else cs.onSurfaceVariant
    val shape = RoundedCornerShape((LocalCFLayoutStandard.current?.corners?.control ?: CF_ACTION_CORNER).dp)
    val outline = if (sweep) Modifier else Modifier.border(1.dp, cs.outline.copy(alpha = 0.4f), shape)
    Box(
        modifier
            .clip(shape)
            .background(bg)
            .then(outline)
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
            .clip(MaterialTheme.shapes.medium)
            .heightIn(min = CFActionTarget)
            .clickable(onClick = onClick)
            .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.md),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(
            Modifier
                .size(40.dp)
                .clip(RoundedCornerShape((LocalCFLayoutStandard.current?.corners?.icon ?: CF_DEFAULT_ICON_CORNER).dp))
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
                .clip(RoundedCornerShape((LocalCFLayoutStandard.current?.corners?.icon ?: CF_DEFAULT_ICON_CORNER).dp))
                .background(cs.surfaceVariant),
            contentAlignment = Alignment.Center,
        ) { Icon(icon, contentDescription = null, tint = cs.onSurfaceVariant) }
        Text(title, modifier = Modifier.headingSemantics(), style = MaterialTheme.typography.titleLarge)
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

private val CFActionTarget = 48.dp
private const val CF_ACTION_CORNER = 999f
private val CFActionGap = 8.dp

private const val CF_DEFAULT_ICON_CORNER = 10f
