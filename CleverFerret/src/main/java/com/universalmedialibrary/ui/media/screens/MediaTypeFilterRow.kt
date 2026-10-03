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
internal fun MediaTypeFilterRow(
    selectedMediaType: MediaType?,
    onMediaTypeChange: (MediaType?) -> Unit
) {
    val availableTypes = remember {
        listOf(
            MediaType.BOOK,
            MediaType.AUDIOBOOK,
            MediaType.COMIC,
            MediaType.MUSIC,
            MediaType.PODCAST,
            MediaType.MOVIE,
            MediaType.TV_SHOW,
            MediaType.DOCUMENT,
            MediaType.FANFICTION
        )
    }
    val actionColor = MaterialTheme.colorScheme.primary
    val borderColor = MaterialTheme.colorScheme.outline

    LazyRow(
        contentPadding = PaddingValues(horizontal = MediaSpacing.MD, vertical = MediaSpacing.XS),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
    ) {
        item {
            FilterChip(
                selected = selectedMediaType == null,
                onClick = { onMediaTypeChange(null) },
                label = { Text("Any media type") },
                colors = FilterChipDefaults.filterChipColors(
                    selectedContainerColor = actionColor.copy(alpha = 0.16f),
                    selectedLabelColor = actionColor,
                    selectedLeadingIconColor = actionColor,
                    containerColor = MediaColors.BackgroundElevated
                ),
                border = FilterChipDefaults.filterChipBorder(
                    enabled = true,
                    selected = selectedMediaType == null,
                    borderColor = borderColor,
                    selectedBorderColor = actionColor
                )
            )
        }
        items(availableTypes) { mediaType ->
            FilterChip(
                selected = selectedMediaType == mediaType,
                onClick = { onMediaTypeChange(mediaType) },
                label = { Text(mediaType.name.replace('_', ' ')) },
                leadingIcon = {
                    Icon(
                        imageVector = mediaType.icon,
                        contentDescription = "Media image",
                        modifier = Modifier.size(18.dp)
                    )
                },
                colors = FilterChipDefaults.filterChipColors(
                    selectedContainerColor = actionColor.copy(alpha = 0.16f),
                    selectedLabelColor = actionColor,
                    selectedLeadingIconColor = actionColor,
                    containerColor = MediaColors.BackgroundElevated
                ),
                border = FilterChipDefaults.filterChipBorder(
                    enabled = true,
                    selected = selectedMediaType == mediaType,
                    borderColor = borderColor,
                    selectedBorderColor = actionColor
                )
            )
        }
    }
}
