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
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.launch

@OptIn(ExperimentalMaterial3Api::class)
@Composable
internal fun MusicLibraryTopBar(
    onBackClick: () -> Unit,
    onSearchClick: () -> Unit,
    onShuffleAll: () -> Unit
) {
    TopAppBar(
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    imageVector = Icons.Default.MusicNote,
                    contentDescription = "Media image",
                    tint = MediaColors.MediaTypes.Music,
                    modifier = Modifier.size(24.dp)
                )
                Spacer(modifier = Modifier.width(MediaSpacing.SM))
                Text(
                    text = "Music",
                    style = MediaTypography.TitleMedium,
                    color = MediaColors.TextPrimary
                )
            }
        },
        navigationIcon = {
            IconButton(onClick = onBackClick) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = MediaColors.TextPrimary
                )
            }
        },
        actions = {
            IconButton(onClick = onShuffleAll) {
                Icon(
                    imageVector = Icons.Default.Shuffle,
                    contentDescription = "Shuffle All",
                    tint = MediaColors.TextSecondary
                )
            }
            IconButton(onClick = onSearchClick) {
                Icon(
                    imageVector = Icons.Default.Search,
                    contentDescription = "Search",
                    tint = MediaColors.TextSecondary
                )
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = MediaColors.BackgroundElevated
        )
    )
}
