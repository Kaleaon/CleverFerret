package com.ktheme.components

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

@Composable
fun StatCard(
    title: String,
    value: String,
    state: SemanticState,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        colors = CardDefaults.cardColors(containerColor = state.container(MaterialTheme.colorScheme.surfaceVariant))
    ) {
        Column(modifier = Modifier.padding(12.dp)) {
            Text(title, style = MaterialTheme.typography.labelMedium, color = state.content(MaterialTheme.colorScheme.onSurfaceVariant))
            Text(value, style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold, color = state.content(MaterialTheme.colorScheme.onSurface))
        }
    }
}

@Composable
fun SelectableChip(
    text: String,
    selected: Boolean,
    state: SemanticState,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    val bg = if (selected) state.container(MaterialTheme.colorScheme.primaryContainer) else MaterialTheme.colorScheme.surface
    val fg = if (selected) state.content(MaterialTheme.colorScheme.onPrimaryContainer) else MaterialTheme.colorScheme.onSurface

    Row(
        modifier = modifier
            .background(bg, RoundedCornerShape(16.dp))
            .clickable(onClick = onClick)
            .padding(horizontal = 12.dp, vertical = 6.dp),
        horizontalArrangement = Arrangement.Center,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(text = text, color = fg, style = MaterialTheme.typography.labelLarge)
    }
}

enum class SemanticState {
    NORMAL,
    WARNING,
    ERROR;

    fun container(defaultColor: Color): Color = when (this) {
        NORMAL -> defaultColor
        WARNING -> Color(0xFFFFF3E0)
        ERROR -> Color(0xFFFFEBEE)
    }

    fun content(defaultColor: Color): Color = when (this) {
        NORMAL -> defaultColor
        WARNING -> Color(0xFFE65100)
        ERROR -> Color(0xFFB71C1C)
    }
}
