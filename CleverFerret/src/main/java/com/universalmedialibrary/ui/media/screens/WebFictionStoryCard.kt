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

@Composable
internal fun WebFictionStoryCard(
    story: WebFictionStory,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick),
        color = MediaColors.BackgroundElevated
    ) {
        Row(
            modifier = Modifier.padding(MediaSpacing.MD)
        ) {
            // Cover
            Surface(
                modifier = Modifier
                    .size(width = 80.dp, height = 120.dp)
                    .clip(RoundedCornerShape(MediaCorners.SM)),
                color = MediaColors.BackgroundSurface
            ) {
                if (story.coverUrl != null) {
                    AsyncImage(
                    
                        model = story.coverUrl,
                        contentDescription = "Media image",
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                } else {
                    Box(
                        contentAlignment = Alignment.Center,
                        modifier = Modifier.fillMaxSize()
                    ) {
                        Icon(
                            imageVector = Icons.Default.MenuBook,
                            contentDescription = "Media image",
                            tint = story.source.color.copy(alpha = 0.5f),
                            modifier = Modifier.size(32.dp)
                        )
                    }
                }
                
                // Progress overlay
                if (story.readProgress > 0) {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.BottomCenter
                    ) {
                        LinearProgressIndicator(
                            progress = { story.readProgress },
                            modifier = Modifier
                                .fillMaxWidth()
                                .height(4.dp),
                            color = MediaColors.AccentPrimary,
                            trackColor = MediaColors.ProgressBackground
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.width(MediaSpacing.MD))
            
            Column(modifier = Modifier.weight(1f)) {
                // Source badge
                Surface(
                    shape = RoundedCornerShape(MediaCorners.XS),
                    color = story.source.color.copy(alpha = 0.2f)
                ) {
                    Text(
                        text = story.source.displayName,
                        style = MediaTypography.LabelSmall,
                        color = story.source.color,
                        modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = 2.dp)
                    )
                }
                
                Spacer(modifier = Modifier.height(MediaSpacing.XS))
                
                // Title
                Text(
                    text = story.title,
                    style = MediaTypography.BodyLarge,
                    color = MediaColors.TextPrimary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    fontWeight = FontWeight.Medium
                )
                
                // Author
                Text(
                    text = "by ${story.author}",
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextSecondary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                
                // Stats row
                Row(
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Chapter count
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            imageVector = Icons.Default.MenuBook,
                            contentDescription = "Media image",
                            tint = MediaColors.TextTertiary,
                            modifier = Modifier.size(14.dp)
                        )
                        Spacer(modifier = Modifier.width(2.dp))
                        Text(
                            text = "${story.chapterCount} ch",
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                    }
                    
                    // Word count
                    if (story.wordCount != null) {
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Icon(
                                imageVector = Icons.Default.TextFields,
                                contentDescription = "Media image",
                                tint = MediaColors.TextTertiary,
                                modifier = Modifier.size(14.dp)
                            )
                            Spacer(modifier = Modifier.width(2.dp))
                            Text(
                                text = formatWordCount(story.wordCount),
                                style = MediaTypography.LabelSmall,
                                color = MediaColors.TextTertiary
                            )
                        }
                    }
                    
                    // Status
                    story.status?.let { status ->
                        StatusBadge(status = status)
                    }
                }
                
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                
                // Tags (first few)
                if (story.tags.isNotEmpty()) {
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.XS),
                        modifier = Modifier.horizontalScroll(rememberScrollState())
                    ) {
                        story.tags.take(4).forEach { tag ->
                            Surface(
                                shape = RoundedCornerShape(MediaCorners.XS),
                                color = MediaColors.BackgroundSurface
                            ) {
                                Text(
                                    text = tag,
                                    style = MediaTypography.LabelSmall,
                                    color = MediaColors.TextTertiary,
                                    modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 2.dp)
                                )
                            }
                        }
                    }
                }
                
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                
                // Update info
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    if (story.unreadChapters > 0) {
                        Surface(
                            shape = RoundedCornerShape(MediaCorners.XS),
                            color = MediaColors.AccentPrimary.copy(alpha = 0.2f)
                        ) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.XS)
                            ) {
                                Icon(
                                    imageVector = Icons.Default.NewReleases,
                                    contentDescription = "Media image",
                                    tint = MediaColors.AccentPrimary,
                                    modifier = Modifier.size(14.dp)
                                )
                                Spacer(modifier = Modifier.width(MediaSpacing.XS))
                                Text(
                                    text = "${story.unreadChapters} new",
                                    style = MediaTypography.LabelSmall,
                                    color = MediaColors.AccentPrimary,
                                    fontWeight = FontWeight.SemiBold
                                )
                            }
                        }
                    } else {
                        Text(
                            text = "Updated ${story.lastUpdated}",
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                    }
                    
                    Text(
                        text = "${story.readChapters}/${story.chapterCount}",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary
                    )
                }
            }
        }
    }
}
