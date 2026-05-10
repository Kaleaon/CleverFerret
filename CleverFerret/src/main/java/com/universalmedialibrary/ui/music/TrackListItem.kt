package com.universalmedialibrary.ui.music

import android.text.format.DateUtils
import androidx.compose.animation.*
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.Sort
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.theme.*

@Composable
internal fun TrackListItem(track: Track, compact: Boolean = false, onClick: () -> Unit) {
    ListItem(
        headlineContent = { Text(track.title ?: "Unknown", maxLines = 1) },
        supportingContent = {
            if (compact) {
                Text("${track.displayArtist} • ${track.displayDuration}", maxLines = 1)
            } else {
                Column {
                    Text(track.displayArtist, maxLines = 1)
                    Text(
                        "${track.displayAlbum} • ${track.displayDuration}${if (track.year != null) " • ${track.year}" else ""}",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1
                    )
                }
            }
        },
        leadingContent = {
            Surface(
                modifier = Modifier.size(if (compact) 40.dp else 56.dp),
                shape = RoundedCornerShape(4.dp),
                color = MaterialTheme.colorScheme.surfaceVariant
            ) {
                val albumArt = track.albumArtUri
                if (albumArt != null) {
                    AsyncImage(
                    
                        model = albumArt,
                        contentDescription = "${track.displayAlbum} artwork",
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    Icon(
                        Icons.Default.MusicNote,
                        contentDescription = "Media image",
                        modifier = Modifier.padding(8.dp)
                    )
                }
            }
        },
        trailingContent = {
            if (!compact && track.trackNumber != null) {
                Text(
                    text = "#${track.trackNumber}",
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        },
        modifier = Modifier.clickable(onClick = onClick)
    )
}
