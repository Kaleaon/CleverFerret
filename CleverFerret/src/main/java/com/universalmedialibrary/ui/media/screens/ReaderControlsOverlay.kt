package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.gestures.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
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
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.launch

@Composable
internal fun ReaderControlsOverlay(
    state: BookReaderState,
    onClose: () -> Unit,
    onShowSettings: () -> Unit,
    onShowTOC: () -> Unit,
    onShowSearch: () -> Unit,
    onShowBookmarks: () -> Unit,
    onBookmarkToggle: () -> Unit,
    onTTSToggle: () -> Unit,
    onPageSelect: (Int) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.Black.copy(alpha = 0.4f))
    ) {
        // Top bar
        Surface(
            color = MediaColors.BackgroundElevated.copy(alpha = 0.95f),
            modifier = Modifier.fillMaxWidth()
        ) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .statusBarsPadding()
                    .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                IconButton(onClick = onClose) {
                    Icon(Icons.Default.Close, "Close", tint = MediaColors.TextPrimary)
                }
                
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = state.bookTitle,
                        style = MediaTypography.TitleSmall,
                        color = MediaColors.TextPrimary,
                        maxLines = 1
                    )
                    state.currentChapter?.title?.let { chapter ->
                        Text(
                            text = chapter,
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextSecondary,
                            maxLines = 1
                        )
                    }
                }
                
                IconButton(onClick = onBookmarkToggle) {
                    Icon(
                        if (state.isCurrentPageBookmarked) Icons.Default.Bookmark else Icons.Outlined.BookmarkBorder,
                        "Bookmark",
                        tint = if (state.isCurrentPageBookmarked) MediaColors.AccentPrimary else MediaColors.TextSecondary
                    )
                }
                
                IconButton(onClick = onTTSToggle) {
                    Icon(
                        if (state.isTTSPlaying) Icons.Default.VolumeUp else Icons.Outlined.VolumeUp,
                        "Text to Speech",
                        tint = if (state.isTTSPlaying) MediaColors.AccentPrimary else MediaColors.TextSecondary
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.weight(1f))
        
        // Bottom bar
        Surface(
            color = MediaColors.BackgroundElevated.copy(alpha = 0.95f),
            modifier = Modifier.fillMaxWidth()
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .navigationBarsPadding()
                    .padding(MediaSpacing.MD)
            ) {
                // Progress slider
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text(
                        text = "${state.currentPage + 1}",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary
                    )
                    
                    Slider(
                        value = state.currentPage.toFloat(),
                        onValueChange = { onPageSelect(it.toInt()) },
                        valueRange = 0f..(state.totalPages - 1).toFloat(),
                        modifier = Modifier
                            .weight(1f)
                            .padding(horizontal = MediaSpacing.SM),
                        colors = SliderDefaults.colors(
                            thumbColor = MediaColors.AccentPrimary,
                            activeTrackColor = MediaColors.AccentPrimary
                        )
                    )
                    
                    Text(
                        text = "${state.totalPages}",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary
                    )
                }
                
                // Progress percentage
                Text(
                    text = "${((state.currentPage + 1).toFloat() / state.totalPages * 100).toInt()}% complete",
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextTertiary,
                    modifier = Modifier.fillMaxWidth(),
                    textAlign = TextAlign.Center
                )
                
                Spacer(modifier = Modifier.height(MediaSpacing.MD))
                
                // Action buttons
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceEvenly
                ) {
                    ReaderActionButton(
                        icon = Icons.Default.List,
                        label = "Contents",
                        onClick = onShowTOC
                    )
                    ReaderActionButton(
                        icon = Icons.Default.Search,
                        label = "Search",
                        onClick = onShowSearch
                    )
                    ReaderActionButton(
                        icon = Icons.Default.Bookmarks,
                        label = "Bookmarks",
                        onClick = onShowBookmarks
                    )
                    ReaderActionButton(
                        icon = Icons.Default.Settings,
                        label = "Settings",
                        onClick = onShowSettings
                    )
                }
            }
        }
    }
}
