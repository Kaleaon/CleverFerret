package com.universalmedialibrary.ui.modern.components

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.FilterChip
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.theme.CFLayout

private val LayoutTarget = 48.dp
private val LayoutGap = 8.dp

@Composable
fun CFLayoutPicker(current: CFLayout, onSelect: (CFLayout) -> Unit) {
    Column(verticalArrangement = Arrangement.spacedBy(LayoutGap)) {
        Text("Layout", style = MaterialTheme.typography.titleLarge)
        Text("Choose a layout to pair with your color theme.", style = MaterialTheme.typography.bodyMedium)
        LazyRow(horizontalArrangement = Arrangement.spacedBy(LayoutGap)) {
            items(CFLayout.entries, key = { it.id }) { layout ->
                FilterChip(selected = current == layout, onClick = { onSelect(layout) },
                    modifier = Modifier.heightIn(min = LayoutTarget), label = { Text(layout.displayName) })
            }
        }
        if (current == CFLayout.Lcars) {
            Text("LCARS-inspired console with a black field and sweep navigation.",
                style = MaterialTheme.typography.bodySmall)
        }
    }
}

data class CFLayoutSelection(val current: CFLayout, val onSelect: (CFLayout) -> Unit)
