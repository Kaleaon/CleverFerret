package com.universalmedialibrary.ui.plex.screens

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
import com.universalmedialibrary.ui.plex.components.*
import com.universalmedialibrary.ui.plex.theme.*
import kotlinx.coroutines.launch

/**
 * Plex-Style Comprehensive Book Reader
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
fun PlexBookReader(
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
                    .padding(PlexSpacing.MD)
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

@OptIn(ExperimentalFoundationApi::class)
@Composable
private fun PaginatedContent(
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

@Composable
private fun ScrollContent(
    content: String,
    settings: ReaderSettings,
    highlights: List<HighlightInfo>,
    onScrollPosition: (Float) -> Unit
) {
    val scrollState = rememberScrollState()
    
    LaunchedEffect(scrollState.value) {
        if (scrollState.maxValue > 0) {
            onScrollPosition(scrollState.value.toFloat() / scrollState.maxValue)
        }
    }
    
    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(scrollState)
            .padding(
                horizontal = settings.marginHorizontal.dp,
                vertical = settings.marginVertical.dp
            )
    ) {
        Text(
            text = content,
            style = TextStyle(
                fontFamily = getFontFamily(settings.fontFamily),
                fontSize = settings.fontSize.sp,
                lineHeight = (settings.fontSize * settings.lineHeight).sp,
                color = settings.theme.textColor,
                textAlign = when (settings.textAlign) {
                    ReaderTextAlign.LEFT -> TextAlign.Start
                    ReaderTextAlign.CENTER -> TextAlign.Center
                    ReaderTextAlign.RIGHT -> TextAlign.End
                    ReaderTextAlign.JUSTIFIED -> TextAlign.Justify
                }
            )
        )
    }
}

@OptIn(ExperimentalFoundationApi::class)
@Composable
private fun TwoPageContent(
    pagerState: PagerState,
    pages: List<BookPage>,
    settings: ReaderSettings
) {
    val configuration = LocalConfiguration.current
    val isLandscape = configuration.screenWidthDp > configuration.screenHeightDp
    
    if (isLandscape) {
        HorizontalPager(
            state = pagerState,
            modifier = Modifier.fillMaxSize()
        ) { spreadIndex ->
            Row(modifier = Modifier.fillMaxSize()) {
                // Left page
                val leftPageIndex = spreadIndex * 2
                Box(
                    modifier = Modifier
                        .weight(1f)
                        .fillMaxHeight()
                        .padding(start = settings.marginHorizontal.dp, end = 8.dp)
                ) {
                    pages.getOrNull(leftPageIndex)?.let { page ->
                        BookPageContent(
                            page = page,
                            settings = settings,
                            highlights = emptyList()
                        )
                    }
                }
                
                // Divider
                VerticalDivider(
                    color = settings.theme.textColor.copy(alpha = 0.1f),
                    modifier = Modifier.fillMaxHeight()
                )
                
                // Right page
                val rightPageIndex = leftPageIndex + 1
                Box(
                    modifier = Modifier
                        .weight(1f)
                        .fillMaxHeight()
                        .padding(start = 8.dp, end = settings.marginHorizontal.dp)
                ) {
                    pages.getOrNull(rightPageIndex)?.let { page ->
                        BookPageContent(
                            page = page,
                            settings = settings,
                            highlights = emptyList()
                        )
                    }
                }
            }
        }
    } else {
        // Fall back to single page in portrait
        PaginatedContent(
            pagerState = pagerState,
            pages = pages,
            settings = settings,
            highlights = emptyList(),
            pageAnimation = settings.pageAnimation
        )
    }
}

@Composable
private fun BookPageContent(
    page: BookPage,
    settings: ReaderSettings,
    highlights: List<HighlightInfo>
) {
    Column(
        modifier = Modifier.fillMaxSize()
    ) {
        // Main text content
        Text(
            text = page.content,
            style = TextStyle(
                fontFamily = getFontFamily(settings.fontFamily),
                fontSize = settings.fontSize.sp,
                lineHeight = (settings.fontSize * settings.lineHeight).sp,
                color = settings.theme.textColor,
                textAlign = when (settings.textAlign) {
                    ReaderTextAlign.LEFT -> TextAlign.Start
                    ReaderTextAlign.CENTER -> TextAlign.Center
                    ReaderTextAlign.RIGHT -> TextAlign.End
                    ReaderTextAlign.JUSTIFIED -> TextAlign.Justify
                }
            ),
            modifier = Modifier.weight(1f)
        )
        
        // Page number
        if (settings.showPageNumber) {
            Text(
                text = "${page.pageNumber + 1}",
                style = TextStyle(
                    fontSize = 12.sp,
                    color = settings.theme.textColor.copy(alpha = 0.5f),
                    textAlign = TextAlign.Center
                ),
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(top = PlexSpacing.SM)
            )
        }
    }
}

// =============================================================================
// CONTROLS OVERLAY
// =============================================================================

@Composable
private fun ReaderControlsOverlay(
    state: BookReaderState,
    onClose: () -> Unit,
    onShowSettings: () -> Unit,
    onShowTOC: () -> Unit,
    onShowSearch: () -> Unit,
    onShowBookmarks: () -> Unit,
    onBookmarkToggle: () -> Unit,
    onTTSToggle: () -> Unit,
    onPageSelect: (Int) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.Black.copy(alpha = 0.4f))
    ) {
        // Top bar
        Surface(
            color = PlexColors.BackgroundElevated.copy(alpha = 0.95f),
            modifier = Modifier.fillMaxWidth()
        ) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .statusBarsPadding()
                    .padding(horizontal = PlexSpacing.MD, vertical = PlexSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                IconButton(onClick = onClose) {
                    Icon(Icons.Default.Close, "Close", tint = PlexColors.TextPrimary)
                }
                
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = state.bookTitle,
                        style = PlexTypography.TitleSmall,
                        color = PlexColors.TextPrimary,
                        maxLines = 1
                    )
                    state.currentChapter?.title?.let { chapter ->
                        Text(
                            text = chapter,
                            style = PlexTypography.LabelSmall,
                            color = PlexColors.TextSecondary,
                            maxLines = 1
                        )
                    }
                }
                
                IconButton(onClick = onBookmarkToggle) {
                    Icon(
                        if (state.isCurrentPageBookmarked) Icons.Default.Bookmark else Icons.Outlined.BookmarkBorder,
                        "Bookmark",
                        tint = if (state.isCurrentPageBookmarked) PlexColors.AccentPrimary else PlexColors.TextSecondary
                    )
                }
                
                IconButton(onClick = onTTSToggle) {
                    Icon(
                        if (state.isTTSPlaying) Icons.Default.VolumeUp else Icons.Outlined.VolumeUp,
                        "Text to Speech",
                        tint = if (state.isTTSPlaying) PlexColors.AccentPrimary else PlexColors.TextSecondary
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.weight(1f))
        
        // Bottom bar
        Surface(
            color = PlexColors.BackgroundElevated.copy(alpha = 0.95f),
            modifier = Modifier.fillMaxWidth()
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .navigationBarsPadding()
                    .padding(PlexSpacing.MD)
            ) {
                // Progress slider
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text(
                        text = "${state.currentPage + 1}",
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextSecondary
                    )
                    
                    Slider(
                        value = state.currentPage.toFloat(),
                        onValueChange = { onPageSelect(it.toInt()) },
                        valueRange = 0f..(state.totalPages - 1).toFloat(),
                        modifier = Modifier
                            .weight(1f)
                            .padding(horizontal = PlexSpacing.SM),
                        colors = SliderDefaults.colors(
                            thumbColor = PlexColors.AccentPrimary,
                            activeTrackColor = PlexColors.AccentPrimary
                        )
                    )
                    
                    Text(
                        text = "${state.totalPages}",
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextSecondary
                    )
                }
                
                // Progress percentage
                Text(
                    text = "${((state.currentPage + 1).toFloat() / state.totalPages * 100).toInt()}% complete",
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.TextTertiary,
                    modifier = Modifier.fillMaxWidth(),
                    textAlign = TextAlign.Center
                )
                
                Spacer(modifier = Modifier.height(PlexSpacing.MD))
                
                // Action buttons
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceEvenly
                ) {
                    ReaderActionButton(
                        icon = Icons.Default.List,
                        label = "Contents",
                        onClick = onShowTOC
                    )
                    ReaderActionButton(
                        icon = Icons.Default.Search,
                        label = "Search",
                        onClick = onShowSearch
                    )
                    ReaderActionButton(
                        icon = Icons.Default.Bookmarks,
                        label = "Bookmarks",
                        onClick = onShowBookmarks
                    )
                    ReaderActionButton(
                        icon = Icons.Default.Settings,
                        label = "Settings",
                        onClick = onShowSettings
                    )
                }
            }
        }
    }
}

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
            tint = PlexColors.TextSecondary,
            modifier = Modifier.size(24.dp)
        )
        Spacer(modifier = Modifier.height(4.dp))
        Text(
            text = label,
            style = PlexTypography.LabelSmall,
            color = PlexColors.TextTertiary
        )
    }
}

@Composable
private fun TTSIndicator(modifier: Modifier = Modifier) {
    Surface(
        shape = RoundedCornerShape(PlexCorners.MD),
        color = PlexColors.AccentPrimary,
        modifier = modifier
    ) {
        Row(
            modifier = Modifier.padding(horizontal = PlexSpacing.SM, vertical = PlexSpacing.XS),
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
                style = PlexTypography.LabelSmall,
                color = Color.Black
            )
        }
    }
}

// =============================================================================
// SETTINGS SHEET
// =============================================================================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun ReaderSettingsSheet(
    settings: ReaderSettings,
    onSettingsChange: (ReaderSettings) -> Unit,
    onDismiss: () -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        containerColor = PlexColors.BackgroundElevated
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(PlexSpacing.MD)
                .verticalScroll(rememberScrollState())
        ) {
            Text(
                "Reader Settings",
                style = PlexTypography.TitleMedium,
                color = PlexColors.TextPrimary,
                modifier = Modifier.padding(bottom = PlexSpacing.MD)
            )
            
            // Font size
            SettingSection(title = "Font Size") {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    IconButton(onClick = {
                        if (settings.fontSize > 12) {
                            onSettingsChange(settings.copy(fontSize = settings.fontSize - 2))
                        }
                    }) {
                        Icon(Icons.Default.Remove, "Decrease", tint = PlexColors.TextSecondary)
                    }
                    
                    Text(
                        "${settings.fontSize.toInt()}",
                        style = PlexTypography.TitleMedium,
                        color = PlexColors.TextPrimary,
                        modifier = Modifier.weight(1f),
                        textAlign = TextAlign.Center
                    )
                    
                    IconButton(onClick = {
                        if (settings.fontSize < 32) {
                            onSettingsChange(settings.copy(fontSize = settings.fontSize + 2))
                        }
                    }) {
                        Icon(Icons.Default.Add, "Increase", tint = PlexColors.TextSecondary)
                    }
                }
            }
            
            // Font family
            SettingSection(title = "Font") {
                LazyRow(
                    horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
                ) {
                    items(ReaderFontFamily.entries.toList()) { font ->
                        FilterChip(
                            selected = settings.fontFamily == font,
                            onClick = { onSettingsChange(settings.copy(fontFamily = font)) },
                            label = { Text(font.displayName) }
                        )
                    }
                }
            }
            
            // Line height
            SettingSection(title = "Line Height") {
                Slider(
                    value = settings.lineHeight,
                    onValueChange = { onSettingsChange(settings.copy(lineHeight = it)) },
                    valueRange = 1.2f..2.5f,
                    colors = SliderDefaults.colors(
                        thumbColor = PlexColors.AccentPrimary,
                        activeTrackColor = PlexColors.AccentPrimary
                    )
                )
            }
            
            // Theme presets
            SettingSection(title = "Theme") {
                LazyRow(
                    horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
                ) {
                    items(ReaderThemePreset.entries.toList()) { preset ->
                        ThemePresetChip(
                            preset = preset,
                            isSelected = settings.themePreset == preset,
                            onClick = { 
                                onSettingsChange(settings.copy(
                                    themePreset = preset,
                                    theme = preset.toTheme()
                                ))
                            }
                        )
                    }
                }
            }
            
            // Reading mode
            SettingSection(title = "Reading Mode") {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
                ) {
                    ReadingMode.entries.forEach { mode ->
                        FilterChip(
                            selected = settings.readingMode == mode,
                            onClick = { onSettingsChange(settings.copy(readingMode = mode)) },
                            label = { Text(mode.displayName) },
                            modifier = Modifier.weight(1f)
                        )
                    }
                }
            }
            
            // Page animation
            SettingSection(title = "Page Animation") {
                LazyRow(
                    horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
                ) {
                    items(PageAnimation.entries.toList()) { animation ->
                        FilterChip(
                            selected = settings.pageAnimation == animation,
                            onClick = { onSettingsChange(settings.copy(pageAnimation = animation)) },
                            label = { Text(animation.displayName) }
                        )
                    }
                }
            }
            
            // Toggles
            SettingSection(title = "Display") {
                SettingToggle(
                    title = "Show Page Number",
                    checked = settings.showPageNumber,
                    onCheckedChange = { onSettingsChange(settings.copy(showPageNumber = it)) }
                )
                SettingToggle(
                    title = "Keep Screen On",
                    checked = settings.keepScreenOn,
                    onCheckedChange = { onSettingsChange(settings.copy(keepScreenOn = it)) }
                )
                SettingToggle(
                    title = "Volume Page Turn",
                    checked = settings.volumePageTurn,
                    onCheckedChange = { onSettingsChange(settings.copy(volumePageTurn = it)) }
                )
            }
            
            Spacer(Modifier.height(PlexSpacing.XL))
        }
    }
}

@Composable
private fun SettingSection(
    title: String,
    content: @Composable () -> Unit
) {
    Column(modifier = Modifier.padding(vertical = PlexSpacing.SM)) {
        Text(
            title,
            style = PlexTypography.LabelMedium,
            color = PlexColors.TextSecondary,
            modifier = Modifier.padding(bottom = PlexSpacing.SM)
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
            .padding(vertical = PlexSpacing.SM),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(title, color = PlexColors.TextPrimary)
        Switch(
            checked = checked,
            onCheckedChange = onCheckedChange,
            colors = SwitchDefaults.colors(
                checkedThumbColor = PlexColors.AccentPrimary,
                checkedTrackColor = PlexColors.AccentPrimary.copy(alpha = 0.5f)
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
                if (isSelected) Modifier.border(2.dp, PlexColors.AccentPrimary, CircleShape)
                else Modifier
            ),
        color = theme.backgroundColor
    ) {
        Box(contentAlignment = Alignment.Center) {
            Text(
                "Aa",
                style = PlexTypography.BodyMedium,
                color = theme.textColor
            )
        }
    }
}

// =============================================================================
// TABLE OF CONTENTS
// =============================================================================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun TableOfContentsSheet(
    chapters: List<BookChapter>,
    currentChapter: BookChapter?,
    onChapterSelect: (BookChapter) -> Unit,
    onDismiss: () -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        containerColor = PlexColors.BackgroundElevated
    ) {
        Column(modifier = Modifier.fillMaxWidth()) {
            Text(
                "Table of Contents",
                style = PlexTypography.TitleMedium,
                color = PlexColors.TextPrimary,
                modifier = Modifier.padding(PlexSpacing.MD)
            )
            
            LazyColumn {
                items(items = chapters, key = { it.id }) { chapter ->
                    ChapterItem(
                        chapter = chapter,
                        isCurrent = chapter.id == currentChapter?.id,
                        onClick = { onChapterSelect(chapter) }
                    )
                }
            }
        }
    }
}

@Composable
private fun ChapterItem(
    chapter: BookChapter,
    isCurrent: Boolean,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .background(if (isCurrent) PlexColors.AccentPrimary.copy(alpha = 0.1f) else Color.Transparent)
            .padding(
                start = (PlexSpacing.MD.value + chapter.level * 16).dp,
                end = PlexSpacing.MD,
                top = PlexSpacing.SM,
                bottom = PlexSpacing.SM
            ),
        verticalAlignment = Alignment.CenterVertically
    ) {
        if (isCurrent) {
            Icon(
                Icons.Default.PlayArrow,
                null,
                tint = PlexColors.AccentPrimary,
                modifier = Modifier.size(16.dp)
            )
            Spacer(Modifier.width(PlexSpacing.SM))
        }
        
        Text(
            chapter.title,
            style = PlexTypography.BodyMedium,
            color = if (isCurrent) PlexColors.AccentPrimary else PlexColors.TextPrimary,
            fontWeight = if (isCurrent) FontWeight.Medium else FontWeight.Normal
        )
    }
}

// =============================================================================
// SEARCH
// =============================================================================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun SearchInBookSheet(
    searchResults: List<ReaderSearchResult>,
    onSearch: (String) -> Unit,
    onResultClick: (ReaderSearchResult) -> Unit,
    onDismiss: () -> Unit
) {
    var query by remember { mutableStateOf("") }
    
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        containerColor = PlexColors.BackgroundElevated
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(PlexSpacing.MD)
        ) {
            OutlinedTextField(
                value = query,
                onValueChange = {
                    query = it
                    onSearch(it)
                },
                placeholder = { Text("Search in book...", color = PlexColors.TextTertiary) },
                leadingIcon = { Icon(Icons.Default.Search, null, tint = PlexColors.TextSecondary) },
                modifier = Modifier.fillMaxWidth(),
                colors = OutlinedTextFieldDefaults.colors(
                    focusedBorderColor = PlexColors.AccentPrimary,
                    unfocusedBorderColor = PlexColors.Border
                )
            )
            
            Spacer(Modifier.height(PlexSpacing.MD))
            
            if (searchResults.isEmpty() && query.isNotEmpty()) {
                Text(
                    "No results found",
                    style = PlexTypography.BodyMedium,
                    color = PlexColors.TextSecondary,
                    modifier = Modifier.padding(PlexSpacing.MD)
                )
            } else {
                LazyColumn {
                    items(items = searchResults, key = { "${it.pageNumber}-${it.excerpt.hashCode()}" }) { result ->
                        SearchResultItem(
                            result = result,
                            onClick = { onResultClick(result) }
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun SearchResultItem(
    result: ReaderSearchResult,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(PlexSpacing.MD),
        verticalAlignment = Alignment.Top
    ) {
        Text(
            "p.${result.pageNumber + 1}",
            style = PlexTypography.LabelSmall,
            color = PlexColors.AccentPrimary,
            modifier = Modifier.width(40.dp)
        )
        
        Text(
            result.excerpt,
            style = PlexTypography.BodySmall,
            color = PlexColors.TextSecondary,
            maxLines = 2
        )
    }
}

// =============================================================================
// BOOKMARKS
// =============================================================================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun BookmarksSheet(
    bookmarks: List<BookmarkInfo>,
    highlights: List<HighlightInfo>,
    annotations: List<AnnotationInfo>,
    onBookmarkClick: (BookmarkInfo) -> Unit,
    onDismiss: () -> Unit
) {
    var selectedTab by remember { mutableStateOf(0) }
    val tabs = listOf("Bookmarks", "Highlights", "Notes")
    
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        containerColor = PlexColors.BackgroundElevated
    ) {
        Column(modifier = Modifier.fillMaxWidth()) {
            TabRow(
                selectedTabIndex = selectedTab,
                containerColor = Color.Transparent
            ) {
                tabs.forEachIndexed { index, title ->
                    Tab(
                        selected = selectedTab == index,
                        onClick = { selectedTab = index },
                        text = {
                            Text(
                                title,
                                color = if (selectedTab == index) PlexColors.AccentPrimary else PlexColors.TextSecondary
                            )
                        }
                    )
                }
            }
            
            when (selectedTab) {
                0 -> BookmarksList(bookmarks, onBookmarkClick)
                1 -> HighlightsList(highlights)
                2 -> AnnotationsList(annotations)
            }
        }
    }
}

@Composable
private fun BookmarksList(
    bookmarks: List<BookmarkInfo>,
    onBookmarkClick: (BookmarkInfo) -> Unit
) {
    if (bookmarks.isEmpty()) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .padding(PlexSpacing.XL),
            contentAlignment = Alignment.Center
        ) {
            Text("No bookmarks yet", color = PlexColors.TextSecondary)
        }
    } else {
        LazyColumn {
            items(items = bookmarks, key = { it.id }) { bookmark ->
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { onBookmarkClick(bookmark) }
                        .padding(PlexSpacing.MD),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(Icons.Default.Bookmark, null, tint = PlexColors.AccentPrimary)
                    Spacer(Modifier.width(PlexSpacing.MD))
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            "Page ${bookmark.pageNumber + 1}",
                            style = PlexTypography.BodyMedium,
                            color = PlexColors.TextPrimary
                        )
                        Text(
                            bookmark.dateAdded,
                            style = PlexTypography.LabelSmall,
                            color = PlexColors.TextTertiary
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun HighlightsList(highlights: List<HighlightInfo>) {
    if (highlights.isEmpty()) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .padding(PlexSpacing.XL),
            contentAlignment = Alignment.Center
        ) {
            Text("No highlights yet", color = PlexColors.TextSecondary)
        }
    } else {
        LazyColumn {
            items(items = highlights, key = { it.id }) { highlight ->
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(PlexSpacing.MD)
                ) {
                    Surface(
                        color = highlight.color.copy(alpha = 0.3f),
                        shape = RoundedCornerShape(PlexCorners.XS)
                    ) {
                        Text(
                            highlight.text,
                            style = PlexTypography.BodySmall,
                            color = PlexColors.TextPrimary,
                            modifier = Modifier.padding(PlexSpacing.SM)
                        )
                    }
                    Text(
                        "Page ${highlight.pageNumber + 1}",
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextTertiary,
                        modifier = Modifier.padding(top = PlexSpacing.XS)
                    )
                }
            }
        }
    }
}

@Composable
private fun AnnotationsList(annotations: List<AnnotationInfo>) {
    if (annotations.isEmpty()) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .padding(PlexSpacing.XL),
            contentAlignment = Alignment.Center
        ) {
            Text("No notes yet", color = PlexColors.TextSecondary)
        }
    } else {
        LazyColumn {
            items(items = annotations, key = { it.id }) { annotation ->
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(PlexSpacing.MD)
                ) {
                    Text(
                        annotation.note,
                        style = PlexTypography.BodyMedium,
                        color = PlexColors.TextPrimary
                    )
                    Row(
                        modifier = Modifier.padding(top = PlexSpacing.XS),
                        horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD)
                    ) {
                        Text(
                            "Page ${annotation.pageNumber + 1}",
                            style = PlexTypography.LabelSmall,
                            color = PlexColors.TextTertiary
                        )
                        Text(
                            annotation.dateAdded,
                            style = PlexTypography.LabelSmall,
                            color = PlexColors.TextTertiary
                        )
                    }
                }
            }
        }
    }
}

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

data class ReaderSettings(
    val fontSize: Float = 18f,
    val fontFamily: ReaderFontFamily = ReaderFontFamily.SYSTEM,
    val lineHeight: Float = 1.5f,
    val marginHorizontal: Float = 16f,
    val marginVertical: Float = 24f,
    val textAlign: ReaderTextAlign = ReaderTextAlign.JUSTIFIED,
    val themePreset: ReaderThemePreset = ReaderThemePreset.DARK,
    val theme: ReaderTheme = ReaderThemePreset.DARK.toTheme(),
    val readingMode: ReadingMode = ReadingMode.PAGINATED,
    val pageAnimation: PageAnimation = PageAnimation.SLIDE,
    val showPageNumber: Boolean = true,
    val keepScreenOn: Boolean = true,
    val volumePageTurn: Boolean = false,
    val brightness: Float = 1f,
    val warmth: Float = 0f
)

data class ReaderTheme(
    val backgroundColor: Color,
    val textColor: Color,
    val linkColor: Color
)

enum class ReaderFontFamily(val displayName: String) {
    SYSTEM("System"),
    SERIF("Serif"),
    SANS_SERIF("Sans Serif"),
    MONOSPACE("Mono"),
    GEORGIA("Georgia"),
    TIMES("Times"),
    PALATINO("Palatino"),
    BOOKERLY("Bookerly"),
    LITERATA("Literata"),
    OPEN_DYSLEXIC("OpenDyslexic")
}

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

enum class ReaderThemePreset {
    WHITE, SEPIA, DARK, AMOLED, NIGHT;
    
    fun toTheme(): ReaderTheme = when (this) {
        WHITE -> ReaderTheme(
            backgroundColor = Color.White,
            textColor = Color.Black,
            linkColor = Color(0xFF1976D2)
        )
        SEPIA -> ReaderTheme(
            backgroundColor = Color(0xFFF4ECD8),
            textColor = Color(0xFF5B4636),
            linkColor = Color(0xFF8B5A2B)
        )
        DARK -> ReaderTheme(
            backgroundColor = Color(0xFF1F1F1F),
            textColor = Color(0xFFE0E0E0),
            linkColor = Color(0xFF66B2FF)
        )
        AMOLED -> ReaderTheme(
            backgroundColor = Color.Black,
            textColor = Color(0xFFCCCCCC),
            linkColor = Color(0xFF66B2FF)
        )
        NIGHT -> ReaderTheme(
            backgroundColor = Color(0xFF1A0A0A),
            textColor = Color(0xFFFFCCCC),
            linkColor = Color(0xFFFF9999)
        )
    }
}
