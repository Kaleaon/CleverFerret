package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.focus.FocusRequester
import androidx.compose.ui.focus.focusRequester
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.components.TagChip
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun CategoryFilterRow(
    selectedCategory: SearchCategory?,
    onCategoryChange: (SearchCategory?) -> Unit
) {
    LazyRow(
        contentPadding = PaddingValues(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
    ) {
        item {
            FilterChip(
                selected = selectedCategory == null,
                onClick = { onCategoryChange(null) },
                label = { Text("All") },
                leadingIcon = if (selectedCategory == null) {
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
                    containerColor = MediaColors.BackgroundElevated
                )
            )
        }
        
        items(SearchCategory.entries.toTypedArray()) { category ->
            FilterChip(
                selected = selectedCategory == category,
                onClick = { onCategoryChange(category) },
                label = { Text(category.displayName) },
                leadingIcon = {
                    Icon(
                        imageVector = category.icon,
                        contentDescription = "Media image",
                        modifier = Modifier.size(18.dp),
                        tint = if (selectedCategory == category)
                            category.color
                        else
                            MediaColors.TextSecondary
                    )
                },
                colors = FilterChipDefaults.filterChipColors(
                    selectedContainerColor = category.color.copy(alpha = 0.2f),
                    selectedLabelColor = category.color,
                    selectedLeadingIconColor = category.color,
                    containerColor = MediaColors.BackgroundElevated
                )
            )
        }
    }
}
