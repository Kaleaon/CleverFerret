package com.universalmedialibrary.ui.media.screens

import android.provider.Settings
import androidx.compose.animation.*
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.*
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.interaction.collectIsDraggedAsState
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.pager.*
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.material3.pulltorefresh.PullToRefreshBox
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.*
import androidx.compose.runtime.snapshotFlow
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.isTraversalGroup
import androidx.compose.ui.semantics.role
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.semantics.traversalIndex
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.platform.testTag
import coil.compose.AsyncImage
import com.universalmedialibrary.R
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.navigation.HomeSectionRouteContract
import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlin.math.roundToInt

internal const val MEDIA_HOME_TOP_BAR_TAG = "media_home_top_bar"
internal const val MEDIA_HOME_TOP_BAR_NAV_TAG = "media_home_top_bar_nav_icon"
internal const val MEDIA_HOME_TOP_BAR_SEARCH_TAG = "media_home_top_bar_search"
internal const val MEDIA_HOME_TOP_BAR_NOTIFICATIONS_TAG = "media_home_top_bar_notifications"

/**
 * Card with metallic gold gradient border matching mockup design
 */
@Composable
internal fun MetallicBorderCard(
    item: MediaItem,
    onClick: () -> Unit
) {
    val progress = item.progress.coerceIn(0f, 1f)
    val hasProgress = progress > 0f && progress < 1f
    val progressTrackColor = MaterialTheme.colorScheme.surfaceContainerHighest
    val progressBackgroundColor = MaterialTheme.colorScheme.surface.copy(alpha = 0.92f)

    val primaryColor = MaterialTheme.colorScheme.primary
    val metallicGradient = Brush.linearGradient(
        colors = listOf(
            primaryColor.copy(alpha = 0.7f),
            primaryColor,
            primaryColor.copy(alpha = 0.9f),
            primaryColor.copy(alpha = 0.7f)
        )
    )
    
    Column(
        modifier = Modifier
            .width(140.dp)
            .clickable(onClick = onClick)
    ) {
        // Card with metallic border
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .aspectRatio(MediaSizes.PosterAspectRatio)
        ) {
            // Metallic border background
            Box(
                modifier = Modifier
                    .matchParentSize()
                    .padding(0.dp)
                    .background(
                        brush = metallicGradient,
                        shape = RoundedCornerShape(10.dp)
                    )
            )
            
            // Inner card with image
            Box(
                modifier = Modifier
                    .matchParentSize()
                    .padding(2.dp) // Border thickness
                    .clip(RoundedCornerShape(8.dp))
                    .background(MaterialTheme.colorScheme.surface)
            ) {
                // Cover image
                if (item.imageUrl != null) {
                    AsyncImage(
                    
                        model = item.imageUrl,
                        contentDescription = item.title,
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    // Placeholder
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(MaterialTheme.colorScheme.surfaceVariant),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = item.mediaType.icon,
                            contentDescription = "Media image",
                            modifier = Modifier.size(48.dp),
                            tint = MaterialTheme.colorScheme.primary.copy(alpha = 0.5f)
                        )
                    }
                }
                
                // Progress bar at bottom
                if (hasProgress) {
                    Box(
                        modifier = Modifier
                            .align(Alignment.BottomCenter)
                            .fillMaxWidth()
                            .height(6.dp)
                            .background(progressTrackColor)
                    ) {
                        Box(
                            modifier = Modifier
                                .fillMaxHeight()
                                .fillMaxWidth(progress)
                                .background(MaterialTheme.colorScheme.primary)
                        )
                    }
                }
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        // Title
        Text(
            text = item.title,
            style = MediaTypography.BodyMedium,
            color = MaterialTheme.colorScheme.onBackground,
            fontWeight = FontWeight.Bold,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis
        )
        
        // Subtitle (remaining time or metadata)
        val subtitleText = remember(item) { item.remainingLabel() }
        if (subtitleText.isNotEmpty()) {
            Surface(
                color = progressBackgroundColor,
                shape = RoundedCornerShape(MediaCorners.SM)
            ) {
                Text(
                    text = subtitleText,
                    style = MediaTypography.BodySmall,
                    color = MaterialTheme.colorScheme.onSurface,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                    modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 2.dp)
                )
            }
        }
    }
}
