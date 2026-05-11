// ModernThemePickerScreen — gallery of every CFTheme palette with live
// previews. The active palette gets a metal-brushed border. A bottom
// "Apply" CTA commits the selection. Doubles as ThemeShowcase since each
// preview chip renders a working sample of the surface + accents.

package com.universalmedialibrary.ui.modern.theme

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Check
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFTopBar
// NOTE: this screen lives in com.universalmedialibrary.ui.modern.theme,
// the SAME package as CFTheme/CFTokens. Internal symbols are visible.

data class ModernThemePickerUiState(
    val palettes: List<CFPalette> = CFThemes.All,
    val activeId: String,
    val pendingId: String = activeId,
)

@Composable
fun ModernThemePickerScreen(
    state: ModernThemePickerUiState,
    onBack: () -> Unit,
    onSelect: (CFPalette) -> Unit,
    onApply: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = { CFTopBar(title = "Themes", onBack = onBack) },
        bottomBar = {
            Row(
                Modifier
                    .fillMaxWidth()
                    .background(cs.surface)
                    .padding(CFSpacing.lg),
                verticalAlignment = Alignment.CenterVertically,
            ) {
                Text(
                    "Active: ${state.palettes.firstOrNull { it.tokens.id == state.activeId }?.tokens?.displayName ?: state.activeId}",
                    style = MaterialTheme.typography.labelMedium,
                    color = cs.onSurfaceVariant,
                    modifier = Modifier.weight(1f),
                )
                CFMetalButton(
                    text = if (state.pendingId == state.activeId) "Saved" else "Apply",
                    onClick = onApply,
                    leadingIcon = Icons.Default.Check,
                )
            }
        },
        containerColor = cs.background,
    ) { padding ->
        LazyVerticalGrid(
            columns = GridCells.Adaptive(minSize = 160.dp),
            contentPadding = PaddingValues(CFSpacing.lg),
            horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.md),
            modifier = Modifier.fillMaxSize().padding(padding),
        ) {
            items(state.palettes) { palette ->
                PaletteCard(
                    palette = palette,
                    isActive = palette.tokens.id == state.activeId,
                    isPending = palette.tokens.id == state.pendingId,
                    onClick = { onSelect(palette) },
                )
            }
        }
    }
}

@Composable
private fun PaletteCard(
    palette: CFPalette,
    isActive: Boolean,
    isPending: Boolean,
    onClick: () -> Unit,
) {
    val borderColor = when {
        isPending && !isActive -> palette.scheme.primary
        isActive               -> palette.scheme.primary
        else                   -> palette.scheme.outline.copy(alpha = 0.4f)
    }
    Column(
        Modifier
            .clip(RoundedCornerShape(14.dp))
            .background(palette.scheme.background)
            .border(
                if (isActive || isPending) 2.dp else 1.dp,
                borderColor,
                RoundedCornerShape(14.dp),
            )
            .clickable(onClick = onClick)
            .padding(CFSpacing.md),
    ) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Text(
                palette.tokens.displayName,
                style = MaterialTheme.typography.titleSmall.copy(
                    brush = palette.tokens.metal.brush(),
                    fontWeight = FontWeight.Black,
                ),
                modifier = Modifier.weight(1f),
            )
            if (isActive) Icon(Icons.Default.Check, contentDescription = "Active", tint = palette.scheme.primary)
        }
        Spacer(Modifier.height(CFSpacing.sm))
        Box(
            Modifier
                .fillMaxWidth()
                .height(72.dp)
                .clip(RoundedCornerShape(10.dp))
                .background(palette.tokens.metal.brush()),
        )
        Spacer(Modifier.height(CFSpacing.sm))
        Row(horizontalArrangement = Arrangement.spacedBy(6.dp)) {
            Swatch(palette.scheme.primary)
            Swatch(palette.scheme.secondary)
            Swatch(palette.scheme.surfaceVariant)
            Swatch(palette.scheme.surface)
        }
    }
}

@Composable
private fun Swatch(color: androidx.compose.ui.graphics.Color) {
    Box(
        Modifier
            .size(20.dp)
            .clip(CircleShape)
            .background(color)
            .border(1.dp, color.copy(alpha = 0.6f), CircleShape),
    )
}
