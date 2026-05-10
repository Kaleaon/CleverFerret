// Shared composables — CFCover (placeholder cover art), MetalChip, MiniPlayer.
// Kept tiny and dependency-free so screens can compose them freely.

package com.universalmedialibrary.ui.modern.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material.icons.filled.SkipPrevious
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.domain.MediaItem
import com.universalmedialibrary.ui.modern.domain.MediaKind
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

@Composable
fun CFCover(
    item: MediaItem,
    width: Dp,
    height: Dp = width,
    modifier: Modifier = Modifier,
    showLabel: Boolean = true,
) {
    val shape = if (item.kind == MediaKind.Music) CircleShape else RoundedCornerShape(6.dp)
    Box(
        modifier
            .size(width = width, height = height)
            .clip(shape)
            .background(Brush.linearGradient(listOf(item.coverHue, item.coverHue.copy(alpha = 0.6f)))),
        contentAlignment = Alignment.Center,
    ) {
        if (showLabel) {
            Text(
                item.title,
                style = MaterialTheme.typography.titleSmall.copy(fontWeight = FontWeight.Black),
                color = Color.White,
                textAlign = TextAlign.Center,
                modifier = Modifier.padding(8.dp),
                maxLines = 3,
            )
        }
    }
}

@Composable
fun MetalChip(text: String, modifier: Modifier = Modifier) {
    val tokens = LocalCFTokens.current
    Box(
        modifier
            .clip(CircleShape)
            .background(tokens.metal.brush())
            .padding(horizontal = 10.dp, vertical = 4.dp),
    ) {
        Text(
            text,
            style = MaterialTheme.typography.labelMedium,
            color = MaterialTheme.colorScheme.onPrimary,
            fontWeight = FontWeight.Black,
        )
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MiniPlayer(
    item: MediaItem,
    onTap: () -> Unit,
    onPlayPause: () -> Unit,
    onPrevious: () -> Unit,
    modifier: Modifier = Modifier,
) {
    val cs = MaterialTheme.colorScheme
    Card(
        modifier = modifier.fillMaxWidth().padding(horizontal = 12.dp),
        shape = RoundedCornerShape(14.dp),
        colors = CardDefaults.cardColors(containerColor = cs.surface),
        onClick = onTap,
    ) {
        Row(
            Modifier.fillMaxWidth().padding(8.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(10.dp),
        ) {
            CFCover(item, width = 44.dp, height = 44.dp, showLabel = false)
            Column(Modifier.weight(1f)) {
                Text(item.title, style = MaterialTheme.typography.titleSmall, maxLines = 1)
                Text(
                    item.subtitle,
                    style = MaterialTheme.typography.labelSmall,
                    color = cs.onSurfaceVariant,
                )
            }
            IconButton(onClick = onPrevious) { Icon(Icons.Default.SkipPrevious, contentDescription = null) }
            FilledIconButton(
                onClick = onPlayPause,
                colors = IconButtonDefaults.filledIconButtonColors(containerColor = cs.primary),
            ) { Icon(Icons.Default.PlayArrow, contentDescription = null, tint = cs.onPrimary) }
        }
        LinearProgressIndicator(
            progress = { item.progress },
            modifier = Modifier.fillMaxWidth().height(2.dp),
            color = cs.primary,
            trackColor = cs.onSurface.copy(alpha = 0.08f),
        )
    }
}
