package com.universalmedialibrary.ui.modern.components

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyGridScope
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.theme.CFSpacing

/**
 * Adaptive Metro Tile Grid component that uses token-driven minimum tile widths.
 */
@Composable
fun MetroTileGrid(
    modifier: Modifier = Modifier,
    minTileWidth: Dp = CFSpacing.squareCardMinWidth,
    contentPadding: PaddingValues = PaddingValues(12.dp),
    horizontalArrangement: Arrangement.Horizontal = Arrangement.spacedBy(CFSpacing.metroGutter),
    verticalArrangement: Arrangement.Vertical = Arrangement.spacedBy(CFSpacing.metroGutter),
    content: LazyGridScope.() -> Unit
) {
    LazyVerticalGrid(
        columns = GridCells.Adaptive(minSize = minTileWidth),
        modifier = modifier.fillMaxSize(),
        contentPadding = contentPadding,
        horizontalArrangement = horizontalArrangement,
        verticalArrangement = verticalArrangement,
        content = content
    )
}
