package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
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
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun QuickFiltersRow(
    currentFilter: LibraryFilter,
    onFilterChange: (LibraryFilter) -> Unit,
    mediaType: MediaType
) {
    val quickFilters = getQuickFiltersForMediaType(mediaType)
    
    LazyRow(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = MediaSpacing.SM),
        contentPadding = PaddingValues(horizontal = MediaSpacing.ScreenHorizontal),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
    ) {
        items(quickFilters) { filter ->
            FilterChip(
                selected = currentFilter == filter,
                onClick = { onFilterChange(filter) },
                label = {
                    Text(
                        text = filter.displayName,
                        style = MediaTypography.LabelMedium
                    )
                },
                leadingIcon = if (currentFilter == filter) {
                    {
                        Icon(
                            imageVector = Icons.Default.Check,
                            contentDescription = "Media image",
                            modifier = Modifier.size(18.dp)
                        )
                    }
                } else null,
                colors = FilterChipDefaults.filterChipColors(
                    selectedContainerColor = MediaColors.AccentPrimary.copy(alpha = 0.2f),
                    selectedLabelColor = MediaColors.AccentPrimary,
                    selectedLeadingIconColor = MediaColors.AccentPrimary,
                    containerColor = MediaColors.BackgroundElevated,
                    labelColor = MediaColors.TextSecondary
                ),
                border = FilterChipDefaults.filterChipBorder(
                    borderColor = Color.Transparent,
                    selectedBorderColor = MediaColors.AccentPrimary.copy(alpha = 0.5f),
                    enabled = true,
                    selected = currentFilter == filter
                )
            )
        }
    }
}
