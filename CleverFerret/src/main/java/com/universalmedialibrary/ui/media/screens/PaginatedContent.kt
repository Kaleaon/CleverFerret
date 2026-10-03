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

@OptIn(ExperimentalFoundationApi::class)
@Composable
internal fun PaginatedContent(
    pagerState: PagerState,
    pages: List<BookPage>,
    settings: ReaderSettings,
    highlights: List<HighlightInfo>,
    pageAnimation: PageAnimation
) {
    HorizontalPager(
        state = pagerState,
        modifier = Modifier.fillMaxSize(),
        beyondViewportPageCount = 1,
        pageSpacing = 0.dp
    ) { pageIndex ->
        val page = pages.getOrNull(pageIndex)
        
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(
                    horizontal = settings.marginHorizontal.dp,
                    vertical = settings.marginVertical.dp
                )
                .graphicsLayer {
                    // Apply page turn animation
                    when (pageAnimation) {
                        PageAnimation.SLIDE -> {
                            val pageOffset = (pagerState.currentPage - pageIndex) + pagerState.currentPageOffsetFraction
                            translationX = pageOffset * size.width
                        }
                        PageAnimation.CURL -> {
                            val pageOffset = (pagerState.currentPage - pageIndex) + pagerState.currentPageOffsetFraction
                            rotationY = pageOffset * -30f
                            cameraDistance = 8 * density
                        }
                        PageAnimation.FADE -> {
                            val pageOffset = (pagerState.currentPage - pageIndex) + pagerState.currentPageOffsetFraction
                            alpha = 1f - kotlin.math.abs(pageOffset)
                        }
                        PageAnimation.NONE -> { }
                    }
                }
        ) {
            if (page != null) {
                BookPageContent(
                    page = page,
                    settings = settings,
                    highlights = highlights.filter { it.pageNumber == pageIndex }
                )
            }
        }
    }
}
