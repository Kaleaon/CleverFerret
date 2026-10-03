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


// =============================================================================
// ACTION BUTTONS
// =============================================================================


// =============================================================================
// METADATA SECTION
// =============================================================================


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
