package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
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
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun ReviewCard(review: ReviewItem) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.ScreenHorizontal, vertical = MediaSpacing.SM),
        shape = RoundedCornerShape(MediaCorners.Card),
        color = MediaColors.BackgroundElevated
    ) {
        Column(modifier = Modifier.padding(MediaSpacing.MD)) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Reviewer avatar
                Surface(
                    modifier = Modifier.size(40.dp),
                    shape = CircleShape,
                    color = MediaColors.BackgroundSurface
                ) {
                    Icon(
                        imageVector = Icons.Default.Person,
                        contentDescription = "${review.author} avatar",
                        modifier = Modifier.padding(MediaSpacing.SM),
                        tint = MediaColors.TextTertiary
                    )
                }
                
                Spacer(modifier = Modifier.width(MediaSpacing.SM))
                
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = review.author,
                        style = MediaTypography.LabelLarge,
                        color = MediaColors.TextPrimary
                    )
                    Text(
                        text = review.source,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
                
                // Rating
                review.rating?.let { rating ->
                    Surface(
                        shape = RoundedCornerShape(MediaCorners.XS),
                        color = MediaColors.Warning.copy(alpha = 0.15f)
                    ) {
                        Row(
                            modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.XS),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Default.Star,
                                contentDescription = "Review rating",
                                modifier = Modifier.size(14.dp),
                                tint = MediaColors.Warning
                            )
                            Spacer(modifier = Modifier.width(2.dp))
                            Text(
                                text = rating,
                                style = MediaTypography.LabelMedium,
                                color = MediaColors.Warning
                            )
                        }
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.MD))
            
            Text(
                text = review.content,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextSecondary,
                maxLines = 4,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}
