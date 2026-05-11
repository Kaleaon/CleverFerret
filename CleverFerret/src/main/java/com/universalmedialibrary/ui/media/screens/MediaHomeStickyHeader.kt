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

@Composable
internal fun StickyContentLibraryHeader(
    onNavigationClick: () -> Unit = {},
    onSearchClick: () -> Unit,
    onNotificationClick: () -> Unit
) {
    BoxWithConstraints {
        val expandedWidth = maxWidth >= 840.dp
        val horizontalPadding = if (expandedWidth) 16.dp else 4.dp
        val searchEndPadding = if (expandedWidth) 12.dp else 4.dp

        CenterAlignedTopAppBar(
            modifier = Modifier.testTag(MEDIA_HOME_TOP_BAR_TAG),
        title = {
                Surface(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(end = searchEndPadding)
                        .testTag(MEDIA_HOME_TOP_BAR_SEARCH_TAG),
                    shape = CircleShape,
                    color = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.85f),
                    onClick = onSearchClick
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .heightIn(min = 40.dp)
                            .padding(horizontal = MediaSpacing.MD, vertical = 10.dp),
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
                    ) {
                        Icon(
                            imageVector = Icons.Default.Search,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.onSurfaceVariant,
                            modifier = Modifier.size(MediaSizes.IconSM)
                        )
                        Text(
                            text = stringResource(id = R.string.search_hint),
                            style = MediaTypography.BodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            },
            navigationIcon = {
                IconButton(
                    onClick = onNavigationClick,
                    modifier = Modifier
                        .padding(start = horizontalPadding)
                        .testTag(MEDIA_HOME_TOP_BAR_NAV_TAG)
                ) {
                    Icon(
                        imageVector = Icons.Default.Menu,
                        contentDescription = "Navigation menu",
                        tint = MaterialTheme.colorScheme.onBackground
                    )
                }
            },
            actions = {
                IconButton(
                    onClick = onNotificationClick,
                    modifier = Modifier.testTag(MEDIA_HOME_TOP_BAR_NOTIFICATIONS_TAG)
                ) {
                    Icon(
                        imageVector = Icons.Default.Notifications,
                        contentDescription = "Notifications",
                        tint = MaterialTheme.colorScheme.onBackground
                    )
                }
            },
            expandedHeight = TopAppBarDefaults.TopAppBarExpandedHeight,
            windowInsets = WindowInsets.statusBars,
            colors = TopAppBarDefaults.centerAlignedTopAppBarColors(
                containerColor = MaterialTheme.colorScheme.background,
                titleContentColor = MaterialTheme.colorScheme.onBackground
            ),
            titleHorizontalAlignment = Alignment.CenterHorizontally
        )
    }
}
private fun MediaItem.remainingLabel(): String {
    val clampedProgress = progress.coerceIn(0f, 1f)
    if (clampedProgress <= 0f || clampedProgress >= 1f) {
        return subtitle ?: duration.orEmpty()
    }

    if (!remainingTimeText.isNullOrBlank()) {
        return "${remainingTimeText.trim()} left"
    }

    val parsedDurationSeconds = parseDurationToSeconds(duration)
    if (parsedDurationSeconds != null) {
        val remainingSeconds = (parsedDurationSeconds * (1f - clampedProgress)).roundToInt()
        return "${formatRemainingTime(remainingSeconds)} left"
    }

    if (!subtitle.isNullOrBlank()) {
        return subtitle
    }

    val remainingPercent = ((1f - clampedProgress) * 100).roundToInt().coerceIn(1, 99)
    return "$remainingPercent% remaining"
}

private fun parseDurationToSeconds(duration: String?): Int? {
    if (duration.isNullOrBlank()) return null
    val normalized = duration.trim().lowercase()
    val hours = "(\\d+)\\s*h".toRegex().find(normalized)?.groupValues?.get(1)?.toIntOrNull() ?: 0
    val minutes = "(\\d+)\\s*m".toRegex().find(normalized)?.groupValues?.get(1)?.toIntOrNull() ?: 0
    val seconds = "(\\d+)\\s*s".toRegex().find(normalized)?.groupValues?.get(1)?.toIntOrNull() ?: 0
    if (hours == 0 && minutes == 0 && seconds == 0) return null
    return (hours * 3600) + (minutes * 60) + seconds
}

private fun formatRemainingTime(totalSeconds: Int): String {
    val safeSeconds = totalSeconds.coerceAtLeast(0)
    val hours = safeSeconds / 3600
    val minutes = (safeSeconds % 3600) / 60

    return when {
        hours > 0 -> "${hours}h ${minutes}m"
        minutes > 0 -> "${minutes}m"
        else -> "<1m"
    }
}

