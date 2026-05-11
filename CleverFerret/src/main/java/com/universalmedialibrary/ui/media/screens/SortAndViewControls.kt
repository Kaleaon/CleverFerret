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
internal fun SortAndViewControls(
    currentSort: LibrarySortOption,
    currentViewMode: LibraryViewMode,
    onSortClick: () -> Unit,
    onViewModeChange: (LibraryViewMode) -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.ScreenHorizontal, vertical = MediaSpacing.SM),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Sort button
        TextButton(
            onClick = onSortClick,
            colors = ButtonDefaults.textButtonColors(
                contentColor = MediaColors.TextSecondary
            )
        ) {
            Icon(
                imageVector = Icons.Default.Sort,
                contentDescription = "Media image",
                modifier = Modifier.size(18.dp)
            )
            Spacer(modifier = Modifier.width(MediaSpacing.XS))
            Text(
                text = currentSort.displayName,
                style = MediaTypography.LabelMedium
            )
            Icon(
                imageVector = Icons.Default.ArrowDropDown,
                contentDescription = "Media image",
                modifier = Modifier.size(18.dp)
            )
        }
        
        // View mode toggle
        Row(
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.XS)
        ) {
            LibraryViewMode.entries.forEach { mode ->
                IconButton(
                    onClick = { onViewModeChange(mode) },
                    modifier = Modifier.size(36.dp)
                ) {
                    Icon(
                        imageVector = mode.icon,
                        contentDescription = mode.name,
                        tint = if (currentViewMode == mode) 
                            MediaColors.AccentPrimary 
                        else 
                            MediaColors.TextTertiary,
                        modifier = Modifier.size(20.dp)
                    )
                }
            }
        }
    }
}
