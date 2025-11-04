package com.universalmedialibrary.ui.home

import androidx.annotation.DrawableRes
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Book
import androidx.compose.material.icons.filled.Collections
import androidx.compose.material.icons.filled.Movie
import androidx.compose.material.icons.filled.MusicNote
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import coil.compose.rememberAsyncImagePainter
import coil.request.ImageRequest
import com.universalmedialibrary.R

/**
 * Data class for media recommendations
 */
data class MediaRecommendation(
    val title: String,
    val subtitle: String,
    val type: String,
    val colors: List<Color>,
    val imageUrl: String? = null,
    @DrawableRes val imageRes: Int? = null
)

/**
 * Artistic media poster card showing book covers, movie posters, album art
 */
@Composable
fun MediaPosterCard(
    media: MediaRecommendation,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    appearanceIndex: Int = 0
) {
    var targetVisible by remember { mutableStateOf(false) }
    LaunchedEffect(Unit) { targetVisible = true }

    val alpha by animateFloatAsState(
        targetValue = if (targetVisible) 1f else 0f,
        animationSpec = tween(durationMillis = 360, delayMillis = appearanceIndex * 70),
        label = "posterAlpha"
    )
    val translationY by animateFloatAsState(
        targetValue = if (targetVisible) 0f else 24f,
        animationSpec = tween(durationMillis = 360, delayMillis = appearanceIndex * 70),
        label = "posterTranslation"
    )

    val context = LocalContext.current
    val fallbackPainter = painterResource(R.drawable.placeholder_book_cover)
    val coverPainter = when {
        media.imageRes != null -> painterResource(media.imageRes)
        media.imageUrl != null -> rememberAsyncImagePainter(
            model = ImageRequest.Builder(context)
                .data(media.imageUrl)
                .crossfade(true)
                .build(),
            placeholder = fallbackPainter,
            error = fallbackPainter
        )
        else -> null
    }

    Card(
        modifier = modifier
            .fillMaxWidth()
            .height(260.dp)
            .graphicsLayer {
                this.alpha = alpha
                this.translationY = translationY
            }
            .clickable(onClick = onClick),
        elevation = CardDefaults.cardElevation(defaultElevation = 6.dp),
        shape = RoundedCornerShape(16.dp)
    ) {
        Box(modifier = Modifier.fillMaxSize()) {
            if (coverPainter != null) {
                Image(
                    painter = coverPainter,
                    contentDescription = null,
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
                )
            } else {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(
                            brush = Brush.verticalGradient(colors = media.colors)
                        )
                )
            }

            // Decorative overlay
            Icon(
                imageVector = accentIconFor(media.type),
                contentDescription = null,
                modifier = Modifier
                    .align(Alignment.Center)
                    .size(132.dp)
                      .graphicsLayer {
                          this.alpha = 0.16f
                          rotationZ = -8f
                      },
                tint = Color.White
            )

            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .background(
                        brush = Brush.verticalGradient(
                            colors = listOf(Color.Transparent, Color.Black.copy(alpha = 0.75f)),
                            startY = 140f
                        )
                    )
                    .padding(16.dp),
                verticalArrangement = Arrangement.Bottom
            ) {
                Surface(
                    modifier = Modifier.padding(bottom = 8.dp),
                    color = Color.White.copy(alpha = 0.18f),
                    shape = RoundedCornerShape(6.dp)
                ) {
                    Text(
                        text = media.type,
                        modifier = Modifier.padding(horizontal = 10.dp, vertical = 4.dp),
                        style = MaterialTheme.typography.labelSmall,
                        color = Color.White,
                        fontSize = 11.sp
                    )
                }

                Text(
                    text = media.title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    color = Color.White,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )

                Spacer(modifier = Modifier.height(6.dp))

                Text(
                    text = media.subtitle,
                    style = MaterialTheme.typography.bodySmall,
                    color = Color.White.copy(alpha = 0.9f),
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
        }
    }
}

private fun accentIconFor(type: String): ImageVector = when (type.uppercase()) {
    "BOOK" -> Icons.Filled.Book
    "MOVIE" -> Icons.Filled.Movie
    "MUSIC" -> Icons.Filled.MusicNote
    else -> Icons.Filled.Collections
}

/**
 * Quick access card for features
 */
@Composable
fun QuickAccessCard(
    title: String,
    icon: ImageVector,
    colors: List<Color>,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .height(100.dp)
            .clickable(onClick = onClick),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp),
        shape = RoundedCornerShape(12.dp)
    ) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    brush = Brush.linearGradient(colors = colors)
                ),
            contentAlignment = Alignment.Center
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                modifier = Modifier.padding(16.dp)
            ) {
                Icon(
                    imageVector = icon,
                    contentDescription = title,
                    modifier = Modifier.size(32.dp),
                    tint = Color.White
                )
                Text(
                    text = title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold,
                    color = Color.White
                )
            }
        }
    }
}
