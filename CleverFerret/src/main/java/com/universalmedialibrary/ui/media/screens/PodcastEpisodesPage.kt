package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.pager.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.launch

@Composable
internal fun PodcastEpisodesPage(
    episodes: List<PodcastEpisode>,
    onEpisodeClick: (PodcastEpisode) -> Unit,
    onPlayEpisode: (PodcastEpisode) -> Unit,
    onDownloadEpisode: (PodcastEpisode) -> Unit,
    currentEpisode: PodcastEpisode?
) {
    if (episodes.isEmpty()) {
        PodcastEmptyState(
            icon = Icons.Outlined.Headphones,
            title = "No episodes yet",
            subtitle = "Subscribe to shows to see new episodes"
        )
        return
    }
    
    LazyColumn(
        contentPadding = PaddingValues(vertical = MediaSpacing.SM),
        modifier = Modifier.fillMaxSize()
    ) {
        items(episodes) { episode ->
            PodcastEpisodeCard(
                episode = episode,
                isPlaying = currentEpisode?.id == episode.id,
                onClick = { onEpisodeClick(episode) },
                onPlay = { onPlayEpisode(episode) },
                onDownload = { onDownloadEpisode(episode) }
            )
        }
    }
}
