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

/**
 * Clean Media-Centric Reader Screen
 * 
 * Unified reader interface supporting:
 * - EPUB, PDF, FB2, MOBI, CBZ/CBR (comics)
 * - Customizable themes (light, dark, sepia, custom)
 * - Typography controls (font, size, spacing, margins)
 * - Navigation (TOC, bookmarks, page slider)
 * - TTS integration
 * - Dictionary lookup
 * - Highlights & annotations
 * - Gesture controls
 * 
 * Features a clean, distraction-free reading experience
 * with elegant controls that fade away during reading.
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaReaderScreen(
    state: ReaderState,
    onPageChange: (Int) -> Unit,
    onChapterChange: (Int) -> Unit,
    onBookmarkToggle: () -> Unit,
    onTocOpen: () -> Unit,
    onSettingsOpen: () -> Unit,
    onSearch: () -> Unit,
    onClose: () -> Unit,
    onTextSelect: (String, Int, Int) -> Unit,
    onTtsToggle: () -> Unit,
    modifier: Modifier = Modifier
) {
    var controlsVisible by remember { mutableStateOf(true) }
    var showTocSheet by remember { mutableStateOf(false) }
    var showSettingsSheet by remember { mutableStateOf(false) }
    
    // Auto-hide controls after 3 seconds
    LaunchedEffect(controlsVisible) {
        if (controlsVisible) {
            kotlinx.coroutines.delay(3000)
            controlsVisible = false
        }
    }
    
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(state.theme.backgroundColor)
            .pointerInput(Unit) {
                detectTapGestures(
                    onTap = { offset ->
                        val screenWidth = size.width
                        when {
                            // Left 1/3 - previous page
                            offset.x < screenWidth / 3 -> {
                                if (state.currentPage > 1) {
                                    onPageChange(state.currentPage - 1)
                                }
                            }
                            // Right 1/3 - next page
                            offset.x > screenWidth * 2 / 3 -> {
                                if (state.currentPage < state.totalPages) {
                                    onPageChange(state.currentPage + 1)
                                }
                            }
                            // Center - toggle controls
                            else -> {
                                controlsVisible = !controlsVisible
                            }
                        }
                    }
                )
            }
    ) {
        // Main reading content
        ReaderContent(
            content = state.currentContent,
            theme = state.theme,
            typography = state.typography,
            isComic = state.isComic,
            currentPage = state.currentPage
        )
        
        // Animated top bar
        AnimatedVisibility(
            visible = controlsVisible,
            enter = fadeIn() + slideInVertically(),
            exit = fadeOut() + slideOutVertically(),
            modifier = Modifier.align(Alignment.TopCenter)
        ) {
            ReaderTopBar(
                title = state.title,
                chapter = state.currentChapter?.title,
                isBookmarked = state.isCurrentPageBookmarked,
                isTtsActive = state.isTtsActive,
                onClose = onClose,
                onBookmark = onBookmarkToggle,
                onToc = { showTocSheet = true },
                onSearch = onSearch,
                onTts = onTtsToggle,
                onSettings = { showSettingsSheet = true }
            )
        }
        
        // Animated bottom bar
        AnimatedVisibility(
            visible = controlsVisible,
            enter = fadeIn() + slideInVertically(initialOffsetY = { it }),
            exit = fadeOut() + slideOutVertically(targetOffsetY = { it }),
            modifier = Modifier.align(Alignment.BottomCenter)
        ) {
            ReaderBottomBar(
                currentPage = state.currentPage,
                totalPages = state.totalPages,
                chapterProgress = state.chapterProgress,
                currentChapterIndex = state.currentChapterIndex,
                totalChapters = state.chapters.size,
                onPageChange = onPageChange,
                onPreviousChapter = {
                    if (state.currentChapterIndex > 0) {
                        onChapterChange(state.currentChapterIndex - 1)
                    }
                },
                onNextChapter = {
                    if (state.currentChapterIndex < state.chapters.size - 1) {
                        onChapterChange(state.currentChapterIndex + 1)
                    }
                },
                theme = state.theme
            )
        }
        
        // Reading progress indicator (always visible)
        LinearProgressIndicator(
            progress = { state.overallProgress },
            modifier = Modifier
                .fillMaxWidth()
                .height(2.dp)
                .align(Alignment.TopCenter),
            color = MediaColors.AccentPrimary,
            trackColor = Color.Transparent
        )
    }
    
    // Table of Contents Sheet
    if (showTocSheet) {
        ModalBottomSheet(
            onDismissRequest = { showTocSheet = false },
            containerColor = MediaColors.BackgroundElevated
        ) {
            TocSheet(
                chapters = state.chapters,
                currentChapterIndex = state.currentChapterIndex,
                onChapterSelect = { index ->
                    onChapterChange(index)
                    showTocSheet = false
                }
            )
        }
    }
    
    // Settings Sheet
    if (showSettingsSheet) {
        ModalBottomSheet(
            onDismissRequest = { showSettingsSheet = false },
            containerColor = MediaColors.BackgroundElevated
        ) {
            ReaderSettingsSheet(
                theme = state.theme,
                typography = state.typography,
                onThemeChange = { /* Update theme */ },
                onTypographyChange = { /* Update typography */ }
            )
        }
    }
}

// =============================================================================
// READER CONTENT
// =============================================================================

@Composable
private fun ReaderContent(
    content: ReaderContent,
    theme: ReaderTheme,
    typography: ReaderTypography,
    isComic: Boolean,
    currentPage: Int
) {
    if (isComic) {
        // Comic/manga page view
        ComicPageView(
            imageUrl = content.imageUrls.getOrNull(currentPage - 1) ?: content.imageUrl,
            modifier = Modifier.fillMaxSize()
        )
    } else {
        if (!content.htmlContent.isNullOrBlank()) {
            HtmlReaderContent(
                htmlContent = content.htmlContent,
                theme = theme,
                typography = typography
            )
        } else {
            // Text content
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(horizontal = typography.marginHorizontal.dp),
                contentPadding = PaddingValues(vertical = typography.marginVertical.dp)
            ) {
                item {
                    Text(
                        text = content.text,
                        color = theme.textColor,
                        fontSize = typography.fontSize.sp,
                        lineHeight = (typography.fontSize * typography.lineHeight).sp,
                        fontFamily = typography.fontFamily,
                        letterSpacing = typography.letterSpacing.sp,
                        textAlign = when (typography.textAlign) {
                            TextAlignment.LEFT -> TextAlign.Start
                            TextAlignment.CENTER -> TextAlign.Center
                            TextAlignment.RIGHT -> TextAlign.End
                            TextAlignment.JUSTIFY -> TextAlign.Justify
                        }
                    )
                }
            }
        }
    }
}

@Composable
private fun HtmlReaderContent(
    htmlContent: String,
    theme: ReaderTheme,
    typography: ReaderTypography
) {
    var webView by remember { mutableStateOf<WebView?>(null) }

    DisposableEffect(Unit) {
        onDispose {
            webView?.apply {
                loadUrl("about:blank")
                clearHistory()
                clearCache(true)
                removeAllViews()
                destroy()
            }
            webView = null
        }
    }

    AndroidView(
        factory = { context ->
            WebView(context).apply {
                webViewClient = WebViewClient()
                settings.apply {
                    javaScriptEnabled = false
                    allowFileAccess = false
                    allowContentAccess = false
                    domStorageEnabled = false
                    setSupportZoom(true)
                    builtInZoomControls = true
                    displayZoomControls = false
                    loadWithOverviewMode = true
                    useWideViewPort = true
                    mixedContentMode = android.webkit.WebSettings.MIXED_CONTENT_NEVER_ALLOW
                    safeBrowsingEnabled = true
                }
                webView = this
            }
        },
        update = { view ->
            view.loadDataWithBaseURL(
                null,
                buildHtmlForReader(htmlContent, theme, typography),
                "text/html",
                "UTF-8",
                null
            )
        },
        modifier = Modifier.fillMaxSize()
    )
}

private fun buildHtmlForReader(
    content: String,
    theme: ReaderTheme,
    typography: ReaderTypography
): String {
    val backgroundColor = theme.backgroundColor.toHexColor()
    val textColor = theme.textColor.toHexColor()
    return """
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
                body {
                    font-family: ${typography.fontFamily};
                    font-size: ${typography.fontSize}px;
                    line-height: ${typography.lineHeight};
                    background-color: $backgroundColor;
                    color: $textColor;
                    padding: ${typography.marginVertical}px ${typography.marginHorizontal}px;
                    margin: 0;
                    text-align: ${typography.textAlign.name.lowercase()};
                }
                img {
                    max-width: 100%;
                    height: auto;
                }
                a {
                    color: ${theme.linkColor.toHexColor()};
                }
            </style>
        </head>
        <body>
            $content
        </body>
        </html>
    """.trimIndent()
}

private fun Color.toHexColor(): String {
    val intColor = (alpha * 255).toInt() shl 24 or
        ((red * 255).toInt() shl 16) or
        ((green * 255).toInt() shl 8) or
        (blue * 255).toInt()
    return String.format("#%06X", 0xFFFFFF and intColor)
}

@Composable
private fun ComicPageView(
    imageUrl: String?,
    modifier: Modifier = Modifier
) {
    Box(
        modifier = modifier,
        contentAlignment = Alignment.Center
    ) {
        if (imageUrl != null) {
            coil.compose.AsyncImage(
                    
                model = imageUrl,
                contentDescription = "Media image",
                modifier = Modifier.fillMaxSize(),
                contentScale = androidx.compose.ui.layout.ContentScale.Fit
            )
        } else {
            CircularProgressIndicator(color = MediaColors.AccentPrimary)
        }
    }
}

// =============================================================================
// TOP BAR
// =============================================================================

@Composable
private fun ReaderTopBar(
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

// =============================================================================
// BOTTOM BAR
// =============================================================================

@Composable
private fun ReaderBottomBar(
    currentPage: Int,
    totalPages: Int,
    chapterProgress: Float,
    currentChapterIndex: Int,
    totalChapters: Int,
    onPageChange: (Int) -> Unit,
    onPreviousChapter: () -> Unit,
    onNextChapter: () -> Unit,
    theme: ReaderTheme
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MediaColors.Background.copy(alpha = 0.95f),
        tonalElevation = MediaElevation.SM
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .navigationBarsPadding()
                .padding(MediaSpacing.MD)
        ) {
            // Page slider
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = currentPage.toString(),
                    style = MediaTypography.LabelMedium,
                    color = MediaColors.TextSecondary,
                    modifier = Modifier.width(40.dp)
                )
                
                Slider(
                    value = currentPage.toFloat(),
                    onValueChange = { onPageChange(it.toInt()) },
                    valueRange = 1f..totalPages.toFloat(),
                    modifier = Modifier.weight(1f),
                    colors = SliderDefaults.colors(
                        thumbColor = MediaColors.AccentPrimary,
                        activeTrackColor = MediaColors.AccentPrimary,
                        inactiveTrackColor = MediaColors.ProgressBackground
                    )
                )
                
                Text(
                    text = totalPages.toString(),
                    style = MediaTypography.LabelMedium,
                    color = MediaColors.TextSecondary,
                    modifier = Modifier.width(40.dp),
                    textAlign = TextAlign.End
                )
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
            
            // Chapter navigation
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Previous chapter
                TextButton(
                    onClick = onPreviousChapter,
                    enabled = currentChapterIndex > 0
                ) {
                    Icon(
                        imageVector = Icons.Default.ChevronLeft,
                        contentDescription = "Media image",
                        modifier = Modifier.size(20.dp)
                    )
                    Text("Prev")
                }
                
                // Chapter info
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Text(
                        text = "Chapter ${currentChapterIndex + 1} of $totalChapters",
                        style = MediaTypography.LabelMedium,
                        color = MediaColors.TextSecondary
                    )
                    LinearProgressIndicator(
                        progress = { chapterProgress },
                        modifier = Modifier
                            .width(100.dp)
                            .height(4.dp)
                            .clip(RoundedCornerShape(MediaCorners.Full)),
                        color = MediaColors.AccentPrimary,
                        trackColor = MediaColors.ProgressBackground
                    )
                }
                
                // Next chapter
                TextButton(
                    onClick = onNextChapter,
                    enabled = currentChapterIndex < totalChapters - 1
                ) {
                    Text("Next")
                    Icon(
                        imageVector = Icons.Default.ChevronRight,
                        contentDescription = "Media image",
                        modifier = Modifier.size(20.dp)
                    )
                }
            }
        }
    }
}

// =============================================================================
// TABLE OF CONTENTS SHEET
// =============================================================================

@Composable
private fun TocSheet(
    chapters: List<ChapterInfo>,
    currentChapterIndex: Int,
    onChapterSelect: (Int) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(MediaSpacing.MD)
    ) {
        Text(
            text = "Table of Contents",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            modifier = Modifier.padding(bottom = MediaSpacing.MD)
        )
        
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .heightIn(max = 400.dp)
        ) {
            itemsIndexed(chapters) { index, chapter ->
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { onChapterSelect(index) }
                        .background(
                            if (index == currentChapterIndex)
                                MediaColors.AccentPrimary.copy(alpha = 0.1f)
                            else
                                Color.Transparent
                        )
                        .padding(MediaSpacing.MD),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = chapter.title,
                            style = MediaTypography.BodyMedium,
                            color = if (index == currentChapterIndex)
                                MediaColors.AccentPrimary
                            else
                                MediaColors.TextPrimary,
                            fontWeight = if (index == currentChapterIndex)
                                FontWeight.SemiBold
                            else
                                FontWeight.Normal
                        )
                        
                        if (chapter.progress > 0) {
                            Spacer(modifier = Modifier.height(MediaSpacing.XS))
                            LinearProgressIndicator(
                                progress = { chapter.progress },
                                modifier = Modifier
                                    .fillMaxWidth(0.5f)
                                    .height(2.dp)
                                    .clip(RoundedCornerShape(MediaCorners.Full)),
                                color = MediaColors.AccentPrimary,
                                trackColor = MediaColors.ProgressBackground
                            )
                        }
                    }
                    
                    if (index == currentChapterIndex) {
                        Icon(
                            imageVector = Icons.Default.PlayArrow,
                            contentDescription = "Current",
                            tint = MediaColors.AccentPrimary,
                            modifier = Modifier.size(20.dp)
                        )
                    }
                }
            }
        }
    }
}

// =============================================================================
// SETTINGS SHEET
// =============================================================================

@Composable
private fun ReaderSettingsSheet(
    theme: ReaderTheme,
    typography: ReaderTypography,
    onThemeChange: (ReaderTheme) -> Unit,
    onTypographyChange: (ReaderTypography) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(MediaSpacing.MD)
    ) {
        Text(
            text = "Reading Settings",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            modifier = Modifier.padding(bottom = MediaSpacing.LG)
        )
        
        // Theme selector
        Text(
            text = "Theme",
            style = MediaTypography.LabelMedium,
            color = MediaColors.TextSecondary,
            modifier = Modifier.padding(bottom = MediaSpacing.SM)
        )
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            ReaderTheme.presets.forEach { preset ->
                ThemeButton(
                    theme = preset,
                    isSelected = theme.name == preset.name,
                    onClick = { onThemeChange(preset) },
                    modifier = Modifier.weight(1f)
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        // Font size
        Text(
            text = "Font Size",
            style = MediaTypography.LabelMedium,
            color = MediaColors.TextSecondary,
            modifier = Modifier.padding(bottom = MediaSpacing.SM)
        )
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            IconButton(onClick = {
                if (typography.fontSize > 12) {
                    onTypographyChange(typography.copy(fontSize = typography.fontSize - 1))
                }
            }) {
                Icon(
                    imageVector = Icons.Default.TextDecrease,
                    contentDescription = "Decrease",
                    tint = MediaColors.TextSecondary
                )
            }
            
            Text(
                text = "${typography.fontSize}sp",
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextPrimary
            )
            
            IconButton(onClick = {
                if (typography.fontSize < 32) {
                    onTypographyChange(typography.copy(fontSize = typography.fontSize + 1))
                }
            }) {
                Icon(
                    imageVector = Icons.Default.TextIncrease,
                    contentDescription = "Increase",
                    tint = MediaColors.TextSecondary
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        // Line height
        Text(
            text = "Line Spacing",
            style = MediaTypography.LabelMedium,
            color = MediaColors.TextSecondary,
            modifier = Modifier.padding(bottom = MediaSpacing.SM)
        )
        
        Slider(
            value = typography.lineHeight,
            onValueChange = { onTypographyChange(typography.copy(lineHeight = it)) },
            valueRange = 1.0f..2.5f,
            steps = 5,
            colors = SliderDefaults.colors(
                thumbColor = MediaColors.AccentPrimary,
                activeTrackColor = MediaColors.AccentPrimary
            )
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        // Margins
        Text(
            text = "Margins",
            style = MediaTypography.LabelMedium,
            color = MediaColors.TextSecondary,
            modifier = Modifier.padding(bottom = MediaSpacing.SM)
        )
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
        ) {
            listOf(8, 16, 24, 32).forEach { margin ->
                FilterChip(
                    selected = typography.marginHorizontal == margin,
                    onClick = { onTypographyChange(typography.copy(marginHorizontal = margin)) },
                    label = { Text("${margin}dp") },
                    colors = FilterChipDefaults.filterChipColors(
                        selectedContainerColor = MediaColors.AccentPrimary.copy(alpha = 0.2f),
                        selectedLabelColor = MediaColors.AccentPrimary
                    )
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        // Text alignment
        Text(
            text = "Text Align",
            style = MediaTypography.LabelMedium,
            color = MediaColors.TextSecondary,
            modifier = Modifier.padding(bottom = MediaSpacing.SM)
        )
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
        ) {
            TextAlignment.entries.forEach { align ->
                FilterChip(
                    selected = typography.textAlign == align,
                    onClick = { onTypographyChange(typography.copy(textAlign = align)) },
                    label = { 
                        Icon(
                            imageVector = when (align) {
                                TextAlignment.LEFT -> Icons.Default.FormatAlignLeft
                                TextAlignment.CENTER -> Icons.Default.FormatAlignCenter
                                TextAlignment.RIGHT -> Icons.Default.FormatAlignRight
                                TextAlignment.JUSTIFY -> Icons.Default.FormatAlignJustify
                            },
                            contentDescription = align.name,
                            modifier = Modifier.size(18.dp)
                        )
                    },
                    colors = FilterChipDefaults.filterChipColors(
                        selectedContainerColor = MediaColors.AccentPrimary.copy(alpha = 0.2f),
                        selectedLabelColor = MediaColors.AccentPrimary
                    )
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.XL))
    }
}

@Composable
private fun ThemeButton(
    theme: ReaderTheme,
    isSelected: Boolean,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier
            .height(56.dp)
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick)
            .border(
                width = if (isSelected) 2.dp else 0.dp,
                color = if (isSelected) MediaColors.AccentPrimary else Color.Transparent,
                shape = RoundedCornerShape(MediaCorners.MD)
            ),
        color = theme.backgroundColor
    ) {
        Box(contentAlignment = Alignment.Center) {
            Text(
                text = "Aa",
                color = theme.textColor,
                fontWeight = FontWeight.Medium
            )
        }
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class ReaderState(
    val title: String,
    val author: String?,
    val currentContent: ReaderContent,
    val currentPage: Int,
    val totalPages: Int,
    val chapters: List<ChapterInfo>,
    val currentChapterIndex: Int,
    val currentChapter: ChapterInfo? = chapters.getOrNull(currentChapterIndex),
    val chapterProgress: Float = 0f,
    val overallProgress: Float = 0f,
    val theme: ReaderTheme = ReaderTheme.Dark,
    val typography: ReaderTypography = ReaderTypography(),
    val bookmarks: List<BookmarkInfo> = emptyList(),
    val isCurrentPageBookmarked: Boolean = false,
    val isTtsActive: Boolean = false,
    val isComic: Boolean = false
)

data class ReaderContent(
    val text: String = "",
    val imageUrl: String? = null,
    val htmlContent: String? = null,
    val imageUrls: List<String> = emptyList() // For comics - list of page image paths
)

data class ChapterInfo(
    val id: String,
    val title: String,
    val startPage: Int,
    val endPage: Int,
    val progress: Float = 0f
)

data class BookmarkInfo(
    val id: String,
    val page: Int,
    val chapter: String,
    val excerpt: String,
    val timestamp: Long
)

data class ReaderTheme(
    val name: String,
    val backgroundColor: Color,
    val textColor: Color,
    val linkColor: Color = MediaColors.AccentPrimary
) {
    companion object {
        val Dark = ReaderTheme(
            name = "Dark",
            backgroundColor = MediaColors.Background,
            textColor = MediaColors.TextPrimary
        )
        
        val Light = ReaderTheme(
            name = "Light",
            backgroundColor = Color(0xFFFAFAFA),
            textColor = Color(0xFF1A1A1A)
        )
        
        val Sepia = ReaderTheme(
            name = "Sepia",
            backgroundColor = Color(0xFFF5E6D3),
            textColor = Color(0xFF5B4636)
        )
        
        val Black = ReaderTheme(
            name = "Black",
            backgroundColor = Color.Black,
            textColor = Color(0xFFCCCCCC)
        )
        
        val presets = listOf(Light, Sepia, Dark, Black)
    }
}

data class ReaderTypography(
    val fontSize: Int = 16,
    val lineHeight: Float = 1.6f,
    val letterSpacing: Float = 0f,
    val marginHorizontal: Int = 16,
    val marginVertical: Int = 24,
    val textAlign: TextAlignment = TextAlignment.LEFT,
    val fontFamily: FontFamily = FontFamily.Serif
)

enum class TextAlignment {
    LEFT, CENTER, RIGHT, JUSTIFY
}
