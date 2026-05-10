package com.universalmedialibrary.ui.reader

import android.graphics.Bitmap
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.detectDragGestures
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.gestures.detectTransformGestures
import androidx.compose.foundation.gestures.rememberTransformableState
import androidx.compose.foundation.gestures.transformable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.automirrored.filled.NavigateBefore
import androidx.compose.material.icons.automirrored.filled.NavigateNext
import androidx.compose.material.icons.automirrored.filled.Note
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalClipboardManager
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.AnnotatedString
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import kotlinx.coroutines.launch

@Composable
fun PDFAnnotationOverlay(
    annotations: List<Annotation>,
    annotationTool: AnnotationTool,
    onAnnotationCreated: (Annotation) -> Unit,
    currentPage: Int
) {
    var drawingPath by remember { mutableStateOf<Path?>(null) }
    var currentPath by remember { mutableStateOf(Path()) }

    Canvas(
        modifier = Modifier
            .fillMaxSize()
            .pointerInput(annotationTool) {
                if (annotationTool == AnnotationTool.DRAW) {
                    detectDragGestures(
                        onDragStart = { offset ->
                            currentPath = Path()
                            currentPath.moveTo(offset.x, offset.y)
                        },
                        onDrag = { change, _ ->
                            currentPath.lineTo(change.position.x, change.position.y)
                            drawingPath = Path().apply { addPath(currentPath) }
                        },
                        onDragEnd = {
                            onAnnotationCreated(
                                Annotation(
                                    id = System.currentTimeMillis(),
                                    type = AnnotationType.DRAWING,
                                    pageNumber = currentPage,
                                    content = "",
                                    position = Offset.Zero,
                                    path = drawingPath
                                )
                            )
                            drawingPath = null
                        }
                    )
                }
            }
    ) {
        // Draw existing annotations
        annotations.forEach { annotation ->
            when (annotation.type) {
                AnnotationType.HIGHLIGHT -> {
                    drawRect(
                        color = Color.Yellow.copy(alpha = 0.4f),
                        topLeft = annotation.position,
                        size = annotation.size ?: androidx.compose.ui.geometry.Size(200f, 30f)
                    )
                }
                AnnotationType.DRAWING -> {
                    annotation.path?.let { path ->
                        drawPath(
                            path = path,
                            color = Color.Red,
                            style = Stroke(width = 4.dp.toPx())
                        )
                    }
                }
                AnnotationType.NOTE -> {
                    drawCircle(
                        color = Color.Blue,
                        radius = 12.dp.toPx(),
                        center = annotation.position
                    )
                }
                AnnotationType.STRIKETHROUGH -> {
                    drawLine(
                        color = Color.Red,
                        start = annotation.position,
                        end = annotation.position.copy(x = annotation.position.x + 150f),
                        strokeWidth = 3.dp.toPx()
                    )
                }
            }
        }

        // Draw current drawing
        drawingPath?.let { path ->
            drawPath(
                path = path,
                color = Color.Red,
                style = Stroke(width = 4.dp.toPx())
            )
        }
    }
}
