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

@OptIn(ExperimentalLayoutApi::class)
@Composable
internal fun QuickAccessFlowGrid(
    items: List<QuickAccessItem>,
    lastOpenedCategory: String?,
    onCategoryClick: (String) -> Unit
    reorderMode: Boolean,
    onCategoryClick: (String) -> Unit,
    onEnableReorder: () -> Unit,
    onMoveItem: (fromIndex: Int, toIndex: Int) -> Unit,
    onToggleFavorite: (String) -> Unit
) {
    BoxWithConstraints(modifier = Modifier.fillMaxWidth()) {
        val columns = if (maxWidth < 360.dp) 2 else 3
        val spacing = MediaSpacing.MD
        val cardWidth = (maxWidth - spacing * (columns - 1)) / columns

        FlowRow(
            maxItemsInEachRow = columns,
            horizontalArrangement = Arrangement.spacedBy(spacing),
            verticalArrangement = Arrangement.spacedBy(spacing),
            modifier = Modifier
                .fillMaxWidth()
                .semantics { isTraversalGroup = true }
        ) {
            items.forEachIndexed { index, item ->
                QuickAccessCard(
                    item = item,
                    isHighlighted = item.id == lastOpenedCategory,
                    reorderMode = reorderMode,
                    canMoveUp = index > 0,
                    canMoveDown = index < items.lastIndex,
                    onClick = { onCategoryClick(item.id) },
                    onLongClick = onEnableReorder,
                    onMoveUp = { onMoveItem(index, index - 1) },
                    onMoveDown = { onMoveItem(index, index + 1) },
                    onToggleFavorite = { onToggleFavorite(item.id) },
                    modifier = Modifier.width(cardWidth)
                )
            }
        }
    }
}
