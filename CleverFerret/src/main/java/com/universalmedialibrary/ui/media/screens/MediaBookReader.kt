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

/**
 * Clean Media-Centric Comprehensive Book Reader
 * 
 * Supports ALL book formats:
 * - EPUB (2.x, 3.x with fixed-layout support)
 * - PDF (with reflow option)
 * - FB2 (FictionBook)
 * - MOBI/AZW/AZW3 (Kindle formats)
 * - CBZ/CBR/CB7 (Comics/Manga)
 * - DOCX/DOC/ODT/RTF (Documents)
 * - TXT/HTML/MHTML
 * - DjVu
 * - CHM (Help files)
 * 
 * Features:
 * - Multiple reading modes (paginated, scroll, two-page)
 * - Customizable themes, fonts, margins
 * - Bookmarks, highlights, annotations
 * - Text-to-Speech (TTS) integration
 * - Dictionary lookup
 * - Search within book
 * - Chapter navigation
 * - Reading statistics
 * - Auto-brightness
 * - Page turn animations
 * - Night mode/blue light filter
 */

@OptIn(ExperimentalMaterial3Api::class, ExperimentalFoundationApi::class)
@Composable
fun MediaBookReader(
    state: BookReaderState,
    onPageChange: (Int) -> Unit,
    onChapterSelect: (BookChapter) -> Unit,
    onBookmarkToggle: () -> Unit,
    onAddHighlight: (HighlightInfo) -> Unit,
    onAddAnnotation: (AnnotationInfo) -> Unit,
    onSettingsChange: (ReaderSettings) -> Unit,
    onTTSToggle: () -> Unit,
    onClose: () -> Unit,
    modifier: Modifier = Modifier
) {
    var showControls by remember { mutableStateOf(false) }
    var showSettings by remember { mutableStateOf(false) }
    var showTableOfContents by remember { mutableStateOf(false) }
    var showSearch by remember { mutableStateOf(false) }
    var showBookmarks by remember { mutableStateOf(false) }
    
    val pagerState = rememberPagerState(
        initialPage = state.currentPage,
        pageCount = { state.totalPages }
    )
    val coroutineScope = rememberCoroutineScope()
    
    // Apply reading theme
    val backgroundColor = state.settings.theme.backgroundColor
    val textColor = state.settings.theme.textColor
    
    // Sync pager state with external state
    LaunchedEffect(state.currentPage) {
        if (pagerState.currentPage != state.currentPage) {
            pagerState.scrollToPage(state.currentPage)
        }
    }
    
    // Report page changes
    LaunchedEffect(pagerState.currentPage) {
        if (pagerState.currentPage != state.currentPage) {
            onPageChange(pagerState.currentPage)
        }
    }
    
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(backgroundColor)
            .pointerInput(Unit) {
                detectTapGestures(
                    onTap = { offset ->
                        val screenWidth = size.width
                        when {
                            // Left tap - previous page
                            offset.x < screenWidth * 0.25f -> {
                                coroutineScope.launch {
                                    if (pagerState.currentPage > 0) {
                                        pagerState.animateScrollToPage(pagerState.currentPage - 1)
                                    }
                                }
                            }
                            // Right tap - next page
                            offset.x > screenWidth * 0.75f -> {
                                coroutineScope.launch {
                                    if (pagerState.currentPage < state.totalPages - 1) {
                                        pagerState.animateScrollToPage(pagerState.currentPage + 1)
                                    }
                                }
                            }
                            // Center tap - toggle controls
                            else -> {
                                showControls = !showControls
                            }
                        }
                    }
                )
            }
    ) {
        // Content based on reading mode
        when (state.settings.readingMode) {
            ReadingMode.PAGINATED -> {
                PaginatedContent(
                    pagerState = pagerState,
                    pages = state.pages,
                    settings = state.settings,
                    highlights = state.highlights,
                    pageAnimation = state.settings.pageAnimation
                )
            }
            ReadingMode.SCROLL -> {
                ScrollContent(
                    content = state.content,
                    settings = state.settings,
                    highlights = state.highlights,
                    onScrollPosition = { /* Track position */ }
                )
            }
            ReadingMode.TWO_PAGE -> {
                TwoPageContent(
                    pagerState = pagerState,
                    pages = state.pages,
                    settings = state.settings
                )
            }
        }
        
        // Animated controls overlay
        AnimatedVisibility(
            visible = showControls,
            enter = fadeIn(),
            exit = fadeOut()
        ) {
            ReaderControlsOverlay(
                state = state,
                onClose = onClose,
                onShowSettings = { showSettings = true },
                onShowTOC = { showTableOfContents = true },
                onShowSearch = { showSearch = true },
                onShowBookmarks = { showBookmarks = true },
                onBookmarkToggle = onBookmarkToggle,
                onTTSToggle = onTTSToggle,
                onPageSelect = { page ->
                    coroutineScope.launch {
                        pagerState.animateScrollToPage(page)
                    }
                }
            )
        }
        
        // TTS indicator
        if (state.isTTSPlaying) {
            TTSIndicator(
                modifier = Modifier
                    .align(Alignment.TopEnd)
                    .padding(MediaSpacing.MD)
            )
        }
    }
    
    // Settings bottom sheet
    if (showSettings) {
        ReaderSettingsSheet(
            settings = state.settings,
            onSettingsChange = onSettingsChange,
            onDismiss = { showSettings = false }
        )
    }
    
    // Table of contents sheet
    if (showTableOfContents) {
        TableOfContentsSheet(
            chapters = state.chapters,
            currentChapter = state.currentChapter,
            onChapterSelect = { chapter ->
                onChapterSelect(chapter)
                showTableOfContents = false
            },
            onDismiss = { showTableOfContents = false }
        )
    }
    
    // Search sheet
    if (showSearch) {
        SearchInBookSheet(
            searchResults = state.searchResults,
            onSearch = { /* Search in book */ },
            onResultClick = { result ->
                coroutineScope.launch {
                    pagerState.animateScrollToPage(result.pageNumber)
                }
                showSearch = false
            },
            onDismiss = { showSearch = false }
        )
    }
    
    // Bookmarks sheet
    if (showBookmarks) {
        BookmarksSheet(
            bookmarks = state.bookmarks,
            highlights = state.highlights,
            annotations = state.annotations,
            onBookmarkClick = { bookmark ->
                coroutineScope.launch {
                    pagerState.animateScrollToPage(bookmark.pageNumber)
                }
                showBookmarks = false
            },
            onDismiss = { showBookmarks = false }
        )
    }
}

// =============================================================================
// CONTENT MODES
// =============================================================================





// =============================================================================
// CONTROLS OVERLAY
// =============================================================================


@Composable
private fun ReaderActionButton(
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    label: String,
    onClick: () -> Unit
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        modifier = Modifier.clickable(onClick = onClick)
    ) {
        Icon(
            icon,
            label,
            tint = MediaColors.TextSecondary,
            modifier = Modifier.size(24.dp)
        )
        Spacer(modifier = Modifier.height(4.dp))
        Text(
            text = label,
            style = MediaTypography.LabelSmall,
            color = MediaColors.TextTertiary
        )
    }
}

@Composable
private fun TTSIndicator(modifier: Modifier = Modifier) {
    Surface(
        shape = RoundedCornerShape(MediaCorners.MD),
        color = MediaColors.AccentPrimary,
        modifier = modifier
    ) {
        Row(
            modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.XS),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                Icons.Default.VolumeUp,
                null,
                tint = Color.Black,
                modifier = Modifier.size(16.dp)
            )
            Spacer(Modifier.width(4.dp))
            Text(
                "TTS",
                style = MediaTypography.LabelSmall,
                color = Color.Black
            )
        }
    }
}

// =============================================================================
// SETTINGS SHEET
// =============================================================================


@Composable
private fun SettingSection(
    title: String,
    content: @Composable () -> Unit
) {
    Column(modifier = Modifier.padding(vertical = MediaSpacing.SM)) {
        Text(
            title,
            style = MediaTypography.LabelMedium,
            color = MediaColors.TextSecondary,
            modifier = Modifier.padding(bottom = MediaSpacing.SM)
        )
        content()
    }
}

@Composable
private fun SettingToggle(
    title: String,
    checked: Boolean,
    onCheckedChange: (Boolean) -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable { onCheckedChange(!checked) }
            .padding(vertical = MediaSpacing.SM),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(title, color = MediaColors.TextPrimary)
        Switch(
            checked = checked,
            onCheckedChange = onCheckedChange,
            colors = SwitchDefaults.colors(
                checkedThumbColor = MediaColors.AccentPrimary,
                checkedTrackColor = MediaColors.AccentPrimary.copy(alpha = 0.5f)
            )
        )
    }
}

@Composable
private fun ThemePresetChip(
    preset: ReaderThemePreset,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    val theme = preset.toTheme()
    
    Surface(
        modifier = Modifier
            .size(48.dp)
            .clip(CircleShape)
            .clickable(onClick = onClick)
            .then(
                if (isSelected) Modifier.border(2.dp, MediaColors.AccentPrimary, CircleShape)
                else Modifier
            ),
        color = theme.backgroundColor
    ) {
        Box(contentAlignment = Alignment.Center) {
            Text(
                "Aa",
                style = MediaTypography.BodyMedium,
                color = theme.textColor
            )
        }
    }
}

// =============================================================================
// TABLE OF CONTENTS
// =============================================================================



// =============================================================================
// SEARCH
// =============================================================================


@Composable
private fun SearchResultItem(
    result: ReaderSearchResult,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(MediaSpacing.MD),
        verticalAlignment = Alignment.Top
    ) {
        Text(
            "p.${result.pageNumber + 1}",
            style = MediaTypography.LabelSmall,
            color = MediaColors.AccentPrimary,
            modifier = Modifier.width(40.dp)
        )
        
        Text(
            result.excerpt,
            style = MediaTypography.BodySmall,
            color = MediaColors.TextSecondary,
            maxLines = 2
        )
    }
}

// =============================================================================
// BOOKMARKS
// =============================================================================





// =============================================================================
// HELPER FUNCTIONS
// =============================================================================

private fun getFontFamily(font: ReaderFontFamily): FontFamily {
    return when (font) {
        ReaderFontFamily.SYSTEM -> FontFamily.Default
        ReaderFontFamily.SERIF -> FontFamily.Serif
        ReaderFontFamily.SANS_SERIF -> FontFamily.SansSerif
        ReaderFontFamily.MONOSPACE -> FontFamily.Monospace
        else -> FontFamily.Default
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class BookReaderState(
    val bookId: String,
    val bookTitle: String,
    val content: String = "",
    val pages: List<BookPage> = emptyList(),
    val chapters: List<BookChapter> = emptyList(),
    val currentPage: Int = 0,
    val totalPages: Int = 0,
    val currentChapter: BookChapter? = null,
    val bookmarks: List<BookmarkInfo> = emptyList(),
    val highlights: List<HighlightInfo> = emptyList(),
    val annotations: List<AnnotationInfo> = emptyList(),
    val searchResults: List<ReaderSearchResult> = emptyList(),
    val settings: ReaderSettings = ReaderSettings(),
    val isCurrentPageBookmarked: Boolean = false,
    val isTTSPlaying: Boolean = false
)

data class BookPage(
    val pageNumber: Int,
    val content: String,
    val chapterId: String? = null
)

data class BookChapter(
    val id: String,
    val title: String,
    val startPage: Int,
    val level: Int = 0
)

data class BookmarkInfo(
    val id: String,
    val pageNumber: Int,
    val dateAdded: String
)

data class HighlightInfo(
    val id: String,
    val pageNumber: Int,
    val text: String,
    val color: Color,
    val startOffset: Int,
    val endOffset: Int
)

data class AnnotationInfo(
    val id: String,
    val pageNumber: Int,
    val note: String,
    val dateAdded: String,
    val highlightId: String? = null
)

data class ReaderSearchResult(
    val pageNumber: Int,
    val excerpt: String,
    val startOffset: Int
)


enum class ReaderTextAlign {
    LEFT, CENTER, RIGHT, JUSTIFIED
}

enum class ReadingMode(val displayName: String) {
    PAGINATED("Pages"),
    SCROLL("Scroll"),
    TWO_PAGE("Two Page")
}

enum class PageAnimation(val displayName: String) {
    NONE("None"),
    SLIDE("Slide"),
    CURL("Curl"),
    FADE("Fade")
}

