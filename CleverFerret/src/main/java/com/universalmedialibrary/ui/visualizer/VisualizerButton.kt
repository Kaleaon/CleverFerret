package com.universalmedialibrary.ui.visualizer

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.GraphicEq
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier

/**
 * Reusable Visualizer Button for audio/music players
 *
 * Can be placed in any player screen to navigate to the visualizer
 */
@Composable
fun VisualizerButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    IconButton(
        onClick = onClick,
        modifier = modifier
    ) {
        Icon(
            imageVector = Icons.Default.GraphicEq,
            contentDescription = "Show Visualizer"
        )
    }
}
