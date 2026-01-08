package com.universalmedialibrary.ui.media.screens

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
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric Media Detail Screen
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
fun MediaDetailScreen(
    state: MediaDetailState,
    onBackClick: () -> Unit,
    onPlayClick: () -> Unit,
    onDownloadClick: () -> Unit,
    onShareClick: () -> Unit,
    onAddToCollectionClick: () -> Unit,
    onChapterClick: (ChapterItem) -> Unit,
    onRelatedItemClick: (MediaItem) -> Unit,
    modifier: Modifier = Modifier
) {
    val scrollState = rememberLazyListState()
    val isScrolled by remember {
        derivedStateOf { scrollState.firstVisibleItemScrollOffset > 200 }
    }
    
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(MediaColors.Background)
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
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    SectionHeader(
                        title = when (state.item.mediaType) {
                            MediaType.BOOK, MediaType.COMIC, MediaType.FANFICTION -> "Chapters"
                            MediaType.TV_SHOW, MediaType.PODCAST -> "Episodes"
                            MediaType.MUSIC -> "Tracks"
                            MediaType.AUDIOBOOK -> "Chapters"
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
                                .padding(horizontal = MediaSpacing.ScreenHorizontal)
                        ) {
                            Text(
                                text = "Show all ${state.chapters.size} items",
                                color = MediaColors.AccentPrimary
                            )
                        }
                    }
                }
            }
            
            // Cast & Crew (for movies/TV)
            if (state.cast.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    SectionHeader(title = "Cast & Crew")
                }
                
                item {
                    LazyRow(
                        contentPadding = PaddingValues(horizontal = MediaSpacing.ScreenHorizontal),
                        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
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
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    SectionHeader(title = "Reviews")
                }
                
                items(state.reviews.take(3)) { review ->
                    ReviewCard(review = review)
                }
            }
            
            // Related content
            if (state.relatedItems.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    MediaCarouselRow(
                        title = "You Might Also Like",
                        items = state.relatedItems,
                        onSeeAllClick = null
                    ) { item ->
                        MediaPosterCard(
                            item = item,
                            onClick = { onRelatedItemClick(item) },
                            width = MediaSizes.CardMedium
                        )
                    }
                }
            }
            
            // Series info (for books in a series)
            if (state.seriesItems.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    MediaCarouselRow(
                        title = "More in Series",
                        items = state.seriesItems,
                        onSeeAllClick = null
                    ) { item ->
                        MediaPosterCard(
                            item = item,
                            onClick = { onRelatedItemClick(item) },
                            width = MediaSizes.CardMedium
                        )
                    }
                }
            }
            
            // Bottom padding
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.Huge + 80.dp))
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
                color = MediaColors.BackgroundElevated,
                tonalElevation = MediaElevation.LG
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(MediaSpacing.MD),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = "Continue",
                            style = MediaTypography.LabelMedium,
                            color = MediaColors.TextSecondary
                        )
                        LinearProgressIndicator(
                            progress = { state.item.progress },
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(top = MediaSpacing.XS),
                            color = MediaColors.AccentPrimary,
                            trackColor = MediaColors.ProgressBackground
                        )
                    }
                    
                    Spacer(modifier = Modifier.width(MediaSpacing.MD))
                    
                    FilledIconButton(
                        onClick = onPlayClick,
                        colors = IconButtonDefaults.filledIconButtonColors(
                            containerColor = MediaColors.AccentPrimary
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
                contentDescription = "${item.title} backdrop",
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
                            MediaColors.Background.copy(alpha = 0.7f),
                            MediaColors.Background
                        ),
                        startY = 0f
                    )
                )
        )
        
        // Content
        Row(
            modifier = Modifier
                .align(Alignment.BottomStart)
                .padding(MediaSpacing.ScreenHorizontal)
                .padding(bottom = MediaSpacing.LG),
            verticalAlignment = Alignment.Bottom
        ) {
            // Poster
            Surface(
                modifier = Modifier
                    .width(120.dp)
                    .aspectRatio(MediaSizes.PosterAspectRatio),
                shape = RoundedCornerShape(MediaCorners.Card),
                shadowElevation = MediaElevation.LG
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
                            .background(MediaColors.BackgroundSurface),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = item.mediaType.icon,
                            contentDescription = "${item.mediaType.name} placeholder",
                            modifier = Modifier.size(48.dp),
                            tint = item.mediaType.color.copy(alpha = 0.5f)
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.width(MediaSpacing.MD))
            
            // Info
            Column(modifier = Modifier.weight(1f)) {
                // Media type badge
                Surface(
                    shape = RoundedCornerShape(MediaCorners.XS),
                    color = item.mediaType.color.copy(alpha = 0.2f)
                ) {
                    Text(
                        text = item.mediaType.name.replace("_", " "),
                        style = MediaTypography.LabelSmall,
                        color = item.mediaType.color,
                        modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = 2.dp)
                    )
                }
                
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                
                // Title
                Text(
                    text = item.title,
                    style = MediaTypography.TitleLarge,
                    color = MediaColors.TextPrimary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                
                // Creator (author/artist/director)
                if (item.creator != null) {
                    Text(
                        text = "by ${item.creator}",
                        style = MediaTypography.BodyMedium,
                        color = MediaColors.TextSecondary
                    )
                }
                
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                
                // Metadata row
                Row(
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Rating
                    item.rating?.let { rating ->
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Icon(
                                imageVector = Icons.Default.Star,
                                contentDescription = "Rating",
                                modifier = Modifier.size(16.dp),
                                tint = MediaColors.Warning
                            )
                            Spacer(modifier = Modifier.width(2.dp))
                            Text(
                                text = "%.1f".format(rating),
                                style = MediaTypography.LabelMedium,
                                color = MediaColors.TextPrimary
                            )
                        }
                    }
                    
                    // Year
                    item.year?.let { year ->
                        Text(
                            text = year.toString(),
                            style = MediaTypography.LabelMedium,
                            color = MediaColors.TextSecondary
                        )
                    }
                    
                    // Duration/Pages
                    item.duration?.let { duration ->
                        Text(
                            text = duration,
                            style = MediaTypography.LabelMedium,
                            color = MediaColors.TextSecondary
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
            .padding(horizontal = MediaSpacing.ScreenHorizontal),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
    ) {
        // Play/Read button
        Button(
            onClick = onPlayClick,
            modifier = Modifier.weight(1f),
            colors = ButtonDefaults.buttonColors(
                containerColor = MediaColors.AccentPrimary
            ),
            shape = RoundedCornerShape(MediaCorners.Button)
        ) {
            Icon(
                imageVector = if (item.progress > 0) Icons.Default.PlayArrow else Icons.Default.PlayArrow,
                contentDescription = if (item.progress > 0) "Continue ${item.title}" else "Play ${item.title}",
                modifier = Modifier.size(20.dp)
            )
            Spacer(modifier = Modifier.width(MediaSpacing.SM))
            Text(
                text = when {
                    item.progress > 0 -> "Continue"
                    item.mediaType in listOf(MediaType.BOOK, MediaType.COMIC, MediaType.FANFICTION) -> "Read"
                    item.mediaType in listOf(MediaType.MUSIC, MediaType.PODCAST, MediaType.RADIO) -> "Play"
                    else -> "Play"
                },
                style = MediaTypography.LabelLarge
            )
        }
        
        // Download button
        FilledTonalIconButton(
            onClick = onDownloadClick,
            colors = IconButtonDefaults.filledTonalIconButtonColors(
                containerColor = MediaColors.BackgroundElevated
            )
        ) {
            Icon(
                imageVector = Icons.Outlined.Download,
                contentDescription = "Download",
                tint = MediaColors.TextPrimary
            )
        }
        
        // Add to collection
        FilledTonalIconButton(
            onClick = onAddToCollectionClick,
            colors = IconButtonDefaults.filledTonalIconButtonColors(
                containerColor = MediaColors.BackgroundElevated
            )
        ) {
            Icon(
                imageVector = Icons.Outlined.BookmarkAdd,
                contentDescription = "Add to collection",
                tint = MediaColors.TextPrimary
            )
        }
        
        // Share
        FilledTonalIconButton(
            onClick = onShareClick,
            colors = IconButtonDefaults.filledTonalIconButtonColors(
                containerColor = MediaColors.BackgroundElevated
            )
        ) {
            Icon(
                imageVector = Icons.Outlined.Share,
                contentDescription = "Share",
                tint = MediaColors.TextPrimary
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
            .padding(horizontal = MediaSpacing.ScreenHorizontal)
            .padding(top = MediaSpacing.LG)
    ) {
        // Genre tags
        if (item.genres.isNotEmpty()) {
            LazyRow(
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
            ) {
                items(item.genres) { genre ->
                    Surface(
                        shape = RoundedCornerShape(MediaCorners.Full),
                        color = MediaColors.BackgroundElevated
                    ) {
                        Text(
                            text = genre,
                            style = MediaTypography.LabelMedium,
                            color = MediaColors.TextSecondary,
                            modifier = Modifier.padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM)
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.MD))
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
                shape = RoundedCornerShape(MediaCorners.Card),
                color = MediaColors.BackgroundElevated
            ) {
                Column(modifier = Modifier.padding(MediaSpacing.MD)) {
                    metadataItems.forEachIndexed { index, (label, value) ->
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text(
                                text = label,
                                style = MediaTypography.BodyMedium,
                                color = MediaColors.TextSecondary
                            )
                            Text(
                                text = value,
                                style = MediaTypography.BodyMedium,
                                color = MediaColors.TextPrimary
                            )
                        }
                        
                        if (index < metadataItems.size - 1) {
                            HorizontalDivider(
                                color = MediaColors.Divider,
                                modifier = Modifier.padding(vertical = MediaSpacing.SM)
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
            .padding(horizontal = MediaSpacing.ScreenHorizontal)
            .padding(top = MediaSpacing.LG)
    ) {
        Text(
            text = description,
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextSecondary,
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
                    color = MediaColors.AccentPrimary
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
        color = if (isScrolled) MediaColors.Background.copy(alpha = 0.95f) else Color.Transparent
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .statusBarsPadding()
                .padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.SM),
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(onClick = onBackClick) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = MediaColors.TextPrimary
                )
            }
            
            AnimatedVisibility(
                visible = isScrolled,
                enter = fadeIn() + slideInHorizontally(),
                exit = fadeOut() + slideOutHorizontally()
            ) {
                Text(
                    text = title,
                    style = MediaTypography.TitleMedium,
                    color = MediaColors.TextPrimary,
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
            .padding(horizontal = MediaSpacing.ScreenHorizontal),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(
            text = title,
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary
        )
        
        count?.let {
            Text(
                text = "$it items",
                style = MediaTypography.LabelMedium,
                color = MediaColors.TextTertiary
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
            .padding(horizontal = MediaSpacing.ScreenHorizontal, vertical = MediaSpacing.MD),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Chapter number or thumbnail
        Surface(
            modifier = Modifier.size(48.dp),
            shape = RoundedCornerShape(MediaCorners.SM),
            color = MediaColors.BackgroundElevated
        ) {
            Box(contentAlignment = Alignment.Center) {
                Text(
                    text = chapter.number.toString(),
                    style = MediaTypography.TitleSmall,
                    color = MediaColors.TextSecondary
                )
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = chapter.title,
                style = MediaTypography.BodyLarge,
                color = MediaColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
            ) {
                chapter.duration?.let {
                    Text(
                        text = it,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
                
                chapter.date?.let {
                    Text(
                        text = it,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
            }
        }
        
        // Progress or play indicator
        if (chapter.progress > 0 && chapter.progress < 1) {
            CircularProgressIndicator(
                progress = { chapter.progress },
                modifier = Modifier.size(32.dp),
                color = MediaColors.AccentPrimary,
                trackColor = MediaColors.ProgressBackground,
                strokeWidth = 3.dp
            )
        } else if (chapter.progress >= 1) {
            Icon(
                imageVector = Icons.Default.CheckCircle,
                contentDescription = "Completed",
                tint = MediaColors.Success,
                modifier = Modifier.size(32.dp)
            )
        } else {
            Icon(
                imageVector = Icons.Default.PlayCircleOutline,
                contentDescription = "Play",
                tint = MediaColors.TextTertiary,
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
            color = MediaColors.BackgroundSurface
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
                    contentDescription = "${person.name} profile",
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(MediaSpacing.MD),
                    tint = MediaColors.TextTertiary
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        Text(
            text = person.name,
            style = MediaTypography.LabelMedium,
            color = MediaColors.TextPrimary,
            maxLines = 2,
            overflow = TextOverflow.Ellipsis
        )
        
        person.role?.let {
            Text(
                text = it,
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextTertiary,
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
            .padding(horizontal = MediaSpacing.ScreenHorizontal, vertical = MediaSpacing.SM),
        shape = RoundedCornerShape(MediaCorners.Card),
        color = MediaColors.BackgroundElevated
    ) {
        Column(modifier = Modifier.padding(MediaSpacing.MD)) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Reviewer avatar
                Surface(
                    modifier = Modifier.size(40.dp),
                    shape = CircleShape,
                    color = MediaColors.BackgroundSurface
                ) {
                    Icon(
                        imageVector = Icons.Default.Person,
                        contentDescription = "${review.author} avatar",
                        modifier = Modifier.padding(MediaSpacing.SM),
                        tint = MediaColors.TextTertiary
                    )
                }
                
                Spacer(modifier = Modifier.width(MediaSpacing.SM))
                
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = review.author,
                        style = MediaTypography.LabelLarge,
                        color = MediaColors.TextPrimary
                    )
                    Text(
                        text = review.source,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
                
                // Rating
                review.rating?.let { rating ->
                    Surface(
                        shape = RoundedCornerShape(MediaCorners.XS),
                        color = MediaColors.Warning.copy(alpha = 0.15f)
                    ) {
                        Row(
                            modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.XS),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Default.Star,
                                contentDescription = "Review rating",
                                modifier = Modifier.size(14.dp),
                                tint = MediaColors.Warning
                            )
                            Spacer(modifier = Modifier.width(2.dp))
                            Text(
                                text = rating,
                                style = MediaTypography.LabelMedium,
                                color = MediaColors.Warning
                            )
                        }
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.MD))
            
            Text(
                text = review.content,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextSecondary,
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
    val relatedItems: List<MediaItem> = emptyList(),
    val seriesItems: List<MediaItem> = emptyList(),
    val isLoading: Boolean = false
)

data class MediaDetailItem(
    val id: String,
    val title: String,
    val description: String? = null,
    val imageUrl: String? = null,
    val backdropUrl: String? = null,
    val mediaType: MediaType,
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
