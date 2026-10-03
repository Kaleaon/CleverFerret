package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.gestures.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
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
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.launch

@Composable
internal fun ChapterItem(
    chapter: BookChapter,
    isCurrent: Boolean,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .background(if (isCurrent) MediaColors.AccentPrimary.copy(alpha = 0.1f) else Color.Transparent)
            .padding(
                start = (MediaSpacing.MD.value + chapter.level * 16).dp,
                end = MediaSpacing.MD,
                top = MediaSpacing.SM,
                bottom = MediaSpacing.SM
            ),
        verticalAlignment = Alignment.CenterVertically
    ) {
        if (isCurrent) {
            Icon(
                Icons.Default.PlayArrow,
                null,
                tint = MediaColors.AccentPrimary,
                modifier = Modifier.size(16.dp)
            )
            Spacer(Modifier.width(MediaSpacing.SM))
        }
        
        Text(
            chapter.title,
            style = MediaTypography.BodyMedium,
            color = if (isCurrent) MediaColors.AccentPrimary else MediaColors.TextPrimary,
            fontWeight = if (isCurrent) FontWeight.Medium else FontWeight.Normal
        )
    }
}
