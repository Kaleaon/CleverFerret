// Shared composables — CFCover (placeholder cover art), MetalChip, MiniPlayer.
// Kept tiny and dependency-free so screens can compose them freely.

package com.universalmedialibrary.ui.modern.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material.icons.filled.Pause
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
import com.universalmedialibrary.ui.modern.theme.LocalCFLayout
import com.universalmedialibrary.ui.modern.theme.LocalCFLayoutStandard
import com.universalmedialibrary.ui.modern.theme.CFLayout
import com.universalmedialibrary.ui.modern.theme.cfContrastInk

@Composable
fun CFCover(
    item: MediaItem,
    width: Dp,
    height: Dp = width,
    modifier: Modifier = Modifier,
    showLabel: Boolean = true,
) {
    val corners = LocalCFLayoutStandard.current?.corners
    val shape = if (item.kind == MediaKind.Music && LocalCFLayout.current == CFLayout.Compose) CircleShape
        else RoundedCornerShape((corners?.cover ?: DEFAULT_COVER_CORNER).dp)
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
    Box(
        modifier
            .clip(RoundedCornerShape((LocalCFLayoutStandard.current?.corners?.control ?: DEFAULT_CONTROL_CORNER).dp))
            .background(MaterialTheme.colorScheme.primary)
            .padding(horizontal = 10.dp, vertical = 4.dp),
    ) {
        Text(
            text,
            style = MaterialTheme.typography.labelMedium,
            color = cfContrastInk(MaterialTheme.colorScheme.primary),
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
        modifier = modifier.fillMaxWidth(),
        shape = MaterialTheme.shapes.medium,
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
            IconButton(onClick = onPrevious) { Icon(Icons.Default.SkipPrevious, contentDescription = "Previous") }
            FilledIconButton(
                onClick = onPlayPause,
                colors = IconButtonDefaults.filledIconButtonColors(containerColor = cs.primary),
            ) { Icon(Icons.Default.PlayArrow, contentDescription = "Play or pause", tint = cfContrastInk(cs.primary)) }
        }
        LinearProgressIndicator(
            progress = { item.progress },
            modifier = Modifier.fillMaxWidth().height(2.dp),
            color = cs.primary,
            trackColor = cs.onSurface.copy(alpha = 0.08f),
        )
    }
}

private const val DEFAULT_COVER_CORNER = 6f
private const val DEFAULT_CONTROL_CORNER = 999f
