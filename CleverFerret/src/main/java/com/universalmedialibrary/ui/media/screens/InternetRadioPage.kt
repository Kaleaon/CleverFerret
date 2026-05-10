package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
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
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.launch

@Composable
internal fun InternetRadioPage(
    state: RadioScreenState,
    onStationClick: (RadioStation) -> Unit,
    onFavoriteToggle: (RadioStation) -> Unit,
    onCategoryClick: (RadioCategory) -> Unit
) {
    LazyColumn(
        contentPadding = PaddingValues(vertical = MediaSpacing.MD),
        modifier = Modifier.fillMaxSize()
    ) {
        // Favorites section
        if (state.favoriteStations.isNotEmpty()) {
            item {
                SectionHeader(title = "Favorites", icon = Icons.Default.Favorite)
            }
            item {
                LazyRow(
                    contentPadding = PaddingValues(horizontal = MediaSpacing.MD),
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
                ) {
                    items(state.favoriteStations) { station ->
                        RadioStationCard(
                            station = station,
                            onClick = { onStationClick(station) },
                            onFavorite = { onFavoriteToggle(station) }
                        )
                    }
                }
            }
            item { Spacer(modifier = Modifier.height(MediaSpacing.LG)) }
        }
        
        // Categories section
        item {
            SectionHeader(title = "Browse by Category", icon = Icons.Default.Category)
        }
        item {
            LazyRow(
                contentPadding = PaddingValues(horizontal = MediaSpacing.MD),
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
            ) {
                items(state.categories) { category ->
                    CategoryCard(
                        category = category,
                        onClick = { onCategoryClick(category) }
                    )
                }
            }
        }
        
        item { Spacer(modifier = Modifier.height(MediaSpacing.LG)) }
        
        // Popular stations section
        item {
            SectionHeader(title = "Popular Stations", icon = Icons.Default.TrendingUp)
        }
        items(state.popularStations) { station ->
            RadioStationListItem(
                station = station,
                isPlaying = state.nowPlaying?.id == station.id,
                onClick = { onStationClick(station) },
                onFavorite = { onFavoriteToggle(station) }
            )
        }
        
        item { Spacer(modifier = Modifier.height(MediaSpacing.LG)) }
        
        // Recently played section
        if (state.recentlyPlayed.isNotEmpty()) {
            item {
                SectionHeader(title = "Recently Played", icon = Icons.Default.History)
            }
            items(state.recentlyPlayed) { station ->
                RadioStationListItem(
                    station = station,
                    isPlaying = state.nowPlaying?.id == station.id,
                    onClick = { onStationClick(station) },
                    onFavorite = { onFavoriteToggle(station) }
                )
            }
        }
    }
}
