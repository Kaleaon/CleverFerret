package com.universalmedialibrary.ui.reader

import android.graphics.Bitmap
import android.net.Uri
import androidx.activity.compose.BackHandler
import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.ArrowForward
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Rect
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.ui.viewer.common.ComicSettings
import com.universalmedialibrary.ui.viewer.common.FitMode
import com.universalmedialibrary.ui.viewer.common.ReadingDirection
import com.universalmedialibrary.ui.viewer.common.ReadingMode
import com.universalmedialibrary.ui.viewer.common.ViewerSettings
import kotlinx.coroutines.delay
import kotlin.math.abs
import kotlin.math.max
import kotlin.math.min

@Composable
internal fun SinglePageView(
    pages: List<String>,
    currentPage: Int,
    panels: List<Rect>,
    currentPanel: Int,
    panelByPanelMode: Boolean,
    showPanelBorders: Boolean,
    scale: Float,
    offsetX: Float,
    offsetY: Float,
    onPageChanged: (Int) -> Unit,
    onPanelSelected: (Int) -> Unit,
    onScaleChanged: (Float) -> Unit,
    onOffsetChanged: (Float, Float) -> Unit,
    onTap: () -> Unit
) {
    if (currentPage > 0 && currentPage <= pages.size) {
        val currentPageUri = pages[currentPage - 1]

        Box(
            modifier = Modifier
                .fillMaxSize()
                .graphicsLayer(
                    scaleX = scale,
                    scaleY = scale,
                    translationX = offsetX,
                    translationY = offsetY
                )
                .pointerInput(Unit) {
                    detectTransformGestures { _, pan, zoom, _ ->
                        if (!panelByPanelMode) {
                            val newScale = (scale * zoom).coerceIn(0.5f, 5f)
                            onScaleChanged(newScale)
                            onOffsetChanged(offsetX + pan.x, offsetY + pan.y)
                        }
                    }
                }
                .pointerInput(Unit) {
                    if (panelByPanelMode) {
                        detectTapGestures { offset ->
                            // In panel mode, find which panel was tapped
                            val tappedPanel = panels.indexOfFirst { panel ->
                                panel.contains(offset)
                            }
                            if (tappedPanel >= 0) {
                                onPanelSelected(tappedPanel)
                            }
                            onTap()
                        }
                    } else {
                        detectTapGestures(
                            onTap = { onTap() },
                            onDoubleTap = { offset ->
                                // Double tap to zoom or fit to panel
                                if (panels.isNotEmpty()) {
                                    val tappedPanel = panels.indexOfFirst { panel ->
                                        panel.contains(offset)
                                    }
                                    if (tappedPanel >= 0) {
                                        onPanelSelected(tappedPanel)
                                        // Zoom to fit panel
                                        val panel = panels[tappedPanel]
                                        val zoomScale = min(
                                            size.width / panel.width,
                                            size.height / panel.height
                                        ) * 0.9f
                                        onScaleChanged(zoomScale)
                                        onOffsetChanged(-panel.left * zoomScale, -panel.top * zoomScale)
                                    }
                                }
                            }
                        )
                    }
                }
        ) {
            AsyncImage(
                    
                model = ImageRequest.Builder(LocalContext.current)
                    .data(currentPageUri)
                    .crossfade(true)
                    .build(),
                contentDescription = "Comic page $currentPage",
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Fit
            )

            // Draw panel borders and highlights
            if ((showPanelBorders || panelByPanelMode) && panels.isNotEmpty()) {
                Canvas(modifier = Modifier.fillMaxSize()) {
                    panels.forEachIndexed { index, panel ->
                        val isCurrentPanel = panelByPanelMode && index == currentPanel

                        drawRect(
                            color = if (isCurrentPanel) Color.Red else Color.Yellow,
                            topLeft = Offset(panel.left, panel.top),
                            size = Size(panel.width, panel.height),
                            style = Stroke(
                                width = if (isCurrentPanel) 4.dp.toPx() else 2.dp.toPx()
                            )
                        )

                        if (showPanelBorders) {
                            drawRect(
                                color = Color.Black.copy(alpha = 0.1f),
                                topLeft = Offset(panel.left, panel.top),
                                size = Size(panel.width, panel.height)
                            )
                        }
                    }
                }
            }
        }
    }
}
