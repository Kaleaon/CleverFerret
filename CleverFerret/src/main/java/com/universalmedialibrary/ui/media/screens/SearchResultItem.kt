package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.focus.FocusRequester
import androidx.compose.ui.focus.focusRequester
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.components.TagChip
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun SearchResultItem(
    result: SearchResult,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Thumbnail
        Surface(
            modifier = Modifier
                .size(
                    width = when (result.category) {
                        SearchCategory.MUSIC, SearchCategory.PODCASTS -> 56.dp
                        else -> 42.dp
                    },
                    height = when (result.category) {
                        SearchCategory.MOVIES, SearchCategory.TV_SHOWS -> 63.dp
                        SearchCategory.MUSIC, SearchCategory.PODCASTS -> 56.dp
                        else -> 63.dp
                    }
                )
                .clip(
                    when (result.category) {
                        SearchCategory.MUSIC -> RoundedCornerShape(MediaCorners.SM)
                        else -> RoundedCornerShape(MediaCorners.XS)
                    }
                ),
            color = MediaColors.BackgroundSurface
        ) {
            if (result.imageUrl != null) {
                AsyncImage(
                    
                    model = result.imageUrl,
                    contentDescription = "Media image",
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Box(contentAlignment = Alignment.Center) {
                    Icon(
                        imageVector = result.category.icon,
                        contentDescription = "Media image",
                        tint = result.category.color.copy(alpha = 0.5f),
                        modifier = Modifier.size(24.dp)
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = result.title,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )
            
            if (result.subtitle != null) {
                Text(
                    text = result.subtitle,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextSecondary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
            
            // Source badge for external results
            if (result.source != null && result.source != "Local") {
                Spacer(modifier = Modifier.height(2.dp))
                Surface(
                    shape = RoundedCornerShape(MediaCorners.XS),
                    color = MediaColors.BackgroundElevated
                ) {
                    Text(
                        text = result.source,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary,
                        modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 1.dp)
                    )
                }
            }
        }
        
        // Category indicator
        Icon(
            imageVector = result.category.icon,
            contentDescription = "Media image",
            tint = result.category.color,
            modifier = Modifier.size(16.dp)
        )
    }
}
