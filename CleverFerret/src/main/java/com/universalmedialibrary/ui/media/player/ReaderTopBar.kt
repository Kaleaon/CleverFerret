package com.universalmedialibrary.ui.media.player

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.gestures.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.ui.media.theme.*
import androidx.compose.ui.viewinterop.AndroidView
import android.webkit.WebView
import android.webkit.WebViewClient

@Composable
internal fun ReaderTopBar(
    title: String,
    chapter: String?,
    isBookmarked: Boolean,
    isTtsActive: Boolean,
    onClose: () -> Unit,
    onBookmark: () -> Unit,
    onToc: () -> Unit,
    onSearch: () -> Unit,
    onTts: () -> Unit,
    onSettings: () -> Unit
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MediaColors.Background.copy(alpha = 0.95f),
        tonalElevation = MediaElevation.SM
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .statusBarsPadding()
                .padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.SM),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Close button
            IconButton(onClick = onClose) {
                Icon(
                    imageVector = Icons.Default.Close,
                    contentDescription = "Close",
                    tint = MediaColors.TextPrimary
                )
            }
            
            // Title & Chapter
            Column(
                modifier = Modifier.weight(1f),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(
                    text = title,
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                    fontWeight = FontWeight.Medium
                )
                chapter?.let {
                    Text(
                        text = it,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }
            
            // Action buttons
            Row {
                IconButton(onClick = onBookmark) {
                    Icon(
                        imageVector = if (isBookmarked) Icons.Filled.Bookmark else Icons.Outlined.BookmarkBorder,
                        contentDescription = "Bookmark",
                        tint = if (isBookmarked) MediaColors.AccentPrimary else MediaColors.TextSecondary
                    )
                }
                
                IconButton(onClick = onTts) {
                    Icon(
                        imageVector = if (isTtsActive) Icons.Filled.VolumeUp else Icons.Outlined.VolumeUp,
                        contentDescription = "Text to Speech",
                        tint = if (isTtsActive) MediaColors.AccentPrimary else MediaColors.TextSecondary
                    )
                }
                
                IconButton(onClick = onToc) {
                    Icon(
                        imageVector = Icons.Default.List,
                        contentDescription = "Table of Contents",
                        tint = MediaColors.TextSecondary
                    )
                }
                
                IconButton(onClick = onSearch) {
                    Icon(
                        imageVector = Icons.Default.Search,
                        contentDescription = "Search",
                        tint = MediaColors.TextSecondary
                    )
                }
                
                IconButton(onClick = onSettings) {
                    Icon(
                        imageVector = Icons.Default.Settings,
                        contentDescription = "Settings",
                        tint = MediaColors.TextSecondary
                    )
                }
            }
        }
    }
}
