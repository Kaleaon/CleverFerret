package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
internal fun WebFictionTopBar(
    onBackClick: () -> Unit,
    onRefresh: () -> Unit,
    onAddByUrl: () -> Unit,
    isRefreshing: Boolean
) {
    TopAppBar(
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    imageVector = Icons.Default.Article,
                    contentDescription = "Web Fiction",
                    tint = MediaColors.MediaTypes.Document,
                    modifier = Modifier.size(24.dp)
                )
                Spacer(modifier = Modifier.width(MediaSpacing.SM))
                Text(
                    text = "Web Fiction",
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
            if (isRefreshing) {
                CircularProgressIndicator(
                    modifier = Modifier.size(24.dp),
                    color = MediaColors.AccentPrimary,
                    strokeWidth = 2.dp
                )
                Spacer(modifier = Modifier.width(MediaSpacing.MD))
            } else {
                IconButton(onClick = onRefresh) {
                    Icon(
                        imageVector = Icons.Default.Refresh,
                        contentDescription = "Check for updates",
                        tint = MediaColors.TextSecondary
                    )
                }
            }
            IconButton(onClick = onAddByUrl) {
                Icon(
                    imageVector = Icons.Default.AddLink,
                    contentDescription = "Add by URL",
                    tint = MediaColors.TextSecondary
                )
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = MediaColors.BackgroundElevated
        )
    )
}
