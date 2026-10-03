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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
internal fun FilterBottomSheet(
    currentFilter: LibraryFilter,
    availableFilters: List<LibraryFilterGroup>,
    onFilterChange: (LibraryFilter) -> Unit,
    onDismiss: () -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        containerColor = MediaColors.BackgroundElevated,
        contentColor = MediaColors.TextPrimary
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(MediaSpacing.MD)
        ) {
            Text(
                text = "Filter Library",
                style = MediaTypography.TitleMedium,
                color = MediaColors.TextPrimary,
                modifier = Modifier.padding(bottom = MediaSpacing.MD)
            )
            
            availableFilters.forEach { group ->
                Text(
                    text = group.title,
                    style = MediaTypography.LabelMedium,
                    color = MediaColors.TextSecondary,
                    modifier = Modifier.padding(vertical = MediaSpacing.SM)
                )
                
                FlowRowWrapper(
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM),
                    verticalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
                ) {
                    group.filters.forEach { filter ->
                        FilterChip(
                            selected = currentFilter == filter,
                            onClick = { onFilterChange(filter) },
                            label = { Text(filter.displayName) },
                            colors = FilterChipDefaults.filterChipColors(
                                selectedContainerColor = MediaColors.AccentPrimary.copy(alpha = 0.2f),
                                selectedLabelColor = MediaColors.AccentPrimary
                            )
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.LG))
        }
    }
}
