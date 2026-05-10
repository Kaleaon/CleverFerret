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
            currentPage = state.currentPage,
            degradedWarning = state.degradedParseWarning
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


// =============================================================================
// BOTTOM BAR
// =============================================================================


// =============================================================================
// TABLE OF CONTENTS SHEET
// =============================================================================


// =============================================================================
// SETTINGS SHEET
// =============================================================================


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
    val isComic: Boolean = false,
    val degradedParseWarning: String? = null
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
