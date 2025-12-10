package com.universalmedialibrary.ui.plex.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
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
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.plex.components.*
import com.universalmedialibrary.ui.plex.theme.*

/**
 * Plex-Style Media Detail Screen
 * 
 * A beautiful, comprehensive detail screen for all media types:
 * - Books: Author, series, reading progress, chapters, reviews
 * - Movies/TV: Cast, crew, ratings, trailers, similar content
 * - Music: Artist, album, tracks, lyrics
 * - Podcasts: Episodes, transcripts, subscribe
 * - Comics: Issue info, reading progress, panel view
 * - Web Fiction: Chapters, update status, download
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlexMediaDetailScreen(
    state: MediaDetailState,
    onBackClick: () -> Unit,
    onPlayClick: () -> Unit,
    onDownloadClick: () -> Unit,
    onShareClick: () -> Unit,
    onAddToCollectionClick: () -> Unit,
    onChapterClick: (ChapterItem) -> Unit,
    onRelatedItemClick: (PlexMediaItem) -> Unit,
    modifier: Modifier = Modifier
) {
    val scrollState = rememberLazyListState()
    val isScrolled by remember {
        derivedStateOf { scrollState.firstVisibleItemScrollOffset > 200 }
    }
    
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(PlexColors.Background)
    ) {
        LazyColumn(
            state = scrollState,
            modifier = Modifier.fillMaxSize()
        ) {
            // Hero Section with backdrop
            item {
                DetailHeroSection(
                    item = state.item,
                    onPlayClick = onPlayClick
                )
            }
            
            // Action buttons
            item {
                ActionButtonsRow(
                    item = state.item,
                    onPlayClick = onPlayClick,
                    onDownloadClick = onDownloadClick,
                    onShareClick = onShareClick,
                    onAddToCollectionClick = onAddToCollectionClick
                )
            }
            
            // Metadata section
            item {
                MetadataSection(item = state.item)
            }
            
            // Description
            if (!state.item.description.isNullOrBlank()) {
                item {
                    DescriptionSection(description = state.item.description!!)
                }
            }
            
            // Chapters/Episodes/Tracks
            if (state.chapters.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                    SectionHeader(
                        title = when (state.item.mediaType) {
                            PlexMediaType.BOOK, PlexMediaType.COMIC, PlexMediaType.FANFICTION -> "Chapters"
                            PlexMediaType.TV_SHOW, PlexMediaType.PODCAST -> "Episodes"
                            PlexMediaType.MUSIC -> "Tracks"
                            PlexMediaType.AUDIOBOOK -> "Chapters"
                            else -> "Contents"
                        },
                        count = state.chapters.size
                    )
                }
                
                items(state.chapters.take(10)) { chapter ->
                    ChapterListItem(
                        chapter = chapter,
                        onClick = { onChapterClick(chapter) }
                    )
                }
                
                if (state.chapters.size > 10) {
                    item {
                        TextButton(
                            onClick = { /* Show all chapters */ },
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(horizontal = PlexSpacing.ScreenHorizontal)
                        ) {
                            Text(
                                text = "Show all ${state.chapters.size} items",
                                color = PlexColors.AccentPrimary
                            )
                        }
                    }
                }
            }
            
            // Cast & Crew (for movies/TV)
            if (state.cast.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                    SectionHeader(title = "Cast & Crew")
                }
                
                item {
                    LazyRow(
                        contentPadding = PaddingValues(horizontal = PlexSpacing.ScreenHorizontal),
                        horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD)
                    ) {
                        items(state.cast) { person ->
                            PersonCard(person = person)
                        }
                    }
                }
            }
            
            // Reviews & Ratings
            if (state.reviews.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                    SectionHeader(title = "Reviews")
                }
                
                items(state.reviews.take(3)) { review ->
                    ReviewCard(review = review)
                }
            }
            
            // Related content
            if (state.relatedItems.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                    PlexCarouselRow(
                        title = "You Might Also Like",
                        items = state.relatedItems,
                        onSeeAllClick = null
                    ) { item ->
                        PlexPosterCard(
                            item = item,
                            onClick = { onRelatedItemClick(item) },
                            width = PlexSizes.CardMedium
                        )
                    }
                }
            }
            
            // Series info (for books in a series)
            if (state.seriesItems.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                    PlexCarouselRow(
                        title = "More in Series",
                        items = state.seriesItems,
                        onSeeAllClick = null
                    ) { item ->
                        PlexPosterCard(
                            item = item,
                            onClick = { onRelatedItemClick(item) },
                            width = PlexSizes.CardMedium
                        )
                    }
                }
            }
            
            // Bottom padding
            item {
                Spacer(modifier = Modifier.height(PlexSpacing.Huge + 80.dp))
            }
        }
        
        // Top bar with back button
        AnimatedVisibility(
            visible = true,
            modifier = Modifier.align(Alignment.TopCenter)
        ) {
            DetailTopBar(
                title = if (isScrolled) state.item.title else "",
                isScrolled = isScrolled,
                onBackClick = onBackClick
            )
        }
        
        // Bottom action bar (for quick play)
        if (state.item.progress > 0) {
            Surface(
                modifier = Modifier
                    .align(Alignment.BottomCenter)
                    .fillMaxWidth(),
                color = PlexColors.BackgroundElevated,
                tonalElevation = PlexElevation.LG
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(PlexSpacing.MD),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = "Continue",
                            style = PlexTypography.LabelMedium,
                            color = PlexColors.TextSecondary
                        )
                        LinearProgressIndicator(
                            progress = { state.item.progress },
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(top = PlexSpacing.XS),
                            color = PlexColors.AccentPrimary,
                            trackColor = PlexColors.ProgressBackground
                        )
                    }
                    
                    Spacer(modifier = Modifier.width(PlexSpacing.MD))
                    
                    FilledIconButton(
                        onClick = onPlayClick,
                        colors = IconButtonDefaults.filledIconButtonColors(
                            containerColor = PlexColors.AccentPrimary
                        )
                    ) {
                        Icon(
                            imageVector = Icons.Default.PlayArrow,
                            contentDescription = "Continue"
                        )
                    }
                }
            }
        }
    }
}

// =============================================================================
// HERO SECTION
// =============================================================================

@Composable
private fun DetailHeroSection(
    item: MediaDetailItem,
    onPlayClick: () -> Unit
) {
    val configuration = LocalConfiguration.current
    val heroHeight = (configuration.screenHeightDp * 0.5f).dp
    
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(heroHeight)
    ) {
        // Backdrop image
        if (item.backdropUrl != null) {
            AsyncImage(
                model = item.backdropUrl,
                contentDescription = null,
                modifier = Modifier
                    .fillMaxSize()
                    .blur(2.dp),
                contentScale = ContentScale.Crop
            )
        }
        
        // Gradient overlays
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    Brush.verticalGradient(
                        colors = listOf(
                            Color.Transparent,
                            PlexColors.Background.copy(alpha = 0.7f),
                            PlexColors.Background
                        ),
                        startY = 0f
                    )
                )
        )
        
        // Content
        Row(
            modifier = Modifier
                .align(Alignment.BottomStart)
                .padding(PlexSpacing.ScreenHorizontal)
                .padding(bottom = PlexSpacing.LG),
            verticalAlignment = Alignment.Bottom
        ) {
            // Poster
            Surface(
                modifier = Modifier
                    .width(120.dp)
                    .aspectRatio(PlexSizes.PosterAspectRatio),
                shape = RoundedCornerShape(PlexCorners.Card),
                shadowElevation = PlexElevation.LG
            ) {
                if (item.imageUrl != null) {
                    AsyncImage(
                        model = item.imageUrl,
                        contentDescription = item.title,
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(PlexColors.BackgroundSurface),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = item.mediaType.icon,
                            contentDescription = null,
                            modifier = Modifier.size(48.dp),
                            tint = item.mediaType.color.copy(alpha = 0.5f)
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.width(PlexSpacing.MD))
            
            // Info
            Column(modifier = Modifier.weight(1f)) {
                // Media type badge
                Surface(
                    shape = RoundedCornerShape(PlexCorners.XS),
                    color = item.mediaType.color.copy(alpha = 0.2f)
                ) {
                    Text(
                        text = item.mediaType.name.replace("_", " "),
                        style = PlexTypography.LabelSmall,
                        color = item.mediaType.color,
                        modifier = Modifier.padding(horizontal = PlexSpacing.SM, vertical = 2.dp)
                    )
                }
                
                Spacer(modifier = Modifier.height(PlexSpacing.SM))
                
                // Title
                Text(
                    text = item.title,
                    style = PlexTypography.TitleLarge,
                    color = PlexColors.TextPrimary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                
                // Creator (author/artist/director)
                if (item.creator != null) {
                    Text(
                        text = "by ${item.creator}",
                        style = PlexTypography.BodyMedium,
                        color = PlexColors.TextSecondary
                    )
                }
                
                Spacer(modifier = Modifier.height(PlexSpacing.SM))
                
                // Metadata row
                Row(
                    horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Rating
                    item.rating?.let { rating ->
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Icon(
                                imageVector = Icons.Default.Star,
                                contentDescription = null,
                                modifier = Modifier.size(16.dp),
                                tint = PlexColors.Warning
                            )
                            Spacer(modifier = Modifier.width(2.dp))
                            Text(
                                text = "%.1f".format(rating),
                                style = PlexTypography.LabelMedium,
                                color = PlexColors.TextPrimary
                            )
                        }
                    }
                    
                    // Year
                    item.year?.let { year ->
                        Text(
                            text = year.toString(),
                            style = PlexTypography.LabelMedium,
                            color = PlexColors.TextSecondary
                        )
                    }
                    
                    // Duration/Pages
                    item.duration?.let { duration ->
                        Text(
                            text = duration,
                            style = PlexTypography.LabelMedium,
                            color = PlexColors.TextSecondary
                        )
                    }
                }
            }
        }
    }
}

// =============================================================================
// ACTION BUTTONS
// =============================================================================

@Composable
private fun ActionButtonsRow(
    item: MediaDetailItem,
    onPlayClick: () -> Unit,
    onDownloadClick: () -> Unit,
    onShareClick: () -> Unit,
    onAddToCollectionClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = PlexSpacing.ScreenHorizontal),
        horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
    ) {
        // Play/Read button
        Button(
            onClick = onPlayClick,
            modifier = Modifier.weight(1f),
            colors = ButtonDefaults.buttonColors(
                containerColor = PlexColors.AccentPrimary
            ),
            shape = RoundedCornerShape(PlexCorners.Button)
        ) {
            Icon(
                imageVector = if (item.progress > 0) Icons.Default.PlayArrow else Icons.Default.PlayArrow,
                contentDescription = null,
                modifier = Modifier.size(20.dp)
            )
            Spacer(modifier = Modifier.width(PlexSpacing.SM))
            Text(
                text = when {
                    item.progress > 0 -> "Continue"
                    item.mediaType in listOf(PlexMediaType.BOOK, PlexMediaType.COMIC, PlexMediaType.FANFICTION) -> "Read"
                    item.mediaType in listOf(PlexMediaType.MUSIC, PlexMediaType.PODCAST, PlexMediaType.RADIO) -> "Play"
                    else -> "Play"
                },
                style = PlexTypography.LabelLarge
            )
        }
        
        // Download button
        FilledTonalIconButton(
            onClick = onDownloadClick,
            colors = IconButtonDefaults.filledTonalIconButtonColors(
                containerColor = PlexColors.BackgroundElevated
            )
        ) {
            Icon(
                imageVector = Icons.Outlined.Download,
                contentDescription = "Download",
                tint = PlexColors.TextPrimary
            )
        }
        
        // Add to collection
        FilledTonalIconButton(
            onClick = onAddToCollectionClick,
            colors = IconButtonDefaults.filledTonalIconButtonColors(
                containerColor = PlexColors.BackgroundElevated
            )
        ) {
            Icon(
                imageVector = Icons.Outlined.BookmarkAdd,
                contentDescription = "Add to collection",
                tint = PlexColors.TextPrimary
            )
        }
        
        // Share
        FilledTonalIconButton(
            onClick = onShareClick,
            colors = IconButtonDefaults.filledTonalIconButtonColors(
                containerColor = PlexColors.BackgroundElevated
            )
        ) {
            Icon(
                imageVector = Icons.Outlined.Share,
                contentDescription = "Share",
                tint = PlexColors.TextPrimary
            )
        }
    }
}

// =============================================================================
// METADATA SECTION
// =============================================================================

@Composable
private fun MetadataSection(item: MediaDetailItem) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = PlexSpacing.ScreenHorizontal)
            .padding(top = PlexSpacing.LG)
    ) {
        // Genre tags
        if (item.genres.isNotEmpty()) {
            LazyRow(
                horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
            ) {
                items(item.genres) { genre ->
                    Surface(
                        shape = RoundedCornerShape(PlexCorners.Full),
                        color = PlexColors.BackgroundElevated
                    ) {
                        Text(
                            text = genre,
                            style = PlexTypography.LabelMedium,
                            color = PlexColors.TextSecondary,
                            modifier = Modifier.padding(horizontal = PlexSpacing.MD, vertical = PlexSpacing.SM)
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.MD))
        }
        
        // Additional metadata grid
        val metadataItems = buildList {
            item.publisher?.let { add("Publisher" to it) }
            item.language?.let { add("Language" to it) }
            item.pageCount?.let { add("Pages" to it.toString()) }
            item.seriesName?.let { add("Series" to "$it #${item.seriesPosition ?: ""}") }
            item.isbn?.let { add("ISBN" to it) }
            item.releaseDate?.let { add("Released" to it) }
        }
        
        if (metadataItems.isNotEmpty()) {
            Surface(
                shape = RoundedCornerShape(PlexCorners.Card),
                color = PlexColors.BackgroundElevated
            ) {
                Column(modifier = Modifier.padding(PlexSpacing.MD)) {
                    metadataItems.forEachIndexed { index, (label, value) ->
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text(
                                text = label,
                                style = PlexTypography.BodyMedium,
                                color = PlexColors.TextSecondary
                            )
                            Text(
                                text = value,
                                style = PlexTypography.BodyMedium,
                                color = PlexColors.TextPrimary
                            )
                        }
                        
                        if (index < metadataItems.size - 1) {
                            HorizontalDivider(
                                color = PlexColors.Divider,
                                modifier = Modifier.padding(vertical = PlexSpacing.SM)
                            )
                        }
                    }
                }
            }
        }
    }
}

// =============================================================================
// DESCRIPTION SECTION
// =============================================================================

@Composable
private fun DescriptionSection(description: String) {
    var isExpanded by remember { mutableStateOf(false) }
    
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = PlexSpacing.ScreenHorizontal)
            .padding(top = PlexSpacing.LG)
    ) {
        Text(
            text = description,
            style = PlexTypography.BodyMedium,
            color = PlexColors.TextSecondary,
            maxLines = if (isExpanded) Int.MAX_VALUE else 4,
            overflow = TextOverflow.Ellipsis
        )
        
        if (description.length > 200) {
            TextButton(
                onClick = { isExpanded = !isExpanded },
                modifier = Modifier.align(Alignment.End)
            ) {
                Text(
                    text = if (isExpanded) "Show less" else "Show more",
                    color = PlexColors.AccentPrimary
                )
            }
        }
    }
}

// =============================================================================
// HELPER COMPONENTS
// =============================================================================

@Composable
private fun DetailTopBar(
    title: String,
    isScrolled: Boolean,
    onBackClick: () -> Unit
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = if (isScrolled) PlexColors.Background.copy(alpha = 0.95f) else Color.Transparent
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .statusBarsPadding()
                .padding(horizontal = PlexSpacing.SM, vertical = PlexSpacing.SM),
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(onClick = onBackClick) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = PlexColors.TextPrimary
                )
            }
            
            AnimatedVisibility(
                visible = isScrolled,
                enter = fadeIn() + slideInHorizontally(),
                exit = fadeOut() + slideOutHorizontally()
            ) {
                Text(
                    text = title,
                    style = PlexTypography.TitleMedium,
                    color = PlexColors.TextPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
        }
    }
}

@Composable
private fun SectionHeader(
    title: String,
    count: Int? = null
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = PlexSpacing.ScreenHorizontal),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(
            text = title,
            style = PlexTypography.TitleMedium,
            color = PlexColors.TextPrimary
        )
        
        count?.let {
            Text(
                text = "$it items",
                style = PlexTypography.LabelMedium,
                color = PlexColors.TextTertiary
            )
        }
    }
}

@Composable
private fun ChapterListItem(
    chapter: ChapterItem,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = PlexSpacing.ScreenHorizontal, vertical = PlexSpacing.MD),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Chapter number or thumbnail
        Surface(
            modifier = Modifier.size(48.dp),
            shape = RoundedCornerShape(PlexCorners.SM),
            color = PlexColors.BackgroundElevated
        ) {
            Box(contentAlignment = Alignment.Center) {
                Text(
                    text = chapter.number.toString(),
                    style = PlexTypography.TitleSmall,
                    color = PlexColors.TextSecondary
                )
            }
        }
        
        Spacer(modifier = Modifier.width(PlexSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = chapter.title,
                style = PlexTypography.BodyLarge,
                color = PlexColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD)
            ) {
                chapter.duration?.let {
                    Text(
                        text = it,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextTertiary
                    )
                }
                
                chapter.date?.let {
                    Text(
                        text = it,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextTertiary
                    )
                }
            }
        }
        
        // Progress or play indicator
        if (chapter.progress > 0 && chapter.progress < 1) {
            CircularProgressIndicator(
                progress = { chapter.progress },
                modifier = Modifier.size(32.dp),
                color = PlexColors.AccentPrimary,
                trackColor = PlexColors.ProgressBackground,
                strokeWidth = 3.dp
            )
        } else if (chapter.progress >= 1) {
            Icon(
                imageVector = Icons.Default.CheckCircle,
                contentDescription = "Completed",
                tint = PlexColors.Success,
                modifier = Modifier.size(32.dp)
            )
        } else {
            Icon(
                imageVector = Icons.Default.PlayCircleOutline,
                contentDescription = "Play",
                tint = PlexColors.TextTertiary,
                modifier = Modifier.size(32.dp)
            )
        }
    }
}

@Composable
private fun PersonCard(person: PersonItem) {
    Column(
        modifier = Modifier.width(80.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Surface(
            modifier = Modifier.size(72.dp),
            shape = CircleShape,
            color = PlexColors.BackgroundSurface
        ) {
            if (person.imageUrl != null) {
                AsyncImage(
                    model = person.imageUrl,
                    contentDescription = person.name,
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
                )
            } else {
                Icon(
                    imageVector = Icons.Default.Person,
                    contentDescription = null,
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(PlexSpacing.MD),
                    tint = PlexColors.TextTertiary
                )
            }
        }
        
        Spacer(modifier = Modifier.height(PlexSpacing.SM))
        
        Text(
            text = person.name,
            style = PlexTypography.LabelMedium,
            color = PlexColors.TextPrimary,
            maxLines = 2,
            overflow = TextOverflow.Ellipsis
        )
        
        person.role?.let {
            Text(
                text = it,
                style = PlexTypography.LabelSmall,
                color = PlexColors.TextTertiary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}

@Composable
private fun ReviewCard(review: ReviewItem) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = PlexSpacing.ScreenHorizontal, vertical = PlexSpacing.SM),
        shape = RoundedCornerShape(PlexCorners.Card),
        color = PlexColors.BackgroundElevated
    ) {
        Column(modifier = Modifier.padding(PlexSpacing.MD)) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Reviewer avatar
                Surface(
                    modifier = Modifier.size(40.dp),
                    shape = CircleShape,
                    color = PlexColors.BackgroundSurface
                ) {
                    Icon(
                        imageVector = Icons.Default.Person,
                        contentDescription = null,
                        modifier = Modifier.padding(PlexSpacing.SM),
                        tint = PlexColors.TextTertiary
                    )
                }
                
                Spacer(modifier = Modifier.width(PlexSpacing.SM))
                
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = review.author,
                        style = PlexTypography.LabelLarge,
                        color = PlexColors.TextPrimary
                    )
                    Text(
                        text = review.source,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextTertiary
                    )
                }
                
                // Rating
                review.rating?.let { rating ->
                    Surface(
                        shape = RoundedCornerShape(PlexCorners.XS),
                        color = PlexColors.Warning.copy(alpha = 0.15f)
                    ) {
                        Row(
                            modifier = Modifier.padding(horizontal = PlexSpacing.SM, vertical = PlexSpacing.XS),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Default.Star,
                                contentDescription = null,
                                modifier = Modifier.size(14.dp),
                                tint = PlexColors.Warning
                            )
                            Spacer(modifier = Modifier.width(2.dp))
                            Text(
                                text = rating,
                                style = PlexTypography.LabelMedium,
                                color = PlexColors.Warning
                            )
                        }
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.MD))
            
            Text(
                text = review.content,
                style = PlexTypography.BodyMedium,
                color = PlexColors.TextSecondary,
                maxLines = 4,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class MediaDetailState(
    val item: MediaDetailItem,
    val chapters: List<ChapterItem> = emptyList(),
    val cast: List<PersonItem> = emptyList(),
    val reviews: List<ReviewItem> = emptyList(),
    val relatedItems: List<PlexMediaItem> = emptyList(),
    val seriesItems: List<PlexMediaItem> = emptyList(),
    val isLoading: Boolean = false
)

data class MediaDetailItem(
    val id: String,
    val title: String,
    val description: String? = null,
    val imageUrl: String? = null,
    val backdropUrl: String? = null,
    val mediaType: PlexMediaType,
    val creator: String? = null,
    val rating: Float? = null,
    val year: Int? = null,
    val duration: String? = null,
    val progress: Float = 0f,
    val genres: List<String> = emptyList(),
    val publisher: String? = null,
    val language: String? = null,
    val pageCount: Int? = null,
    val seriesName: String? = null,
    val seriesPosition: Int? = null,
    val isbn: String? = null,
    val releaseDate: String? = null
)

data class ChapterItem(
    val id: String,
    val number: Int,
    val title: String,
    val duration: String? = null,
    val date: String? = null,
    val progress: Float = 0f
)

data class PersonItem(
    val id: String,
    val name: String,
    val role: String? = null,
    val imageUrl: String? = null
)

data class ReviewItem(
    val id: String,
    val author: String,
    val source: String,
    val rating: String? = null,
    val content: String
)
