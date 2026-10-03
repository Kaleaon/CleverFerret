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
internal fun LibraryEmptyState(
    mediaType: MediaType,
    hasFilter: Boolean
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Surface(
            shape = CircleShape,
            color = mediaType.color.copy(alpha = 0.1f),
            modifier = Modifier.size(96.dp)
        ) {
            Icon(
                imageVector = if (hasFilter) Icons.Outlined.FilterAlt else mediaType.icon,
                contentDescription = "Media image",
                modifier = Modifier
                    .padding(MediaSpacing.LG)
                    .fillMaxSize(),
                tint = mediaType.color.copy(alpha = 0.5f)
            )
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        Text(
            text = if (hasFilter) "No matching items" else "Your library is empty",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        Text(
            text = if (hasFilter) 
                "Try adjusting your filters" 
            else 
                "Add some ${mediaType.name.lowercase().replace("_", " ")}s to get started",
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextSecondary
        )
    }
}
